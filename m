Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6609C7B5E
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 19:39:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C02210E171;
	Wed, 13 Nov 2024 18:39:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="NEZxfXm7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC16810E171
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 18:39:47 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-e290200a560so7095169276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 10:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1731523187; x=1732127987;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=d9VsrezUF3jCjGiqVk3cTbgG/ieR0vfE3u6iRusNkaI=;
 b=NEZxfXm7apPpDLfdAyOFiLtWY7QJc/58++ZLMo3RZ+lCsoPrdksp3zW5gL7sc6iGuj
 dpLui8u1yyOVmx8EBaprfqRxJriPWEoJ3bDEZEsZ8sIkdR960C9Ky5xIv5Z9MZwal1x0
 oQRs3LA6tuFv1IUQ1TngWyftMMwHw5qmJlNvTmjOAq6Td7dL9GGl+2cJUHLPW/Qv+zFz
 RyltAopp9tXjklHn1z25T9VaEsgtXRqOFSfApiRLCZC95LTVPS1pY0WbQuIZckCmzash
 q/xMGc/vchyroLPbtb2tWOUtFlKGiaagSkUx0k0h5sVxHGItG8LuJrKcTZSgX+IEAmS9
 Brig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731523187; x=1732127987;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d9VsrezUF3jCjGiqVk3cTbgG/ieR0vfE3u6iRusNkaI=;
 b=jdxCe0fBjYcNSgBDnmefw22jx7RlXQ/SirNgq4epXsejhpQSse2fn395TB1MiaF0xE
 3eZceOoTvHh27uR0/VAB7/aPIiHwGmzurwe9DLl0F9RUwL7IDtBh9OCWKwS73YDi7Cia
 3mlNuieVxsNv/ycTnDd6Ttp+sdiqOvLYD2zAejedhLPrCoPfZKDcRpAz/0NYMddRLU54
 sFI7BSfEtpcKV0MIghgnWEi6JFdViklP+48sUSTvxTvXk8x6HMmOsmPjL9AAObFbY+HD
 4isXF8IuM+tnWryH1lQ3yoeYgNUj/96L4FK9E53fCRokE4MP/8BydGyLHPBeDjdTL5ro
 1a+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDGMA+SnPsI1ig3Jf9PKuSAMov5yymDs1SY3ZE+RJtfK2iHir2MiSKZZVeBhFUZYXZ4mHl+vvX2pQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8P8NQsQixAjnWo2nSXixMv0i8cPCZCJB1HPydM/lLIoZYmC8o
 OYr7FwyhC08ctHp6glg8wWblkbY6zZj2lbIUjm2XvcgXSsS7EnlgShxAMlgttPHW0Rlb8DKPMKh
 h0d3gShmRPl+J7QCs0rfJSH4K2y0HqeZqZltqSw==
X-Google-Smtp-Source: AGHT+IGn0zaky7MmU50aOtfrQndaG60+QZR6Dus9WrtaBQea0DnTMxZBfPRXNQ8ThdaJNFOfutPdQnw4VgYGCJFeO+8=
X-Received: by 2002:a05:6902:33c8:b0:e30:cc81:1695 with SMTP id
 3f1490d57ef6-e337f8d5923mr17959961276.42.1731523186765; Wed, 13 Nov 2024
 10:39:46 -0800 (PST)
MIME-Version: 1.0
References: <4670e355-b07d-43b1-91b8-4e5a12c36b86@gmx.net>
 <5ce22452-a13b-4ed4-ae5c-b631c6271ed8@gmx.net>
In-Reply-To: <5ce22452-a13b-4ed4-ae5c-b631c6271ed8@gmx.net>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 13 Nov 2024 18:39:28 +0000
Message-ID: <CAPY8ntA7y8F_2eYmnA5U251rfMd3ZvU8PM7eOP4nub_-ZWueeA@mail.gmail.com>
Subject: Re: [drm:vc4_hvs_irq_handler [vc4]] *ERROR* HVS underrun
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
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

Sorry for missing this one.

On Fri, 8 Nov 2024 at 18:55, Stefan Wahren <wahrenst@gmx.net> wrote:
>
> Am 26.10.24 um 15:11 schrieb Stefan Wahren:
> > Hi,
> > during the investigations of the recent VC4 HDMI Sink issue [1], I was
> > able to reproduce another issue with vc4 after s2idle resume.
> > Sometimes ( probability ~ 1 : 30 cases ) I'm able to trigger a HVS
> > underrun and it's impact is that the HDMI display stays black and
> > unusable:
> >
> > [ 1790.139465] PM: suspend exit
> > [ 1790.153998] lan78xx 1-1.1.1:1.0 eth0: Link is Down
> > [ 1790.548866] vc4-drm soc:gpu: [drm:vc4_hvs_irq_handler [vc4]]
> > *ERROR* HVS underrun
> > [ 1794.713952] net_ratelimit: 2 callbacks suppressed
> >
> > So I need to use the Debug UART after that.
> gentle ping ...

Nothing immediately springs to mind.
HVS underrun generally means that either the scene is too complex
(unlikely as it worked before the suspend), or that the relevant
clocks have been scaled down below the necessary levels to deliver the
pixel data.

Checking the docs there are bits to alter how underruns are handled.
Setting bits 4, 12, and 20 in SCALER_DISPDITHER is meant to insert
background colour pixels into the stream during underflows instead of
aborting producing any output. (It's one bit for each display
channel).

  Dave

> >
> > Scenario:
> >
> > Steps:
> > 1. Flash latest Raspberry Pi OS (32 bit) on SD card
> > 2. Build Kernel from repo [2] which based on Linux 6.12-rc3 above with
> > arm/multi_v7_defconfig
> > 3. Replace Kernel, modules + DTB on SD card with build ones
> > 4. add the following to confix.txt
> > device_tree=bcm2837-rpi-3-b-plus.dtb
> > enable_uart=1
> > 5. change/add the following to cmdline.txt
> > console=ttyS1,11520 no_console_suspend=1
> > 6. connect the following devices to Raspberry Pi 3 B+ :
> > USB mouse
> > USB keyboard
> > Logilink HDMI switch + HDMI monitor
> > Debug UART adapter (USB side to PC)
> > 7. Power on board and boot into X11
> > 8. Change to root
> > 9. Enable wakeup for ttyS1 ( echo enabled >
> > /sys/class/tty/ttyS1/power/wakeup )
> > 10. Trigger suspend to idle via X11 (echo freeze > /sys/power/state)
> > 11. Wakeup Raspberry Pi via Debug UART Currently I don't see a
> > relation to the VC4 HDMI Sink issue, because this issue occur
> > independently. Until now i wasn't able to reproduce it without the
> > HDMI Switch. Not sure this is related but sometimes the cursor is also
> > corrupted with noise after resume. What can I do to investigate this
> > further?
> > [1] -
> > https://lore.kernel.org/dri-devel/c657d3e9-e4fb-4dac-a611-45655511e500@gmx.net/
> > [2] - https://github.com/lategoodbye/linux-dev/commits/v6.12-pm_v2/
> >
> >
>
