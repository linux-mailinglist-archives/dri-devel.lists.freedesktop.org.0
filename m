Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2C951C70B
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 20:18:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4346510E752;
	Thu,  5 May 2022 18:18:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D3C10E730
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 18:18:16 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-edf3b6b0f2so4621453fac.9
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 11:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=1jpEHyGirjaqNUVRP1nz/MiyeczcMtRZCBgdvFueFbg=;
 b=dNocJH2pm51w2sdCBeubcHoBirqMpP4BeW10hHVrgouUJomu19MuSgDP10MAcJT1nj
 mBhKXkC5eceOPxd/JNxBGm0skq56M6pzHm1+7vMA6y1XdjmY/oQybSc78dHVxPuR11wK
 kQeBG67nLfix9PfNYpH8hazatCrGvl2JUyXw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=1jpEHyGirjaqNUVRP1nz/MiyeczcMtRZCBgdvFueFbg=;
 b=SDGKuUjlHEbXfz5jgs1cAYngrgKXq/k+De1LdW+AKFtBVh0TWjo6/4iBxjtv+lSW91
 sL9VdOY63AtrdVi2E0HWmOXCLWEnTfqUGydLGji+49wggVIDeaVAycB3RBhG7pHE/fIn
 i3b9O7l7+EY231LMPEcUaDclBhpNEMNzVAIUPxfIVms5YIZl7lrdY+1/6KBsgTboOmjv
 wQHuspdRLKGQUAAdVhKq3XDmXxyqXw7gVmZg8TulF7nzCu/MCsWDeUuuVqqgDQGhzxjw
 1jevcdcEjwJj4BVDdFlvbW1UgIx9KXQ8OKFwRj//wXS8gWvqjxCLu/3woLRzhuuav9lH
 xqcg==
X-Gm-Message-State: AOAM5319Y8gCW8rJttL0YP2V5StbKro6MTI32hxqkZHyzPJkvUWFOPx7
 o7o1Gl7fiWOrrKtOsUk89bYVNnzIfHPI8Q3o6SCzAg==
X-Google-Smtp-Source: ABdhPJzMp5CHlTo8w5ux98tGyd6+gy+uiMp3v8K0Hb9IdRobOQWLGqnf7677jht+CONLIgkUYNLz7u6VoaG/olKYp+g=
X-Received: by 2002:a05:6870:558e:b0:e1:db7c:26aa with SMTP id
 n14-20020a056870558e00b000e1db7c26aamr2956854oao.63.1651774695213; Thu, 05
 May 2022 11:18:15 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 5 May 2022 14:18:14 -0400
MIME-Version: 1.0
In-Reply-To: <MW4PR02MB718610FAA14F966ADE1B1585E1C29@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <20220425210643.2420919-1-dianders@chromium.org>
 <20220425140619.1.Ibfde5a26a7182c4b478d570c23d2649823ac2cce@changeid>
 <CAE-0n51eZpAKprRQ0HqjLciF_BVQHBDN8SMFNVmmOd=B9UBEzg@mail.gmail.com>
 <CAD=FV=WmVK3wTQf_EAxSi0WPXedSFGCsKdyqRnHsskmMYTHDQA@mail.gmail.com>
 <MW4PR02MB718610FAA14F966ADE1B1585E1C29@MW4PR02MB7186.namprd02.prod.outlook.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 5 May 2022 14:18:14 -0400
Message-ID: <CAE-0n51Q=cGwrMec3JEQENqWHV3pAUjLPT6RwZLA5xV080sgxQ@mail.gmail.com>
Subject: RE: [PATCH 1/2] dt-bindings: msm/dp: List supplies in the bindings
To: Doug Anderson <dianders@chromium.org>,
 Sankeerth Billakanti <sbillaka@qti.qualcomm.com>
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
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, devicetree@vger.kernel.org,
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

Quoting Sankeerth Billakanti (2022-05-05 11:02:36)
> >>
> >> Quoting Douglas Anderson (2022-04-25 14:06:42)
> >>
> >> Having 'a' in 'vdda' typically means 'analog' for 'analog' circuits,
> >> so I'd expect this to only matter for the phy that contains the analog
> >> circuitry. It would be great to remove the regulator code from
> >> drivers/gpu/drm/msm/dp/dp_power.c and move the regulator_set_load()
> >> call to the phy driver if possible. Hopefully qcom folks can help
> >> clarify here.
> >
> >Interesting. Oddly enough, the sc7280 datasheet doesn't list the "_A".
> >It calls these "VDD_VREF_0P9" and "VDD_VREF_1P2". However, on the
> >schematic in front of me someone labeled these pins on the sc7280 with the
> >"A". ...and the driver looks for a supply with the "a". :-/
> >
> >It would be good to get clarification from someone with better information.
> >
> >-Doug
>
> Our internal power grid documents list the regulators as VDD_A_*_1P2 and VDD_A_*_0P9
> for all the platforms.

Do your internal power grid documents indicate what these supplies are
powering? The question is if these supplies power any of the logic
inside the eDP controller or if they only supply power to the analog
circuits in the eDP phy. If it's the eDP phy only then the regulator
usage in the eDP driver should be removed. I would suspect this is the
case because the controller is probably all digital logic and runs at
the typical 1.8V that the rest of the SoC uses. Similarly, these are
voltage references which sound like a PLL reference voltage.

Please clarify this further.

>
> So, as a practice, we put the same name in the DT files. Hence,
>
> Reviewed-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
>
