Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F92A75BBE
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 20:13:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA6610E344;
	Sun, 30 Mar 2025 18:13:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wj1JArsI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B105C10E344
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 18:13:40 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UI3Do5029895
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 18:13:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=WUEN9iRJb1WzYvZmH1HZeasB
 WdQUxWrzY9CiMNkx66c=; b=Wj1JArsI0uRhzRfVsniUlPULPw7x5Ya97GrtwRxN
 +IevovQsqYWb84MFVy+n3j1oXYg0Pou3CXLGNePVDNfuOHRuax3pV8x/gGLzIDcq
 RlNEvS62jIaxMDvuiiexFnsBY5iQUfIXK1JuUqvi3XEYJSryhhE3p1Q8/MpfCKj6
 Vttq6/fH6UU/Jm+tDnyap+tYmjDuAHF+2hbvgnIQQz1FYq6s7ED1iK2vMYg7zfLq
 ofFpxbWIcsAAHvsvCQjMFbQpPihAdh45Om7vToSXrFZi4UvGyoR+fxcsZo9MHR9+
 uHMbg3AwHlMFZYgXQdxa7SLeEMnkyZMqjbLc6jIcV2OPIg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p8f1amwm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 18:13:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c548e16909so361729385a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 11:13:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743358419; x=1743963219;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WUEN9iRJb1WzYvZmH1HZeasBWdQUxWrzY9CiMNkx66c=;
 b=xO32NvcFO9eOc9adcxCGilcMZMKCv1+4XfTXqoZFpdR82QsQMXTqh9mANJ1mTu/oVV
 JzQXtjQJzE5e41iTVbfJTFlF7Fdn31E5sQqfy53As8zYUeljQq8IbC9lkKny4LwhPqWq
 T+4jCutLoWx0VRJMevIrxUk+0Pol9R+GE9vWlaJnIBuH8Acrb2yhvwHau0C5mDM01qoY
 7uSD93kh4ieKJoMXyUTjZjunVY5HPZwFAMlUVy0f7ooE65RFLT+T0bqz6x6Pq+jc+3CX
 79TBZFNhzotumOer11GyHBUvMT6LNqIpYENTJI42hbV4OGIzzr7N1jBPZvL5NtruSnU2
 dYGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzJ8KRBN/0vgOEcdib1ky59P4zjBvbq2oxRMKJaXPFosmwfq7qwlwXAl+Exn+3bud7gThwEYCl+bE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMibGUlYmWTqXNqxCJtDZPFLFj1AxA+AF8OV7LQMuAIEsNXVcj
 1G5PmSzYePClK1IxOcaBPz+xOrGq67oge6vFbaPXX8D99Px69sDaqq2T+1Tavwx/FCtmpv0zboY
 TbpmxjA1JTJ+w6ln2zxtcyGc9SFGcGiUGQ07XFcr9mKfZHdWC+U48K6sXFQJSQga1nUw=
X-Gm-Gg: ASbGnctqvAWKQeaKM0fjRUDdSdktuQa50jEnnE60XscVIqI8dtMex/8nJRrhcKQMyvs
 INTdSPeXnoiLj+RiWEc+fZ5it82uHu2T6rmYKL992kDrgYJh1ysCovl9waSX3I0BQS2SIUytx0A
 1FNYQuYyovE//fnBUyu2gmCj65ZYFooBfH4nhFHZK+MiVEfXhd/UbfuebcfK4Z7gGHBmUTHv4TM
 7AA3WFnz8QAYk5fFFmYMf09cTxVhGVGqYKbvJpeuPoJsuG46COvYUlr/021T/JHwRdIRBdlKj3Y
 mg25/WA81ZGT/G5dMhr0SGO6q8V9XyhEnTYVV0FfBwm5m4ZnHRXBdQT7B2mgHhtbdrUAYeCNRXw
 8GCQ=
X-Received: by 2002:a05:620a:4045:b0:7c5:55f9:4bcb with SMTP id
 af79cd13be357-7c6907302cbmr900183285a.31.1743358418903; 
 Sun, 30 Mar 2025 11:13:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGq5lxxs4WWVuVHIdOx1mQAVzaioVzGDl41ZQcSwyaKYLad4CANSMH1Tb9wh/8tQqgwQchTBw==
X-Received: by 2002:a05:620a:4045:b0:7c5:55f9:4bcb with SMTP id
 af79cd13be357-7c6907302cbmr900180585a.31.1743358418566; 
 Sun, 30 Mar 2025 11:13:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30dd2aa92a3sm11779521fa.12.2025.03.30.11.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Mar 2025 11:13:36 -0700 (PDT)
Date: Sun, 30 Mar 2025 21:13:33 +0300
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
Subject: Re: [PATCH v2 1/5] drm/bridge: it6505: fix link training state HW
 register reset
Message-ID: <2qtjj5twmzhijjg2l66ulajtkrwpjozmwqv4c7ygvxizgewao7@6ingwjrdene3>
References: <20250326-fix-link-training-v2-0-756c8306f500@ite.com.tw>
 <20250326-fix-link-training-v2-1-756c8306f500@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326-fix-link-training-v2-1-756c8306f500@ite.com.tw>
X-Authority-Analysis: v=2.4 cv=AsDu3P9P c=1 sm=1 tr=0 ts=67e989d3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=Ns9eNvu6AAAA:8 a=_uL5M0xGhN6UrWZjKboA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=LZLx1i01EnjtqRv10NxV:22
X-Proofpoint-GUID: RxyJMsRxJNZF3lh8BdU1BHCNHojAXPrx
X-Proofpoint-ORIG-GUID: RxyJMsRxJNZF3lh8BdU1BHCNHojAXPrx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503300127
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

On Wed, Mar 26, 2025 at 01:34:13PM +0800, Hermes Wu via B4 Relay wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> In order to reset HW link auto training state,
> bits FORCE_RETRAIN and MANUAL_TRAIN at REG_TRAIN_CTRL1 must be set
> at the same time.

Nit: please start by describing the problem that the patch attempts to
solve.

> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 88ef76a37fe6accacdd343839ff2569b31b18ceb..b47042dc06bb1e1dfd92bc0dc6d69dc918a140ba 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -1806,7 +1806,9 @@ static bool it6505_link_start_auto_train(struct it6505 *it6505)
>  	mutex_lock(&it6505->aux_lock);
>  	it6505_set_bits(it6505, REG_TRAIN_CTRL0,
>  			FORCE_CR_DONE | FORCE_EQ_DONE, 0x00);
> -	it6505_write(it6505, REG_TRAIN_CTRL1, FORCE_RETRAIN);
> +	/* reset link state machine and re start training*/
> +	it6505_write(it6505, REG_TRAIN_CTRL1,
> +		     FORCE_RETRAIN | MANUAL_TRAIN);
>  	it6505_write(it6505, REG_TRAIN_CTRL1, AUTO_TRAIN);
>  
>  	while (timeout > 0) {
> @@ -2377,7 +2379,7 @@ static void it6505_stop_link_train(struct it6505 *it6505)
>  {
>  	it6505->link_state = LINK_IDLE;
>  	cancel_work_sync(&it6505->link_works);
> -	it6505_write(it6505, REG_TRAIN_CTRL1, FORCE_RETRAIN);
> +	it6505_write(it6505, REG_TRAIN_CTRL1, FORCE_RETRAIN | MANUAL_TRAIN);
>  }
>  
>  static void it6505_link_train_ok(struct it6505 *it6505)
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry
