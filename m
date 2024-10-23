Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE6B9ACE93
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 17:23:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2019F10E80B;
	Wed, 23 Oct 2024 15:23:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Ppf50JkF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E2FF10E80B
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 15:22:59 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-6e35fb3792eso69438037b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 08:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729696978; x=1730301778;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1wIAUWiQJFbl3JJUpj3CluZYI4nD0/WrALu13xFebT0=;
 b=Ppf50JkFIaGqUMNXMLa7dBhwi7xR+nGLOSd+WvIS7OTREnyUQZqXgZUCycQQ+Ek3V4
 gxL6mB7zvbUI08MJ7TVmcw2g5yESdybOtMSfP52FwIjlasEtzaw56MgGO9ckAzhURDuo
 EwFyCtU0RbXwVzhRSMBbiwP9OF/rvX8hGEcdCW+DvVYpUGW0clV1VMjhQ6KXZ8PjjHQD
 Sh4VYPGm6RnQWBAa45sb/WMXCRS+11ajUz5pxGWLXSJAG72w5hUSo2OhemKoDFyDasH1
 tx6YKY6Z93ZWpX/l4wSQX+L2shbVwqYrj/3DCNzN1n8d6Z0aWdFd2txvWnZMM5xfYw5J
 tMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729696978; x=1730301778;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1wIAUWiQJFbl3JJUpj3CluZYI4nD0/WrALu13xFebT0=;
 b=iyms+M+tscP4Ae9acIZ2kJgZFcnvQDuReFXsBsZWnY6EO2rtpu53YggGhqSojqKLik
 jECLXbped7gGQytC9SmTGEk7cd1sZD3JDBvUrErbHHaDKwZerrZdoO7/oH6SGjTtDRcb
 koDnX/9Bx0XNH6yImu0Hm++ABQzyf3NWxouOK3KqEKG4t6L2Hgpr7gXQrAAcXYDRTyTy
 2rsOB7A3z/wFOsAoHm5zSdtPlrtA4DQUWo2UyH3N+qS1oEjLN4bRVPKC8vLnGGSpr/Au
 K/Duyfhlo/+fMi0pSbcxFQcq3CgGNNtNTmtiStVGXN1wKEI/6K8AFIxE+V9jslbmLCPV
 ZdXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUXHg3PN3zc8QvoGa7ZzaZdZeRmlGGREc0Lh/oEE07tdHRPCzL7TiNQVNXPyIOmPYLroop9QgHkTU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzi48q+AeOHnL/GEtFZdsNxg1/WF2e2nGyBQ8CbVN5r61Rl0W/z
 JJPPGcwxwLlojpAKUaIY5Gl7kTZkuI9wDGMN8WQDwpOjtWGUfICU47OdfHhJQ4PCe7vh2JkGSsq
 ZJttmKPkkgDIrDSjoStwbhAOiWBp1eIKulfj25Q==
X-Google-Smtp-Source: AGHT+IHLPfkgpIzmeX+fNvL+Ec7qidVgvcnf+ivPfa/B5DHsZtweH/1w3Z+SAuGZ5wv0Pl5umDZe3LGupSc+Y+KUkX8=
X-Received: by 2002:a05:690c:6a02:b0:6db:c847:c8c5 with SMTP id
 00721157ae682-6e7f0e3ea38mr34711827b3.16.1729696978556; Wed, 23 Oct 2024
 08:22:58 -0700 (PDT)
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
In-Reply-To: <9957cd8b-cd6d-4fbd-a78f-d25814b68e1e@gmx.net>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 16:22:41 +0100
Message-ID: <CAPY8ntA+adGy3kkDnGUd1REpMc0f5zQD-9HPDTQfd6KUaUSfNw@mail.gmail.com>
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

On Sat, 19 Oct 2024 at 10:34, Stefan Wahren <wahrenst@gmx.net> wrote:
>
> Hi,
>
> Am 17.10.24 um 17:59 schrieb Maxime Ripard:
> > On Thu, Oct 17, 2024 at 05:26:46PM GMT, Stefan Wahren wrote:
> >> Am 17.10.24 um 16:27 schrieb Maxime Ripard:
> >>> On Wed, Oct 16, 2024 at 07:16:43PM GMT, Dave Stevenson wrote:
> >>>> Hi Stefan
> >>>>
> >>>> On Tue, 15 Oct 2024 at 22:13, Stefan Wahren <wahrenst@gmx.net> wrote:
> >>>>> Hi Dave,
> >> ...
> >>>>> i prepared a branch for you, which contains the latest suspend2idle patches:
> >>>>>
> >>>>> https://github.com/lategoodbye/linux-dev/commits/v6.12-pm/
> >>>>>
> >>>>> Steps:
> >>>>> 1. Flash latest Raspberry Pi OS (32 bit) on SD card
> >>>>> 2. Build Kernel from repo above with arm/multi_v7_defconfig
> >>>>> 3. Replace Kernel, modules + DTB on SD card with build ones
> >>>>> 4. add the following to confix.txt
> >>>>> device_tree=bcm2837-rpi-3-b-plus.dtb
> >>>>> enable_uart=1
> >>>>> 5. change/add the following to cmdline.txt
> >>>>> console=ttyS1,115200
> >>>>> no_console_suspend=1
> >>>>> 6. connect the following devices to Raspberry Pi 3 B+ :
> >>>>> USB mouse
> >>>>> USB keyboard
> >>>>> HDMI monitor
> >>>>> Debug UART adapter (USB side to PC)
> >>>>> 7. Power on board and boot into X11
> >>>>> 8. Change to root
> >>>>> 9. Enable wakeup for ttyS1
> >>>> So I remember for next time
> >>>> echo enabled > /sys/class/tty/ttyS1/power/wakeup
> >>>>
> >>>>> 10. Trigger suspend to idle via X11 (echo freeze > /sys/power/state)
> >>>>> 11. Wakeup Raspberry Pi via Debug UART
> >>>> I don't get the error you are seeing, but I also don't get the display resuming.
> >>>> pm has obviously killed the power to the HDMI block, and it has the
> >>>> reset values in as can be seen via /sys/kernel/debug/dri/0/hdmi_regs.
> >>>> Nothing in the driver restores these registers, and I'm not sure if it
> >>>> is meant to do so.
> >>>> Run kmstest or similar from this state and the change of mode
> >>>> reprogrammes the blocks so we get the display back again.
> >>>>
> >>>> I've also enabled CONFIG_DRM_LOAD_EDID_FIRMWARE so that I can use your
> >>>> EDID, and get the same results.
> >>>>
> >>>> Knee-capping the HDMI block on suspend seems an unlikely mechanism to
> >>>> work reliably. On the more recent Pis there is a need to be quite
> >>>> careful in disabling the pipeline to avoid getting data stuck in
> >>>> FIFOs.
> >>>> I feel I must be missing something here.
> >>> I think we're probably missing calls to drm_mode_config_helper_suspend and
> >>> drm_mode_config_helper_resume.
> >> Okay, i tried this and it works better (HDMI resumes fast), but it also
> >> triggers a lot of WARN
> > vc4_plane_reset deviates from the helper there:
> > https://elixir.bootlin.com/linux/v6.11.3/source/drivers/gpu/drm/drm_atomic_state_helper.c#L326
> >
> > We should adjust it.
> >
> >> and the "doesn't support RGB ..." warnings are still there.
> >>
> >> I pushed my changes to the branch and attached the dmesg output.
> > I can't help you there, it doesn't make sense to me. The EDID should be correct.
> Maybe I should clarify that I provided the EDID from the X11 log during
> normal boot (good case). I wasn't aware how to dump the EDID during the
> suspend.
>
> I tested with the new branch and these warning doesn't always occurs
> during resume. So it seems to be timing related.
>
> AFAIU the EDID is read via I2C DDC and the attached clock in this case
> is VPU clock. Correct?

Yes. It's derived from the core clock, which is often referred to as
the VPU clock.

> So I added the following to the config.txt
>
> force_turbo=1
>
> After that I wasn't able to reproduce these HDMI Sink warnings.
>
> Is it possible that the I2C data get corrupted by VPU clock changes?

It shouldn't, but that doesn't mean that the monitor doesn't like the
clock change. It should never exceed the 100kHz rate that the HDMI/DVI
spec states (HDMI v1.4 spec section 8.4.1).

If you set drm module parameter "debug" to 0x04, then DRM should log
the hotplug handling and EDID parsing in the kernel log.
The HDMI spec does say that the HDMI sink (ie monitor) can clock
stretch the DDC transaction. It doesn't state a maximum amount of time
that it can stretch for, and most I2C drivers will time out
transactions after some period. The DRM logging would probably show
something under these conditions though.

  Dave
