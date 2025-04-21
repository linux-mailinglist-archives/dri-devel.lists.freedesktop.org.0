Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C8DA94F68
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 12:29:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 313AF10E368;
	Mon, 21 Apr 2025 10:29:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jV0IdRwj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB91210E368
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 10:29:48 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53L9pc4x022316
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 10:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=KKT4UeldcPZsh0FUZIH3yOLO
 5e214Tx1muuQ9yFoG2I=; b=jV0IdRwjp9pKa2mh3NT5XpgcVaV48hhJdz+5pQDw
 MCAQ5ZbceeAXv836fiY05lF3ToTH5jzv4useANuBj/cy2SwltFY8TcqjlUcebr/g
 tM2w5jurm72b1J5YbUS6azV8NN+9cXK/UmP5rq+iglRXnu/vS8Tc82X2VA4Mp0Vl
 mWGjX5qbptmmrQdotPxNq7ZF20Qc/GtcGoUsbWw9jX4ksv3ilqHJCjV6lvyFKE+U
 GNnzBxnXrm/ojOTdTyN60EcEwRzoYNEzq8xX3kFZ8yZr70IUGq99fYa8onW/kbuJ
 F7r4X/HjPqlZlhQ5BIgZGoVVeH+B5MqQbNhDxvJsnZju0A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46435jbx3j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 10:29:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c7c30d8986so1248309185a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 03:29:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745231387; x=1745836187;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KKT4UeldcPZsh0FUZIH3yOLO5e214Tx1muuQ9yFoG2I=;
 b=A5sgVxpEUw/ifrAChicFawmItfSdVr/EtSQAYJq6cG/vEc3Rtcy5HIcD0eYiS5gWcB
 wwS/CvTzTmNGDVINRLbnzvYge+eWXOpOAHn8ugmRVlsFuZIL2GTTm2e0cBaT97gGc0nD
 3o5Gu0BTTH+jJwKg7+y49C8qIT5XX54/AWZr7PVkBfG+U1f7kR02WSKvFiaqH5JVDCPh
 5+EsaJWZYYJ+0l4g8haMO8woQa77Euj3rdtRONPOWE0rch9SMbqwhbbu/JgmGlztAA3j
 WxZAxbgaDRs336IXspi57oibHAfYQl5rA2K+ZuC9kEbaNcjIdljnAIcxlCqlm4fe/0Vb
 G15Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5vHO3IT0jZGmQ2UyzhM5sLCRXhPJsvV6/kGTg7SowIcJpoFbUnH4znzDIINt9n9WwmvCv9eouo98=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRND9zJ3iGoGiVKLtUU1rBVe5FRHGuVpgTx5OcOlErVJOUCu4n
 9WqRMHLYRF07yn8/+XyI/F95KoIwUOeqQ6qCgyafgpt+nnChvtpCZupmziTMNckpI08CKUotc5l
 jrm5NlNbSGQct12ooyiw4xvqsCAfngHLtsh/2EaOeDemKkVG1Su823M+K8JD/VZ9mZrY=
X-Gm-Gg: ASbGncsi3EDJNagVKob/RV/r+WS1dFZ1LTA+wm1Vkl73JOSJhlBWFeGiB1Mjp0erggp
 qaeWzKcOp31fNLPxDU8E0awxT3msi9/LR169Ay8Q+gm5vA20qQ2dCcA875JSTiUWrrgYgcp6ark
 mTG13Dgu9vvy+3LCO3eng4YXMzm2qdk2va8YtuZVzlEXvu761yOl/WSAIb1sivSVfW3PXnWhjOa
 LyZebynRBJcukTUS5/aVhLJ5131GmEICEBajqDPQ71+zykWv/kBrLP++wIybl6MhlSc0NG2mzvQ
 lnMvAVvRzUPtY2+DKUe74L58hPa+1eIeGrDPLlcb3YrEjCpLAUzzYD+L5YGMp9vZrdMddWleJX0
 =
X-Received: by 2002:a05:620a:4621:b0:7c5:6140:734f with SMTP id
 af79cd13be357-7c927f804d5mr1880913085a.18.1745231387127; 
 Mon, 21 Apr 2025 03:29:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmhZhZ/AanwSlp6sjrsWKxdKlAy3sumUE6Kfu5ZPiFjLR1JWOPV6gulBvmvCqEYB4y0PGD/A==
X-Received: by 2002:a05:620a:4621:b0:7c5:6140:734f with SMTP id
 af79cd13be357-7c927f804d5mr1880910985a.18.1745231386728; 
 Mon, 21 Apr 2025 03:29:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-31090822a38sm11305611fa.73.2025.04.21.03.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Apr 2025 03:29:45 -0700 (PDT)
Date: Mon, 21 Apr 2025 13:29:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagath Jog J <jagathjog1996@gmail.com>
Cc: mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, mcanal@igalia.com, maarten.lankhorst@linux.intel.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC 1/1] drm/mipi-dbi: Use drm_device for debugfs, drop
 drm_minor and .debugfs_init
Message-ID: <lhjibofycex36n23edeb6m7uc4n55nqg4y3qdzoe2wdpc5twrh@ytyvawvgdhuz>
References: <20250421085907.24972-1-jagathjog1996@gmail.com>
 <20250421085907.24972-2-jagathjog1996@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421085907.24972-2-jagathjog1996@gmail.com>
X-Authority-Analysis: v=2.4 cv=EOYG00ZC c=1 sm=1 tr=0 ts=68061e1b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=tCZK0CnPNcU2-8zYRE4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: e_Qd5108wufijnarl15lyXqQ2QpL0z18
X-Proofpoint-ORIG-GUID: e_Qd5108wufijnarl15lyXqQ2QpL0z18
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 mlxscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210081
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

On Mon, Apr 21, 2025 at 02:29:07PM +0530, Jagath Jog J wrote:
> Refactor to use drm_device.debugfs_root instead of drm_minor for
> debugfs file creation. The driver can now initialize debugfs directly
> in probe(), before drm_dev_register(). This also removes the use of
> .debugfs_init callback.

Why? The callback was designed to add debugfs files. Likewise most if
not all DRM drivers add files under the corresponding minor node.

> 
> Signed-off-by: Jagath Jog J <jagathjog1996@gmail.com>
> ---
>  drivers/gpu/drm/drm_mipi_dbi.c        | 8 ++++----
>  drivers/gpu/drm/tiny/ili9163.c        | 3 ++-
>  drivers/gpu/drm/tiny/panel-mipi-dbi.c | 3 ++-
>  include/drm/drm_mipi_dbi.h            | 4 ++--
>  4 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
> index 89e05a5bed1d..66f292c48a78 100644
> --- a/drivers/gpu/drm/drm_mipi_dbi.c
> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> @@ -1488,17 +1488,17 @@ static const struct file_operations mipi_dbi_debugfs_command_fops = {
>   *
>   * This function creates a 'command' debugfs file for sending commands to the
>   * controller or getting the read command values.
> - * Drivers can use this as their &drm_driver->debugfs_init callback.
> + * Drivers can call this function before registering their device to drm.
>   *
>   */
> -void mipi_dbi_debugfs_init(struct drm_minor *minor)
> +void mipi_dbi_debugfs_init(struct mipi_dbi_dev *dbidev)
>  {
> -	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(minor->dev);
>  	umode_t mode = S_IFREG | S_IWUSR;
>  
>  	if (dbidev->dbi.read_commands)
>  		mode |= S_IRUGO;
> -	debugfs_create_file("command", mode, minor->debugfs_root, dbidev,
> +
> +	debugfs_create_file("command", mode, dbidev->drm.debugfs_root, dbidev,
>  			    &mipi_dbi_debugfs_command_fops);
>  }
>  EXPORT_SYMBOL(mipi_dbi_debugfs_init);
> diff --git a/drivers/gpu/drm/tiny/ili9163.c b/drivers/gpu/drm/tiny/ili9163.c
> index 62cadf5e033d..351d2a5b9f27 100644
> --- a/drivers/gpu/drm/tiny/ili9163.c
> +++ b/drivers/gpu/drm/tiny/ili9163.c
> @@ -115,7 +115,6 @@ static struct drm_driver ili9163_driver = {
>  	.fops			= &ili9163_fops,
>  	DRM_GEM_DMA_DRIVER_OPS_VMAP,
>  	DRM_FBDEV_DMA_DRIVER_OPS,
> -	.debugfs_init		= mipi_dbi_debugfs_init,
>  	.name			= "ili9163",
>  	.desc			= "Ilitek ILI9163",
>  	.major			= 1,
> @@ -182,6 +181,8 @@ static int ili9163_probe(struct spi_device *spi)
>  
>  	drm_mode_config_reset(drm);
>  
> +	mipi_dbi_debugfs_init(dbidev);
> +
>  	ret = drm_dev_register(drm, 0);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/tiny/panel-mipi-dbi.c b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
> index 0460ecaef4bd..94466dd8db9f 100644
> --- a/drivers/gpu/drm/tiny/panel-mipi-dbi.c
> +++ b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
> @@ -267,7 +267,6 @@ static const struct drm_driver panel_mipi_dbi_driver = {
>  	.fops			= &panel_mipi_dbi_fops,
>  	DRM_GEM_DMA_DRIVER_OPS_VMAP,
>  	DRM_FBDEV_DMA_DRIVER_OPS,
> -	.debugfs_init		= mipi_dbi_debugfs_init,
>  	.name			= "panel-mipi-dbi",
>  	.desc			= "MIPI DBI compatible display panel",
>  	.major			= 1,
> @@ -384,6 +383,8 @@ static int panel_mipi_dbi_spi_probe(struct spi_device *spi)
>  
>  	drm_mode_config_reset(drm);
>  
> +	mipi_dbi_debugfs_init(dbidev);
> +
>  	ret = drm_dev_register(drm, 0);
>  	if (ret)
>  		return ret;
> diff --git a/include/drm/drm_mipi_dbi.h b/include/drm/drm_mipi_dbi.h
> index f45f9612c0bc..88a9c87a1e99 100644
> --- a/include/drm/drm_mipi_dbi.h
> +++ b/include/drm/drm_mipi_dbi.h
> @@ -230,9 +230,9 @@ int mipi_dbi_buf_copy(void *dst, struct iosys_map *src, struct drm_framebuffer *
>  })
>  
>  #ifdef CONFIG_DEBUG_FS
> -void mipi_dbi_debugfs_init(struct drm_minor *minor);
> +void mipi_dbi_debugfs_init(struct mipi_dbi_dev *dbidev);
>  #else
> -static inline void mipi_dbi_debugfs_init(struct drm_minor *minor) {}
> +static inline void mipi_dbi_debugfs_init(struct mipi_dbi_dev *dbidev) {}
>  #endif
>  
>  /**
> -- 
> 2.20.1
> 

-- 
With best wishes
Dmitry
