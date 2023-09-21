Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB447A992B
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 20:12:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F7D610E151;
	Thu, 21 Sep 2023 18:12:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE7810E151
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 18:12:25 +0000 (UTC)
Received: from [192.168.68.123] (unknown [177.98.21.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 551CC6607298;
 Thu, 21 Sep 2023 19:12:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695319944;
 bh=Arxq/8zDG5vOhfInkJgyvwTd7gpQIFGGKGPeSoejTFU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DFqOLOfn6kg5XbVlFztq4WGB6HXwcEXXeweIx8mtNaPbJWXvWbZlyufioVHfBMHxy
 9DvpNzP6oP32b29KQ6Ebmz0cvT51mf3rpWBFd6+yNojhr02DRbddKm+Ps5wiDdi8PR
 DS9nr115o/YwN9d/8jKQyTPGZL4Y3icioG/muK5SLTF0+oqL6MiDvnMfda+fW85G7W
 1u7ez1nkyLxk8XTUmiJmE0XgtKIgMfYrQXjdU3HHpfo50IQCE36KDM8vyzszMVRE+y
 Us9sOolL6NDNaD7erSMDOkPNUckCNI13PXGaxB+BM3qQOiw6kTZk2MWCJBMeKZfcrJ
 1suFkGnfmcJ7g==
Message-ID: <602439e0-ef90-3820-047f-6bc4e70c57b3@collabora.com>
Date: Thu, 21 Sep 2023 15:12:16 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] MAINTAINERS: Update drm-misc entry to match all drivers
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20230919131235.759959-1-mripard@kernel.org>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20230919131235.759959-1-mripard@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Daniel Stone <daniels@collabora.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 19/09/2023 10:12, Maxime Ripard wrote:
> We've had a number of times when a patch slipped through and we couldn't
> pick them up either because our MAINTAINERS entry only covers the
> framework and thus we weren't Cc'd.
> 
> Let's take another approach where we match everything, and remove all
> the drivers that are not maintained through drm-misc.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>   MAINTAINERS | 23 ++++++++++++++++++++---
>   1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 90f13281d297..757d4f33e158 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6860,12 +6860,29 @@ M:	Thomas Zimmermann <tzimmermann@suse.de>
>   S:	Maintained
>   W:	https://01.org/linuxgraphics/gfx-docs/maintainer-tools/drm-misc.html
>   T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	Documentation/devicetree/bindings/display/
> +F:	Documentation/devicetree/bindings/gpu/
>   F:	Documentation/gpu/
> -F:	drivers/gpu/drm/*
> +F:	drivers/gpu/drm/
>   F:	drivers/gpu/vga/
> -F:	include/drm/drm*
> +F:	include/drm/drm
>   F:	include/linux/vga*
> -F:	include/uapi/drm/drm*
> +F:	include/uapi/drm/
> +X:	drivers/gpu/drm/amd/
> +X:	drivers/gpu/drm/armada/
> +X:	drivers/gpu/drm/etnaviv/
> +X:	drivers/gpu/drm/exynos/
> +X:	drivers/gpu/drm/gma500/
> +X:	drivers/gpu/drm/i915/
> +X:	drivers/gpu/drm/imx/
> +X:	drivers/gpu/drm/ingenic/
> +X:	drivers/gpu/drm/kmb/
> +X:	drivers/gpu/drm/mediatek/
> +X:	drivers/gpu/drm/msm/
> +X:	drivers/gpu/drm/nouveau/
> +X:	drivers/gpu/drm/radeon/
> +X:	drivers/gpu/drm/renesas/
> +X:	drivers/gpu/drm/tegra/

Should drivers/gpu/drm/ci/ be in the list too?

Thanks,
Helen

>   
>   DRM DRIVERS FOR ALLWINNER A10
>   M:	Maxime Ripard <mripard@kernel.org>
