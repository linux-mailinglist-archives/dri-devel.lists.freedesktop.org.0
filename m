Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA4259FB55
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 15:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 970A010E28B;
	Wed, 24 Aug 2022 13:27:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFEB811AE1C;
 Wed, 24 Aug 2022 13:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661347613; x=1692883613;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=MlySsLPdoAztoxuUnioJVpj6nmnJAiB2GUXpz6LMYIs=;
 b=RY1plNbFNgJRjL8ia2wvt0G2iZlOvjhf94l2B+uh9Es80w21ZjZIbpl/
 HV26kxiP90QC6czJfzoCzZ2R0WpfPwuy0mz70RL1ynbKGYg/ZTsg1i9Mg
 JmVNqYb/FTi5wQKFv2HGE4mdSVLuFBg2PqdsxgdtB3YMEJpYiuNbqKaj6
 NFbAvyu5ebFGpjiNQeT0Umft3tayFfuHjUfWeg/HM1pH7MSdC51/fViJ7
 TDqkfnDAycSAxS5j1s+8yUcxh2q2kSGyrJvlPerfHIEdmUiixoGvEZKCg
 6vGHrer5W/gZues5lbaaw8fMgNfigjO/uzq0ekH3a77nW1cI8K0f0XO1p A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10448"; a="357938868"
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; d="scan'208";a="357938868"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2022 06:26:50 -0700
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; d="scan'208";a="670503413"
Received: from zlim2-mobl.gar.corp.intel.com (HELO localhost) ([10.252.52.23])
 by fmsmga008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2022 06:26:43 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude <lyude@redhat.com>, Daniel Dadap
 <ddadap@nvidia.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>,
 Lukas Wunner <lukas@wunner.de>, Mark Gross <markgross@kernel.org>, Andy
 Shevchenko <andy@kernel.org>
Subject: Re: [PATCH v4 11/31] drm/i915: Call acpi_video_register_backlight()
 (v2)
In-Reply-To: <7660855c-6307-a321-5250-cc8a51075bda@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220824121523.1291269-1-hdegoede@redhat.com>
 <20220824121523.1291269-12-hdegoede@redhat.com> <87y1vdizau.fsf@intel.com>
 <7660855c-6307-a321-5250-cc8a51075bda@redhat.com>
Date: Wed, 24 Aug 2022 16:26:40 +0300
Message-ID: <87sfllixgv.fsf@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx <intel-gfx@lists.freedesktop.org>, amd-gfx@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 24 Aug 2022, Hans de Goede <hdegoede@redhat.com> wrote:
> Hi,
>
> On 8/24/22 14:47, Jani Nikula wrote:
>> On Wed, 24 Aug 2022, Hans de Goede <hdegoede@redhat.com> wrote:
>>> On machins without an i915 opregion the acpi_video driver immediately
>>> probes the ACPI video bus and used to also immediately register
>>> acpi_video# backlight devices when supported.
>>>
>>> Once the drm/kms driver then loaded later and possibly registered
>>> a native backlight device then the drivers/acpi/video_detect.c code
>>> unregistered the acpi_video0 device to avoid there being 2 backlight
>>> devices (when acpi_video_get_backlight_type()==native).
>>>
>>> This means that userspace used to briefly see 2 devices and the
>>> disappearing of acpi_video0 after a brief time confuses the systemd
>>> backlight level save/restore code, see e.g.:
>>> https://bbs.archlinux.org/viewtopic.php?id=269920
>>>
>>> To fix this the ACPI video code has been modified to make backlight class
>>> device registration a separate step, relying on the drm/kms driver to
>>> ask for the acpi_video backlight registration after it is done setting up
>>> its native backlight device.
>>>
>>> Add a call to the new acpi_video_register_backlight() after the i915 calls
>>> acpi_video_register() (after setting up the i915 opregion) so that the
>>> acpi_video backlight devices get registered on systems where the i915
>>> native backlight device is not registered.
>>>
>>> Changes in v2:
>>> -Only call acpi_video_register_backlight() when a panel is detected
>>>
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>> ---
>>>  drivers/gpu/drm/i915/display/intel_display.c | 8 ++++++++
>>>  drivers/gpu/drm/i915/display/intel_panel.c   | 3 +++
>>>  drivers/gpu/drm/i915/i915_drv.h              | 2 ++
>>>  3 files changed, 13 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
>>> index 6103b02c081f..2bb53efdb149 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_display.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_display.c
>>> @@ -9088,6 +9088,14 @@ void intel_display_driver_register(struct drm_i915_private *i915)
>>>  	/* Must be done after probing outputs */
>>>  	intel_opregion_register(i915);
>>>  	acpi_video_register();
>>> +	/*
>>> +	 * Only call this if i915 is driving the internal panel. If the internal
>>> +	 * panel is not driven by i915 then another GPU driver may still register
>>> +	 * a native backlight driver later and this should only be called after
>>> +	 * any native backlights have been registered.
>>> +	 */
>>> +	if (i915->have_panel)
>>> +		acpi_video_register_backlight();
>> 
>> Apologies for procrastinating the review.
>> 
>> Please let's not add new flags like have_panel to i915; we're trying to
>> clean it up instead.
>> 
>> The code here needs to iterate over the connectors to decide. Maybe
>> better abstracted a function.
>
> So something like add a i915_have_panel() helper which iterates over all
> the connectors and then of 1 of them is of the LVDS / eDP / DSI type
> return true ?

Or abstract the acpi_video_register_backlight() calling in a function
that does the loop and calls if necessary.

BR,
Jani.


>
> Regards,
>
> Hans
>
>
>
>>>  	intel_audio_init(i915);
>>>  
>>> diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
>>> index 237a40623dd7..4536c527f50c 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_panel.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_panel.c
>>> @@ -646,8 +646,11 @@ intel_panel_mode_valid(struct intel_connector *connector,
>>>  
>>>  int intel_panel_init(struct intel_connector *connector)
>>>  {
>>> +	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
>>>  	struct intel_panel *panel = &connector->panel;
>>>  
>>> +	dev_priv->have_panel = true;
>>> +
>>>  	intel_backlight_init_funcs(panel);
>>>  
>>>  	drm_dbg_kms(connector->base.dev,
>>> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
>>> index 69ce6db6a7c1..14b0dcaf25c2 100644
>>> --- a/drivers/gpu/drm/i915/i915_drv.h
>>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>>> @@ -756,6 +756,8 @@ struct drm_i915_private {
>>>  
>>>  	bool ipc_enabled;
>>>  
>>> +	bool have_panel;
>>> +
>>>  	struct intel_audio_private audio;
>>>  
>>>  	struct i915_pmu pmu;
>> 
>

-- 
Jani Nikula, Intel Open Source Graphics Center
