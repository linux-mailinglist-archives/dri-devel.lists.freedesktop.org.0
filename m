Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC2640D776
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 12:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701CB6EB54;
	Thu, 16 Sep 2021 10:32:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25AD66EB49
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 10:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631788359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gbtQYbmXTfGjFc0xtrXYRpBgRpF9MVZuvT9anQld5O8=;
 b=G4k4YD8qhAouHPz0sYXFSsYXq37lrCEAE1l7SpLIfLM5q+vutEjAX/daeLoxnEnCADkzS6
 13tLKOvFViY13AXWziHzIPbtuVCeDX+ddVv4insEe+kHMRzXsTZj+boYslkyqIuF52Wrqu
 K0yrF+h3WwuOQU4tCvBa/CmZTEUGiwY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-iiLTPzuKMH6S2DPGDF-qbA-1; Thu, 16 Sep 2021 06:32:38 -0400
X-MC-Unique: iiLTPzuKMH6S2DPGDF-qbA-1
Received: by mail-ed1-f69.google.com with SMTP id
 y17-20020a50e611000000b003d051004603so4933805edm.8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 03:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gbtQYbmXTfGjFc0xtrXYRpBgRpF9MVZuvT9anQld5O8=;
 b=lmrtY04bNUH1PJ4/M5I7za6t2dd1M1QyJDh6kUn79vGB2k2uQyby/2E+gK2i7kVyTT
 HdFoHm4t7AnY+VTcpE/f+d9yETApaEEU9u6QGUI3M8qpquQ7/tKHxqmZPkyKQ/2I/duQ
 8IMks1ImQ7BWv2y0+b9thFlsNSK4umDTZ7TY0GK1+2sG4USswSCMrS3MrdvpePAYDm82
 2qBkiWDXR8ZYTEz2yD5mqGhtgtmJCfSlTmEvIjwBKpFdoxybLO3LM7vaNoPnnG6mL9Jt
 VFmbn0yhql2exeXoNGj8CkyWoYefLEj7RywkV8FcCp9Y1xH3wKBPblFaPnsVT7kAV3Wx
 yeiw==
X-Gm-Message-State: AOAM532Yr95GkHqv85uspx6w1HMJ7mRd/u1Mc1EOj5TF9YxBw1gaB6c+
 cs/nKtxDpazsjXpwh2mVtBVQVjjke0la1DqLmhIZd5Fjbbtr3637xs9FBrdccUlRaDJOImsyx+X
 QUPjthkdrhsB4fvTeeLOBGxRSBWoo
X-Received: by 2002:a17:907:9854:: with SMTP id
 jj20mr5775204ejc.133.1631788356416; 
 Thu, 16 Sep 2021 03:32:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+DP3j5V2d89lykx6APx7iHQSw7WrXH5VMC8PRlP9+SgLiKum+dRZLAO3BafOSlJNc01z57Q==
X-Received: by 2002:a17:907:9854:: with SMTP id
 jj20mr5775165ejc.133.1631788356101; 
 Thu, 16 Sep 2021 03:32:36 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id s4sm1059116eja.23.2021.09.16.03.32.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 03:32:35 -0700 (PDT)
Subject: Re: [PATCH 9/9] drm/i915: Add privacy-screen support
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rajat Jain <rajatja@google.com>, Lyude <lyude@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Mark Gross <mgross@linux.intel.com>,
 Andy Shevchenko <andy@infradead.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Mario Limonciello <mario.limonciello@outlook.com>,
 Mark Pearson <markpearson@lenovo.com>, Sebastien Bacher <seb128@ubuntu.com>,
 Marco Trevisan <marco.trevisan@canonical.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org
References: <20210906073519.4615-1-hdegoede@redhat.com>
 <20210906073519.4615-10-hdegoede@redhat.com> <87sfy4x3ic.fsf@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <a4f10bbe-c87a-90f1-0691-01c0da485fa6@redhat.com>
Date: Thu, 16 Sep 2021 12:32:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87sfy4x3ic.fsf@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

Hi,

On 9/16/21 11:40 AM, Jani Nikula wrote:
> 
> Cc: Ville for input here, see question inline.
> 
> On Mon, 06 Sep 2021, Hans de Goede <hdegoede@redhat.com> wrote:
>> Add support for eDP panels with a built-in privacy screen using the
>> new drm_privacy_screen class.
>>
>> One thing which stands out here is the addition of these 2 lines to
>> intel_atomic_commit_tail:
>>
>> 	for_each_new_connector_in_state(&state->base, connector, ...
>> 		drm_connector_update_privacy_screen(connector, state);
>>
>> It may seem more logical to instead take care of updating the
>> privacy-screen state by marking the crtc as needing a modeset and then
>> do this in both the encoder update_pipe (for fast-sets) and enable
>> (for full modesets) callbacks. But ATM these callbacks only get passed
>> the new connector_state and these callbacks are all called after
>> drm_atomic_helper_swap_state() at which point there is no way to get
>> the old state from the new state.
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
>>  drivers/gpu/drm/i915/display/intel_display.c |  5 +++++
>>  drivers/gpu/drm/i915/display/intel_dp.c      | 10 ++++++++++
>>  drivers/gpu/drm/i915/i915_pci.c              | 12 ++++++++++++
>>  3 files changed, 27 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
>> index 5560d2f4c352..7285873d329a 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display.c
>> @@ -10140,6 +10140,8 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
>>  	struct drm_device *dev = state->base.dev;
>>  	struct drm_i915_private *dev_priv = to_i915(dev);
>>  	struct intel_crtc_state *new_crtc_state, *old_crtc_state;
>> +	struct drm_connector_state *new_connector_state;
>> +	struct drm_connector *connector;
>>  	struct intel_crtc *crtc;
>>  	u64 put_domains[I915_MAX_PIPES] = {};
>>  	intel_wakeref_t wakeref = 0;
>> @@ -10237,6 +10239,9 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
>>  			intel_color_load_luts(new_crtc_state);
>>  	}
>>  
>> +	for_each_new_connector_in_state(&state->base, connector, new_connector_state, i)
>> +		drm_connector_update_privacy_screen(connector, &state->base);
>> +
>>  	/*
>>  	 * Now that the vblank has passed, we can go ahead and program the
>>  	 * optimal watermarks on platforms that need two-step watermark
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
>> index 7f8e8865048f..3aa2072cccf6 100644
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
>> @@ -5217,6 +5218,7 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
>>  	struct drm_connector *connector = &intel_connector->base;
>>  	struct drm_display_mode *fixed_mode = NULL;
>>  	struct drm_display_mode *downclock_mode = NULL;
>> +	struct drm_privacy_screen *privacy_screen;
>>  	bool has_dpcd;
>>  	enum pipe pipe = INVALID_PIPE;
>>  	struct edid *edid;
>> @@ -5308,6 +5310,14 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
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
>> +
>>  	return true;
>>  
>>  out_vdd_off:
>> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
>> index 146f7e39182a..d6913f567a1c 100644
>> --- a/drivers/gpu/drm/i915/i915_pci.c
>> +++ b/drivers/gpu/drm/i915/i915_pci.c
>> @@ -25,6 +25,7 @@
>>  #include <linux/vga_switcheroo.h>
>>  
>>  #include <drm/drm_drv.h>
>> +#include <drm/drm_privacy_screen_consumer.h>
>>  #include <drm/i915_pciids.h>
>>  
>>  #include "i915_drv.h"
>> @@ -1167,6 +1168,7 @@ static int i915_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>  {
>>  	struct intel_device_info *intel_info =
>>  		(struct intel_device_info *) ent->driver_data;
>> +	struct drm_privacy_screen *privacy_screen;
>>  	int err;
>>  
>>  	if (intel_info->require_force_probe &&
>> @@ -1195,7 +1197,17 @@ static int i915_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>  	if (vga_switcheroo_client_probe_defer(pdev))
>>  		return -EPROBE_DEFER;
>>  
>> +	/*
>> +	 * We do not handle -EPROBE_DEFER further into the probe process, so
>> +	 * check if we have a laptop-panel privacy-screen for which the driver
>> +	 * has not loaded yet here.
>> +	 */
>> +	privacy_screen = drm_privacy_screen_get(&pdev->dev, NULL);
>> +	if (IS_ERR(privacy_screen) && PTR_ERR(privacy_screen) == -EPROBE_DEFER)
>> +		return -EPROBE_DEFER;
>> +
>>  	err = i915_driver_probe(pdev, ent);
>> +	drm_privacy_screen_put(privacy_screen);
>>  	if (err)
>>  		return err;
> 
> Ideally, neither i915_pci_probe() nor i915_driver_probe() should assume
> we have display. We might not. We should not wait if we are never going
> to initialize display.

Good point.

> Alas, we'll only know after i915_driver_probe() ->
> i915_driver_mmio_probe() -> intel_device_info_runtime_init(), which
> modifies ->pipe_mask, which is the single point of truth. See
> HAS_DISPLAY().
> 
> We do have tests for failing probe at various points (see the
> i915_inject_probe_failure() calls) to stress the cleanup paths in
> CI. Part of the point was to prepare us for -EPROBE_DEFER returns.
> 
> Looks like the earliest/cleanest point for checking this is in
> intel_modeset_init_noirq(), i.e. first display init call. But I admit it
> gives me an uneasy feeling to return -EPROBE_DEFER at that stage.

Ack, this is why I added the get + put here. Theoretically I could also
just have put the return -EPROBE_DEFER inside intel_edp_init_connector()
(changing its return type) but I did not feel comfortable with doing
that...

I think that just leaving this functionally as is, with the refactor
which you suggest below is best for now. drm_privacy_screen_get() will
only return -EPROBE_DEFER if there is an entry in the lookup-table
which the drm_privacy class code keeps this lookup table matches
on the dev_name() of the GPU's PCI-device. So assuming the lookup
table contains the correct dev_name() then there should be no match
for any GPU-s without a display.

Note ATM this is not true since the lookup added for the thinkpad_acpi
providing privacy-screen support case specifies NULL as dev_name,
which gets interpreted as a wildcard, but I can easily replace that
with "0000:00:02.0" before pushing this out. Which at least avoids
delaying probing of any discrete Intel GPUs which I guess may not
have displays.

That does still leave the case of a hybrid GPU laptop where all
displays are connected to the discrete-GPU and the iGPU is only
left enabled for quick-sync functionality. But I'm not sure if
that case is even detected by HAS_DISPLAY(), since the hw then
still has display-pipes.

Worst case scenario here is that we delay i915 binding to the device
until thinkpad_acpi loads, which I think is not too bad.

Note a downside of replace the NULL devname in the lookup with
"0000:00:02.0" is that that will not work for hybrid-gfx laptops
with the panel connected to the discrete-GPU atm this is not supported
anyways since amdgpu and nouveau lack a patch similar to this one.

But the plan was for this to work automatically as soon as nouveau /
amdgpu get support assuming that e.g. only either i915 or nouveau would
see the LCD panel and thus would trigger the code in e.g.
intel_edp_init_connector().

But if you feel more comfortable about this if I change the dev_name
in the lookup to "0000:00:02.0" I can do that and we can cross the
hybrid-gfx case when we hit that. The whole need to tie a random
vendor ACPI interface for privacy-screen control together with the
drm-subsys is a bit messy anyways, so some of this we (I?) will need
to figure out as we go.

> The
> only -EPROBE_DEFER return we currently have is the vga switcheroo stuff
> you see in the patch context, and most platforms never return that.
> 
> Ville, I'd like to get your thoughts on that.
> 
> Anyway, even if we decide not to, err, defer returning -EPROBE_DEFER, I
> think we should abstract this better. For example, add a
> intel_modeset_probe_defer() function in intel_display.c that checks
> this, and call that as the first thing in i915_driver_probe(). Just to
> keep the display specific code out of the high level functions, even if
> that is functionally the same as what you're doing here.

I'm fine with refactoring this a bit and adding
an intel_modeset_probe_defer() helper for this, I assume I should also
move the vga_switcheroo_client_probe_defer(pdev) check there?

As you suggested yourself in your reply to the coverletter I will
push out the rest of the series to drm-misc-next while we figure this
out. Assuming Lyude is happy with the answers which I gave to her
remarks about some of the other patches.

Regards,

Hans

