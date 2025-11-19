Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 451E9C6D281
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 08:36:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9B010E598;
	Wed, 19 Nov 2025 07:36:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CmA+dQ8C";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BGYuLRNF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522B810E598
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 07:36:23 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AJ3cKJd536943
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 07:36:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=b2fJw1Fwo1X18bw+iFRPNcjg
 skw8RlhaPnqMy2U+zDk=; b=CmA+dQ8C28DdnSv9JWNVNc8+2UzqdTunaSWniQxQ
 h2Rdqug3UdbGHETbZQP9dkFAjzz3Xi5rej0aUU5/NadLklP3jccJgRGDKBuKTsQY
 Fl2HxA/zKo1x+Esxinr4hteVaYGM8uhwdkThJbl8xiybl6MOyW3H6WbPCNWeBuVr
 mTuVhFPAMO1JBGwZPB0jGih+mKR716g+kdoBaJHWgYQntJU47wlxE00cbaI9ZgJI
 WyOjK4aiEzVeMEJMbU+TjEB95j7vudDo22kEGVJz5ErP8j+bAOOksjjYpmCwhoWn
 otowhVUDkQUlnvcC4mbZVuf25zOFR0luo7BWigFSM3914A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah65t0kqd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 07:36:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-89eb8ee2a79so1226611885a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 23:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763537781; x=1764142581;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=b2fJw1Fwo1X18bw+iFRPNcjgskw8RlhaPnqMy2U+zDk=;
 b=BGYuLRNFQXD5oQLDp2yrLSLNgDdyfZU9PVClQJ66DpgNHBqx23OXccLqfgITJl5hLk
 LHiAkL5edB9GGtH6+qPUYwv9ama4ZJqq6kEGWzKdca5I76gn+JVXUdb+Cny3EgTm2VUr
 wOLAU1q+T6SGJLUpRWC4+lF4iNyyke40FccPWvVaBHdWCtiqwQaKSJHwro3NheVP4686
 PVcFs3SKtWEyXRoWYay6rzS0MSh/kRjX8m4qmMvcmOA32M1P/QXzC74xeZnJ72qnNcfU
 toekt22YkPBAsOUww0Mom0cPDAA7kN8kWXWXJwATP5eu2h5OA2MjGafTzV3Tx0uLJpG/
 kAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763537781; x=1764142581;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b2fJw1Fwo1X18bw+iFRPNcjgskw8RlhaPnqMy2U+zDk=;
 b=DdBJPtJo6t0M4v2e6EO+lYFUQmKUJ1wRwWczYIqDq1x+FO/Ms3uKngcFWyyrQnYG/4
 bp9Q7jACf0RnEBthxuwWaRNBOqPIUSLMAOo7il4aLZk0+aO+C1glFr7OdTDg0XCvGkcj
 u20QbdPasKRmPxzzRDjc/M9cZVMmYS5EyIIfqnFjDc9b7CRRd3BRO0z+PIybVz9iqOhy
 oOkWEw7XtZY5jDpHZ1cZUPGMDwBsGKYUlJ/eF2mWcKbLefIq8z9LFJ302QRt0eXK4jWP
 cxgRnkA2NPidDRYSzqwe2/LnzcBCz+gyQxgZ79rS8aLNMp1XS/PgflqmueqDEz3+c1yr
 Lgiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6eDEWd1M1hKGdcs8mdCZ35GbmDmopTnNSXhUxugKIK/UgwxcWVv9wEttuvGdWfoRvjJVYjVVjRz4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2Hq5g8mbbu8VkiZTRrAdAkdfq8k8XylsLAVsPOkacsDKpIgNp
 bwKxctfokbMYXUTfGeuEZboSVccFbZ6sICbGxClgwF4vuYFSoZEhIHArQGh4f9YE6WA4eLzYmy/
 D3GpZj+bk/Ky5YtHqTOL27bf6wAQGdHd9H7jCmvH3g5QNXPdcvUsHPB5X5M7ZZwpS8xT4SiS8oJ
 e4mUc=
X-Gm-Gg: ASbGncvoGiXnl4okdx0nt8/iG0yxpi942/IBqltYELkB3l9cDPGR3RpwAy4I3CI3fjI
 m6kKu375120ui3TKCNT/2g6vPVILJUGBxrOK2ebUDvSKA3FH7jSlgui1tt6dnSBOYm9aj/p3lle
 WpuiPcaXB9t4+JlkTeKvjFeiDODg9pLCPVuYUgVVCwws76XGIMXNU/Sqk+oGkQJYathBo3hDZvk
 l0dGHB1uu+urfOyLbGJKjxyL2O09dxAWpwxR82EgEjU/V8sWBCFj83PyW60Bj3AluTATdbkxmwD
 3tmjESOslxwo7BFZ52ejli29mHgz1xV/vwmvFw/mjGf+xc/2tqkGzMjIwdcF3r6oYIq2gcZ6d5F
 hpQOnKYmetVT9p+s8rugVW2kuO97lbQxV8OULhY8rrJ1OIZQCw+/xXKJ5sOjfTtG6rZbH+nmNMS
 fViSG1Rg46wbBvgo4jaRAnR0I=
X-Received: by 2002:a05:620a:1990:b0:8b2:730f:134b with SMTP id
 af79cd13be357-8b2c31af190mr2305952885a.50.1763537781443; 
 Tue, 18 Nov 2025 23:36:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUkKb4mpp8eMpxhGiHmlERrpybKBET9nRQckVHp59VNmMM7vOmHFeS0Znq6PQENMcfVRvoNw==
X-Received: by 2002:a05:620a:1990:b0:8b2:730f:134b with SMTP id
 af79cd13be357-8b2c31af190mr2305949585a.50.1763537781003; 
 Tue, 18 Nov 2025 23:36:21 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-595803b8bc7sm4426694e87.46.2025.11.18.23.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 23:36:20 -0800 (PST)
Date: Wed, 19 Nov 2025 09:36:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 phodina@protonmail.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 3/8] drm/panel: sw43408: Introduce LH546WF1-ED01 panel
 compatible
Message-ID: <mhybllmkinoaa5z4de5wxrcu5oudg3xyxsnktfn57u7ryas74d@cph7cfasciyi>
References: <20251118-pixel-3-v3-0-317a2b400d8a@ixit.cz>
 <20251118-pixel-3-v3-3-317a2b400d8a@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118-pixel-3-v3-3-317a2b400d8a@ixit.cz>
X-Authority-Analysis: v=2.4 cv=avK/yCZV c=1 sm=1 tr=0 ts=691d7376 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=-kFX126oTHwKP8aA0KsA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA1OCBTYWx0ZWRfX4CfngUtr6IPH
 MFkgZDfTIEmrRGTSQriqQepB5hLtcrH4eR2lUsPu2lMeB3P0wmR6CKvDdm3dXSMIHHifaMixRRp
 IVwyLPuvfszHAxpCs0YX8zhqqssS+blN9iqqjLkZ62vp+38c27xeMVx8wuc9zcu5lgpnzN0/TQa
 33ln4OQajzLzW43p2ndZZPAX4wj6wOu91x8DwUVJmOtXNtkPQ6/ydhs44bkJuu9oHSI12vPe5is
 W2cx2ZRPoMPbWsiHyFlF3whu258SkEFrDwMCwp4DWMpLIj4QxZRZo1vg5sKM9dinpS6pXhH6qLU
 mRHPXhYMbiNh7ynozM9Nx4461zG62caXD7NTEWCGqxyi9PISG077PEPpy1kavrbNCqfAeJOfl3T
 NgPnvYF1pvhf/GLVbJl1Eq+7aKS5Cw==
X-Proofpoint-GUID: 4y_tYT0okl7pt1oRQ1Y83OECqjmNn3db
X-Proofpoint-ORIG-GUID: 4y_tYT0okl7pt1oRQ1Y83OECqjmNn3db
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190058
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

On Tue, Nov 18, 2025 at 12:30:38PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The supported panel is LH546WF1-ED01, add compatible and adjust the
> struct name to reflect that.
> 
> The standalone compatible lg,sw43408 will continue to work, even thou
> there are no users yet.

.. no users _left_ ?

> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/gpu/drm/panel/panel-lg-sw43408.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
> index 46a56ea92ad9f..bd55f6d8f2771 100644
> --- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
> +++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
> @@ -149,7 +149,7 @@ static int sw43408_prepare(struct drm_panel *panel)
>  	return ret;
>  }
>  
> -static const struct drm_display_mode sw43408_mode = {
> +static const struct drm_display_mode lh546wf1_ed01_mode = {
>  	.clock = (1080 + 20 + 32 + 20) * (2160 + 20 + 4 + 20) * 60 / 1000,
>  
>  	.hdisplay = 1080,
> @@ -171,7 +171,7 @@ static const struct drm_display_mode sw43408_mode = {
>  static int sw43408_get_modes(struct drm_panel *panel,
>  			     struct drm_connector *connector)
>  {
> -	return drm_connector_helper_get_modes_fixed(connector, &sw43408_mode);
> +	return drm_connector_helper_get_modes_fixed(connector, &lh546wf1_ed01_mode);
>  }
>  
>  static int sw43408_backlight_update_status(struct backlight_device *bl)
> @@ -214,7 +214,9 @@ static const struct drm_panel_funcs sw43408_funcs = {
>  };
>  
>  static const struct of_device_id sw43408_of_match[] = {
> +	/* legacy */

Nit: I'd read this comment in a way that both entries are legacy. Would
it be possible to adjust this somehow (e.g. put legacy on the same line
or extend it, explaining that only lg,sw43408 is legacy).

>  	{ .compatible = "lg,sw43408", },
> +	{ .compatible = "lg,sw43408-lh546wf1-ed01", },

>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, sw43408_of_match);
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry
