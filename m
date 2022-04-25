Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F45150EA74
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 22:27:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B1B10E204;
	Mon, 25 Apr 2022 20:27:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7DCD10E212
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 20:27:06 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id r85so18444543oie.7
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 13:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=J5gVHKISx3QJ+9rbfiKPE8jzZb4JPDy2bmFXYVfE7QI=;
 b=dHc3YQjaHxUWJqNY/sPAmimZ9RDs3lraMar8s5cKozkGHUkF3rxjnHmCn6Z3XZuWd3
 soVVIbBYqCNe/KWp8KrRERuFKQrw9kpCcHNJ7e25h3lR/3suBB6YxXizuwD4+NKVgJ6z
 aaiFNkWVLuoswGM9HV30j1ZfMMvP34dvqX3A0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=J5gVHKISx3QJ+9rbfiKPE8jzZb4JPDy2bmFXYVfE7QI=;
 b=FvwcLA7qIyZJjedwa8YK/X6VaQbGgRou/BybeU+F9uMS7jSGMc4EHwmaCMTAozn/rN
 d9BGnwXLDbBpT4osFyrI5I3X+P5fvOk1w7mWGpK+WXRbsaiL2My/70Vd8PfpTUp6WABH
 8VBK1ZKfQr3Lqu+bgQhHDtwKw+BcrbtuFq67OAstyy++lKQUFM6jgKfF/pR8ODa7x8rD
 RVkkUouPaeTxrFN0Qwto1AGXQxz9Ob5YSq4RvRtbmhRfNytBW/gc7kOc+VIWEuiUpqPQ
 7X/AVXRthu6TEj6D9evDlMAfDqVxYoVpoPDL3iBkTHtkyisjhaUWiVjw+W+8ck7EmcIf
 Yj0g==
X-Gm-Message-State: AOAM532W+uMs6TCnRSWBxHjR4hZKIOv34Kh2/pmuKnQaqtPRFQjQoTAg
 ajhHR/vuMc1xLC5xgmqxpL8oDQEvcLTyZGAtNnKRnA==
X-Google-Smtp-Source: ABdhPJweTLbXJH2p+7bcg8l/IAqcZqisAM9oKT2YLwXZj7bUL1azgz2HPsfUj1mwa18M+e2j95UlryAHcEs29q5FWOw=
X-Received: by 2002:a05:6808:1296:b0:325:8fb:68f3 with SMTP id
 a22-20020a056808129600b0032508fb68f3mr5256884oiw.193.1650918425947; Mon, 25
 Apr 2022 13:27:05 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 25 Apr 2022 13:27:05 -0700
MIME-Version: 1.0
In-Reply-To: <MW4PR02MB7186AE3B9B573FB1C594DA35E1F89@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <1650618666-15342-1-git-send-email-quic_sbillaka@quicinc.com>
 <1650618666-15342-3-git-send-email-quic_sbillaka@quicinc.com>
 <CAE-0n52tKt3yywZFEKobet4t9xXA_GbTDcUqPPEj5A-KkDET3Q@mail.gmail.com>
 <MW4PR02MB7186AE3B9B573FB1C594DA35E1F89@MW4PR02MB7186.namprd02.prod.outlook.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 25 Apr 2022 13:27:05 -0700
Message-ID: <CAE-0n53KXNdt64xLqFHBaj3z7ocV-b5fUxpxthkFw7-26EdB-A@mail.gmail.com>
Subject: RE: [PATCH v9 2/4] drm/msm/dp: Support only IRQ_HPD and REPLUG
 interrupts for eDP
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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
 "dianders@chromium.org" <dianders@chromium.org>,
 quic_vproddut <quic_vproddut@quicinc.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, "steev@kali.org" <steev@kali.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 Aravind Venkateswaran <quic_aravindh@quicinc.com>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "sean@poorly.run" <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Sankeerth Billakanti (QUIC) (2022-04-24 19:55:29)
> >Quoting Sankeerth Billakanti (2022-04-22 02:11:04)
> >
> >>  int dp_catalog_ctrl_get_interrupt(struct dp_catalog *dp_catalog) diff
> >> --git a/drivers/gpu/drm/msm/dp/dp_display.c
> >> b/drivers/gpu/drm/msm/dp/dp_display.c
> >> index 055681a..dea4de9 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >> @@ -1096,6 +1097,13 @@ static void dp_display_config_hpd(struct
> >dp_display_private *dp)
> >>         dp_display_host_init(dp);
> >>         dp_catalog_ctrl_hpd_config(dp->catalog);
> >>
> >> +       /* Enable plug and unplug interrupts only for external DisplayPort */
> >> +       if (!dp->dp_display.is_edp)
> >> +               dp_catalog_hpd_config_intr(dp->catalog,
> >> +                               DP_DP_HPD_PLUG_INT_MASK |
> >> +                               DP_DP_HPD_UNPLUG_INT_MASK,
> >> +                               true);
> >> +
> >
> >It seems like only the plug and unplug is enabled for DP here. Is replug
> >enabled for eDP when it shouldn't be?
> >
>
> By default, all the interrupts are masked. This function is not executed for eDP
> anymore because the host_init, phy_init and enable_irq are all done from
> modeset_init for eDP with aux_bus. So, none of the eDP hpd interrupts are
> enabled or unmasked before pre-enable.
>
> The replug interrupt is unmasked for DP and eDP from the dp_hpd_plug_handle()
> and masked from dp_hpd_unplug_handle().

Why is replug enabled for eDP?
