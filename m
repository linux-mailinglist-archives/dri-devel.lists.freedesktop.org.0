Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D693F82DE
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 09:06:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 450946E51C;
	Thu, 26 Aug 2021 07:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B8E6E51C
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 07:06:37 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 m7-20020a9d4c87000000b0051875f56b95so2270015otf.6
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 00:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Fec8a8GcTBAqynn2ZZ7COpqa2SBkQGSlbtis8MeqbXA=;
 b=hBr3EdLiF710gt5w/7Ti6OPVvPt7kJNDQbZDuHcQcwmEP36zonNG1PzQEOnSfQmh6R
 LqyeSucKdE+WhY3M35Oe0js8ljT7e5Uhvty6o8QZNtmw0ZZK0TwNKIAhq0SQM+iQOS5q
 pBT8x6egV2yIYFMfJglx/8pEwVoidmAkWS8WQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Fec8a8GcTBAqynn2ZZ7COpqa2SBkQGSlbtis8MeqbXA=;
 b=kq3CaJwjG02sggf1Rsu6EifNNXq6eug2wRH1+EpKvGs0KquRSjKVor6ZXUuglvjRzT
 611YVCZqp2PwqGxyXMIbUgvXeeBsCTiS7YVGKWpXVYXLtmCZT6ByZezaAuN6XQG/eStp
 ZkwV7aLY7TNEo3sQeM/ugIyhn3mzPKceD64FVsg1DSgCTUxpqGqHHKihXZhiBAQuKAaA
 BMz7Tl+pDNmsrwFIJ1dz6zt4tzwHk5ObFlTlVT3UJzAdSL2EHHWo4Ss2qBl5BHkN69fK
 o2a8nDhFSyIDwNPvjawKFiXS8bvVIrYCLau6bCpUuJE6W2M6/4pt/G/PSVfcBoRtPgmS
 /GLg==
X-Gm-Message-State: AOAM530t9jsP08wGacrIjNfVuzKsH5HMhoXPovpF58F9GOEARpzstOz7
 1JQC0UEIvqxsXbKF9nuqtZQab6FFsal+X5HYyRzF2g==
X-Google-Smtp-Source: ABdhPJxX2h4Sf0+gqNiQoqCR55xo9CLNG4eyz7rKWgznAHyCt52DcMIUBYImUTQuoIE/k/3zVeRSzxCSsUkwkxlhKnk=
X-Received: by 2002:a05:6830:88:: with SMTP id
 a8mr1891301oto.233.1629961596490; 
 Thu, 26 Aug 2021 00:06:36 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Aug 2021 07:06:36 +0000
MIME-Version: 1.0
In-Reply-To: <20210825234233.1721068-3-bjorn.andersson@linaro.org>
References: <20210825234233.1721068-1-bjorn.andersson@linaro.org>
 <20210825234233.1721068-3-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 26 Aug 2021 07:06:36 +0000
Message-ID: <CAE-0n50X5vKU7arknufaj17YQ0UspET_oN9u+if89q4Y-DvTUA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] drm/msm/dp: Modify prototype of encoder based API
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>, 
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Bjorn Andersson (2021-08-25 16:42:30)
> Functions in the DisplayPort code that relates to individual instances
> (encoders) are passed both the struct msm_dp and the struct drm_encoder. But
> in a situation where multiple DP instances would exist this means that
> the caller need to resolve which struct msm_dp relates to the struct
> drm_encoder at hand.
>
> Store a reference to the struct msm_dp associated with each
> dpu_encoder_virt to allow the particular instance to be associate with
> the encoder in the following patch.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
