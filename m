Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC9B9F3D62
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 23:23:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD3AA10E7D0;
	Mon, 16 Dec 2024 22:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="B//1y3li";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C490D10E62E
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 22:23:35 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2ffa49f623cso57118831fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 14:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734387814; x=1734992614; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/Mcq9gMedaNCczRwr6HjVU6c+vHbhB80maUVC1Rq2gc=;
 b=B//1y3liBQ2gh0A1V+aFEI9cbfj7MqWHse6AYra+1NdxOO/Tm8Xv+l2a2WlLUuwk5D
 jPMOMdbTXQ/NYK/jIararV+ysJes6iJrn4Omdf6O8r8nlesMta1GC8CsfOKoGQZfgZ5L
 RP2Sth35s+NupUXiErkcVVS+NbQbg5gp4bwfUCyhmrhB2C9YRcrMzM82u3uFUHT6kcMG
 ZA5d39iai2WP5atRDwBA2mJV3Eyc14jonOwtPFXSWEITId8TwuRJ44WGjSmwltQ2tCpK
 EftE52y8e0GIHVEuWkdOCpT2q24p9ViCyYHaH6CGfh9AMFidgJKL8GwhzB02ScpIHwC7
 adwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734387814; x=1734992614;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Mcq9gMedaNCczRwr6HjVU6c+vHbhB80maUVC1Rq2gc=;
 b=xIfgAuyMc0TNpivN4s8rAfHdojHEyC49yQEkVIFLh4xHkdj+d2HstChxC9UrbG9Hlv
 2VtOT/qHzl8Nz1EN2MqDISUQschAv6TKSZnCVuZOmLqLbNCrwjwhVxOhhiUSvkkTK/2m
 zrAWoWEsqFxM5SND4Gm1bzkNPg9t//bGwhmV9aEXnlrISbsjTih6KPFQ78AlGGcwylp+
 r7t2tHQUMysvDEVeN9UC9zG+u53jEQJJbw3UECBAnCUxs8bQP5+ziizH25vQCOLX3KD1
 I/avrJ5HhDmak/zZ4m6KQzGFmkHCu9IkITAhdgPgCvu66slkA9ixM8N6aPCIrpgzuhRR
 8tWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLRjs+epDoMgQ/6zq6gQ02GSpofJeBK/FAYkxOZM4TFcjCiKXNvtTWcIe+TczaEE6wW0ofRY4yYqM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzxw4FX8r0S9s8oqjeA1JX0XvZRNFSN5IZ6enQAmVM50VhCWtJP
 HR9tDWy9vXaOVCFcwf1wRCZfHQfikQhbh5dCJxYpBT5YME9alyYPSH93yOY4y4o=
X-Gm-Gg: ASbGnctojFLOYPi3JzJbMyEwdWeaCMHzJmvK72ADKJKgv0rffsnfs4c9J50yoXrS/C2
 pMKHDbe264/02GonO30bhy6BrfhKisz7IyFOo1KtM5mD5Ld1zl+8v4tJBbi446GZoOSvG01St+X
 va58WvnShYT6/+z19uWoSMDUJHNiy5ahiDtZP8bnshC2x0AMt1dq6ZBtveuBp+eBqwUD842PVas
 JEnJbfmICSV37JGaPANEI4HTHxDY+TgXvyQ7wPsvoPEPvgnkGJd+JHf+A9y776+v+2wobtVwY+A
 2/9yEmUwy6x7UgWYNvBQsoXf2MXNlK2iLHr5
X-Google-Smtp-Source: AGHT+IFSCeRUjfR8fMtVy6j8Hm4BkcxvjiUW4q/+aff5Osc4iiR7i3258tq0eqpUXGQgHrhC+BFpsg==
X-Received: by 2002:a05:651c:19a7:b0:300:418e:768a with SMTP id
 38308e7fff4ca-302544ae81dmr51479041fa.31.1734387813858; 
 Mon, 16 Dec 2024 14:23:33 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3034406234bsm10618891fa.60.2024.12.16.14.23.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 14:23:32 -0800 (PST)
Date: Tue, 17 Dec 2024 00:23:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Li Liu <quic_lliu6@quicinc.com>, 
 Fange Zhang <quic_fangez@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: correct LM pairing for SM6150
Message-ID: <55dalo6ecncyceb6wmu7nm6hco4vixxox5grelykkdw5q6yjys@tac57c5nowsd>
References: <20241216-dpu-fix-sm6150-v1-1-9fd7ce2ff606@linaro.org>
 <54edef24-b27a-4d79-aff1-672d4e65b5a3@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54edef24-b27a-4d79-aff1-672d4e65b5a3@quicinc.com>
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

On Mon, Dec 16, 2024 at 11:26:37AM -0800, Abhinav Kumar wrote:
> 
> 
> On 12/16/2024 12:20 AM, Dmitry Baryshkov wrote:
> > According to the vendor devicetree on SM6150 LM_0 is paired with LM_2
> > rather than LM_1. Correct pairing indices.
> > 
> > Fixes: cb2f9144693b ("drm/msm/dpu: Add SM6150 support")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> > index 621a2140f675fa28b3a7fcd8573e59b306cd6832..81eb274cc7000a3b70b0f6650088ddcd24648eab 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> > @@ -116,20 +116,20 @@ static const struct dpu_lm_cfg sm6150_lm[] = {
> >   		.sblk = &sdm845_lm_sblk,
> >   		.pingpong = PINGPONG_0,
> >   		.dspp = DSPP_0,
> > -		.lm_pair = LM_1,
> > +		.lm_pair = LM_2,
> >   	}, {
> >   		.name = "lm_1", .id = LM_1,
> >   		.base = 0x45000, .len = 0x320,
> >   		.features = MIXER_QCM2290_MASK,
> >   		.sblk = &sdm845_lm_sblk,
> >   		.pingpong = PINGPONG_1,
> > -		.lm_pair = LM_0,
> >   	}, {
> >   		.name = "lm_2", .id = LM_2,
> >   		.base = 0x46000, .len = 0x320,
> >   		.features = MIXER_QCM2290_MASK,
> >   		.sblk = &sdm845_lm_sblk,
> >   		.pingpong = PINGPONG_2,
> > +		.lm_pair = LM_0,
> >   	},
> >   };
> 
> Have a basic question here. We check the peer only if we will have more than
> one LM needed in the topology but sm6150 does not have 3dmux, so the number
> of LMs will not go beyond one.
> 
> 318 		/* Valid primary mixer found, find matching peers */
> 319 		if (lm_count < reqs->topology.num_lm) {
> 
> It seems like this fix will be unused or does not really matter.
> 
> Downstream has a different implementation for lm_pair, its used even to
> decide the LM pair for CWB mux. Upstream has a simpler implementation of
> just doing that in the code of using ODD LMs for ODD CWB muxes and even LMs
> for even CWB muxes. So fix is okay but not needed.

So which topology is supposed to work with LM_0 / LM_2 pair?

I'd still prefer to land the fix for the sake of catalog having the
correct data.

> 
> > 
> > ---
> > base-commit: a3d570eace66b4016f2692a6f1045742ee70c6b1
> > change-id: 20241216-dpu-fix-sm6150-17f0739f8fe0
> > 
> > Best regards,

-- 
With best wishes
Dmitry
