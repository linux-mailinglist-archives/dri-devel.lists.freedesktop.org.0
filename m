Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDA3BC7481
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 05:17:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4FA610E900;
	Thu,  9 Oct 2025 03:17:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="AyPm4yay";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BBBB10E900
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 03:17:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D6F4041790;
 Thu,  9 Oct 2025 03:17:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2F6BC4CEF5;
 Thu,  9 Oct 2025 03:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1759979861;
 bh=wPJ3c+Eh/QNy+wErZtTJ6qcki/ipw0RIOm8hLXCgx9Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AyPm4yayNVHdTNj2bvS0OKDp+PvHhdOn440JVw+h+XkAavnCmVibloeRaBO8okAdC
 KEYcw2Nx0sDWNxQyvFV/DqDCm3xbgzlspwEDTi8aQngtRsH+1+5hHecjBtK+lcyphZ
 qRgwUAnTrM/DleGHi8A6MrCv0kwhLLhmt3CrLvok=
Date: Wed, 8 Oct 2025 20:17:40 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Balbir Singh <balbirs@nvidia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, David Hildenbrand <david@redhat.com>, Zi Yan
 <ziy@nvidia.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim
 <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price
 <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair
 Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>, Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>, Ryan Roberts
 <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song
 <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>, Danilo Krummrich
 <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>, Mika
 =?ISO-8859-1?Q?Penttil=E4?= <mpenttil@redhat.com>, Matthew Brost
 <matthew.brost@intel.com>, Francois Dugast <francois.dugast@intel.com>
Subject: Re: [v7 00/16] mm: support device-private THP
Message-Id: <20251008201740.d9507f4807a73058d4da23a8@linux-foundation.org>
In-Reply-To: <20251001065707.920170-1-balbirs@nvidia.com>
References: <20251001065707.920170-1-balbirs@nvidia.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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

On Wed,  1 Oct 2025 16:56:51 +1000 Balbir Singh <balbirs@nvidia.com> wrote:

> This patch series introduces support for Transparent Huge Page
> (THP) migration in zone device-private memory. The implementation enables
> efficient migration of large folios between system memory and
> device-private memory

Lots of chatter for the v6 series, but none for v7.  I hope that's a
good sign.

> 
> HMM support for large folios, patches are already posted and in
> mm-unstable.

Not any more.  Which series was this?
