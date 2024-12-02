Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A8F9DFEC1
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 11:23:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A01D10E6B0;
	Mon,  2 Dec 2024 10:23:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iTK/DpFz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F8A010E215;
 Mon,  2 Dec 2024 10:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733135035; x=1764671035;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=LoFYJIJMK9Q6i+Gw0XK8Wb/1ESu9maODEfjoY8fwwDs=;
 b=iTK/DpFzfn5abOUAh9iw/IW5OYc9PadyBwWm5Dp591RSMdMhF3PuCqau
 LdIH6EYj7DjvzpNg+VDhrtDZMT60OhTRN7udpeqtPFVrcTbC2HcMWsgTr
 X4ag54pqD0ivLZetVdpYLGaanVsyhcbAfg1GhajVEziv3hE+jUW+8gzLg
 U8w0PvwgY/4V9qMcW2JdOT2rxQFxHk17bVR+Zm1QPgL9RL+olLUSyH7av
 jVe+Noi/3VcsHQ9h0EEzVx80oWh/tbtotRR0VK44Opx6wkEDXT7tsJea5
 F3Cv6V6yDn+TwIW/h4GtE/WWZy6d5bEtQ75wAAapxdOugqQvnYnOCJEGN g==;
X-CSE-ConnectionGUID: onrA8vTMSLqFJFAZlnDsCg==
X-CSE-MsgGUID: 9bcR0yIjT3S38iFeOx+Ngg==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="58686713"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="58686713"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 02:23:54 -0800
X-CSE-ConnectionGUID: UHu/FGD7RLStnnYdm2d4Lg==
X-CSE-MsgGUID: M4511x8/R/qE4ZFNnmbAHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="97836221"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.77])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 02:23:41 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Phong LE <ple@baylibre.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, =?utf-8?Q?Ma=C3=ADra?= Canal
 <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH 01/10] drm/connector: add mutex to protect ELD from
 concurrent access
In-Reply-To: <20241201-drm-connector-eld-mutex-v1-1-ba56a6545c03@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org>
 <20241201-drm-connector-eld-mutex-v1-1-ba56a6545c03@linaro.org>
Date: Mon, 02 Dec 2024 12:23:29 +0200
Message-ID: <87r06q5qou.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Sun, 01 Dec 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> The connector->eld is accessed by the .get_eld() callback. This access
> can collide with the drm_edid_to_eld() updating the data at the same
> time. Add drm_connector.eld_mutex to protect the data from concurrenct
> access. Individual drivers are not updated (to reduce possible issues
> while applying the patch), maintainers are to find a best suitable way
> to lock that mutex while accessing the ELD data.

Missed clear_eld().

BR,
Jani.

>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/drm_connector.c | 1 +
>  drivers/gpu/drm/drm_edid.c      | 4 ++++
>  include/drm/drm_connector.h     | 5 ++++-
>  3 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index fc35f47e2849ed6786d6223ac9c69e1c359fc648..bbdaaf7022b62d84594a29f1b60144920903a99a 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -277,6 +277,7 @@ static int __drm_connector_init(struct drm_device *dev,
>  	INIT_LIST_HEAD(&connector->probed_modes);
>  	INIT_LIST_HEAD(&connector->modes);
>  	mutex_init(&connector->mutex);
> +	mutex_init(&connector->eld_mutex);
>  	mutex_init(&connector->edid_override_mutex);
>  	mutex_init(&connector->hdmi.infoframes.lock);
>  	connector->edid_blob_ptr = NULL;
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 855beafb76ffbecf5c08d58e2f54bfb76f30b930..f0ca77bd42fd518d505d0db78557e0c8d83efb29 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -5657,6 +5657,8 @@ static void drm_edid_to_eld(struct drm_connector *connector,
>  	if (!drm_edid)
>  		return;
>  
> +	mutex_lock(&connector->eld_mutex);
> +
>  	mnl = get_monitor_name(drm_edid, &eld[DRM_ELD_MONITOR_NAME_STRING]);
>  	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] ELD monitor %s\n",
>  		    connector->base.id, connector->name,
> @@ -5717,6 +5719,8 @@ static void drm_edid_to_eld(struct drm_connector *connector,
>  	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] ELD size %d, SAD count %d\n",
>  		    connector->base.id, connector->name,
>  		    drm_eld_size(eld), total_sad_count);
> +
> +	mutex_unlock(&connector->eld_mutex);
>  }
>  
>  static int _drm_edid_to_sad(const struct drm_edid *drm_edid,
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index e3fa43291f449d70f3b92a00985336c4f2237bc6..1e2b25e204cb523d61d30f5409faa059bf2b86eb 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -2001,8 +2001,11 @@ struct drm_connector {
>  	struct drm_encoder *encoder;
>  
>  #define MAX_ELD_BYTES	128
> -	/** @eld: EDID-like data, if present */
> +	/** @eld: EDID-like data, if present, protected by @eld_mutex */
>  	uint8_t eld[MAX_ELD_BYTES];
> +	/** @eld_mutex: protection for concurrenct access to @eld */
> +	struct mutex eld_mutex;
> +
>  	/** @latency_present: AV delay info from ELD, if found */
>  	bool latency_present[2];
>  	/**

-- 
Jani Nikula, Intel
