Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A59338AD508
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 21:44:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE7F2112D1E;
	Mon, 22 Apr 2024 19:44:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xLNabV3c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B56112D1D
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 19:44:23 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2d8a24f8a3cso61029471fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 12:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713815062; x=1714419862; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PNSqhnViCny5sGqp7Qjs50p3XAx1lbvYw/hoV+0zczM=;
 b=xLNabV3c9JRSj15EfDPG7Jj1XMz6lPEE9FWMrU7Y8poBQ+tAlYqQQK9ffFwfB/T+cH
 ujDeX6kc1BRa1eI1OO2MhOFlcwAhDuQXAzUPVVi8QSIFcbR6OU2p8UdwABnARIVY2HvP
 sWeREy1Blnv77s93AotWIAtryWp7LsNpd86ybGKuHMPx4742HdGEOF1IBjFvAxxnUpAA
 Fxn9zapVcv5QH+U4bw7/Kx8VtwpLgnyQYaz20ScM4F/WWJ8XlsyvckP+QKzP+Fvu24o0
 1zxAPAMaVOXeq1dOPDvfIcW5J7zWSIxg6NDw4uLXYd8XXHkVf2n7E5sDxDmdtXv27JxV
 V8/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713815062; x=1714419862;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PNSqhnViCny5sGqp7Qjs50p3XAx1lbvYw/hoV+0zczM=;
 b=ZCnFZNR1aftxFwjqS6jgoW6u3++QxNRbxhPfxID4H6yels9dU5TjC3Cx7zhYi83xzW
 aG5bDYveuDVKueTs/3qQIOrZB0q6s2al7zz4bIfdVCRGwa/chuuFrCOIv9I8LR6xlpyi
 /6oEvk25YfprEx2cwg5jdtP23eCCK5EWV87SLYXO6QohV85ZVMrtKW/T3N6E9Rh4qQnb
 1juXiP9/EZatgYN1JRDoqpYO710vhm6oXvKnPcQWbmBv7aKt0E/0j1HAsWUF+i0ZFiN1
 0voEzkwHBVnhs2h2YsRbhi3r+cYbATeNLgNCo9CWhB54PR/vDHufrChI1goh0IGOUhMG
 JdnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXXMPvhUcMUMLeEjZ1Y4XuNLHnZ3Hv/8xPDTpc1G0css1v8Z3aErbB2et8i3N0WiliSAcEPbzrhElfzavsd9Jpi8nKiaA8Za9VcIk2F49a
X-Gm-Message-State: AOJu0Yx83hFt7r1VRFtRS11zifNFyT9wm0MpRqnwcuNcFRJi+hYiZLtp
 OLXdJe0eU7VIJUbZcbIvBJkuGYiLstJJdypVNli6VceeeR266OFCTLh0Zwd9n1M=
X-Google-Smtp-Source: AGHT+IFB4vlO61dRgJLfBsF513ju46qQFEo5RGhENHLFJUifWdD3Ld8YIEwoMTEdpoaSF4uOjBiDJA==
X-Received: by 2002:a05:651c:2102:b0:2dc:f188:a073 with SMTP id
 a2-20020a05651c210200b002dcf188a073mr7128155ljq.35.1713815061649; 
 Mon, 22 Apr 2024 12:44:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a2e9083000000b002da6fb7ce36sm1533716ljg.135.2024.04.22.12.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 12:44:21 -0700 (PDT)
Date: Mon, 22 Apr 2024 22:44:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/msm: don't clean up priv->kms prematurely
Message-ID: <pirzyu6ki7hfrax2uo3qlg7fdzlvzpg7vfgfqawogtybdd6e3c@zvgh3n4o67zi>
References: <20240420-mdp4-fixes-v1-0-96a70f64fa85@linaro.org>
 <20240420-mdp4-fixes-v1-1-96a70f64fa85@linaro.org>
 <67fbd629-3e80-b706-83a3-7baff3efd6c1@quicinc.com>
 <n7eet54g72usmuh4hdz6yce3i4ieweu4orgd7gewu7y53ejucc@dzmq2a2wdxkc>
 <7daeeaba-a33d-bf05-1371-d9b5fa0bf0a5@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7daeeaba-a33d-bf05-1371-d9b5fa0bf0a5@quicinc.com>
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

On Mon, Apr 22, 2024 at 10:23:18AM -0700, Abhinav Kumar wrote:
> 
> 
> On 4/21/2024 3:35 PM, Dmitry Baryshkov wrote:
> > On Sat, Apr 20, 2024 at 04:02:00PM -0700, Abhinav Kumar wrote:
> > > 
> > > 
> > > On 4/19/2024 7:33 PM, Dmitry Baryshkov wrote:
> > > > MSM display drivers provide kms structure allocated during probe().
> > > > Don't clean up priv->kms field in case of an error. Otherwise probe
> > > > functions might fail after KMS probe deferral.
> > > > 
> > > 
> > > So just to understand this more, this will happen when master component
> > > probe (dpu) succeeded but other sub-component probe (dsi) deferred?
> > > 
> > > Because if master component probe itself deferred it will allocate priv->kms
> > > again isnt it and we will not even hit here.
> > 
> > Master probing succeeds (so priv->kms is set), then kms_init fails at
> > runtime, during binding of the master device. This results in probe
> > deferral from the last component's component_add() function and reprobe
> > attempt when possible (once the next device is added or probed). However
> > as priv->kms is NULL, probe crashes.
> > 
> > > 
> > > > Fixes: a2ab5d5bb6b1 ("drm/msm: allow passing struct msm_kms to msm_drv_probe()")
> 
> Actually, Is this Fixes tag correct?
> 
> OR is this one better
> 
> Fixes: 506efcba3129 ("drm/msm: carve out KMS code from msm_drv.c")

No. The issue existed even before the carve-out.

> 
> 
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >    drivers/gpu/drm/msm/msm_kms.c | 1 -
> > > >    1 file changed, 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
> > > > index af6a6fcb1173..6749f0fbca96 100644
> > > > --- a/drivers/gpu/drm/msm/msm_kms.c
> > > > +++ b/drivers/gpu/drm/msm/msm_kms.c
> > > > @@ -244,7 +244,6 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
> > > >    	ret = priv->kms_init(ddev);
> > > >    	if (ret) {
> > > >    		DRM_DEV_ERROR(dev, "failed to load kms\n");
> > > > -		priv->kms = NULL;
> > > >    		return ret;
> > > >    	}
> > > > 
> > 

-- 
With best wishes
Dmitry
