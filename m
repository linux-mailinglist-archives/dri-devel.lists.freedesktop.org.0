Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6946DB20544
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 12:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5697C10E421;
	Mon, 11 Aug 2025 10:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pWvBRDlF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C2910E421
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:26:35 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dBcO013103
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/4tDhgxFTFm32rKj8OsdQCqN
 y65/pv1+di1cZhSEdpw=; b=pWvBRDlFziWWj5HuLW6H45HJTcZttvz9ESkLk0uM
 NtbaIchPIMRUyLPnyIR695bRbOQWNCjwWRwgAk98kCYBnBk2qh5jQ9es6go3Dgpg
 SX0ssCGAI/alg9bRIIxq88G2InB6hzr1moD5U2QhV8hcyL7P2ZOnVtuws4dAJudD
 P4Vl5Qf8a60HnW3Xrnv7Nj+bn70KreoYJvyxCBy2nKp1EHBjp1VEjRzZoYaV7NRR
 wr8dg/RegWDNJIexQISYO07Ju5oRebJOEov79b/yNy4tD2rXH16OGqiewyhKLbnP
 XhaGft8cga81AclHPne3cWxWUUNOydlCvoPt9MBVsTVZ1A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dupmm4u2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:26:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b0a3557d05so87815771cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 03:26:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754907994; x=1755512794;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/4tDhgxFTFm32rKj8OsdQCqNy65/pv1+di1cZhSEdpw=;
 b=ZMzGtxsgClwF0WacpDFC4ezHZMvPji5kURxd3ynHRj1s9vad+ttqVkKCq7t1c4yybb
 Z2syd4laIDuEiG9gho9c7KLmXY1jfJf9J4RA1VbdgXBJy2gI4wL2FQKy82ysM4qZU/1H
 nzTIWj1JF3tMYVhACCA1zmy1NbplIjTqMtb1HsNWICB6o28nBs64jajLC+HVWGrt1YT/
 nGkU9bFbbJsV4X/L/XpPaE9hUPK3ZRBKxIo1vWhPLKoejS3Os+bPQ+qzGTUb5AE1w844
 qRtlAIbVx2kEc/7t6MQxzpHSqbhNSesSUOmup+IEhhV9hAG7agXsdtZhgTxvnunR3oB0
 Pofg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHqA+v1Tim/pszbslmOQzcldiY7fqzCu3wv1tzL2QXhp+H9foYHWuUkR7HkZKz9gzwXLnZXa7bF+I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3Z376UXpT7gmkyC42LHgEKI/F0Agrdln6EKuUAEksw+wb61n7
 jIpsryKC69Qz9IuDWDB4deo/z5JhGiegP25/b5HTd7ySmcUnGG7fO5qKq7r/tDwhpGH9aWUkmu4
 t2WSPoBk2TZG6WUb2fYjTn7C/dPMtKOfmVoika3XMIW9xnQByTDf/LTKBQLjj3up38HGOXdg=
X-Gm-Gg: ASbGncuP3lxkFB/FzYlBHBKWWs1UJAe93grZtv6va0VckbqmAjjJnjnsOsvWDfvwmM+
 mGop5QS3zbDlTFWowEp+PgagJmLWgiEbj+NB+/IcpN/vptSBG3A+g61PZLYv1uAEBgvDMXjD+rS
 oT3lRffz+lYGLjaOY15CJnhmVhOfx7DdoKC1SDB58bE0/9CarHpSAPaDsb+e+5znt9MSt0Kw+nc
 pzoI/beQrRFv7nafqIMZ2R9sTW1XE3h9clcirj6RqgHAczl2fpPgZpY+EOZw3rgNsr7qN/Vf+69
 eSNtCg4J3uL174LiIxNo9weHCC8thEzWuMRu+k7gy01dgH3fvPtyexHZUV75MpbnCk4SowsxZLo
 cDCxSCEs9IahLAegkORU8saJkG13I+Nd0qDdfX6nv4OtN+54wCGgE
X-Received: by 2002:a05:622a:ca:b0:4b0:80c2:6674 with SMTP id
 d75a77b69052e-4b0aec9df57mr160251251cf.26.1754907993654; 
 Mon, 11 Aug 2025 03:26:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBtZfXQ4QunBGnECg8IgNPTThfg2oORkBUD9GYQsf+7kkjIYq2XXmXZ3mbOFg4UkIpF+IRdA==
X-Received: by 2002:a05:622a:ca:b0:4b0:80c2:6674 with SMTP id
 d75a77b69052e-4b0aec9df57mr160250851cf.26.1754907993170; 
 Mon, 11 Aug 2025 03:26:33 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-332388fef31sm41894971fa.70.2025.08.11.03.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 03:26:32 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:26:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: kernel-list@raspberrypi.com, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 arun.r.murthy@intel.com, uma.shankar@intel.com, jani.nikula@intel.com,
 harry.wentland@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, robin.clark@oss.qualcomm.com,
 abhinav.kumar@linux.dev, tzimmermann@suse.de,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org,
 laurent.pinchart+renesas@ideasonboard.com, mcanal@igalia.com,
 dave.stevenson@raspberrypi.com, tomi.valkeinen+renesas@ideasonboard.com,
 kieran.bingham+renesas@ideasonboard.com, louis.chauvet@bootlin.com
Subject: Re: [RFC PATCH 8/8] drm/msm/dpu: Adapt dpu writeback to new
 drm_writeback_connector
Message-ID: <ag34es6qm4b22qti4hbsju6sk5ny7ixq5fiwtni22vf7tvx5ba@ficntlx6i2hs>
References: <20250811092707.3986802-1-suraj.kandpal@intel.com>
 <20250811092707.3986802-9-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811092707.3986802-9-suraj.kandpal@intel.com>
X-Authority-Analysis: v=2.4 cv=bY5rUPPB c=1 sm=1 tr=0 ts=6899c55a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=Fxrl8DOH8qgm06HfJ5gA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: FXyBU6-qQn-kIM9qmR7Ncqa1aAdstTfR
X-Proofpoint-ORIG-GUID: FXyBU6-qQn-kIM9qmR7Ncqa1aAdstTfR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMCBTYWx0ZWRfX7+qR2GwJFJoU
 kapcQ5GhW35I8lDbXvnBIPYiEsGflj2TH7uwRb++Pi56kst8MI3r78ENk2y0ud4nEZROM91EwsI
 oHUvCl0u5j6V/lL303SAKOQrkFiCskfC+jDYShfSVnw66MjI6HkwyoscumeTrcGemkU6bomLrjv
 WzGDDUMun+ASHMETpkkznlYW3Q4rX365QsH6pRsmTH5Umxm6f4RbPHQplhEpj5b9KJ9AbdZ/OOC
 ooT8yNvqcglJTTpPxEyQNc7buq81vYvzq+c+lvSgaO1wf/jv4Zv4Svrs3FFxrrJUmXc+5qwpQ5W
 KsU6hSsQcWcHFgymJ9wvsH0shzmSALAt3h/SOo40Azt0NyBl/pwah8FvhTNBrNLxMv1axc4hzOq
 i5HFsXCe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090000
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

On Mon, Aug 11, 2025 at 02:57:07PM +0530, Suraj Kandpal wrote:
> Now that drm_writeback_connector is embedded with the drm_connector
> adapt the dpu writeback functionality to this changes. This
> includes changing the drm_writeback_connector to be changed to
> drm_connector within the dpu_wb_connector.
> Some other changes are done which are a result of the all the above
> changes mentioned.
> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c  |  3 ++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c    | 16 +++++++++-------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h    |  4 ++--
>  3 files changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index 56a5b596554d..0e60c1ac07c5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -484,7 +484,8 @@ static void dpu_encoder_phys_wb_prepare_for_kickoff(
>  		return;
>  	}
>  
> -	drm_conn = &wb_enc->wb_conn->base;
> +	drm_conn =
> +		container_of(wb_enc->wb_conn, struct drm_connector, writeback);

Just store drm_connector in dpu_encoder_phys_wb instead of
drm_writeback_connector.

>  	state = drm_conn->state;
>  
>  	if (wb_enc->wb_conn && wb_enc->wb_job)

-- 
With best wishes
Dmitry
