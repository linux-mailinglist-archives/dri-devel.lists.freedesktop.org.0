Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1304CB290DE
	for <lists+dri-devel@lfdr.de>; Sun, 17 Aug 2025 00:32:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB10810E0B7;
	Sat, 16 Aug 2025 22:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="K2xgxipe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4924110E0B7
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 22:32:52 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57GLudjZ015613
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 22:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=C3ba6mWe6/FITpK9HqJUybgJ
 tGlTyVzJ+GPY6KnnnOg=; b=K2xgxipeF7JII+uGV1QSfm13T/qIw7zyf4APPddD
 dDn7d475rqJ3MD17dq23TDIk8YKQjhnYq7Ny2qb7VQnh4gTHrzxDR0FusLWVhK8r
 r3WT7gAnNZUyhUgRL++smU3T4jFbo3bsGX1Trr7MRfGaORz4urX6jzrRCtMQIwI2
 Xh80IunpdcYfNIu5U/hPi07SFrL1/h4dla+A7owB9zc1oxr1ZOkkjmcX9lDV7+pf
 RnYIuzeUGReRaXqAmZOhjx1jEKyPPimCbPVvHFHfyghY9+pkSAEYXydgLqTia+Lp
 Z4M9gd9MmGdSm4p4dh0iaRC/WP17WPmKeK4DnqNkYw2qHw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jgxt9cg9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 22:32:51 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70a9289280dso65713746d6.2
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 15:32:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755383570; x=1755988370;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C3ba6mWe6/FITpK9HqJUybgJtGlTyVzJ+GPY6KnnnOg=;
 b=ocWoooUVc8mZ98p8pSADqEGdm5XIdkXFep9OtGy/vLvE4Ey3KHCNvxOx58OkUZ6Ycz
 OV+Nzi93QVslAp5ON90gtq8IhleUK20EJqGQvbUCpC5986FtYEnw6BkR30NGyeZWhmPK
 ppncmP2IYTLI9QFEFLvwYXIdKTfMmoWM3aSyDGiCNhCm2P30A9QsV5C8hU9r1/RNcmgO
 w21YRKtk25pCQuXT6vW2VJLJXzjZIRf84OtTrx44RlPQDbUEkDD1O0ukaHREQzxPHMNx
 TnXQpbYij/n+4zkveLuiyJhpDzkoE28EOQaikrSYeXutRODmx2yhLus7aJiwjG2mnC/V
 0k5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNphwWpWnempRcDee6/WZyXFrYqRNH1X+xu+GUhK2zKMoLOyqQ/DylrpjQAzpCxmPpQ5KFr6Tam3Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjNNFc25GGmNb+u+6aEbCLfNqLDUkKIX+yFHd6fDIjuhFcH+UO
 LOaDAhbWsOChycletKs/DuCY8L6GHacVAvQSlFaoMp2H2TKRKPC+Wx0h7skMOZv0ObV08n2z58P
 LEk81I2jkDfRxnuhKnevKYfvoAS4pzWJZ689IlgSm3jooMKhkAs5FG6ZMLJywjjHtQVGoB+g=
X-Gm-Gg: ASbGncvtv5DRUE4SS4iAkkbjQT0DWHnrWAsIrALWYqybWLPfKSFnTA8EQLCaN5QQPyF
 TxR+zTPUQhBZ5jMLpCB1auAN1I1Qf4DprT29xolYP6DlCmEHU90dy7iZDvWjQtBF+TV99I3eksL
 +ob5RfM8ocYR4+ca9V/VY7b+tcQDrtDNAdH13Z4i4yMuHCfHIuAxFeBGZshJz2HvqOPIZTlSnnp
 Eop6uLNPqPJi/MnORavvdSErOwQnJxxoVELWRbT1K4TnmFlgnUjw0zXEdD79zBkyapDzZmaKh7i
 hee1suM/oZMdv9EPJT6/XDIP/Ktf4kBBrjnb0XWMBhFyHZ6MwYNkbG8iWp87Xs4OSpzOyeqXaxD
 JdBgR2ry1VIHGmKjZxgMG9f90SJmOsH8IQf/LOhmvfbQfWPRJdXM9
X-Received: by 2002:a05:6214:27ce:b0:709:76b4:5934 with SMTP id
 6a1803df08f44-70ba7cb50cbmr88687326d6.53.1755383570155; 
 Sat, 16 Aug 2025 15:32:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKuzN0c/0YYn1p1jAaOU3B+VoPLwa68I5qJyYUXQn+BNmUzka5OX8ZtuZHKOCDSwVrIyp25g==
X-Received: by 2002:a05:6214:27ce:b0:709:76b4:5934 with SMTP id
 6a1803df08f44-70ba7cb50cbmr88687006d6.53.1755383569638; 
 Sat, 16 Aug 2025 15:32:49 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef351630sm1030915e87.3.2025.08.16.15.32.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 15:32:48 -0700 (PDT)
Date: Sun, 17 Aug 2025 01:32:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
 chenjianmin@huawei.com, fengsheng5@huawei.com, libaihan@huawei.com,
 shenjian15@huawei.com, shaojijie@huawei.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 drm-dp 02/11] drm/hisilicon/hibmc: fix dp
 probabilistical detect errors after HPD irq
Message-ID: <ce47v3y77uc4dunlwyvmfe6j7d7mza4zfrbvu5dz67t66jdlop@vqgv47saj37i>
References: <20250813094238.3722345-1-shiyongbang@huawei.com>
 <20250813094238.3722345-3-shiyongbang@huawei.com>
 <aayi7zjrmru2ancexrqmcutams6ohde3nrkhqacixwp45dsk4v@7ig6hqzahdxf>
 <1dd93bb7-4f67-4b9b-8b6a-d7c5c77cf807@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1dd93bb7-4f67-4b9b-8b6a-d7c5c77cf807@huawei.com>
X-Proofpoint-ORIG-GUID: Ypngl8SqOGwQylXyJOuR2JbhiB7jhxrh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX+VTQpmcB7D1X
 rBiHJXBFQpzGHGYpMu9fad0TDsUU+6MTxAhGU1FHM61KY/JUO+kVHDLqJFiE01FfJMQWoPCQgXX
 2NOjzXPe3wEVL8RWDxC11poG3OK5DMK8sAeFyba5v3Afyd/HsADagPwl7RQAElO5msTdkTVLzhc
 N+5r/2Pz4Qgu2RuOPeJLLhaHhMYqKoZibWwH+BsmWIN0WJ8BQ1Nm/NTvd/IzNpOaHsDREl5ZOb7
 gOow4hRudTbV3S3oWi7h7bCW36Um9Ohwjrw9H7r2lONpNI09zJhuIBC+6LcYShENLOe43SV0FfO
 FPx7LhnfcrcRwFdFLZ33RJ/Xt5np+BFKoLgsRA450RPe67vPXO9Rdu8QXc/Z8DHdGROB5tRMH6Y
 WZLcC85F
X-Proofpoint-GUID: Ypngl8SqOGwQylXyJOuR2JbhiB7jhxrh
X-Authority-Analysis: v=2.4 cv=V7B90fni c=1 sm=1 tr=0 ts=68a10713 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=i0EeH86SAAAA:8 a=X2fXuBRfP1M7z_oXNIAA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_06,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160020
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

On Thu, Aug 14, 2025 at 08:19:41PM +0800, Yongbang Shi wrote:
> 
> > On Wed, Aug 13, 2025 at 05:42:29PM +0800, Yongbang Shi wrote:
> > > From: Baihan Li <libaihan@huawei.com>
> > > 
> > > The debouncing when HPD pulled out still remains sometimes, 200ms still can
> > > not ensure helper_detect() is correct. So add a flag to hold the sink
> > > status, and changed detect_ctx() functions by using flag to check status.
> > THis doesn't explain what is wrong with
> > drm_connector_helper_detect_from_ddc(). In the end, this function
> > doesn't use the HPD pin.
> 
> I'm sorry about the misunderstanding.
> The issue is that after plugging or unplugging the monitor, the driver takes no action sometimes
> even though an interrupt is triggered. The root cause is that drm_connector_helper_detect_from_ddc()
> still returns connected status when the monitor is unplugged.
> And I will fix the way in the end.

Can you perform a normal DP detection: read DPCD and check that there is
a DPRX attached and that it's either non-branch device or it has one or
more sinks?

> 
> Thanks,
> Baihan Li!
> 
> 
> > > Fixes: 3c7623fb5bb6 ("drm/hisilicon/hibmc: Enable this hot plug detect of irq feature")
> > > Signed-off-by: Baihan Li <libaihan@huawei.com>
> > > Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> > > ---
> > > ChangeLog:
> > > v3 -> v4:
> > >    - remove link training process in hibmc_dp_detect(), suggested by Dmitry Baryshkov.
> > >    - remove if (dev->registered), suggested by Dmitry Baryshkov.
> > > ---
> > >   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  1 +
> > >   .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 19 ++++++++++++-------
> > >   2 files changed, 13 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> > > index 665f5b166dfb..68867475508c 100644
> > > --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> > > +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> > > @@ -50,6 +50,7 @@ struct hibmc_dp {
> > >   	struct drm_dp_aux aux;
> > >   	struct hibmc_dp_cbar_cfg cfg;
> > >   	u32 irq_status;
> > > +	int hpd_status;
> > >   };
> > >   int hibmc_dp_hw_init(struct hibmc_dp *dp);
> > > diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> > > index d06832e62e96..ded38530ecda 100644
> > > --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> > > +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> > > @@ -34,9 +34,12 @@ static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
> > >   static int hibmc_dp_detect(struct drm_connector *connector,
> > >   			   struct drm_modeset_acquire_ctx *ctx, bool force)
> > >   {
> > > -	mdelay(200);
> > > +	struct hibmc_dp *dp = to_hibmc_dp(connector);
> > > -	return drm_connector_helper_detect_from_ddc(connector, ctx, force);
> > > +	if (dp->hpd_status)
> > > +		return connector_status_connected;
> > > +	else
> > > +		return connector_status_disconnected;
> > >   }
> > >   static const struct drm_connector_helper_funcs hibmc_dp_conn_helper_funcs = {
> > > @@ -115,21 +118,23 @@ irqreturn_t hibmc_dp_hpd_isr(int irq, void *arg)
> > >   {
> > >   	struct drm_device *dev = (struct drm_device *)arg;
> > >   	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
> > > +	struct hibmc_dp *dp = &priv->dp;
> > >   	int idx;
> > >   	if (!drm_dev_enter(dev, &idx))
> > >   		return -ENODEV;
> > > -	if (priv->dp.irq_status & DP_MASKED_SINK_HPD_PLUG_INT) {
> > > +	if (((dp->irq_status & DP_MASKED_SINK_HPD_PLUG_INT) && !dp->hpd_status)) {
> > >   		drm_dbg_dp(&priv->dev, "HPD IN isr occur!\n");
> > > -		hibmc_dp_hpd_cfg(&priv->dp);
> > > +		hibmc_dp_hpd_cfg(dp);
> > > +		dp->hpd_status = 1;
> > >   	} else {
> > >   		drm_dbg_dp(&priv->dev, "HPD OUT isr occur!\n");
> > > -		hibmc_dp_reset_link(&priv->dp);
> > > +		hibmc_dp_reset_link(dp);
> > > +		dp->hpd_status = 0;
> > >   	}
> > > -	if (dev->registered)
> > > -		drm_connector_helper_hpd_irq_event(&priv->dp.connector);
> > > +	drm_connector_helper_hpd_irq_event(&priv->dp.connector);
> > >   	drm_dev_exit(idx);
> > > -- 
> > > 2.33.0
> > > 

-- 
With best wishes
Dmitry
