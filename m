Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2613751C8AD
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 21:06:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E84410E47A;
	Thu,  5 May 2022 19:06:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5736410E4AA
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 19:06:12 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id v65so5285578oig.10
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 12:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=D0hIIaQCI/Dh7yD1DKDpvDpYdxU4Kww1YfWBC7PJ66o=;
 b=Y5TZ8gwH28OUdcotbTOTVpcbR4pDhTI/YaqLz24TF+cgaEBsGrcHfKJ6FBpz5fI8YD
 0ZQoF6vw49X7WRHB1KNIwNnaHPbGRAeoDQ27rWR0fcMzDbA4qQ8IRsYiuu1tu/cgCh6i
 7ztBLJfvDKa2BhXMW2eS+XrHhX8up86RwTwaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=D0hIIaQCI/Dh7yD1DKDpvDpYdxU4Kww1YfWBC7PJ66o=;
 b=JgyrtK31oTs9aq4I4vwVwWa5xvak6GymFsJpQfY7mbXziw/3dakmm0w9nTQDhX0TqZ
 eAyfaw9Lq6VVLgUHvau4JQouo23Y1Yn1ydlpZNau/rSLNEtzr2s7u5ZMn6SmZZT2EnvO
 zTXITS22oHp0gmFsrr/cJ6vQqe2u2NGwetxKCS0mccohOz/6dFKS1krL7kt1S5f3Bg9Q
 0SnAZmaXmpWLMs94iy8xRcSSBSZHFemsKzsz4ylOsPmKTSM8ppiPXdf5zKu7irpYH3ur
 fftA41Re4yYRrScfuZ6GrG9emsAY4R8OtL9QdyNReyvd7voAP+vfYsxFA97CFd7XlZzw
 ah6w==
X-Gm-Message-State: AOAM5302DPdORffFoGqLz0PrQhlUhAcbClRPOZgaHane8BgNmD7xnU5F
 /xoziViv4swIpn1GoyD1y416X8XXJQB2aRYyI1bWfw==
X-Google-Smtp-Source: ABdhPJynlWjxd2luIxa71ND0gePgQJv4YZ4ySZIIn/1gXDonkO41PQ/jE3q3+0goFTuJnjQr8o6y5FLtPhweRHmec9s=
X-Received: by 2002:aca:bd41:0:b0:2ec:ff42:814f with SMTP id
 n62-20020acabd41000000b002ecff42814fmr3286599oif.63.1651777571605; Thu, 05
 May 2022 12:06:11 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 5 May 2022 15:06:10 -0400
MIME-Version: 1.0
In-Reply-To: <MW4PR02MB71867A18732B266DE8FA2040E1C29@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <20220425210643.2420919-1-dianders@chromium.org>
 <20220425140619.1.Ibfde5a26a7182c4b478d570c23d2649823ac2cce@changeid>
 <CAE-0n51eZpAKprRQ0HqjLciF_BVQHBDN8SMFNVmmOd=B9UBEzg@mail.gmail.com>
 <CAD=FV=WmVK3wTQf_EAxSi0WPXedSFGCsKdyqRnHsskmMYTHDQA@mail.gmail.com>
 <MW4PR02MB718610FAA14F966ADE1B1585E1C29@MW4PR02MB7186.namprd02.prod.outlook.com>
 <CAE-0n51Q=cGwrMec3JEQENqWHV3pAUjLPT6RwZLA5xV080sgxQ@mail.gmail.com>
 <MW4PR02MB71867A18732B266DE8FA2040E1C29@MW4PR02MB7186.namprd02.prod.outlook.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 5 May 2022 15:06:10 -0400
Message-ID: <CAE-0n53MEBYhyRtGWOCmjj923UQU_iVE_SEBQw6_FUci8NLz3w@mail.gmail.com>
Subject: RE: [PATCH 1/2] dt-bindings: msm/dp: List supplies in the bindings
To: Doug Anderson <dianders@chromium.org>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Kalyan Thota <quic_kalyant@quicinc.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Kishon Vijay Abraham I <kishon@ti.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Sankeerth Billakanti (QUIC) (2022-05-05 11:47:20)
> >Quoting Sankeerth Billakanti (2022-05-05 11:02:36)
> >>
> >> Our internal power grid documents list the regulators as VDD_A_*_1P2
> >> and VDD_A_*_0P9 for all the platforms.
> >
> >Do your internal power grid documents indicate what these supplies are
> >powering? The question is if these supplies power any of the logic inside the
> >eDP controller or if they only supply power to the analog circuits in the eDP
> >phy. If it's the eDP phy only then the regulator usage in the eDP driver should
> >be removed. I would suspect this is the case because the controller is
> >probably all digital logic and runs at the typical 1.8V that the rest of the SoC
> >uses. Similarly, these are voltage references which sound like a PLL reference
> >voltage.
> >
> >Please clarify this further.
> >
>
> For the DP driver using the usb-dp combo phy, there were cases where the usb driver
> was turning off the phy and pll regulators whenever usb-dp concurrent mode need not be supported.
> This caused phy and pll to be powered down causing aux transaction failures and display blankouts.
> From then on, it became a practice for the controller driver to vote for the phy and pll regulators also.
>

That sounds like USB-DP combo phy driver had improper regulator power
management where aux transactions from DP didn't keep the power on to
the phy. Where does the power physically go? If the power isn't
physically going to the DP controller it shouldn't be controlled from
the DP controller driver. If the aux bus needs the DP phy enabled, the
DP controller driver should enable the phy power (via phy_power_on()?).
