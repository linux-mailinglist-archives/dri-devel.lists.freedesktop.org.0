Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DA6A54302
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 07:47:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 396B610E8FB;
	Thu,  6 Mar 2025 06:47:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UTZyYIWX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A62010E8FE
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 06:46:55 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5493b5bc6e8so346780e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Mar 2025 22:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741243614; x=1741848414; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=aBJt5IiboHla6lV3Ran8Kn8NxsmqzqpO6sJDmhngbes=;
 b=UTZyYIWXP/bl6dJgnqBLvoA8Q84tpBZwgIYQFqQKpPeusL2Gee6E+TZYXmTcwes4uw
 YWYBLLVEltRPnM5mDQoScsrJ8Rfchi9qVwmwDRpVDPM1GCFiUbC3x60o6uLJ/CVDvteL
 O0ZHdqyhnukgh+h8qTkViNfDMtwPqK3lv2gLGqQFqvHZAS3q3XLWT5eH8h7notpVWT6f
 R32+znRw6ZZlfRdyB9SkHRZ3ZxilaArPYU/DgBDSx34PpB0HzraipABWmUtL5bnUoq7Z
 AgwMKb6DBmSPVIe/a1clJTOclKmczpV7vV3GyBcms9oRZuS9vkzcztb0XEG44nvYzHXw
 856g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741243614; x=1741848414;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aBJt5IiboHla6lV3Ran8Kn8NxsmqzqpO6sJDmhngbes=;
 b=Bkd7EPEikcQ45A6qslq8bz/xSW4mpbcKwiUwJn+FXoDBVMrceGy1g8FRCWI5Rs8tEt
 JKhSoa02mlLgEiIH7OQcShk/XAO1EX0UNQJ3hmw6zfNEqzF1LO1QzbkCWpB+ACwshtlx
 wJuOZ2BL4IVl3pMM+ELa+4rtAeXVr7TsO+anoYmDOSD1FpOJE6hu6lJHT4FawX4D5EDl
 AaRFEGHCC5R3VM8gPhOcoPE6euTfrN+ydKgZokyJ/kDJa9QrE34qe2UvBWlPM+5mNS2V
 g2W/jkJHiaE3z4V8tOI+6cewwDf216qb8GqDkZ1itB33UeUIDLjJv2WeDs2Q6kbu/AiS
 Es2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMFNird9LtmCRVX8n+X2mIYoDR+/hY1WZlb4ReqN1V4UnsFubfIqBSJvSwjziQM/n8qUsKUjJ7Lz0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFWFlgluUv8BWEOjacC3g0kT/e4Ci4oBTwghO74aH7dRxCj6sa
 7l8GmMkJIck5QYwVuTwNQSS0xvSFSvWQAlJ3T35VqTjw7zKpFKTdZ0rTcLEfm6Q=
X-Gm-Gg: ASbGncvRZxPUXCJ+NiPRbdBIc+NxxwMts6FaP+rtVzE/clmMrVRiwYGe2CR5mCyMDTA
 Zb42dakGbi+MUVVFPRIwZChbxZWyUiDp2p/bz1rkwQwd7sMH/Bd13NQs38Vp5Z/uEvmT3Kk/hEj
 rtLTbVbqVUkgxN4dNo+akrFretENCKKT4Upa1o4milPI/Qn9M79bnbTbyCrBuJBTr2MknKHwd10
 fJRG8/eyQp61LxN5SQmU/vSL1MTujlGoKfq0714O6vockX6ZgOv5eQbxZJrD0TY2iPNq1HWADxJ
 2w9KbpiZUaoFNm1FzVGBpxhHbFbR6LDwdxeXgyyA1knWfXDkHRD3IVkdf890dEn3UL9KTQpMSl/
 TiiiDvFz8kWF+drxbX89Db56S
X-Google-Smtp-Source: AGHT+IHw2m0vBIquj8s91nI2Oqzx4I4bD6M7fJN4tOBXcl0RZL/nJ12bNu4CSxcWu+sPaxEIuNgp6Q==
X-Received: by 2002:a05:6512:b09:b0:545:c89:2bc9 with SMTP id
 2adb3069b0e04-5497d38dbe7mr2421818e87.43.1741243613998; 
 Wed, 05 Mar 2025 22:46:53 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498b0bd6e2sm80629e87.130.2025.03.05.22.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 22:46:52 -0800 (PST)
Date: Thu, 6 Mar 2025 08:46:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Adjust CDM_MUX to support CWB PINGPONG
Message-ID: <732vgwega4ok3tkbefyxixyfdonfenik5q5zhdxqot62aygavt@s2m3m7gzjgb7>
References: <20250305-cdm-cwb-mux-fix-v1-1-16148ca6e4d2@quicinc.com>
 <f3bfb118-f947-4b09-a368-42c5f0d1373b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3bfb118-f947-4b09-a368-42c5f0d1373b@quicinc.com>
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

On Wed, Mar 05, 2025 at 09:15:10PM -0800, Abhinav Kumar wrote:
> 
> 
> On 3/5/2025 7:16 PM, Jessica Zhang wrote:
> > Similar to WB_MUX, CDM_MUX also needs to be adjusted to support
> > dedicated CWB PINGPONGs
> > 
> > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> 
> Not exactly sure which fixes tag to use here, but
> since this should have ideally been addressed together while adding the WB
> mux programming to handle CWB, I am going with
> 
> Fixes: a31a610fd44b ("drm/msm/dpu: add CWB support to dpu_hw_wb")

I don't think it needs Fixes tag. The patch is good to go on its own.

> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
> > index ae1534c49ae0..3f88c3641d4a 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
> > @@ -214,7 +214,9 @@ static void dpu_hw_cdm_bind_pingpong_blk(struct dpu_hw_cdm *ctx, const enum dpu_
> >   	mux_cfg = DPU_REG_READ(c, CDM_MUX);
> >   	mux_cfg &= ~0xf;
> > -	if (pp)
> > +	if (pp >= PINGPONG_CWB_0)
> > +		mux_cfg |= 0xd;
> > +	else if (pp)
> >   		mux_cfg |= (pp - PINGPONG_0) & 0x7;
> >   	else
> >   		mux_cfg |= 0xf;
> > 
> > ---
> > base-commit: 6d3175a72cc07e90f81fb35841048a8a9b5134cb
> > change-id: 20250305-cdm-cwb-mux-fix-69ed5297d4f7
> > 
> > Best regards,
> 

-- 
With best wishes
Dmitry
