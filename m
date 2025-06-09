Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD4DAD2324
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 17:59:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC7F10E3CD;
	Mon,  9 Jun 2025 15:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mLhvuV2z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B259A10E3CD
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 15:58:58 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599nKKT005324
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Jun 2025 15:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=m/oHPEvdt3BMym8AUpjKM5ag
 08QdTTyK7Hp5/0bClSc=; b=mLhvuV2zbVR4/brQWwKuFElCWc2siOd6LjrZ54O8
 5c8qtXaINXFQjudluqcQOH/fKNAlGP5dMYJ6T2VaQWXtDBPz4eJdH2PeywhNfBdU
 H5Pk8GIv3o1f2yJpJItOW/v2u2gdVNWNjVDkUPDS2YEnsa0JHXB7THnXvkWqKL+L
 Q0pdwBfc3a5zlKKRcfUNdyzsINZhFBdnx9NL5dIRrM0ASaaTZ24Ogs6GXcFTCDA5
 VlOCTqL0GYw02L/RS8+k5fM5ua5qkGt2P4bUAVTVtASc5y3q482bu8wqy/jByh0F
 nbYKLEFjGNFFNiKT0Y/AD6F2qvrWXv4f4I6WWJmBQG0mAA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekpp9h8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 15:58:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7d09ed509aaso811404085a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 08:58:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749484735; x=1750089535;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m/oHPEvdt3BMym8AUpjKM5ag08QdTTyK7Hp5/0bClSc=;
 b=C+ihiZyi/Nsv4N4F2vtaQhWngXFIVI7x4UOOXyOKfzQ+S335MIK7KDtOGn5hjWXlua
 Qw12HRH5kfD4GtxiX5T4DEqe0bhjbKfgNnQNPk4xFVfaww6yCsHhfju/RVhbFXUHBS5P
 9uYAW/+iJxyZWn/vhpFkyc3LJ8Xj6kwydHg28aMEr+bHhOb5XsnqLAqU3hiUlYK2fD1G
 59Olc88rGoWJAKi9Yizx7Up/sGOAq06sRrpb3Ezjkig2UU7kBUMAOW76n5pNy9U30EJv
 NV1HRN/QvC0oK2CVV+9H/hiy5SFi8zVvJQA1O05B1xKVOdIzLhOh6pJLHxqDD4BIBFfQ
 rLzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/X+7WkjHNF1TUdHOxxLYIM+ULHiowI177G+N7WZk6LyK57rysjJJyPP2CrLX+/4ae4eBh4MoTiow=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcQ5v1tXGiUDCtOX6LK7duEm7t+wTDWAzCdOsxKb1tN/fWZjKb
 XEbn6plF5bDHzF+s/fRjBnJFEsTwldmZzxHIswacd/Yhx0Tvv7vnCHmn3svLOx7zGm/Bm3yk5BH
 Ps/9NMMfieO9PgHgnAV2DNz7rEShkbr/5WBtTmMm3I/NVONSYSSi2Dus+l7IPfO8QzcWFwQs=
X-Gm-Gg: ASbGncvqIsn5Owmu+eBZJMpnygpHI5MlzoENe9YqWXC8eBI3XU3r1AvKfSzJIfIjunt
 MPkVSlft5ps8eumWkcEeSaf5rUwSfhSgSNJ5Z8eJCqv9Lx41dMbHCXgo/j1Uvfgwv8ahKXDm6bO
 SgFWaT1VeQdX+8z6MvLz63qqrgOF9u/vG97Bd8gknmykNN/OB0eNo1VwyUf42POeM6t3m5Qqw0G
 CJW0jQI+eQyGlFDI/KhsJLhatS2qVKE/dqfrgaQW7LyBuaHGaigQChUNH3Ws37U2+ah3FTF8Yz+
 ZrY4BGWpO0S4QZoUm9p2M/Ebk/k+ziuisW9CFy4DauzzN0k2bABc4PBHJtkpCnh8K2tPXHaQ4ok
 P5ntEQbEJeg==
X-Received: by 2002:a05:620a:4385:b0:7c0:c469:d651 with SMTP id
 af79cd13be357-7d2298fe1d0mr1994330185a.57.1749484735418; 
 Mon, 09 Jun 2025 08:58:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbNI21KBX497/aUWP6ZoFK3aYx+NQWMyhtvdoUvR9MJJt1pLIO3tvv8ZkDsXU7I0e7qf911g==
X-Received: by 2002:a05:620a:4385:b0:7c0:c469:d651 with SMTP id
 af79cd13be357-7d2298fe1d0mr1994326285a.57.1749484734962; 
 Mon, 09 Jun 2025 08:58:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55367733280sm1218659e87.240.2025.06.09.08.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 08:58:54 -0700 (PDT)
Date: Mon, 9 Jun 2025 18:58:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 26/38] drm/msm/dp: skip reading the EDID for MST cases
Message-ID: <lusd35wv2pj5sy6mdiw7axqxnei2wqo57pf6ju5ys2ibfrkidu@63lkbckuu2n6>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-26-a54d8902a23d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-26-a54d8902a23d@quicinc.com>
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=684704c2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=a3mUzBo2FLGOTCIFHJAA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDExOSBTYWx0ZWRfX37fVhvGiVea9
 vWP4J/CL8AFm6/PUFQ8p3deBi+aei5V1kjs8/ntzJdBKYu/MfsUPyt/3AV1siU3s8iwd9U07iuH
 XNmRGr/te1N4EVCpj29W1HT3KRrqh9xKnz+EKDmfRB9KwDjqS6HGN+wKUFwXjXXNnPTGK8jU1oS
 XB1R0kk9A6ksSUfhtt9Stp3m2OKmzZ8ItQVkL9EdplUfdvIuLrsgcrOBEpPif53h9KKLlubjdtC
 yjpj3BxAFEzmH8Gy0evYbFuaDF9yBW96jrHt9BxuiPs95oJH0ZYiqEV/2A1UmXmFKZP6zBRlI3B
 geAtQOQGOAUm0fpUOYQGB8tknzVwLM9dg17ZEGuVp9O91pYoVPku6NHYO3vtZjgxcTxc+9AXl4L
 Nr5VC+Q/fxhc2DnyE0i8heXr1eKLEhGM2NkxUBMPjr2huwVA4XlckwCVvPn4arOp7GcwlL6U
X-Proofpoint-GUID: Gh69o4FTMLifTTPLU2cI39bkWeA0Mrde
X-Proofpoint-ORIG-GUID: Gh69o4FTMLifTTPLU2cI39bkWeA0Mrde
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_06,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090119
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

On Mon, Jun 09, 2025 at 08:21:45PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> For MST cases, EDID is handled through AUX sideband messaging.
> Skip the EDID read during hotplug handle for MST cases.

Why? It makes sense to read it during the HPD processing, ping HDMI
codec, update CEC info, etc.

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 88cae0ca66015377e59bee757462edeae5ae91bf..b1b025d1d356046f8f9e3d243fc774185df24318 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -438,9 +438,11 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  	if (rc)
>  		goto end;
>  
> -	rc = msm_dp_panel_read_edid(dp->panel, connector);
> -	if (rc)
> -		goto end;
> +	if (!dp->mst_supported || !drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd)) {
> +		rc = msm_dp_panel_read_edid(dp->panel, connector);
> +		if (rc)
> +			goto end;
> +	}
>  
>  	msm_dp_link_process_request(dp->link);
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
