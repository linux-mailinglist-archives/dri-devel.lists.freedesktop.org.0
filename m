Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EECE3523C74
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 20:29:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257CA10F1A7;
	Wed, 11 May 2022 18:29:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A273B10F173
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 18:29:08 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id w24so3585988edx.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 11:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uiYBAkZ/K7TON78jcHgwLk8yR9bWm2DLv+jXS6/7A90=;
 b=TysY5PPYSJqqGGSP17kFdgyVAcXW0GiDdLa8+M1+Q0ojkz+YMGJOdGZ1g7kkbPZOu6
 yt+IrWP6PXRoXVf3HH1RNxijEEEziatsJwBR8ffnixgRhgmDKQimGHpCgltyrkDtU5pd
 QyBownI7LpEYTX9O9gVL+tE6Wpia3KSKpa7tY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uiYBAkZ/K7TON78jcHgwLk8yR9bWm2DLv+jXS6/7A90=;
 b=IYji7qOpHZ9LqnZHFRola9MBcQ/vxP+up8tT0w/zJ6TX1bME66Ib3gSP1Z12HT5vYk
 VkqrGnIDNoWnMtJ/03GECX2ZNUxHoBPLHJEbmQt83ncKL91RFz1OEeYiI87jw5RuOrPR
 NVAD7+5UQxqYpNXyr5zWvhWX1UHVPeYi44d7WT0vEUw/FoPIZ5mxZEBSuV7VG8it/Ca3
 RlDo2SXdjd/+RohU/ils8FrveYhCdFN4HKCWFZuUppEhZcrd94zKrAbg7NeatW9O69nt
 bHSEG/eLaTmglQr5npIh8rR8oQofKYGXvF5YdgtjlWVoRQpjaDx8r23kvYe32LXdbz0I
 rBMQ==
X-Gm-Message-State: AOAM532ovd7e0IElb2RswYWebU7TslRtqT9hVUrRF88GBdKJ1QTVVwgv
 iAvNI4QGxaE5d6Zle7YIQKtb62llVF1c5OpiRjQ=
X-Google-Smtp-Source: ABdhPJz8sL2/zmNwZv5a5QRiDr0ZxRUGMt5+aqRiZzCSrgRihJNt0iX5WiQf+9BTO5hoMd8WMKuC9A==
X-Received: by 2002:a50:ab57:0:b0:428:9f9b:d8e3 with SMTP id
 t23-20020a50ab57000000b004289f9bd8e3mr17491448edc.305.1652293746920; 
 Wed, 11 May 2022 11:29:06 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53]) by smtp.gmail.com with ESMTPSA id
 m3-20020a1709066d0300b006f3ef214deasm1248175ejr.80.2022.05.11.11.29.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 11:29:06 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id
 m2-20020a1ca302000000b003943bc63f98so1706703wme.4
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 11:29:06 -0700 (PDT)
X-Received: by 2002:a05:600c:3c99:b0:392:b49c:7b79 with SMTP id
 bg25-20020a05600c3c9900b00392b49c7b79mr6101308wmb.199.1652293325498; Wed, 11
 May 2022 11:22:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220425210643.2420919-1-dianders@chromium.org>
 <20220425140619.1.Ibfde5a26a7182c4b478d570c23d2649823ac2cce@changeid>
 <CAE-0n51eZpAKprRQ0HqjLciF_BVQHBDN8SMFNVmmOd=B9UBEzg@mail.gmail.com>
 <CAD=FV=WmVK3wTQf_EAxSi0WPXedSFGCsKdyqRnHsskmMYTHDQA@mail.gmail.com>
 <MW4PR02MB718610FAA14F966ADE1B1585E1C29@MW4PR02MB7186.namprd02.prod.outlook.com>
 <CAE-0n51Q=cGwrMec3JEQENqWHV3pAUjLPT6RwZLA5xV080sgxQ@mail.gmail.com>
 <MW4PR02MB71867A18732B266DE8FA2040E1C29@MW4PR02MB7186.namprd02.prod.outlook.com>
 <CAE-0n53MEBYhyRtGWOCmjj923UQU_iVE_SEBQw6_FUci8NLz3w@mail.gmail.com>
 <MW4PR02MB71866E59B844A0842DF7570EE1C59@MW4PR02MB7186.namprd02.prod.outlook.com>
In-Reply-To: <MW4PR02MB71866E59B844A0842DF7570EE1C59@MW4PR02MB7186.namprd02.prod.outlook.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 11 May 2022 11:21:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WeTK8LBJmc6AkjPyPLVS+2sSRNEFuEOZrWGJr3Kpq58Q@mail.gmail.com>
Message-ID: <CAD=FV=WeTK8LBJmc6AkjPyPLVS+2sSRNEFuEOZrWGJr3Kpq58Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: msm/dp: List supplies in the bindings
To: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 "Kalyan Thota \(QUIC\)" <quic_kalyant@quicinc.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, May 6, 2022 at 6:36 AM Sankeerth Billakanti (QUIC)
<quic_sbillaka@quicinc.com> wrote:
>
> >> >> Our internal power grid documents list the regulators as
> >> >> VDD_A_*_1P2 and VDD_A_*_0P9 for all the platforms.
> >> >
> >> >Do your internal power grid documents indicate what these supplies
> >> >are powering? The question is if these supplies power any of the
> >> >logic inside the eDP controller or if they only supply power to the
> >> >analog circuits in the eDP phy. If it's the eDP phy only then the
> >> >regulator usage in the eDP driver should be removed. I would suspect
> >> >this is the case because the controller is probably all digital logic
> >> >and runs at the typical 1.8V that the rest of the SoC uses.
> >> >Similarly, these are voltage references which sound like a PLL reference
> >voltage.
> >> >
> >> >Please clarify this further.
> >> >
> >>
> >> For the DP driver using the usb-dp combo phy, there were cases where
> >> the usb driver was turning off the phy and pll regulators whenever usb-dp
> >concurrent mode need not be supported.
> >> This caused phy and pll to be powered down causing aux transaction failures
> >and display blankouts.
> >> From then on, it became a practice for the controller driver to vote for the
> >phy and pll regulators also.
> >>
> >
> >That sounds like USB-DP combo phy driver had improper regulator power
> >management where aux transactions from DP didn't keep the power on to
> >the phy. Where does the power physically go? If the power isn't physically
> >going to the DP controller it shouldn't be controlled from the DP controller
> >driver. If the aux bus needs the DP phy enabled, the DP controller driver
> >should enable the phy power (via phy_power_on()?).
>
> Yes, it was limitation earlier when we did not have proper interface to interact
> with the combo phy.
>
> In this case, the power from the regulators go to the combo phy.
>
> Now that there is an interface for the controller to interact with the
> combo phy, the proposal to drop the phy regulator voting from the controller
> driver seems reasonable to me.
>
> The phy_power_on() is used for getting the phy out of low power state or getting
> it ready for data transfer.
>
> The controller driver needs to enable the phy power via the phy_init() before
> any interaction with the sink like the aux transactions or before sending the data.
> The controller can disable the regulators via the phy_exit() call.

I can confirm that if I stop providing these regulators to the DP
controller that the screen still comes up. ...but also there are lots
of other things (including the PHY) that power these regulators up...

From offline discussion with folks:

1. It sounds like maybe the code for handling the regulators in the DP
controller leaked in from downstream where the DP driver itself
controls more stuff.

2. We should probably remove these regulators from the DP controller.

3. When we remove this from the DP controller, we'll have to make sure
that the PHY driver calls regulator_set_load() as needed.

Kuogee has volunteered to own this issue and send out patches fixing
the stuff up. So for now, please consider ${SUBJECT} patch abandoned.

-Doug
