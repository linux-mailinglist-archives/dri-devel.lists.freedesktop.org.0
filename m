Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B822A926561
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 17:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F18810E921;
	Wed,  3 Jul 2024 15:59:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="k67rDDeX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C8110E921
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 15:59:07 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-e034694b525so598592276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2024 08:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1720022346; x=1720627146;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AzVnxmrPhsGH+MV5zEtWgqYRuXmnHJ2NW9xRAWbg94o=;
 b=k67rDDeXXLRUpzyEvfTp7DO0mKp8Q8K/hY66eewwa76HAXtLGPtCbvqoYLu58KtVAt
 brFeIGTtLE5HhVvzuAx55AjnzD+gBdvRzPPLWQsXJWvljfZb0UWl8CA+abi14KJTY1ah
 c+T15/UaXT3GEWRqqHEaXDfPl4Lm/nSi6szZ01SsfHo4FY+hL3OBZlbP5SjEbQI7hvUU
 gPnMLbR6RIMfnPpbj1Vez0VzloXfqy9oGBsKRjJJWkgIIDoA6QK4Dt55+m8E1gEL/hrw
 PGxP7FgULLtmm+khuA1AXbC7Ptg8p3S0RL9d1JMPaAS8JxpuGXE4YQUYbA54duasxv0N
 7uBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720022346; x=1720627146;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AzVnxmrPhsGH+MV5zEtWgqYRuXmnHJ2NW9xRAWbg94o=;
 b=Eu8UNMslD/khKP91Ccrtq6s/nycGIqlWRg60Hb8dcZjdndEhfEr47VXNaEtr2g2ssY
 OwEHjR75XkO9HbJJd40ZRq8mj/o6ouV727SgQhp7EIHbCQszoPiaY2KnZb/KVHUk801/
 d5AAfaO2Kqr8sKICO9EKsdUcC+U8XE9NaiPYDeQ66yMB0MgxzloqPFib62aPkwCS7Cbi
 9hC4AinL1bbGgo9hzbxHDW9ZOBZnEcB6//FmT8lsCt7AVVHgrds9XL6AuTcGI6KfXrPZ
 4pHOyIJYGIOyzz2lhTDtDPI1+DiUw/qtuvDZlSm7E2sSWWkRRpZg998JQ5MgFaVOzAVP
 GCAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWgiMHw44lh5p78GDbjCMXKsujx2yRPiskX+vsVc//XJGg84OPxQ+IWEjPSHjW+asbdiz/nxkjgxKmNybQgetsjS5MUL7PwQ6R7ry9Hv+k
X-Gm-Message-State: AOJu0Yx6lCRlnHlGaSIFyrmEbE99z2b+KtQRlQydvzGHgFWo15lRhzFU
 gyW1r6M5h5VJwQznQ4VwEPhHy+f/gM/fndT0bIENFvmLlZPyZgTof7AGVHwP/1Y85UsQuzz/8iH
 n6qjqq3nBkO19m/W621Joi4zM2+YTlUPC1Vna6Q==
X-Google-Smtp-Source: AGHT+IGqCViiKmmK3QRMAQYZrLMjCIwJNQ8NdAg3wRUVNKBTDZnLrc4qjCCOWQvlXVuWYKuWOAPNETjht013Knj8XzI=
X-Received: by 2002:a25:9105:0:b0:e03:5372:6b1a with SMTP id
 3f1490d57ef6-e03ad927492mr1348985276.20.1720022346289; Wed, 03 Jul 2024
 08:59:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240630153652.318882-1-wahrenst@gmx.net>
 <20240630153652.318882-8-wahrenst@gmx.net>
 <20240702-qualified-archetypal-worm-416a2f@houat>
 <b4295be1-6fa4-4118-8554-b8a7cc605f9d@gmx.net>
 <7e3d4769-bd9c-47e8-bac2-9245b08866c3@gmx.net>
In-Reply-To: <7e3d4769-bd9c-47e8-bac2-9245b08866c3@gmx.net>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 3 Jul 2024 16:58:49 +0100
Message-ID: <CAPY8ntDg_cqqN4TmQPNiULVS-Fw0uOx8Ut-VCro56_-FTALeQg@mail.gmail.com>
Subject: Re: [PATCH 07/11] drm/vc4: hdmi: Disable connector status polling
 during suspend
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Maxime Ripard <mripard@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Minas Harutyunyan <hminas@synopsys.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lukas Wunner <lukas@wunner.de>, 
 Peter Robinson <pbrobinson@gmail.com>, dri-devel@lists.freedesktop.org, 
 bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel-list@raspberrypi.com
Content-Type: text/plain; charset="UTF-8"
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

Hi Stefan

On Wed, 3 Jul 2024 at 16:32, Stefan Wahren <wahrenst@gmx.net> wrote:
>
> Am 03.07.24 um 12:28 schrieb Stefan Wahren:
> > Hi Maxime,
> >
> > Am 02.07.24 um 15:48 schrieb Maxime Ripard:
> >> Hi,
> >>
> >> On Sun, Jun 30, 2024 at 05:36:48PM GMT, Stefan Wahren wrote:
> >>> Suspend of VC4 HDMI will likely triggers a warning from
> >>> vc4_hdmi_connector_detect_ctx() during poll of connector status.
> >>> The power management will prevent the resume and keep the relevant
> >>> power domain disabled.
> >>>
> >>> Since there is no reason to poll the connector status during
> >>> suspend, the polling should be disabled during this.
> >>>
> >>> It not possible to use drm_mode_config_helper_suspend() here,
> >>> because the callbacks might be called during bind phase and not all
> >>> components are fully initialized.
> >>>
> >>> Link:
> >>> https://lore.kernel.org/dri-devel/7003512d-7303-4f41-b0d6-a8af5bf8e497@gmx.net/
> >>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> >>> ---
> >>>   drivers/gpu/drm/vc4/vc4_hdmi.c | 11 +++++++++++
> >>>   1 file changed, 11 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c
> >>> b/drivers/gpu/drm/vc4/vc4_hdmi.c
> >>> index b3a42b709718..e80495cea6ac 100644
> >>> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> >>> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> >>> @@ -3106,6 +3106,13 @@ static int vc5_hdmi_init_resources(struct
> >>> drm_device *drm,
> >>>   static int vc4_hdmi_runtime_suspend(struct device *dev)
> >>>   {
> >>>       struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
> >>> +    struct drm_device *drm = vc4_hdmi->connector.dev;
> >>> +
> >>> +    /*
> >>> +     * Don't disable polling if it was never initialized
> >>> +     */
> >>> +    if (drm && drm->mode_config.poll_enabled)
> >>> +        drm_kms_helper_poll_disable(drm);
> >> Does it make sense to add it to runtime_suspend?
> > i saw that other drm drivers used drm_mode_config_helper_suspend() in
> > the RUNTIME_PM_OPS. But i agree, it should be better moved to
> > SYSTEM_SLEEP_PM_OPS.
> >> What if the board boots without a display connected, and only after a
> >> while one is connected? Wouldn't that prevent the driver from detecting
> >> it?
> > tbh I noticed that HDMI re-detection didn't worked in my setup
> > 6.10-rcX before this series. I need to investigate ...
> Okay, this patch breaks definitely HDMI re-detection. So please ignore
> this patch. Sorry, about this mess.
>
> There is another minor issue which already exists before that cause the
> following log entry on HDMI reconnect:
>
> [   74.078745] vc4-drm soc:gpu: [drm] User-defined mode not supported:
> "1920x1200": 60 154000 1920 1968 2000 2080 1200 1203 1209 1235 0x68 0x9
>
> But in this case HDMI works.

That's saying the mode specified on the kernel command line via
"video=" is invalid. All other modes enumerated from the EDID should
still be present.

I don't immediately see anything wrong with the mode - it's just DMT
mode 0x44 aka 1920x1200@60Hz with reduced blanking. 154MHz clock is
less than the 162MHz limit for Pi0-3 so should be supported.
Setting the module parameter drm.debug to 0x4 should give you the
extra debug of the reason the mode was rejected via the log message at
[1].

At a guess the firmware has inserted the video= line based on the mode
it configured. Whilst that was useful, we've moved away from that now
by setting "disable_fw_kms_setup=1" in config.txt.

  Dave

[1] https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/drm_modes.c#L1815-L1816

> Regards
> >>
> >> Maxime
> >
>
