Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFD3A75BCE
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 20:46:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C6B610E34F;
	Sun, 30 Mar 2025 18:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pqjWk2Xe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C953810E34F
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 18:46:18 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UBVkde013046
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 18:46:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=vOlLqEjKwbxEq639/h9Id8+4
 Qr2lhoih+XgMY4+YVDc=; b=pqjWk2Xe+Qxd2TWYxD5R0zkkkpJp4aU9hxNpvESD
 JSCKTmjyyhp2hN0j6cLvS460Mex0QASMzc2YbgWiEEob5JAX7X7ApKLIIYffvKxd
 SM/54Z/9RsqHDad0My8RyGeu31hd/AuJCk0ElLO5OSjHq78Av+qKxsIFyP6OJuIj
 P58BDkn8E3UBhrTDTahFl1QDLFXDbkaH2EYbrY+rbIGuBrpAzm77Nno/lNEkOr02
 N75BSdSpBKn77TDclsLjuEm6qAoBTNYRYPCKR+p6MxZKY9Z8jyAyT54w5BvVJ1Rp
 igtGnz4GpOjeOoZESR2fOTzJrJLvpD4VpOlLFREDb52k4w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p935tmau-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 18:46:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5c77aff55so921050285a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 11:46:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743360377; x=1743965177;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vOlLqEjKwbxEq639/h9Id8+4Qr2lhoih+XgMY4+YVDc=;
 b=VDHvhXgx+y0vg3V9PACUSu45BfdFUd4Qzol7Hq0Lx2WGfken3uCdWtG0XcNbKRnC84
 dLbafqGwj9YEHQijZB1jw+VTL1DjCK0beqTMeotnGff4x5F3PE/lsyCeaxVBJIQbZlJG
 ymYYkOor87QO3876E2/qrz0cWIpuQlRrx7Zvx7K3ynOi6LrjJYES/TC2lRybyHoZlwDT
 oOotS4gN6XzMyG5RQV5PwN/qTnX8k+EsDjRJj9QpHFxkHDjTASHsUA5hv42B0X+D7Uw7
 8N8Jc9Ills6LlSaz/DD3paZe6HWVc9AjP5lc0ucLUNHIIzXJ+RXZ/JT12fqAJnZKVHkk
 NFEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVx2sZ/NFij9Kri5cpx2qms3QWOi9xgezIq3yhG+mDg6+uaM9ot0Wo292OnCVx+v9a6furfU1nCxuY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTPU8ekfAq9wdLGWqpIYnOWz5PTJxxGoIWdJiLPb1yX/ggh5Tn
 ldXqH1nUO4cEo4SEB/FP7/nrs55t0LHIO+MtrVcAG4ubarIqqHVedRShc6f3TLuX50HzgaHCof6
 pJaKYF2WFi+HzAajIohKb7GHLDNm2wK05qsMGpmeSUiPoP3CU3klkWpIn4JOH0ZJbEkc=
X-Gm-Gg: ASbGncu87Ic1RQLof06R3COKlnv48lIdxDp4xiVPuQcL407nwwZj9XZNNO4B9teTpVp
 Zrtwh9vIbcQf3VdPgj44F1ZGlxHISSy7qDOIMsDqtexU6j9kMHzL+s0kG4na1BqA4PKnn8MogQP
 5r2OvX+ndw7g1I1iwmVxtA/54A3KHgP5BgNnODUcZTxej+c1a7S/6QbDlUKfHzX48TMzBw5EcuG
 h3DK7mDAnPXGpO91vQuIzyi/Yp8BeYCL+K2ExDY+JhS7e7oe2KF2q7uts8QZyR05N/65qdomsvm
 63kyQvxfdmraNi7S/990UhCAxcke7dC44pMoxnphzzRk1wcQN0vITW/lUArIr7qSB5RfbaDn5o7
 ZdWg=
X-Received: by 2002:a05:620a:4454:b0:7c5:6291:904d with SMTP id
 af79cd13be357-7c6908758e1mr863307485a.38.1743360376745; 
 Sun, 30 Mar 2025 11:46:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmBVhEQYU73drJz7EC/guyVz0cEaX8wDqOsw9gIjYHp01Ieg/NUkgxp3VYtEZx2GwJw2hT/g==
X-Received: by 2002:a05:620a:4454:b0:7c5:6291:904d with SMTP id
 af79cd13be357-7c6908758e1mr863304885a.38.1743360376301; 
 Sun, 30 Mar 2025 11:46:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30dd2ab9705sm12073651fa.46.2025.03.30.11.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Mar 2025 11:46:14 -0700 (PDT)
Date: Sun, 30 Mar 2025 21:46:11 +0300
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
Subject: Re: [PATCH v2 5/5] drm/bridge: it6505: skip auto training when
 previous try fail
Message-ID: <poqcbsiibivd7sguf7pe477noo67jp2hfli54j5yeqgvzw7vdj@wmfjdqf6akmp>
References: <20250326-fix-link-training-v2-0-756c8306f500@ite.com.tw>
 <20250326-fix-link-training-v2-5-756c8306f500@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326-fix-link-training-v2-5-756c8306f500@ite.com.tw>
X-Proofpoint-GUID: zqOlONlvJPNqaJ9MXRSp9jJImgh2t8MK
X-Authority-Analysis: v=2.4 cv=KOFaDEFo c=1 sm=1 tr=0 ts=67e9917a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=Ns9eNvu6AAAA:8 a=6XuZkpsQUAZ6t1zeVoMA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=LZLx1i01EnjtqRv10NxV:22
X-Proofpoint-ORIG-GUID: zqOlONlvJPNqaJ9MXRSp9jJImgh2t8MK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503300132
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

On Wed, Mar 26, 2025 at 01:34:17PM +0800, Hermes Wu via B4 Relay wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> When connect to device which can only training done by
> step training, skip auto training when link training restart,
> usually happen when display resolution is changed.
> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 29 +++++++++++++++++------------
>  1 file changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 2bbe787ccb1b57906f2a31a011dd92f327019b08..47f8134df8b6f5c2172c6cfdbc91da8063993a05 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -467,6 +467,7 @@ struct it6505 {
>  	struct delayed_work hdcp_work;
>  	struct work_struct hdcp_wait_ksv_list;
>  	struct completion extcon_completion;
> +	u8 step_train_only;
>  	bool hdcp_desired;
>  	bool is_repeater;
>  	u8 hdcp_down_stream_count;
> @@ -2457,11 +2458,13 @@ static void it6505_link_step_train_process(struct it6505 *it6505)
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
> @@ -2477,18 +2480,19 @@ static void it6505_link_training_work(struct work_struct *work)
>  
>  	if (!it6505_get_sink_hpd_status(it6505))
>  		return;
> -
> -	for (retry = AUTO_TRAIN_RETRY; retry > 0; retry--) {
> -		it6505_link_training_setup(it6505);
> -		it6505_reset_hdcp(it6505);
> -		it6505_aux_reset(it6505);
> -
> -		ret = it6505_link_start_auto_train(it6505);
> -		DRM_DEV_DEBUG_DRIVER(dev, "auto train %s,",
> -				     ret ? "pass" : "failed");
> -		if (ret) {
> -			it6505_link_train_ok(it6505);
> -			return;
> +	if (!it6505->step_train_only) {

No need to. Just

		for (retry = AUTO_TRAIN_RETRY; retry > 0 && !it6505->step_train_only; retry--) {

> +		for (retry = AUTO_TRAIN_RETRY; retry > 0; retry--) {
> +			it6505_link_training_setup(it6505);
> +			it6505_reset_hdcp(it6505);
> +			it6505_aux_reset(it6505);
> +
> +			ret = it6505_link_start_auto_train(it6505);
> +			DRM_DEV_DEBUG_DRIVER(dev, "auto train %s,",
> +					     ret ? "pass" : "failed");
> +			if (ret) {
> +				it6505_link_train_ok(it6505);
> +				return;
> +			}
>  		}
>  	}
>  
> @@ -2599,6 +2603,7 @@ static void it6505_irq_hpd(struct it6505 *it6505)
>  			it6505_variable_config(it6505);
>  			it6505_parse_link_capabilities(it6505);
>  		}
> +		it6505->step_train_only = false;
>  
>  		it6505_drm_dp_link_set_power(&it6505->aux, &it6505->link,
>  					     DP_SET_POWER_D0);
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry
