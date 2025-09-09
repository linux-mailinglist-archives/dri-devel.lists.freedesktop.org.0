Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB5BB4FEF8
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 16:12:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C760510E740;
	Tue,  9 Sep 2025 14:12:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SiQ2qPn3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED0010E740
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 14:12:44 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LVn9031532
 for <dri-devel@lists.freedesktop.org>; Tue, 9 Sep 2025 14:12:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=67PS0C/481rnQLhmSPkrAKjs
 X8cDPvO1jPvWWiHZRdE=; b=SiQ2qPn3xpcyCKMRQjLt407Mz/pj9qBF6qQge3Br
 8XRqdxRn41CBcD8MdreHPjz8gVIyseehYhkx8/vkrbs5XkWR1mF/BByDTxDlgO5q
 0WBKUKIDLyPraiRlHXp7d37syNw5p52NPRnTlbIx7ylD4KRdk42I8VQViKZXEYzz
 vULsrP/IO13nqmtbMuW6BlFij/eOU6ZHwWscbkRlTV1IYvCo0LrZ4Kv/iAqiLQJK
 tooochJSNdwBf4XXbMnIQkkcyV3lt/ospOrg0l0v5onrlIqU6XfQsZbmolAtQM4u
 5VWdRxWDM1ri6XQuI/CvQrUGRB4B5Xv0GnGFLNxEktujhA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bws8k90-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 14:12:43 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-71ff3e1256cso136609906d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 07:12:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757427162; x=1758031962;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=67PS0C/481rnQLhmSPkrAKjsX8cDPvO1jPvWWiHZRdE=;
 b=gJ17GN1OSM7bP/MtUSB09c2CKWHVdHf0R3JRiIJYwkkTEHBYtbw0CZ8sZNWlyruiri
 LpfSTGUWDQpGkPNdc84U1NkjQF8/aZxB0XgPzyd226FWz0K5XLKuy01SHRixmlL4afr4
 TwvgeckNXjqX8TTkrxilLPOb+IVYMn4g2FnXc1mthwm2zjXZa5R9D4ZzXpVn60PbJ58a
 PexXmoIMxPZ6T4PTyAE6eq43njGaleYl3U2FjkWxJXaYQHeotN0V3ycyAWdXl1s0GwW3
 H/eTvhIRcFwo1PfAdF8TK1QfVml6qdQrPJyVO6S4G9e1Iz19gtAGnfhN3qLFmovRlkBZ
 +hsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyRs21o51od/sC1vFAumeu8w6P0NpDJ2t4OxfF6LtAl30uHMRmVViizKK9IKjVqN+CGkmG8+qwdZ4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYrEWuiUkFDV1qD15+CijWMAkhxURI8+rbwQrnSv9nIznC+7Ss
 30lU0Z/3J/VDSFXbyFNJEVexqIW72MWrIB5wfu01KvLVSHrLRbD0fKh5Nk+PjPyeSLr/ngPaCMQ
 z3c+zdUtSxX/iVvu5geFS41J4T9M+D7i884S9ennkU942CVqpi3n7ZnPEtkbB4cnLTAJDbJ4=
X-Gm-Gg: ASbGnctvZns0EAgcWtXkdP3tHmBPV9SQeq/+U/3rHhjJMzey5ny6r9pq6QQzTqWtVnT
 pA9bBN1M20tefSVRzPOkITIF1mUJ5H9prFf/7aY+CgIhVXYWL6k+3OD+flTGlYxRl/jFZ5bnfpP
 uPHefc+Nudzo8IjVslUjUIUVKN5szWinesT7BiKoRKHqnJd4v73XEz6OTJZZUuEFnd2vSuIsrRM
 da6/hXWiU6bTjMjl6Y2hqU+w2D4zwFQEuNn9taj+i4m49shJHP86VyM8BDpkNdV1Sx/ONFcs886
 BSufPYzDCoNigOiqaespR0S1FyGOyFhfq5PKpr/IHANZc4rK6eWXCxWS8BnxkSTl8mGdt+hwR6K
 Il7BB6vXbyFdlUTiWdXvx+3quR+iG4Sajbi+Njf/bKXyaaUGPp4Y8
X-Received: by 2002:a05:6214:ca5:b0:718:2aac:b388 with SMTP id
 6a1803df08f44-739253e0931mr142412726d6.30.1757427161756; 
 Tue, 09 Sep 2025 07:12:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDYTtResNcfpvS0agVEJ7wEB7/FBA6ybJ9ZTMvc6tLI/gx3MP1Fzs6W1ifgn0SJOVGWX+61g==
X-Received: by 2002:a05:6214:ca5:b0:718:2aac:b388 with SMTP id
 6a1803df08f44-739253e0931mr142411406d6.30.1757427160689; 
 Tue, 09 Sep 2025 07:12:40 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3380653144asm33874861fa.27.2025.09.09.07.12.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 07:12:39 -0700 (PDT)
Date: Tue, 9 Sep 2025 17:12:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Harikrishna Shenoy <h-shenoy@ti.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 andy.yan@rock-chips.com, mordan@ispras.ru, linux@treblig.org,
 viro@zeniv.linux.org.uk, aradhya.bhatia@linux.dev, javierm@redhat.com,
 tomi.valkeinen@ideasonboard.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devarsht@ti.com, u-kumar1@ti.com,
 s-jain1@ti.com, lyude@redhat.com, luca.ceresoli@bootlin.com
Subject: Re: [PATCH v6 2/6] drm/bridge: cadence: cdns-mhdp8546*: Change
 drm_connector from structure to pointer
Message-ID: <r4l4dayuhfdqbj3txtyvuffuffe2kxefbeq32pqu226ttwik46@wy23kgtqvfvx>
References: <20250909090824.1655537-1-h-shenoy@ti.com>
 <20250909090824.1655537-3-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909090824.1655537-3-h-shenoy@ti.com>
X-Proofpoint-ORIG-GUID: 0A5_ybIgJxnuL5I7LZAQXTAeEH3Flhu-
X-Proofpoint-GUID: 0A5_ybIgJxnuL5I7LZAQXTAeEH3Flhu-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfXzJV6MNoMh9ZJ
 +L+YAGV/zKRUHKZOPZRz8la8//imLemsSK7lGkW7YG9TMydH77nVbPe1iyoe3422oyQblxvEaZ5
 AfcFyZzm5F1BX53wUFoDXY2U9Irku3jB/iwEJ1ztlVLlDd2+hgWYEhm/ljSoEL6Z3DYphkuFVgD
 5Pxl3yCO747TfneMtSjBNg9Qo7giw7NX0m21wDAB2GUfX4JDH3GVPU8UwsZKAzewpIA07CIOJKJ
 uXGZvpKLOQP2zjCQQLQXhhv8ZKlgZ/z819dRTWX92lpbUP8wZy9VSirdBVjuUaqEPS5dM3FHZz5
 cH/+96vSPnjLp1lfTDHfo6ti1AGzWX8rOrYvQjgkVG4qBtqrisUJWMWi6kis/d18BaRKFtYJLSu
 iq1icZqC
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68c035db cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=sozttTNsAAAA:8 a=2Lv77nt56LAVqU4y0Q0A:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
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

On Tue, Sep 09, 2025 at 02:38:20PM +0530, Harikrishna Shenoy wrote:
> From: Jayesh Choudhary <j-choudhary@ti.com>
> 
> After adding DBANC framework, mhdp->connector is not initialised during
> bridge_attach(). The connector is however required in few driver calls
> like cdns_mhdp_hdcp_enable() and cdns_mhdp_modeset_retry_fn().
> Use drm_connector pointer instead of structure, set it in bridge_enable()
> and clear it in bridge_disable(), and make appropriate changes.
> 
> Fixes: c932ced6b585 ("drm/tidss: Update encoder/bridge chain connect model")

Same question. If HDCP was broken, then this should be fixing
6a3608eae6d3 ("drm: bridge: cdns-mhdp8546: Enable HDCP") instead.

> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 12 ++++++------
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h |  2 +-
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c |  8 ++++----
>  3 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
> index bad2fc0c7306..b297db53ba28 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
> @@ -375,7 +375,7 @@ struct cdns_mhdp_device {
>  	 */
>  	struct mutex link_mutex;
>  
> -	struct drm_connector connector;
> +	struct drm_connector *connector;
>  	struct drm_bridge bridge;
>  
>  	struct cdns_mhdp_link link;
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
> index 42248f179b69..59f18c3281ef 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
> @@ -394,7 +394,7 @@ static int _cdns_mhdp_hdcp_disable(struct cdns_mhdp_device *mhdp)
>  	int ret;
>  
>  	dev_dbg(mhdp->dev, "[%s:%d] HDCP is being disabled...\n",
> -		mhdp->connector.name, mhdp->connector.base.id);
> +		mhdp->connector->name, mhdp->connector->base.id);
>  
>  	ret = cdns_mhdp_hdcp_set_config(mhdp, 0, false);
>  
> @@ -445,7 +445,7 @@ static int cdns_mhdp_hdcp_check_link(struct cdns_mhdp_device *mhdp)
>  
>  	dev_err(mhdp->dev,
>  		"[%s:%d] HDCP link failed, retrying authentication\n",
> -		mhdp->connector.name, mhdp->connector.base.id);
> +		mhdp->connector->name, mhdp->connector->base.id);
>  
>  	ret = _cdns_mhdp_hdcp_disable(mhdp);
>  	if (ret) {
> @@ -487,13 +487,13 @@ static void cdns_mhdp_hdcp_prop_work(struct work_struct *work)
>  	struct cdns_mhdp_device *mhdp = container_of(hdcp,
>  						     struct cdns_mhdp_device,
>  						     hdcp);
> -	struct drm_device *dev = mhdp->connector.dev;
> +	struct drm_device *dev = mhdp->connector->dev;
>  	struct drm_connector_state *state;
>  
>  	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
>  	mutex_lock(&mhdp->hdcp.mutex);
>  	if (mhdp->hdcp.value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
> -		state = mhdp->connector.state;
> +		state = mhdp->connector->state;
>  		state->content_protection = mhdp->hdcp.value;
>  	}
>  	mutex_unlock(&mhdp->hdcp.mutex);
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
