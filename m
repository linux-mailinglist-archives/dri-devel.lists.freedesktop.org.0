Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89830B7F84A
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 15:47:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289E510E1C3;
	Wed, 17 Sep 2025 13:47:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UDzL9NTq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D0D610E48A
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 13:47:10 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H8XZmk021427
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 13:47:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 U+1FYSzFPulCZwhYK8uuFP4RJbaCiDqOUmY+x+avlIU=; b=UDzL9NTq019eYDfU
 ZpBgeA34jHGfjZLp0QyNsys5dqfc8BRpCNJLdokShV3UI+vfIBuWb2wK+fMLGclq
 FDOXD6w6zlvTr34m1ZmU/82QIijC29BQUPWl9FD1AZRcvpVX8kAcVxUtnQnBGlrt
 7L1O1pEOkjX7wT60rz59+k3ss5DAqUgp5nlH0Xaf8srH31Pb97W9QFIfFJsImqww
 X97PQNEpSP3inzHvTlFEKqcbiq5OZedOsiL/VP7aG1YFlFuwPnRE7MwOZWYQcuVv
 F19v/xDysU1/IEYTNNr4EHl00oFhKA8f5z9yrCs2uDVewYCAIEP6hkYAhUzCMgXG
 9jj9Qg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy5ahk0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 13:47:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b302991816so132587361cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 06:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758116828; x=1758721628;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U+1FYSzFPulCZwhYK8uuFP4RJbaCiDqOUmY+x+avlIU=;
 b=Ype/X2LZW7L+3AJx4EzIsMtzU5toAiN07aq1t8YX1ItpYbE5T+C0/W0PD1dbw+Ng2a
 uzs8W+eRyeF2Q/JU0FT51dtdBnxp5gAzuS3EhHv1li03BGfpddL9lZQCWECjL0pqL/DY
 jfrHqh0N5RSiFV0DbZOP1ScgQkDaYPFepPv5aDOMjQJx04rMGgf2SYUyy4M1LIcjwMdO
 2od0ZoNyY0Kk8wPNGqpDV1+IK0vImlr9HEZa1PIeCxK9/zdFGEZ1HzkWeEGiGVze4N3x
 V+lbdg5xKz8+/KH8D1Ftt2+JihOuYbhpWY+01EgklFITtab2emjyLN/oHmh8Xn90itmc
 eUgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYY8JmLZYqU4CPD70SCoeJwNM729c5o1wRddl1FRKdZGgyFpM3+KI7ADu9UpRJwQ/+pUREPeEafg8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIyoFlIXXnndFTiLdbUEtGRjSHhxeBhyGBnOMlGCd6Y78whRAP
 vO3gpqB3dT7yBaFXaN7QL/31Vn78iBVozrkppzMre3PWLR5U23657d9wgC9OjOfXwvM6bxpBLbZ
 Z60dJjgnINIsjaqwFA90oTrWc7/nO9UVJRuvwNoPpm63gsyXNYDitnLCiA7D4VaQ9ZCu6SbY=
X-Gm-Gg: ASbGncuUGEX5dMaFyQSrQ99M14dVW0NEg/wZ3/znptJ0m0NwQL1fGcrWkgot/AlJwkH
 hEguDbpyfNLUAuDkXyesSY+PLdP3gKZqMXWYv7gE8LH/pXiw54NcMR0eFeb5Z+Syr741wuEprzt
 8O7SQQhNyyqXEMX+0tBK04+BSLXDsCVd3howudda2zVvr+2adPffnEjKxH7YNfHjh6wIfQobBxN
 nJ1gcxqLirW0un2zsMmEvljUtMNuWSBdbtcPgLNyRuolQjs75kpT5zIexoox5WjIoWZUU5BcOJu
 vxDmfTx8khkfanbcW1BHtZCwxHRYPa8p3QoSNqVlPgOAUi8hdYfIv/EfSySjMxPvDVf++/QODry
 LlRgzkthVsuk4nGWhCm7yeH0ChZX3LY2+KrBDo7uSj6hlkTb7wG/e
X-Received: by 2002:a05:622a:1822:b0:4b5:ed1b:74a9 with SMTP id
 d75a77b69052e-4ba6ac99828mr24107191cf.41.1758116827014; 
 Wed, 17 Sep 2025 06:47:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtXlZuFQreMzb64H+tnz5zGrRTbMmy49Axu1iq7yKRAfklZROJk01Ls9kms99uRsAwPum0Qw==
X-Received: by 2002:a05:622a:1822:b0:4b5:ed1b:74a9 with SMTP id
 d75a77b69052e-4ba6ac99828mr24106611cf.41.1758116826295; 
 Wed, 17 Sep 2025 06:47:06 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-35bcee2ce08sm12429401fa.54.2025.09.17.06.47.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 06:47:04 -0700 (PDT)
Date: Wed, 17 Sep 2025 16:47:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hermes.Wu@ite.com.tw
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw,
 treapking@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v3 3/5] drm/bridge: it6505: modify DP link auto
 training
Message-ID: <nh3mxefaqznbirhez4c5xtkvs756cjasmb5bdsxol7cai7u4da@3nmtq6figidw>
References: <20250916-fix-link-training-v3-0-0f55bfdb272a@ite.com.tw>
 <20250916-fix-link-training-v3-3-0f55bfdb272a@ite.com.tw>
 <2bk6t2uibhbqtreavimigffzp746rnui4ohqk6sxcpolf4skjh@ddyma4omo6k7>
 <b1d7dcc0ad6e40309677058f8affa5a5@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b1d7dcc0ad6e40309677058f8affa5a5@ite.com.tw>
X-Proofpoint-GUID: dUljM0cn3MrMpqbulRh51gGH3Um7lX-4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX+xgWZeejquT+
 pfWTbgmOiOc8eDc23IyO6KeLvuafvhIL/AD3uRGA7TvhqSCrvZm1wVRLGFFn/nEiUksXokvhkcH
 W4Hbp81VZWehERiZtvvL0pPDktOqDEu0Ae7XL1pS+tluIsumrJET0t+Pq6XBSQRnCuDlCaA1Vei
 Gk6gXMWnteK3UQ85BUdX88Rw9PCtVPv1qXb0qH1cfZTUtPu2+UOta5o2E5oqC3Is5q1gb+YhtUx
 6GEpRsrL9l0Ydl52SyAH9WxWIyduRS6qRnIBDcBI51YY50kQeB1Y9orTdR2r1JW+6CSyBrAx6lf
 lvVUAcunddNtg1QjZfEP/F2Djec4Je6Roo4quRNUaTFM6vSQPsZlpXc3ia895xY3XV+UbApP6JQ
 4X3oGF7r
X-Authority-Analysis: v=2.4 cv=Y+f4sgeN c=1 sm=1 tr=0 ts=68cabbdd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=Ns9eNvu6AAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=P1BnusSwAAAA:8 a=pGLkceISAAAA:8
 a=cm27Pg_UAAAA:8 a=e5mUnYsNAAAA:8 a=zgMSu1BmLbmheqphp-cA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=LZLx1i01EnjtqRv10NxV:22
 a=cvBusfyB2V15izCimMoJ:22 a=D0XLA9XvdZm18NrgonBM:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: dUljM0cn3MrMpqbulRh51gGH3Um7lX-4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
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

On Wed, Sep 17, 2025 at 08:37:10AM +0000, Hermes.Wu@ite.com.tw wrote:
> 
> >-----Original Message-----
> >From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 
> >Sent: Tuesday, September 16, 2025 6:49 PM
> >To: Hermes Wu (吳佳宏) <Hermes.Wu@ite.com.tw>
> >Cc: Andrzej Hajda <andrzej.hajda@intel.com>; Neil Armstrong <neil.armstrong@linaro.org>; Robert Foss <rfoss@kernel.org>; Laurent Pinchart <Laurent.pinchart@ideasonboard.com>; Jonas Karlman <jonas@kwiboo.se>; Jernej Skrabec <jernej.skrabec@gmail.com>; Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>; David Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Pet Weng (翁玉芬) <Pet.Weng@ite.com.tw>; Kenneth Hung (洪家倫) <Kenneth.Hung@ite.com.tw>; treapking@chromium.org; dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org
> >Subject: Re: [PATCH RESEND v3 3/5] drm/bridge: it6505: modify DP link auto training
> >
> >On Tue, Sep 16, 2025 at 12:47:43PM +0800, Hermes Wu via B4 Relay wrote:
> >> From: Hermes Wu <Hermes.wu@ite.com.tw>
> >> 
> >> IT6505 supports HW link training which will write DPCD and check
> >> training status automatically.
> >> 
> >> In the case that driver set link rate at 2.7G and HW fail to training,
> >> it will change link configuration and try 1.65G. And this will cause
> >> INT_VID_FIFO_ERROR triggered when link clock is changed.
> >> 
> >> When video error occurs, video logic is reset and link training restart,
> >> this will cause endless auto link training.
> >> 
> >> Modify link auto training with disable INT_VID_FIFO_ERROR to avoid loop
> >> and check INT_LINK_TRAIN_FAIL event to abort wait training done.
> >> 
> >> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> >> ---
> >>  drivers/gpu/drm/bridge/ite-it6505.c | 14 +++++++++++++-
> >>  1 file changed, 13 insertions(+), 1 deletion(-)
> >> 
> >> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> >> index 7f6227c278a51358c70a3de93454aafeef64f2bb..f9b99c70789eea6beb3c6513155c9a4ca103d219 100644
> >> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> >> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> >> @@ -1806,6 +1806,13 @@ static bool it6505_link_start_auto_train(struct it6505 *it6505)
> >>  	struct device *dev = it6505->dev;
> >>  
> >>  	mutex_lock(&it6505->aux_lock);
> >> +
> >> +	/* Disable FIFO error interrupt trigger  */
> >> +	/* to prevent training fail loop issue   */
> >> +	it6505_set_bits(it6505, INT_MASK_03, BIT(INT_VID_FIFO_ERROR), 0);
> >> +
> >> +	it6505_write(it6505, INT_STATUS_03,
> >> +		     BIT(INT_LINK_TRAIN_FAIL) | BIT(INT_VID_FIFO_ERROR));
> >>  	it6505_set_bits(it6505, REG_TRAIN_CTRL0,
> >>  			FORCE_CR_DONE | FORCE_EQ_DONE, 0x00);
> >>  	/* reset link state machine and re start training*/
> >> @@ -1818,8 +1825,10 @@ static bool it6505_link_start_auto_train(struct it6505 *it6505)
> >>  		link_training_state = it6505_read(it6505, REG_LINK_TRAIN_STS);
> >>  		int03 = it6505_read(it6505, INT_STATUS_03);
> >>  		if (int03 & BIT(INT_LINK_TRAIN_FAIL)) {
> >> +			/* Ignore INT_VID_FIFO_ERROR when auto training fail*/
> >>  			it6505_write(it6505, INT_STATUS_03,
> >> -				     BIT(INT_LINK_TRAIN_FAIL));
> >> +				     BIT(INT_LINK_TRAIN_FAIL) |
> >> +				     BIT(INT_VID_FIFO_ERROR));
> >
> >I'm really unusure about this change. Judging by the description of the
> >problem, it's fix for the issue, but the issue gets introduced in the
> >previous patch.
> In this patch serious?
> 
> This patch serious fix this FIFO error issue, it change link training algorithm first then fix wrong FIFO error status.
> 
> The link training process start after video status is stable, and when video FIFO error occurs,
> video stable status will also lost, link training will reset to idle and wait until video stable again.
> 
> IT6505 HW auto training will process link training automatically, which include CR/EQ DPCD setting, link status check,
> and try lower link rate is the 2.7G cannot pass training.
> 
> In some case, DP connect to a DP sink device which cannot pass IT6505 HW auto training. 
> when link auto training fail on 2.7G and IT6505 HW change link rate to 1.65G and retry training automatically,
> at this time video FIFO error will occur because of the link rate change(chip issue), the video signal from SOC is not lost actually.

We seems to be misunderstanding each other. I pointed out that your are
fixing the code that was introduced in the previous patch. Would it make
more sense to reoder or to squash the patches?

> 
> 
> >>  
> >>  			DRM_DEV_DEBUG_DRIVER(dev,
> >>  					     "INT_LINK_TRAIN_FAIL(%x)!",
> >> @@ -1837,6 +1846,9 @@ static bool it6505_link_start_auto_train(struct it6505 *it6505)
> >>  		timeout--;
> >>  	}
> >>  unlock:
> >> +	/* recover interrupt trigger*/
> >> +	it6505_set_bits(it6505, INT_MASK_03,
> >> +			BIT(INT_VID_FIFO_ERROR), BIT(INT_VID_FIFO_ERROR));
> >>  	mutex_unlock(&it6505->aux_lock);
> >>  
> >>  	return state;
> >> 
> >> -- 
> >> 2.34.1
> >> 
> >> 
> >
> >-- 
> >With best wishes
> >Dmitry
> >
> BR.
> Hermes Wu

-- 
With best wishes
Dmitry
