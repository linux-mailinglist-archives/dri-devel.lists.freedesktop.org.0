Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C6449EE20
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 23:33:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB03410E339;
	Thu, 27 Jan 2022 22:33:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0424210E339;
 Thu, 27 Jan 2022 22:33:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B34F961B04;
 Thu, 27 Jan 2022 22:33:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F867C340E4;
 Thu, 27 Jan 2022 22:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1643322780;
 bh=KyW09W85IPjR9zNAkKrCh5PNjr0Umrx44954UKFP4jQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fP5wmZtdgiZu/FrP7PhOokkdSv2iz/JRlELCy8KE3PxjZuPikwpGG5u5M86BQ8QMB
 YREDewXYuQr0LO2GLNCUrm5xL3I2VEh6uMOCa4PMzmbgQscCQY6FGwQC1Pb/zu6qoU
 n+kfJ6iphf95sdN39zm7Uy1KfETp70xNuWJ1zn54=
Date: Thu, 27 Jan 2022 14:32:58 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Alex Sierra <alex.sierra@amd.com>
Subject: Re: [PATCH v4 00/10] Add MEMORY_DEVICE_COHERENT for coherent device
 memory mapping
Message-Id: <20220127143258.8da663659948ad1e6f0c0ea8@linux-foundation.org>
In-Reply-To: <20220127030949.19396-1-alex.sierra@amd.com>
References: <20220127030949.19396-1-alex.sierra@amd.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
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
Cc: rcampbell@nvidia.com, willy@infradead.org, Felix.Kuehling@amd.com,
 apopple@nvidia.com, amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, dri-devel@lists.freedesktop.org,
 jgg@nvidia.com, linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 26 Jan 2022 21:09:39 -0600 Alex Sierra <alex.sierra@amd.com> wrote:

> This patch series introduces MEMORY_DEVICE_COHERENT, a type of memory
> owned by a device that can be mapped into CPU page tables like
> MEMORY_DEVICE_GENERIC and can also be migrated like
> MEMORY_DEVICE_PRIVATE.

Some more reviewer input appears to be desirable here.

I was going to tentatively add it to -mm and -next, but problems. 
5.17-rc1's mm/migrate.c:migrate_vma_check_page() is rather different
from the tree you patched.  Please redo, refresh and resend?

