Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 627B5806F82
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 13:14:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C0F10E6EB;
	Wed,  6 Dec 2023 12:14:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD9A10E6EB;
 Wed,  6 Dec 2023 12:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jvU7Dnbacs0iqoNNheFbkepo4TbFBDrvn88+vKoFW7I=; b=Ogrz5McZjga8a++XGnIIsuNJmb
 8pJkA9bpMhk89jffs4bjD+nCxsVpYkuLdioMcilVgzVSZji3KNtjJUCkNpZRnMGpLpLiXU9g6219e
 U7hm5eJC5JnuyVPXpqXUmL3wwF5tNMoYTtvqqouLKKgva0DFbtjzjWktMCpQhbLUC4FrMcmq5tkgi
 ZJ5K0T6q2G5GBK0P+XQmp02UVBWqd6/BVFwAtrPsov1fF1EHdER5CjFd4nJ1o8mzqHzWMMXE4pDCI
 HHxpT75PaFiy8ZEA+P9V2NJC+MaTfTBXdP+36QaO6lOjExj23BYxv47PZw0NVNpmkOoWyZuHjtRQh
 6pVTbbqA==;
Received: from [102.213.205.115] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rAqnR-00AwNF-L1; Wed, 06 Dec 2023 13:14:33 +0100
Date: Wed, 6 Dec 2023 11:14:22 -0100
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH v3 03/23] drm/vkms: Create separate Kconfig file for
 VKMS
Message-ID: <20231206121422.dc6c5hlcbji6moqr@mail.igalia.com>
References: <20231108163647.106853-1-harry.wentland@amd.com>
 <20231108163647.106853-4-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108163647.106853-4-harry.wentland@amd.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/08, Harry Wentland wrote:
> This aligns with most other DRM drivers and will allow
> us to add new VKMS config options without polluting
> the DRM Kconfig.
> 
> v3:
>  - Change SPDX to GPL-2.0-only to match DRM KConfig
>    SPDX (Simon)

LGTM. I plan to apply this one to drm-misc-next.

Cc'ing the other VKMS maintainers/reviewers too.

> 
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Reviewed-by: Simon Ser <contact@emersion.fr>
> ---
>  drivers/gpu/drm/Kconfig      | 14 +-------------
>  drivers/gpu/drm/vkms/Kconfig | 15 +++++++++++++++
>  2 files changed, 16 insertions(+), 13 deletions(-)
>  create mode 100644 drivers/gpu/drm/vkms/Kconfig
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 48ca28a2e4ff..61ebd682c9b0 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -286,19 +286,7 @@ config DRM_VGEM
>  	  as used by Mesa's software renderer for enhanced performance.
>  	  If M is selected the module will be called vgem.
>  
> -config DRM_VKMS
> -	tristate "Virtual KMS (EXPERIMENTAL)"
> -	depends on DRM && MMU
> -	select DRM_KMS_HELPER
> -	select DRM_GEM_SHMEM_HELPER
> -	select CRC32
> -	default n
> -	help
> -	  Virtual Kernel Mode-Setting (VKMS) is used for testing or for
> -	  running GPU in a headless machines. Choose this option to get
> -	  a VKMS.
> -
> -	  If M is selected the module will be called vkms.
> +source "drivers/gpu/drm/vkms/Kconfig"
>  
>  source "drivers/gpu/drm/exynos/Kconfig"
>  
> diff --git a/drivers/gpu/drm/vkms/Kconfig b/drivers/gpu/drm/vkms/Kconfig
> new file mode 100644
> index 000000000000..b9ecdebecb0b
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/Kconfig
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config DRM_VKMS
> +	tristate "Virtual KMS (EXPERIMENTAL)"
> +	depends on DRM && MMU
> +	select DRM_KMS_HELPER
> +	select DRM_GEM_SHMEM_HELPER
> +	select CRC32
> +	default n
> +	help
> +	  Virtual Kernel Mode-Setting (VKMS) is used for testing or for
> +	  running GPU in a headless machines. Choose this option to get
> +	  a VKMS.
> +
> +	  If M is selected the module will be called vkms.
> -- 
> 2.42.1
> 
