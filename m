Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7067C39CD7
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 10:24:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B899C10E04C;
	Thu,  6 Nov 2025 09:24:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="b4SX1F7g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB8110E04C;
 Thu,  6 Nov 2025 09:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762421083;
 bh=tHeSThi+ZqD+VIgj88NaARY43hAMAI5iz7LNPfszGXM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=b4SX1F7gZLV5M0k7/B3SdIqeaO53FEaaZT9/lnF54NwIp0SqTs/tMACWue5dhN0oT
 +4Gwdv5KBtc2eKwX6lxqsjT7Yt24yhTblfB9g3XZtE4qGt0PQ2659c2ir0/jgIHR0F
 PlUL5CmkEXR8FbX3WtKdL+JqfiA3D5r9KiqMR11MCoxITZpC4dn+f2a3+2ujrbWj/P
 1Z5ZDIY52MxtSa5XgSg1EA7lZR1L/huBKoO2arIkyWyWuzWoxIKPoKV/eDCqQC8cNt
 Tig6ULFxIXKpshoaVr6bp3eqinMHHyjmh4QPVLgK3tH4pIhtp9q2yKhtzT49AaPLff
 CZrGCdxpRU0Xg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A716A17E12C4;
 Thu,  6 Nov 2025 10:24:42 +0100 (CET)
Date: Thu, 6 Nov 2025 10:24:38 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: adrinael@adrinael.net, arek@hiler.eu, kamil.konieczny@linux.intel.com,
 juhapekka.heikkila@gmail.com, bhanuprakash.modem@gmail.com,
 ashutosh.dixit@intel.com, karthik.b.s@intel.com, liviu.dudau@arm.com,
 steven.price@arm.com, aliceryhl@google.com, jeffv@google.com,
 intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v3 1/3] lib: add support for opening Panthor devices
Message-ID: <20251106102438.7c8fcb57@fedora>
In-Reply-To: <20251104202845.2879460-2-daniel.almeida@collabora.com>
References: <20251104202845.2879460-1-daniel.almeida@collabora.com>
 <20251104202845.2879460-2-daniel.almeida@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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

On Tue,  4 Nov 2025 17:28:41 -0300
Daniel Almeida <daniel.almeida@collabora.com> wrote:

> We will be adding tests for Panthor in a subsequent patch, so first add
> the ability to open the device.
> 
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  lib/drmtest.c | 1 +
>  lib/drmtest.h | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 590c4671a..3d8c8e79e 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -220,6 +220,7 @@ static const struct module {
>  	{ DRIVER_INTEL, "i915", modprobe_i915 },
>  	{ DRIVER_MSM, "msm" },
>  	{ DRIVER_PANFROST, "panfrost" },
> +	{ DRIVER_PANTHOR, "panthor" },
>  	{ DRIVER_V3D, "v3d" },
>  	{ DRIVER_VC4, "vc4" },
>  	{ DRIVER_VGEM, "vgem" },
> diff --git a/lib/drmtest.h b/lib/drmtest.h
> index 8416aa491..4b0a71102 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -57,6 +57,7 @@ int __get_drm_device_name(int fd, char *name, int name_size);
>  #define DRIVER_VMWGFX   (1 << 8)
>  #define DRIVER_VKMS	(1 << 9)
>  #define DRIVER_VIRTIO	(1 << 10)
> +#define DRIVER_PANTHOR	(1 << 11)
>  
>  /*
>   * Exclude DRIVER_VGEM and DRIVER_VIRTIO from DRIVER_ANY since if you run

