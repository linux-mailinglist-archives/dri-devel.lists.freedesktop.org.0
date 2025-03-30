Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1207FA75BCA
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 20:43:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA33210E286;
	Sun, 30 Mar 2025 18:43:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lnhCwLvl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C5DF10E286
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 18:43:47 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52U9rKF7014451
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 18:43:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Kpfc/NFzZ1WMuMvGu1P2hqQL
 dzPYzaOT3QNvQ+BqJ+o=; b=lnhCwLvl5tL0oWk5TWjFyTs57eLRdAwf4khuSFuI
 XnJkznzdR5nfrQztcJR1z/jJ/2bc4vwezX8hIjGYwnjtV/E7ni0ztLbU88NarLuo
 Ch/uyPKpFEu2MiBZWbXcJ3Y4LWeKG32XgKlIY5mt+5uYWV34ug1gv0vcKghv0MFn
 cEFRG6mUrUeiXh3yglrzelKoVLkLdyMv448dPhUHO2HCYaZZVMV/api8XgKmDO8p
 eXNFAjYNzfeUNR3k0rVlii5DyDfzf8SClGZplQVBXFm80AzWiSnIV/zT+4vZUzZ/
 FIc2qfaJKWvEzrXrL4lYywfmN7zIrtv3kc/vKkbpDC0i7g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45pa5bjj20-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 18:43:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c54767e507so616185185a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 11:43:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743360225; x=1743965025;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kpfc/NFzZ1WMuMvGu1P2hqQLdzPYzaOT3QNvQ+BqJ+o=;
 b=t3bXWCRvcdl8KK6xzgRhuahll0dXXoquomiBOee1IFUIY88kuUWHahnxZmpoiPzNRF
 J8G6cqGBqbKXy18ZwmVIxJrj+Y0MhzCO2NjedjD4iAKdZ7FmmQTwxn03PlEGWZwyFGLW
 J4nP9GxoS3lXPmWZel5qJWJsSQkPIQlvUr2VShbbN4Md3uVyMyj07Lhet+5e8AYsbRVn
 QKha2nNpD+i3HdcgDm3AadmariJq9uFtmsF/CaFWThOlaZjIKRMAU5EHzHop1VuKAdgi
 7q2nlak7fIEEc+wy5EmhTwbV3ibDMXQYseV/lQJS2r5YeohT18jctzlr7/cIOxBVp15R
 S/AA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+wNWcalVxf5IwDH4iyFtK9zt6hkWaymSAa3XnBBnJYPeMcAODhi/3uC0guGgGbLJWMPBM9Ddr+L0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5deNqFCj1u5CB5tM1aK01uDKAMQNBDBzK3kY1CRdR6vRtcyLE
 3h+aHcIjy7eg4ygOzSwHd7HRRJ+QpAbCHoGg6vVdz1HtIVlRzVpfSxkpHLnmJ5tnbZ4ACXeKn07
 MjkPYck7RFYTnNb7kdv37FFbWtlYQgz/urJsgA8S6en5dGOe/qcaKdKBFiMj2OmMYz3Q=
X-Gm-Gg: ASbGnctAV3mEmb54xHZ5Z3FYfXntCbk8q0CbCwdAZvqm0vvNXnV4uSbTpWAQDmVmtDA
 umDOKNV9nLisbLAX+T/vxXPalRgD1+Ia6wAkHMf/RTj2a1hsf1OuHl9XVFAlE38bvL6xwcJQ7hh
 IqSPBCkZRw9pX6tPNEm4/e/7liqmcACOl/o2GG9b1f3A7aGyn+5wTpiHe6fg+x7Y5BrxsIxdpAF
 cV9v7VnPekrMe9mL+lAZSJAc6XR2JU0QChUEWyJnLdGn8rGqr9VowNzIHrKB5h5RJEj4HW7kydp
 A/+FEkkTZi/8BALK0ADUt1VsPJEOhiR9NIU//N/IStP+ayi7Nr5udJqheoQKPDE2nf14cI8IoTa
 0Hic=
X-Received: by 2002:a05:620a:294b:b0:7c5:f6d9:86ec with SMTP id
 af79cd13be357-7c6908757d6mr951049685a.35.1743360224783; 
 Sun, 30 Mar 2025 11:43:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyc5ZryX3N1yCP6KJlmCTencLbLEvyHdYw20hfuG3SCy1zQRmR5Jn2qLKantkKrvmtGGdPsQ==
X-Received: by 2002:a05:620a:294b:b0:7c5:f6d9:86ec with SMTP id
 af79cd13be357-7c6908757d6mr951046085a.35.1743360224396; 
 Sun, 30 Mar 2025 11:43:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54b094bb230sm939905e87.15.2025.03.30.11.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Mar 2025 11:43:42 -0700 (PDT)
Date: Sun, 30 Mar 2025 21:43:39 +0300
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
Subject: Re: [PATCH v2 3/5] drm/bridge: it6505: modify DP link auto training
Message-ID: <cyanpojalscyqlpvlefd5czuyd2prrstws73pmza3tecq2ha2g@aegoyfuf6na6>
References: <20250326-fix-link-training-v2-0-756c8306f500@ite.com.tw>
 <20250326-fix-link-training-v2-3-756c8306f500@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326-fix-link-training-v2-3-756c8306f500@ite.com.tw>
X-Proofpoint-GUID: PeWcLp-fCBcEw3UxqVhL_Ln4gKjfD1oH
X-Authority-Analysis: v=2.4 cv=YqcPR5YX c=1 sm=1 tr=0 ts=67e990e2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=Ns9eNvu6AAAA:8 a=HDUQXmQPWCFJsoTofFMA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=LZLx1i01EnjtqRv10NxV:22
X-Proofpoint-ORIG-GUID: PeWcLp-fCBcEw3UxqVhL_Ln4gKjfD1oH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503300131
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

On Wed, Mar 26, 2025 at 01:34:15PM +0800, Hermes Wu via B4 Relay wrote:
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
>  drivers/gpu/drm/bridge/ite-it6505.c | 38 +++++++++++++++++++++++++++----------
>  1 file changed, 28 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 0607f99446b37c82b41a376c2f4e10c7565d1b61..e0e13e737763fb801fd1cd803734a0d6ae1dd812 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -1800,11 +1800,20 @@ static void it6505_link_training_setup(struct it6505 *it6505)
>  
>  static bool it6505_link_start_auto_train(struct it6505 *it6505)
>  {
> -	int timeout = 500, link_training_state;
> +	int link_training_state;
>  	bool state = false;
>  	int int03;
> +	struct device *dev = it6505->dev;
> +	unsigned long timeout;
> +
> +	guard(mutex)(&it6505->aux_lock);

Please don't mix functional changes and refactoring.

> +	/* Disable FIFO error interrupt trigger  */
> +	/* to prevent training fail loop issue   */
> +	it6505_set_bits(it6505, INT_MASK_03, BIT(INT_VID_FIFO_ERROR), 0);
> +
> +	it6505_write(it6505, INT_STATUS_03,
> +		     BIT(INT_LINK_TRAIN_FAIL) | BIT(INT_VID_FIFO_ERROR));
>  
> -	mutex_lock(&it6505->aux_lock);
>  	it6505_set_bits(it6505, REG_TRAIN_CTRL0,
>  			FORCE_CR_DONE | FORCE_EQ_DONE, 0x00);
>  	/* reset link state machine and re start training*/
> @@ -1812,32 +1821,41 @@ static bool it6505_link_start_auto_train(struct it6505 *it6505)
>  		     FORCE_RETRAIN | MANUAL_TRAIN);
>  	it6505_write(it6505, REG_TRAIN_CTRL1, AUTO_TRAIN);
>  
> -	while (timeout > 0) {
> +	timeout = jiffies + msecs_to_jiffies(100) + 1;
> +	for (;;) {
>  		usleep_range(1000, 2000);
>  		link_training_state = it6505_read(it6505, REG_LINK_TRAIN_STS);
>  		int03 = it6505_read(it6505, INT_STATUS_03);
>  		if (int03 & BIT(INT_LINK_TRAIN_FAIL)) {
> -			it6505_write(it6505, INT_STATUS_03,
> -				     BIT(INT_LINK_TRAIN_FAIL));
> -
>  			DRM_DEV_DEBUG_DRIVER(dev,
>  					     "INT_LINK_TRAIN_FAIL(%x)!",
>  					      int03);
>  
> +			/* Ignore INT_VID_FIFO_ERROR when auto training fail*/
> +			it6505_write(it6505, INT_STATUS_03,
> +				     BIT(INT_LINK_TRAIN_FAIL) |
> +				     BIT(INT_VID_FIFO_ERROR));

Why can't it stay where it was?

> +
> +			if (int03 & BIT(INT_VID_FIFO_ERROR))
> +				DRM_DEV_DEBUG_DRIVER(dev,
> +						     "video fifo error when training fail");

Isn't the first message enough?

> +
>  			break;
>  		}
>  
>  		if (link_training_state > 0 &&
>  		    (link_training_state & LINK_STATE_NORP)) {
>  			state = true;
> -			goto unlock;
> +			break;
>  		}
>  
> -		timeout--;
> +		if (time_after(jiffies, timeout))
> +			break;
>  	}
> -unlock:
> -	mutex_unlock(&it6505->aux_lock);
>  
> +	/* recover interrupt trigger*/
> +	it6505_set_bits(it6505, INT_MASK_03,
> +			BIT(INT_VID_FIFO_ERROR), BIT(INT_VID_FIFO_ERROR));
>  	return state;
>  }
>  
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry
