Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9AAB3725B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 20:40:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7906C10E3A5;
	Tue, 26 Aug 2025 18:40:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lV2r7Cj5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 621F410E39E
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 18:40:19 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QCRKQY010555
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 18:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=+OWsVBo1SqEPuhupHZMydVuW
 c8x29kMo1SSIQfcH4/4=; b=lV2r7Cj5XtYw0Qog6T8z9qq1SC5q4kFFUp5Wd/XB
 rnSkpbHk2ESG5gN5jQ5Jgmd3PWFXtusQgMns+0RuWSPM8RkVCGnCodesuAA7MhF2
 YufDF5drZcnILnyNYalh+HL9q1YkbISGmzprBBSCgyUvriKd71lnvnmQ1uc7UkhS
 x/1JELMWZkDvpT1Vc/h9NydtXy4IY2ejYJGyPv+lQTOjaALbPojI5xzTisJtHavY
 xiXLAtJstZEfGnHSZ0iJBEGawDYAXjXH26bTFTuILrYq+fSzM8GLa9AfSDr85Ny5
 2joWLQyImMvJ+U4SziktOgav4a3SglOyEgbWpWySOsVttw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xfj0r7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 18:40:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b1098f6142so115434291cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 11:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756233617; x=1756838417;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+OWsVBo1SqEPuhupHZMydVuWc8x29kMo1SSIQfcH4/4=;
 b=RhtOJL91/t3Nd4Z/tmOdWZgx72Cg50Obx5g8t/BwxgHswLZpehoukHVvohEp9x5Kdo
 ZU/d2tv0Q+3tH+0ZdIvP8j6NeObSitIhCuJsWE+J7WHAtT70zV6lkmf3xU2YydHv3FnC
 mxiXHxD7rBVsTNe9P18q5fYj2hfLoI4HrTMpWtuNodpfhAL6XF22TTgMevYax8Nt1Drb
 NOBZ3kRqOIjEFnW6DOV3NMZ6hm66cEN+UChHResed7vj0vZPzrPLgTjnB4CSuZcZx798
 N036Fn+rMr0VqvbiJa/LFmFldp7JQkxIjnP+h1GusYPcfidD0gd4WQKBpp6J7SVOfWAy
 Is+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVG4skYoZAchOAlXSdO/rVWGBqnKTEcKsCqVdjex3l+8EYtYMwLSU+P3AviTlVUuEZrSS9J+wrzyp0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4KHB4MDdiKZGYy5TU+6nzCcKUmJMS4pFJNTF9zInAsOQe6ojg
 04/NMdvfMeHvrWvVy0lVC6knXNjX/cnvnWVwP6gUOURPoFjYIBhhh8+35iZk0phrSC91qF21G1/
 uXIsiludPYZJkN6G9Rq4ygpBrJzjKP7XM9X7ZfbnBE0IS//D4DmEhgf5xM0xQMnMLvVNCeS3asb
 G5oQM=
X-Gm-Gg: ASbGncsOuml1YSQggy+1dV56CqBtU38lCoGldqsNthM9z5vUAYq5Hc/LwPrAzUz9VPV
 jesn9ldGrRkCKKRCVvzLVa5JftA3uq7IymfQZm2Fa7O28gJ5X3Et+BfCwU7P6XhhRUUGMPYvJhz
 Quy05xQhthpVBXOlaQ+5UbHhyMhOGFmIcuTTaLFh9aMhEgh/D0TQF+SiUWuRYY1SLlcB7N+DC7M
 FekB5nUPF4anMii9Ga7JDaA/hA7apGYfxAhfqJZ+AHmCtMlpdWyAeqqU5ZEIIeqWmfVskDICQO+
 l/TuIYwTeihj4YdXAdMrkAzH54Z34RC+92fcCvqFY261IXGLehL7OWAE2cI4oDrlPk5k+5q9/c1
 +9en5iKflaa7fEzMLaxfYB7sz9M+J5Cqh8HjZJPMaB485Orc8vTDY
X-Received: by 2002:ac8:59cf:0:b0:4b2:dedd:dc44 with SMTP id
 d75a77b69052e-4b2dedddd88mr70675991cf.60.1756233617330; 
 Tue, 26 Aug 2025 11:40:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/C0+98TJdD4kRL09tzpDMDxdDNeOZVBRac49DO2vTTbUPqtlGS1O+KnQVoIcfA65skoHeJQ==
X-Received: by 2002:ac8:59cf:0:b0:4b2:dedd:dc44 with SMTP id
 d75a77b69052e-4b2dedddd88mr70675401cf.60.1756233616510; 
 Tue, 26 Aug 2025 11:40:16 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35c9a1e1sm2368916e87.114.2025.08.26.11.40.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 11:40:15 -0700 (PDT)
Date: Tue, 26 Aug 2025 21:40:13 +0300
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
Subject: Re: [PATCH v3 31/38] drm/msm/dp: add HPD callback for dp MST
Message-ID: <pc4brjias4ixewzlsvnlhqhlz774z4p6aq7j4kldu5ze2e35sh@tsm2mtrkk3zi>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-31-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-31-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX0zSsk+VJ+WJP
 Gjsd7dFgtYBgSbNgleqdrqBadiBSeuyqO4ohIW1jtzt976pELZdMcgNRBkb+MLisfCJISBltTnv
 8zElnqFCvNgRE1og5scV3OsCSU45dTXLjL5KIuLBtgEmC9HJO7r5Dn/AFbKkF1R2QWizbAaSayF
 0MJNZobw52zkr1z9XdymVDFflqXS1u2m4tIJcsc9in+rXOPNJ1KoVbQXIiwkSm6B4BasX+kJ09q
 mgk9eJRaUVBv6Gu1XEQXZlFZJ21VPM+VlxtqPW+UIUSECWUobry95Q9vDy2jbkpkVr4wpQ3SAcR
 yzhzj/paQ1VxZSa1i3RdAbxYh/1QWHdzDoomJBftfI+6bGVhYH5hq9GxLyyswm0Imj2wgCt6nQH
 /TRJqBfs
X-Proofpoint-GUID: ubXP-B2bp_YLBvJNzi91f0r3mjS97Ed2
X-Authority-Analysis: v=2.4 cv=MutS63ae c=1 sm=1 tr=0 ts=68adff92 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=HzI044FDPuIs1nSBvi8A:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ubXP-B2bp_YLBvJNzi91f0r3mjS97Ed2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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

On Mon, Aug 25, 2025 at 10:16:17PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Add HPD callback for the MST module which shall be invoked from the
> dp_display's HPD handler to perform MST specific operations in case
> of HPD. In MST case, route the HPD messages to MST module.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++++++---
>  drivers/gpu/drm/msm/dp/dp_mst_drm.c | 34 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_mst_drm.h |  2 ++
>  3 files changed, 48 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index abcab3ed43b6da5ef898355cf9b7561cd9fe0404..59720e1ad4b1193e33a4fc6aad0c401eaf9cbec8 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -500,9 +500,16 @@ static int msm_dp_display_handle_irq_hpd(struct msm_dp_display_private *dp)
>  
>  static int msm_dp_display_usbpd_attention_cb(struct device *dev)
>  {
> -	int rc = 0;
> -	u32 sink_request;
>  	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
> +	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
> +	u32 sink_request;
> +	int rc = 0;
> +
> +	if (msm_dp_display->mst_active) {
> +		if (msm_dp_aux_is_link_connected(dp->aux) != ISR_DISCONNECTED)
> +			msm_dp_mst_display_hpd_irq(&dp->msm_dp_display);
> +		return 0;
> +	}
>  
>  	/* check for any test request issued by sink */
>  	rc = msm_dp_link_process_request(dp->link);
> @@ -1129,8 +1136,10 @@ static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
>  	if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
>  		msm_dp_display_send_hpd_notification(dp, false);
>  
> -	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
> +	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
>  		msm_dp_display_send_hpd_notification(dp, true);
> +		msm_dp_irq_hpd_handle(dp, 0);

Why is it a part of this patch?? It has nothing to do with MST.

> +	}
>  
>  	ret = IRQ_HANDLED;
>  
> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> index b4f640134af544c77ab262d2cbe0b67e1e2e1b3a..331d08854049d9c74d49aa231f3507539986099e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> @@ -567,6 +567,40 @@ static struct msm_dp_mst_bridge_state *msm_dp_mst_br_priv_state(struct drm_atomi
>  	return to_msm_dp_mst_bridge_state_priv(obj_state);
>  }
>  
> +/* DP MST HPD IRQ callback */
> +void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display)
> +{
> +	int rc;
> +	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
> +	u8 ack[8] = {};
> +	u8 esi[4];
> +	unsigned int esi_res = DP_SINK_COUNT_ESI + 1;
> +	bool handled;
> +
> +	rc = drm_dp_dpcd_read(mst->dp_aux, DP_SINK_COUNT_ESI,
> +			      esi, 4);
> +	if (rc != 4) {
> +		DRM_ERROR("dpcd sink status read failed, rlen=%d\n", rc);

It's DPCD, not dpcd.

> +		return;
> +	}
> +
> +	drm_dbg_dp(dp_display->drm_dev, "mst irq: esi1[0x%x] esi2[0x%x] esi3[%x]\n",
> +		   esi[1], esi[2], esi[3]);
> +
> +	rc = drm_dp_mst_hpd_irq_handle_event(&mst->mst_mgr, esi, ack, &handled);
> +
> +	/* ack the request */
> +	if (handled) {
> +		rc = drm_dp_dpcd_writeb(mst->dp_aux, esi_res, ack[1]);
> +
> +		if (rc != 1)

No empty space, drm_dp_dpcd_write_byte().

> +			DRM_ERROR("dpcd esi_res failed. rc=%d\n", rc);
> +
> +		drm_dp_mst_hpd_irq_send_new_request(&mst->mst_mgr);
> +	}
> +	drm_dbg_dp(dp_display->drm_dev, "mst display hpd_irq handled:%d rc:%d\n", handled, rc);
> +}
> +
>  /* DP MST Connector OPs */
>  static int
>  msm_dp_mst_connector_detect(struct drm_connector *connector,
> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> index 1484fabd92ad0075eac5369aac8ca462acbd3eda..5e1b4db8aea4506b0e1cc1cc68980dd617d3f72a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> @@ -86,4 +86,6 @@ int msm_dp_mst_drm_bridge_init(struct msm_dp *dp, struct drm_encoder *encoder);
>  
>  int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux);
>  
> +void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display);
> +
>  #endif /* _DP_MST_DRM_H_ */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
