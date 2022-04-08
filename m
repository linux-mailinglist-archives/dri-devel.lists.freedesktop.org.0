Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AD14F9C30
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 20:02:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E41B10E71F;
	Fri,  8 Apr 2022 18:02:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA9E10E71F
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 18:02:36 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id 75so2615157qkk.8
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 11:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qnWn/G1v8AMjgZeV0vrRRskVP5PKCPkKnjAvSBWCiog=;
 b=Yrv/4DfWo8XzuZKX3n2fnRyM5qg5cpPd9RJn0imI4WJgfA4/hq+XwK9Zez1bIwBFYG
 QxCMABFF3bqiHIWYhC6zjNtGol7oTSnOQqqyJFcuFqDNXpPyLZ4B69ms5ViWU63tMj+8
 uVXMMz2FNHEUtmwK6ym9rZiV1MBctW2Kf7hipW8dlYW3COwe6ol7B3iEqbxxH1VB98C8
 aOIvIk6e5JtfwqivEiIizEpJiJV/ST6bkAayH/VrgmDzhchacsaK+uSJE0OnvGg2/eGU
 cMu9HHoge1H5LkMbBB1zaIdGPc4PwFNWUQA1vngF5bjc+F94yqev4OLIAImsKsRY4Vh1
 6+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qnWn/G1v8AMjgZeV0vrRRskVP5PKCPkKnjAvSBWCiog=;
 b=7U4NTkvVcvFEbnfmDX3NP5X3gW/7/2mjJkkb/Z8/EYOdmkzw1hW6gspJMYC8rKzs72
 /Ls3Ow2SOVUKDmcc2dRtMt+vGqNfuD6TtMdV5F9RnMpi6DSd4BlJJoENkneR892p/XWx
 EJDr4awTR44jh+4d7BZfw3zRVifS2Vl6JVR63AUTwPoG6cH+sL34MDxqdRmJdP0m+k3J
 2VmNg01EKYq4Oj309JrOLkhakX+kJBZDDzTmpIh6pk3TJqQJ0pOC8jRwl8a3kNbC7rEQ
 nkhBcqufcSRlgGVJBYXXwQFGTT8RYbUSgYFDIwmdjwJ1sCYugHPV7abHRJLx6RId/OXp
 noUw==
X-Gm-Message-State: AOAM530lHUMMN/21TotFzP/9zE+o6s8S492Ygw8C7mSdJkQmW8htBsPv
 p0SRm6VnmrxLmMmLKe2+Jg1+Mt3bTEuyG5ZBoO64mQ==
X-Google-Smtp-Source: ABdhPJy0Zg7wGYGP3Y4ju21eKWOojsGNF/XGXzPyEC1bFWczC1hJ830VSwicu8jxDsJoQJjrLC3tmgMKEMTuAl3yecw=
X-Received: by 2002:a05:620a:170a:b0:67d:be5c:204a with SMTP id
 az10-20020a05620a170a00b0067dbe5c204amr13919747qkb.593.1649440955444; Fri, 08
 Apr 2022 11:02:35 -0700 (PDT)
MIME-Version: 1.0
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-6-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=Wn-XypjRcw-D0VtBHZbuTz=RHiMq6RCHCa=CWmZM42nQ@mail.gmail.com>
 <94da2c97-2ad2-4575-bd73-d66ad989e17b@linaro.org>
 <MW4PR02MB7186B3A2F8EDF388CA521498E1E99@MW4PR02MB7186.namprd02.prod.outlook.com>
In-Reply-To: <MW4PR02MB7186B3A2F8EDF388CA521498E1E99@MW4PR02MB7186.namprd02.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Apr 2022 21:02:24 +0300
Message-ID: <CAA8EJppMnDR15ZSS7FyMvDH0yshfNtgZgoYaxpYkJ3=xYm+Ggw@mail.gmail.com>
Subject: Re: [PATCH v6 5/8] drm/msm/dp: prevent multiple votes for dp resources
To: Sankeerth Billakanti <sbillaka@qti.qualcomm.com>
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "Sankeerth Billakanti \(QUIC\)" <quic_sbillaka@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Sean Paul <seanpaul@chromium.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 8 Apr 2022 at 20:12, Sankeerth Billakanti
<sbillaka@qti.qualcomm.com> wrote:
>
> > > On Wed, Mar 30, 2022 at 9:04 AM Sankeerth Billakanti
> > > <quic_sbillaka@quicinc.com> wrote:
> > >>
> > >> The aux_bus support with the dp_display driver will enable the dp
> > >> resources during msm_dp_modeset_init. The host_init has to return
> > >> early if the core is already initialized to prevent putting an
> > >> additional vote for the dp controller resources.
> > >>
> > >> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> > >> ---
> > >>   drivers/gpu/drm/msm/dp/dp_display.c | 10 ++++++++++
> > >>   1 file changed, 10 insertions(+)
> > >
> > > I'm not a huge fan of this but I'll leave it up to Dmitry. In general
> > > it feels like there should be _a_ place that enables these resources.
> > > Checks like this make it feel like we just scattershot enabling
> > > resources in a bunch of random places instead of coming up with the
> > > design for enabling them in the right place.
> >
> > I'd prefer to see a check for eDP in dp_display_config_hpd(). Or even better
> > to see that this function isn't called for eDP at all.
> >
>
> This needs to be called when eDP is not using the aux_bus path. If the eDP panel is
> given as a separate panel driver, then the resources need to be enabled here.
>
> If we don't want to support eDP without aux_bus, then we can skip this function.

I think it's up to you to decide, if it's necessary or not.
But if it is, please change it accordingly.

> > >
> > > In any case, if we do end up landing this patch, it sure feels like it
> > > needs to move earlier in the patch series, right? This patch shouldn't
> > > hurt even without the other patches in the series but if you apply the
> > > earlier patches in the series without this one then you'll have a bug,
> > > right? That means this needs to come earlier.
> > >
> > > -Doug
> >
> >
> > --
> > With best wishes
> > Dmitry
>
> Thank you,
> Sankeerth



-- 
With best wishes
Dmitry
