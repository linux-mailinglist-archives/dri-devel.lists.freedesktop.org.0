Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A84ED4CC7A6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 22:11:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D0210ECD0;
	Thu,  3 Mar 2022 21:11:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A209810ECCE;
 Thu,  3 Mar 2022 21:11:15 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id d3so9732472wrf.1;
 Thu, 03 Mar 2022 13:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jye9sG2e7guSL+XkxjuDpz9zKUvCzbczzcyn6VXMn/4=;
 b=WlWvof+JqXVsRd9apJd50cF/PMSOpTDenWGWYpkbGhUy6cZ6X+vRNd2W+i9L+iTp+E
 dyCTuqZyIWsWXYofbP8hbOVT9SXwbMaw9TmXRYMF5UJo7dQ375UBFZOvArtKjFJZ2MAR
 izsGwbIdS1cHwzkXG7JLFXOHxaVMMcOZR8p8xAIsyZr7kkH/KrxXq25FOINQBWBzVuzF
 4epJfzS59UBru4Y5+RSwDL3GHyM4aZEQogBF4aYqZutHknmX9ktrCxI0Hz5jkKObzE3x
 JWz/mCoYrJ4LV3wX/bnDVvWcwAnwz9UNxhseROWWbmLl1K86M71tupRCidRVSI56zhm8
 zVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jye9sG2e7guSL+XkxjuDpz9zKUvCzbczzcyn6VXMn/4=;
 b=wOuZZLGp509CyTAFuTC7hrZfqUX6Sa8JQWeRR+V5IfJ0XNts0OvWJHHV7uxMf4g5l0
 WEzmN5b7r8bf8DY8c8hsZrM/XRwAsyrMNVYmNCKPu4hv/37PuevOpXEhbVUWFwFT1CuN
 wDAxWkwxvcHSh7b/30HvwYN/dPTRs7cc3znJCW3Gv3PLGSpzkZIPJ8VQW8etnW4fjgii
 t1ulsqhYLcFr9tBF9m1x8F+FgCGyEARVHgV0utfP+o4/9TZ3VijGCQbgHg77I0bJSwAE
 hAhDLa9zAI1BGe70iWLV2z3vtlSXcTo2z0amyB53B48tk6MEsgnm1TLLYqQYVZ/7y76+
 DSbg==
X-Gm-Message-State: AOAM530LakUoVaI2s3J5JI07z+KQNazYDp1wDVlkx+Cg1lOpaYRh6SKB
 kh3gNi1mRWvWQ/n8IEH4ZziE7x3kiG07dr9RMsQ=
X-Google-Smtp-Source: ABdhPJzB4WtMzRM3XDI9bRh4CZsC8i9GN2+hN6rMt+voo6lSphjjflunNJUvo59Cu6gcZebWOsNqC6X/LVLyKNI3MJ0=
X-Received: by 2002:a5d:5382:0:b0:1f0:2f64:5a5a with SMTP id
 d2-20020a5d5382000000b001f02f645a5amr6921862wrv.418.1646341874028; Thu, 03
 Mar 2022 13:11:14 -0800 (PST)
MIME-Version: 1.0
References: <20220303194758.710358-1-robdclark@gmail.com>
 <20220303194758.710358-2-robdclark@gmail.com>
 <1a42ff3e-154a-b2b8-9c99-8d5fba9a38e5@quicinc.com>
In-Reply-To: <1a42ff3e-154a-b2b8-9c99-8d5fba9a38e5@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 3 Mar 2022 13:11:43 -0800
Message-ID: <CAF6AEGvBzFKbPVe+6+kHVDdFFvxXeFCp-7Jx=61or96HdQby4g@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/msm: Update generated headers
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 3, 2022 at 12:42 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Hi Rob
>
> On 3/3/2022 11:46 AM, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Update headers from mesa commit:
> >
> >    commit 7e63fa2bb13cf14b765ad06d046789ee1879b5ef
> >    Author:     Rob Clark <robclark@freedesktop.org>
> >    AuthorDate: Wed Mar 2 17:11:10 2022 -0800
> >
> >        freedreno/registers: Add a couple regs we need for kernel
> >
> >        Signed-off-by: Rob Clark <robdclark@chromium.org>
> >        Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15221>
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/gpu/drm/msm/adreno/a2xx.xml.h         |  26 +-
> >   drivers/gpu/drm/msm/adreno/a3xx.xml.h         |  30 +-
> >   drivers/gpu/drm/msm/adreno/a4xx.xml.h         | 112 ++-
> >   drivers/gpu/drm/msm/adreno/a5xx.xml.h         |  63 +-
> >   drivers/gpu/drm/msm/adreno/a6xx.xml.h         | 674 +++++++++++-------
> >   drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h     |  26 +-
> >   .../gpu/drm/msm/adreno/adreno_common.xml.h    |  31 +-
> >   drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h   |  46 +-
> >   drivers/gpu/drm/msm/disp/mdp4/mdp4.xml.h      |  37 +-
> >   drivers/gpu/drm/msm/disp/mdp5/mdp5.xml.h      |  37 +-
> >   drivers/gpu/drm/msm/disp/mdp_common.xml.h     |  37 +-
> >   drivers/gpu/drm/msm/dsi/dsi.xml.h             |  37 +-
> >   drivers/gpu/drm/msm/dsi/dsi_phy_10nm.xml.h    |  37 +-
> >   drivers/gpu/drm/msm/dsi/dsi_phy_14nm.xml.h    |  37 +-
> >   drivers/gpu/drm/msm/dsi/dsi_phy_20nm.xml.h    |  37 +-
> >   drivers/gpu/drm/msm/dsi/dsi_phy_28nm.xml.h    |  37 +-
> >   .../gpu/drm/msm/dsi/dsi_phy_28nm_8960.xml.h   |  37 +-
> >   drivers/gpu/drm/msm/dsi/dsi_phy_5nm.xml.h     | 480 -------------
> Why is the 5nm PHY removed? Am i missing something?

Dmitry removed it in mesa, because it was identical to 7nm

BR,
-R

>
> Thanks
>
> Abhinav
