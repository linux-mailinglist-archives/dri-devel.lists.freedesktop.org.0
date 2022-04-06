Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF7E4F4F54
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 03:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7723A10EAB3;
	Wed,  6 Apr 2022 01:59:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A031E10EA98
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 01:59:44 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 x8-20020a9d6288000000b005b22c373759so811588otk.8
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 18:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=jv43f2rrIHjk1Fj7wJPYOjxueyGmJxQafkTafIj1hDc=;
 b=e2thw7ORFBl8BjqnMIlCXWzL8TEvHVFQvm51vKJ6HZWpwH+ikEQJ9uUr0XXWzGW/LA
 yvYoh4bLmeNTMzkPCkk//kXR/dxKm75XLsoiBJ1Al+b52tsq58jDPpGQv+E9tLhjL83i
 YLYPRMTNSc565Jq1KFxV+EQkYyiXSwK32k/7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=jv43f2rrIHjk1Fj7wJPYOjxueyGmJxQafkTafIj1hDc=;
 b=wY3Lxb52M+R0DtAccfaaUeioMqvT0956dNKBHIj6OeqX7KDXiXDpiq+hz29AilJlT8
 q6L2QIftsjRY45K6+9hoSnjYPwriF717f3PQ+DEoA53gu2S2qYQxNrkDFlx02vVgUYBw
 3PRuOlJqzO5PWFdkeXM24D2uyrNFw0C4+GTsaREnD5t+y+uNswoRvfsiIX8m8P4DZtid
 oZQINKX5kn/L5x7qUmIzPNn73peEVAt6n4K9zm0NuyoNmD4I2pBMI+EPZoHOI6tA8fqL
 ufeeAErV+Izs4FKLsJ4rTw0DViYKi3sbyHF0ZOCyVOV6331aPc7EB6tvDkdY7PuMrBOC
 pC5A==
X-Gm-Message-State: AOAM533dTwzQ7i1zVh4Jt4LRr/7rWSOFck9wDnEyzQ5JMOl2026LtWTK
 LQw59AhuJA2GDUEOg2s2I+QS2Iyh/10is6erfjRo+g==
X-Google-Smtp-Source: ABdhPJzJE9a18gRAhOd6LPf+zCiWM3yrZAtlUUjLRrak7Q4fo7tUpBr2ScsKEhil00lOrpnbqc7pUFELqtLxYKz0Tiw=
X-Received: by 2002:a9d:b85:0:b0:5cb:3eeb:d188 with SMTP id
 5-20020a9d0b85000000b005cb3eebd188mr2258425oth.77.1649210383948; Tue, 05 Apr
 2022 18:59:43 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Apr 2022 18:59:43 -0700
MIME-Version: 1.0
In-Reply-To: <20220405234121.358948-1-dmitry.baryshkov@linaro.org>
References: <20220405234121.358948-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 5 Apr 2022 18:59:43 -0700
Message-ID: <CAE-0n52u=wx403GmAvccbk1JgOgK4zz+MTBS60hvJT701WdKHA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: remove unused plane_property field from
 msm_drm_private
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-04-05 16:41:21)
> Remove from struct msm_drm_private unused field plane_property.
>
> Fixes: 7d36db0be3b9 ("drm/msm/mdp5: switch to standard zpos property")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/msm_drv.h | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index ee3093890d97..3bce127953ec 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -192,9 +192,6 @@ struct msm_drm_private {
>         unsigned int num_bridges;
>         struct drm_bridge *bridges[MAX_BRIDGES];
>
> -       /* Properties */
> -       struct drm_property *plane_property[PLANE_PROP_MAX_NUM];
> -

Can we remove PLANE_PROP_MAX_NUM too?
