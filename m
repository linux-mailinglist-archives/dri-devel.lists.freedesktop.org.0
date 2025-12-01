Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A51DC9635A
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 09:39:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F10DF10E356;
	Mon,  1 Dec 2025 08:39:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="aa32VnMR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6DA810E34D;
 Mon,  1 Dec 2025 08:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764578366;
 bh=/yEJjkl7mI536u4P1ZljdIoiBzn8hkUDB1We2y+0lF4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aa32VnMRDGNZstcTn0Yk21gz6Bp3VD/2Qpcw8VGcVMwsqhZW+9ROIvypak8/Cgf4A
 DZaP3ErEeb3EX7nGUwnjFlL/9Ey9o2SewxmdQefgUnajm2HN51Pj2tch2WlWLjfJvX
 qTZ25Fxoxo5VsZHGk8ob2ADJylVc+clQoGA7A5LbGJIgcy/QZjyWqAyfG9VIrSsHIX
 YQwt2GVHQRvWFZ1lT3/n0N7UxTrlMc8B2jLv7BU1QE7kn8mSzpwRG3M88ajMbVhp8R
 OlYZJxcGlftU8cibXYfrHo5G/V/n/5RiOrGELOyT1jOAYnGsmkURlRxSufF4zQrGHp
 ELUWueVvAn8RQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3676D17E013C;
 Mon,  1 Dec 2025 09:39:25 +0100 (CET)
Date: Mon, 1 Dec 2025 09:39:18 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?TG/Dr2M=?= Molinari <loic.molinari@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Melissa Wen <mwen@igalia.com>, =?UTF-8?B?TWHDrXJh?= Canal
 <mcanal@igalia.com>, Hugh Dickins <hughd@google.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>,
 Al Viro <viro@zeniv.linux.org.uk>, =?UTF-8?B?TWlrb8WCYWo=?= Wasiak
 <mikolaj.wasiak@intel.com>, Christian Brauner <brauner@kernel.org>, Nitin
 Gote <nitin.r.gote@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Christopher Healy <healych@amazon.com>,
 Matthew Wilcox <willy@infradead.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v10 10/10] Documentation/gpu/drm-mm: Add THP paragraph
 to GEM mapping section
Message-ID: <20251201093918.4051d21d@fedora>
In-Reply-To: <20251128185252.3092-11-loic.molinari@collabora.com>
References: <20251128185252.3092-1-loic.molinari@collabora.com>
 <20251128185252.3092-11-loic.molinari@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Fri, 28 Nov 2025 19:52:52 +0100
Lo=C3=AFc Molinari <loic.molinari@collabora.com> wrote:

> Add a paragraph to the GEM objects mapping section explaining how
> transparent huge pages are handled by GEM.
>=20
> v4:
> - fix wording after huge_pages handler removal
>=20
> v6:
> - fix wording after map_pages handler removal
>=20
> Signed-off-by: Lo=C3=AFc Molinari <loic.molinari@collabora.com>
> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  Documentation/gpu/drm-mm.rst | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index d55751cad67c..d69eab0b4093 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -290,15 +290,27 @@ The open and close operations must update the GEM o=
bject reference
>  count. Drivers can use the drm_gem_vm_open() and drm_gem_vm_close() help=
er
>  functions directly as open and close handlers.
> =20
> -The fault operation handler is responsible for mapping individual pages
> -to userspace when a page fault occurs. Depending on the memory
> -allocation scheme, drivers can allocate pages at fault time, or can
> -decide to allocate memory for the GEM object at the time the object is
> -created.
> +The fault operation handler is responsible for mapping pages to
> +userspace when a page fault occurs. Depending on the memory allocation
> +scheme, drivers can allocate pages at fault time, or can decide to
> +allocate memory for the GEM object at the time the object is created.
> =20
>  Drivers that want to map the GEM object upfront instead of handling page
>  faults can implement their own mmap file operation handler.
> =20
> +In order to reduce page table overhead, if the internal shmem mountpoint
> +"shm_mnt" is configured to use transparent huge pages (for builds with
> +CONFIG_TRANSPARENT_HUGEPAGE enabled) and if the shmem backing store
> +managed to allocate a huge page for a faulty address, the fault handler
> +will first attempt to insert that huge page into the VMA before falling
> +back to individual page insertion. mmap() user address alignment for GEM
> +objects is handled by providing a custom get_unmapped_area file
> +operation which forwards to the shmem backing store. For most drivers,
> +which don't create a huge mountpoint by default or through a module
> +parameter, transparent huge pages can be enabled by either setting the
> +"transparent_hugepage_shmem" kernel parameter or the
> +"/sys/kernel/mm/transparent_hugepage/shmem_enabled" sysfs knob.
> +
>  For platforms without MMU the GEM core provides a helper method
>  drm_gem_dma_get_unmapped_area(). The mmap() routines will call this to g=
et a
>  proposed address for the mapping.

