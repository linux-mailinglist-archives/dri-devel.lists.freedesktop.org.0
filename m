Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A153AD1208
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jun 2025 14:47:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 749B610E010;
	Sun,  8 Jun 2025 12:47:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dx8hJnb6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D099610E1E9
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jun 2025 12:47:28 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558AN0if030317
 for <dri-devel@lists.freedesktop.org>; Sun, 8 Jun 2025 12:47:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FtzvagP+ojVDO/HcnHcU2k2JnIiS/sqFpa0Po2l+OrI=; b=dx8hJnb67AaSVgNf
 ZNt6nfP82tP2sivY5qX0m4NL5zHC5zC8/esLnD4S1EHW/TdB2ztkOgZsXeOE14D5
 3/5/Papry/A69vfjE96VC1uRqqhqRn4DOibdHxQ96/MSur9QvEWGkBFTqbtV4E0h
 nmgCNE/NzKDDbawvw3sCsUQ1tBLaO7HwCue9AuEwN2h1JmHRVaIUAlf2PeXA7yaY
 +xdpTR1wxtzAnDtJHoI6vRM6KmpgHFs+Ktm1r63eZs/5BhgH/lQUQuZQI101bp7t
 6tE2lQczs9qyhTx7G2mlDE15vbIRG1mYyqcSiWbA7bJi6NEp8XsH+hkGoj+wxsH/
 /m+2NA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekpjmnu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jun 2025 12:47:28 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6faca0f2677so100280696d6.1
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jun 2025 05:47:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749386847; x=1749991647;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FtzvagP+ojVDO/HcnHcU2k2JnIiS/sqFpa0Po2l+OrI=;
 b=HQr0ptiYIk4E/3XWzGTxW0HZnVvvtBkerCNfuuQdhyKThoaYGzUsA0iN5qfhkmjiTJ
 hBcGJ3OuOgF1LRrC69cyGuDz+kJVBbfAx4hSc+5G5tOQ53tUnGieiGXhUPUQQP4ePJ+A
 2aS8mpWHwXeJUn9HV+OgImM2w5d/86UjWVM/JohzJfTPVDCKNpvu40kjzvrmw4KJGl6S
 iqC5CHHVXrIj3WyWBAzX7G1NzhTPKSZ7RdEdMHxPiyOnBmZxs8nsEPOXc/IEqBQE802D
 /+Vif7E2HL4MGqHUjk4jx6YSxpVlRTeNTD/J/IqBLFihBqKRKEEiqoHRCgVFJnz2rPE1
 BTUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWx/uj6zeL0mYZ+qB2PUNUuT7/VlDY0GYI+9wKKx2b2qy11Hv1Gx6HG4AztGaBpBAgnzMeN19T6ohw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxA1L8Fb6IcvDh8s5JpJWPqFy2QHE1uTxKYmdb+kjBLJ6SCzyRK
 CR77epAFi8iK7TqBnTrAVFGUY3wnz6pBphWAR65YPqF1G6dI1Kx7pjhnLghRm0tEEkUwKWxkkfn
 GMkqBkZNayiUzJlsrhTHuHGT9b6lAryQqe3p44xVbtgHzdO4/TwlUiijuEB7pNzL8uD7dPHU=
X-Gm-Gg: ASbGnct0CJuXrPgU2jtd65skKQZ4Ig8iS/hHgnvPkbMY8JlZljixKwRDF1VhFbTttSU
 5eEPts3xygEpF2Uo1B0AXHTI4L9CK6zDljZ9ax58UBoOasj5ldfiRdz+F+8QSGMTh0I0lKktoAJ
 Ix3Tk9QGdp8N65dm89nceUIjmwJaxkpQIGLFr91atf36kYOmUL/4KyvIoqRBlsVMUUcDZVWuzJq
 kMfFy0asEgfdBQp0eWzrZMhDJ1t/o3X04THx+mbJ6RS7zmG37n80/K+a2lnIITkUXSclie0f+cs
 Go67wuCC9UsvIyS3V8/sVbwWQlmSGZQAxYwDsatg1GPPOIqMUtg5cdnmLkL+X8NMwST1uHZT1OV
 VQlDlWUsBvA==
X-Received: by 2002:a05:6214:29ef:b0:6fa:fea5:4d7c with SMTP id
 6a1803df08f44-6fb09057dbcmr130135256d6.40.1749386846881; 
 Sun, 08 Jun 2025 05:47:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEki7LMROzmgW218EZLkb0KCWkTUAXONFilomWwrdXcxbx64sPstNyw31il0lfR0U8RVhedSw==
X-Received: by 2002:a05:6214:29ef:b0:6fa:fea5:4d7c with SMTP id
 6a1803df08f44-6fb09057dbcmr130135006d6.40.1749386846493; 
 Sun, 08 Jun 2025 05:47:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32ae1cab69esm7248801fa.52.2025.06.08.05.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jun 2025 05:47:25 -0700 (PDT)
Date: Sun, 8 Jun 2025 15:47:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com,
 shenjian15@huawei.com, shaojijie@huawei.com,
 jani.nikula@linux.intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH drm-dp 09/10] drm/hisilicon/hibmc: fix HPD no showing
 with VGA para of GRUB
Message-ID: <5nansqkys4d3wlsefql6itgnpdoxhgjo7kkmovpm3gfbphxcs6@4anxx7hzoimh>
References: <20250530095432.1206966-1-shiyongbang@huawei.com>
 <20250530095432.1206966-10-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250530095432.1206966-10-shiyongbang@huawei.com>
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=68458660 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=i0EeH86SAAAA:8 a=fAYD1edJq5gPyj3QMjgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDEwMCBTYWx0ZWRfXzMMNjg3qQvzo
 on1mctbI1ghF5dsg+xZEWUDyxORVlar9pHhOMDlq9dL6dIU1JM2oYxGK8OD7O+mMTyND1CS9sXm
 tdQttojE3+9pj46Lpmv5x/5GnUQzSHz1OVjoawnVlC/jrNOO9EcTJxXUvhnXC9D0zPoy5ZbhAkS
 euegIcJrY6NJkbmkticzN2LqHGDsECMQRJJlLyCTb/mVEs+vPN35uOUkSk8jumT9QcLAZEixD6Y
 wPCeWmPOXw+LwSmQnc48+EviuOwq5LHj+caxulKN9DpE0WfbQk2y591+etwvt00CeffFlNaiWZ9
 nfxytSTpy7a+CEKvh3xIMs8ZSdkpjygbVqpv7HR+HRLNjCaB3dsbwkSDE1v050IcR7FX+vSi4oz
 HBZ3csH5ngP/JiNqrGjk4FA+BCMiHXwfwvsf5xlGIl7w4/m+WA6JvlCC3Yo4uk6mavXhb2uM
X-Proofpoint-GUID: fV1zbZvcCctDz6CD6zQ-I7UhK64GaTw8
X-Proofpoint-ORIG-GUID: fV1zbZvcCctDz6CD6zQ-I7UhK64GaTw8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506080100
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

On Fri, May 30, 2025 at 05:54:31PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> In early OS versions， there is a bug in hibmc-drm driver previously,

Which OS? What does that mean? Why do we need to workaround userspace
issues in the kernel?

> so some OS add a VGA parameter in GRUB(video=VGA-1:640x480-32@60me) to
> fix the bug, that will config a force VGA mode to drm driver. However, the
> HPD problem exists that mentioned in previous patch, so change VGA's status
> in force() to compatible with some older OS versions.
> 
> Fixes: f9698f802e50 ("drm/hisilicon/hibmc: Restructuring the header dp_reg.h")
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> index 73dd3d5fc26c..d609ccda2f2a 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> @@ -61,6 +61,19 @@ static int hibmc_vdac_detect(struct drm_connector *connector, struct drm_modeset
>  	return connector_status_connected;
>  }
>  
> +static void hibmc_vdac_force(struct drm_connector *connector)
> +{
> +	struct hibmc_drm_private *priv = to_hibmc_drm_private(connector->dev);
> +	struct hibmc_dp *dp = &priv->dp;
> +
> +	if (dp->hpd_status) {
> +		connector->status = connector_status_disconnected;
> +		return;
> +	}
> +
> +	connector->status = connector_status_connected;

You are again trying to tie VGA and DP status, so NAK.

> +}
> +
>  static void hibmc_connector_destroy(struct drm_connector *connector)
>  {
>  	struct hibmc_vdac *vdac = to_hibmc_vdac(connector);
> @@ -81,6 +94,7 @@ static const struct drm_connector_funcs hibmc_connector_funcs = {
>  	.reset = drm_atomic_helper_connector_reset,
>  	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +	.force = hibmc_vdac_force,
>  };
>  
>  static void hibmc_encoder_mode_set(struct drm_encoder *encoder,
> -- 
> 2.33.0
> 

-- 
With best wishes
Dmitry
