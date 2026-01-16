Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DA4D3845E
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 19:32:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D912F10E0BD;
	Fri, 16 Jan 2026 18:32:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WeXJeooC";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S+DiBv1W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A4A410E0BD
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 18:32:26 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60GExcXV913971
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 18:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=gmJnwrq+qEZAzMC/5VtipcOHi3CTOErwfCEAzXc3NFA=; b=We
 XJeooCi/htsfcbB3EGGRbEd7Rfn+iUsr/AiADvRPO5UG65C1LpKcIlWJNEx9zTsf
 nmUrKVrm1VOsu98IUq3QqYRvA0nB/kswxtEDZnxv5K7x8V0MMYVhpDG5q3XT6ntC
 L8qWt7rDw3QIo4PUYBL1kB/1cTUfjWyU4OD5kurVUwHKaTm+I0WAuA58gt6bhUpm
 kCJAfskyctKgKxTuYopPuEV0j4zNxKoLUngtbx7lrcTtE4mRFJURjRs4FaLoa9X3
 3PA+szo8g+2GGEJI1dO7Um6uAUmQyJvJoXqGShkfcdTkCRsDOMJrN0Nl5yryGViw
 hEnnaIUvNfiTgoPu7mJw==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqqjurn9d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 18:32:25 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-45c8a31b1fcso3032541b6e.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 10:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768588345; x=1769193145;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=gmJnwrq+qEZAzMC/5VtipcOHi3CTOErwfCEAzXc3NFA=;
 b=S+DiBv1W/YzDlxDEWoFeej4vmNVEAHwFB8misvnLHrwO7ZwGDSa6ArVlQqkEebe9D1
 a4uHYBKaCIAiDP9z3KwN5d50bb/xe9rFBkIhxnFqwfIv8Ir2wrl2ukhEPUO0lDdl/PmU
 k3aYeaFqWTy2N8fZrfHUsmHQT15rFtFBzqV15L38VcmCqhd0/vTBO0sHa3n05I8YtOTC
 yWsxNbYOwAXPOUCZBC6s1Jt997asDyWJv3SntA3rxWHW77bct98mMKL3T/vX+B/+tt4Z
 3E6piT7dvZBes6RRGyC9WOD7B/C/gmtJRZgOPw7sbRrm+iGXGq5jXmeTD+soI5wgTjM9
 ddBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768588345; x=1769193145;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gmJnwrq+qEZAzMC/5VtipcOHi3CTOErwfCEAzXc3NFA=;
 b=ubdx8Ifv/9c6bv/7MNNuMZNd8rI/955wC3s1PHCjMjTiXLapYzWLYEtnDBKuA1O8Fg
 JHMXrxzKz/JvSfyoBKTHatoiSqfOvTLerkw93hykb3PH5GGtwh+KW85Bi6rO9lAW6TIU
 BKZ2b9WUTKFvKvzQ3vCsEQ666WBUu7JO3r284pn5xPwaDujWNj84q8lzT9YAR7xVwwXK
 COrLN9PrSI5Uazu7eRPmCavF9/CnViVP7kRzt1uMSGgaWCRlZgpAaxZ9aJCWo+rQHmPr
 JHLONXu5Lc+da0a92Tx/lQoQI0/SuqGMMJSRroqy3xxShDQoer4urz3VWq5Yurhc4Dd/
 QP5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDaI+bNLBHxKnRPSAQLwxlIXD0epAGVnmLsWaUTlkh3CUou1MfcFFfvW+BEiyi7AgsP8g6HrFm+wU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQHh/9vo1d1e4jFCnFYmjmFv0RbLEx12aIu3Eq6G8B0vO4wMUC
 OWOzpE7mEuPzga0xTXITupI9SoV9dyIpgIF/tZKXUd/DXy4y9dgFce87DiDzzwADG7YpBOOiIoR
 Xj8xJUohene+O+rqMta9f6Uo9+s8AGFOrorNXBNKJTFyDIK5HUtEvxNOXZjL4QkEX7aZmuzO0tV
 H5ZrfvkzFnL7bwa4OUXd9jQ5ufa5y7etIeynCVjNBuKrmaig==
X-Gm-Gg: AY/fxX48txSukbT4gfLUBO4mqQImGuE6uR7et/K3Wzk9xCr1aqloCg9An8YMJEiR57j
 tIT0OG8/WLxEs6IShTUJ6wSgk19wRicL/HNWQoBQe79+jF18VmoQ48Os+RBYuXOlkQ6U3t0UKo1
 vNeforBKfVpohZ/8Cey1m5IPnv7d6kfdPRxEgSAGTXa7XKpp3HJnuQMdtyrJpEdtcJeg==
X-Received: by 2002:a05:6808:2902:b0:455:ee1f:e1c3 with SMTP id
 5614622812f47-45c9d6b8fccmr1377667b6e.13.1768588344649; 
 Fri, 16 Jan 2026 10:32:24 -0800 (PST)
X-Received: by 2002:a05:6808:2902:b0:455:ee1f:e1c3 with SMTP id
 5614622812f47-45c9d6b8fccmr1377653b6e.13.1768588344235; Fri, 16 Jan 2026
 10:32:24 -0800 (PST)
MIME-Version: 1.0
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <20260108-topic-smem_dramc-v3-3-6b64df58a017@oss.qualcomm.com>
In-Reply-To: <20260108-topic-smem_dramc-v3-3-6b64df58a017@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 10:32:13 -0800
X-Gm-Features: AZwV_QjH_LAJrQbB9_T-U4SXhnS2PgPmgjjp6eFhzSG2zqHvjXMmhiR_pWC6tNs
Message-ID: <CACSVV01EiCmG=tLH=UOyHUVeUVnQ0X52OUeOAmXHFvRfeuj2JA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] drm/msm/adreno: Trust the SSoT UBWC config
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sean Paul <sean@poorly.run>, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: Z_tpiLF8w0gnls6smGpJhxR2gD70Qv5E
X-Proofpoint-GUID: Z_tpiLF8w0gnls6smGpJhxR2gD70Qv5E
X-Authority-Analysis: v=2.4 cv=atu/yCZV c=1 sm=1 tr=0 ts=696a8439 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=d94RvPs_YAZp7DxcWNsA:9 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDEzNyBTYWx0ZWRfX/eIQM9LLYz0Y
 jiVRaz1VPRraiI/ai3W8DNSMwZeYhIQbdl/rDgWDiQI++9nzgLGcATCJmPwgVKNyXoYWgHZVYOi
 NMtc83Q2gihiPjMVpTIJWfcuXFXVJsoxzyn5tPoNEFhh5L02fJfVBUKjijsGm2JUcKwMYD1amXq
 Ez2LLShtLGyFiN8WRydT403DbDPXkuFwq/EIxe+5q/ebMjWXL10jfRVBEW1DeRsJ7LB6j0BQPgk
 ehokeiU722LrUL/fU1LoLGK+MFyZDnNSxfphFwMjYekcMFFfQehE8CsALrtjzGUE1DvclIbwINS
 /4gBEevQlbUzLXDhxTquCcJyHEKu/vZNHu0j4iX7Mviz5gibZkv9GmVg9PPqslijB5Lowf1bdac
 ViuA1wM4/JzqTMkZf5ARq6RYKVqa+EbeogmqIrxcCv8CFKTih3Wi0ZqhRL7FLXH9CAiOGm5J5IU
 1YFFvnba9d2WNXH/gpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_07,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160137
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 8, 2026 at 6:22=E2=80=AFAM Konrad Dybcio <konradybcio@kernel.or=
g> wrote:
>
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Now that the highest_bank_bit value is retrieved from the running
> system and the global config has been part of the tree for a couple
> of releases, there is no reason to keep any hardcoded values inside
> the GPU driver.
>
> Get rid of them.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Rob Clark <robin.clark@oss.qualcomm.com>

> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 11 ++---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 82 ++-------------------------=
------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  5 --
>  3 files changed, 6 insertions(+), 92 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a5xx_gpu.c
> index 56eaff2ee4e4..eba6e74d0084 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1728,7 +1728,6 @@ static struct msm_gpu *a5xx_gpu_init(struct drm_dev=
ice *dev)
>         struct msm_drm_private *priv =3D dev->dev_private;
>         struct platform_device *pdev =3D priv->gpu_pdev;
>         struct adreno_platform_config *config =3D pdev->dev.platform_data=
;
> -       const struct qcom_ubwc_cfg_data *common_cfg;
>         struct a5xx_gpu *a5xx_gpu =3D NULL;
>         struct adreno_gpu *adreno_gpu;
>         struct msm_gpu *gpu;
> @@ -1766,13 +1765,9 @@ static struct msm_gpu *a5xx_gpu_init(struct drm_de=
vice *dev)
>         a5xx_preempt_init(gpu);
>
>         /* Inherit the common config and make some necessary fixups */
> -       common_cfg =3D qcom_ubwc_config_get_data();
> -       if (IS_ERR(common_cfg))
> -               return ERR_CAST(common_cfg);
> -
> -       /* Copy the data into the internal struct to drop the const quali=
fier (temporarily) */
> -       adreno_gpu->_ubwc_config =3D *common_cfg;
> -       adreno_gpu->ubwc_config =3D &adreno_gpu->_ubwc_config;
> +       adreno_gpu->ubwc_config =3D qcom_ubwc_config_get_data();
> +       if (IS_ERR(adreno_gpu->ubwc_config))
> +               return ERR_CAST(adreno_gpu->ubwc_config);
>
>         adreno_gpu->uche_trap_base =3D 0x0001ffffffff0000ull;
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 2129d230a92b..3a2429632225 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -729,82 +729,6 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>         gpu_write(gpu, REG_A6XX_CP_PROTECT(protect->count_max - 1), prote=
ct->regs[i]);
>  }
>
> -static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
> -{
> -       const struct qcom_ubwc_cfg_data *common_cfg;
> -       struct qcom_ubwc_cfg_data *cfg =3D &gpu->_ubwc_config;
> -
> -       /* Inherit the common config and make some necessary fixups */
> -       common_cfg =3D qcom_ubwc_config_get_data();
> -       if (IS_ERR(common_cfg))
> -               return PTR_ERR(common_cfg);
> -
> -       /* Copy the data into the internal struct to drop the const quali=
fier (temporarily) */
> -       *cfg =3D *common_cfg;
> -
> -       /* Use common config as is for A8x */
> -       if (!adreno_is_a8xx(gpu)) {
> -               cfg->ubwc_swizzle =3D 0x6;
> -               cfg->highest_bank_bit =3D 15;
> -       }
> -
> -       if (adreno_is_a610(gpu)) {
> -               cfg->highest_bank_bit =3D 13;
> -               cfg->ubwc_swizzle =3D 0x7;
> -       }
> -
> -       if (adreno_is_a612(gpu))
> -               cfg->highest_bank_bit =3D 14;
> -
> -       if (adreno_is_a618(gpu))
> -               cfg->highest_bank_bit =3D 14;
> -
> -       if (adreno_is_a619(gpu))
> -               /* TODO: Should be 14 but causes corruption at e.g. 1920x=
1200 on DP */
> -               cfg->highest_bank_bit =3D 13;
> -
> -       if (adreno_is_a619_holi(gpu))
> -               cfg->highest_bank_bit =3D 13;
> -
> -       if (adreno_is_a621(gpu))
> -               cfg->highest_bank_bit =3D 13;
> -
> -       if (adreno_is_a623(gpu))
> -               cfg->highest_bank_bit =3D 16;
> -
> -       if (adreno_is_a650(gpu) ||
> -           adreno_is_a660(gpu) ||
> -           adreno_is_a690(gpu) ||
> -           adreno_is_a730(gpu) ||
> -           adreno_is_a740_family(gpu)) {
> -               /* TODO: get ddr type from bootloader and use 15 for LPDD=
R4 */
> -               cfg->highest_bank_bit =3D 16;
> -       }
> -
> -       if (adreno_is_a663(gpu)) {
> -               cfg->highest_bank_bit =3D 13;
> -               cfg->ubwc_swizzle =3D 0x4;
> -       }
> -
> -       if (adreno_is_7c3(gpu))
> -               cfg->highest_bank_bit =3D 14;
> -
> -       if (adreno_is_a702(gpu))
> -               cfg->highest_bank_bit =3D 14;
> -
> -       if (cfg->highest_bank_bit !=3D common_cfg->highest_bank_bit)
> -               DRM_WARN_ONCE("Inconclusive highest_bank_bit value: %u (G=
PU) vs %u (UBWC_CFG)\n",
> -                             cfg->highest_bank_bit, common_cfg->highest_=
bank_bit);
> -
> -       if (cfg->ubwc_swizzle !=3D common_cfg->ubwc_swizzle)
> -               DRM_WARN_ONCE("Inconclusive ubwc_swizzle value: %u (GPU) =
vs %u (UBWC_CFG)\n",
> -                             cfg->ubwc_swizzle, common_cfg->ubwc_swizzle=
);
> -
> -       gpu->ubwc_config =3D &gpu->_ubwc_config;
> -
> -       return 0;
> -}
> -
>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>  {
>         struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> @@ -2721,10 +2645,10 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_d=
evice *dev)
>         msm_mmu_set_fault_handler(to_msm_vm(gpu->vm)->mmu, gpu,
>                                   adreno_gpu->funcs->mmu_fault_handler);
>
> -       ret =3D a6xx_calc_ubwc_config(adreno_gpu);
> -       if (ret) {
> +       adreno_gpu->ubwc_config =3D qcom_ubwc_config_get_data();
> +       if (IS_ERR(adreno_gpu->ubwc_config)) {
>                 a6xx_destroy(&(a6xx_gpu->base.base));
> -               return ERR_PTR(ret);
> +               return ERR_CAST(adreno_gpu->ubwc_config);
>         }
>
>         /* Set up the preemption specific bits and pieces for each ringbu=
ffer */
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.h
> index 1d0145f8b3ec..da9a6da7c108 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -237,12 +237,7 @@ struct adreno_gpu {
>         /* firmware: */
>         const struct firmware *fw[ADRENO_FW_MAX];
>
> -       /*
> -        * The migration to the central UBWC config db is still in flight=
 - keep
> -        * a copy containing some local fixups until that's done.
> -        */
>         const struct qcom_ubwc_cfg_data *ubwc_config;
> -       struct qcom_ubwc_cfg_data _ubwc_config;
>
>         /*
>          * Register offsets are different between some GPUs.
>
> --
> 2.52.0
>
