Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0534FB3706E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 18:33:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A23210E392;
	Tue, 26 Aug 2025 16:33:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jsmTrUHG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88EF710E391
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 16:33:33 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QD3ANN026003
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 16:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=o0JNkVhBc++JdNPVvj2G5Tj3
 VEOgkLl+3jrDv6VD7BE=; b=jsmTrUHGvaBkNoJMv6AJPlvdxeSRoOXScDgdF8H5
 yXOY6bOIi/t8o01fuV9IO9u0u9bMxb1l21mNd+/Jb30e07scPF6cc/eWbSFWLTFd
 Q006RaI322lcHeEaHgQsi0TQBWmN+eszFaZZixyp+V3QvFqEJNb1j3LmONws8q4+
 +VzKEQ3vxORktU3MqJWeQTYwmkY1tNBSC0awih42NN4k7NxJ60O/5t23HT8aLGoO
 rxJiAeDAImklFPUzmy1ZwWGjzgCKlGXzt2h+HZBYdNfcJruN68YReBM2hNG+Ofx+
 LnHV77cIJplKO1g4jyBlcstYoQ3Pj5x1HXx1IfWYWGv1nQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6x89pbv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 16:33:33 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70d9a65c386so89342756d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 09:33:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756226012; x=1756830812;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o0JNkVhBc++JdNPVvj2G5Tj3VEOgkLl+3jrDv6VD7BE=;
 b=bLjiehu35tp3s2416uP0gl3OeXUZnofEqTg2vLaDbjetV3HptJjTfl7bkyZS2jNRH5
 WhAotOxGyLrK9UkDvGZ8WW8vY/+KHC1YsxVcXdu3VHXLS+byxwnhSc9aqdtrEpAzBN7s
 3crtAqTIYlWotqajQjbOvI5GHcTIQhULYo9zOxVWx7P0GKWg7N6uxce3uKAFfmLoTjgm
 jEyXI9QTfzuJ3d6fY5M2P87i1HBQRdxhZuUcRIDJicL7viPlTC4/vBq5gQphhuVGJzXd
 SqLCo7PctcVZkbNV51zJkdKYq2l0MrHxmCGn5C6u5E+f9d1xWvPJcxxzqt/SU0Egr+zx
 rrmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWe8bpGRzcGPaOJSNrzHnxHPw1tf6vcHtWltoeQ2wPFpIxBMivyAfdJJqnHAtopPyGZE217c3wJqlM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywfvBAOIUAA1odI++EwA7WngUKem4X7PVKuxn/5/GWBRcKkAzi
 28Lj4CRExjCqxY3gck9Oeatw9aONA4cpHmy4VD0E+Io/0ZZNZFdz0BNPiE1HtGEFySOXLATIjSa
 JOCAvnpT0tpO1541tH8zo4xKEbHogWW7XAOc35uRMlzKU01cYN5mnhrGxiwKChgcJBI80ea0=
X-Gm-Gg: ASbGncsUp0CuhPaSwFc8EL/ErR+7JkyU7WAVcrxHmSGoLBj9tC50pkTaBaIt2rY/T2j
 t1Kp83GmLv+A6wzWMneUen+lzrMy6AVRaMDJLwPXBJdyPCKo/1PqBVG0U3jPSptZG5wd+ERkKir
 t1jwducQuBWKGP931ZTMK+RpU+i79U8DRaErE20tkt7O5wa+kynLURZJrrqwrNYUWcPCFVolc9Y
 +/na4A05Wjof31JC8l+ApaBAYq2ZbvO6ylDUFz1UFgL7WsdtUTlFqovvMfxVyviHx35spcq/fGD
 g7Oq439x0mGe8MNDePQO64oTbQfzZ/Sn+nJt60gp1ZnoeHIDzeE2cFCYwLGL13j+BBCVr/vf/n3
 i+7CJz5QW1bOQ/4WQnC3gxHuczVD2uz877fUWvKG67ZxxSKoUHkQm
X-Received: by 2002:ad4:5cc1:0:b0:709:ee07:daaf with SMTP id
 6a1803df08f44-70d97102f17mr190928326d6.19.1756226011471; 
 Tue, 26 Aug 2025 09:33:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZ7aaOomBumnrq1rhi9jEEdDGg0wr1dDNic05npTTurzd/gV21cCPu8vrLKpDQ36ehil5Qyg==
X-Received: by 2002:ad4:5cc1:0:b0:709:ee07:daaf with SMTP id
 6a1803df08f44-70d97102f17mr190927636d6.19.1756226010771; 
 Tue, 26 Aug 2025 09:33:30 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35b27683sm2357303e87.0.2025.08.26.09.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 09:33:29 -0700 (PDT)
Date: Tue, 26 Aug 2025 19:33:28 +0300
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
Subject: Re: [PATCH v3 27/38] drm/msm/dp: add dp_display_get_panel() to
 initialize DP panel
Message-ID: <smvfckejheyi7oehubdkhnh6pxokn7yugvlrynraypsu6kssj3@6vinswn4yku4>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-27-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-27-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: PV0mrjvzkfXZ-dPklVPJUmJqv-LLNhva
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0NCBTYWx0ZWRfXyo0u45T4kgOO
 uB+LGUmofaXp3SYp7EKCK4EVNypvuXaclyKgd6CMRPtgNkdYZbesNfyJlX1tLwRRYth6hZCfhda
 tNNoCPh034sym9yCim6w2oJPuEYq8wZ4t+MJs76exm2z3wplSZhDGyV5FbCypbmfSFmgN59CTtR
 bD+eLWyNCHnxy/t6cV+3PZ4EQhL04RRq8XG3B7sXvG2fJ/kJkYXuP66n/XCUAbgs2occn/4YvHR
 30vmREUFF5jXUT13G07+f6uULkeZ9wExzss5mDko+/eBitEtV5rjujrBjv0TzOZdu05Jvzy5jjM
 QZacl0ZPRchfoQ4xpX8QJonirePDNdskCDIM/27vh+xxVWOenixwjyxeG5UB3GzZaoo+QPnZk7m
 +dSdzQS+
X-Proofpoint-GUID: PV0mrjvzkfXZ-dPklVPJUmJqv-LLNhva
X-Authority-Analysis: v=2.4 cv=Ep/SrTcA c=1 sm=1 tr=0 ts=68ade1dd cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=qYs0ZBLfSisuqDwih3YA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230044
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

On Mon, Aug 25, 2025 at 10:16:13PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Add an API dp_display_get_panel() to initialize and return a DP
> panel to be used by DP MST module. Since some of the fields of
> DP panel are private, dp_display module needs to initialize these
> parts and return the panel back.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 23 +++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_display.h |  2 ++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 84df34306fb557341bea288ea8c13b0c81b11919..abcab3ed43b6da5ef898355cf9b7561cd9fe0404 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -632,6 +632,29 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
>  	return 0;
>  }
>  
> +struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display)
> +{
> +	struct msm_dp_display_private *dp;
> +	struct msm_dp_panel *dp_panel;
> +
> +	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
> +
> +	dp_panel = msm_dp_panel_get(&dp->msm_dp_display.pdev->dev, dp->aux, dp->link,
> +			       dp->link_base, dp->mst2link_base, dp->mst3link_base,
> +			       dp->pixel_base);
> +
> +	if (IS_ERR(dp->panel)) {
> +		DRM_ERROR("failed to initialize panel\n");
> +		return NULL;
> +	}
> +
> +	memcpy(dp_panel->dpcd, dp->panel->dpcd, DP_RECEIVER_CAP_SIZE);
> +	memcpy(&dp_panel->link_info, &dp->panel->link_info,
> +	       sizeof(dp->panel->link_info));

Both these lines show that link_info and dpcd belong to msm_dp_display
rather than the panel. The panel should only be describing properties of
the particular sink.

> +
> +	return dp_panel;
> +}
> +
>  static void msm_dp_display_deinit_sub_modules(struct msm_dp_display_private *dp)
>  {
>  	msm_dp_audio_put(dp->audio);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index b1ea027438d952c94f3ae80725c92e46c631bdb2..d5889b801d190b6f33b180ead898c1e4ebcbf8f3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -65,4 +65,6 @@ void msm_dp_display_unprepare(struct msm_dp *dp);
>  
>  int msm_dp_display_get_active_stream_cnt(struct msm_dp *msm_dp_display);
>  
> +struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display);
> +
>  #endif /* _DP_DISPLAY_H_ */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
