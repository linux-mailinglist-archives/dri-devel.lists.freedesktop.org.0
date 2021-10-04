Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D447421379
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 18:02:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 200BC6EA44;
	Mon,  4 Oct 2021 16:02:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD3F6EA43
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 16:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633363346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7pRNqi+qB5v6kiBNHusaNSqIWepIPyAOWTzotrPTKOc=;
 b=AJOIdB2A96TBeMpBBD8OF+wE7LYQJTNoBiBufR34mqNi8EpeOO8HrEuRrHXXRAuxExpITu
 L7SfS4tAg2JsbHaNtO4zfHho9sBjrB+bcTEP3FJ+wuhsy09U1Z8UkkqSwMPZ0pcX9X+5Gd
 lf91lgUtPLJ3HB2pgGnu8ezUAeGVGWA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-q7vSGJbyP6-EVf4oTjOy-g-1; Mon, 04 Oct 2021 12:02:24 -0400
X-MC-Unique: q7vSGJbyP6-EVf4oTjOy-g-1
Received: by mail-ed1-f72.google.com with SMTP id
 w8-20020a50c448000000b003dae8d38037so4587933edf.8
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Oct 2021 09:02:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7pRNqi+qB5v6kiBNHusaNSqIWepIPyAOWTzotrPTKOc=;
 b=trzUAbrSKy3Txvyn/q/HhIIHvXfnjBww+E6PaOLgIH0NoYS6ibzYwWBEdD7TSMqadR
 P5pGFZJEv5vwW0inOvRu2DZl526/X4SVgXdYPmQ1zBW2cfDG5tBDcjQ98K0XYwf3T/IC
 shCHgtucwQvPx7HCnusm/fSsyNOi5nhuxgC8wxmTQZRmVxyPhg+l55onjcDDJ41s+Dqn
 LPrnQR+PkvOusAF44+QGJdIPAZ/w0z0MR9TXVwbt5f/xYyKsnWtS+ZcB+h2D+GLbTdEk
 rDPgr2xG9ULHB3B52b09FXvNb7Vqz+3oGqIG0k+U5gI71XBPxOurfuZanrG5fx3Xhnx5
 NJIA==
X-Gm-Message-State: AOAM531g6MquPYfb/wfzHqeMfHpGCJ1E+KKQNW8Jp91u7KYmxY3lmVZ1
 Lygf1Mb/47vwg3pVgGC7bmU8wVrQJWL2pdmDGSlviRDiAFtnFoby1z7ftPR5+T6jHPOc+rFI5NH
 CYf+SQmDyDpMtKFM1UwrCdleimmCp
X-Received: by 2002:a05:6402:19ba:: with SMTP id
 o26mr19133743edz.1.1633363343084; 
 Mon, 04 Oct 2021 09:02:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCNvcl810W+pcs1T0NxPjJhcR3RyujjlOORxOA3tFBbSocDrsBkVd6ZqPxZPVflwg7KVWKWw==
X-Received: by 2002:a05:6402:19ba:: with SMTP id
 o26mr19133688edz.1.1633363342664; 
 Mon, 04 Oct 2021 09:02:22 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id u6sm7376548edt.30.2021.10.04.09.02.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 09:02:22 -0700 (PDT)
Subject: Re: [PATCH 10/10] drm/i915: Add privacy-screen support (v2)
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rajat Jain <rajatja@google.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Lyude <lyude@redhat.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Mark Gross <markgross@kernel.org>,
 Andy Shevchenko <andy@infradead.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Mario Limonciello <mario.limonciello@outlook.com>,
 Mark Pearson <markpearson@lenovo.com>, Sebastien Bacher <seb128@ubuntu.com>,
 Marco Trevisan <marco.trevisan@canonical.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org
References: <20211002163618.99175-1-hdegoede@redhat.com>
 <20211002163618.99175-11-hdegoede@redhat.com> <YVsfwmQjYOnIrxzl@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <ac1b7f4a-42f6-5f07-9733-e8945fb65179@redhat.com>
Date: Mon, 4 Oct 2021 18:02:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YVsfwmQjYOnIrxzl@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

Hi,

On 10/4/21 5:37 PM, Ville Syrjälä wrote:
> On Sat, Oct 02, 2021 at 06:36:18PM +0200, Hans de Goede wrote:
>> Add support for eDP panels with a built-in privacy screen using the
>> new drm_privacy_screen class.
>>
>> Changes in v2:
>> - Call drm_connector_update_privacy_screen() from
>>   intel_enable_ddi_dp() / intel_ddi_update_pipe_dp() instead of adding a
>>   for_each_new_connector_in_state() loop to intel_atomic_commit_tail()
>> - Move the probe-deferral check to the intel_modeset_probe_defer() helper
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_atomic.c  |  1 +
>>  drivers/gpu/drm/i915/display/intel_ddi.c     |  3 +++
>>  drivers/gpu/drm/i915/display/intel_display.c | 10 ++++++++++
>>  drivers/gpu/drm/i915/display/intel_dp.c      | 10 ++++++++++
>>  4 files changed, 24 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
>> index b4e7ac51aa31..a62550711e98 100644
>> --- a/drivers/gpu/drm/i915/display/intel_atomic.c
>> +++ b/drivers/gpu/drm/i915/display/intel_atomic.c
>> @@ -139,6 +139,7 @@ int intel_digital_connector_atomic_check(struct drm_connector *conn,
>>  	    new_conn_state->base.picture_aspect_ratio != old_conn_state->base.picture_aspect_ratio ||
>>  	    new_conn_state->base.content_type != old_conn_state->base.content_type ||
>>  	    new_conn_state->base.scaling_mode != old_conn_state->base.scaling_mode ||
>> +	    new_conn_state->base.privacy_screen_sw_state != old_conn_state->base.privacy_screen_sw_state ||
>>  	    !drm_connector_atomic_hdr_metadata_equal(old_state, new_state))
>>  		crtc_state->mode_changed = true;
>>  
>> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
>> index 51cd0420e00e..e4496c830a35 100644
>> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
>> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
>> @@ -25,6 +25,7 @@
>>   *
>>   */
>>  
>> +#include <drm/drm_privacy_screen_consumer.h>
>>  #include <drm/drm_scdc_helper.h>
>>  
>>  #include "i915_drv.h"
>> @@ -3022,6 +3023,7 @@ static void intel_enable_ddi_dp(struct intel_atomic_state *state,
>>  	if (port == PORT_A && DISPLAY_VER(dev_priv) < 9)
>>  		intel_dp_stop_link_train(intel_dp, crtc_state);
>>  
>> +	drm_connector_update_privacy_screen(conn_state);
>>  	intel_edp_backlight_on(crtc_state, conn_state);
>>  
>>  	if (!dig_port->lspcon.active || dig_port->dp.has_hdmi_sink)
>> @@ -3247,6 +3249,7 @@ static void intel_ddi_update_pipe_dp(struct intel_atomic_state *state,
>>  	intel_drrs_update(intel_dp, crtc_state);
>>  
>>  	intel_backlight_update(state, encoder, crtc_state, conn_state);
>> +	drm_connector_update_privacy_screen(conn_state);
>>  }
>>  
>>  void intel_ddi_update_pipe(struct intel_atomic_state *state,
>> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
>> index e67f3207ba54..9a5dbe51458d 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display.c
>> @@ -42,6 +42,7 @@
>>  #include <drm/drm_edid.h>
>>  #include <drm/drm_fourcc.h>
>>  #include <drm/drm_plane_helper.h>
>> +#include <drm/drm_privacy_screen_consumer.h>
>>  #include <drm/drm_probe_helper.h>
>>  #include <drm/drm_rect.h>
>>  #include <drm/drm_drv.h>
>> @@ -12693,6 +12694,8 @@ void intel_modeset_driver_remove_nogem(struct drm_i915_private *i915)
>>  
>>  bool intel_modeset_probe_defer(struct pci_dev *pdev)
>>  {
>> +	struct drm_privacy_screen *privacy_screen;
>> +
>>  	/*
>>  	 * apple-gmux is needed on dual GPU MacBook Pro
>>  	 * to probe the panel if we're the inactive GPU.
>> @@ -12700,6 +12703,13 @@ bool intel_modeset_probe_defer(struct pci_dev *pdev)
>>  	if (vga_switcheroo_client_probe_defer(pdev))
>>  		return true;
>>  
>> +	/* If the LCD panel has a privacy-screen, wait for it */
>> +	privacy_screen = drm_privacy_screen_get(&pdev->dev, NULL);
>> +	if (IS_ERR(privacy_screen) && PTR_ERR(privacy_screen) == -EPROBE_DEFER)
>> +		return true;
>> +
>> +	drm_privacy_screen_put(privacy_screen);
>> +
>>  	return false;
>>  }
>>  
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
>> index 74a657ae131a..91207310dc0d 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -37,6 +37,7 @@
>>  #include <drm/drm_crtc.h>
>>  #include <drm/drm_dp_helper.h>
>>  #include <drm/drm_edid.h>
>> +#include <drm/drm_privacy_screen_consumer.h>
>>  #include <drm/drm_probe_helper.h>
>>  
>>  #include "g4x_dp.h"
>> @@ -4808,6 +4809,7 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
>>  	struct drm_connector *connector = &intel_connector->base;
>>  	struct drm_display_mode *fixed_mode = NULL;
>>  	struct drm_display_mode *downclock_mode = NULL;
>> +	struct drm_privacy_screen *privacy_screen;
>>  	bool has_dpcd;
>>  	enum pipe pipe = INVALID_PIPE;
>>  	struct edid *edid;
>> @@ -4902,6 +4904,14 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
>>  				fixed_mode->hdisplay, fixed_mode->vdisplay);
>>  	}
>>  
>> +	privacy_screen = drm_privacy_screen_get(dev->dev, NULL);
>> +	if (!IS_ERR(privacy_screen)) {
>> +		drm_connector_attach_privacy_screen_provider(connector,
>> +							     privacy_screen);
>> +	} else if (PTR_ERR(privacy_screen) != -ENODEV) {
>> +		drm_warn(&dev_priv->drm, "Error getting privacy-screen\n");
>> +	}
> 
> I'm thinking this should go into intel_ddi_init_dp_connector()
> on account of only the ddi codepaths having the
> drm_connector_update_privacy_screen() calls.

This should only be done in case of intel_dp_is_edp(intel_dp) returning
true. We don't have a mapping which connector has the privacy screen
(hence the NULL argument as second parameter to drm_privacy_screen_get()),
so if there are multiple DP connectors we want this to only happen on
the eDP one.

Yes this assumes that devices with a builtin privacy-screen have only
one eDP connector. For now this holds true, if this becomes not true in
the future then that is something to figure out at that point in time
(with a lot of luck the privacy-screen will be controlled through DP
by then and not through some random ACPI interface).

So I traced the call-graph and I see that we can also end up in
intel_edp_init_connector() from g4x_dp_init(), which I assume is
your main reason for requesting this change. But unless someone
retro-fits an electronic privacy-screen to the old hw supported
by g4x_dp_init() then drm_privacy_screen_get() will always
return -ENODEV, so in that case this is a no-op.

> Otherwise seems ok.

Thanks, note if you still want me to move this please let me know,
this does mean adding a intel_dp_is_edp() check to intel_ddi.c
which so far is free of these kinda checks.

Regards,

Hans

