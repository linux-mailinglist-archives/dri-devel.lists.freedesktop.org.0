Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3069B3726E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 20:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D9510E39E;
	Tue, 26 Aug 2025 18:43:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZNh+i9om";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F56210E39E
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 18:43:24 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QCF2re025091
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 18:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=hWvpoDjNTLvT9P7wnT7Jb3O4
 DlLy2jCuWuzYdjcW+9Q=; b=ZNh+i9ome76gk3UWE/kiZNeB8GgzN0paBILqu5zt
 n8BNOSSHRRoW0YWKf3ccCJysB/6a7Z2WR4+0opjwkdIydpQCOWBWNBAzwiESsuTE
 24hg0BKO/sc3jOzUA7N2+E+zKWMX09l3GGVgvwXfJ6x6kEq3nTp7tR3ux+aCQhA9
 MhJxafW3LTm9oOuVGYSThjrSzLoQrjS1XkelLsXs6Jt5JzBxOZy5rNsQkqoqiSR4
 1Hhz45c7pi9cBsMEZb8Z2nD/7rriX3+Sji/nu/PkmLflQQm7owpVWtqo1EZM2JTG
 1R0HxQKZwz4616BUyfeFF6ccL9EhfRreS03hwIUJZv9xPA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5uma4vt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 18:43:23 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70d9eb2ec77so82800876d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 11:43:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756233802; x=1756838602;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hWvpoDjNTLvT9P7wnT7Jb3O4DlLy2jCuWuzYdjcW+9Q=;
 b=e3Jt9HM+lvSs9BEkmnAAJB2utIKimmAQxGhcnER9P8AiyRuRMF0SOpc6FWS2lSpJ/K
 04SVpQJGY1AEzoVsH+i6ryHtdhkQcLrTbVhl3wIEH95folGgUfbR5OMxiH+mBvhZU5jw
 fpU9XPAUy2SAcrJv9H8WhEkddSFf+GMVBagZGYYiJNOkQksKZVKgNv4Jd4U394P7R9WO
 MBRdkqCG4tKNzTcN9hSJI0T800TiFypSwrHBb6t5V9AJdsJe2EO9GlQoyFgYM7/IyzDL
 TVQ51ZKeAf2lCqECUtRddn0VFq6wN3xaVAsfoq6NaqpEE6zef6HN+e0WvtTKmwMsR2LE
 0lhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpA/KCMU4/WrpTlVOVgLSCTFDuKvB6Jjn6X7RWFDEjHuaodPHTfvXnXhsv9LkFHpDWgGzhgD1GPlI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8mfC0ACBY/7nyDUlY3D2EtQkauwK2ZRysJNd7kmiuhiFHSPOr
 ZNrqiaxg3XqZv7E3dp4a0qaY7YVcmGl4YSKR2tr9w+2QSh/rmdxaDTKParrirM2c94PHKpjhY9a
 LnFyEb2tDIx9ZSoRmCMy4qcFAaFQV4TO4SNTSoYh2P8vY3pEhhr/PsIHzLbOFPF/CCpzWGcc=
X-Gm-Gg: ASbGncu0O6S63tVnwxuQAK/+E+0AZp/wA9Ue4P5+CGPmdQ9mJZ4Pkp4baHOxbx+SKkb
 VmLMLe9PUBRUenxQiB1ugfFn+bSwnh11CzVeg5kfjPfH0UjfGcDAUz9Hxg92Wb7nYSt6XH1xdHd
 InKIKc/EyUtIbVeu6SwpvTmtjI64ifcJHDjMAcKebX3t9Am4ADwQnBF/58ApNYhpUlvhc6UGI/0
 JQ7+K5a6SoAeSX8NM+lsdWgZvdAL5aI/RXW9NqxjqrEcjLrStXRz/6STLtVaVDdfah7hkrh3dxo
 ZIZzGiYX6eN9le+n/EGEx4MDSkYJHylecEQsDDB6Tb/r+oUUwNgzV1W+H/crmEGmSz2lZ7om0p/
 wLB1Fkyr/PNfpdWy38p4VbLcqaVgJFiFYYjG1l1+VhMSckzEDf9bD
X-Received: by 2002:a05:622a:588d:b0:4b2:ee95:6c54 with SMTP id
 d75a77b69052e-4b2ee95851dmr3728671cf.43.1756233802303; 
 Tue, 26 Aug 2025 11:43:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6IfNHCoBBouEBY9m2TV/n1ySuwPSthCvJdO6LrRDTTfuS+b800yiqyuWzOwKIizgebXIBOA==
X-Received: by 2002:a05:622a:588d:b0:4b2:ee95:6c54 with SMTP id
 d75a77b69052e-4b2ee95851dmr3728131cf.43.1756233801582; 
 Tue, 26 Aug 2025 11:43:21 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f42101509sm1719052e87.106.2025.08.26.11.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 11:43:20 -0700 (PDT)
Date: Tue, 26 Aug 2025 21:43:18 +0300
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
Subject: Re: [PATCH v3 32/38] drm/msm/dp: propagate MST state changes to dp
 mst module
Message-ID: <bmni5a57d5c6wu4zwlu3uokscnrmgsuvze254afwqcfdlqplzb@fss6ewfptdvv>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-32-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-32-01faacfcdedd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68ae004b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=XT7MnVG-IMvVsVpEgAUA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX5J5w5dPGRRxJ
 2B9CYoG8C3sfkQjUiGQ7FBlvhYP/UCtjxfSqpheAt049ZRAFRYZyKdRjdpPydZbRDkRAz6Od/ph
 z1x0TpuC4xF8GXwTugMXH6zKoSERmEjR8YI1HGry0rcFJrB0yk/jYkLH44/qUO403jW4elRWqf+
 OwQR6xWBIa7Ql9cFWFH7dG0j6R8rRggTWMB2xXCp0sitjmSvM+j0LoV5G4myDNevS1XcMLUVsqb
 dIjGOcwmigxvrsVL59bdSAkrUFsCIN1uCBi6OxymW/dVIdogx4l4BgJlCXpY6A/dhW93g6RZlub
 iEa98BhAxg7FCS/YN1EYoODjNxFTiq1n47bcxQR55whuAtayCHyhwW9IFpJOHBUbaQdcat/39qK
 rM7VH1g6
X-Proofpoint-GUID: GSR9vBY4i64-V_YLUA0jQv0nO14gNYkz
X-Proofpoint-ORIG-GUID: GSR9vBY4i64-V_YLUA0jQv0nO14gNYkz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032
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

On Mon, Aug 25, 2025 at 10:16:18PM +0800, Yongxing Mou wrote:
> Introduce APIs to update the MST state change to MST framework when
> device is plugged/unplugged.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 10 +++++++++-
>  drivers/gpu/drm/msm/dp/dp_mst_drm.c | 15 +++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_mst_drm.h |  1 +
>  3 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 59720e1ad4b1193e33a4fc6aad0c401eaf9cbec8..909c84a5c97f56138d0d62c5d856d2fd18d36b8c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -28,6 +28,7 @@
>  #include "dp_drm.h"
>  #include "dp_audio.h"
>  #include "dp_debug.h"
> +#include "dp_mst_drm.h"
>  
>  static bool psr_enabled = false;
>  module_param(psr_enabled, bool, 0);
> @@ -269,7 +270,6 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
>  		dp->panel->video_test = false;
>  	}
>  
> -

Unrelated

>  	drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
>  			dp->msm_dp_display.connector_type, hpd);
>  
> @@ -386,6 +386,9 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  
>  	msm_dp_link_reset_phy_params_vx_px(dp->link);
>  
> +	if (dp->msm_dp_display.mst_active)
> +		msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, true);

I'd say, this should be a part of the previous patch.

> +
>  	if (!dp->msm_dp_display.internal_hpd)
>  		msm_dp_display_send_hpd_notification(dp, true);
>  
> @@ -608,6 +611,11 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
>  	if (!dp->msm_dp_display.internal_hpd)
>  		msm_dp_display_send_hpd_notification(dp, false);
>  
> +	if (dp->msm_dp_display.mst_active) {
> +		msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, false);
> +		dp->msm_dp_display.mst_active = false;
> +	}
> +
>  	/* signal the disconnect event early to ensure proper teardown */
>  	msm_dp_display_handle_plugged_change(&dp->msm_dp_display, false);
>  
> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> index 331d08854049d9c74d49aa231f3507539986099e..ca654b1963467c8220dd7ee073f25216455d0490 100644
> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> @@ -924,6 +924,21 @@ msm_dp_mst_add_connector(struct drm_dp_mst_topology_mgr *mgr,
>  	return connector;
>  }
>  
> +int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state)
> +{
> +	int rc;
> +	struct msm_dp_mst *mst = dp_display->msm_dp_mst;

Reverse X-mas

> +
> +	rc = drm_dp_mst_topology_mgr_set_mst(&mst->mst_mgr, state);
> +	if (rc < 0) {
> +		DRM_ERROR("failed to set topology mgr state to %d. rc %d\n",
> +			  state, rc);
> +	}
> +
> +	drm_dbg_dp(dp_display->drm_dev, "dp_mst_display_set_mgr_state state:%d\n", state);
> +	return rc;
> +}
> +
>  static const struct drm_dp_mst_topology_cbs msm_dp_mst_drm_cbs = {
>  	.add_connector = msm_dp_mst_add_connector,
>  };
> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> index 5e1b4db8aea4506b0e1cc1cc68980dd617d3f72a..8fe6cbbe741da4abb232256b3a15ba6b16ca4f3e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> @@ -87,5 +87,6 @@ int msm_dp_mst_drm_bridge_init(struct msm_dp *dp, struct drm_encoder *encoder);
>  int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux);
>  
>  void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display);
> +int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state);
>  
>  #endif /* _DP_MST_DRM_H_ */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
