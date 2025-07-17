Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA347B087E5
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 10:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB0310E00B;
	Thu, 17 Jul 2025 08:29:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="Pb8kTk2r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FCF810E00B;
 Thu, 17 Jul 2025 08:29:48 +0000 (UTC)
Received: from [192.168.178.13] (business-24-134-207-61.pool2.vodafone-ip.de
 [24.134.207.61])
 (Authenticated sender: t.guttzeit@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 8BEB12FC0055;
 Thu, 17 Jul 2025 10:29:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1752740986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hj1avtcoqxbKAMsm5imqqAwJOWRbcxAXTXB67LGPYEY=;
 b=Pb8kTk2rxNIBFxjUq92sAMWNBCZC+HToOAWNOE6myhATk/kqLk1qOLnCnAEc74d/KOZif7
 Ls4h4vIOGsbxHayK2ErT6egZLgDKxTdyEwEYffY2IwlTGpAZyMlOc/HlF7IORXUR4FdYhO
 IXtgEnvJpJO7voYy1FHZUbS+nrO8zWI=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=t.guttzeit@tuxedocomputers.com
 smtp.mailfrom=t.guttzeit@tuxedocomputers.com
Message-ID: <3f9a6ad3-d892-4177-9b84-677b90d76e89@tuxedocomputers.com>
Date: Thu, 17 Jul 2025 10:29:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/1] drm/i915/display: Avoid unsupported 300Hz output
 mode on a TUXEDO device
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 Werner Sembach <wse@tuxedocomputers.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250704192007.526044-1-wse@tuxedocomputers.com>
 <20250704192007.526044-2-wse@tuxedocomputers.com>
 <5998d67d-2096-4c93-b0b6-8af582d901ea@intel.com>
Content-Language: en-US
From: Tim Guttzeit <t.guttzeit@tuxedocomputers.com>
Organization: TUXEDO Computers
In-Reply-To: <5998d67d-2096-4c93-b0b6-8af582d901ea@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



Am 17.07.25 um 09:30 schrieb Murthy, Arun R:
> 
>> -----Original Message-----
>> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of 
>> Werner
>> Sembach
>> Sent: Saturday, July 5, 2025 12:34 AM
>> To: Jani Nikula <jani.nikula@linux.intel.com>; Vivi, Rodrigo
>> <rodrigo.vivi@intel.com>; Joonas Lahtinen 
>> <joonas.lahtinen@linux.intel.com>;
>> Tvrtko Ursulin <tursulin@ursulin.net>; David Airlie <airlied@gmail.com>;
>> Simona Vetter <simona@ffwll.ch>
>> Cc: Tim Guttzeit <t.guttzeit@tuxedocomputers.com>; Werner Sembach
>> <wse@tuxedocomputers.com>; intel-gfx@lists.freedesktop.org; intel-
>> xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-
>> kernel@vger.kernel.org
>> Subject: [RFC PATCH 1/1] drm/i915/display: Avoid unsupported 300Hz output
>> mode on a TUXEDO device
>>
>> From: Tim Guttzeit <t.guttzeit@tuxedocomputers.com>
>>
>> Removes all display modes with more than 240 Hz for the integrated 
>> display on
>> a TUXEDO Stellaris 16 Gen7, because using the iGPU with higer refresh 
>> rates
>> causes screen flicker.
>>
>> Signed-off-by: Tim Guttzeit <t.guttzeit@tuxedocomputers.com>
>> Co-developed-by: Werner Sembach <wse@tuxedocomputers.com>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_dp.c     |  5 ++++
>>  drivers/gpu/drm/i915/display/intel_quirks.c | 30 +++++++++++++++++++++
>> drivers/gpu/drm/i915/display/intel_quirks.h |  1 +
>>  3 files changed, 36 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
>> b/drivers/gpu/drm/i915/display/intel_dp.c
>> index 640c43bf62d4c..5ce00cfe36ee1 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -1436,6 +1436,11 @@ intel_dp_mode_valid(struct drm_connector
>> *_connector,
>>      if (mode->clock < 10000)
>>          return MODE_CLOCK_LOW;
>>
>> +    if (intel_has_quirk(display, QUIRK_EDP_MAX_240HZ_HOOK) &&
>> +        intel_dp_is_edp(intel_dp) &&
>> +        drm_mode_vrefresh(mode) > 240)
>> +        return MODE_BAD;
>> +
> Adding a quirk for this is not the right approach. If this is not 
> supported by the display, should have been pruned by the driver.
> 

Thank you for your reply. The panel (NE160QDM-NZL) supports 300 Hz and 
advertises it. Also when running the system on its NVIDIA dGPU, it runs 
perfectly fine without the flickering and on 300 Hz. On the iGPU, which 
is apparently unable to support 300 Hz, it is not pruned, thus leading 
to the flickering.

Best regards,
Tim Guttzeit

> ------------->      fixed_mode = intel_panel_fixed_mode(connector, mode);
>>      if (intel_dp_is_edp(intel_dp) && fixed_mode) {
>>          status = intel_panel_mode_valid(connector, mode); diff --git
>> a/drivers/gpu/drm/i915/display/intel_quirks.c
>> b/drivers/gpu/drm/i915/display/intel_quirks.c
>> index a32fae510ed27..438ce2cb37a01 100644
>> --- a/drivers/gpu/drm/i915/display/intel_quirks.c
>> +++ b/drivers/gpu/drm/i915/display/intel_quirks.c
>> @@ -72,6 +72,12 @@ static void quirk_no_pps_backlight_power_hook(struct
>> intel_display *display)
>>      drm_info(display->drm, "Applying no pps backlight power 
>> quirk\n");  }
>>
>> +static void quirk_edp_max_240hz_hook(struct intel_display *display) {
>> +    intel_set_quirk(display, QUIRK_EDP_MAX_240HZ_HOOK);
>> +    drm_info(display->drm, "Applying max 240Hz quirk\n"); }
>> +
>>  static void quirk_fw_sync_len(struct intel_dp *intel_dp)  {
>>      struct intel_display *display = to_intel_display(intel_dp); @@ 
>> -120,6
>> +126,12 @@ static int intel_dmi_no_pps_backlight(const struct 
>> dmi_system_id
>> *id)
>>      return 1;
>>  }
>>
>> +static int intel_dmi_edp_max_240hz(const struct dmi_system_id *id) {
>> +    DRM_INFO("Restrict output refreshrate to maximum 240Hz %s\n", id-
>> >ident);
>> +    return 1;
>> +}
>> +
>>  static const struct intel_dmi_quirk intel_dmi_quirks[] = {
>>      {
>>          .dmi_id_list = &(const struct dmi_system_id[]) { @@ -166,6
>> +178,24 @@ static const struct intel_dmi_quirk intel_dmi_quirks[] = {
>>          },
>>          .hook = quirk_no_pps_backlight_power_hook,
>>      },
>> +    {
>> +        .dmi_id_list = &(const struct dmi_system_id[]) {
>> +            {
>> +                .callback = intel_dmi_edp_max_240hz,
>> +                .ident = "TUXEDO Stellaris 16 Intel Gen7",
>> +                .matches =
>> {DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY"),
>> +                },
>> +            },
>> +            {
>> +                .callback = intel_dmi_edp_max_240hz,
>> +                .ident = "TUXEDO Stellaris 16 Intel Gen7",
>> +                .matches =
>> {DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY_mLED"),
>> +                },
>> +            },
>> +            { }
>> +        },
>> +        .hook = quirk_edp_max_240hz_hook,
>> +    },
>>  };
>>
>>  static struct intel_quirk intel_quirks[] = { diff --git
>> a/drivers/gpu/drm/i915/display/intel_quirks.h
>> b/drivers/gpu/drm/i915/display/intel_quirks.h
>> index cafdebda75354..8fe3f3467106a 100644
>> --- a/drivers/gpu/drm/i915/display/intel_quirks.h
>> +++ b/drivers/gpu/drm/i915/display/intel_quirks.h
>> @@ -20,6 +20,7 @@ enum intel_quirk_id {
>>      QUIRK_LVDS_SSC_DISABLE,
>>      QUIRK_NO_PPS_BACKLIGHT_POWER_HOOK,
>>      QUIRK_FW_SYNC_LEN,
>> +    QUIRK_EDP_MAX_240HZ_HOOK,
>>  };
>>
>>  void intel_init_quirks(struct intel_display *display);
>> -- 
>> 2.43.0
> 
> 
> 
