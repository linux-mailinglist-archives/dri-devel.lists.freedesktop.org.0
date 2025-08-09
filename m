Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CF2B1F1B6
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 02:44:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9984910E0CA;
	Sat,  9 Aug 2025 00:44:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sp0P3qmt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D790610E0CA
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 00:44:40 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578HkT4n006539
 for <dri-devel@lists.freedesktop.org>; Sat, 9 Aug 2025 00:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BimyYxqwpniYNzfnCwL2spGT2aViDo1PZ8XTpYNqG48=; b=Sp0P3qmtKmXQpe/f
 QURhN4ZELDF+WJ/NVpssSy2nmarjSvBTWdPm0ekw85HtSc1PH2RY/KgN27K2S08C
 1ho1KwKgvqMXatZq2kd6yYiag20RzLZ+VNDIPoasyceY4Zj5g7WV3g4kl41/1JkR
 0tzZvb77iHcxsMMG9kQb6aOdurg2NmUpGKTOFwblePP3Gpw/5+65Nxso2uteK8f8
 i/9FOypktjXygWRseP+c9VtvSooiDXc8qUw4ep8miwb7pVw1a7hePRA+6QzPkL5v
 pE85Z1JULGR3l4T4s2PYmW1m/Mnw/25XrCRd/bGiKdGQg7BzK+559HwxZBPMJalZ
 vHOtGA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ddkkt66v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 00:44:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b07bf0783bso69580611cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Aug 2025 17:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754700279; x=1755305079;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BimyYxqwpniYNzfnCwL2spGT2aViDo1PZ8XTpYNqG48=;
 b=aa72+6ew37Umd5RAzUppU5pnRE09C2A7bNaIBBrECAr0/iRM02w+R7cjLneh1hmB/e
 DGrcl8kwlfBo9OT2fNHtq1hGzlNXczQN7rUawpoBgzUx+Wb01Yuj44ahCYKeRBB+GhrP
 51k7FWS5OWw0DUiTPXbRJZwKHasn7KFxdk2loB9Y+gbhKM5l8tLgEjGGHV6iEehx6Ynr
 ePVgYVRqkxv5AdTNijWmrSVNmagtEiwVd/Jvdvx1uaZ5OulsI7kSqg9MNPjvYSlZtVz3
 aGIYT4nb/gQezjMoSsm8Cclt5phxQ1v9fVJ0fttfm2rnW8p8Bi9+F83WXA1sXctpA9ZM
 y1+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6cP021qtWDgOGFtxeEencmudBRsetAdnz0hMnsrHoBFH9Bba1mgCC6QLF4WpkOp4TmJb7weFwrJc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4DshRsQb/Lt7EVxtao2El/hVT6fHgLcighgqw88aYL24TJWkk
 TyAIJYo0zMyW+rsddaHvH064wpX13MnUcSUaBXbdwpD5g5jvj5Z+GIE/nYBLMUfpzNKr5sgimwD
 ubb7jcb+Dfvdmbj+r0wvYF4BYjeWR7JSC4/WuZUf+mMGhEUUkXBU+4nddHAO8DXY6qSmHT68=
X-Gm-Gg: ASbGnct9Oqi4zdtpflgmBWzkN53kGtBFKoCt1/ypUf2wTaWt9NJAnID5l1lkDvXN0yw
 HfvrBqEufrvzwnxoFkfs3hdj5AaHYIneNuJeV4noenRbVunEudCgYZ8ne3wFj79Zn5ataIySbUT
 eHFLGoSHsF3OIxZ8FC3i5xH1KMNeuna9H/6gE/wubq0i6sF0txeESQaLKv/fgabCY6WznLA5HfS
 L+2uGEEIBucbu/DVzETOxfnmOXqr6WQ8g27qQ0+xEGkU9+uUi+jQ6s0V6U50w7Sn13JYbR9ykNR
 4qX56hDANMnFBknc1gBIo9Sk2R0IJtLjXVZMGEW9ivQAp6gReQG6ukPMPu5b4jYyievvJkgevn1
 /3Xajts2PFnPUp8GMgy1r+8yFxD44bNBsGmzBGtThx2o=
X-Received: by 2002:ac8:598e:0:b0:4b0:7b3a:5301 with SMTP id
 d75a77b69052e-4b0aed6356amr68264531cf.46.1754700279088; 
 Fri, 08 Aug 2025 17:44:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGztjJ9/tKVCY5VSQ/JjsHMYVrDuTUfZGB4dEQs28y5gyOkr+EEh8mAop45dGh/F3eQP/56BQ==
X-Received: by 2002:ac8:598e:0:b0:4b0:7b3a:5301 with SMTP id
 d75a77b69052e-4b0aed6356amr68264071cf.46.1754700278515; 
 Fri, 08 Aug 2025 17:44:38 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9?
 (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c99078sm3171328e87.102.2025.08.08.17.44.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Aug 2025 17:44:37 -0700 (PDT)
Message-ID: <365288c5-f1ba-4875-bf6b-59a34ed52ac7@oss.qualcomm.com>
Date: Sat, 9 Aug 2025 03:44:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/12] drm/msm/dp: Read DPCD and sink count in bridge
 detect()
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Dmitry Baryshkov
 <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>
References: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
 <20250808-hpd-refactor-v2-3-7f4e1e741aa3@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250808-hpd-refactor-v2-3-7f4e1e741aa3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA4MDA2NiBTYWx0ZWRfXzbTOvDHTJ0X/
 Dz1eaNk6NtsovGmS79cUr91YImuT0itEYJEatZlkCxVsN6Gy9Hj0HZ1cyw+YS+QJ+kTw30Hg4E7
 kO1GPmSRLqTAgfc2HXNyZoLF1ABWHNl48pd54ARIJI53WWsKzN33VN5kIcdqJFdCgerEsiFzHXa
 H60UdZM4rKxAgykFTVAIcQaOXXlpB9OOLX3PfYjvE5MjP4aTUXRpZkZcHIwbzYlMw9E/qrx+pha
 CZbpK045YlspSeLePa3ZPSnNSx2byih1fRIMlbBi58mcb3Fc7ow5ZO3UC4/8uO11zsZOSd+Gqai
 icBsqgqfu0ALwRNBdNRNev1cysfy6E4/Sco2O09w4N7HDhVre24Td7zbs/XyjDCGFIxLUVsq6OC
 zuWfc++6
X-Proofpoint-GUID: CMsbCsnpA9egQ-jfQaw06edJm7t1q1d9
X-Proofpoint-ORIG-GUID: CMsbCsnpA9egQ-jfQaw06edJm7t1q1d9
X-Authority-Analysis: v=2.4 cv=Xpv6OUF9 c=1 sm=1 tr=0 ts=689699f8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=iK85lhrOwLHDTm4cRBAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_08,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508080066
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

On 09/08/2025 03:35, Jessica Zhang wrote:
> Instead of relying on the link_ready flag to specify if DP is connected,
> read the DPCD bits and get the sink count to accurately detect if DP is
> connected.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 54 +++++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/dp/dp_drm.c     | 18 -------------
>   drivers/gpu/drm/msm/dp/dp_drm.h     |  1 +
>   3 files changed, 55 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index bfcb39ff89e0..e2556de99894 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1142,6 +1142,60 @@ static int msm_dp_hpd_event_thread_start(struct msm_dp_display_private *msm_dp_p
>   	return 0;
>   }
>   
> +/**
> + * msm_dp_bridge_detect - callback to determine if connector is connected
> + * @bridge: Pointer to drm bridge structure
> + * Returns: Bridge's 'is connected' status
> + */
> +enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge)
> +{
> +	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
> +	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
> +	struct msm_dp_display_private *priv;
> +	int ret = 0, sink_count = 0;
> +	int status = connector_status_disconnected;
> +	u8 dpcd[DP_RECEIVER_CAP_SIZE];
> +
> +	dp = to_dp_bridge(bridge)->msm_dp_display;
> +
> +	priv = container_of(dp, struct msm_dp_display_private, msm_dp_display);
> +
> +	if (!dp->link_ready)
> +		return status;
> +
> +	msm_dp_aux_enable_xfers(priv->aux, true);
> +
> +	ret = pm_runtime_resume_and_get(&dp->pdev->dev);
> +	if (ret) {
> +		DRM_ERROR("failed to pm_runtime_resume\n");
> +		msm_dp_aux_enable_xfers(priv->aux, false);
> +		return status;
> +	}
> +
> +	ret = msm_dp_aux_is_link_connected(priv->aux);
> +	if (dp->internal_hpd && !ret)
> +		goto end;
> +
> +	ret = drm_dp_read_dpcd_caps(priv->aux, dpcd);
> +	if (ret)
> +		goto end;
> +
> +	sink_count = drm_dp_read_sink_count(priv->aux);

Should be guarded by drm_dp_read_sink_count_cap()

> +
> +	drm_dbg_dp(dp->drm_dev, "is_branch = %s, sink_count = %d\n",
> +		   str_true_false(drm_dp_is_branch(dpcd)),
> +		   sink_count);
> +
> +	if (drm_dp_is_branch(dpcd) && sink_count == 0)
> +		status = connector_status_disconnected;
> +	else
> +		status = connector_status_connected;
> +
> +end:
> +	pm_runtime_put_sync(&dp->pdev->dev);
> +	return status;
> +}
> +
>   static irqreturn_t msm_dp_display_irq_handler(int irq, void *dev_id)
>   {
>   	struct msm_dp_display_private *dp = dev_id;
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index f222d7ccaa88..e4622c85fb66 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -15,24 +15,6 @@
>   #include "dp_audio.h"
>   #include "dp_drm.h"
>   
> -/**
> - * msm_dp_bridge_detect - callback to determine if connector is connected
> - * @bridge: Pointer to drm bridge structure
> - * Returns: Bridge's 'is connected' status
> - */
> -static enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge)
> -{
> -	struct msm_dp *dp;
> -
> -	dp = to_dp_bridge(bridge)->msm_dp_display;
> -
> -	drm_dbg_dp(dp->drm_dev, "link_ready = %s\n",
> -		str_true_false(dp->link_ready));
> -
> -	return (dp->link_ready) ? connector_status_connected :
> -					connector_status_disconnected;
> -}
> -
>   static int msm_dp_bridge_atomic_check(struct drm_bridge *bridge,
>   			    struct drm_bridge_state *bridge_state,
>   			    struct drm_crtc_state *crtc_state,
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
> index d8c9b905f8bf..0f0d4bacb194 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.h
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.h
> @@ -25,6 +25,7 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
>   		   struct drm_encoder *encoder,
>   		   bool yuv_supported);
>   
> +enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge);
>   void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>   				 struct drm_atomic_state *state);
>   void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
> 


-- 
With best wishes
Dmitry
