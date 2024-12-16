Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E74049F3D58
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 23:21:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB6710E627;
	Mon, 16 Dec 2024 22:21:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hCL5SwWd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B74BF10E62E
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 22:21:53 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5401bd6cdb7so4739498e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 14:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734387712; x=1734992512; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=np9l1SxTtZSdosqDOIcl3yLnm6oukk5vBVkET6t6L00=;
 b=hCL5SwWdFgEcalCKRlvC3BaQgQ06lEVkXg7G6ZOPQ6wLI5qFXdfmVRuysnxsBBTVoB
 yaF+wYOxEyjQlMOQWsxOy2ulqDo7z01ex8sRRTpNeeBjtjdxYyVRVvz9QiRh7/Yie6i3
 U2Qa7wBJfHq0AqQcOHSlfoULt5XJMh48uVQhNwUFWhjn8oj7DUhuJqOYZ31FFQBs+eZt
 cgxynYeJImQrPckdmDAhvK6e1PkHMEDDHToWotRQywwXFOuIC4ubXVStBAPiiPBEwDzT
 pwikP+4M3PooOgkDBSYrVgAO46B/8dD9t5DDTHiQWSRasdA8xk+47JIt3xzj6AIpTxKG
 CRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734387712; x=1734992512;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=np9l1SxTtZSdosqDOIcl3yLnm6oukk5vBVkET6t6L00=;
 b=qtMHMbPMhTPUOeFIBebNZOoEnqZFnqgfnyJWea2vYFd/aDYQk83JMpokfaazIDnTVW
 SkWESngKrN6fydubIW/ulvxIPiopsT6ytKLURQ8Xc4d/A15wo8dkTxVsfEPfGZS3zRFl
 ZSgeHyhxaQ7W/nMD93UBZsJBLLV1ajdmAngn1tgQtCpDK0mmshFqkyOGYq4CnObLOPg+
 ZnW20jDt26/ovZNG8xFQmX8RLUCnf2u8fVD6VuPGlmwl8ApGkvsurepaYJXJFQIWBvpu
 eFvyRRjHqSu9Vf+mmZNye3JZg0u9zoNxDa1Fo2kTHGDOXjxcuhb7Ndbem5mOUSjXByHb
 Fcng==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzSbtbx4Nor7qVLTGAB1yaleaNJRSE2A1IY6ZDKySOGbeT0HGPD1ciMcryRjSwJGxqGKgf+/OsuNo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0uGYrmdWU8YcyX9Fs03PgbbHwItZ/ozd3GNdkHpaHEBkLDYs/
 Vw9RYmlZ1pp16MmCTI+AGsZIMswtQoBVQgOj9lmMDyhZ98rKgTZ/YKrNRHngeRM=
X-Gm-Gg: ASbGncsLM+zhBTt4FyS3gkALHL1bqY+TZLZ2ci9rYMFZRywkQzAHgU7/SRq9pvm66zx
 mlAI5Bv3ashFLsJfPlJ0m2nudjAjqDY6c3NvBcecQmwIWnTuCzru6jAdq1hrEQSr0hHgM4UwGcR
 wXOLGxATO4TSnkTBKr/dIzN+bldqMLmD9EjXTZTMMLxrHf3/qFsagW8OQiyvLOK+pUQVFCH+Z/L
 tcsvxpl8SYVsftYyyRDdiVNm1glZvCBKswgIJ1bzAvD97MDUwSczsJ1rKFHX3DM9gm20IgniZ+B
 g2+cjhWDmaQhn07iTMfRP88w91Hos/zACNWU
X-Google-Smtp-Source: AGHT+IEnVvJJwRCeSyiKHoHt+hZL09awH4q3F+CSQYY24saJkz00Ofn+xL3gjf2WmIFrEYiDjuRo3w==
X-Received: by 2002:a05:6512:3b2b:b0:540:1d6c:f1c1 with SMTP id
 2adb3069b0e04-5408ad81cc1mr3830374e87.2.1734387711878; 
 Mon, 16 Dec 2024 14:21:51 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120c13d5esm980911e87.216.2024.12.16.14.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 14:21:50 -0800 (PST)
Date: Tue, 17 Dec 2024 00:21:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Robert Foss <rfoss@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Richard Acayan <mailingradian@gmail.com>, Rob Clark <robdclark@chromium.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] drm/msm/dpu: link DSPP_2/_3 blocks on SM8150
Message-ID: <og2qlg7fy3gwh3uv7nvmqxmjbzqpdeuekefflzgdet4vnltdtr@q7suuz4ujxp5>
References: <20241216-dpu-fix-catalog-v1-0-15bf0807dba1@linaro.org>
 <20241216-dpu-fix-catalog-v1-1-15bf0807dba1@linaro.org>
 <d6be6564-ce24-4a27-a014-45aa9ff28d24@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6be6564-ce24-4a27-a014-45aa9ff28d24@quicinc.com>
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

On Mon, Dec 16, 2024 at 01:11:35PM -0800, Abhinav Kumar wrote:
> 
> 
> On 12/16/2024 12:27 AM, Dmitry Baryshkov wrote:
> > Link DSPP_2 to the LM_2 and DSPP_3 to the LM_3 mixer blocks.
> > 
> > Fixes: 05ae91d960fd ("drm/msm/dpu: enable DSPP support on SM8[12]50")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> 
> Change looks fine
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> One question below (not tied to the change but arose due to it):
> 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> > index 6ccfde82fecdb4e3612df161814b16f7af40ca5f..421afacb7248039abd9fb66bcb73b756ae0d640a 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> > @@ -164,6 +164,7 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
> >   		.sblk = &sdm845_lm_sblk,
> >   		.lm_pair = LM_3,
> >   		.pingpong = PINGPONG_2,
> > +		.dspp = DSPP_2,
> >   	}, {
> >   		.name = "lm_3", .id = LM_3,
> >   		.base = 0x47000, .len = 0x320,
> > @@ -171,6 +172,7 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
> >   		.sblk = &sdm845_lm_sblk,
> >   		.lm_pair = LM_2,
> >   		.pingpong = PINGPONG_3,
> > +		.dspp = DSPP_3,
> >   	}, {
> >   		.name = "lm_4", .id = LM_4,
> >   		.base = 0x48000, .len = 0x320,
> > 
> 
> the consumer of .dspp seems to be in the RM code which is used to map the
> DSPP to encoder_id but is there really any case where lm_id != dspp_id ... I
> guess I am missing the context of why DSPP id needs to be tracked as LMs and
> DSPPs go together. Let me also check this part internally.

For example check the SDM845, the LM_5 is tied to DSPP_3.

LM | DSPP
---------
0  |  0
1  |  1
2  |  2
5  |  3

-- 
With best wishes
Dmitry
