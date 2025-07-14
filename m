Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9241CB03D8E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 13:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 984D310E14A;
	Mon, 14 Jul 2025 11:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hw45MD5a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4F510E14A
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 11:43:03 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56E9rJrK027322
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 11:43:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=winGaSM/18oanJNdTZV+PwIP
 QLMxfMBvR22zaRLbI78=; b=hw45MD5adSzrjU01I8Y6dZs+DYpW4+Inzta7Hv86
 THBnn/KYjBHJ/v4JApAIIlQjbXPrglJ902rt18N45A9F+L5TJmAl9LSM8is9bV3N
 jwlKzLHX+1Di3KhmLr1IP0OuazbNdfkysrhZBgJWO+mSNLHtQQNovCApfRq191yJ
 RlPHrBoUCgUoQ4J9ciOyQxjHn0s8WcKVEBIKZWAAFNmU60n7A0SelM3THJHMd67U
 +dcmvNqpYg1WZ7Pjxb4ftWItpWO8rZGx/kDypONQ6tGx/vuWACiVSsmRAuTqEGVx
 tl1bNyRrqSa74/7YgRo7bXhftpyhlFNiU9G16x2eSAHU+g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufvbcgds-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 11:43:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7d4576e83cdso1156229885a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 04:43:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752493381; x=1753098181;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=winGaSM/18oanJNdTZV+PwIPQLMxfMBvR22zaRLbI78=;
 b=fmUOT0ut7dWt1CNMc9d/5/If7r0iywEtB15zF7u/ZAkniaK5nQOs4Q1VYr8dFtL1NQ
 sy8BTGblg3ySJLOe4aPTwPgh4S+tDviPXdHd4nMnhVPgnPUFkIu207hoFHF9QJr3XRw0
 uHGfDKoUXdfa41TXG47c8Zn0EwnM5PYSHvA+14bXzJMGy1Qd/iiPZB7Vxvq7Y2p/5E+j
 2kJJHDIoOyCNXqt8MDAZd+5BzFOeZbaxqolRKERi4fMTFUZOjmTckoW8VqyIO0tpvBBq
 F3rXumTZaxIRGxxZRX4MmQ7toJB5MBmuGymr22fhBU8n0UszjYYuipg85a3FF4+HWNZP
 5JGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkGGitPHeM+jcfvZYP3VztA/3Od2sGbDS3Pj9OM8PXqAjqdpFYT9wpZrejkJ8K7jZqxEMwiQmDhs4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2E39NKxPqUk2N9kJHfcPGsoONSlmneOh8B7aN0ukxCRPL/ydG
 JCeTHENjruWEsy42gomhZ73nSWn4DwMwZZGbEvOYAsDkwYKUIu+z0uEnCw24NC8AnVBjSnKGIhF
 J84GHA8wljW6X4ZXFD/q7BZuAmOmZqR+28MeZ9chXnkwdjS6rkYRthKgbMxGGKYOoLG86MIA=
X-Gm-Gg: ASbGncsY8ZGlyIzSiCijekFrzcygM3pyPLOEBT6yuZVHpPSWHZ8xOED6hWZPnyHlF9a
 5IZoERzgJYEU6HTlzKxVnKUuUHNbCi9sz9o3O0k9AqP/Td59HF19u4tC+dLsFJgDoeSfXrHRzF0
 k4bVGdit96+SI49m3598i0e4JJhMC0Bzh9P8t8BrfF1h3pyX8HJqo7tNiVmOFoZsia1rOdorBEk
 KRsZlkDdWU3bmL9mrbfUcUiZTJU22ZuX1PfGXu3diD8Xpo0zcV7tpp0VSVDgBW1E/1SW8/RP55x
 xHQHyeW55zIAtz8MzEZEKqd1lXc2/6wj6IW+ve0lb3qWyiqmAcUVnJx874RH2x8GMKhuUVhL5kJ
 4hXmfcqIXr4AO7wJmqkOwSN2F7EJPCx4gXe14aleQg/atFwIBrBEX
X-Received: by 2002:a05:620a:4113:b0:7d4:3de6:b4fa with SMTP id
 af79cd13be357-7ddea7159demr1547497785a.20.1752493380994; 
 Mon, 14 Jul 2025 04:43:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1ANcTVbh2OL/XbOiKu39H2wmW7FN3jGWrVAYORjESiyqWa4YcIdnDQxG+JWuz1xF0P2+GMg==
X-Received: by 2002:a05:620a:4113:b0:7d4:3de6:b4fa with SMTP id
 af79cd13be357-7ddea7159demr1547493685a.20.1752493380450; 
 Mon, 14 Jul 2025 04:43:00 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32fab8bd4a8sm15926061fa.65.2025.07.14.04.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 04:42:59 -0700 (PDT)
Date: Mon, 14 Jul 2025 14:42:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH 01/19] drm/msm/dp: Track when DP is physically plugged in
Message-ID: <ytskndhnox6p2ozwqxnpfyj7d4finr2go7qih4hpjqaf6onigc@zhiunxyw6xaa>
References: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
 <20250711-hpd-refactor-v1-1-33cbac823f34@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711-hpd-refactor-v1-1-33cbac823f34@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA2OCBTYWx0ZWRfXyPekAQJwqjAT
 Z3MSlwwKuY5FbkB/pZ0t6VyxqwoVVii5yM4I9MkVSXO79Mpy/8RnvnJdPdRkW1B+RKM2VNr96Ls
 paxSvRgKw8/SbcSaGqZPTmJXlEAB9QlGNbqCv+v9WRlh6SuRdOpYxn1xp08CAa2RWYX1+yK6f5G
 pPOr83gSgyOjZfYiI9sY+JhqiN1AMTnRFTGb8B1kRD7b+K1cX/oepUi1Re5tMSSPdDzkOFsJxe6
 egpkJ6rF17DCNW/0utWbl3eRDGikciI8/msgVwd0QGwKjL7rGfQb3O3a8VhMTM/CqpNVvJCvuaB
 rXbexIteeaMM9ptz7jDlyN4Z9Z3uFVs+O+K0cP3oNphC6lC2J5biRXpmH8spF1QTw6FIz2/Cw5g
 6nocaNntrcQDPcEoU+Rn/zscu7/oqbQyK13LhD1kkbxKKcM2VfdmwlGg+G3gU+fRXjPI0XQy
X-Proofpoint-GUID: irLYh80zHgIkkjsHzcYxzCVKNfmrZOIJ
X-Authority-Analysis: v=2.4 cv=RPSzH5i+ c=1 sm=1 tr=0 ts=6874ed46 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=cYTOvpCF5i-df0i3KWcA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: irLYh80zHgIkkjsHzcYxzCVKNfmrZOIJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140068
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

On Fri, Jul 11, 2025 at 05:58:06PM -0700, Jessica Zhang wrote:
> Add a boolean to track whether the DP cable is physically plugged in.

I think there is more than that. Other drivers check that there is
actually something connected (so checking the sink count, etc.). See
Mediatek or IT6505 drivers, they have simple examples.

> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 11 ++++++++++-
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index d87d47cc7ec3..6945df782f7b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -531,6 +531,7 @@ static int msm_dp_display_handle_port_status_changed(struct msm_dp_display_priva
>  			rc = msm_dp_display_process_hpd_high(dp);
>  			if (rc)
>  				dp->hpd_state = ST_DISCONNECTED;
> +			dp->msm_dp_display.connected = true;
>  		}
>  	}
>  
> @@ -604,6 +605,8 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
>  		return 0;
>  	}
>  
> +	dp->msm_dp_display.connected = true;
> +
>  	if (state == ST_DISCONNECT_PENDING) {
>  		/* wait until ST_DISCONNECTED */
>  		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 1); /* delay = 1 */
> @@ -621,6 +624,7 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
>  	ret = msm_dp_display_usbpd_configure_cb(&pdev->dev);
>  	if (ret) {	/* link train failed */
>  		dp->hpd_state = ST_DISCONNECTED;
> +		dp->msm_dp_display.connected = false;
>  		pm_runtime_put_sync(&pdev->dev);
>  	} else {
>  		dp->hpd_state = ST_MAINLINK_READY;
> @@ -662,6 +666,8 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
>  	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
>  			dp->msm_dp_display.connector_type, state);
>  
> +	dp->msm_dp_display.connected = false;
> +
>  	/* unplugged, no more irq_hpd handle */
>  	msm_dp_del_event(dp, EV_IRQ_HPD_INT);
>  
> @@ -680,6 +686,7 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
>  		msm_dp_ctrl_off_link(dp->ctrl);
>  		msm_dp_display_host_phy_exit(dp);
>  		dp->hpd_state = ST_DISCONNECTED;
> +		dp->msm_dp_display.connected = false;
>  		msm_dp_display_notify_disconnect(&dp->msm_dp_display.pdev->dev);
>  		pm_runtime_put_sync(&pdev->dev);
>  		mutex_unlock(&dp->event_mutex);
> @@ -1596,8 +1603,10 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>  		return;
>  	}
>  
> -	if (dp->is_edp)
> +	if (dp->is_edp) {
>  		msm_dp_hpd_plug_handle(msm_dp_display, 0);
> +		dp->connected = true;
> +	}

So, are we returning 'disconnected' for eDP panels up to the
atomic_enable() point? Then nobody will ever enable it.

>  
>  	mutex_lock(&msm_dp_display->event_mutex);
>  	if (pm_runtime_resume_and_get(&dp->pdev->dev)) {
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index cc6e2cab36e9..68bd8be19463 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -16,6 +16,7 @@ struct msm_dp {
>  	struct platform_device *pdev;
>  	struct drm_connector *connector;
>  	struct drm_bridge *next_bridge;
> +	bool connected;
>  	bool link_ready;
>  	bool audio_enabled;
>  	bool power_on;
> 
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry
