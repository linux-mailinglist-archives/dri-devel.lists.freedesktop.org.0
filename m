Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC6F85A219
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 12:37:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3611E10E33B;
	Mon, 19 Feb 2024 11:37:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RN/K2qp5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C90210E33B
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 11:37:42 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-6082d35b690so8197817b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 03:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708342661; x=1708947461; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GaUyZ50XjXvDF8jY3Q3ZEC7jLE1bXKIRWKK8kFzpxxY=;
 b=RN/K2qp524fZKa5yjuCCBCt5FgCh2HIQx42GrE1yJrO+XBMFwZEKAIoLqhGyCQi7WQ
 eu3vEmeM8VTqK+lt1wxLAFhqhzNeiFyDfiyDTUi9JbFZN8bhFxCSAtzjwgeGgMUTMA4j
 yZQAakBd50rSHybRuXPv0MyjUAS2MLOlE9qTEKlzt9Y0ByLk4Ioj6oeneJAlQbdaw/4F
 pnPl1OGhVJuljiTIZL0zax2jyJVPrdU2DQaotr1COx5ceo/ip35edvlgU6cLcwJGKHRw
 44FkRy4U3yQH4zPXi6GPGsYPo05cozViIm6TOfT8njx7va4rJYdZlk/nVWA5vpN+1DOy
 NkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708342661; x=1708947461;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GaUyZ50XjXvDF8jY3Q3ZEC7jLE1bXKIRWKK8kFzpxxY=;
 b=WddeFt6FnSQFxK0PVtf6D3UCLqo3tPAR6cYGVHkL/9n6yZIo43BNzzJIz+H4QnzQum
 FimKahoCQ+TbT3iFw0KfdE8gs0BYCBnrr/tHeA4JDr79+PG5ks2RQtPlYAsksFzZX3q1
 Barmz3eei/kkoxUv2MVEKdUvcPg5jcFYk4r3yuYR0lqpEWkU6ofWj2ZGxguUBaTQyL7V
 z6FSoDBuIp8upF4ogLRVtflqsrl4siSzgWk8oOBFFq+Y2tv3ggmoLrhMAdKC1lUsATXA
 BZ9CnABqUlxvFOvU0BuKlRjku3c0KeGGob19Ca3ikEd6HBTtzTUDf3WVjk7YiuMiNiFG
 u73g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFJTETrty9nPw4vpcr+giP5CRJZnLfXY+G74DtlEkrubB/trL4coEEOQNm2tKMVfwDqwGj3vH5+38oS6m+2/oiKkfWA1PuwL8vu2Mmc6Xx
X-Gm-Message-State: AOJu0YyWW1aS96m5FQmz0f+BfTTZhZ6GgCHz9a2RxAKYfmaiZwf4zcYo
 Qb4WdRFeC5oKr7UXZuLUbgdtAj2iyEo1eb/z53qgG5pSqs5LNCTjm0K7j7+FBAObjzCJczNu/f5
 gWgGxu/Jazy449W62fwG6sQGwRooWK87XD3KRng==
X-Google-Smtp-Source: AGHT+IGQ1WnS7mBk+2g+qAwDGntsHIztsi8TubTD1INdibjvREVQvyi8hjDez2VQ2B6iwhTX0PVK/T0srPtjJXHbaAA=
X-Received: by 2002:a0d:dd94:0:b0:607:a0cf:d9ff with SMTP id
 g142-20020a0ddd94000000b00607a0cfd9ffmr11328416ywe.31.1708342661019; Mon, 19
 Feb 2024 03:37:41 -0800 (PST)
MIME-Version: 1.0
References: <20240208-fd-migrate-mdp5-v4-0-945d08ef3fa8@linaro.org>
 <20240208-fd-migrate-mdp5-v4-2-945d08ef3fa8@linaro.org>
 <9a4bf513-4390-3e36-f3b7-f9fef1c296fd@quicinc.com>
 <CAA8EJpoVivjg2KKVgf725C2cwMCOk=JK6hz65ewTheBAb8t_vQ@mail.gmail.com>
In-Reply-To: <CAA8EJpoVivjg2KKVgf725C2cwMCOk=JK6hz65ewTheBAb8t_vQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 19 Feb 2024 13:37:29 +0200
Message-ID: <CAA8EJprrVnb-5fhq9oc6PanoM8hY1fhBv0NvmcXhbAC9yJGmLA@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] drm/msm/dpu: support binding to the mdp5 devices
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
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

On Fri, 9 Feb 2024 at 20:58, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, 9 Feb 2024 at 20:44, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >
> >
> >
> > On 2/8/2024 7:01 AM, Dmitry Baryshkov wrote:
> > > Existing MDP5 devices have slightly different bindings. The main
> > > register region is called `mdp_phys' instead of `mdp'. Also vbif
> > > register regions are a part of the parent, MDSS device. Add support for
> > > handling this binding differences.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 98 ++++++++++++++++++++++++++-------
> > >   drivers/gpu/drm/msm/msm_drv.h           |  3 +
> > >   drivers/gpu/drm/msm/msm_io_utils.c      | 13 +++++
> > >   3 files changed, 93 insertions(+), 21 deletions(-)
> > >
> >
> > I thought we had agreed on a quite version of msm_ioremap_mdss for
> > vbif_nrt_phys?
> >
> > Anyway, its not something to block this change. Hence,
>
> Excuse me, I'll fix it when applying, if I don't forget.

I took another glance. The  msm_ioremap_mdss is already quiet (it is
not printing warnings if the resource is not present), so this should
be fine by default. But I'll make a note that we might be able to
replace most of msm_ioremap functions with the standard devm ioremap
functions.

-- 
With best wishes
Dmitry
