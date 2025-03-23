Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5152A6CF1D
	for <lists+dri-devel@lfdr.de>; Sun, 23 Mar 2025 13:06:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F3910E1B8;
	Sun, 23 Mar 2025 12:06:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mhSAlpxg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F00610E1B8
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 12:06:11 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52NAn2Uw019829
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 12:06:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=MV32qCiB38FYLSVABwWjrG0V
 5R2pP5jz+dWOa/JclsU=; b=mhSAlpxgAt7A7bAdKGZ2oIrYq/sM9Xu6hMy5chAa
 DRrmZrhYINDUQuziAlJynO6xUl+l4IMQARyRnDuJf1IQibZePQg1Yo5cBwvSj9Mp
 MNaIlP+52uuyu5OOX8N+FUCbBoj9V9QWLNH7TQh7IAtBddZcKnaxuHxb6HsXRAGw
 uqyHrKqnwKPmMFRJSgI9nWOBkhyIwbee/KmNDky5iWHKZ527+9mcqO1k/7EvvrAb
 Q1KJ+joEUHwutL2xitTajlDPRdLUgghcSFms1jtkCdurAGgL0+K7DWez8iRvIfqp
 yiRMS47bawCRI+8GZlDCjyacd+uP3VIQ1NFCwxe/m+QMrQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hn9w9ysp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 12:06:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c3b6450ed8so609887885a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 05:06:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742731569; x=1743336369;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MV32qCiB38FYLSVABwWjrG0V5R2pP5jz+dWOa/JclsU=;
 b=ZIJi+YJt5HjfzNpYfVV1uBlY4smhu78mkIcIQHPYScOdB9LqrJYHotorfZ4ScL6jig
 MldY1Jgw7AzeGK2Wo4VX1+ON35k1maqUmXga2ae6vSu7Q2cZTfnPCQZ1lO/cVspAhevo
 ajRSZy6GqNYPM5c1K28KMrYi8i5ChQ7FSPD5C+VWShIcxFpA3JHRkHPvwHkTzpI12uh+
 OGA9KAO8YYWdWxBnsFSl/n09hhI1Q0Buw4kCIqJCwp6omerzQMXmYApYVOKB3tf/BEIZ
 P3KeTT9a/W3GiJ4svg7sRStHBG4vDVuvhSMX/CvcF+/hPSFbMYQPyfDjdj7l1PtfCHm/
 nLGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2vm5EQS4jq1ZGuXLJD3TTpCYZY8CnDr8zv9OGte3DfwI30/EIQBLq1xQcragQt0G98I2EbjXLCnQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyscNQWXLWScCxto91I6PUno0xIb82PWXV54YI1BW2J3mGUiSrW
 sCEVLzaWNvfAetiV5/nE8ygcz7VPisvRSSMjQQuzISXFxz/5fvtpIO5hTLhbeRx2qdQxdjMqSh+
 8FGn8J3J+Hf5oRC9eMxQKqD+3IObAHf7n94zkkkak4eRqwoLK+vpZ9DGqQ7N94KfSvkk=
X-Gm-Gg: ASbGnctujd0SqKi5x+gn4ddrE4g+PrOHO+Kglya9bl8n/zZg1WMe4CZ393ZZ/OeHrVc
 2nJIwbha/s12YjWeld1l/BUWe3byBl1wFZfuPX3S043yaxmHbX/8l+pna5OBmVaHa0Z9wY0Mdyt
 hWvhN6aYuLlAPYKW2ohOHdGS+KKmEgzXBxJCfNg5vlMEc00dX+vsktBonYp2YjV7IzJ/SkfYEDi
 EQZ+L6QYkkK7YuIh13otHpVbScfg/nTK2PndTz6odaumSTXwk8gjGEejl7/jCEmQsLzHK2oRx8P
 pNeQfmNleN0BviEG0XmC1DdMlipSGt/s2kbcO2ORUffQfGoMZvU+NYUqWMv5AkRTZmnhdwZTx+M
 70fg=
X-Received: by 2002:a05:620a:191e:b0:7c5:5d83:2ea8 with SMTP id
 af79cd13be357-7c5ba191d17mr1282044585a.34.1742731569445; 
 Sun, 23 Mar 2025 05:06:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSk5U6ZXm8gW7Il/iWs/ZGcfd2ZuajH0qgw8cFlxalF2lUpkYJJ58AqSDCJy+z1woszsYucQ==
X-Received: by 2002:a05:620a:191e:b0:7c5:5d83:2ea8 with SMTP id
 af79cd13be357-7c5ba191d17mr1282040785a.34.1742731568968; 
 Sun, 23 Mar 2025 05:06:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ad64fbb1asm764400e87.120.2025.03.23.05.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Mar 2025 05:06:06 -0700 (PDT)
Date: Sun, 23 Mar 2025 14:06:05 +0200
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
Subject: Re: [PATCH RESEND 3/3] drm/bridge: it6505: skip auto training when
 previous try fail
Message-ID: <ygndq6rndwduzxi77clpofvck4px5ohsnifpug6nupjzt4cs7g@npjx2othedpp>
References: <20250318-fix-link-training-v1-0-19266711142c@ite.com.tw>
 <20250318-fix-link-training-v1-3-19266711142c@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318-fix-link-training-v1-3-19266711142c@ite.com.tw>
X-Proofpoint-GUID: 4NqjSDTrEyE3Wlze9S3Mvn85I2dBh4M9
X-Proofpoint-ORIG-GUID: 4NqjSDTrEyE3Wlze9S3Mvn85I2dBh4M9
X-Authority-Analysis: v=2.4 cv=CPoqXQrD c=1 sm=1 tr=0 ts=67dff932 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=Ns9eNvu6AAAA:8 a=CAG1TeXkPrI7es7L6SQA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=LZLx1i01EnjtqRv10NxV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-23_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

On Tue, Mar 18, 2025 at 04:32:11PM +0800, Hermes Wu wrote:
> When connect to device which can only training done by
> step training, skip auto training when link training restart,
> usually happen when display resolution is changed.
> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 36 +++++++++++++++++++++---------------
>  1 file changed, 21 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 11231a642bbe185c4f36bf5f2a0b115fa056213b..730481a9446ff00a54ef70e86b4c28ff0a3f417e 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -468,6 +468,7 @@ struct it6505 {
>  	struct work_struct hdcp_wait_ksv_list;
>  	struct completion extcon_completion;
>  	u8 auto_train_retry;
> +	u8 step_train_only;
>  	bool hdcp_desired;
>  	bool is_repeater;
>  	u8 hdcp_down_stream_count;
> @@ -2459,11 +2460,13 @@ static void it6505_link_step_train_process(struct it6505 *it6505)
>  				     ret ? "pass" : "failed", i + 1);
>  		if (ret) {
>  			it6505_link_train_ok(it6505);
> +			it6505->step_train_only = true;
>  			return;
>  		}
>  	}
>  
>  	DRM_DEV_DEBUG_DRIVER(dev, "training fail");
> +	it6505->step_train_only = false;
>  	it6505->link_state = LINK_IDLE;
>  	it6505_video_reset(it6505);
>  }
> @@ -2479,21 +2482,23 @@ static void it6505_link_training_work(struct work_struct *work)
>  
>  	if (!it6505_get_sink_hpd_status(it6505))
>  		return;
> -
> -	retry = it6505->auto_train_retry;
> -	do {
> -		it6505_link_training_setup(it6505);
> -		it6505_reset_hdcp(it6505);
> -		it6505_aux_reset(it6505);
> -
> -		ret = it6505_link_start_auto_train(it6505);
> -		DRM_DEV_DEBUG_DRIVER(dev, "auto train %s, auto_train_retry: %d",
> -			     ret ? "pass" : "failed", it6505->auto_train_retry);
> -		if (ret) {
> -			it6505_link_train_ok(it6505);
> -			return;
> -		}
> -	} while (retry--);
> +	/* skip auto training if previous auto train is fail*/
> +	if (!it6505->step_train_only) {
> +		retry = it6505->auto_train_retry;
> +		do {
> +			it6505_link_training_setup(it6505);
> +			it6505_reset_hdcp(it6505);
> +			it6505_aux_reset(it6505);
> +
> +			ret = it6505_link_start_auto_train(it6505);
> +			DRM_DEV_DEBUG_DRIVER(dev, "auto train %s, auto_train_retry: %d",
> +				ret ? "pass" : "failed", it6505->auto_train_retry);
> +			if (ret) {
> +				it6505_link_train_ok(it6505);
> +				return;
> +			}
> +		} while (retry--);

This really looks like

	for (retry = 0;
	     retry < AUTO_TRAIN_RETRY && !it6505->step_train_only ;
	     retry++)

Please consider changing the previous patch and this patch accordingly.

> +	}
>  
>  	/*After HW auto training fail, try link training step by step*/
>  	it6505_link_step_train_process(it6505);
> @@ -2605,6 +2610,7 @@ static void it6505_irq_hpd(struct it6505 *it6505)
>  			it6505_parse_link_capabilities(it6505);
>  		}
>  		it6505->auto_train_retry = AUTO_TRAIN_RETRY;
> +		it6505->step_train_only = false;
>  
>  		it6505_drm_dp_link_set_power(&it6505->aux, &it6505->link,
>  					     DP_SET_POWER_D0);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
