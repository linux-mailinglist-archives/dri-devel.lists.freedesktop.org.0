Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA88B5941F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 12:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A9810E76D;
	Tue, 16 Sep 2025 10:48:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="g90p2kal";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E81F10E76D
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 10:48:39 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GAWwHR018495
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 10:48:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=7DAdHo/0Wzj909FzY2ncH6Uu
 2y9IDBRWUgZFM00a07U=; b=g90p2kal3gzVSzs3+vPyi8MHn/7rzNV8SzRlfO7G
 gIYDv3ZzYqQBJfymnoittZ2zxjfnA+uaXVGMou1SjCiNBRLK/7NmsjCqPZpSwov+
 uZm13iYlfKl3qw+rN0rthoeU1YhFhEXrFE6UfC3ISmCKNspNr9Rykmo6AMYPAH2t
 e5XCm17hY7zbG50C59VSs2kYy1AtSOg2t1ODG4+IRJpn0KlWMPAeZHrhdHY8WS2q
 cpBs2eL3BA1Kiv6IArLzjfC5oknWw9IGOLXk6+buiBPHOAJY/OkdVd7w6U0xOTFq
 nN03I2k7pPHGUXw/uapuBmeMK4eIW5aGD2q+Bacxc46F4A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496da9cxry-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 10:48:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b3415ddb6aso146208311cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 03:48:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758019718; x=1758624518;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7DAdHo/0Wzj909FzY2ncH6Uu2y9IDBRWUgZFM00a07U=;
 b=SuJDYnFBX1rwq5ygP1OfLuIR2ub4cpj8EJj/7vO2GoDP8yA/j49ZDE8OPLJvfeMPTs
 9M0Xp6wFVUyuGGG8NjCeVeZT6QrbTtXBz4ruWtEfDkCVsDCQAm/ByrGNL0nDc36E6tvY
 vyRA84k132GK77EVQEBztq3i10D04K7o3qBeHkqQd+f+eSINn9zH+4SwfemaJ6gYJ1Uj
 On6vfVPX0oVwQ+61gX/HR+ZSaT0v/PkzJZF7rLHMmzoiBmteYDelIpGxbGeF5+g/kwTa
 aEhjFKxOXyCUbjJ9hm9NIb6AqU2Qo7W/1Xo+tF3jUBHt/244tEAG/Fv52CwyUD3hkNc3
 P6NQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8+Op39DPeekft0cowuPq2JVbOnB/Vx02Xe9rGt1OyPAcUmKkAIgRyyVhwlLyxYGPMdZvY2i/gW2A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+8fc4Ebpl2WB87x0QOBlmgqvrfe0Zop/z4BD0MJDBDXIgkigS
 7Ycbk2FsuxhyJCJ2I9nJMJvtSQESDOSALxJeo4K57T7pR/cho3ZOyUf5qWQCAE/MljHJxJPXkgz
 Vl9qD3k3abJVskE8iias77x71+yOjYBg7XQBac1Dul7kEm8rvNRV0hiYcRsxaUHYoL1bWCIA=
X-Gm-Gg: ASbGncspQxioWk/Te5ruWVqxu/zufrn5uAPtWKmxA18sDfuEhlJ5AOB0G8UNzfVDYRw
 ufXKsA/9S0IUtZoddIjGGH+2eKCFS9nWaRskMkycxWIATX9x302Bm1PBI/bFb83Q04VKwL4c3Lf
 lfSc/dZ7WIV6/YvB2Tas0XbJ8dfXIwED1izIedchHJlIT4icornfWjmH9EGssGPEWGnXTWEn1p0
 bFBf7Fo6DjARlNP1QWOKivdU1dR6WNTG4sSPQ4Xy+tjoLUYkFyDXlnCxD3SBz2XvMezrNEVS9Ha
 VGs9kREJcmin/RTkRilJrj81v8Ni+S9QpnKanZcdhqqXKSFwai28os16d7Q+cven/Y+kZF5g/h0
 4QQHDZnCmsWbujdPpO0rqaQvcRLw6Nz3XBpg4OqlwtdNsACAw8f5k
X-Received: by 2002:ac8:5882:0:b0:4b7:9807:83c8 with SMTP id
 d75a77b69052e-4b7b444f8demr17631291cf.17.1758019717345; 
 Tue, 16 Sep 2025 03:48:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwD+EcuTK6nnc7ChKCSQixdeeULdoHQMpddScgT8o1eqraRF7VFL5CVZ10kzXY790VwjcUqQ==
X-Received: by 2002:ac8:5882:0:b0:4b7:9807:83c8 with SMTP id
 d75a77b69052e-4b7b444f8demr17631041cf.17.1758019716761; 
 Tue, 16 Sep 2025 03:48:36 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e5c692d10sm4377747e87.8.2025.09.16.03.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 03:48:35 -0700 (PDT)
Date: Tue, 16 Sep 2025 13:48:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hermes.wu@ite.com.tw
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw, treapking@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v3 3/5] drm/bridge: it6505: modify DP link auto
 training
Message-ID: <2bk6t2uibhbqtreavimigffzp746rnui4ohqk6sxcpolf4skjh@ddyma4omo6k7>
References: <20250916-fix-link-training-v3-0-0f55bfdb272a@ite.com.tw>
 <20250916-fix-link-training-v3-3-0f55bfdb272a@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916-fix-link-training-v3-3-0f55bfdb272a@ite.com.tw>
X-Authority-Analysis: v=2.4 cv=M+5NKzws c=1 sm=1 tr=0 ts=68c94086 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=Ns9eNvu6AAAA:8 a=fBcVJbpbova0GqNcjyIA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=LZLx1i01EnjtqRv10NxV:22
X-Proofpoint-GUID: hP3sU5_t2FZMFpzk2Dflgux3OX0WrfTu
X-Proofpoint-ORIG-GUID: hP3sU5_t2FZMFpzk2Dflgux3OX0WrfTu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA1NiBTYWx0ZWRfX2bwF1GfjWz43
 dhvLluogzzFvKQ1zogDi/1aIxqmq+ZzW9WKKQx91eJzArqhQLNgAoemHIxdqBlusjVOppgnCNAX
 dICCNETNR1dk1NX0QWArLmIzSbwb97sdU6UHz5F8ac99Welb/3Ji7L0e0WlSssTz15j1OySh9o2
 cIpm+m9aYMfAPLMyXH2gmznAGFFkq04aZp8GLT2BUVFF0sV63snNhf7+UWPyCrBQDmMqpu9sGqM
 CUyQACQrtskxw23MDNmuNT2lzs4CMIudHR/ffOciwzmjRBg6AVGgkb5zbrIBqHQCZb89gFlhby3
 pKRHDkzuXEJ2NafP5QiwmyT0wPiWZprem1Y6L7NQ98IJGm07c5K2Uul9aivhdB1kMljgltV/WKF
 IYdWOmEc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509150056
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

On Tue, Sep 16, 2025 at 12:47:43PM +0800, Hermes Wu via B4 Relay wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> IT6505 supports HW link training which will write DPCD and check
> training status automatically.
> 
> In the case that driver set link rate at 2.7G and HW fail to training,
> it will change link configuration and try 1.65G. And this will cause
> INT_VID_FIFO_ERROR triggered when link clock is changed.
> 
> When video error occurs, video logic is reset and link training restart,
> this will cause endless auto link training.
> 
> Modify link auto training with disable INT_VID_FIFO_ERROR to avoid loop
> and check INT_LINK_TRAIN_FAIL event to abort wait training done.
> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 7f6227c278a51358c70a3de93454aafeef64f2bb..f9b99c70789eea6beb3c6513155c9a4ca103d219 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -1806,6 +1806,13 @@ static bool it6505_link_start_auto_train(struct it6505 *it6505)
>  	struct device *dev = it6505->dev;
>  
>  	mutex_lock(&it6505->aux_lock);
> +
> +	/* Disable FIFO error interrupt trigger  */
> +	/* to prevent training fail loop issue   */
> +	it6505_set_bits(it6505, INT_MASK_03, BIT(INT_VID_FIFO_ERROR), 0);
> +
> +	it6505_write(it6505, INT_STATUS_03,
> +		     BIT(INT_LINK_TRAIN_FAIL) | BIT(INT_VID_FIFO_ERROR));
>  	it6505_set_bits(it6505, REG_TRAIN_CTRL0,
>  			FORCE_CR_DONE | FORCE_EQ_DONE, 0x00);
>  	/* reset link state machine and re start training*/
> @@ -1818,8 +1825,10 @@ static bool it6505_link_start_auto_train(struct it6505 *it6505)
>  		link_training_state = it6505_read(it6505, REG_LINK_TRAIN_STS);
>  		int03 = it6505_read(it6505, INT_STATUS_03);
>  		if (int03 & BIT(INT_LINK_TRAIN_FAIL)) {
> +			/* Ignore INT_VID_FIFO_ERROR when auto training fail*/
>  			it6505_write(it6505, INT_STATUS_03,
> -				     BIT(INT_LINK_TRAIN_FAIL));
> +				     BIT(INT_LINK_TRAIN_FAIL) |
> +				     BIT(INT_VID_FIFO_ERROR));

I'm really unusure about this change. Judging by the description of the
problem, it's fix for the issue, but the issue gets introduced in the
previous patch.

>  
>  			DRM_DEV_DEBUG_DRIVER(dev,
>  					     "INT_LINK_TRAIN_FAIL(%x)!",
> @@ -1837,6 +1846,9 @@ static bool it6505_link_start_auto_train(struct it6505 *it6505)
>  		timeout--;
>  	}
>  unlock:
> +	/* recover interrupt trigger*/
> +	it6505_set_bits(it6505, INT_MASK_03,
> +			BIT(INT_VID_FIFO_ERROR), BIT(INT_VID_FIFO_ERROR));
>  	mutex_unlock(&it6505->aux_lock);
>  
>  	return state;
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry
