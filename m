Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 851DEA9AA5B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 12:33:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EED0A10E7C2;
	Thu, 24 Apr 2025 10:22:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ljeIjiWM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 357AC10E7DC
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 10:22:39 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0Fkd6018009
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 10:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=SRAxpDNuwfhW3PHrfYeTwTaf
 uh1/vvz3kKMzJSGCp2s=; b=ljeIjiWMTqg6x1v1U/Tu9BxU0yP/PtChw5oBLEOl
 stSVbEmAl1+g6WEzxTMaGkkBD4kyCQkoWVbgIyB90Z/MOrVj4mtYm+P8ww6EVTwZ
 Iy6SLeNIkw3xd5dCQDUMGBUhhnCIpIl8t3/ax+ls8q0N2eCnTQl36deQRr9vR5SM
 9RyghjNu9WyhCaDgxwSm8j9py8myvS5/MFeEplfsvzHxQoVSp5kc27e05ODhXB35
 21lK7kpSQ/SCUgZQHa8hCA8KJpaG4fIb07TUIUDra5xWT2RDCbK4eXXKprulbInB
 YQ9N70nQ7VKg3OJVqTEgB38qvyUb2ilkZ5uym6JzrHvhcA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh154cy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 10:22:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e9083404b7so15486986d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 03:22:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745490157; x=1746094957;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SRAxpDNuwfhW3PHrfYeTwTafuh1/vvz3kKMzJSGCp2s=;
 b=GSvAs/jC5UPDZbBBDU6NedhaCAc7x2u65ePCdtKW4BTNWezJTWuZRZ3/djlxdPOpE0
 W721PHfoCsLnxzOyKiB/uPIbbQ646UjhIsd44ZdCf3Bokj6znObWNMYjXJ1PPQyaJoOr
 b9SObm2KaFsDJZVBd60KQNbU6ZYiLuCMA3Ca7v+XV4ao4QxZSnl5VzmK0byPjjxdIY4G
 Hdu2QT+dsCLlQ2gw76m7yGKVBmk1b0vUnXMTHRaho1ZbgMNlzo3CFyia5U0yvtiDCinQ
 HlkR2Q95hW0g6zvGsYGrW2tvqbO6PKk1gDt33vyyObZA2VPGjkc+qqcAEWfOdaKomyok
 x0yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjnzSME8IjOTDBxRqbPbC/FgLqLww48ZwUt3ek7boOpM7ED5bnZkUxBfHPq0p8RqW59YxRMkpuCk4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywp1UPa2AuJE4XrSid/J0nCJ2gzbXL6p/1UvRtKqDpEwDaWDifJ
 uIytFGcQtwxp78bGkwyzr+Qe4uVxXGvFB2V/inuz4hpxEShY20eJiHal9bCPnFLKFiRBQnS4Ns2
 OSfFwClJ4cpQN0DPcc5otHwBuYNbJUFqU3GX6TiARXainuqTj0jYMHAVszAQoFhfIYWs=
X-Gm-Gg: ASbGncuBucBaMgrNlDtwfONYhr9Mo9PRbnfc4dgr0teoMvVGQH09NZPMYxFw+5th4EU
 e7H2ExiLV7RA9/5yjtpaVpWutKUkUczb47I5ykIxFb6RHssbWZGLfW0oAQPMtyGuTKISMPwpAZB
 MW4X0A9nzIk0EvaaqqTfCpINjCOsu1zSdhOY7356MGLdXtCtpEo8097uBl/tFuCHhjMc+K05xa/
 vVSWdNZw8EYl8bRWwWMH2qM4CxjX6LmP3HST8NZnMjvVf0yjrjSTLKq/K/F7cfPQRfAHnycNMvs
 lrwOHtPwgmYfyvFcKTS5cJPAWUxPwpVPTJ7WV/G/qtef5mlPRfa76LNLWPvt4fT3R2PzE/Jvznk
 =
X-Received: by 2002:ad4:5c48:0:b0:6e8:efd0:2dad with SMTP id
 6a1803df08f44-6f4bfbea7a2mr28149516d6.12.1745490157205; 
 Thu, 24 Apr 2025 03:22:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgzsgx15Qut4NSB+bBKJh1rVxVjonV6TkGCbeCeN7hQttgUdN1oI7waEXbtgP5UUOSfMKNrA==
X-Received: by 2002:ad4:5c48:0:b0:6e8:efd0:2dad with SMTP id
 6a1803df08f44-6f4bfbea7a2mr28149076d6.12.1745490156892; 
 Thu, 24 Apr 2025 03:22:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-317cf659af7sm2028831fa.15.2025.04.24.03.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 03:22:36 -0700 (PDT)
Date: Thu, 24 Apr 2025 13:22:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/7] drm/msm/mdp4: register the LVDS PLL as a clock
 provider
Message-ID: <orh3v7knajhmpv4uzmarpgdbfhkhtipjxc7agfmvlqdzggpwzz@yohc5d763ynp>
References: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
 <20250227-fd-mdp4-lvds-v3-3-c983788987ae@linaro.org>
 <029f3bfb-a031-4dfe-a2b4-bc41a0da7772@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <029f3bfb-a031-4dfe-a2b4-bc41a0da7772@quicinc.com>
X-Proofpoint-GUID: YewlqHMl8Ols5qZO1axJi1MeIeW1Bb8B
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=680a10ed cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=DMSj4145jBr-G1g3eIsA:9
 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: YewlqHMl8Ols5qZO1axJi1MeIeW1Bb8B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2OCBTYWx0ZWRfX3a5f727Al/oX
 5FmPcKw+jOtpwacVD07rITFlZrSTzlnMqpN1K/m6x7Orb7KXNJXsGre6SfOd+AN63Xzbu/9Tk9h
 HueLuGnUOKhDTBJezvrUP1hfxY1LfFr6V5+9lAgPu3M17xNRNihUVEs9fGGIXuy6/kiFBRf6tf+
 7+1RjlwkLRlHLeZYmL0coJJT9i8vkNbom0BSExb6MxX254y09bVQlcXUusC7SHqF6FOR1AQ9Zvx
 lTpatp+qkO6CXD6P/n9ykEP7D8KFpkR8tC2qw9bBW2AVO/hEzSrMF16sR482n26qzms31yh8wfq
 RtxEjT3n7oZUs+iCfcsHhWL+8ajGHyN5wiWr4ZkbkagtRfBTHeM7cdwx16mrWi7UbzWlWeU2nQd
 xzjCvCswCfDmwmXN/j+Ht8r1TcjK1ZyizSKXmnyXWAFV7ALdmi6dXsWhgjsKSg33gR6JvUUr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240068
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

On Wed, Apr 23, 2025 at 03:54:13PM -0700, Abhinav Kumar wrote:
> 
> 
> On 2/26/2025 6:25 PM, Dmitry Baryshkov wrote:
> > The LVDS/LCDC controller uses pixel clock coming from the multimedia
> > controller (mmcc) rather than using the PLL directly. Stop using LVDS
> > PLL directly and register it as a clock provider. Use lcdc_clk as a
> > pixel clock for the LCDC.
> > 
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h          |  2 +-
> >   drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c |  8 +++++++-
> >   drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c     | 22 +++++++---------------
> >   3 files changed, 15 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
> > index 142ccb68b435263f91ba1ab27676e426d43e5d84..b8bdc3712c73b14f3547dce3439a895e3d10f193 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
> > +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
> > @@ -207,6 +207,6 @@ static inline struct drm_encoder *mdp4_dsi_encoder_init(struct drm_device *dev)
> >   }
> >   #endif
> > -struct clk *mpd4_lvds_pll_init(struct drm_device *dev);
> > +int mpd4_lvds_pll_init(struct drm_device *dev);
> >   #endif /* __MDP4_KMS_H__ */
> > diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
> > index 8bbc7fb881d599e7d309cc61bda83697fecd253a..db93795916cdaa87ac8e61d3b44c2dadac10fd9e 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
> > @@ -381,7 +381,13 @@ struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
> >   	drm_encoder_helper_add(encoder, &mdp4_lcdc_encoder_helper_funcs);
> >   	/* TODO: do we need different pll in other cases? */
> > -	mdp4_lcdc_encoder->lcdc_clk = mpd4_lvds_pll_init(dev);
> > +	ret = mpd4_lvds_pll_init(dev);
> > +	if (ret) {
> > +		DRM_DEV_ERROR(dev->dev, "failed to register LVDS PLL\n");
> > +		return ERR_PTR(ret);
> > +	}
> > +
> > +	mdp4_lcdc_encoder->lcdc_clk = devm_clk_get(dev->dev, "lcdc_clk");
> >   	if (IS_ERR(mdp4_lcdc_encoder->lcdc_clk)) {
> >   		DRM_DEV_ERROR(dev->dev, "failed to get lvds_clk\n");
> >   		return ERR_CAST(mdp4_lcdc_encoder->lcdc_clk);
> 
> Change seems fine to me, one question on the order of changes, DT change has
> to be merged first otherwise it will fail here?

It is already semi-broken, as just enabling the PLL is not enough. The
branch clocks in MMSS are to be toggled / manipulated. As such, it's
questionable if we need to coordinate or not.

> 
> Will that be managed by co-ordinating with the DT maintainer?
> 

-- 
With best wishes
Dmitry
