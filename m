Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE8D4E7467
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 14:44:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C3510EBA9;
	Fri, 25 Mar 2022 13:44:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830F010EBAF
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 13:44:49 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id lr4so7036503ejb.11
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 06:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gOz+6Jxgi4s/aMhrYK7cy8+f432CABX9+S0xakAnHqY=;
 b=N3uhTkSoAhpdcH0K9ce+7Zd2W0nvWZhX9pG5rSFFU8rLbtBT/XC1CXLSlH+1vk9kzu
 4mlDtldSOeRHo6HikkOr3+q33eoqytnVuzi8kEmzL6qRHtCfkXWX7sFUeP5bTxxGwvDF
 1w8JeKXKER0xIkg+HAXcPJZqJCJXg1T2ErHwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gOz+6Jxgi4s/aMhrYK7cy8+f432CABX9+S0xakAnHqY=;
 b=Um6Cg1/ZhZdRrpRzKzju97fWra/KbQ5q6eRPGEpFrBFjv3Jt4O+xXkC0p3zbeMy92F
 XMQRLAaSj2heza4OGKtbzw7r//T2EZyn4n29ZicZ+8tuCyyubmzcGEcF5pf5LZf0IGUa
 7Z9gzG1n9ry4UOw2tORPwsx8nTTOFKltdtVqv1jlZ2m+pH+i7dVvnDcCR1ipo3taASPF
 C3cp22dG07BwF2LZ2khXlbMvtPQfWNyhxvbmlg0zmw1MivIJZbSNnPeN1lzBDncveabD
 aZlYLvbQ9/evtTMDErQ9h8a7RNi4gfWC3K9oXThJy+88Rd4MUJ6ZGQB9Z4PsYsQss0lO
 UHYw==
X-Gm-Message-State: AOAM531CmxufOfz88RuT5VzciYdYtmpDJVattNczwj95m4zbRsVaPGHr
 dXQP3FFWCo/GPD+Fbizu8dxPwL6WcxT9Fooq
X-Google-Smtp-Source: ABdhPJxCbkYxWSiBOdQSrIu2MO8LKz3qt+dhWjTXHMAQZaZVRr5AqnKhVm6k2G1sHG6IgE6zxxFzOA==
X-Received: by 2002:a17:907:2dab:b0:6db:f0a6:761a with SMTP id
 gt43-20020a1709072dab00b006dbf0a6761amr11752559ejc.584.1648215887737; 
 Fri, 25 Mar 2022 06:44:47 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com.
 [209.85.221.42]) by smtp.gmail.com with ESMTPSA id
 g11-20020a170906538b00b006ae38eb0561sm2345318ejo.195.2022.03.25.06.44.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 06:44:47 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id m30so10977498wrb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 06:44:46 -0700 (PDT)
X-Received: by 2002:adf:fc47:0:b0:203:dda1:4311 with SMTP id
 e7-20020adffc47000000b00203dda14311mr9264199wrs.301.1648215886319; Fri, 25
 Mar 2022 06:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com>
 <1647452154-16361-3-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=XM1njMY63SCC3yNoA9Uvu+_3xLGkC5OWoLjR-0KnmhWg@mail.gmail.com>
 <MW4PR02MB7186E881ABC0620E0A62154EE11A9@MW4PR02MB7186.namprd02.prod.outlook.com>
In-Reply-To: <MW4PR02MB7186E881ABC0620E0A62154EE11A9@MW4PR02MB7186.namprd02.prod.outlook.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 25 Mar 2022 06:44:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VWaMx9UsXTktjd3Ryo3g0-XY2N9oCNz_kQoJN6gzKAoA@mail.gmail.com>
Message-ID: <CAD=FV=VWaMx9UsXTktjd3Ryo3g0-XY2N9oCNz_kQoJN6gzKAoA@mail.gmail.com>
Subject: Re: [PATCH v5 2/9] arm64: dts: qcom: sc7280: Add support for eDP
 panel on CRD
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 Andy Gross <agross@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, quic_vproddut <quic_vproddut@quicinc.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <seanpaul@chromium.org>, Sean Paul <sean@poorly.run>,
 quic_kalyant <quic_kalyant@quicinc.com>, LKML <linux-kernel@vger.kernel.org>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Mar 25, 2022 at 6:41 AM Sankeerth Billakanti (QUIC)
<quic_sbillaka@quicinc.com> wrote:
>
> > -----Original Message-----
> > From: Doug Anderson <dianders@chromium.org>
> > Sent: Friday, March 18, 2022 10:51 PM
> > To: Sankeerth Billakanti (QUIC) <quic_sbillaka@quicinc.com>
> > Cc: dri-devel <dri-devel@lists.freedesktop.org>; linux-arm-msm <linux-arm-
> > msm@vger.kernel.org>; freedreno <freedreno@lists.freedesktop.org>;
> > LKML <linux-kernel@vger.kernel.org>; open list:OPEN FIRMWARE AND
> > FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>; Rob Clark
> > <robdclark@gmail.com>; Sean Paul <seanpaul@chromium.org>; Stephen
> > Boyd <swboyd@chromium.org>; quic_kalyant <quic_kalyant@quicinc.com>;
> > Abhinav Kumar (QUIC) <quic_abhinavk@quicinc.com>; Kuogee Hsieh (QUIC)
> > <quic_khsieh@quicinc.com>; Andy Gross <agross@kernel.org>;
> > bjorn.andersson@linaro.org; Rob Herring <robh+dt@kernel.org>;
> > krzk+dt@kernel.org; Sean Paul <sean@poorly.run>; David Airlie
> > <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Thierry Reding
> > <thierry.reding@gmail.com>; Sam Ravnborg <sam@ravnborg.org>;
> > dmitry.baryshkov@linaro.org; quic_vproddut <quic_vproddut@quicinc.com>
> > Subject: Re: [PATCH v5 2/9] arm64: dts: qcom: sc7280: Add support for eDP
> > panel on CRD
> >
> > Hi,
> >
> > On Wed, Mar 16, 2022 at 10:36 AM Sankeerth Billakanti
> > <quic_sbillaka@quicinc.com> wrote:
> > >
> > > Enable support for eDP interface via aux_bus on CRD platform.
> > >
> > > Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> > > ---
> > >
> > > Changes in v5:
> > >   - Change the order of patches
> > >   - Remove the backlight nodes
> > >   - Remove the bias setting
> > >   - Fix compilation issue
> > >   - Model VREG_EDP_BP for backlight power
> > >
> > > Changes in v4:
> > >   - Create new patch for name changes
> > >   - Remove output-low
> > >
> > > Changes in v3:
> > >   - Sort the nodes alphabetically
> > >   - Use - instead of _ as node names
> > >   - Place the backlight and panel nodes under root
> > >   - Change the name of edp_out to mdss_edp_out
> > >   - Change the names of regulator nodes
> > >   - Delete unused properties in the board file
> > >
> > >
> > > Changes in v2:
> > >   - Sort node references alphabetically
> > >   - Improve readability
> > >   - Move the pwm pinctrl to pwm node
> > >   - Move the regulators to root
> > >   - Define backlight power
> > >   - Remove dummy regulator node
> > >   - Cleanup pinctrl definitions
> > >
> > >  arch/arm64/boot/dts/qcom/sc7280-crd.dts | 93
> > > +++++++++++++++++++++++++++++++++
> > >  1 file changed, 93 insertions(+)
> >
> > At a high level, I'd expect your patch to be based upon Matthias's series, AKA
> > the 4 patches from:
> >
> > https://lore.kernel.org/r/20220316172814.v1.1.I2deda8f2cd6adfbb525a97d8f
> > ee008a8477b7b0e@changeid/
> >
> > I'll leave it up to you about whether you care to support eDP on the old
> > CRD1/2 or just on CRD3. Personally I'd think CRD3 would be enough.
> >
> > Then, I'd expect your patch to mostly incorporate
> > <https://crrev.com/c/3379844>, though that patch was written before aux-
> > bus support so the panel would need to go in a different place.
> >
> > Stephen already gave some comments and basing on Matthias's patches will
> > be a pretty big change, so I probably won't comment lots more.
> >
> >
>
> I rebased my change on top of Matthias's changes now. We are discussing about the qcard changes internally to understand the way ahead.
> I believe all my current changes are localized to the crd-r3 files only for the qyalcomm crd3.1
>
> I want to have a different series for c and dt changes to expedite review process. May I separate the c changes from this series?

I'd have no problems with that. They go into different trees and if it
makes it easier to get a new version of the driver out while you're
figuring out what to do about the dts then I'd say let's do it.

-Doug
