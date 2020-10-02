Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE691281741
	for <lists+dri-devel@lfdr.de>; Fri,  2 Oct 2020 17:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF1BC6E0D8;
	Fri,  2 Oct 2020 15:57:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194116E0D8
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Oct 2020 15:57:25 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z1so2376048wrt.3
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Oct 2020 08:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RKAvB3+WMKNN79UahsqcncMsVNqOcgEb3CYVYKIldnE=;
 b=avZDU7go3+yv2IeEagTPM8GH/4BJn08wqf5PQiplnVADu+OAvfUcqmRM1af3wCvl+u
 RFO+xnZ8SUVbzCHkhjKXkZRtfQTiSQU9AtLUK4ZL3ePXVt8v7zC2Yl3mmc07FaJ2vViy
 GzroUTM1aHOB6qAlZpGSgBAwsdUHsPVAq43hfKmoNvDrtcDMnwviGJkWEPim3xt0mlO6
 POEMXBQD10jxyvHgVOQ50LlCv9hSQhnGMGVAfHQ7l5zQZ9Zqw44YKhjZ2rXog0hiBNKi
 WJKEljWSN3mkOzpn3P9G8oCaAeEQ10F8YeNaegkg930nU8gpVYGuEJsfSc+0YAjzvFNi
 dezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RKAvB3+WMKNN79UahsqcncMsVNqOcgEb3CYVYKIldnE=;
 b=mMt5QUEvR91DNHzev4DfE5BKW0S6cO9Pne3vsgl6VhtS+TBbhELb+AgOBwS9HsamUT
 tNqiLZq8gMtKdgG+QL5suKCFj5CAlqUh546rwZaaJkEpFoAqDs8C1mY/sw/myLxEh+So
 sNQv/aDdAdWihe27BctBMr92/r56BB55ui3DwGlPReN1LGlAxVwVJBqb1W02/4J1QUhb
 ot4NpBGPqTPXPpzimJ4R51LZZ140pRFe4QFtmrU5e8mxvhyfPRLLGT1x/s4rPt5Sk/mL
 O6s+uxrhnN1pSjg1P0UDpXUjoTeip+FrQuR3OcSDPEwPpJZqafoU5eMum2v4Dpm4Dgfj
 x25w==
X-Gm-Message-State: AOAM530RVQsRfcm4KhvvGq9RjRuFB/vmab1mpIQ+9bGpMsyz5VuzMV2C
 jsr8wu3PA6Jo6VzqqArLoJJFAqXFzMiXh30niS1EMA==
X-Google-Smtp-Source: ABdhPJxwrWnm+dIu+CTA7AHImJjo0wrCfg7Coce7eyfVsTucN19FAy0Kl9BsdVtITTMsbzxPFLnGj/dMkoXGrlM33Yg=
X-Received: by 2002:adf:fa02:: with SMTP id m2mr3765016wrr.273.1601654243794; 
 Fri, 02 Oct 2020 08:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
 <cfce2276d172d3d9c4d34d966b58fd47f77c4e46.1599120059.git-series.maxime@cerno.tech>
 <20200929221526.GA1370981@ubuntu-m3-large-x86>
 <20200930140758.gummt3umouva3wyu@gilmour.lan>
 <20200930163823.GA237050@ubuntu-m3-large-x86>
 <cacbaef2-4221-50d8-3c5d-efab9f1a9c04@i2se.com>
 <20201001064843.dlewcu3b7dvqanyy@gilmour.lan>
 <20201001085402.t6mzzwzplviunhoc@gilmour.lan>
 <CAAvKZ65WqQqH-9JVdb5M6HcKbR3yQdvZha8n9UXXCfciYRq4aA@mail.gmail.com>
 <20201002151954.wazqc5riesdomlpx@gilmour.lan>
In-Reply-To: <20201002151954.wazqc5riesdomlpx@gilmour.lan>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 2 Oct 2020 16:57:05 +0100
Message-ID: <CAPY8ntCkY9F0e=hOyg=rs5G2a=iEbukWgmr0adXrwJQPm=uY6A@mail.gmail.com>
Subject: Re: [PATCH v5 80/80] ARM: dts: bcm2711: Enable the display pipeline
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Tim Gover <tim.gover@raspberrypi.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Phil Elwell <phil@raspberrypi.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org,
 Nathan Chancellor <natechancellor@gmail.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Fri, 2 Oct 2020 at 16:19, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Tim,
>
> On Thu, Oct 01, 2020 at 11:15:46AM +0100, Tim Gover wrote:
> > hdmi_enable_4k60=1 causes the firmware to select 3.3 GHz for the PLLC
> > VCO to support a core-frequency of 550 MHz which is the minimum
> > frequency required by the HVS at 4Kp60. The side effect is that if the
> > display clock requirements are lower than 4Kp60 then you will see
> > different core frequencies selected by DVFS.
> >
> > If enable_uart=1 and the mini-uart is selected (default unless
> > bluetooth is disabled) then the firmware will pin the core-frequency
> > to either core_freq max (500 or 550). Although, I think there is a way
> > of pinning it to a lower fixed frequency.
> >
> > The table in overclocking.md defines options for setting the maximum
> > core frequency but unless core_freq_min is specified DVFS will
> > automatically pick the lowest idle frequency required by the display
> > resolution.
>
> I'm wondering if there's some way to detect this from Linux? I guess it
> would be nice to be able to at least detect a broken config to warn /
> prevent an user that their situation is not going to be reliable / work
> really well (like if they have a 4k display without hdmi_enable_4kp60
> set, or the issue we're discussing here)

The main filter in the firmware is the parameter
hdmi_pixel_freq_limit. That can either be set manually from
config.txt, or defaults appropriately based on hdmi_enable_4kp60.
Under firmware_kms [1] I read back those values to use as a filter
within crtc_mode_valid[2].
I can't think of a nice way of exposing that without the vc4 driver
gaining a DT link to the firmware, and that starts to get ugly.

  Dave

[1] https://github.com/raspberrypi/linux/blob/rpi-5.9.y/drivers/gpu/drm/vc4/vc4_firmware_kms.c#L1859
[2] https://github.com/raspberrypi/linux/blob/rpi-5.9.y/drivers/gpu/drm/vc4/vc4_firmware_kms.c#L1077
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
