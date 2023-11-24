Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D387F7888
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 17:05:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5FA010E80A;
	Fri, 24 Nov 2023 16:05:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0988910E80A
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 16:05:05 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-db4422fff15so1422533276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 08:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1700841904; x=1701446704;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FGMFcjXzbEdk+Sse8VkaimKNQr0g8bw7uTtgiPTBa4Y=;
 b=WyEVi3R5YvHw5x4/tHP7Np0c3XMA23HOaxJDhrjnJlWyjotzkF4H2r+8DFziPoKJJR
 ZMRr2kSwzi8TwGLGjB7fA7mIoli/CagrGpsnhya2rrD4JFpNCGZrN/PDN5mrS7iRuz4P
 tooMPtk+bf/RC5oombG73m6vXTNj+rtofE4V2xdOuGUrLnecEqe5y0PPxAvf87vavc5P
 agbRQJsYM4+mr0KHRrE9oaS/CLX44vd4cyvRCRZ3wmIJeLTlFA16IWjkLsDpe9K7DVcb
 7zMDNvh+GHY0I56cp5OYITDLtg9EaEbKxEEalT9Y0XEw1X/ig7KLbQ5x58KO0A8VnhbR
 2a2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700841904; x=1701446704;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FGMFcjXzbEdk+Sse8VkaimKNQr0g8bw7uTtgiPTBa4Y=;
 b=S09t7iH5+VEmbP0FgWkmm+y80QvqGtqEdHM5CZIZ7ciT4pYwSij9J0cOfvrokBCdZg
 ZJQsudcI8nToX39HMBGon5ssuW2OHb07uB8XvYBhK0GLho1ihhIFCLZrZy1cRQA0bW8Y
 K+QnYoIlZIl0O1U5mmKeKUcd4fdHEECl+helLJgT36xb0U012+43D3KFBAnufkTsapQA
 TxBWAVKvuPxLLoeHK62oU0iBwHBv7gr4Scuk/JYjUnmMhWfSHmTX02xWPQw3vmxSli/g
 1+65hHrCUS3PQBljopmv7KSzEuslGBRLPGBAxVvosypLm5qRuFaC7N/79TwXyYdnk+6H
 n3nQ==
X-Gm-Message-State: AOJu0YxECNWQsxo5kToe1ZdI5hQT4H8eielYyfHYMzOqJiyD4ZFinF2x
 MHA3L14OE+pCyo7fX63eTkOa+jI21rRLXvHuCTrXtg==
X-Google-Smtp-Source: AGHT+IHDgEc5/d/bHS+/3bhvmbDKVLXNvruKPPtv9g7wbHtBvMJ6nCQ5UHivqzqIt+ZGbt+K3E1Ap3ZKIgfp0CQUNE8=
X-Received: by 2002:a25:8e0a:0:b0:da0:5ba2:6275 with SMTP id
 p10-20020a258e0a000000b00da05ba26275mr2764586ybl.34.1700841904036; Fri, 24
 Nov 2023 08:05:04 -0800 (PST)
MIME-Version: 1.0
References: <20231124104451.44271-1-shengyang.chen@starfivetech.com>
 <dab03c60-caa9-47e3-9dac-fa499227b67b@gmx.net>
In-Reply-To: <dab03c60-caa9-47e3-9dac-fa499227b67b@gmx.net>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 24 Nov 2023 16:04:47 +0000
Message-ID: <CAPY8ntAXYVTTfXL5HX-14t-VDe63eFgRBNKA0aG3RamKepxwDQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] Add waveshare 7inch touchscreen panel support
To: Stefan Wahren <wahrenst@gmx.net>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 keith.zhao@starfivetech.com, krzysztof.kozlowski+dt@linaro.org,
 florian.fainelli@broadcom.com, neil.armstrong@linaro.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jack.zhu@starfivetech.com, robh+dt@kernel.org, thierry.reding@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, mripard@kernel.org, tzimmermann@suse.de,
 Shengyang Chen <shengyang.chen@starfivetech.com>, quic_jesszhan@quicinc.com,
 sam@ravnborg.org, changhuang.liang@starfivetech.com,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 24 Nov 2023 at 15:00, Stefan Wahren <wahrenst@gmx.net> wrote:
>
> Hi Shengyang,
>
> [fix address of Emma]

Not merged to master yet, but Emma has stepped back from maintenance.
https://lists.freedesktop.org/archives/dri-devel/2023-October/428829.html
Dropped from the cc.

> Am 24.11.23 um 11:44 schrieb Shengyang Chen:
> > This patchset adds waveshare 7inch touchscreen panel support
> > for the StarFive JH7110 SoC.
> >
> > Patch 1 add new compatible for the raspberrypi panel driver and its dt-binding.
> > Patch 2 add new display mode and new probing process for raspberrypi panel driver.
> >
> > Waveshare 7inch touchscreen panel is a kind of raspberrypi panel
> > which can be drived by raspberrypi panel driver.
> >
> > The series has been tested on the VisionFive 2 board.
> surprisingly i was recently working on the official Raspberry Pi
> touchscreen and was able to get it running the new way.
>
> What do i mean with the new way. There is almost nothing special to the
> Raspberry Pi touchscreen, so we should try to use/extend existing
> components like:
>
> CONFIG_DRM_PANEL_SIMPLE
> CONFIG_TOUCHSCREEN_EDT_FT5X06
> CONFIG_DRM_TOSHIBA_TC358762
>
> The only special part is the Attiny on the connector PCB which requires:
>
> CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY
>
> So the whole point is to avoid writing monolitic drivers for simple
> panel like that.
>
> There is a WIP branch based on top of Linux 6.7-rcX, which should
> demonstrate this approach [1]. Unfortunately it is not ready for
> upstreaming, but it has been tested on a Raspberry Pi 3 B Plus. Maybe
> this is helpful for your case.
>
> Actually i consider panel-raspberrypi-touchscreen.c as a dead end, which
> shouldn't be extended.

Agreed.

The panel control being bound in with the Atmel control has no hook
for the EDT5x06 touch driver to hook in and keep the power to the
touch controller active. When the panel disable gets called, bye bye
touch overlay :-(

And I'm reading the driver change as more of a hack to get it to work
on your platform, not as adding support for the Waveshare panel
variant.
Waveshare deliberately cloned the behaviour of the Pi 7" panel in
order to make it work with the old Pi firmware drivers, so it
shouldn't need any significant changes. Where did the new timings come
from?

  Dave

> Btw there are already DT overlays in mainline which seems to use the
> Raspberry Pi 7inch panel (without touch function yet) [2].
>
> [1] - https://github.com/lategoodbye/rpi-zero/commits/v6.7-7inch-ts
> [2] -
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rpidsi.dtso?h=v6.6.2&id=6b4da1354fd81adace0cda448c77d8f2a47d8474
>
> >
> > Shengyang Chen (2):
> >    dt-bindings: display: panel: raspberrypi: Add compatible property for
> >      waveshare 7inch touchscreen panel
> >    gpu: drm: panel: raspberrypi: add new display mode and new probing
> >      process
> >
> >   .../panel/raspberrypi,7inch-touchscreen.yaml  |  4 +-
> >   .../drm/panel/panel-raspberrypi-touchscreen.c | 99 ++++++++++++++++---
> >   2 files changed, 91 insertions(+), 12 deletions(-)
> >
>
