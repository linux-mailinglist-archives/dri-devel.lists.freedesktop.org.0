Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 984EF7E711E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 19:05:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6795110E0F9;
	Thu,  9 Nov 2023 18:05:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E09A10E0F9;
 Thu,  9 Nov 2023 18:05:35 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-6b7f0170d7bso1217969b3a.2; 
 Thu, 09 Nov 2023 10:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699553135; x=1700157935; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fBmuvcNq/HL/4uuuxt5Bl834w8qMdTUve8ra3EWo+14=;
 b=ccyHRfKGl/2tEukLWzY3O7VtJOPe0+XubQeW4QklzwkLJRWqMwnLGRuyv2VyoLx7PU
 5ZFuDh+R9wJS4rtSnaTZmsLvzFK/ZZCSxKVr3X8tR6pn8O5sBZRUnJb1f05H98f7Dml4
 FNHLDiBEsiV15euXa09t503c/Ae+3m4Bf+/soJAdCm4yj0diOuUPRfOs0VDpzBB6hPfy
 N2rzaUGDqcOSQgAyrbxyH2NbThTSVQuUyKuY0MlBzBv4P5dR8m+Ukta0x8OMke1WGoTI
 Z3+aJxBH18wCLn4fBtUrX9oHKnqoaC8hgp423ak1OPzFiRnvGixEMsRKE4sF/wxZoYww
 G08Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699553135; x=1700157935;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fBmuvcNq/HL/4uuuxt5Bl834w8qMdTUve8ra3EWo+14=;
 b=pfzKOsgF+te4mfNWqbm1GmCyx0+NZyVK9bPN2ly4J/YMKGk8aNPtolG5C33q3fAH8W
 pNn310iWdRfFhnEniplg9LhtETpYAVT/PjyOzSQB1k9r9iduxvQaMReenfnoRxJMYUvG
 0x4/SJwQOaN04FQwL1wMwaP/NrSjc7+9+2nNNpgPbilcZSaQU7uIuAy6VJkTC9O61Ndk
 Duyn+vfqLQBrkShqPQtblFGQFGraTmpjSbYKBpAoakLvVO2ohr6YH1ZB77kQcwMMZOSE
 0S4snkWJSNyZwqhbL9PMlY+QvweO1OZWzJne6EQAOa5C/Tikqg78YgtWEjf+8v1sf+l9
 mKag==
X-Gm-Message-State: AOJu0YxiXhJ0elpNEE7yXH85Z5SFODIqKQ20Ge5wthIm/T48bljX9HBl
 AvhICuIepCU7oZs6gEZ/W+yG18tMSK0=
X-Google-Smtp-Source: AGHT+IH6HZ63j3z4hnX4ukKs2vnCjJsrXU1fnvPvWQdZOdW8UREYq1y1qKBrpCe4oxFk38H2Hv2ssA==
X-Received: by 2002:a05:6a21:7786:b0:181:731:89b7 with SMTP id
 bd6-20020a056a21778600b00181073189b7mr7210352pzc.41.1699553134864; 
 Thu, 09 Nov 2023 10:05:34 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:c99d:e08e:5968:1b85])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a65554c000000b00578b8fab907sm4509390pgr.73.2023.11.09.10.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 10:05:33 -0800 (PST)
Date: Thu, 9 Nov 2023 10:05:31 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Allen Ballway <ballway@chromium.org>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/quirk: Add quirk for devices with
 incorrect PWM frequency
Message-ID: <ZU0fa6fvT4ZWTNXr@google.com>
References: <20231017175728.1.Ibc6408a8ff1f334974104c5bcc25f2f35a57f36e@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231017175728.1.Ibc6408a8ff1f334974104c5bcc25f2f35a57f36e@changeid>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Allen,

On Tue, Oct 17, 2023 at 06:01:39PM +0000, Allen Ballway wrote:
> Cyernet T10C has a bad default PWM frequency causing the display to
> strobe when the brightness is less than 100%. Create a new quirk to use
> the value from the BIOS rather than the default register value.
> 
> Signed-off-by: Allen Ballway <ballway@chromium.org>
> 
> ---
> 
>  .../gpu/drm/i915/display/intel_backlight.c    |  3 ++-
>  drivers/gpu/drm/i915/display/intel_quirks.c   | 26 +++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_quirks.h   |  1 +
>  3 files changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_backlight.c b/drivers/gpu/drm/i915/display/intel_backlight.c
> index 2e8f17c045222..c4dcfece9deca 100644
> --- a/drivers/gpu/drm/i915/display/intel_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_backlight.c
> @@ -1388,7 +1388,8 @@ static int vlv_setup_backlight(struct intel_connector *connector, enum pipe pipe
>  	ctl = intel_de_read(i915, VLV_BLC_PWM_CTL(pipe));
>  	panel->backlight.pwm_level_max = ctl >> 16;
> 
> -	if (!panel->backlight.pwm_level_max)
> +	if (!panel->backlight.pwm_level_max ||
> +	    intel_has_quirk(i915, QUIRK_IGNORE_DEFAULT_PWM_FREQUENCY))
>  		panel->backlight.pwm_level_max = get_backlight_max_vbt(connector);

I think it would be better if we did:

	if (!intel_has_quirk(i915, QUIRK_IGNORE_DEFAULT_PWM_FREQUENCY)) {
		ctl = intel_de_read(i915, VLV_BLC_PWM_CTL(pipe));
		panel->backlight.pwm_level_max = ctl >> 16;
	} else {
		panel->backlight.pwm_level_max = 0;
	}

	if (!panel->backlight.pwm_level_max)
		panel->backlight.pwm_level_max = get_backlight_max_vbt(connector);

The "else" branch can potentially be omitted if we know that backlight
member is initialized to 0 (I suspect it is).

> 
>  	if (!panel->backlight.pwm_level_max)
> diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/drm/i915/display/intel_quirks.c
> index a280448df771a..ff6cb499428ce 100644
> --- a/drivers/gpu/drm/i915/display/intel_quirks.c
> +++ b/drivers/gpu/drm/i915/display/intel_quirks.c
> @@ -65,6 +65,12 @@ static void quirk_no_pps_backlight_power_hook(struct drm_i915_private *i915)
>  	drm_info(&i915->drm, "Applying no pps backlight power quirk\n");
>  }
> 
> +static void quirk_ignore_default_pwm_frequency(struct drm_i915_private *i915)
> +{
> +	intel_set_quirk(i915, QUIRK_IGNORE_DEFAULT_PWM_FREQUENCY);
> +	drm_info(&i915->drm, "Applying ignore default pwm frequency quirk");
> +}
> +
>  struct intel_quirk {
>  	int device;
>  	int subsystem_vendor;
> @@ -90,6 +96,12 @@ static int intel_dmi_no_pps_backlight(const struct dmi_system_id *id)
>  	return 1;
>  }
> 
> +static int intel_dmi_ignore_default_pwm_frequency(const struct dmi_system_id *id)
> +{
> +	DRM_INFO("Default PWM frequency is incorrect and is overridden on %s\n", id->ident);
> +	return 1;
> +}
> +
>  static const struct intel_dmi_quirk intel_dmi_quirks[] = {
>  	{
>  		.dmi_id_list = &(const struct dmi_system_id[]) {
> @@ -136,6 +148,20 @@ static const struct intel_dmi_quirk intel_dmi_quirks[] = {
>  		},
>  		.hook = quirk_no_pps_backlight_power_hook,
>  	},
> +	{
> +		.dmi_id_list = &(const struct dmi_system_id[]) {
> +			{
> +				.callback = intel_dmi_ignore_default_pwm_frequency,
> +				.ident = "Cybernet T10C Tablet",
> +				.matches = {DMI_EXACT_MATCH(DMI_BOARD_VENDOR,
> +							    "Cybernet Manufacturing Inc."),
> +					    DMI_EXACT_MATCH(DMI_BOARD_NAME, "T10C Tablet"),
> +				},
> +			},
> +			{ }
> +		},
> +		.hook = quirk_ignore_default_pwm_frequency,
> +	},
>  };
> 
>  static struct intel_quirk intel_quirks[] = {
> diff --git a/drivers/gpu/drm/i915/display/intel_quirks.h b/drivers/gpu/drm/i915/display/intel_quirks.h
> index 10a4d163149fd..70589505e5a0e 100644
> --- a/drivers/gpu/drm/i915/display/intel_quirks.h
> +++ b/drivers/gpu/drm/i915/display/intel_quirks.h
> @@ -17,6 +17,7 @@ enum intel_quirk_id {
>  	QUIRK_INVERT_BRIGHTNESS,
>  	QUIRK_LVDS_SSC_DISABLE,
>  	QUIRK_NO_PPS_BACKLIGHT_POWER_HOOK,
> +	QUIRK_IGNORE_DEFAULT_PWM_FREQUENCY

You want a trailing comma here.

>  };
> 
>  void intel_init_quirks(struct drm_i915_private *i915);
> --
> 2.42.0.655.g421f12c284-goog
> 

Thanks.

-- 
Dmitry
