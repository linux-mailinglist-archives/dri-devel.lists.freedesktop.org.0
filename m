Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47988A9ED4C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 11:53:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D65910E0A3;
	Mon, 28 Apr 2025 09:52:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qrklxu4A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE1C10E0A3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 09:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745833975; x=1777369975;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Qra0jDZ082u3o61wFUg8DO/d33Nm/eecQ74+ZCXcKP0=;
 b=Qrklxu4A5jn1yJ8DQsl/SPQ+VnCFw5/v9weWREJVyC/zTy3fo1IXXwG2
 1DdKpMWT1I0Rt52KdSeMMgZfdU89fUGQB+WTdSKNILkRHGT6eNXUKkizI
 S71pYzGEr3rE/4BK8fvtaglVeNdK5/gxVBOhBpkAXHx6ffwUrcPJZEl2O
 SbbeJgee6QqPbisCnuB/baT9D3TIiWFA1D9XPGcuLVhY1ZorpPs0HMRpR
 ouciJKr7mCpxTBkfsVT0JXQavzMJaP4KoS7qfxoFqOu+KT6Z9nwQVpdLS
 99+qrTCjlJW5YyqEzSO9mvPgrwVhebav/7APX/VV4Z5MaHfpewCWjOVhh Q==;
X-CSE-ConnectionGUID: 7MNlkA0oRjyAZbPyeAI82g==
X-CSE-MsgGUID: p0EQBgUtTsOe+nOIUFHVCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="35029872"
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="35029872"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 02:52:55 -0700
X-CSE-ConnectionGUID: AlJxoydRT3yVcmDz1WNpAQ==
X-CSE-MsgGUID: xdpgg3BkR0qF/8jnBps79w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="164439560"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.174])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 02:52:51 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 08/23] drm/tests: hdmi: Add macro to simplify EDID setup
In-Reply-To: <20250425-hdmi-conn-yuv-v4-8-5e55e2aaa3fa@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
 <20250425-hdmi-conn-yuv-v4-8-5e55e2aaa3fa@collabora.com>
Date: Mon, 28 Apr 2025 12:52:47 +0300
Message-ID: <87cycwy5n4.fsf@intel.com>
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

On Fri, 25 Apr 2025, Cristian Ciocaltea <cristian.ciocaltea@collabora.com> wrote:
> Factor out the HDMI connector initialization from
> drm_kunit_helper_connector_hdmi_init_funcs() into a common
> __connector_hdmi_init() function, while extending its functionality to
> allow setting custom (i.e. non-default) EDID data.
>
> Introduce a macro as a wrapper over the new helper to allow dropping the
> open coded EDID setup from all test cases.
>
> The actual conversion will be handled separately; for now just apply it
> to drm_kunit_helper_connector_hdmi_init() helper.
>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 46 +++++++++++++---------
>  1 file changed, 28 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> index c8dc6fa0f925e35e9903a18bac7f78f9d8165960..36734639d19a3f279abc4631eb19d5c2b20ca315 100644
> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> @@ -140,10 +140,11 @@ static const struct drm_connector_funcs dummy_connector_funcs = {
>  
>  static
>  struct drm_atomic_helper_connector_hdmi_priv *
> -drm_kunit_helper_connector_hdmi_init_funcs(struct kunit *test,
> -					   unsigned int formats,
> -					   unsigned int max_bpc,
> -					   const struct drm_connector_hdmi_funcs *hdmi_funcs)
> +__connector_hdmi_init(struct kunit *test,
> +		      unsigned int formats,
> +		      unsigned int max_bpc,
> +		      const struct drm_connector_hdmi_funcs *hdmi_funcs,
> +		      const char *edid_data, size_t edid_len)

char* is weird for EDID data, but it's a pre-existing thing, and
actually making it unsigned char or u8 isn't much better.

A follow-up could switch edid_data to just const void *, and ditto for
set_connector_edid() and current_edid member in struct
drm_atomic_helper_connector_hdmi_priv.

BR,
Jani.

>  {
>  	struct drm_atomic_helper_connector_hdmi_priv *priv;
>  	struct drm_connector *conn;
> @@ -197,29 +198,38 @@ drm_kunit_helper_connector_hdmi_init_funcs(struct kunit *test,
>  
>  	drm_mode_config_reset(drm);
>  
> +	if (edid_data && edid_len) {
> +		ret = set_connector_edid(test, &priv->connector, edid_data, edid_len);
> +		KUNIT_ASSERT_GT(test, ret, 0);
> +	}
> +
>  	return priv;
>  }
>  
> +static
> +struct drm_atomic_helper_connector_hdmi_priv *
> +drm_kunit_helper_connector_hdmi_init_funcs(struct kunit *test,
> +					   unsigned int formats,
> +					   unsigned int max_bpc,
> +					   const struct drm_connector_hdmi_funcs *hdmi_funcs)
> +{
> +	return __connector_hdmi_init(test, formats, max_bpc, hdmi_funcs, NULL, 0);
> +}
> +
> +#define drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test, formats, max_bpc, funcs, edid) \
> +	__connector_hdmi_init(test, formats, max_bpc, funcs, edid, ARRAY_SIZE(edid))
> +
>  static
>  struct drm_atomic_helper_connector_hdmi_priv *
>  drm_kunit_helper_connector_hdmi_init(struct kunit *test,
>  				     unsigned int formats,
>  				     unsigned int max_bpc)
>  {
> -	struct drm_atomic_helper_connector_hdmi_priv *priv;
> -	int ret;
> -
> -	priv = drm_kunit_helper_connector_hdmi_init_funcs(test,
> -							  formats, max_bpc,
> -							  &dummy_connector_hdmi_funcs);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
> -
> -	ret = set_connector_edid(test, &priv->connector,
> -				 test_edid_hdmi_1080p_rgb_max_200mhz,
> -				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
> -	KUNIT_ASSERT_GT(test, ret, 0);
> -
> -	return priv;
> +	return drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
> +				formats,
> +				max_bpc,
> +				&dummy_connector_hdmi_funcs,
> +				test_edid_hdmi_1080p_rgb_max_200mhz);
>  }
>  
>  /*

-- 
Jani Nikula, Intel
