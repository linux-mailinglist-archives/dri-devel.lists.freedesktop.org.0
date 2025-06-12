Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D2FAD6799
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 08:07:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2386410E71F;
	Thu, 12 Jun 2025 06:07:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B9B10E387;
 Thu, 12 Jun 2025 06:07:23 +0000 (UTC)
Message-ID: <f1621e53-f517-4fb0-94e7-8b3a1a693804@lankhorst.se>
Date: Thu, 12 Jun 2025 08:07:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix kconfig prompt
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
References: <20250611-xe-kconfig-help-v1-1-8bcc6b47d11a@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <20250611-xe-kconfig-help-v1-1-8bcc6b47d11a@intel.com>
Content-Type: text/plain; charset=UTF-8
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

\o/

Reviewed-by: Maarten Lankhorst <dev@lankhorst.se>

On 2025-06-11 21:38, Lucas De Marchi wrote:
> The xe driver is the official driver for Intel Xe2 and later, while
> maintaining experimental support for earlier GPUs. Reword the help
> message accordingly.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig  | 5 +++--
>  drivers/gpu/drm/xe/xe_drv.h | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index c57f1da0791d9..30ed74ad29ab5 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config DRM_XE
> -	tristate "Intel Xe Graphics"
> +	tristate "Intel Xe2 Graphics"
>  	depends on DRM && PCI && (m || (y && KUNIT=y))
>  	depends on INTEL_VSEC || !INTEL_VSEC
>  	depends on X86_PLATFORM_DEVICES || !(X86 && ACPI)
> @@ -45,7 +45,8 @@ config DRM_XE
>  	select AUXILIARY_BUS
>  	select HMM_MIRROR
>  	help
> -	  Experimental driver for Intel Xe series GPUs
> +	  Driver for Intel Xe2 series GPUs and later. Experimental support
> +	  for Xe series is also available.
>  
>  	  If "M" is selected, the module will be called xe.
>  
> diff --git a/drivers/gpu/drm/xe/xe_drv.h b/drivers/gpu/drm/xe/xe_drv.h
> index d61650d4aa0be..95242a375e541 100644
> --- a/drivers/gpu/drm/xe/xe_drv.h
> +++ b/drivers/gpu/drm/xe/xe_drv.h
> @@ -9,7 +9,7 @@
>  #include <drm/drm_drv.h>
>  
>  #define DRIVER_NAME		"xe"
> -#define DRIVER_DESC		"Intel Xe Graphics"
> +#define DRIVER_DESC		"Intel Xe2 Graphics"
>  
>  /* Interface history:
>   *
> 
> 
> 

