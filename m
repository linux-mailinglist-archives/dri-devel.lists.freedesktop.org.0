Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1A540D59F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 11:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4EF06EB22;
	Thu, 16 Sep 2021 09:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE0926EB2B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 09:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631783589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2aNJ+QUQUznI2p0/6l0UIVDoztEwnXWLrzbhf3qJBjI=;
 b=SLy8dwMDNv0Z7OFiWqVlYJio6oA4uSfxUCB1dvOr5Rjhh7iHx/VGI+xf2AIrpnwe9I54UM
 OerWJ8DuLeo0J3ezaX2sGagEssfaqdsEhpHKpeNPBDRmeIM3yGjTW1s02W/KYplf+OqwqL
 M9q9Y1WiTgaNyAGCR48eBRoP2MQUvWQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-dBpEbQvPNTyAs6fmNi4wvQ-1; Thu, 16 Sep 2021 05:12:04 -0400
X-MC-Unique: dBpEbQvPNTyAs6fmNi4wvQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 n5-20020a05640206c500b003cf53f7cef2so1969831edy.12
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 02:12:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2aNJ+QUQUznI2p0/6l0UIVDoztEwnXWLrzbhf3qJBjI=;
 b=xSYaKlAYUMNmbEL0p4jfE4An4VxLzsJ7Z8AadgwujNEm04j0DelZ8VTjp8kPoVeePJ
 +5rhAMz5/GY0uy9dd4HfQhdPK6sWmSxIiAplxEyOVqOopPKXkktZzdxG9oVGMXrwuUDF
 ITBgc9Rgb65A1bkfRvCEYV1Hf62qBp1hvFqqD1w4PV/+tXS6z6UncMupMz1kXkV3WYI8
 lthJw+xWiVDw/Ho7xSdmd3FLZwqAr8wHV1soFznrKtBLmVzG2UlYcXWBdqTGydr+V+Gv
 I7+CKKW+l98fzc0Z3113E66hDV578Hw8jTGry8+vE/gLAAUEYCtWoKXPsIHPSEg4A8Mq
 cRSw==
X-Gm-Message-State: AOAM531tUg9cwQveEV8FVAZW1/SsesGxWHCBBkMNDgxx57kn3OPTdvj8
 Wom5cuguas5Hhq2w6sykzWo2cnt5Bse1RGjr2WSRiCUOBEr9ng7IKEi+vKWvDJlD9UGLI0CUODl
 98MlYL4fjNA6w9WV5jbZ6W1Ea5iIB
X-Received: by 2002:a17:906:180a:: with SMTP id
 v10mr5220716eje.112.1631783523098; 
 Thu, 16 Sep 2021 02:12:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyknKnr0Dxiv9lTbfFsBdPlp0y/0aaDNKDTYxFQ3Whn+dwqnLbbHGrvAtBLBdztWhj/Uzx7sg==
X-Received: by 2002:a17:906:180a:: with SMTP id
 v10mr5220690eje.112.1631783522882; 
 Thu, 16 Sep 2021 02:12:02 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id mq25sm943367ejc.71.2021.09.16.02.12.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 02:12:02 -0700 (PDT)
Subject: Re: [PATCH 9/9] drm/i915: Add privacy-screen support
To: Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rajat Jain <rajatja@google.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Mark Gross <mgross@linux.intel.com>,
 Andy Shevchenko <andy@infradead.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Mario Limonciello <mario.limonciello@outlook.com>,
 Mark Pearson <markpearson@lenovo.com>, Sebastien Bacher <seb128@ubuntu.com>,
 Marco Trevisan <marco.trevisan@canonical.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org
References: <20210906073519.4615-1-hdegoede@redhat.com>
 <20210906073519.4615-10-hdegoede@redhat.com>
 <65286f7effc8b336f28f0c6f92fa9ae65e6e621b.camel@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <e58d334a-ce05-29a9-d0f5-39068e2b94b9@redhat.com>
Date: Thu, 16 Sep 2021 11:12:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <65286f7effc8b336f28f0c6f92fa9ae65e6e621b.camel@redhat.com>
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

On 9/15/21 11:11 PM, Lyude Paul wrote:
> On Mon, 2021-09-06 at 09:35 +0200, Hans de Goede wrote:
>> Add support for eDP panels with a built-in privacy screen using the
>> new drm_privacy_screen class.
>>
>> One thing which stands out here is the addition of these 2 lines to
>> intel_atomic_commit_tail:
>>
>>         for_each_new_connector_in_state(&state->base, connector, ...
>>                 drm_connector_update_privacy_screen(connector, state);
>>
>> It may seem more logical to instead take care of updating the
>> privacy-screen state by marking the crtc as needing a modeset and then
>> do this in both the encoder update_pipe (for fast-sets) and enable
>> (for full modesets) callbacks. But ATM these callbacks only get passed
>> the new connector_state and these callbacks are all called after
>> drm_atomic_helper_swap_state() at which point there is no way to get
>> the old state from the new state.
> 
> I was going to suggest that you workaround this simply by adding a variable
> that corresponds to the most recently committed privacy screen state somewhere
> in a driver private structure. But, then I realized that's basically the same
> as what you're doing now except that your current solution stores said state
> in a shared struct. So, I think you probably do have the right idea here as
> long as we don't get any non-ACPI providers in the future. This also seems
> like something that wouldn't be difficult to fixup down the line if that ends
> up changing.

Ack, this is all kernel internal stuff so we can always rework it if necessary.

Regards,

Hans




> 
>>
>> Without access to the old state, we do not know if the sw_state of
>> the privacy-screen has changes so we would need to call
>> drm_privacy_screen_set_sw_state() unconditionally. This is undesirable
>> since all current known privacy-screen providers use ACPI calls which
>> are somewhat expensive to make.
>>
>> Also, as all providers use ACPI calls, rather then poking GPU registers,
>> there is no need to order this together with other encoder operations.
>> Since no GPU poking is involved having this as a separate step of the
>> commit process actually is the logical thing to do.
>>
>> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_display.c |  5 +++++
>>  drivers/gpu/drm/i915/display/intel_dp.c      | 10 ++++++++++
>>  drivers/gpu/drm/i915/i915_pci.c              | 12 ++++++++++++
>>  3 files changed, 27 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
>> b/drivers/gpu/drm/i915/display/intel_display.c
>> index 5560d2f4c352..7285873d329a 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display.c
>> @@ -10140,6 +10140,8 @@ static void intel_atomic_commit_tail(struct
>> intel_atomic_state *state)
>>         struct drm_device *dev = state->base.dev;
>>         struct drm_i915_private *dev_priv = to_i915(dev);
>>         struct intel_crtc_state *new_crtc_state, *old_crtc_state;
>> +       struct drm_connector_state *new_connector_state;
>> +       struct drm_connector *connector;
>>         struct intel_crtc *crtc;
>>         u64 put_domains[I915_MAX_PIPES] = {};
>>         intel_wakeref_t wakeref = 0;
>> @@ -10237,6 +10239,9 @@ static void intel_atomic_commit_tail(struct
>> intel_atomic_state *state)
>>                         intel_color_load_luts(new_crtc_state);
>>         }
>>  
>> +       for_each_new_connector_in_state(&state->base, connector,
>> new_connector_state, i)
>> +               drm_connector_update_privacy_screen(connector, &state-
>>> base);
>> +
>>         /*
>>          * Now that the vblank has passed, we can go ahead and program the
>>          * optimal watermarks on platforms that need two-step watermark
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
>> b/drivers/gpu/drm/i915/display/intel_dp.c
>> index 7f8e8865048f..3aa2072cccf6 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -37,6 +37,7 @@
>>  #include <drm/drm_crtc.h>
>>  #include <drm/drm_dp_helper.h>
>>  #include <drm/drm_edid.h>
>> +#include <drm/drm_privacy_screen_consumer.h>
>>  #include <drm/drm_probe_helper.h>
>>  
>>  #include "g4x_dp.h"
>> @@ -5217,6 +5218,7 @@ static bool intel_edp_init_connector(struct intel_dp
>> *intel_dp,
>>         struct drm_connector *connector = &intel_connector->base;
>>         struct drm_display_mode *fixed_mode = NULL;
>>         struct drm_display_mode *downclock_mode = NULL;
>> +       struct drm_privacy_screen *privacy_screen;
>>         bool has_dpcd;
>>         enum pipe pipe = INVALID_PIPE;
>>         struct edid *edid;
>> @@ -5308,6 +5310,14 @@ static bool intel_edp_init_connector(struct intel_dp
>> *intel_dp,
>>                                 fixed_mode->hdisplay, fixed_mode->vdisplay);
>>         }
>>  
>> +       privacy_screen = drm_privacy_screen_get(dev->dev, NULL);
>> +       if (!IS_ERR(privacy_screen)) {
>> +               drm_connector_attach_privacy_screen_provider(connector,
>> +                                                           
>> privacy_screen);
>> +       } else if (PTR_ERR(privacy_screen) != -ENODEV) {
>> +               drm_warn(&dev_priv->drm, "Error getting privacy-screen\n");
>> +       }
>> +
>>         return true;
>>  
>>  out_vdd_off:
>> diff --git a/drivers/gpu/drm/i915/i915_pci.c
>> b/drivers/gpu/drm/i915/i915_pci.c
>> index 146f7e39182a..d6913f567a1c 100644
>> --- a/drivers/gpu/drm/i915/i915_pci.c
>> +++ b/drivers/gpu/drm/i915/i915_pci.c
>> @@ -25,6 +25,7 @@
>>  #include <linux/vga_switcheroo.h>
>>  
>>  #include <drm/drm_drv.h>
>> +#include <drm/drm_privacy_screen_consumer.h>
>>  #include <drm/i915_pciids.h>
>>  
>>  #include "i915_drv.h"
>> @@ -1167,6 +1168,7 @@ static int i915_pci_probe(struct pci_dev *pdev, const
>> struct pci_device_id *ent)
>>  {
>>         struct intel_device_info *intel_info =
>>                 (struct intel_device_info *) ent->driver_data;
>> +       struct drm_privacy_screen *privacy_screen;
>>         int err;
>>  
>>         if (intel_info->require_force_probe &&
>> @@ -1195,7 +1197,17 @@ static int i915_pci_probe(struct pci_dev *pdev, const
>> struct pci_device_id *ent)
>>         if (vga_switcheroo_client_probe_defer(pdev))
>>                 return -EPROBE_DEFER;
>>  
>> +       /*
>> +        * We do not handle -EPROBE_DEFER further into the probe process, so
>> +        * check if we have a laptop-panel privacy-screen for which the
>> driver
>> +        * has not loaded yet here.
>> +        */
>> +       privacy_screen = drm_privacy_screen_get(&pdev->dev, NULL);
>> +       if (IS_ERR(privacy_screen) && PTR_ERR(privacy_screen) == -
>> EPROBE_DEFER)
>> +               return -EPROBE_DEFER;
>> +
>>         err = i915_driver_probe(pdev, ent);
>> +       drm_privacy_screen_put(privacy_screen);
>>         if (err)
>>                 return err;
>>  
> 

