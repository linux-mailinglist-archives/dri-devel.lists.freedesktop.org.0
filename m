Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EB9501C1F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 21:43:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A58C10E42B;
	Thu, 14 Apr 2022 19:43:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE6310E3DD
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 19:43:07 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-e2442907a1so6284159fac.8
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 12:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=M9L3tL+brKffWDgtUhXXfH8uZus62KDBQoX+osGMsUs=;
 b=e+Y+QuSlCn4jI8BvhXLSmvpouUteQs8jzSmaSIV+AdFdIQpBkCcJuV17qvkWx3NE8Z
 oebQOf8umqim6moUjx101cZmivWwb2Md3H3//Vs0jL2mcCJXh8ueaQAf96pcpwV15tzJ
 rPK4K90cf8DTJI6xoHi1aicz0/aqeT2c33P3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=M9L3tL+brKffWDgtUhXXfH8uZus62KDBQoX+osGMsUs=;
 b=7EnYsNwtNkgs5r5GmC+j/LSCf1NvDQ0E5NLOpKU/lJ2j/yhVqcTJ3wZCsV7YVMf0sq
 qs8fXCZeK82Tb+5aHFe0RwK2XLBp0RXgH+HqKiSsQp/OITgFMRHv364ZNIbLZtvAieAb
 NopG8JzM2FOqDW7j+yOYYJLUyTPSma178bEYG+oE4xpYRgLr2w7rZrAadq+e+Q1cbF4U
 N5kFZh0458f3cHUQyj9PRU75xcYYb2hqznIJ6TXaUz9+ody7mL3BQcXsNjB/Xr75X3l6
 h93dw2woKvDREoR7IhzbMsxGBx+6SdXKbFKkD9DMN0+wDBpzZw+7QaWv+BCqVEO7tUUH
 qUSw==
X-Gm-Message-State: AOAM531j1Bv8mtTPpJTcSP9s5nO+3dApULw5UL84Of92X3aH6VXkF+Qy
 aQfvalMdWB7mIVOIdIOWjDFPd+hOWTXavOlq75Yyww==
X-Google-Smtp-Source: ABdhPJx8y+gx6rmS1IvAfn46VUdpA7EEYkTfX60jfg/bWjvKcPHAqhr185v+4LGpoLPKf+zIfWtOt4ow1k0ubmFVnzE=
X-Received: by 2002:a05:6870:558e:b0:e1:db7c:26aa with SMTP id
 n14-20020a056870558e00b000e1db7c26aamr71987oao.63.1649965387170; Thu, 14 Apr
 2022 12:43:07 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 14 Apr 2022 12:43:06 -0700
MIME-Version: 1.0
In-Reply-To: <20afcd97-4b8d-f770-151a-268b893b7c5a@linaro.org>
References: <1649938766-6768-1-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=Ui6BAsnTaJ2_TMh1Tnjtaw7FR92aWoUysS+UT=c0qB3Q@mail.gmail.com>
 <20afcd97-4b8d-f770-151a-268b893b7c5a@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 14 Apr 2022 12:43:06 -0700
Message-ID: <CAE-0n51fc-b-8VF7XP29=o8Xi86HQALGB-1u8n3b_3NjVyyJYw@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] Add support for the eDP panel over aux_bus
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Doug Anderson <dianders@chromium.org>, 
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>, devicetree@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Sean Paul <seanpaul@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Aravind Venkateswaran <quic_aravindh@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-04-14 12:20:31)
> On 14/04/2022 19:40, Doug Anderson wrote:
> > Hi,
> >
> > On Thu, Apr 14, 2022 at 5:19 AM Sankeerth Billakanti
> > <quic_sbillaka@quicinc.com> wrote:
> >>
> >> This series adds support for generic eDP panel over aux_bus.
> >>
> >> These changes are dependent on the following series:
> >> https://patchwork.kernel.org/project/linux-arm-msm/list/?series=613654&state=*
> >
> > You're basically depending on the last two patches of that series.
> > What's the plan there? In patchwork they're marked as "Not
> > Applicable". If they're good to go, maybe we should land them? If not,
> > maybe you should include them (with Dmitry as the author, of course)
> > at the beginning of your series?
>
> No, please do not resend patches. The patches in question are marked as
> 'Not applicable' as they are really not applicable to Bjorn's tree.
> It would be better to point to the correct patchwork:
>
> https://patchwork.freedesktop.org/series/98585/
>
> Note those patches still lack the R-B tag. I can include them anyway,
> basing on Sankeerth's Tested-by tag, but the formal R-B would also be good.
>

Can you resend those as not RFC?
