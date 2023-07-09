Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BD174C6E7
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jul 2023 20:00:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E91710E11F;
	Sun,  9 Jul 2023 18:00:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7362E10E119
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jul 2023 18:00:13 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-c6cad6a3998so3380258276.3
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Jul 2023 11:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688925611; x=1691517611;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=u4DBsm9V7fTDvKx918DKQDmxOgvOJF74sUuwO0ox2Ec=;
 b=vxRgIcDZCdKysN9u5e/P0Mk+1qTauAmLbQGUgHGKEnTrrVjVfF8aRQgXNkdpwNKtso
 z8OW1HHfk+BP9+3b0NYGgmo1cqC1dNep8cPJs0DCf5IEpOOl2YUrPVFZ3c6yFCuGZy4i
 SVHYFmCtbVn9/s2hoZJ49WHlQH59W90pfh9lA/eb/+pugtDqnZJc/0IJahTTiqaY4Vzk
 1WrlPZDLO5SgPrk6xtqbFrFD6MccqYfdC9JgfnhpS9uXoCHuwqdGVsGecaY9zjvID2l4
 PyqhTrEHJkApgYxcRt6QgGsaPi7YlwCJmtJ/KwTYz07w+dIONIm5ui/y8eKvNjaOtX+M
 Syrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688925611; x=1691517611;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u4DBsm9V7fTDvKx918DKQDmxOgvOJF74sUuwO0ox2Ec=;
 b=Fed+mcMoaCflns2QIQVrqp+jrwYvAjQPdeQIiBO3MfaeRRI0X/lGWhkEaFJAe+HX3W
 ixZwbYkbVddNo1P7QRvK98g5X2Ie6r/2MEoTAukokk+5uNHR7y2kCqfMbj3q3NKtAAZ7
 VuuTarJNjJf4h5pmt4QpGWQce6MiQ9cxI6nfCOuqtnM+i8kRAgLjHdrS07jWOLTWZt36
 c8cTxr/iRVdkPEcWQ092z4qKkWXooWuR+I4K3uHaTGtzgBIf/xVd/9rf7mOVjMbwPOET
 dYmQFsbLVXWBjzGXFKEiqElUIFoNmPa7WZWcs7rMcg0M7X3YwbVJotAPpe03GVlt2awO
 NAfw==
X-Gm-Message-State: ABy/qLZptPhi+Cqf2udkksDetCEO5L4Kflrs9xeF3OvUorQ04pAnMAJi
 WPTeZWV3i+aBujo0wTKLMdwcxVukCh8HCpcvc3lHxA==
X-Google-Smtp-Source: APBJJlEWXBHCrZHA3JCHjoudX7Ecgk5TDBCrrA3oUgTtzhr9PEaNnulSiA1S6XZKAEopv26+3p9AtmwqEhS9liy+4l4=
X-Received: by 2002:a81:92d3:0:b0:579:f8f2:b5b5 with SMTP id
 j202-20020a8192d3000000b00579f8f2b5b5mr9459703ywg.41.1688925611714; Sun, 09
 Jul 2023 11:00:11 -0700 (PDT)
MIME-Version: 1.0
References: <1688773943-3887-1-git-send-email-quic_khsieh@quicinc.com>
 <1688773943-3887-2-git-send-email-quic_khsieh@quicinc.com>
 <fc5501cf-c335-81f7-1ad7-26fdc1b6922d@linaro.org>
 <72cb729b-a9d3-3e5b-c70a-0761f47a6779@quicinc.com>
In-Reply-To: <72cb729b-a9d3-3e5b-c70a-0761f47a6779@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 9 Jul 2023 21:00:00 +0300
Message-ID: <CAA8EJpqKVBKRpFs=sS2rwrJpDP22sNrd00kCYm-b_ZB96O=s5g@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v1 1/5] drm/msm/dp: remove pm_runtime_xxx()
 from dp_power.c
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: vkoul@kernel.org, quic_sbillaka@quicinc.com, quic_jesszhan@quicinc.com,
 andersson@kernel.org, freedreno@lists.freedesktop.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, marijn.suijten@somainline.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 9 Jul 2023 at 20:22, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 7/7/2023 5:06 PM, Dmitry Baryshkov wrote:
> > On 08/07/2023 02:52, Kuogee Hsieh wrote:
> >> Since both pm_runtime_resume() and pm_runtime_suspend() are not
> >> populated at dp_pm_ops. Those pm_runtime_get/put() functions within
> >> dp_power.c will not have any effects in addition to increase/decrease
> >> power counter.
> >
> > Lie.
> >
>
> Even if the commit text is incorrect, review comments like this are not
> helping the patch nor the author and will just get ignored anyway.

The review comment might be overreacting, excuse me. I was really
impressed by the commit message, which contradicts the basic source
code. pm_runtime_get() does a lot more than just increasing the power
counter.

> >> Also pm_runtime_xxx() should be executed at top
> >> layer.
> >
> > Why?
> >
>
> I guess he meant to centralize this around dp_display.c. Will elaborate
> while posting the next rev.
>
> >>
> >> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/dp/dp_power.c | 9 ---------
> >>   1 file changed, 9 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_power.c
> >> b/drivers/gpu/drm/msm/dp/dp_power.c
> >> index 5cb84ca..ed2f62a 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_power.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_power.c
> >> @@ -152,8 +152,6 @@ int dp_power_client_init(struct dp_power *dp_power)
> >>       power = container_of(dp_power, struct dp_power_private, dp_power);
> >> -    pm_runtime_enable(power->dev);
> >> -
> >>       return dp_power_clk_init(power);
> >>   }
> >> @@ -162,8 +160,6 @@ void dp_power_client_deinit(struct dp_power
> >> *dp_power)
> >>       struct dp_power_private *power;
> >>       power = container_of(dp_power, struct dp_power_private, dp_power);
> >> -
> >> -    pm_runtime_disable(power->dev);
> >>   }
> >>   int dp_power_init(struct dp_power *dp_power)
> >> @@ -173,11 +169,7 @@ int dp_power_init(struct dp_power *dp_power)
> >>       power = container_of(dp_power, struct dp_power_private, dp_power);
> >> -    pm_runtime_get_sync(power->dev);
> >> -
> >>       rc = dp_power_clk_enable(dp_power, DP_CORE_PM, true);
> >> -    if (rc)
> >> -        pm_runtime_put_sync(power->dev);
> >>       return rc;
> >>   }
> >> @@ -189,7 +181,6 @@ int dp_power_deinit(struct dp_power *dp_power)
> >>       power = container_of(dp_power, struct dp_power_private, dp_power);
> >>       dp_power_clk_enable(dp_power, DP_CORE_PM, false);
> >> -    pm_runtime_put_sync(power->dev);
> >>       return 0;
> >>   }
> >



-- 
With best wishes
Dmitry
