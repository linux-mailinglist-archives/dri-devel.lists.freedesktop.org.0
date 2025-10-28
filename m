Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDA6C173BA
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 23:53:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B43210E695;
	Tue, 28 Oct 2025 22:53:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Y70QZHG8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A19B10E695
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 22:53:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3918C601EE;
 Tue, 28 Oct 2025 22:53:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4935C4CEE7;
 Tue, 28 Oct 2025 22:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1761692003;
 bh=E4SFGU0lgJj/10+0QYHjZwLGjT5sBHYhEzNGPcYiYTY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Y70QZHG8LT9n4mmrxudVJN2xlcIb7ty3zXNrXYaF/C5I2/VWyDIoGpMh4YZ/iSLnu
 FuQQTlzhSw0CvAOVj0syku80FEVFazIAtXF9r5PGaMqJQ78mlt1y0UEW9yu3G7UiYZ
 X0+j0cGGGcCKDj0+ZEMITrxP/v7bGrvOEiuXkBYo=
Date: Tue, 28 Oct 2025 15:53:22 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: balbirs@nvidia.com, borntraeger@de.ibm.com, david@redhat.com,
 Liam.Howlett@oracle.com, airlied@gmail.com, apopple@nvidia.com,
 baohua@kernel.org, baolin.wang@linux.alibaba.com, byungchul@sk.com,
 dakr@kernel.org, dev.jain@arm.com, dri-devel@lists.freedesktop.org,
 francois.dugast@intel.com, gourry@gourry.net, joshua.hahnjy@gmail.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, matthew.brost@intel.com,
 mpenttil@redhat.com, npache@redhat.com, osalvador@suse.de,
 rakie.kim@sk.com, rcampbell@nvidia.com, ryan.roberts@arm.com,
 simona@ffwll.ch, ying.huang@linux.alibaba.com, ziy@nvidia.com,
 kvm@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-next@vger.kernel.org, hca@linux.ibm.com, gor@linux.ibm.com,
 agordeev@linux.ibm.com
Subject: Re: [PATCH v1 0/1] KVM: s390: Fix missing present bit for gmap puds
Message-Id: <20251028155322.392c2fe0ce1952a61af39a89@linux-foundation.org>
In-Reply-To: <20251028130150.57379-1-imbrenda@linux.ibm.com>
References: <d4a09cc8-84b2-42a8-bd03-7fa3adee4a99@linux.ibm.com>
 <20251028130150.57379-1-imbrenda@linux.ibm.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 28 Oct 2025 14:01:49 +0100 Claudio Imbrenda <imbrenda@linux.ibm.com> wrote:

> @Andrew: do you think it's possible to squeeze this patch in -next
> _before_ the patches that introduce the issue? This will guarantee that
> the patch is merged first, and will not break bisections once merged.

no problem, thanks.
