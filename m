Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC49BAD20E2
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 16:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 563F210E409;
	Mon,  9 Jun 2025 14:27:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PGlxAggo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6B110E3F5
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 14:27:41 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55998HYc017745
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Jun 2025 14:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=f/of6TTom4AU2Dvwq6I7gBZ0
 T1k7Wh85jIn8qO8HSos=; b=PGlxAggo6JmRUYZlnbJIreFKI7ywwLexQnAwMDm3
 UfrYRr4rudsM8In0zflz6G8VheoNGziyS+GzNcxC/9brNVKjhtpdWKeGt9VGZsis
 CxUtIKazhK/1DoWawXaYKewuojWxLuImek6oGgC8asE32EVZ5sdC4xEmM2Ltblf6
 HK2WQM3LX2LFrs+hrDH7VMk4kNHwfsuTBgWLKoK7ljUSB19XGyFAMIp3sSqymJip
 tGJrIH8W76wzZViQ9wRIe6kbMMvpGdSJrOV7ifro9R+Sijhyszy4TQsQHcDWr7ko
 eXv1D8yEBAxqJ6Ba1m9X8layu2zZf4xSqKg5Y8oxMf2i8g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccv6782-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 14:27:40 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6faca0f2677so125086286d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 07:27:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749479258; x=1750084058;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f/of6TTom4AU2Dvwq6I7gBZ0T1k7Wh85jIn8qO8HSos=;
 b=EiuiNnVQjC99zayY500pC408dw7vtMvR2pFynUHb3N+o+SpqVUQB0Gp7I1+7+fDo+l
 jfoT5kJB8sWPYehsGzvwIf00ONOdOxLM1VSBhECaxbWNQICbVCEvZqpyiB6KlVSN3vAv
 cAD2fk318+q0+qeMt/jKiQGR0X0WnzL1WYYc0/QIEXGRYV2hsKiGVSAAPBW/kib45Zf6
 7AiIg7l0icWyztvJ+H/xacKOX9w5EEeYTdk7O7VtSUa5LqSJKWQ33HQThU7FKFj6hThm
 nmrIsNhpV0y1szatqyTXJNO3Ls6kNemjFJThPH4xzC4wwlUuvlvgAZmhJ9g5HImrn/KD
 tB8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzOeqL3dJuXnDtta3/mp3JUvIxglqgEqOUPMnrF+hPDrGyoshEfsd6WeKsSUzGnnWjA+SmfYZVRcQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFwuWlnFtQg9lnhnyHWTlr/y3C0ghNbSuBDqDui0dm+qiFa/6c
 iuCpUdGyane7D46ESkYbmEr1QmhLjxkp03Xysp9ky9jQx9NkImzA88px6CbMtGc2EpTnT3zZmaN
 H3kyYuNnHUbiJa0NHLN3LU9gxJfTRSQZbcbqf0IiK++9nlYH/6Y0WuT8SnBeioWJxl34o/TQ=
X-Gm-Gg: ASbGncu/DdB5FMz7pPgQs7MXnergCIyDtyGHdhv8O+DQxwBxWDGdkde/YL9ABVp5wal
 z7r3qY8XIxhRY1EGlHP4ph6NvjbfGICNVAk17yKvgyOHgBwOj4/G/TTWFgcg1PYYXTrg2kRb/Bn
 7jzF+qUv2pKDWNfpLoEx4U2bYjV1EizSW8pkEWrRD5DbztjI9usOTT516nlHRR5U3vUvU27G87g
 /oIwZmOQ6+zoEAd4WU5vXRU+AZCW/gnl7NfBm28nB4GNY9DdNbvb2PC5xO0RwvGOH4fxg+pPFpF
 i1751tSL8Pbgj2JFu3lf2w1v9VZ+tp66S/jIYj30QijDBMbb3yunq1Gf2jOoQsx0PmFPGKFdp+E
 nU+Dz2eyH5g==
X-Received: by 2002:a05:6214:c68:b0:6fa:ca81:4121 with SMTP id
 6a1803df08f44-6fb0905b95fmr180867646d6.44.1749479258419; 
 Mon, 09 Jun 2025 07:27:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENywj9pL8N2WDsT8WlwUxJkuPyVSuk0P83Ce8cs9bs9NhhCmWwbrm8PLpnm0ddvieJHs32lA==
X-Received: by 2002:a05:6214:c68:b0:6fa:ca81:4121 with SMTP id
 6a1803df08f44-6fb0905b95fmr180867086d6.44.1749479257879; 
 Mon, 09 Jun 2025 07:27:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553677222edsm1176230e87.122.2025.06.09.07.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 07:27:37 -0700 (PDT)
Date: Mon, 9 Jun 2025 17:27:35 +0300
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
Subject: Re: [PATCH v2 34/38] drm/msm/dp: initialize dp_mst module for each
 DP MST controller
Message-ID: <oy4inbe4jg5gw77sgrkcgi7b442fqc4muiuwse5bffbftpmcbn@ajqbpxorszk6>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-34-a54d8902a23d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-34-a54d8902a23d@quicinc.com>
X-Proofpoint-ORIG-GUID: 3pUgywP33sck1pe334Gf9Fa-g43I244b
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=6846ef5c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=ziSFFFU8-FvEhn5Yk-UA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 3pUgywP33sck1pe334Gf9Fa-g43I244b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEwNiBTYWx0ZWRfXzmlblmlcGI/+
 COgQGj7/R2tYdpmILk+3tl/4WZyJPbMrqhfDxkSzD+F9bOyEUQW/3YKOrzHrGXNBMoGkmwe/MHe
 sHrehUcTsav4Ltax5IVy9l+Az7lhqbK17n8iyGxn8sBpt7Tq1fiMAY/QPXBcgDmnghySada8Qes
 IeFO1wt+Lu/v+Fni/YJDjg22GLiNwi7D7fk5g59MKYhk+cIXDTGVum3orvccLS/AIpn11I1erGB
 8Um97ctGGuh0TZi2+3+rURZZJ14R0Q0fby6GHeu/3UaVpjB94YlXxawvoMvtAst6z/CIUdJN5wq
 KFDZOg+M1/5rfCJCxaGjMA4KyVSCyH7eDrdsueMwVzWS6X35rqwTL7sAIyWiumHoovlMxYKFB/G
 yuZmNwtGG8vc9v+jRNnfaGwM21etz3BnPJRc5c0u9qfXDhDCIdEfanp0lFIuBwXWQ/aa4MH/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090106
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

On Mon, Jun 09, 2025 at 08:21:53PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> For each MST capable DP controller, initialize a dp_mst module to
> manage its DP MST operations. The DP MST module for each controller
> is the central entity to manage its topology related operations as
> well as interfacing with the rest of the DP driver.

I think there is an ordering issue. Previos patch has already registered
MST-related objects, but only this patch provides a way to init it.

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 6 ++++++
>  drivers/gpu/drm/msm/dp/dp_display.c     | 9 +++++++++
>  drivers/gpu/drm/msm/msm_drv.h           | 6 ++++++
>  3 files changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 45fedf7e74e9c6dfed4bde57eb675e3dd1762fc7..e030476dc4c69448886c29bcfe8ff3105949b129 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -680,6 +680,12 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>  		stream_cnt = msm_dp_get_mst_max_stream(priv->dp[i]);
>  
>  		if (stream_cnt > 1) {
> +			rc = msm_dp_mst_register(priv->dp[i]);
> +			if (rc) {
> +				DPU_ERROR("dp_mst_init failed for DP, rc = %d\n", rc);
> +				return rc;
> +			}
> +
>  			for (stream_id = 0; stream_id < stream_cnt; stream_id++) {
>  				info.stream_id = stream_id;
>  				encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DPMST, &info);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index ab1ad0cb6427eb4f86ee8ac6c76788b1a78892a8..526389c718edccbac9b5a91e8dabf0d84ed1a8b0 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1667,6 +1667,15 @@ int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
>  	return 0;
>  }
>  
> +int msm_dp_mst_register(struct msm_dp *dp)
> +{
> +	struct msm_dp_display_private *dp_display;
> +
> +	dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
> +
> +	return msm_dp_mst_init(dp, dp_display->max_stream, dp_display->aux);

Inline

> +}
> +
>  void msm_dp_display_atomic_prepare(struct msm_dp *dp)
>  {
>  	int rc = 0;
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index dd403107b640ee5ef333d2773b52e38e3869155f..1496700c38ad73d6edcf56fbb0ebf66505c608bf 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -374,6 +374,7 @@ bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
>  
>  int msm_dp_get_mst_max_stream(struct msm_dp *dp_display);
>  int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder);
> +int msm_dp_mst_register(struct msm_dp *dp_display);
>  
>  #else
>  static inline int __init msm_dp_register(void)
> @@ -401,6 +402,11 @@ static inline int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_e
>  	return -EINVAL;
>  }
>  
> +static inline int msm_dp_mst_register(struct msm_dp *dp_display)
> +{
> +	return -EINVAL;
> +}
> +
>  static inline void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display)
>  {
>  }
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
