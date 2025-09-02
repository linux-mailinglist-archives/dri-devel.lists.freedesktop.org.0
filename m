Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34763B3FAD5
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:41:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71BDD10E642;
	Tue,  2 Sep 2025 09:41:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xb6ZPcu/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC58310E1C6
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:41:21 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822S6MZ010341
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 09:41:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=X8F1Aylw8vvRYnvl4Vx+2yEC
 SAL/1P4EKbFDjgjCCS4=; b=Xb6ZPcu/3DtxMHqcWy4rG8k1k3LMUuMBDhpv893t
 Vry64vS3KcRkI5c5P+5EmC9T17IxqW+Qnl8BZz1uO1ZBI3aHVRLlqDZSD/eGAJ3h
 3kaIchCS0up2/Oeb1Xaozv+ve5opMxxeVBonvlKQb8JygRwN1tanbo9DvNPc6lZM
 9gM3T5X0qcotf74lDfUG7/g7eaTnoew6gckPrkAdmwVXWCMYUo9rzXM0D7pAh22Y
 l8r5dylc2QI2IghY4vzmynI8PUA40U5LCy9IbSgEYCtJh4EkmqPXaXK62vddlQPn
 UrNw1H3qPqUGh+OxJVRAtFZ6IEzwuDXYtGE8gezUUw/qAQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjfasc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 09:41:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b29cdc7417so100652011cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 02:41:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756806080; x=1757410880;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X8F1Aylw8vvRYnvl4Vx+2yECSAL/1P4EKbFDjgjCCS4=;
 b=pXiMyZtBqtKkp2eJnZTVLhgYJwdrq+eU0wOA2lFn/Tc/ZQeKdBbf9WEvOc5E0dSQYW
 Bod/LSJPvEg+oTOt0Ccz/BUxRxlXEGChuHCLLve+Qm5tNmgsIakrsTAtw2KtjLBYheX0
 OUs6QXKzA4K/d/0KQW4FebiygWdBI4KfOJBqbhrEzj1vpIgEsWIph8NIu6UHkiUHTlqL
 k5jU87Y6idvqhtxpA9ott9rIhKRmM6N9yikI2JrQyODcCCA6CM6jw5h/Ex4PTGNuuTrP
 mSA2jOaAYnZHHsGrxtXP9yrZBGZSeBPQWEz9H4nECxJlpEVDf5A4d6fVGbMR4Bc0JUXs
 mE7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOaXId9FDYVtzua6S6YB8zBwcXrwR3+0ar6IleapqZL6w0tqc8lERx918E7ywNzik9RTIsxiTinhk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEiPO2LBLVBhWbO1tAVqoFBnSZAMXTDB/MkgmKB/JUAkct+wjn
 rfUMklyBvraBpzh27rJu47I7xwLHVJDntnMGdequi/fkHvFtcubNbjs8wrw/HI2L5CMlpl9uKYU
 GQKot3J+6KET4EqcTvfaCnP1rOBGX17Bm0H78QnPgCDdzKqonxnmuN88dYiZDeNJY4pc52fI=
X-Gm-Gg: ASbGncuHMilhZaODK092wrfWu2mxlaL/IkS+Kfx4OxT3NFekRo3jX6W6VWtCG66ZPxy
 eBCMA+rzNsIN8RzLGWWxNNMfgGUo/EL7O5mJMb79sR1aT92fkNtpAZr4lo3ZlDXrw9ZWg1lF0Xm
 6gCcClhUYwcv8eTEdKpKm0+e3pooBPeRE1b1PEMzRnRbH2vnxjvsymWjbTLdW0rFcju9MKYimOL
 vxj2mGV0w2xioq39gu2Kcxy2+2TuN58+4jyQrO1c4tKOWo/kTVUKe8i9gnHN4YjZ5fNzKRR3MXT
 RjI2PIkd8WkHFt5CBdrK+61xutwj+RRhCahX10VoS7qriK5S+tJX9LziKGfitr2B0ZJLN6geY3h
 RTv1HaOSJ+TukKhgQgbHro/ozP0XFnIghUNQcgMPDYowN8KvIs13t
X-Received: by 2002:a05:622a:1a86:b0:4b0:c1c8:ba6b with SMTP id
 d75a77b69052e-4b31d84640bmr144942171cf.23.1756806079696; 
 Tue, 02 Sep 2025 02:41:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1kM1KKXIRQLni8+uR7WNKiFx9E+rFnyVU/tfrtMInNL9wYmJHshcvZJNSvNe3Lbzu//4Sng==
X-Received: by 2002:a05:622a:1a86:b0:4b0:c1c8:ba6b with SMTP id
 d75a77b69052e-4b31d84640bmr144941971cf.23.1756806078981; 
 Tue, 02 Sep 2025 02:41:18 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f4c904dbsm3631981fa.17.2025.09.02.02.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 02:41:18 -0700 (PDT)
Date: Tue, 2 Sep 2025 12:41:16 +0300
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
Subject: Re: [PATCH v3 12/38] drm/msm/dp: introduce max_streams for DP
 controller MST support
Message-ID: <lngtq2tw4qajgjk57un5xrveblkmtjkkz3yjgue53vp6wwmqmf@owderf4zerfq>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-12-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-12-01faacfcdedd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b6bbc0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=KSwXNKDnAPCPISpuv5EA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Eu3b_GkqXGHs1QzHVQSjJ4jOTnsPNyZz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX8dzpQ6S5ZqTj
 kAh4HLo/TWgCRa2z2PGg7mlM3sQjmHJE77aXW5PTBl0yl60iVQDmwsHZ8ondGxmKX59rbKVAXO5
 7GksXeGUnVz/Jp3HXT90oj2XG7Cxc3Be2J93RTp5ns4855HmbAuYK0gGvLertgx9ozyqEpa4crI
 U+tYcr9HNJLg1mIvdHRJpR26nMB5qeyPxNM8bzHMYisJdv5j8p6G2qRJVlc323jCnVO1HTGwfSb
 TzpiLNR1Te8u/b8SVnWtZka+cIFDxTkfkiQLUK3DPhBQsobyqCbBL4rnvPxMr2FPJr/Hqln/BlV
 +nDKy6A+EW6JuhpiZYS0MAoIn0MpnKPmjdyqLkEvHjRfwOl1ZtWb84RK4AYXcjXm3Qu6/9S1Frg
 z8fJY47K
X-Proofpoint-ORIG-GUID: Eu3b_GkqXGHs1QzHVQSjJ4jOTnsPNyZz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024
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

On Mon, Aug 25, 2025 at 10:15:58PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Introduce the `mst_streams` field in each DP controller descriptor to
> specify the number of supported MST streams. Most platforms support 2 or
> 4 MST streams, while platforms without MST support default to a single
> stream (`DEFAULT_STREAM_COUNT = 1`).
> 
> This change also accounts for platforms with asymmetric stream support,
> e.g., DP0 supporting 4 streams and DP1 supporting 2.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 21 +++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>  2 files changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 78d932bceb581ee54116926506b1025bd159108f..a8477a0a180137f15cbb1401c3964636aa32626c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -33,6 +33,7 @@ module_param(psr_enabled, bool, 0);
>  MODULE_PARM_DESC(psr_enabled, "enable PSR for eDP and DP displays");
>  
>  #define HPD_STRING_SIZE 30
> +#define DEFAULT_STREAM_COUNT 1
>  
>  enum {
>  	ISR_DISCONNECTED,
> @@ -52,6 +53,7 @@ struct msm_dp_display_private {
>  	bool core_initialized;
>  	bool phy_initialized;
>  	bool audio_supported;
> +	bool mst_supported;
>  
>  	struct drm_device *drm_dev;
>  
> @@ -84,12 +86,15 @@ struct msm_dp_display_private {
>  
>  	void __iomem *p0_base;
>  	size_t p0_len;
> +
> +	int max_stream;
>  };
>  
>  struct msm_dp_desc {
>  	phys_addr_t io_start;
>  	unsigned int id;
>  	bool wide_bus_supported;
> +	int mst_streams;
>  };
>  
>  static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
> @@ -1213,6 +1218,15 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
>  	return 0;
>  }
>  
> +int msm_dp_get_mst_max_stream(struct msm_dp *msm_dp_display)
> +{
> +	struct msm_dp_display_private *dp;
> +
> +	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
> +
> +	return dp->max_stream;
> +}
> +
>  static int msm_dp_display_probe(struct platform_device *pdev)
>  {
>  	int rc = 0;
> @@ -1239,6 +1253,13 @@ static int msm_dp_display_probe(struct platform_device *pdev)
>  	dp->msm_dp_display.is_edp =
>  		(dp->msm_dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);
>  	dp->hpd_isr_status = 0;
> +	dp->max_stream = DEFAULT_STREAM_COUNT;
> +	dp->mst_supported = FALSE;
> +
> +	if (desc->mst_streams > DEFAULT_STREAM_COUNT) {
> +		dp->max_stream = desc->mst_streams;

We should keep compatibility with earlier DT files which didn't define
enough stream clocks for DP MST case. Please check how many stream
clocks are actually present in the DT and set max_stream accordingly.

> +		dp->mst_supported = TRUE;
> +	}
>  
>  	rc = msm_dp_display_get_io(dp);
>  	if (rc)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index 37c6e87db90ce951274cdae61f26d76dc9ef3840..7727cf325a89b4892d2370a5616c4fa76fc88485 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -29,6 +29,7 @@ struct msm_dp {
>  	bool psr_supported;
>  };
>  
> +int msm_dp_get_mst_max_stream(struct msm_dp *msm_dp_display);
>  int msm_dp_display_get_modes(struct msm_dp *msm_dp_display);
>  bool msm_dp_display_check_video_test(struct msm_dp *msm_dp_display);
>  int msm_dp_display_get_test_bpp(struct msm_dp *msm_dp_display);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
