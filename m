Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E84302C5274
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 11:54:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA6096E896;
	Thu, 26 Nov 2020 10:54:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D0A6E891;
 Thu, 26 Nov 2020 10:54:17 +0000 (UTC)
IronPort-SDR: FpU4IkHElYnTO5wUwiwLqYXuPo0D7esLSXmOLuypOgWOELJweXuU6uwaM5Ef1Yclg6R0P0fDMo
 G0rAYH3VI+/Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9816"; a="151526603"
X-IronPort-AV: E=Sophos;i="5.78,371,1599548400"; d="scan'208";a="151526603"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2020 02:54:16 -0800
IronPort-SDR: 4AarGaMBF+7BwfCGphXiafVOFaYgPa9JhZDJwwpxqgxNm0IvfnKWcKPbyEF9pzadymUU7iMUBy
 3j2MWFG0wQzA==
X-IronPort-AV: E=Sophos;i="5.78,371,1599548400"; d="scan'208";a="547674503"
Received: from mpascu-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.249.41.186])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2020 02:54:11 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Lyude Paul <lyude@redhat.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [RFC v2 2/8] drm/i915: Rename pwm_* backlight callbacks to
 ext_pwm_*
In-Reply-To: <20200916171855.129511-3-lyude@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200916171855.129511-1-lyude@redhat.com>
 <20200916171855.129511-3-lyude@redhat.com>
Date: Thu, 26 Nov 2020 12:54:08 +0200
Message-ID: <87sg8wl773.fsf@intel.com>
MIME-Version: 1.0
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
Cc: thaytan@noraisin.net, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 16 Sep 2020, Lyude Paul <lyude@redhat.com> wrote:
> Since we're going to need to add a set of lower-level PWM backlight
> control hooks to be shared by normal backlight controls and HDR
> backlight controls in SDR mode, let's add a prefix to the external PWM
> backlight functions so that the difference between them and the high
> level PWM-only backlight functions is a bit more obvious.
>
> This introduces no functional changes.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: thaytan@noraisin.net
> Cc: Vasily Khoruzhick <anarsoul@gmail.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_panel.c | 24 +++++++++++-----------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
> index 9f23bac0d7924..c0e36244bb07d 100644
> --- a/drivers/gpu/drm/i915/display/intel_panel.c
> +++ b/drivers/gpu/drm/i915/display/intel_panel.c
> @@ -589,7 +589,7 @@ static u32 bxt_get_backlight(struct intel_connector *connector)
>  			     BXT_BLC_PWM_DUTY(panel->backlight.controller));
>  }
>  
> -static u32 pwm_get_backlight(struct intel_connector *connector)
> +static u32 ext_pwm_get_backlight(struct intel_connector *connector)
>  {
>  	struct intel_panel *panel = &connector->panel;
>  	struct pwm_state state;
> @@ -666,7 +666,7 @@ static void bxt_set_backlight(const struct drm_connector_state *conn_state, u32
>  		       BXT_BLC_PWM_DUTY(panel->backlight.controller), level);
>  }
>  
> -static void pwm_set_backlight(const struct drm_connector_state *conn_state, u32 level)
> +static void ext_pwm_set_backlight(const struct drm_connector_state *conn_state, u32 level)
>  {
>  	struct intel_panel *panel = &to_intel_connector(conn_state->connector)->panel;
>  
> @@ -835,7 +835,7 @@ static void cnp_disable_backlight(const struct drm_connector_state *old_conn_sta
>  		       tmp & ~BXT_BLC_PWM_ENABLE);
>  }
>  
> -static void pwm_disable_backlight(const struct drm_connector_state *old_conn_state)
> +static void ext_pwm_disable_backlight(const struct drm_connector_state *old_conn_state)
>  {
>  	struct intel_connector *connector = to_intel_connector(old_conn_state->connector);
>  	struct intel_panel *panel = &connector->panel;
> @@ -1168,8 +1168,8 @@ static void cnp_enable_backlight(const struct intel_crtc_state *crtc_state,
>  		       pwm_ctl | BXT_BLC_PWM_ENABLE);
>  }
>  
> -static void pwm_enable_backlight(const struct intel_crtc_state *crtc_state,
> -				 const struct drm_connector_state *conn_state)
> +static void ext_pwm_enable_backlight(const struct intel_crtc_state *crtc_state,
> +				     const struct drm_connector_state *conn_state)
>  {
>  	struct intel_connector *connector = to_intel_connector(conn_state->connector);
>  	struct intel_panel *panel = &connector->panel;
> @@ -1890,8 +1890,8 @@ cnp_setup_backlight(struct intel_connector *connector, enum pipe unused)
>  	return 0;
>  }
>  
> -static int pwm_setup_backlight(struct intel_connector *connector,
> -			       enum pipe pipe)
> +static int ext_pwm_setup_backlight(struct intel_connector *connector,
> +				   enum pipe pipe)
>  {
>  	struct drm_device *dev = connector->base.dev;
>  	struct drm_i915_private *dev_priv = to_i915(dev);
> @@ -2065,11 +2065,11 @@ intel_panel_init_backlight_funcs(struct intel_panel *panel)
>  		panel->backlight.hz_to_pwm = pch_hz_to_pwm;
>  	} else if (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) {
>  		if (connector->base.connector_type == DRM_MODE_CONNECTOR_DSI) {
> -			panel->backlight.setup = pwm_setup_backlight;
> -			panel->backlight.enable = pwm_enable_backlight;
> -			panel->backlight.disable = pwm_disable_backlight;
> -			panel->backlight.set = pwm_set_backlight;
> -			panel->backlight.get = pwm_get_backlight;
> +			panel->backlight.setup = ext_pwm_setup_backlight;
> +			panel->backlight.enable = ext_pwm_enable_backlight;
> +			panel->backlight.disable = ext_pwm_disable_backlight;
> +			panel->backlight.set = ext_pwm_set_backlight;
> +			panel->backlight.get = ext_pwm_get_backlight;
>  		} else {
>  			panel->backlight.setup = vlv_setup_backlight;
>  			panel->backlight.enable = vlv_enable_backlight;

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
