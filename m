Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 700683D6A70
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 01:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 923D96EB07;
	Mon, 26 Jul 2021 23:55:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA6196EB47
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 23:55:51 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id 21so13039844oin.8
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 16:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=aoD4jTfRbzylcA4bNLcfmr8Z+HRIOIxaPk90sso0ATU=;
 b=eQQhbr+z1dG29juiKiHPhvhbjUjYibakqGnSF4idMAK1hnTXJ3j2IVeHu37sbE1AIk
 nD5EMYai5v4xcjYBOPRRpBYhe50X/rIN3mKJ47uQiui9FNJ9cJ9Il+q1PE1UEpMocrOf
 Jokd9Bk5aK4znpuUCHl2Q09JwDeYHuWxCthT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=aoD4jTfRbzylcA4bNLcfmr8Z+HRIOIxaPk90sso0ATU=;
 b=fi42fJVFaAZgUawOTQT90465v/Sxvhi+To8WOCeUqwOVX78g3aI0609gar8OSFLujw
 87EMAOu+q+h6SsVrCyURn36986GJShZ/zgwn1tRSBVAJn5yLZ4FHbXQr2KHVRrtCIilJ
 Fwq2UYLAMGoCEi7rf5cFhRJPSDInGPvHxP0yOG8CD9gxR6i9T59E7AdaOE+qdYUnbUxw
 yAfbM1RsYVYhcF8cfbK5LJQz5jKUx0cqnMBlyjiGeR58OwZ2GS2DY94t8wDbgUMBpSTY
 qHu43a4c2Jo6Ud20SCD51ZjWwIpkuqkoVFu5hizkHiD/F354PgS3RCBBbftWj0yjP2Wu
 JD+g==
X-Gm-Message-State: AOAM533tn5BMFwSEwPXYOoX27NUX/+uUiwyBLefl3yFLWEx0jQC3FlJs
 fLkq30PgwTJGDcBCeq+8krI1XQ43xBQctrgd1CSeFw==
X-Google-Smtp-Source: ABdhPJw65cG9TGz3WiBUJWp99aUzz4g/0pjfJNvmUosztg4FLwuh1PpAx+TFNVLnqwkG0FMULV596wJRHK85NE7MZGk=
X-Received: by 2002:aca:4dc6:: with SMTP id a189mr1129053oib.166.1627343751055; 
 Mon, 26 Jul 2021 16:55:51 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Jul 2021 19:55:50 -0400
MIME-Version: 1.0
In-Reply-To: <20210725042436.3967173-3-bjorn.andersson@linaro.org>
References: <20210725042436.3967173-1-bjorn.andersson@linaro.org>
 <20210725042436.3967173-3-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 26 Jul 2021 19:55:50 -0400
Message-ID: <CAE-0n53utmLLoJqqffx_-MoiereWAeBFe9nPjAizKeuKRwedHA@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/msm/dp: Modify prototype of encoder based API
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>, 
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
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
Cc: linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Bjorn Andersson (2021-07-24 21:24:32)
> Functions in the DisplayPort code that relates to individual instances
> (encoders) are passed both the struct msm_dp and the struct drm_encoder. But
> in a situation where multiple DP instances would exist this means that
> the caller need to resolve which struct msm_dp relates to the struct
> drm_encoder at hand.
>
> The information for doing this lookup is available inside the DP driver,
> so update the API to take the struct msm_drm_private and the struct
> drm_encoder and have the DP code figure out which struct msm_dp the
> operation relates to.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
