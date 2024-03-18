Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4EB87EB72
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 15:54:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD5610F81D;
	Mon, 18 Mar 2024 14:54:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kilj8Lpi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E683E10F81D
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 14:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710773691; x=1742309691;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=H0x4rZpZdEgTOzMqO16a9P1LKpGfuBCG6aau50yGdNE=;
 b=Kilj8Lpi2Zj1++s6VB4PGwscAjHUTlxeHemXUXYVWL6bDsxh2M1Q5sHJ
 yKN4nTB2gsIvT+j4h26M9f/tFi07oAcFh6e6QY0DSFPahJe90PZctteQN
 iH7IDlGrq8SuFIjG9zxwKIJxZJtp/q9WxjbETyXWaRdrGlUYpr31vnOyN
 vybPRdRXUJW1CY5SUowpEuB35WsslMjtyAm+QtHRNE2SuRLtNmBeCZpqq
 4u0+fQLFSzoCr4PKmJ/SxNCGEgppWJbP5/dWahjoEBJ9rELdzBjFhq4yU
 92FKQ7rliZFjbUA9QWZ+A0tN2lxcHzXH0Ww74cCnG9otinM5SSZITtSmr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5721796"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5721796"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 07:54:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="13443005"
Received: from ahmedess-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.53.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 07:54:45 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Luca Weiss
 <luca.weiss@fairphone.com>
Cc: Imre Deak <imre.deak@intel.com>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] Revert "drm/bridge: Select DRM_KMS_HELPER for
 DRM_PANEL_BRIDGE"
In-Reply-To: <20240318-revert-select-drm_kms_helper-for-drm_panel_bridge-v1-1-52a42a116286@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240318-revert-select-drm_kms_helper-for-drm_panel_bridge-v1-1-52a42a116286@linaro.org>
Date: Mon, 18 Mar 2024 16:54:42 +0200
Message-ID: <875xxjpp3h.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

On Mon, 18 Mar 2024, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> This reverts commit e3f18b0dd1db242791afbc3bd173026163ce0ccc.
>
> Selecting DRM_KMS_HELPER for DRM_PANEL_BRIDGE leads to:
> WARNING: unmet direct dependencies detected for DRM_KMS_HELPER
>   Depends on [m]: HAS_IOMEM [=3Dy] && DRM [=3Dm]
>   ...
>
> and builds with CONFIG_DRM=3Dm will fail with the above kconfig
> warns and then multiple linker error.
>
> Reported-by: Imre Deak <imre.deak@intel.com>
> Reported-by: Jani Nikula <jani.nikula@linux.intel.com>
> Reported-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Fixes: e3f18b0dd1db ("drm/bridge: Select DRM_KMS_HELPER for DRM_PANEL_BRI=
DGE")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Acked-by: Jani Nikula <jani.nikula@intel.com>
Tested-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  drivers/gpu/drm/bridge/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kcon=
fig
> index 1d4f010af97b..efd996f6c138 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -8,7 +8,6 @@ config DRM_BRIDGE
>  config DRM_PANEL_BRIDGE
>  	def_bool y
>  	depends on DRM_BRIDGE
> -	select DRM_KMS_HELPER
>  	select DRM_PANEL
>  	help
>  	  DRM bridge wrapper of DRM panels
>
> ---
> base-commit: e3f18b0dd1db242791afbc3bd173026163ce0ccc
> change-id: 20240318-revert-select-drm_kms_helper-for-drm_panel_bridge-0e4=
ad7c73496
>
> Best regards,

--=20
Jani Nikula, Intel
