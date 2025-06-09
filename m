Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C20AD1E20
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 14:51:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 367CE10E00B;
	Mon,  9 Jun 2025 12:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mhtIJ5ND";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7066910E1C1
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 12:41:53 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599dHt4000483
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Jun 2025 12:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=TFd/ZD//i6s5v7Vc3GowR/yA
 OLuzDoIe0lQqnp2Albc=; b=mhtIJ5NDGsN29fCI021CetegU6LuUwPgUwMV7OOb
 2JHy0ocVoiayNkIvIMNn+sTo+WCwy3e7wuWWSHFoD0pgudgiJUc7uhQyOKk1udbm
 2YNwi1BItGhHh5qp0f+GAvU1ZyGy1fuJMFojCdZexX2tuvhyMC2KJzTWLmWRTLXO
 /qq/rqI4oagLwnDd5rh4swfzsEl9/SzygA3+yzO2ddcnZWfh+kTSs1br/iRjDQlw
 Jxhpm6DNXaPOKGLozxJw3H9fw2xTcN8pmWHXzwsazTkVweNHLJOhuipwxyqH9GES
 tnCJZMgZvnl1IAjWpUxDlhVI4R257Erm5pMaR2H/PsaxiQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475g75ta8m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 12:41:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5e2872e57so779322785a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 05:41:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749472911; x=1750077711;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TFd/ZD//i6s5v7Vc3GowR/yAOLuzDoIe0lQqnp2Albc=;
 b=UoOCHMNCMGNWCUg+BDIAX84TLsLy2IXaiXy5GJN1X6sJNO6YVmw/741KkoWBG8YTqn
 5PFwTk0ElcMpLbe/SuWyRjebtbGgyjK7Rkwc963jqSvx2kzmq5XiZDqK+4mi8ypFv+gk
 i0lXfDLHDxR/a44uxE+rrmqecq/6e/xCPMv4QXGa4n2HI7mkH6fb/X4J7t2LhoqpsaYy
 wcQqBuXW2Q+JJRCPEfvFbuM2Q6JS0Glg8t7towCoDRmfD6GrIR8NrzKp5AioZrw8Bwdp
 agBqmemnsarQ0gw432wUiZtO571pmqbI6CwmaWcjPzapaLqqhx4Gt5UHivMVDh4mIktH
 dusA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXm2kklMeSyeT+IuCMLBxQAZB8Wm6cPi6xfTnIQfefhkJerVSV8eMWXCln3PG7SLwj2FtR4qUnx+7U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/3YOtGdJ8J8tiPA9cyW95AR/2ZCh/4KhAE8LcgaKw+XCqEzkd
 sbpfPedZD1MTPECwZtVT4YFcdx80A+nvwNjYKg2rOOrbNkInpo/UG9aBQc09sLm/KejVBVVI1K7
 2oVrabPlU3NWdqnk2vyMLxKy7EM3Rg8QP8tSkSFuZ/fLoj51kuH63JMoNlb3o0BEsnwv4cXQ=
X-Gm-Gg: ASbGncuxS5J51FVf9cDkkOO+JifJ1v2wwHGikGS7/0s/YXeZTiXu46J/IW1LhBFe5i7
 wytdiLXuoW8GALWb1wglkn1P0clZ7VHTJKHuJqeFvok0aGgeS/ZNupOzLLHn850ZymsIH3KMJqK
 h0elXDEpeX25VQLKSSGGt4/MHjlIoah5/wpPgNglf5HyzU52wEiaqpBFUJUxkge2XfR77l87EHz
 7xxOoR59QJcWaLplmt1USHhjCnRwUa4ajRfN++F4933qmMVeH1NIAJdp5Dmx32hIuUc4Sr7I3AF
 9ZTgY/4apFVaSQ75uLpFR9Cn6hluhVTlsCz+k5vd7jP5PLOyIi0Wle88OWXJiPBbd7jeo8QCBkR
 dpwkeX043Nw==
X-Received: by 2002:a05:620a:240b:b0:7d3:9042:1092 with SMTP id
 af79cd13be357-7d390421272mr906610185a.40.1749472911570; 
 Mon, 09 Jun 2025 05:41:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHNgYZ/3CizvC9kMbujPb3JLe/UwcdAD4e5NZpxhvnGIPY44cJ/jZIFCJw+2xLOIYUG/cE+A==
X-Received: by 2002:a05:620a:240b:b0:7d3:9042:1092 with SMTP id
 af79cd13be357-7d390421272mr906605085a.40.1749472911098; 
 Mon, 09 Jun 2025 05:41:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553676d0e36sm1133557e87.1.2025.06.09.05.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 05:41:50 -0700 (PDT)
Date: Mon, 9 Jun 2025 15:41:48 +0300
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
Subject: Re: [PATCH v2 01/38] drm/msm/dp: split msm_dp_panel_read_sink_caps()
 into two parts and drop panel drm_edid
Message-ID: <g6wqvbszbrw6gnvxz7cjmhx4rc53kyulcr5wjekfjaisontikl@723odzngtlnd>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-1-a54d8902a23d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-1-a54d8902a23d@quicinc.com>
X-Proofpoint-GUID: nFUtlCp7peBCmmXsCXt6UkJQknhSi3T7
X-Proofpoint-ORIG-GUID: nFUtlCp7peBCmmXsCXt6UkJQknhSi3T7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5NCBTYWx0ZWRfXxULB6wknmMO7
 hmiiSscmjtGjWDsbKROayCLRWd8Q8pwkMipg8M0PIBxxSql8jQQID3yIJ7FMwICQeeYTHfLLCiL
 jCKQI0ZIlmszHvWrzFlrgGi8jdK+ZgBW1CgRoqO21GpNrU7E8ZvLv62dxca+92QpA76aSjMh6jB
 jCUQ4mG8bzhi5c5vlDgP850ojguhIS3hvIcopEG72iixLQ5B2Y7/ZkKfEHpIh82y7GJKNP0MrRl
 Qzzm4mBH0Y2CozvLfjZEWG9zgmSjy06U3GwTwFvUPhUArYeaeiUL1USPKrLEDryuTW8knSCHhlr
 IMMk/8fktf/0pVd2mSNHLFFZ3/Ywl3ReX6Bwv33s1xQnB2n6a9Db0jC4cwWCaS4Z4OSmwjcm+aC
 lN3Ni/CTcy53/Hppm95WU8c/bQaZ0F3Y1eJPPQiTK7hvdlEGBK2xVXdKuiHVITL2CtR7ECSO
X-Authority-Analysis: v=2.4 cv=TeqWtQQh c=1 sm=1 tr=0 ts=6846d690 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=HhoKpUjQ_SR5QyaspAAA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090094
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

On Mon, Jun 09, 2025 at 08:21:20PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> In preparation of DP MST where link caps are read for the
> immediate downstream device and the edid is read through

EDID, not edid. Please review all your patches for up/down case.

> sideband messaging, split the msm_dp_panel_read_sink_caps() into
> two parts which read the link parameters and the edid parts
> respectively. Also drop the panel drm_edid cached as we actually
> don't need it.

Also => separate change. 

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 13 +++++----
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 55 ++++++++++++++++++++-----------------
>  drivers/gpu/drm/msm/dp/dp_panel.h   |  6 ++--
>  3 files changed, 40 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 6f05a939ce9e648e9601597155999b6f85adfcff..4a9b65647cdef1ed6c3bb851f93df0db8be977af 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -389,7 +389,11 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  
>  	dp->link->lttpr_count = msm_dp_display_lttpr_init(dp, dpcd);
>  
> -	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
> +	rc = msm_dp_panel_read_link_caps(dp->panel);
> +	if (rc)
> +		goto end;
> +
> +	rc = msm_dp_panel_read_edid(dp->panel, connector);
>  	if (rc)
>  		goto end;
>  
> @@ -720,7 +724,6 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
>  static void msm_dp_display_deinit_sub_modules(struct msm_dp_display_private *dp)
>  {
>  	msm_dp_audio_put(dp->audio);
> -	msm_dp_panel_put(dp->panel);
>  	msm_dp_aux_put(dp->aux);
>  }
>  
> @@ -783,7 +786,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
>  		rc = PTR_ERR(dp->ctrl);
>  		DRM_ERROR("failed to initialize ctrl, rc = %d\n", rc);
>  		dp->ctrl = NULL;
> -		goto error_ctrl;
> +		goto error_link;
>  	}
>  
>  	dp->audio = msm_dp_audio_get(dp->msm_dp_display.pdev, dp->catalog);
> @@ -791,13 +794,11 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
>  		rc = PTR_ERR(dp->audio);
>  		pr_err("failed to initialize audio, rc = %d\n", rc);
>  		dp->audio = NULL;
> -		goto error_ctrl;
> +		goto error_link;
>  	}
>  
>  	return rc;
>  
> -error_ctrl:
> -	msm_dp_panel_put(dp->panel);
>  error_link:
>  	msm_dp_aux_put(dp->aux);
>  error:
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 4e8ab75c771b1e3a2d62f75e9993e1062118482b..d9041e235104a74b3cc50ff2e307eae0c4301ef3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -118,14 +118,13 @@ static u32 msm_dp_panel_get_supported_bpp(struct msm_dp_panel *msm_dp_panel,
>  	return min_supported_bpp;
>  }
>  
> -int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
> -	struct drm_connector *connector)
> +int msm_dp_panel_read_link_caps(struct msm_dp_panel *msm_dp_panel)
>  {
>  	int rc, bw_code;
>  	int count;
>  	struct msm_dp_panel_private *panel;
>  
> -	if (!msm_dp_panel || !connector) {
> +	if (!msm_dp_panel) {
>  		DRM_ERROR("invalid input\n");
>  		return -EINVAL;
>  	}
> @@ -160,26 +159,29 @@ int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
>  
>  	rc = drm_dp_read_downstream_info(panel->aux, msm_dp_panel->dpcd,
>  					 msm_dp_panel->downstream_ports);
> -	if (rc)
> -		return rc;
> +	return rc;
> +}
>  
> -	drm_edid_free(msm_dp_panel->drm_edid);
> +int msm_dp_panel_read_edid(struct msm_dp_panel *msm_dp_panel, struct drm_connector *connector)
> +{
> +	struct msm_dp_panel_private *panel;
> +	const struct drm_edid *drm_edid;
> +
> +	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
>  
> -	msm_dp_panel->drm_edid = drm_edid_read_ddc(connector, &panel->aux->ddc);
> +	drm_edid = drm_edid_read_ddc(connector, &panel->aux->ddc);
>  
> -	drm_edid_connector_update(connector, msm_dp_panel->drm_edid);
> +	drm_edid_connector_update(connector, drm_edid);
>  
> -	if (!msm_dp_panel->drm_edid) {
> +	if (!drm_edid) {
>  		DRM_ERROR("panel edid read failed\n");
>  		/* check edid read fail is due to unplug */
>  		if (!msm_dp_catalog_link_is_connected(panel->catalog)) {
> -			rc = -ETIMEDOUT;
> -			goto end;
> +			return -ETIMEDOUT;
>  		}
>  	}
>  
> -end:
> -	return rc;
> +	return 0;
>  }
>  
>  u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel,
> @@ -208,15 +210,20 @@ u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel,
>  int msm_dp_panel_get_modes(struct msm_dp_panel *msm_dp_panel,
>  	struct drm_connector *connector)
>  {
> +	struct msm_dp_panel_private *panel;
> +	const struct drm_edid *drm_edid;
> +
>  	if (!msm_dp_panel) {
>  		DRM_ERROR("invalid input\n");
>  		return -EINVAL;
>  	}
>  
> -	if (msm_dp_panel->drm_edid)
> -		return drm_edid_connector_add_modes(connector);
> +	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
> +
> +	drm_edid = drm_edid_read_ddc(connector, &panel->aux->ddc);
> +	drm_edid_connector_update(connector, drm_edid);

If EDID has been read and processed after HPD high event, why do we need
to re-read it again? Are we expecting that EDID will change?

>  
> -	return 0;
> +	return drm_edid_connector_add_modes(connector);
>  }
>  
>  static u8 msm_dp_panel_get_edid_checksum(const struct edid *edid)
> @@ -229,6 +236,7 @@ static u8 msm_dp_panel_get_edid_checksum(const struct edid *edid)
>  void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel)
>  {
>  	struct msm_dp_panel_private *panel;
> +	const struct drm_edid *drm_edid;
>  
>  	if (!msm_dp_panel) {
>  		DRM_ERROR("invalid input\n");
> @@ -238,8 +246,13 @@ void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel)
>  	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
>  
>  	if (panel->link->sink_request & DP_TEST_LINK_EDID_READ) {
> +		drm_edid = drm_edid_read_ddc(msm_dp_panel->connector, &panel->aux->ddc);

And again....

> +
> +		if (!drm_edid)
> +			return;
> +
>  		/* FIXME: get rid of drm_edid_raw() */
> -		const struct edid *edid = drm_edid_raw(msm_dp_panel->drm_edid);
> +		const struct edid *edid = drm_edid_raw(drm_edid);
>  		u8 checksum;
>  
>  		if (edid)
> @@ -515,11 +528,3 @@ struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux
>  
>  	return msm_dp_panel;
>  }
> -
> -void msm_dp_panel_put(struct msm_dp_panel *msm_dp_panel)
> -{
> -	if (!msm_dp_panel)
> -		return;
> -
> -	drm_edid_free(msm_dp_panel->drm_edid);
> -}

Too many changes to be stuffed under the hood of "Also perform foo"

> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> index 4906f4f09f2451cfed3c1007f38b4db7dfdb1d90..7f139478e1012d5b8f1f745f0de5fc3943745428 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> @@ -32,7 +32,6 @@ struct msm_dp_panel {
>  	u8 downstream_ports[DP_MAX_DOWNSTREAM_PORTS];
>  
>  	struct msm_dp_link_info link_info;
> -	const struct drm_edid *drm_edid;
>  	struct drm_connector *connector;
>  	struct msm_dp_display_mode msm_dp_mode;
>  	struct msm_dp_panel_psr psr_cap;
> @@ -51,7 +50,9 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel);
>  int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
>  		struct drm_connector *connector);
>  u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel, u32 mode_max_bpp,
> -			u32 mode_pclk_khz);
> +			      u32 mode_pclk_khz);
> +int msm_dp_panel_read_link_caps(struct msm_dp_panel *dp_panel);
> +int msm_dp_panel_read_edid(struct msm_dp_panel *dp_panel, struct drm_connector *connector);
>  int msm_dp_panel_get_modes(struct msm_dp_panel *msm_dp_panel,
>  		struct drm_connector *connector);
>  void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel);
> @@ -86,5 +87,4 @@ static inline bool is_lane_count_valid(u32 lane_count)
>  
>  struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
>  			      struct msm_dp_link *link, struct msm_dp_catalog *catalog);
> -void msm_dp_panel_put(struct msm_dp_panel *msm_dp_panel);
>  #endif /* _DP_PANEL_H_ */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
