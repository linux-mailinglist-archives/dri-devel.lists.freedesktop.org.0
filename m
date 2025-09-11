Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90290B53492
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 15:55:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72CE510E039;
	Thu, 11 Sep 2025 13:55:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mxfsiqAG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9145D10E039
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 13:55:34 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BAVr5c008859
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 13:55:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=1h697ZqjUksFxfyM6peNMIk4
 XzUxy0n4+6cZZ9aWNEU=; b=mxfsiqAGCbvUpJn1iEeWllTEG2aN/UQtn654lTeo
 NOg2Uj5HFFSb7nfen/1OVYytAZtYdg0SurRW75nEuSI46DrPXcaXDE9K0VtTRYo4
 HIazx+aDz2u+yj/mtgp4ZE7U6NbwoDVXlm6x8OjVMyxp2SsZa1KnL+OQQkmls2L0
 nyt048Kl8ebLFSRSbpx7br8Sq7T5UJh5q5+QVAJHoJK5AMbr9630qXffUq0N/K5S
 asEfaUuJ6O9tN9Kjn2kh/YrSnTNky6Avpa1QygJMCPcgJweGSrRFRFBaAdFyYJCs
 eP86crFmU3ZCghAhyBOl/EYtlpKWQhCdAi6CuuB/fOJKYg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapr594-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 13:55:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b5f818eea9so16520391cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 06:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757598933; x=1758203733;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1h697ZqjUksFxfyM6peNMIk4XzUxy0n4+6cZZ9aWNEU=;
 b=LqcHFkgQjxgqXdDSS3gB+h0IAL7PoeKL2CqNcD/hYdwSv7LxLGALuWjcyRy6BVqrN+
 ZnnrYU+JsbpAzvGim0cdMr+NvauyrriMOK1T2nK97ZcoHD/wuVWUVDxtnnSq98axFndx
 b7ap7UqA8+6jWJYAcD1m4701j49KQ2JAgfimm7L5fZMlEIStmr0sUav05M6VEyRTb5wE
 lkbHE2cattl8T4ri9Jro/gOOdws+CxO/P8a0C9k4aruRbNx1bNdiFPBqBgGYtP5feYwW
 IaXeeqE24N93k8O2f3A0u8pbeiRQfKFMbqq/SN5hOFuMgvPMxQhNg2G+P7DTMxnJAqNa
 aqlA==
X-Gm-Message-State: AOJu0Yz6vV/qKX4hhpRsUrTqCuveclvP9Dg9fbH5fq7j+XUx5WSle9T7
 9fs4zaZIdG7fA0Cc0HMSEeOGKstNN8+u53sSQn2cSjcnVDUC9KeKUOQjA0zj43Kx1soJy44M6bR
 x8XfUOUK02t36jrdfGZ1hD9zCNW7kwiks0yWlOITlZIloYL/yWmHikBcP/vc3WmQzZsYF9fk=
X-Gm-Gg: ASbGncshSFW+pPqlRocYvz+3m9CqlakHjSziOxnbtjBz1WbdosTB1v3LOrxxfcWrY7Z
 AbdGrny1f294h7j9jH0PN4iesZo1inJJErGmB16KDUaahhcjTabCGYtovK/0lpJdkx7xkb/yLZr
 A/88KjcqVNFhUfDJQuHx9LBk9ZH2fULYFuAe8Je3WcgXTWk18X+Thf7Tlkb9j4raih+MpfWZrVk
 KlgLV3DduAdHNgFxx96aQtLGdt2A2auhIsCom4uz0DIDiB+jzzHz5TboOdLOs8dJHsHNTj8Raoh
 229DTnAmBIT7SkmOv5Gqk1y3TS2OJe0loT6+k4K8zqwGJMQw+iUKpDlTtJRILKIn25aiftQbvYp
 3N2QFWoarUdEcK4dOlBc5dcsRyD/ZjkCP6LynOSJ4G++dyuVNhoui
X-Received: by 2002:a05:622a:5508:b0:4b4:989a:a292 with SMTP id
 d75a77b69052e-4b5f83907dcmr204654311cf.26.1757598932665; 
 Thu, 11 Sep 2025 06:55:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLWx6sVdwKoPXZ0ANYTebAEU5SboCYIrzh0Jv/lJCCY9EdWIyJTQXb/FAO6vAZIrb2n6Lvhw==
X-Received: by 2002:a05:622a:5508:b0:4b4:989a:a292 with SMTP id
 d75a77b69052e-4b5f83907dcmr204653821cf.26.1757598932109; 
 Thu, 11 Sep 2025 06:55:32 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-34f15a58316sm3285611fa.8.2025.09.11.06.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 06:55:31 -0700 (PDT)
Date: Thu, 11 Sep 2025 16:55:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marius Vlad <marius.vlad@collabora.com>
Cc: dri-devel@lists.freedesktop.org, wse@tuxedocomputers.com,
 andri@yngvason.is, sebastian.wick@redhat.com, mripard@kernel.org,
 daniel.stone@collabora.com, jani.nikula@linux.intel.com,
 tzimmermann@suse.de, simona.vetter@ffwll.ch, harry.wentland@amd.com,
 christian.koenig@amd.com, derek.foreman@collabora.com
Subject: Re: [PATCH 5/8] drm: Pass supported color formats straight onto
 drm_bridge
Message-ID: <fekbw2ngxyg4mvkhlvkvegylcm4vm74y5rhhxeygiqxve7oqaj@sxvkyqjssdru>
References: <20250911130739.4936-1-marius.vlad@collabora.com>
 <20250911130739.4936-6-marius.vlad@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911130739.4936-6-marius.vlad@collabora.com>
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68c2d4d5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=QX4gbG5DAAAA:8 a=OJ2ymaVjJATJ6jrywfoA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: RYE1zxkfV3pdnySKjry3zjP05nJHk8Tq
X-Proofpoint-ORIG-GUID: RYE1zxkfV3pdnySKjry3zjP05nJHk8Tq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX0FNWa8eljzff
 vYZ7XtbS+TxbWeJ1oWRajD1YIcEkkYCvKzdMRx+G33ZQoOxNVECXQLPSLe4MgQRni8bkhw7DbS4
 DHw5H52R/KE5UoN1xKEVNc/wzD3vfAI12WvfZ4IsjCUDfKPvfIn8Di3vBFdkm0uJ8CR2OvjcOtw
 jtCtMmRWu0xYVWkthgVi1qO1DxgfGCgMl21qkR90QGyKMJwODHL1Z9IWv8Y5Fjiq71QaiYt5T0t
 GUkRJ2hVnzNaUEn6hVE1Fmg3p/F/eSdaQ8NCjKQIF899D//j8RdnuEqQM2K2UOa+MGrqAxqGoRW
 cfu4j/J8JJ7rBYf5ppyoLuZM1fdrEliMNMNeNhEvL0DBhH+pV8q/j/Xm2pCZ3yx9hiN4DW4Kt1D
 ow+ZZs63
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000
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

On Thu, Sep 11, 2025 at 04:07:36PM +0300, Marius Vlad wrote:
> Initialize drm_brige with advertised colors formats straight on.
> 
> Drivers that make use of DRM helpers would check the
> drm_brige::supported_formats bit-field list and refuse to use the color
> format passed. Drivers that make use of drm_bridge can pass the
> supported color formats in the bridge as well as supported color format
> for the DRM color format property.

Your commit message doesn't match patch contents. You are pushing format
selection to the instance creating drm_bridge_connector, which
frequently has no idea about the other end of the chain - the bridges
which actually send pixel data to the monitor.

We have drm_bridge::ycbcr_420_allowed with clearly defined meaning. I
think it would be wise to start from that and to describe why such a
field doesn't fulfill your needs.

> 
> This includes a fallback to RGB when Auto has been selected.
> 
> Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c      | 2 +-
>  drivers/gpu/drm/bridge/ite-it6263.c               | 2 +-
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c             | 3 ++-
>  drivers/gpu/drm/display/drm_bridge_connector.c    | 4 ++--
>  drivers/gpu/drm/imx/dcss/dcss-kms.c               | 2 +-
>  drivers/gpu/drm/mediatek/mtk_dpi.c                | 2 +-
>  drivers/gpu/drm/mediatek/mtk_dsi.c                | 2 +-
>  drivers/gpu/drm/meson/meson_encoder_cvbs.c        | 3 ++-
>  drivers/gpu/drm/meson/meson_encoder_hdmi.c        | 4 ++--
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c          | 2 +-
>  drivers/gpu/drm/msm/dp/dp_drm.c                   | 3 ++-
>  drivers/gpu/drm/msm/dsi/dsi_manager.c             | 2 +-
>  drivers/gpu/drm/msm/hdmi/hdmi.c                   | 2 +-
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c | 2 +-
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  | 2 +-
>  drivers/gpu/drm/rockchip/cdn-dp-core.c            | 2 +-
>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c    | 2 +-
>  drivers/gpu/drm/rockchip/rockchip_lvds.c          | 2 +-
>  drivers/gpu/drm/tegra/hdmi.c                      | 2 +-
>  drivers/gpu/drm/tegra/rgb.c                       | 2 +-
>  drivers/gpu/drm/tidss/tidss_encoder.c             | 2 +-
>  include/drm/drm_bridge_connector.h                | 3 ++-
>  22 files changed, 28 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index 9a461ab2f32f..8d5299849be6 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -368,7 +368,8 @@ struct drm_connector *msm_dp_drm_connector_init(struct msm_dp *msm_dp_display,
>  {
>  	struct drm_connector *connector = NULL;
>  
> -	connector = drm_bridge_connector_init(msm_dp_display->drm_dev, encoder);
> +	connector = drm_bridge_connector_init(msm_dp_display->drm_dev, encoder,
> +					      BIT(HDMI_COLORSPACE_RGB));

Just to point out: this is wrong.

>  	if (IS_ERR(connector))
>  		return connector;
>  
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index ca400924d4ee..4b87f4f78d38 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -479,7 +479,7 @@ int msm_dsi_manager_connector_init(struct msm_dsi *msm_dsi,
>  	if (ret)
>  		return ret;
>  
> -	connector = drm_bridge_connector_init(dev, encoder);
> +	connector = drm_bridge_connector_init(dev, encoder, BIT(HDMI_COLORSPACE_RGB));

And this totally depends on the bridge chain. If we have a DSI-to-HDMI
bridge somewhere in the middle, we are able to output YUV data to the
HDMI connector.

>  	if (IS_ERR(connector)) {
>  		DRM_ERROR("Unable to create bridge connector\n");
>  		return PTR_ERR(connector);

-- 
With best wishes
Dmitry
