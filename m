Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E6BA76014
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 09:30:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B5BE10E380;
	Mon, 31 Mar 2025 07:30:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oc/OhFTW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AEF610E2B9
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 07:30:24 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52V6km7p029196
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 07:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 USMO1/3Q6LQ9zEtI2Anlh9hW1RnAEcvlyAx6uAaEpAM=; b=Oc/OhFTWwDXsJIlb
 +EiqHqlt1ySvn8l1yj6kmhWxCxPoYSDpOYeNi7f1u6GnDGMlbBD2Evx3fPSRed65
 slJJaiL+uCSWIKEXDpClA2N3mvuV2wWm6mwqSWtweubKLAHRonD0E2ONdbKpyHi6
 VaQEeZVpOMLjXN+gN91zPtpkOkY6YxVSmOCtdDiiZ9hFJZ406VSnWhK/xdmS4FJl
 0hi06n2lCnbv/AAXhHm+TJRZ4jK/aWGG/yPad8xp6nZzMkAb3YuMckHQSidgobWv
 leI27Niq86jIBMoakizg6/1juwo+Gy8TOpqIua15tWDVjEvtrxdM+O6d72wWcH3+
 fbUwjQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p7v8bwyq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 07:30:23 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6e8feea216aso94814456d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 00:30:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743406222; x=1744011022;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=USMO1/3Q6LQ9zEtI2Anlh9hW1RnAEcvlyAx6uAaEpAM=;
 b=TOqh60yjucQsFWiQZvhlmvHmZ5QAEhYWUQok5sZio7H5QWM0wsAuilXtbTL6GF7wsp
 r8JfMCDPqoM0w2PAPeIGs1dZOdSA2hGi7yvrcXK4lEuCHp/IS9LSvCMFI8wgvMliks8Y
 JDUjw4AB0SIBb9DmkkC8BY2O8oKZBZOek9SsTcw38zUYFuoCeoWmHm3zxVAVkI5YfGXC
 f1ap9OYGCqBbpoFH3KNy7Elkxs9pZ5krd88+qMIRirx8jjhT8Vx0LAVFIHhL2MKY5z8G
 NUZEQZAVoCqkMdYitHAesba67XkFTrTEN6L/WfRFw4pqzLyYgH0d7WIGVm2cOu1TTPaJ
 ZjLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5ZW47avwK+7lvKJWypcf5OP7vpjhque9HvpidSWUcIFnalld99CXcz3oakgKZwPE35HTGaU5UaAg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzlReaP9wlzgVn24Er4WnvFa1oZMlMYVniQJTxGHCV7QQ9UQ+z
 91ZRfDJas5JV9YJpf+qgVWfiftSsiPFMh4qgxFiUFJzApuOR92KMjqSbLhttUQHWqKiBuUVaJS+
 Vzi4Y5Lmj2lL361jQsYWENzHTWeyZF6mZnwVAA4k8cnGfoxfob9ymLxnmLITvny7P7P0=
X-Gm-Gg: ASbGncuA7qthw7kJLTWrQbDL1TPLIsrIwV0kerHjOVgrX486nDLgtxx+tl4LCUdH20u
 bT5ESYlrZrVabac2FZiSMMZx7vb+juhL1wn9k2yzVXhyqV3l5WJPxQxsCeuDbEOBzQi4HLj8YOw
 8Z63ry+VG8R3vmkLeY+VjKMObrjavoMjrtySKevaCSj+EQLcRQZ6G9Xa+YxJUN4MWfPkwp7RWm9
 gExiGuMIgczF8bU9zmQRf2x6Q2p8NAywWB4TFBLd9LYtLImW/YKmQzgUPNU+8pUcIxnFJuBCh/R
 M6vjl642U1eBWngfbAoPa8c043YnGQ5B0Q4JSFQMNwkYKwGkW2cRiAg3Oa2eA6PHjCtWlXXry/V
 rGkg=
X-Received: by 2002:a05:6214:2248:b0:6e2:485d:fddd with SMTP id
 6a1803df08f44-6eed517468emr146030676d6.1.1743406222588; 
 Mon, 31 Mar 2025 00:30:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnOgh9D7wsr/rVquCW+QBSn0LaG1Nx9wsrvIFyqwl3Pk5pH/CEA9s+7Qd8gDLnD2T0Oab5xA==
X-Received: by 2002:a05:6214:2248:b0:6e2:485d:fddd with SMTP id
 6a1803df08f44-6eed517468emr146030506d6.1.1743406222234; 
 Mon, 31 Mar 2025 00:30:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30dd2b59780sm13355181fa.108.2025.03.31.00.30.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 00:30:20 -0700 (PDT)
Date: Mon, 31 Mar 2025 10:30:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hermes.Wu@ite.com.tw
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw,
 treapking@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] drm/bridge: it6505: modify DP link auto training
Message-ID: <pbcwdoxu3k4nvfn5vpfap52dczsaykewkzxvf5x5moqoeq4wn3@j3pxtx3cgokd>
References: <20250326-fix-link-training-v2-0-756c8306f500@ite.com.tw>
 <20250326-fix-link-training-v2-3-756c8306f500@ite.com.tw>
 <cyanpojalscyqlpvlefd5czuyd2prrstws73pmza3tecq2ha2g@aegoyfuf6na6>
 <a6dcfa0c0a1e4f799dacda908888729a@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a6dcfa0c0a1e4f799dacda908888729a@ite.com.tw>
X-Proofpoint-ORIG-GUID: pBsmoUez1BXXw2NWYQEiRUakmA3EVijM
X-Authority-Analysis: v=2.4 cv=fdaty1QF c=1 sm=1 tr=0 ts=67ea448f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=Ns9eNvu6AAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=P1BnusSwAAAA:8 a=pGLkceISAAAA:8 a=cm27Pg_UAAAA:8 a=e5mUnYsNAAAA:8
 a=NIZf8mjcyvcE1nquY-IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=LZLx1i01EnjtqRv10NxV:22 a=cvBusfyB2V15izCimMoJ:22
 a=D0XLA9XvdZm18NrgonBM:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: pBsmoUez1BXXw2NWYQEiRUakmA3EVijM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_03,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503310052
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

On Mon, Mar 31, 2025 at 02:31:30AM +0000, Hermes.Wu@ite.com.tw wrote:
> >-----Original Message-----
> >From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 
> >Sent: Monday, March 31, 2025 2:44 AM
> >To: Hermes Wu (吳佳宏) <Hermes.Wu@ite.com.tw>
> >Cc: Andrzej Hajda <andrzej.hajda@intel.com>; Neil Armstrong <neil.armstrong@linaro.org>; Robert Foss <rfoss@kernel.org>; Laurent Pinchart <Laurent.pinchart@ideasonboard.com>; Jonas Karlman <jonas@kwiboo.se>; Jernej Skrabec <jernej.skrabec@gmail.com>; Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>; David Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Pet Weng (翁玉芬) <Pet.Weng@ite.com.tw>; Kenneth Hung (洪家倫) <Kenneth.Hung@ite.com.tw>; treapking@chromium.org; dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org
> >Subject: Re: [PATCH v2 3/5] drm/bridge: it6505: modify DP link auto training
> >
> >On Wed, Mar 26, 2025 at 01:34:15PM +0800, Hermes Wu via B4 Relay wrote:
> >> From: Hermes Wu <Hermes.wu@ite.com.tw>
> >> 
> >> IT6505 supports HW link training which will write DPCD and check 
> >> training status automatically.
> >> 
> >> In the case that driver set link rate at 2.7G and HW fail to training, 
> >> it will change link configuration and try 1.65G. And this will cause 
> >> INT_VID_FIFO_ERROR triggered when link clock is changed.
> >> 
> >> When video error occurs, video logic is reset and link training 
> >> restart, this will cause endless auto link training.
> >> 
> >> Modify link auto training with disable INT_VID_FIFO_ERROR to avoid 
> >> loop and check INT_LINK_TRAIN_FAIL event to abort wait training done.
> >> 
> >> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> >> ---
> >>  drivers/gpu/drm/bridge/ite-it6505.c | 38 
> >> +++++++++++++++++++++++++++----------
> >>  1 file changed, 28 insertions(+), 10 deletions(-)
> >> 
> >> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c 
> >> b/drivers/gpu/drm/bridge/ite-it6505.c
> >> index 
> >> 0607f99446b37c82b41a376c2f4e10c7565d1b61..e0e13e737763fb801fd1cd803734
> >> a0d6ae1dd812 100644
> >> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> >> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> >> @@ -1800,11 +1800,20 @@ static void it6505_link_training_setup(struct 
> >> it6505 *it6505)
> >>  
> >>  static bool it6505_link_start_auto_train(struct it6505 *it6505)  {
> >> -	int timeout = 500, link_training_state;
> >> +	int link_training_state;
> >>  	bool state = false;
> >>  	int int03;
> >> +	struct device *dev = it6505->dev;
> >> +	unsigned long timeout;
> >> +
> >> +	guard(mutex)(&it6505->aux_lock);
> >
> >Please don't mix functional changes and refactoring.
> >
> >> +	/* Disable FIFO error interrupt trigger  */
> >> +	/* to prevent training fail loop issue   */
> >> +	it6505_set_bits(it6505, INT_MASK_03, BIT(INT_VID_FIFO_ERROR), 0);
> >> +
> >> +	it6505_write(it6505, INT_STATUS_03,
> >> +		     BIT(INT_LINK_TRAIN_FAIL) | BIT(INT_VID_FIFO_ERROR));
> >>  
> >> -	mutex_lock(&it6505->aux_lock);
> >>  	it6505_set_bits(it6505, REG_TRAIN_CTRL0,
> >>  			FORCE_CR_DONE | FORCE_EQ_DONE, 0x00);
> >>  	/* reset link state machine and re start training*/ @@ -1812,32 
> >> +1821,41 @@ static bool it6505_link_start_auto_train(struct it6505 *it6505)
> >>  		     FORCE_RETRAIN | MANUAL_TRAIN);
> >>  	it6505_write(it6505, REG_TRAIN_CTRL1, AUTO_TRAIN);
> >>  
> >> -	while (timeout > 0) {
> >> +	timeout = jiffies + msecs_to_jiffies(100) + 1;
> >> +	for (;;) {
> >>  		usleep_range(1000, 2000);
> >>  		link_training_state = it6505_read(it6505, REG_LINK_TRAIN_STS);
> >>  		int03 = it6505_read(it6505, INT_STATUS_03);
> >>  		if (int03 & BIT(INT_LINK_TRAIN_FAIL)) {
> >> -			it6505_write(it6505, INT_STATUS_03,
> >> -				     BIT(INT_LINK_TRAIN_FAIL));
> >> -
> >>  			DRM_DEV_DEBUG_DRIVER(dev,
> >>  					     "INT_LINK_TRAIN_FAIL(%x)!",
> >>  					      int03);
> >>  
> >> +			/* Ignore INT_VID_FIFO_ERROR when auto training fail*/
> >> +			it6505_write(it6505, INT_STATUS_03,
> >> +				     BIT(INT_LINK_TRAIN_FAIL) |
> >> +				     BIT(INT_VID_FIFO_ERROR));
> >
> >Why can't it stay where it was?
> 
> Do you mean stay at original INT_LINK_TRAIN_FAIL clear and just add INT_VID_FIFO_ERROR?

Yes.

> 
> 

-- 
With best wishes
Dmitry
