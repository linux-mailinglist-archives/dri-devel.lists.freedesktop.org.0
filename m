Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6C49B0A67
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 18:57:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8017410EB21;
	Fri, 25 Oct 2024 16:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Fepig00q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B394010EB21
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 16:57:02 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-e2e2d013f2dso2581843276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 09:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729875421; x=1730480221;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PjF6qC/uxQpFvYbT09FRhTD58OiFCux3UqjKg1dq3N8=;
 b=Fepig00qnWOQGnGpS+CMOd1o6WGte/8ImFOMovx+l+XcUgrhNc9p88JrwlcyBEXZKR
 cbCXnjTE1TRicBklpFVhGmP8TyM9nQhbHjGlZqW2IPYsTnswWg3ZRh80SwacX3kLvyC/
 RSPHi+BtAgI3vmuqpuYiPLJotfE6lQy5IV2malEyikfP81HRyPQVxDNBozFaPCatT830
 XWZdT8W43YlTD9LjIpxUkLzt2Y68P8KmnmG8pYr+Jf2zKboo8C7K8r+txFsHhzWhg0JH
 eR+lSG1a9fTtmEGp4dVLr7q+RLXvm7UxRjTvW7lBDTZTcOrIp8fCfxyW/Qf6GUhWNp9V
 FM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729875421; x=1730480221;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PjF6qC/uxQpFvYbT09FRhTD58OiFCux3UqjKg1dq3N8=;
 b=EnvPlr39DBKClO10BQCrgsT95qgJNrSiSpHl2U8POIeJHgxQQPhPSNctAX7FWKBdMo
 BRpZpY8UBzWz2YsS65Bysm5Yf6f/rz6w5P1KLNMnCVfxwM7xjvKPCeGosVhmSAJRISrV
 vkSGgW0lbyqGGub2RB+Qk1F780hX6hm1scekM/RKCyFZiAB2zqusiw/DVhae7vEy57rN
 kKLHqRMaVfzXpQwK8nNFj6dQrfSdHjQPjadKqeOGRCZDt+pLPwv2gp3pprSvAFvSaNLz
 KGNAvRwziVsOydiqau0ts4jo0lQM5R3NN0BcLtxXLAl6KSjrIdovL4dJ3vvOmho5GRAe
 EznA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVT5FSBqho3E6sijtzTzLOhPYTPTsqmrxlJA9Qe82uDygB5Z+bQrD0APS0bXrA2VqzAk5K7Q+hS9sY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzixFgXBdy0GAyaIA4CKXWckoTzIZjWePVH2r8XkebK8P8kDUbE
 gn8Dlxp7UWR4Xq3mJ39hksqR8ndldqbmAG5ShlnHokBv5XBANXZwIzplu+fKgnVgE5Sr4pA2kY9
 cW02jjONKckEpzp8Pdl0pIQxfxIhbkMCoAvkHdw==
X-Google-Smtp-Source: AGHT+IH5zp0orh6qTXHUAddrglCdDV1JHN9mY5/rBtRRAgYgwgqDkgMJo4BxozF+48gP7nXqAU53q9biUOCB4UyNSfk=
X-Received: by 2002:a05:690c:7446:b0:6e3:f6f:5b7f with SMTP id
 00721157ae682-6e9d89cb0f3mr3153577b3.19.1729875420146; Fri, 25 Oct 2024
 09:57:00 -0700 (PDT)
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
 <CAPY8ntAxjGKBKPbpH0UzG1b4H478MNXAcgGi+F4c2f5zOzigxQ@mail.gmail.com>
 <0804b147-5048-4d2d-b1a2-0e5a7db2b892@gmx.net>
In-Reply-To: <0804b147-5048-4d2d-b1a2-0e5a7db2b892@gmx.net>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 17:56:42 +0100
Message-ID: <CAPY8ntBwWeTRmys_ZHTAtr4fNpf5hWhvWeM6uZH=H3udB+PCSw@mail.gmail.com>
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

On Fri, 25 Oct 2024 at 17:31, Stefan Wahren <wahrenst@gmx.net> wrote:
>
> Hi Dave,
>
> Am 25.10.24 um 16:38 schrieb Dave Stevenson:
> > Hi Stefan
> >
> > On Fri, 25 Oct 2024 at 14:36, Stefan Wahren <wahrenst@gmx.net> wrote:
> ...
> > Based on that log I think your force_turbo=1 is a red-herring, or at
> > least needs further investigation.
> >
> > Is this on a 3B, or 3B+?
> Definitely a 3B+ from the year 2017 (mainline devicetree)
> >
> > Snippets from your log as we resume:
> >
> > [  216.797764] PM: suspend exit
> > [  216.800473] lan78xx 1-1.1.1:1.0 eth0: Link is Down
> AFAIK only the 3B+ has a Microchip LAN7800

Absolutely right. I was heading down the wrong track there.

> > [  216.804503] vc4-drm soc:gpu:
> > [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:33:HDMI-A-1]
> > [  216.804584] vc4-drm soc:gpu:
> > [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:33:HDMI-A-1]
> > status updated from connected to disconnected
> > [  216.804648] vc4-drm soc:gpu:
> > [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:33:HDMI-A-1]
> > disconnected
> > - So hotplug has signalled disconnected
> > ...
> > [  216.816990] vc4-drm soc:gpu: [drm:drm_mode_setcrtc] [CONNECTOR:33:HDMI-A-1]
> > [  216.817079] vc4-drm soc:gpu:
> > [drm:drm_atomic_helper_connector_hdmi_check] Trying with a 8 bpc
> > output
> > [  216.817107] vc4-drm soc:gpu:
> > [drm:drm_atomic_helper_connector_hdmi_check] Trying RGB output format
> > [  216.817166] vc4-drm soc:gpu:
> > [drm:drm_atomic_helper_connector_hdmi_check] RGB Format, checking the
> > constraints.
> > [  216.817186] vc4-drm soc:gpu: [drm] HDMI Sink doesn't support RGB,
> > something's wrong.
> > - This is correct as the output is disconnected
> > ...
> > [  227.075847] vc4-drm soc:gpu: [drm:update_display_info.part.0]
> > [CONNECTOR:33:HDMI-A-1] HDMI: DVI dual 0, max TMDS clock 0 kHz
> > [  227.075912] vc4-drm soc:gpu: [drm:update_display_info.part.0]
> > [CONNECTOR:33:HDMI-A-1] ELD monitor HP ZR2440w
> > [  227.075942] vc4-drm soc:gpu: [drm:update_display_info.part.0]
> > [CONNECTOR:33:HDMI-A-1] HDMI: latency present 0 0, video latency 0 0,
> > audio latency 0 0
> > [  227.075971] vc4-drm soc:gpu: [drm:update_display_info.part.0]
> > [CONNECTOR:33:HDMI-A-1] ELD size 36, SAD count 1
> > [  227.076014] vc4-drm soc:gpu: [drm:output_poll_execute]
> > [CONNECTOR:33:HDMI-A-1] status updated from disconnected to connected
> > [  227.076040] vc4-drm soc:gpu: [drm:output_poll_execute]
> > [CONNECTOR:33:HDMI-A-1] epoch counter 3 -> 4
> > [  227.076072] vc4-drm soc:gpu: [drm:drm_sysfs_hotplug_event]
> > generating hotplug event
> > [  227.076170] vc4-drm soc:gpu: [drm:drm_client_dev_hotplug] fbdev: ret=0
> > - We now get a connect again.
> >
> > The 10 second interval is why I'm suspecting you're on a 3B - we have
> > no interrupts for the GPIO used there (expgpio 4), whereas we do on
> > 3B+ (gpio 28). The poll period is 10seconds in the absence of
> > interrupts.
> gpiochip0 - 54 lines:
>      line   0:     "ID_SDA"       unused   input  active-high
>      line   1:     "ID_SCL"       unused   input  active-high
>      line   2:       "SDA1"       unused   input  active-high
>      line   3:       "SCL1"       unused   input  active-high
> ...
>      line  27:     "GPIO27"       unused   input  active-high
>      line  28: "HDMI_HPD_N"        "hpd"   input   active-low [used]
>      line  29: "STATUS_LED_G" "ACT" output active-high [used]
>      line  30:       "CTS0"       unused   input  active-high

In which case I'm totally bemused by the significant delay.
I'm not aware of any path in the software that can create this effect,
so it would point to the connected device (ie HDMI switch).

> Sorry, I missed a possible important information. The Raspberry Pi 3B+
> is not directly connected to the display. There is a passive Logilink
> HDMI switch in between.

Is it truly passive? That's unusual for anything handling high
bandwidth signals such as HDMI. Have you got a product link?
There is a low current 5V supply available from all HDMI sources
(intended for the EDID EEPROM) which can power some of these devices.

We have also seen KVM switches do odd things when they lose the input
signal, as they try to find another active input.

> > On that suspend you were suspended for 16 seconds. Previous suspends
> > were for 9 and 12 seconds.
> I waited 20 seconds multiple times with and without force_hdmi and
> wasn't able to reproduce it more reliable. But I agree this not a prove.
>
> Maybe this is caused by the HDMI switch. At the end this is not
> critical. My only concern was that this is an in suspend/resume handling.
>
> I will try need to investigate this ...Thanks for your help. Stefan

No problem. I'm interested in solving this one too.

  Dave
