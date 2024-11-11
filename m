Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4909C4181
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 16:08:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CDBC10E1FB;
	Mon, 11 Nov 2024 15:07:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="K7QLv6qe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D596510E1FB;
 Mon, 11 Nov 2024 15:07:57 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-83ab5b4b048so195603339f.2; 
 Mon, 11 Nov 2024 07:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731337677; x=1731942477; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l+GB5tRv8BnowN5d0hYSrEc6wH0fHehQmpMwfq55PFY=;
 b=K7QLv6qenBsPAkwWK1iyr7Ldf0H+6zRNMOKbjxdcERvZdZ42vfU9H+TpVbkRuaN7Nx
 tnLPMc211BgUGoxRDTeRD9GxX1NCsDL9srXfToIlvQppcg9ENeWGjDkfOfaKwIUfhBu+
 HMcDbi62zMpU5lra1X8qkkU+lXihPLKh6fP02uZfIhijAWW/YkStregpj/hXctKICQKa
 4jlm2mEva6bXefS+UbOrXA5TG+ApWpkU0oVXNvzSnHOPhtWDAMOiOIlh3h5YRwIqe5/b
 wkNMOFKS6TVtFL0SyChDyCPcpmd0y4HcIC4CIjnXwgGYGqDT/RhN1EjYc31T+yJvhypI
 vRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731337677; x=1731942477;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l+GB5tRv8BnowN5d0hYSrEc6wH0fHehQmpMwfq55PFY=;
 b=eafkz6dDIavoTCgREdmmIjcu0sNoyMM36hXz5g72bmD/SlDI91FqCoe/ECaDeWPmEe
 AhrFGnj0/aDEmOP1DTyswtQv9uppy6c5ZQ3Gb+7r5wf48X4/1omVofa7vkJ7lFWv/1OL
 0oNqUsiZ4U98V19KBXLkfWbZWsQmwrsq1RLHgjvWlOqHbsZd56SOWwuPjey+JirlDlRD
 oanzzaIQxlCk1waD5XED0Z77d0uV+mAOfDO3XfclYtnBpRpoW0n+DMoikEDEUG6cX8ZL
 glb9RlyoFCoSNd5rtEKFvMabZ/zst7v1xMAGhGq8bgCc+7B4uTrP39vpmx5jfNpsZMVd
 TZbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKYuDYeNtP1ps2sKBrIGDSeudCDf6wiNmboQDqlmcZ03WYI7ILbka3tSflfOiXb3GHeG2H4CbehhPX@lists.freedesktop.org,
 AJvYcCXF22la6dxZJ5ryeEDvxQxB6j4kc9o9Zv5yncD0rbkU3bkkkn1OX1V+g1WvCFrq854FbXJaVVb0EDE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRrnBTi8Yq9iJNYlnmKvbOQA+2yaMU/T/OsQqAGrvHyj5Hv567
 /cxtiXTqrjam9GgPigF/YyLYW6oZ4tRTOm2WJmLMWMJWP7Yy5wgmntvkLsJNkHUGJH3ZpO0+Si2
 aSFdg3Is+aDN2Nu1dXzV4tzKtbVM=
X-Google-Smtp-Source: AGHT+IHTfIqlgcD2XKYGf2RKEMfl9C8IIiYjp31xSXeesmufP9858DAQdQl8IxPXotfWKb+wOlGIb7o99W1tYFqYnlQ=
X-Received: by 2002:a05:6e02:20cd:b0:3a6:c716:ab29 with SMTP id
 e9e14a558f8ab-3a6f19e383amr161829735ab.14.1731337676449; Mon, 11 Nov 2024
 07:07:56 -0800 (PST)
MIME-Version: 1.0
References: <20241110-adreno-smmu-aparture-v2-0-9b1fb2ee41d4@oss.qualcomm.com>
 <20241110-adreno-smmu-aparture-v2-1-9b1fb2ee41d4@oss.qualcomm.com>
In-Reply-To: <20241110-adreno-smmu-aparture-v2-1-9b1fb2ee41d4@oss.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 11 Nov 2024 07:07:44 -0800
Message-ID: <CAF6AEGvVeDLtca0q300BMPYXgs00auBCDPAC=yk9J7cPRgkUQA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] firmware: qcom: scm: Introduce CP_SMMU_APERTURE_ID
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, 
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Simona Vetter <simona@ffwll.ch>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sun, Nov 10, 2024 at 9:31=E2=80=AFAM Bjorn Andersson
<bjorn.andersson@oss.qualcomm.com> wrote:
>
> The QCOM_SCM_SVC_MP service provides QCOM_SCM_MP_CP_SMMU_APERTURE_ID,
> which is used to trigger the mapping of register banks into the SMMU
> context for per-processes page tables to function (in case this isn't
> statically setup by firmware).
>
> This is necessary on e.g. QCS6490 Rb3Gen2, in order to avoid "CP | AHB
> bus error"-errors from the GPU.
>
> Introduce a function to allow the msm driver to invoke this call.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/firmware/qcom/qcom_scm.c       | 26 ++++++++++++++++++++++++++
>  drivers/firmware/qcom/qcom_scm.h       |  1 +
>  include/linux/firmware/qcom/qcom_scm.h |  2 ++
>  3 files changed, 29 insertions(+)
>
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qco=
m_scm.c
> index 95815e64e1e6..72bf87ddcd96 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -904,6 +904,32 @@ int qcom_scm_restore_sec_cfg(u32 device_id, u32 spar=
e)
>  }
>  EXPORT_SYMBOL_GPL(qcom_scm_restore_sec_cfg);
>
> +#define QCOM_SCM_CP_APERTURE_CONTEXT_MASK      GENMASK(7, 0)
> +
> +bool qcom_scm_set_gpu_smmu_aperture_is_available(void)
> +{
> +       return __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_MP,
> +                                           QCOM_SCM_MP_CP_SMMU_APERTURE_=
ID);
> +}
> +EXPORT_SYMBOL_GPL(qcom_scm_set_gpu_smmu_aperture_is_available);
> +
> +int qcom_scm_set_gpu_smmu_aperture(unsigned int context_bank)
> +{
> +       struct qcom_scm_desc desc =3D {
> +               .svc =3D QCOM_SCM_SVC_MP,
> +               .cmd =3D QCOM_SCM_MP_CP_SMMU_APERTURE_ID,
> +               .arginfo =3D QCOM_SCM_ARGS(4),
> +               .args[0] =3D 0xffff0000 | FIELD_PREP(QCOM_SCM_CP_APERTURE=
_CONTEXT_MASK, context_bank),
> +               .args[1] =3D 0xffffffff,
> +               .args[2] =3D 0xffffffff,
> +               .args[3] =3D 0xffffffff,
> +               .owner =3D ARM_SMCCC_OWNER_SIP
> +       };
> +
> +       return qcom_scm_call(__scm->dev, &desc, NULL);
> +}
> +EXPORT_SYMBOL_GPL(qcom_scm_set_gpu_smmu_aperture);
> +
>  int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size)
>  {
>         struct qcom_scm_desc desc =3D {
> diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qco=
m_scm.h
> index 685b8f59e7a6..e36b2f67607f 100644
> --- a/drivers/firmware/qcom/qcom_scm.h
> +++ b/drivers/firmware/qcom/qcom_scm.h
> @@ -116,6 +116,7 @@ struct qcom_tzmem_pool *qcom_scm_get_tzmem_pool(void)=
;
>  #define QCOM_SCM_MP_IOMMU_SET_CP_POOL_SIZE     0x05
>  #define QCOM_SCM_MP_VIDEO_VAR                  0x08
>  #define QCOM_SCM_MP_ASSIGN                     0x16
> +#define QCOM_SCM_MP_CP_SMMU_APERTURE_ID                0x1b
>  #define QCOM_SCM_MP_SHM_BRIDGE_ENABLE          0x1c
>  #define QCOM_SCM_MP_SHM_BRIDGE_DELETE          0x1d
>  #define QCOM_SCM_MP_SHM_BRIDGE_CREATE          0x1e
> diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmw=
are/qcom/qcom_scm.h
> index 9f14976399ab..4621aec0328c 100644
> --- a/include/linux/firmware/qcom/qcom_scm.h
> +++ b/include/linux/firmware/qcom/qcom_scm.h
> @@ -85,6 +85,8 @@ int qcom_scm_io_writel(phys_addr_t addr, unsigned int v=
al);
>
>  bool qcom_scm_restore_sec_cfg_available(void);
>  int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare);
> +int qcom_scm_set_gpu_smmu_aperture(unsigned int context_bank);
> +bool qcom_scm_set_gpu_smmu_aperture_is_available(void);
>  int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size);
>  int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare);
>  int qcom_scm_iommu_set_cp_pool_size(u32 spare, u32 size);
>
> --
> 2.45.2
>
