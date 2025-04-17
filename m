Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAD5A91994
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 12:44:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ABE610EA89;
	Thu, 17 Apr 2025 10:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="O6Mwf05P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B28E10EA95
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 10:44:13 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H5l5Gp027185
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 10:44:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ppWs9/kYd+Q7yQxJO3DvRjoy
 waOVkrLIFLA17j6xOGA=; b=O6Mwf05P4kGfqD5bTvxKVJ9Df3yOj2jKW9796z87
 3DAhnrNJM+2l6xeAAS+jxraUunychdF+WIlUHtfpu8BNy+roR6Ca1rbImIOH8bZM
 2cfq2l+9JQnKvEStXnJuUy0Vm1CQGHp+ArI7+iK33EpW2y/YqnGxHcJlCEsY/6fD
 LECvHVaa+xnma99jzj1liXPReQpqknMfpyq7zOt6CWGvu3IXcAMzO15Un2JVxb6+
 6rGffgz87Xx1GTXHkhqWcakd43A9SDZmsY0UIJI0zLxOclQ9/nNHSFdg9+fxVW3p
 E8g5XhMFTlIfJoqctsmUwTrk1am0cQ2FiQqlIn97Md2HDg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvjetcd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 10:44:12 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6e8f99a9524so18369506d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 03:44:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744886651; x=1745491451;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ppWs9/kYd+Q7yQxJO3DvRjoywaOVkrLIFLA17j6xOGA=;
 b=cCYUEtnTzB93yTk5kWDkiPPRRY0t7ABoCGsYbR7xELXtpI6vbROs3lgFUNKZFmM49x
 1L6P//DKsFctDcmPGayEWafbtOXqiL7ZXKlKV0cXTmtt2kNH8FhaFAsyg9KwvL+7wh56
 h6p2+RYq+6H5ooeJvgh/pfHkRvDDG9SPLaOVmujdDfGaO161F5Jq5ukMCduKUyMrRRZ+
 uyHaYP4qwxaSp8N5sPqguONVMxTWB9HzUQyUA7YKtAAp/D+4FWx/siF9ZaaZpzoFKyDl
 6mSkTBd22a+OaFODFP6Z8sr5pRlxrpMiekfD/tE2DlfnWKMQFXOgAWsEoi+Mpvn5kOK7
 U4Ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCUytlAEisGMKuVCBwzW/PyOzhYkJ74I/7998Pkzyp4LF3tscw+zKWYJtHAr4J7ryKrFx3sDUVCErFg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4v6GgxncUG/P/H9Z8hG6l+sn7METQAUH+pXghKksy4h8i+pDq
 cd0RYlvIBh7jb+f8iO8PtzbpQhMeNEtHAnxXXJJy9rOQyq8EWwg2J5I3bx1d08xHHl9gK/cxlZh
 2OySQVTfQ3qdyo42rqE96XfdFt5MjkDUYxcrH5NQNJpv/rj/eFwkCTLTeArjN4jloj8c=
X-Gm-Gg: ASbGncu4sJPkru8IlILC4ka2T3rjhE9idynEiSQZQ98ObNwUPpN4dwN66OPxNEXzUYz
 IfsS/YuUtnZAysDboqt1Vx6XhclF5cRmPJWxoy++6HZv6l+Yxo1IqxZMi1h3BmWMDau3clMIGLc
 TXn2wSzPsvAkFWGlhXiND/DBpqVsNtqXzxZu9iBMeX4I+4wjX8rPJ8pCJ34RD/98vVrd0PKl28q
 nKJ93FSXP01gSeE+MQ/+nkcaigmFe/9HlylKL/f0T6mUUn8qgkRkce7oVdPmrtLH+yfX1nc03L5
 3zrw4vWHBS8bKmsNX22rr9nG71Nes5G8ussUJpDnhZpLK6l2KieuC42cpitLccIdIGLL2f5qWkU
 =
X-Received: by 2002:ad4:5766:0:b0:6e6:6c18:3ab7 with SMTP id
 6a1803df08f44-6f2b2f5fb3bmr87154596d6.27.1744886651475; 
 Thu, 17 Apr 2025 03:44:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqQ/KLp/IVSmaGp6NzSaGXvhrK11Hurnr+RjFchMqCJQpnKTKhboZA08HmNSeTGf/pdOABqQ==
X-Received: by 2002:ad4:5766:0:b0:6e6:6c18:3ab7 with SMTP id
 6a1803df08f44-6f2b2f5fb3bmr87154306d6.27.1744886651159; 
 Thu, 17 Apr 2025 03:44:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d3d510914sm1896321e87.196.2025.04.17.03.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 03:44:10 -0700 (PDT)
Date: Thu, 17 Apr 2025 13:44:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <amakhija@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, andersson@kernel.org,
 robh@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 konradybcio@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
Subject: Re: [PATCH v4 10/11] drm/bridge: anx7625: fix anx7625_sink_detect()
 to return correct hpd status
Message-ID: <g5mrn6o2arkbt356xtisszqtiokxm4oq4gkwa23y3f3aaahbfr@umcg5ikf5qjb>
References: <20250417053909.1051416-1-amakhija@qti.qualcomm.com>
 <20250417053909.1051416-11-amakhija@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417053909.1051416-11-amakhija@qti.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=6800db7c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=JL1rjniFVyafwILi9_cA:9
 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Xfw53tI07s2-nPP9C4QfYNf03XR-PVKv
X-Proofpoint-ORIG-GUID: Xfw53tI07s2-nPP9C4QfYNf03XR-PVKv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_03,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170080
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

On Thu, Apr 17, 2025 at 11:09:08AM +0530, Ayushi Makhija wrote:
> From: Ayushi Makhija <quic_amakhija@quicinc.com>
> 
> In the anx7625_sink_detect(), the device is checked to see
> if it is a panel bridge, and it always sends a "connected"
> status to the connector. When adding the DP port on port 1 of the
> anx7625, it incorrectly treats it as a panel bridge and sends an
> always "connected" status. Instead of checking the status on the
> panel bridge, it's better to check the hpd_status for connectors
> that supports hot-plugging. This way, it verifies the hpd_status
> variable before sending the status to the connector.

Does this work if the Analogix bridge is connected to an eDP panel? In
such a case it should report 'connected' even before powering up the
panel (which might mean HPD pin being low).

> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index a32ebe1fa0cd..365d1c871028 100644
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
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
