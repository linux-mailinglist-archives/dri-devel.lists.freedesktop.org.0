Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2438B34DE5
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 23:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A0E10E582;
	Mon, 25 Aug 2025 21:24:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NgPxhqlt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4BF10E580
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 21:24:31 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PGiijS017815
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 21:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=EQDx8Ekd3LgKr5C8JKyRUgZa
 ehoO7DCfDNyEHU0DkbU=; b=NgPxhqlt/xhwmOcuWi+ZGzi1m6NPMJwUGvHv25+W
 BNdc24dg0JqdLPocZVH3TZBTH9K/zr2efrP0bIEW5ykRclCrAnpp39xwrDMfSdFo
 vFfa4IzPPVsa181ExoG22tM8ccTMY3BkSkZn0Lj0fOCzbLy4dr48Qjgp/xk0DgeU
 KxwJhKBHpR5pfXp7CptefBCRsreS+RQWfLMp/a32RineUIneUipBvc4gBtFBzeGA
 7ieSURl9OODatVvd1CtAwKYRc0cJHiDrmLW3zIcFTxSfJ/vx4ZSnsCxVydVpb5Jr
 4B5uvQRpJCrwWMZNd8vtn6synnn4AxP0LI0zNV97gtJHNA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615eecf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 21:24:30 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-70d93f57c42so70333796d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:24:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756157070; x=1756761870;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EQDx8Ekd3LgKr5C8JKyRUgZaehoO7DCfDNyEHU0DkbU=;
 b=h6kkruIGJK/BXDI1VUvwe5TVvslJX19W6MPduM5oiYUJ7Fpk7Rhn646P+V1kcMTqYF
 j5U/9zPp4HUmcpNSeGEt+DQ+8BUg7SrY1hNvcl6BUPb3c5a9RhoPK0lTIxIAL5PCiy5/
 MdUHSwbk8sBCKPLxOdfCxMRnOqo9sINGOFpdWTE8IWXodz5wa4zkQkesY6FDM+WDEUl/
 xU2mV0rz4vU+9KSvdokMcycDfJ/GUe5V1lqzobAA7wsi3BADxGHWnX3eL9DzfQvK06x9
 36hFBxssQNlqAEu3oNelGGXkZTZZJ5XZwmDtDKj3CZMeWFKFRGZb8ENVX6GSHF5KGrJV
 MNHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7YnEdcD+SbdObvM7RYpTnwJpOR1/70pDwYmFllyGzDbaHTcNjkM+eWIHkuGTKmJmuT78DyYtsmF8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvG5ERRq4ttQxwOGt1F8RtCjBUuWoXOkvoTyz44e4XjJq/nL+/
 Zm1wMdWxCf6Ue7iNujz0pYxVOjw/A0gg7rITG1nQZg4lwRcbCJ6Cz3EPELg8pwOsMdu0mttB7s3
 GZ9P0MC1EcfZxToMVVvP9Egqd01zLbNsjg4gnFqxXVpu1Q6MYz/PMHlremU31yhwzkpq8rZONw7
 xPKmI=
X-Gm-Gg: ASbGncvnjYAWj2q2UrsSMB4gqwM4fvkqo6HCPiC+mKheTZtQtXgQ5Q9K/g+UskMQxG1
 BblR9VBA5Yq0lnzpti/s7O7668frAhO/2rAVw//H41hg+koyJyB6R/MrU/0rUmB0oNbFcU6wL4y
 TR6uCQn1WAtlhTHxktXwCNsry4+DybjPJqhdban+Vi84aUS0Jf0wu8znY+nhzdRZXtToivfEOVu
 orolBSMZT5Qd9XQHwgJTDwj/3ltUDSlqj0b4FYb5VflT/rJfQtCbB8uroalRauqImGspGWwGMgn
 QNbA2L/VduUI5prnafPluUA9+YE7blPspn/Nao705/WPvFgYYVZ/Ymawe2oEExAJvq6nK7YbHri
 +uwzzuNGMxyKH0sQeJ5O5GK+ulmvPuT3sdc7uaQzaSwfgRwfXzcHP
X-Received: by 2002:a05:6214:519a:b0:70d:c901:64fe with SMTP id
 6a1803df08f44-70dc9017863mr25628766d6.41.1756157069680; 
 Mon, 25 Aug 2025 14:24:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4JBxu6eZccnvdZJRTroWtFNllocYD/kVOyxn7pmff5QlDW6XmknGCCRLSE8cvLFZ9mCVnhQ==
X-Received: by 2002:a05:6214:519a:b0:70d:c901:64fe with SMTP id
 6a1803df08f44-70dc9017863mr25628346d6.41.1756157068897; 
 Mon, 25 Aug 2025 14:24:28 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3366fc06c65sm11094811fa.60.2025.08.25.14.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 14:24:28 -0700 (PDT)
Date: Tue, 26 Aug 2025 00:24:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 18/38] drm/msm/dp: Add support to enable MST in
 mainlink control
Message-ID: <ahgabnh7e2zszqjakexr4755orihk6afvqlyw3lvcffyvr5muw@hmy6kf3ociku>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-18-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-18-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfX3+6DHWRAyqk0
 0I4p2HcnAmxwRbaXqOxQiWRTXFb5Zz0AmNtnYSt05T1FPmc3bGOT/TtRJ4VwjV4u/lp7kgy8+oN
 inzUCW81Opu5jVJxBvy0kDcZ+taOhAs09HzMnsypiPfd1qGKaLji73k+LvlWwq3OJ6AItngrbxR
 XFxpn2FxDaHdUwjesoobi3Xm2SOIqk3CAQWNOp7LNmMYj1+R1ZA4G43HacWsyjA26QZ27r8f+lZ
 brHQ1GJVkwdAb/5K9MWmUEJ8KXpKBb+LrLKNQbiBZXxq9AiMcr3kPMU0r2A0kHJ2gPWG8OBikss
 wWjSY4kr5HCKEwsgJpneI5zYpMB+r511qMzc9qpreGzRxuC6qDu3DKzwA4UCN5rftjfkW7krOW3
 v+WfqCK8
X-Proofpoint-GUID: 6zASvjUYfm8MMyiOIvLnxF6MM3xXHOXI
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68acd48e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Dh0pfIAITmfDrERymUkA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 6zASvjUYfm8MMyiOIvLnxF6MM3xXHOXI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_10,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034
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

On Mon, Aug 25, 2025 at 10:16:04PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Add support to program the MST enable bit in the mainlink control
> register when an MST session is active or being disabled.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 17 +++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_reg.h  |  1 +
>  2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> index de3d0b8b52c269fd7575edf3f4096a4284ad0b8d..fda847b33f8d0d6ec4d2589586b5a3d6c9b1ccf3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> @@ -128,6 +128,7 @@
>  #define DP_MAINLINK_FLUSH_MODE_UPDATE_SDP	FIELD_PREP(DP_MAINLINK_CTRL_FLUSH_MODE_MASK, 1)
>  #define DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE	FIELD_PREP(DP_MAINLINK_CTRL_FLUSH_MODE_MASK, 3)
>  #define DP_MAINLINK_FB_BOUNDARY_SEL		(0x02000000)
> +#define DP_MAINLINK_CTRL_MST_EN			(0x04000100)

Why are there two bits?

>  
>  #define REG_DP_STATE_CTRL			(0x00000004)
>  #define DP_STATE_CTRL_LINK_TRAINING_PATTERN1	(0x00000001)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
