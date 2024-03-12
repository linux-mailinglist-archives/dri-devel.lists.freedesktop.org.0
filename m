Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA31A879BDF
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 19:49:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A4EA10F503;
	Tue, 12 Mar 2024 18:49:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="eMgPyscf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14E1E10EF72;
 Tue, 12 Mar 2024 18:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+ak9fyvLirgmWbxbnaU1AJVNVqPma8Bd2P+rltxY2ZU=; b=eMgPyscfMkw6APZuYy4oTzbUmN
 wTEGCNArG1diQDXm4AMxhciFQ7B844MK4rDlXSssvWwIPq2Q1ObKlODcPFSvBCaWPQ0s+IE+x+sL4
 zmq9X3k3eBPg0w9n5FjRDeubW3J/y20bXdpbNWypNpzJHs4auv/PdtgZolupN4qzafviCn32XzN4D
 BGE25bOg6DFdrBNwSerUsDmaHmbI7lq+Uf10AX5REiFUXYLIX7eHT8AfSi5dvyHDb0P1n9Y2ahfHh
 bMcb2WCsGmckcQkG4GdUbrptG4IzgJKZTRqLr84uDyxUR6o4MuOBWvGBu5FwsQBnAgPwiQNMLy66s
 7bH9G8xw==;
Received: from [189.6.17.125] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rk7Bf-009U55-Ff; Tue, 12 Mar 2024 19:49:20 +0100
Date: Tue, 12 Mar 2024 15:49:02 -0300
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 wayland-devel@lists.freedesktop.org, Simon Ser <contact@emersion.fr>
Subject: Re: [RFC PATCH v4 05/42] drm/vkms: Create separate Kconfig file for
 VKMS
Message-ID: <zxae4sovb5j5fzuw5elcuukuvgv5wryurfvz4d2dr4jvwvunol@cx67egiyvw7f>
References: <20240226211100.100108-1-harry.wentland@amd.com>
 <20240226211100.100108-6-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226211100.100108-6-harry.wentland@amd.com>
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

On 02/26, Harry Wentland wrote:
> This aligns with most other DRM drivers and will allow
> us to add new VKMS config options without polluting
> the DRM Kconfig.
> 
> v3:
>  - Change SPDX to GPL-2.0-only to match DRM KConfig
>    SPDX (Simon)
> 
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Reviewed-by: Simon Ser <contact@emersion.fr>

Just to let you know this patch is already upstream. I cherry-picked it
from the last patchset version and applied to drm-misc-next:
https://cgit.freedesktop.org/drm/drm-misc/commit/drivers/gpu/drm?id=ffcc67cd79ff2e93fd0bdb837c99cbab6c59d38c

Thanks again,

Melissa

> ---
>  drivers/gpu/drm/Kconfig      | 14 +-------------
>  drivers/gpu/drm/vkms/Kconfig | 15 +++++++++++++++
>  2 files changed, 16 insertions(+), 13 deletions(-)
>  create mode 100644 drivers/gpu/drm/vkms/Kconfig
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 2520db0b776e..e3ea8793cb8a 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -289,19 +289,7 @@ config DRM_VGEM
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
> 2.44.0
> 
