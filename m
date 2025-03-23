Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A646A6CF18
	for <lists+dri-devel@lfdr.de>; Sun, 23 Mar 2025 13:04:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F46110E1B0;
	Sun, 23 Mar 2025 12:04:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EbrCtBWS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E11D610E1E7
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 12:04:28 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52N6Sjof019802
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 12:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=PtNJp8w8nckej15xutxKhS4k
 OXPplB94JjbMuQAYRRk=; b=EbrCtBWS7hnXnBrUFrZ62PLDHaISMF2xqqUAT+io
 ZrBe/ae/+Jd0PBds9av7K9eZISkptprQzbmj8mM/r1YKvdw6fg8tWQieGEqMMGFY
 8+hXs2sft7Sms46xIa52RJgNZwMBwgkWX5acptv0a9QD0zzx0/c4+yL3MK6i2cpE
 v8i804miy7q1NWYMHXETboVYHErF5cMMdUnK3Rx5ftzgqn38MIWrYKW7+irdBww2
 WJYANu6NThQstUhwJZFuqvQBhLfdIAmp4DlhsyRbNkNF6pGpcxgvcTjn70NydsAe
 x5/BuF5pDWuvAcDoLm+lXESfVreXEEdjtoU99uPQ2airXA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hne5sxxw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 12:04:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c53e316734so688008985a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 05:04:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742731467; x=1743336267;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PtNJp8w8nckej15xutxKhS4kOXPplB94JjbMuQAYRRk=;
 b=DBs7aHpq/mogXXDi44IbI+pklYicsin7IBWbeqY/aKBEBNGwIYlrtM4J1454mlO7Ur
 9il/0ka9VedbcaWYIRrKHyjbtQnJTPOXPdLJgdt88y4AloifdrVzmMinDaiVAC3UFPDu
 5miILZAsjRn/2QIHNdmpfYtvVhIjU8U8aBP52V9lfnCAmNYgFXfxGUbuYhuwH5o2hEho
 kDsGSwVMv21A7YAANG54zO7h+ltCidmBv9ta2QDj2k68Uw8fNABjoDwwXD86AEYvf1yq
 buA7/XkxT2rk10EWFDscfRTwBDTpGO2b0gt/K58O7iK7BGI7b/CuJMXebgf6lmTBGGgG
 yTBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWA9VBOXzgbdp4N0798mjmyyFpjYckM6mutmlmgHv8kuYCMcJEL/QXrfYSWKdBaMkiwEAkmbm7gNrM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzkl38iRRn8B5kbe6DpbgQZDfoAfXgbFZoTsLupCSjyq0ssu7sm
 /h1APwa7pocBbLgVaLD3V74X0LXAKoRatBBdsIPbeDTkzHsvwX1hzkJa+V6pEAk65zu1eAr4W9t
 MmmbTatMhGSqU2LgcMzGYzXgGXm3h0usTfLjVHDYTCu34mUlyLBXWGMgKEoR3xeWJ61E=
X-Gm-Gg: ASbGncshiKGDhjpc++tIdnVfqliD+gYLHhoVPD5Iuv5EpF8rV5x/UbrSuFNyGPflAng
 i8hc5Prz7lg+QyffY04zndvv7k7Zc7N2RwYChJn4Fk7HylItiym2acBgJKnUBwgsi6UPcijL29J
 NHUHXS/7f8XA66c419WBP2gVqqAKrb7NuNDjcbCTUC7BqpaRfFpG/n/E33EqzWAiItEBCMFMcyI
 hQCWBwHl86nSwgS1rksXoWzCXbRt73OcsRsjlQBns5FbBrfJvAArZKxqhme9yAShOu0TC/cszR4
 wD4kQvurpkQCvAznnnJSmKBpSbWOf24tqZEe4hbLJoyy1qZ3ecsMqUmq+7zTFjbdhqcEwco8b2a
 EULk=
X-Received: by 2002:a05:620a:3195:b0:7c5:5a51:d2d1 with SMTP id
 af79cd13be357-7c5ba1f82b6mr1710848385a.55.1742731466567; 
 Sun, 23 Mar 2025 05:04:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2A8oxvXHZ30wz/fnjEGUSilQEaiG/qyUmCAQEVrIcB8cjuiV+eyQPzVEYxJqb5IUczKBSIw==
X-Received: by 2002:a05:620a:3195:b0:7c5:5a51:d2d1 with SMTP id
 af79cd13be357-7c5ba1f82b6mr1710843785a.55.1742731466265; 
 Sun, 23 Mar 2025 05:04:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ad6511f50sm766696e87.222.2025.03.23.05.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Mar 2025 05:04:25 -0700 (PDT)
Date: Sun, 23 Mar 2025 14:04:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hermes Wu <Hermes.wu@ite.com.tw>
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
Subject: Re: [PATCH RESEND 2/3] drm/bridge: it6505: modify DP link training
 work
Message-ID: <7ltrwnweqk4dvqicppdpsj7pcbvky5peiwrunnfyvacklwuqia@265ovn3v3ifw>
References: <20250318-fix-link-training-v1-0-19266711142c@ite.com.tw>
 <20250318-fix-link-training-v1-2-19266711142c@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318-fix-link-training-v1-2-19266711142c@ite.com.tw>
X-Proofpoint-GUID: 96Ao57C3waycqzgzlxuzY-kJ1J2dz2Zw
X-Proofpoint-ORIG-GUID: 96Ao57C3waycqzgzlxuzY-kJ1J2dz2Zw
X-Authority-Analysis: v=2.4 cv=JvPxrN4C c=1 sm=1 tr=0 ts=67dff8cc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=Ns9eNvu6AAAA:8 a=tFqG47sHqY_YckTfvRsA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=LZLx1i01EnjtqRv10NxV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-23_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015
 mlxscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503230090
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

On Tue, Mar 18, 2025 at 04:32:10PM +0800, Hermes Wu wrote:
> The DP link training work include auto training and after
> auto training failed "auto_train_retry" times, it switch to
> step training mode.
> 
> It will more efficiency that finish link auto training,
> include retry, and step training in a work, rather than
> re-schedule train work when each training fail.
> 
> it6505_dump() is remove from link trainig work, it takes too much
> time to read all register area, and is not necessary.
> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 35 ++++++++++++++++-------------------
>  1 file changed, 16 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index dc1179c8338e27866f6adda4ef8fb2950336221b..11231a642bbe185c4f36bf5f2a0b115fa056213b 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -666,7 +666,7 @@ static int it6505_get_dpcd(struct it6505 *it6505, int offset, u8 *dpcd, int num)
>  	return 0;
>  }
>  
> -static void it6505_dump(struct it6505 *it6505)
> +static void __maybe_unused it6505_dump(struct it6505 *it6505)
>  {
>  	unsigned int i, j;
>  	u8 regs[16];
> @@ -2472,7 +2472,7 @@ static void it6505_link_training_work(struct work_struct *work)
>  {
>  	struct it6505 *it6505 = container_of(work, struct it6505, link_works);
>  	struct device *dev = it6505->dev;
> -	int ret;
> +	int ret, retry;
>  
>  	DRM_DEV_DEBUG_DRIVER(dev, "it6505->sink_count: %d",
>  			     it6505->sink_count);
> @@ -2480,26 +2480,23 @@ static void it6505_link_training_work(struct work_struct *work)
>  	if (!it6505_get_sink_hpd_status(it6505))
>  		return;
>  
> -	it6505_link_training_setup(it6505);
> -	it6505_reset_hdcp(it6505);
> -	it6505_aux_reset(it6505);
> -
> -	if (it6505->auto_train_retry < 1) {
> -		it6505_link_step_train_process(it6505);
> -		return;
> -	}
> +	retry = it6505->auto_train_retry;

Should you also drop auto_train_retry from the structure and assign
AUTO_TRAIN_RETRY here instead?

> +	do {
> +		it6505_link_training_setup(it6505);
> +		it6505_reset_hdcp(it6505);
> +		it6505_aux_reset(it6505);
>  
> -	ret = it6505_link_start_auto_train(it6505);
> -	DRM_DEV_DEBUG_DRIVER(dev, "auto train %s, auto_train_retry: %d",
> +		ret = it6505_link_start_auto_train(it6505);
> +		DRM_DEV_DEBUG_DRIVER(dev, "auto train %s, auto_train_retry: %d",
>  			     ret ? "pass" : "failed", it6505->auto_train_retry);
> +		if (ret) {
> +			it6505_link_train_ok(it6505);
> +			return;
> +		}
> +	} while (retry--);
>  
> -	if (ret) {
> -		it6505->auto_train_retry = AUTO_TRAIN_RETRY;
> -		it6505_link_train_ok(it6505);
> -	} else {
> -		it6505->auto_train_retry--;
> -		it6505_dump(it6505);
> -	}
> +	/*After HW auto training fail, try link training step by step*/
> +	it6505_link_step_train_process(it6505);
>  
>  }
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
