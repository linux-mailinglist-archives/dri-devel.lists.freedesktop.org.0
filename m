Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB639A7D022
	for <lists+dri-devel@lfdr.de>; Sun,  6 Apr 2025 22:14:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 374B810E0BA;
	Sun,  6 Apr 2025 20:14:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bLixNEpu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C47B510E0F0
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Apr 2025 20:14:14 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 536JoI68005445
 for <dri-devel@lists.freedesktop.org>; Sun, 6 Apr 2025 20:14:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=O8hv9mePop8METDLs+nG1ezB
 BYJSkLemzhlRHzLHAPA=; b=bLixNEpu1IvONcIqZK/kVrOKgRLen8p3lTBq2jhI
 dUFySD44d0WTWUIZVnTdOJN8dp+W0Cv9Jk85np/wefr1OsSAEv4/5SKOBA2SXxdW
 h8G0o5cPbYiOCL3UXR8BttI5vUcETfyheZDt2+kn4YWuWRhp0+evPOLYsDHFWzYy
 cq9piUHaQ0TsGaI0F3XlbNq/q6lXq95KGHCYU08rKtZ6azNPyp3m8rqkGdJaHDT2
 ulEoJwz+RPwEn+W8I7WEsYx/kaCOLQe9eSkkOJBNTaofVUVNpLsF91y0a/SsMlhw
 cmFvjblyRJnwGvn7bhCnXQVOQwNO3OG+AqnvucNtWPQT3g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcyt9cd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Apr 2025 20:14:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5f7210995so664750185a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Apr 2025 13:14:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743970453; x=1744575253;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O8hv9mePop8METDLs+nG1ezBBYJSkLemzhlRHzLHAPA=;
 b=oa09gMDKfq9+s+95rmXmOoi6HXZlRTdrxXr1cOFIo4mbymKnax3CqoGLqIvF9hyd/n
 YuYAB8gAgy6eaU3KOT4+fwiKHZyK9JBYRRhJ7Fji7u2L+hJUQP7QdvjVFM1jn9NCziRG
 n85EKfLzbFYxssI7ZR+nnsZ27RNerBAdzKuiz5GPWK7gEvAk6e+eok2egXg+R8eE9slZ
 1avw9LUhk/q4DZRECF1M226JmCar4yu28SxPQ070vVmnOnMu1XGcpUKyYDuBHcvOA0hr
 wKYuLZZb8sQ0wJwUY7tFMGCplhGGpoTWaCW2zjQK2/XGRhjbK/yDvKN0mAE+i08tKMAu
 TbXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXp9QA7SzI8geGpVcQQOtD6DtNhcSfhg6XV+sNWrEhrlT73D1ib/fOykOmTs7ZdJLCBGO9HBuH5o5E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8ha8GBph7k1C5mMscMMcdgoJ0p9wT1AHvlE9I4LarKjK93rwS
 Sryn1rHjoZu23wcLu01lq90Qc2oW8iPRuoaDWR5WIXFf3UMcFo4WLPDKIH9fMRjhIJID0/sH5JR
 xPjyLTK4MK6AavVONZfPs95tCTdePZuYuCeN1uy6Fd8Af6siq/7Jp2EkbupZePjZPWYg=
X-Gm-Gg: ASbGnctOGuHQQo9SFCmykD5VjZQwtFj3EuVIVBfY5uR45JW8yRueZGlKlTTdqS30guu
 8l7hgirvTne7v6UEcxofk0jbuUvFpscMJHJsoOTDAWEd0IaLR7g41J3EVxXOqymJSO5d0AlNz1W
 HWoDW37PBWcyZhsxycB/DTfl+w9DfqpMrjns6j4lpEIzlNy9IkzmlR/qPHEkjVdVnjSXWvm//d3
 86A0YH7UGWcBAD013UbLUXTBQdqwtizK2z5aSJicNv6btPcC2mmEMebrb3yaYztK1XZWOS5cfzX
 cjNEuPa+yGWnU2/AGT7tLwKYDSn588dFPER0Qyg5pcYwlQgoNBzCx4RqeDwip9xdzzGwSZB2r5X
 bAqM=
X-Received: by 2002:a05:620a:f14:b0:7b6:cb3c:cb81 with SMTP id
 af79cd13be357-7c76c9c0c8bmr2276342985a.18.1743970452765; 
 Sun, 06 Apr 2025 13:14:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6bE+uyjd5ifLK1IJUj1GerX4vOxW/2WADmTBo303FxgyqDrXW1FVehmfIGpQRQAfnLqr7vQ==
X-Received: by 2002:a05:620a:f14:b0:7b6:cb3c:cb81 with SMTP id
 af79cd13be357-7c76c9c0c8bmr2276340185a.18.1743970452444; 
 Sun, 06 Apr 2025 13:14:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54c1e5c1f95sm1043850e87.83.2025.04.06.13.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Apr 2025 13:14:11 -0700 (PDT)
Date: Sun, 6 Apr 2025 23:14:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
Subject: Re: [PATCH v3 09/10] drm/bridge: anx7625: update bridge_ops and sink
 detect logic
Message-ID: <ctwzoes6or6nmezz24t5tekb5ovxoh3bylqtiwjjvkcrz37xeh@hclirezl6o5t>
References: <20250404115539.1151201-1-quic_amakhija@quicinc.com>
 <20250404115539.1151201-10-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404115539.1151201-10-quic_amakhija@quicinc.com>
X-Proofpoint-ORIG-GUID: uwtFVJg67IgMyJL41LHo4LCDJtydvW_6
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f2e095 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Qhp2PSjbNHdjP6JHm_UA:9
 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: uwtFVJg67IgMyJL41LHo4LCDJtydvW_6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-06_06,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504060147
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

On Fri, Apr 04, 2025 at 05:25:38PM +0530, Ayushi Makhija wrote:
> The anx7625_link_bridge() checks if a device is not a panel
> bridge and add DRM_BRIDGE_OP_HPD and DRM_BRIDGE_OP_DETECT to
> the bridge operations. However, on port 1 of the anx7625
> bridge, any device added is always treated as a panel
> bridge, preventing connector_detect function from being
> called. To resolve this, instead of just checking if it is a
> panel bridge, verify the type of panel bridge
> whether it is a DisplayPort or eDP panel. If the panel
> bridge is not of the eDP type, add DRM_BRIDGE_OP_HPD and
> DRM_BRIDGE_OP_DETECT to the bridge operations.
> 
> In the anx7625_sink_detect(), the device is checked to see
> if it is a panel bridge, and it always sends a "connected"
> status to the connector. When adding the DP port on port 1 of the
> anx7625, it incorrectly treats it as a panel bridge and sends an
> always "connected" status. Instead of checking the status on the
> panel bridge, it's better to check the hpd_status for connectors
> like DisplayPort. This way, it verifies the hpd_status variable
> before sending the status to the connector.

This commit message describes two separte changes. Please split it
accordingly.

> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 99ef3f27ae42..365d1c871028 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1814,9 +1814,6 @@ static enum drm_connector_status anx7625_sink_detect(struct anx7625_data *ctx)
>  
>  	DRM_DEV_DEBUG_DRIVER(dev, "sink detect\n");
>  
> -	if (ctx->pdata.panel_bridge)
> -		return connector_status_connected;
> -
>  	return ctx->hpd_status ? connector_status_connected :
>  				     connector_status_disconnected;
>  }
> @@ -2608,9 +2605,8 @@ static int anx7625_link_bridge(struct drm_dp_aux *aux)
>  	platform->bridge.of_node = dev->of_node;
>  	if (!anx7625_of_panel_on_aux_bus(dev))
>  		platform->bridge.ops |= DRM_BRIDGE_OP_EDID;
> -	if (!platform->pdata.panel_bridge)
> -		platform->bridge.ops |= DRM_BRIDGE_OP_HPD |
> -					DRM_BRIDGE_OP_DETECT;
> +	if (!platform->pdata.panel_bridge || !anx7625_of_panel_on_aux_bus(dev))
> +		platform->bridge.ops |= DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_DETECT;
>  	platform->bridge.type = platform->pdata.panel_bridge ?
>  				    DRM_MODE_CONNECTOR_eDP :
>  				    DRM_MODE_CONNECTOR_DisplayPort;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
