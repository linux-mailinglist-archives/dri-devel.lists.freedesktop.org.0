Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3726255A574
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 02:23:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB6E710F5B3;
	Sat, 25 Jun 2022 00:23:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15CB610F5B3
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 00:23:28 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id k24so5593679oij.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 17:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=aM/iH2gWxnXoR4sehLWupEN2NCl54gcxQiHVIQqiXeA=;
 b=XUdqjNBs7l7aNzEdKeTcgl6xsOJP5AbQJTNWTxsogl01wW+lDC4wB0Xt26N/RB/+rq
 JABElLRg7MJ6OGAtiRkQnVe0u96orezmaKZPE59BcfZZBv8pyAvPk30t9bsz+nDinPPC
 dK+MsucwjJtNSvhtWaYtTlcVElPQbB9mTVnLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=aM/iH2gWxnXoR4sehLWupEN2NCl54gcxQiHVIQqiXeA=;
 b=8DdJQZ2PjGrO8nrRssvqXBOyuK+RxWRnZe2LoA1VLm7cP9sNWMnvikRgJQL1KkDScz
 Y4Obbi31XZUv9fkreFwiWpsb6w1WMUw+nGFOxsHMYc5Sn6F2ro0QHDb/isyVeOcy9aOB
 Hvwswzg4P/2CeQAYW09603bLA27ltKdPo0s5MujVXrQo7iXFw5Tb8iZw/lLncuuBQPNy
 so4l8680qUuYhbgvb5TzIsumRdZF+u3be/i0jCphwD57+b5JymRJfd+jsEpBJqHPVWvD
 UmbyB3titOoQfButCEw737g/3k2jUsBt5llaxuidU1Qm6xs5tFsMVAD6OtRHwSVJA+fD
 6obQ==
X-Gm-Message-State: AJIora+9euvMeVvgK4QL2IwqVWL+YfXhiWGwJPuDCIduuMLLbDHU6+CZ
 CN8VFNWtPCG07aKrxi6gkShDAjCjfy7B5BYO9HN8MQ==
X-Google-Smtp-Source: AGRyM1sudyl98+v08a1GhP8uqyAKl4OiZWmeoxBotLTLTNJ/RuYkbkU3l7KlHSFvKfOhbiTH7WhlpREVG+SjVY88HBc=
X-Received: by 2002:a05:6808:171c:b0:334:9342:63ef with SMTP id
 bc28-20020a056808171c00b00334934263efmr1076539oib.63.1656116607321; Fri, 24
 Jun 2022 17:23:27 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Jun 2022 17:23:26 -0700
MIME-Version: 1.0
In-Reply-To: <CAE-0n51PiVo042oj8JrAxNTytmAoQx0kdqs_iCDffXa1+iur1A@mail.gmail.com>
References: <1656090912-18074-1-git-send-email-quic_khsieh@quicinc.com>
 <fa7f8bf1-33cd-5515-0143-6596df2bd740@quicinc.com>
 <CAE-0n51g-EVsC-i9=sJV-ySa8VnE+yT7cg=b-TNMi9+3uBiOVA@mail.gmail.com>
 <326912ff-9771-0711-366d-79acd436908b@quicinc.com>
 <CAE-0n51qrdrFtSr0vRwgYkMgSZfnzQuinaUROQsp30QoDchWQA@mail.gmail.com>
 <0ff3d6a3-dc5c-7c77-f8a1-6c4f6c1a3215@quicinc.com>
 <CAE-0n515hMKqQ+Vj1Sg54PpwkbWMYJ77QN+y+KZNBWymjhpWKw@mail.gmail.com>
 <66ff4642-f268-f5b0-7e28-b196368c508a@quicinc.com>
 <5cf094cf-343a-82d7-91c4-1284683f9748@quicinc.com>
 <CAE-0n51PiVo042oj8JrAxNTytmAoQx0kdqs_iCDffXa1+iur1A@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 24 Jun 2022 17:23:26 -0700
Message-ID: <CAE-0n50Qq2_eayXAUMzU29wKkpa6JZTG6J1dthUY1Y9tAjy_2Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] drm/msm/dp: decoupling dp->id out of dp
 controller_id at scxxxx_dp_cfg table
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 agross@kernel.org, airlied@linux.ie, bjorn.andersson@linaro.org, 
 daniel@ffwll.ch, dianders@chromium.org, dmitry.baryshkov@linaro.org, 
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
Cc: linux-arm-msm@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Stephen Boyd (2022-06-24 17:11:01)
> Quoting Abhinav Kumar (2022-06-24 17:03:37)
> >
> > So let me try to explain this as this is what i understood from the
> > patch and how kuogee explained me.
> >
> > The ordering of the array still matters here and thats what he is trying
> > to address with the second change.
>
> The order of the array should not matter. That's the problem.

It seems like somewhere else the order of the array matters, presumably
while setting up encoders?

>
> >
> > So as per him, he tried to swap the order of entries like below and that
> > did not work and that is incorrect behavior because he still retained
> > the MSM_DP_CONTROLLER_x field for the table like below:
> >
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> > b/drivers/gpu/drm/msm/dp/dp_display.c
> > index dcd80c8a794c..7816e82452ca 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -140,8 +140,8 @@ static const struct msm_dp_config sc7180_dp_cfg = {
> >
> >   static const struct msm_dp_config sc7280_dp_cfg = {
> >          .descs = (const struct msm_dp_desc[]) {
> > -               [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000,
> > .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
> >                  [MSM_DP_CONTROLLER_1] = { .io_start = 0x0aea0000,
> > .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
> > +               [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000,
> > .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
> >          },
> >          .num_descs = 2,
> >   };
> >
> >
> > The reason order is important is because  in this function below, even
> > though it matches the address to find which one to use it loops through
> > the array and so the value of *id will change depending on which one is
> > located where.
> >
> > static const struct msm_dp_desc *dp_display_get_desc(struct
> > platform_device *pdev,
> >                               unsigned int *id)
>
> Thanks! We should fix this function to not overwrite the id.
>

Ah nevermind. I mixed up dp->id and h_tile_instance thinking one was
overwriting the other but that doesn't make any sense.
