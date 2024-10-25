Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE499B05FE
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 16:39:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC3B10EAFE;
	Fri, 25 Oct 2024 14:39:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="ns04SHnV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E2F110EAFE
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 14:39:03 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-6e5ef7527deso24744007b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 07:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729867142; x=1730471942;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Tc4kPOQhL2OagSAZ9YDSFTYJUNBKFYMP7fEoPaxIy5s=;
 b=ns04SHnVkJEfMs3INHvPAY6+9AcSvhruPTMr67fvIaAOpVNpREXaH9z/PC9stSotO4
 Mt6eMh/wvrb528euTzHytaTCozsUtzRPOBZ6D1kI/JNPzaH6WouN6kJ+VU7klFvGYiLI
 STwoN+nVDSrkOZqPq/AVVMeb/c+NDP7g1mPl5GtKsLj1a2mLg/SloSMDVAXEx8pZpcMk
 WXE2Q311pk6gWOuBjEMvfhyOB2B5kZ5orYVz7vxhh/jOWBDSRoz1smTPxNBwisAq8zoM
 5FuJeKTNMD7LKAldkSfj3uodtulcCfOFnZBmQguHUoKJO0Skbk/3CaznwnUm6kZ9RGJe
 kjMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729867142; x=1730471942;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tc4kPOQhL2OagSAZ9YDSFTYJUNBKFYMP7fEoPaxIy5s=;
 b=eugacEw9tDsiMThEEJoE6MFG/QKC+nL5gA3u1/DizeYNXAo5GRBifLXc5GAPZg97V5
 Vjd7nDJenjdhMcs93Y5xPJcEbP7IlGCanTcOX5oIhsG5eNUkJnp8WUxgu1VwSeMQfHad
 7m62NLS6/0zdrsELC1GdVv0H6YQwY5GeJ4ySHgqSm6bLSUDmAwdLWCKXaVpspihCB4nW
 S27slCrVktn7qzHqlfDv2BmcIm2pmpXyHWjhhefCQrtP2TOAKqa+/U7m/ceykIU+GfCe
 VFumvjB2I4vbN21jkZuEhqFPd7hxZ652P4zLKTumjeeniwH/Jl2kaSiMkpubUsjijv34
 dOpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVVaTOOZm/O5w4j5iJD28v/tNGOs/H6Z71BNvrVuwJZnm1WDmuE7YKsdSXO+A8eVYjDkV+NXRTWIM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjjyshYrk5U+C+6Ch/ZOi2qN+E9iSXo+2sjKMQpOoC5XqPggF3
 gy8HJ84Q3wGBLrFU/44Gom4mF8IMR1dkTHwGq8srjnFRxx8rYfuSDVHMAtoljwj4yQOApjRDjK2
 uK9MiQzAVTJBaXrvAo9GOstQldEvkd35YBhIxyQ==
X-Google-Smtp-Source: AGHT+IFxAItsjTJaj9GyQVCfFhS/Yw9A/3vDBIHW0sTyiVF9r+XnFLPd0I9guxhT4rJ5jwOK0Zcs2g7eiZsLCbaRuCk=
X-Received: by 2002:a05:690c:ecd:b0:6e5:e571:108b with SMTP id
 00721157ae682-6e7f0db9871mr117065797b3.8.1729867142326; Fri, 25 Oct 2024
 07:39:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAPY8ntDAMq_oTM+ua0pcFroTiWkDyhXSj++oGxOq+ODajm8++Q@mail.gmail.com>
 <3f35403e-f42f-4936-9297-68b56818aeee@gmx.net>
 <20241014-warm-savvy-wrasse-ed984e@houat>
 <CAPY8ntAFzT4uBT47kDnDjEcSZXLonV-n_ixZ6L1_LAcfQPwS8Q@mail.gmail.com>
 <17f8f497-1238-4555-824b-b5a3fb699a98@gmx.net>
 <CAPY8ntBegA_L58s30F4FSO+=q78Xt5XA4kvYq38zAvsgR2DSrQ@mail.gmail.com>
 <6465bac6-9841-4f38-b9e1-48e236ada910@gmx.net>
 <CAPY8ntCzg-2vCuX0uaRD1kK5=qhH79hmtvQc=g44bD5iGwi7_w@mail.gmail.com>
 <20241017-kickass-agile-boa-dd5cd3@houat>
 <974f9525-76da-4b3a-ba94-6ac68fc542be@gmx.net>
 <20241017-icy-speedy-okapi-bebdfa@houat>
 <9957cd8b-cd6d-4fbd-a78f-d25814b68e1e@gmx.net>
 <CAPY8ntA+adGy3kkDnGUd1REpMc0f5zQD-9HPDTQfd6KUaUSfNw@mail.gmail.com>
 <5799c03b-19d6-4791-9fef-1538ecd9a4be@gmx.net>
In-Reply-To: <5799c03b-19d6-4791-9fef-1538ecd9a4be@gmx.net>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 15:38:46 +0100
Message-ID: <CAPY8ntAxjGKBKPbpH0UzG1b4H478MNXAcgGi+F4c2f5zOzigxQ@mail.gmail.com>
Subject: Re: vc4: HDMI Sink doesn't support RGB, something's wrong.
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Florian Fainelli <florian.fainelli@broadcom.com>
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

On Fri, 25 Oct 2024 at 14:36, Stefan Wahren <wahrenst@gmx.net> wrote:
>
> Hi Dave,
>
> Am 23.10.24 um 17:22 schrieb Dave Stevenson:
> > On Sat, 19 Oct 2024 at 10:34, Stefan Wahren <wahrenst@gmx.net> wrote:
> >> Hi,
> >>
> >> Am 17.10.24 um 17:59 schrieb Maxime Ripard:
> >>> On Thu, Oct 17, 2024 at 05:26:46PM GMT, Stefan Wahren wrote:
> >>>> Am 17.10.24 um 16:27 schrieb Maxime Ripard:
> >>>>> On Wed, Oct 16, 2024 at 07:16:43PM GMT, Dave Stevenson wrote:
> >>>>>> Hi Stefan
> >>>>>>
> >>>>>> On Tue, 15 Oct 2024 at 22:13, Stefan Wahren <wahrenst@gmx.net> wrote:
> >>>>>>> Hi Dave,
> >>>> ...
> >>>>>>> i prepared a branch for you, which contains the latest suspend2idle patches:
> >>>>>>>
> >>>>>>> https://github.com/lategoodbye/linux-dev/commits/v6.12-pm/
> >>>>>>>
> >>>>>>> Steps:
> >>>>>>> 1. Flash latest Raspberry Pi OS (32 bit) on SD card
> >>>>>>> 2. Build Kernel from repo above with arm/multi_v7_defconfig
> >>>>>>> 3. Replace Kernel, modules + DTB on SD card with build ones
> >>>>>>> 4. add the following to confix.txt
> >>>>>>> device_tree=bcm2837-rpi-3-b-plus.dtb
> >>>>>>> enable_uart=1
> >>>>>>> 5. change/add the following to cmdline.txt
> >>>>>>> console=ttyS1,115200
> >>>>>>> no_console_suspend=1
> >>>>>>> 6. connect the following devices to Raspberry Pi 3 B+ :
> >>>>>>> USB mouse
> >>>>>>> USB keyboard
> >>>>>>> HDMI monitor
> >>>>>>> Debug UART adapter (USB side to PC)
> >>>>>>> 7. Power on board and boot into X11
> >>>>>>> 8. Change to root
> >>>>>>> 9. Enable wakeup for ttyS1
> >>>>>> So I remember for next time
> >>>>>> echo enabled > /sys/class/tty/ttyS1/power/wakeup
> >>>>>>
> >>>>>>> 10. Trigger suspend to idle via X11 (echo freeze > /sys/power/state)
> >>>>>>> 11. Wakeup Raspberry Pi via Debug UART
> >>>>>> I don't get the error you are seeing, but I also don't get the display resuming.
> >>>>>> pm has obviously killed the power to the HDMI block, and it has the
> >>>>>> reset values in as can be seen via /sys/kernel/debug/dri/0/hdmi_regs.
> >>>>>> Nothing in the driver restores these registers, and I'm not sure if it
> >>>>>> is meant to do so.
> >>>>>> Run kmstest or similar from this state and the change of mode
> >>>>>> reprogrammes the blocks so we get the display back again.
> >>>>>>
> >>>>>> I've also enabled CONFIG_DRM_LOAD_EDID_FIRMWARE so that I can use your
> >>>>>> EDID, and get the same results.
> >>>>>>
> >>>>>> Knee-capping the HDMI block on suspend seems an unlikely mechanism to
> >>>>>> work reliably. On the more recent Pis there is a need to be quite
> >>>>>> careful in disabling the pipeline to avoid getting data stuck in
> >>>>>> FIFOs.
> >>>>>> I feel I must be missing something here.
> >>>>> I think we're probably missing calls to drm_mode_config_helper_suspend and
> >>>>> drm_mode_config_helper_resume.
> >>>> Okay, i tried this and it works better (HDMI resumes fast), but it also
> >>>> triggers a lot of WARN
> >>> vc4_plane_reset deviates from the helper there:
> >>> https://elixir.bootlin.com/linux/v6.11.3/source/drivers/gpu/drm/drm_atomic_state_helper.c#L326
> >>>
> >>> We should adjust it.
> >>>
> >>>> and the "doesn't support RGB ..." warnings are still there.
> >>>>
> >>>> I pushed my changes to the branch and attached the dmesg output.
> >>> I can't help you there, it doesn't make sense to me. The EDID should be correct.
> >> Maybe I should clarify that I provided the EDID from the X11 log during
> >> normal boot (good case). I wasn't aware how to dump the EDID during the
> >> suspend.
> >>
> >> I tested with the new branch and these warning doesn't always occurs
> >> during resume. So it seems to be timing related.
> >>
> >> AFAIU the EDID is read via I2C DDC and the attached clock in this case
> >> is VPU clock. Correct?
> > Yes. It's derived from the core clock, which is often referred to as
> > the VPU clock.
> >
> >> So I added the following to the config.txt
> >>
> >> force_turbo=1
> >>
> >> After that I wasn't able to reproduce these HDMI Sink warnings.
> >>
> >> Is it possible that the I2C data get corrupted by VPU clock changes?
> > It shouldn't, but that doesn't mean that the monitor doesn't like the
> > clock change. It should never exceed the 100kHz rate that the HDMI/DVI
> > spec states (HDMI v1.4 spec section 8.4.1).
> >
> > If you set drm module parameter "debug" to 0x04, then DRM should log
> > the hotplug handling and EDID parsing in the kernel log.
> > The HDMI spec does say that the HDMI sink (ie monitor) can clock
> > stretch the DDC transaction. It doesn't state a maximum amount of time
> > that it can stretch for, and most I2C drivers will time out
> > transactions after some period. The DRM logging would probably show
> > something under these conditions though.
> I reproduced it with drm.debug=0x4 [1]. The issue occured 3 times after
> 216.395170.
>
> Not sure this is helpful.
>
> Best regards
>
> [1] - https://pastebin.com/TCPqXmpa

Based on that log I think your force_turbo=1 is a red-herring, or at
least needs further investigation.

Is this on a 3B, or 3B+?

Snippets from your log as we resume:

[  216.797764] PM: suspend exit
[  216.800473] lan78xx 1-1.1.1:1.0 eth0: Link is Down
[  216.804503] vc4-drm soc:gpu:
[drm:drm_helper_probe_single_connector_modes] [CONNECTOR:33:HDMI-A-1]
[  216.804584] vc4-drm soc:gpu:
[drm:drm_helper_probe_single_connector_modes] [CONNECTOR:33:HDMI-A-1]
status updated from connected to disconnected
[  216.804648] vc4-drm soc:gpu:
[drm:drm_helper_probe_single_connector_modes] [CONNECTOR:33:HDMI-A-1]
disconnected
- So hotplug has signalled disconnected
...
[  216.816990] vc4-drm soc:gpu: [drm:drm_mode_setcrtc] [CONNECTOR:33:HDMI-A-1]
[  216.817079] vc4-drm soc:gpu:
[drm:drm_atomic_helper_connector_hdmi_check] Trying with a 8 bpc
output
[  216.817107] vc4-drm soc:gpu:
[drm:drm_atomic_helper_connector_hdmi_check] Trying RGB output format
[  216.817166] vc4-drm soc:gpu:
[drm:drm_atomic_helper_connector_hdmi_check] RGB Format, checking the
constraints.
[  216.817186] vc4-drm soc:gpu: [drm] HDMI Sink doesn't support RGB,
something's wrong.
- This is correct as the output is disconnected
...
[  227.075847] vc4-drm soc:gpu: [drm:update_display_info.part.0]
[CONNECTOR:33:HDMI-A-1] HDMI: DVI dual 0, max TMDS clock 0 kHz
[  227.075912] vc4-drm soc:gpu: [drm:update_display_info.part.0]
[CONNECTOR:33:HDMI-A-1] ELD monitor HP ZR2440w
[  227.075942] vc4-drm soc:gpu: [drm:update_display_info.part.0]
[CONNECTOR:33:HDMI-A-1] HDMI: latency present 0 0, video latency 0 0,
audio latency 0 0
[  227.075971] vc4-drm soc:gpu: [drm:update_display_info.part.0]
[CONNECTOR:33:HDMI-A-1] ELD size 36, SAD count 1
[  227.076014] vc4-drm soc:gpu: [drm:output_poll_execute]
[CONNECTOR:33:HDMI-A-1] status updated from disconnected to connected
[  227.076040] vc4-drm soc:gpu: [drm:output_poll_execute]
[CONNECTOR:33:HDMI-A-1] epoch counter 3 -> 4
[  227.076072] vc4-drm soc:gpu: [drm:drm_sysfs_hotplug_event]
generating hotplug event
[  227.076170] vc4-drm soc:gpu: [drm:drm_client_dev_hotplug] fbdev: ret=0
- We now get a connect again.

The 10 second interval is why I'm suspecting you're on a 3B - we have
no interrupts for the GPIO used there (expgpio 4), whereas we do on
3B+ (gpio 28). The poll period is 10seconds in the absence of
interrupts.

On that suspend you were suspended for 16 seconds. Previous suspends
were for 9 and 12 seconds.

I suspect your monitor goes to sleep at around 15 seconds and is doing
things to hotplug at that point.
We've seen it on a couple of monitors here, and with Wayfire or labwc
it can wake the display back up again. We haven't come up with a good
solution to that one yet other than just ignoring hotplug.

  Dave
