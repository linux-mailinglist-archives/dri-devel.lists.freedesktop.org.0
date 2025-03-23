Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 979BCA6CF17
	for <lists+dri-devel@lfdr.de>; Sun, 23 Mar 2025 13:02:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55C0910E14F;
	Sun, 23 Mar 2025 12:02:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bD8j4Ox0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FBA510E14F
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 12:02:33 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52N9nJRs013052
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 12:02:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=owWWg+3ngfcDMSge8Uta5NLk
 3HmV41FfKzaq3U7rS88=; b=bD8j4Ox0F0GEBtVGZxE/w6Y4tdrbfqhuvGZtHJTs
 ItpdqAEpKcvs0xQnMGbPBFaEQy+PRugpetfauoxadSHrf01vdRSH2g6w8phUxiDR
 zA7AvpIn37YzNCTer6Patl+sd6dOEel2avJYwFd25XlwiMrajnn7xavOZRAPkuRM
 Yt92Zad1Glh29XR9T12qSf+DojjfhaEyqZxGglIn5Hbrh7iLcBri7JLK4znGYg+Z
 aWxR6iMAfhtHcSv6l5H0savt6nlPnR36kedAU2GghD74kB9Hf7nWMnUNTFENr/o2
 a5j1w0hnTiNXJvsSkpXNBgRxZ8bxE97M6cymZpPqgpnEsQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hm79j38f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 12:02:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c3b53373f7so748494685a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 05:02:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742731343; x=1743336143;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=owWWg+3ngfcDMSge8Uta5NLk3HmV41FfKzaq3U7rS88=;
 b=cpQA2TybQme1qdRdIKOhOkn7y4W+FU13zDMUPwmPy3s97jpaYK2LxgrILWsx9dGLfa
 Q8IPRoyozvxnpS/NnDfZSgATKkmMRxg4tnc8elX7yaAbA1JlkFdsd+Ai5xbht+m9Ph6/
 vainFyxUJiSe0Delyy0Vh58ig1GK+yWa5DVUep3UpSbMWc/TyQDA+K/vEvEBH5Dj122B
 74A9eQQMv9gUEaX/ZYcxexb1I/VQWZUyZpt7Yr8IVsvzGw0EOE2XJxWALMmOm7baTqou
 s3x1WnWKyXmesBBPNvlXtlaxSbhTU925SxYv4S7N+glcBOOpab4iiD5Z3MC2OG/QGERP
 vfCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjn9WpaQDHew2i6O/RGh7XoUz/bB1wFOtCKMbsgwVSFGigZIzfO5JvxUcDm62VsmdVToKc1R0uJJs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7NNU0bm0Z0QRV/k+AY1ivgXEuxNmYpye23EhUKWTTsMB9Hrny
 eGnQotdfl9h6liWzQOP+lxafy2NIqY58oAKe1Sg4nq3Kk71D66CYbZYkXqqhLrTGE2AsONsMVM5
 RdkjZN7XgyHEh7CYEhCKjlqsnjwkL2xUAK9o4b9/jC0DTt+uylItKaj8DvO1QLFALFdA=
X-Gm-Gg: ASbGncu5+h2golwYtnINRCnnFqCua7XCKehfTBBwUKIsCxBlFWAchugUU2K/wiIDorr
 r4rrDlnwsCoPnmynrhMa7cIV7FRoME3tAA61LgV/SD8tD/jYx/ib3XuA9bEGo4x3jyVslRp9DIb
 P/2u5Zi0mAj9tA/aemM72mVazo4scqAMl2rRKMNfQ8dmu+050MoypFKNMj67EjA8oWYW079PLcp
 BT1EQFuZUqy2+XC1ukS4cu792+miyuP1f2v3cIx5Kz0n5bTK3pbY7hVroPlUTmJ+DdP9osoa0OA
 AWyGcLT2tv36iSSY49wrsleaSqjtEg3+6/wEEURkBr8Ve7spYR9VCkuuJgp8rJedCydLbVWhiQw
 pbGQ=
X-Received: by 2002:a05:620a:46a5:b0:7c3:c3bb:2538 with SMTP id
 af79cd13be357-7c5ba15c19cmr998398985a.14.1742731343280; 
 Sun, 23 Mar 2025 05:02:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2sOLr+Y7Ofa4PhKuOWYyWX/dd8bkc4YeS3A8FMOuKvB6oEGo5Yb9r45IMrvOUJipbqPGM7Q==
X-Received: by 2002:a05:620a:46a5:b0:7c3:c3bb:2538 with SMTP id
 af79cd13be357-7c5ba15c19cmr998394985a.14.1742731342759; 
 Sun, 23 Mar 2025 05:02:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ad6508163sm739052e87.181.2025.03.23.05.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Mar 2025 05:02:20 -0700 (PDT)
Date: Sun, 23 Mar 2025 14:02:18 +0200
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
Subject: Re: [PATCH RESEND 1/3] drm/bridge: it6505: modify DP link auto
 training
Message-ID: <vs6hcvwpuvkih3xpcl7ew2x5verz2ddyf4bufmwnqxwl5iu2vi@rpwaqmdobqdl>
References: <20250318-fix-link-training-v1-0-19266711142c@ite.com.tw>
 <20250318-fix-link-training-v1-1-19266711142c@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318-fix-link-training-v1-1-19266711142c@ite.com.tw>
X-Proofpoint-GUID: LNcBbBVdXFhIbF9nlR_wL-nvhjkzVtn7
X-Proofpoint-ORIG-GUID: LNcBbBVdXFhIbF9nlR_wL-nvhjkzVtn7
X-Authority-Analysis: v=2.4 cv=IKYCChvG c=1 sm=1 tr=0 ts=67dff850 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=Ns9eNvu6AAAA:8 a=S_47lyTNMjpC8ibViOYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=LZLx1i01EnjtqRv10NxV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-23_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
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

On Tue, Mar 18, 2025 at 04:32:09PM +0800, Hermes Wu wrote:
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
> Since INT_LINK_TRAIN_FAIL is checked when auto training, it is remove
> from  it6505_int_threaded_handler()
> 
> In order to reset HW link auto training state,
> bits FORCE_RETRAIN and MANUAL_TRAIN at REG_TRAIN_CTRL1 must be set
> at the same time.

I've been looking at this patch for some time. I think there is too much
going on for a single commit. I'd suggest splitting out the
INT_VID_FIFO_ERROR handling and MANUAL_TRAIN changes to separate
commits. Then dropping of unused BIT_INT_LINK_TRAIN_FAIL will also go to
a separate commit that it deserves.

Basically, if at any point you feel that the commit message starts to
look like 'Perform A. Then drop B. C should be set', this is a
description for three commits, not just one.

> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 61 +++++++++++++++++++++++++------------
>  1 file changed, 42 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 88ef76a37fe6accacdd343839ff2569b31b18ceb..dc1179c8338e27866f6adda4ef8fb2950336221b 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -821,7 +821,7 @@ static void it6505_int_mask_enable(struct it6505 *it6505)
>  	it6505_write(it6505, INT_MASK_02, BIT(INT_AUX_CMD_FAIL) |
>  		     BIT(INT_HDCP_KSV_CHECK) | BIT(INT_AUDIO_FIFO_ERROR));
>  
> -	it6505_write(it6505, INT_MASK_03, BIT(INT_LINK_TRAIN_FAIL) |
> +	it6505_write(it6505, INT_MASK_03,
>  		     BIT(INT_VID_FIFO_ERROR) | BIT(INT_IO_LATCH_FIFO_OVERFLOW));
>  }
>  
> @@ -1800,30 +1800,62 @@ static void it6505_link_training_setup(struct it6505 *it6505)
>  
>  static bool it6505_link_start_auto_train(struct it6505 *it6505)
>  {
> -	int timeout = 500, link_training_state;
> +	int link_training_state;
>  	bool state = false;
> +	struct device *dev = it6505->dev;
> +	int int03;
> +	unsigned long timeout;
> +
> +	guard(mutex)(&it6505->aux_lock);
> +	/* Disable FIFO error interrupt trigger  */
> +	/* to prevent training fail loop issue   */
> +	it6505_set_bits(it6505, INT_MASK_03, BIT(INT_VID_FIFO_ERROR), 0);
> +
> +	it6505_write(it6505, INT_STATUS_03,
> +		     BIT(INT_LINK_TRAIN_FAIL) | BIT(INT_VID_FIFO_ERROR));
> +	int03 = it6505_read(it6505, INT_STATUS_03);
>  
> -	mutex_lock(&it6505->aux_lock);
>  	it6505_set_bits(it6505, REG_TRAIN_CTRL0,
>  			FORCE_CR_DONE | FORCE_EQ_DONE, 0x00);
> -	it6505_write(it6505, REG_TRAIN_CTRL1, FORCE_RETRAIN);
> +
> +	/* reset link state machine and re start training*/
> +	it6505_write(it6505, REG_TRAIN_CTRL1,
> +		     FORCE_RETRAIN | MANUAL_TRAIN);
>  	it6505_write(it6505, REG_TRAIN_CTRL1, AUTO_TRAIN);
>  
> -	while (timeout > 0) {
> +	timeout = jiffies + msecs_to_jiffies(100) + 1;
> +	for (;;) {
>  		usleep_range(1000, 2000);
>  		link_training_state = it6505_read(it6505, REG_LINK_TRAIN_STS);
> +		int03 = it6505_read(it6505, INT_STATUS_03);
> +		if (int03 & BIT(INT_LINK_TRAIN_FAIL)) {
> +			/* Ignore INT_VID_FIFO_ERROR when auto training fail*/
> +			it6505_write(it6505, INT_STATUS_03,
> +				     BIT(INT_LINK_TRAIN_FAIL) |
> +				     BIT(INT_VID_FIFO_ERROR));
> +
> +			if (int03 & BIT(INT_VID_FIFO_ERROR)) {
> +				DRM_DEV_DEBUG_DRIVER(dev,
> +				"video fifo error when training fail (%x)!",
> +				int03);
> +			}
> +
> +			break;
> +		}
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
> @@ -2377,7 +2409,7 @@ static void it6505_stop_link_train(struct it6505 *it6505)
>  {
>  	it6505->link_state = LINK_IDLE;
>  	cancel_work_sync(&it6505->link_works);
> -	it6505_write(it6505, REG_TRAIN_CTRL1, FORCE_RETRAIN);
> +	it6505_write(it6505, REG_TRAIN_CTRL1, FORCE_RETRAIN | MANUAL_TRAIN);
>  }
>  
>  static void it6505_link_train_ok(struct it6505 *it6505)
> @@ -2691,14 +2723,6 @@ static void it6505_irq_audio_fifo_error(struct it6505 *it6505)
>  		it6505_enable_audio(it6505);
>  }
>  
> -static void it6505_irq_link_train_fail(struct it6505 *it6505)
> -{
> -	struct device *dev = it6505->dev;
> -
> -	DRM_DEV_DEBUG_DRIVER(dev, "link training fail interrupt");
> -	schedule_work(&it6505->link_works);
> -}
> -
>  static bool it6505_test_bit(unsigned int bit, const unsigned int *addr)
>  {
>  	return 1 & (addr[bit / BITS_PER_BYTE] >> (bit % BITS_PER_BYTE));
> @@ -2763,7 +2787,6 @@ static irqreturn_t it6505_int_threaded_handler(int unused, void *data)
>  		{ BIT_INT_AUX_CMD_FAIL, it6505_irq_aux_cmd_fail },
>  		{ BIT_INT_HDCP_KSV_CHECK, it6505_irq_hdcp_ksv_check },
>  		{ BIT_INT_AUDIO_FIFO_ERROR, it6505_irq_audio_fifo_error },
> -		{ BIT_INT_LINK_TRAIN_FAIL, it6505_irq_link_train_fail },
>  	};
>  	int int_status[3], i;
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
