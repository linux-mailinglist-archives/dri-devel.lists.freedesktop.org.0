Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3BA50EA4D
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 22:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 926EB10E127;
	Mon, 25 Apr 2022 20:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C9BB10E204
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 20:26:10 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-e2442907a1so17303571fac.8
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 13:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=GY8nfdZIIJMjKD8udXATRrBvCI90FRL703LkUIvDAlU=;
 b=C/ET6AeSQZ2SaYHzT8jZQsZxbTkp+o+3wp1UMk5UJoMbzgWL+QL4x+sxVHHWDGwNGb
 PghAnpgDCD7NLYJwGGMd5NkLMfvp+9hTzOpzn++XyH6DAuYTvuO2+SB16OoOUfhX9kWs
 iTg0xVBII2dSOGValyuc370C5fb0UdUQ7D0fU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=GY8nfdZIIJMjKD8udXATRrBvCI90FRL703LkUIvDAlU=;
 b=mQgTVf2HuS35bQ53H7Wl++HWOYtYq2Losiuz+wx2wilYo7mwG/zvFoScCICloLbugY
 QkBuSH+bEZ/XpUwsD8YRCNeaUImnehMN/iAurEqe6fKgptvVXuD5xt+my68cp8aeKB3k
 LX1aebdJtxlKwtcAELZFTYPuTva+45cnXuw+4OvemwLp0LmmGQP1wNQCjF8NGQFy1VLw
 f1tb3y/mTLRXPOCSu/6bFnNuZaldUfgIt5MEoeP6weCKTA8rXrAHGfnh43rL5A/GsOTv
 CrAUxtHzypqzV3OXx8h7zt9OwzDin3s526UhbfFw/YQZWQ3TaqVCSyz1y7KyYXrJuluF
 y1Rg==
X-Gm-Message-State: AOAM533S/e7NUUAn9e9d0yEC2Ag9eqZWwWd7epY76cChCHCdxRl42KJs
 ebeWK58zgWWhwj96b3skSTaQ6wyZhIsmdHj4KBsCqw==
X-Google-Smtp-Source: ABdhPJwtgqfdj2bI0xf9NqacpOrKLAx8wbR4ILpgTMgDRv4vIFNkUSXqfxqjSLpsTgoPKZ0wedCV8wLpGgv4u2sksLA=
X-Received: by 2002:a05:6870:15ca:b0:e9:551:6d1c with SMTP id
 k10-20020a05687015ca00b000e905516d1cmr6326639oad.193.1650918369702; Mon, 25
 Apr 2022 13:26:09 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 25 Apr 2022 13:26:09 -0700
MIME-Version: 1.0
In-Reply-To: <MW4PR02MB7186108BA0131C8BFC46A219E1F89@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <1650618666-15342-1-git-send-email-quic_sbillaka@quicinc.com>
 <1650618666-15342-2-git-send-email-quic_sbillaka@quicinc.com>
 <CAE-0n51VBDmOOworjpuB1nqVD-7055yqvn2Er5H13qgFC5R2AQ@mail.gmail.com>
 <MW4PR02MB7186108BA0131C8BFC46A219E1F89@MW4PR02MB7186.namprd02.prod.outlook.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 25 Apr 2022 13:26:09 -0700
Message-ID: <CAE-0n51oUFkYuZ5qd2CbnaUGo2xcAjU+F0M+Kptk8b=7curH0Q@mail.gmail.com>
Subject: RE: [PATCH v9 1/4] drm/msm/dp: Add eDP support via aux_bus
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

Quoting Sankeerth Billakanti (QUIC) (2022-04-25 02:39:43)
> Hi Stephen,
>
> >Quoting Sankeerth Billakanti (2022-04-22 02:11:03)
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> >> b/drivers/gpu/drm/msm/dp/dp_display.c
> >> index d7a19d6..055681a 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >
> >Some nitpicks
> >
> >Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> >
> >> @@ -1508,7 +1509,8 @@ void msm_dp_irq_postinstall(struct msm_dp
> >> *dp_display)
> >>
> >>         dp_hpd_event_setup(dp);
> >>
> >> -       dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
> >> +       if (!dp_display->is_edp)
> >> +               dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
> >
> >Did it turn out that in fact DP isn't ready still to setup even after delaying the
> >irq?
> >
>
> The host_init, config_hpd, phy_init and enable_irq are happening in modeset_init already for eDP.
> So, I am not scheduling the EV_HPD_INIT_SETUP event for eDP. I am not modifying the delay for DP.

Cool. That didn't answer my question though. Why does DP still need the
delay? I thought recent changes made it unnecessary.
