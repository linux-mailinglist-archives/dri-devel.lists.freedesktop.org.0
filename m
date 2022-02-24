Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF6C4C34D6
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 19:40:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E86E10E169;
	Thu, 24 Feb 2022 18:40:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042DF10E1A0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 18:40:03 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id j2so4116066oie.7
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 10:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=JG8OwsrxHVatgWkESDwLdKHhhAoyBfhLVcqDq6Xl4j8=;
 b=Nue9dIyLnLRe51dVkAI9WgHex7MOMePw8sXd9sVZ39rl9dgLANUQngeIVHGPbKj6eV
 3O1kZoMWMcr61E8XZwkNNSfVhBdJLiHZAiFspq0RiIXI2UqCFSvgde2iSFiEHH28tvqd
 a/Sc0t6/OxUTUQWKB4AllUyv3M9MW1ZPZ/KO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=JG8OwsrxHVatgWkESDwLdKHhhAoyBfhLVcqDq6Xl4j8=;
 b=s1gFUzQs3MtYkHnU7gDlrWl0PpZEOZCJ3YfiSRhaZXRbmTvW9APZIKiGbnQFyx0mHW
 VriAoHFi1Gh7yAtfnb/Ah/Dr2FWMXKR9HhaXSyEaN+wRxWicj4Va09AhI2cBcQmWZ7CH
 hVS8bnkM52AOhSrp2yQ+cUmTUa3VYJHRrpGStPRUNysaB+8lTV0POuO2TVcI+9fugCnv
 xMMN4t65699rOPKonO7Sm0+FY85LR6HrSa1wJ6rD8R0cvpivLud6rHpgcCQrtbJayVAi
 6du0lCueKBGViVVJWXk3Yjuidmf/zSk6FJ4oWgLuK3d0itin0wt/hxGPIc65w76M3dlB
 ZM6w==
X-Gm-Message-State: AOAM531eadkWMtxE5uITk6Z6Cu87WZb9VrCz8Z0wwL+pbWK+fqsobV+C
 vBHBbjpeFHgeMLj8S0E8dKp308h80GgWCoMp6AK4aw==
X-Google-Smtp-Source: ABdhPJx3XVZBAQZNQYSBRrLu+brA6da/H1Y+gwNqMyQmx/VI8HDEXVpWlfluK1fpgehTBZ551KVTM8WR/64X1gQR5m8=
X-Received: by 2002:a05:6870:5829:b0:c8:9f42:f919 with SMTP id
 r41-20020a056870582900b000c89f42f919mr1934057oap.54.1645728003149; Thu, 24
 Feb 2022 10:40:03 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Feb 2022 10:40:02 -0800
MIME-Version: 1.0
In-Reply-To: <1645122930-23863-4-git-send-email-quic_khsieh@quicinc.com>
References: <1645122930-23863-1-git-send-email-quic_khsieh@quicinc.com>
 <1645122930-23863-4-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 24 Feb 2022 10:40:02 -0800
Message-ID: <CAE-0n50nMVEG5ccU=m0hNoyPnWvyugjRSXL9hoW=VOxm6+w2uw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] drm/msm/dp: replace DRM_DEBUG_DP marco with
 drm_dbg_dp
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-02-17 10:35:30)
> Since DRM_DEBUG_DP is deprecated in favor of drm_dbg_dp(NULL, ...),
> this patch replace all DRM_DEBUG_DP with drm_dbg_dp().
>
> Changes in v4:
> -- replace (strucr drm_dev *)NULL with drm_dev
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
