Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D54F6FF413
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 16:26:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32FE410E27B;
	Thu, 11 May 2023 14:26:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F05210E271;
 Thu, 11 May 2023 14:25:59 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-38ede2e0e69so4602788b6e.2; 
 Thu, 11 May 2023 07:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683815158; x=1686407158;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EUMshOhJ/jCmOAXf0wSXeoJInJRRSEiHUd4QhJk0RRA=;
 b=DBl+lObSFhApj2jZOTQrUAOrwRIAf4xArfq5YCzK0SszrY7+8QX++/DM1qlgt14Z4R
 qEopsANTv+hPnlePep+XdcNtxdNulvw4P5qNfXchJTTbUCd4MSP29UPZAWuBhn0ffsNe
 uhXM+8dw1jy9CJHT+Ql38XqBeVvflRY7TBo3m4f6CCuzjIKoMFKj/JS2HWrh7bdfKWuB
 jUFxRKvMdOMAQoKc0pJI563yjY1+zqSRmyDiRVXpx0HsB3WrccNCpvBiX+VEv4xtPcB7
 UtSTAo8Q5KxkKiY0EdMzMlhESgiq2VDLZO4Z51EjGPKslAyjqv3+PuBbQGS8w2KckX/T
 1POw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683815158; x=1686407158;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EUMshOhJ/jCmOAXf0wSXeoJInJRRSEiHUd4QhJk0RRA=;
 b=QighbE5YFfFiYoGz1/p1fVU+/i8LtFXxBuWHTAnk8qAWTCESKxF/+IlswWT4AHdQF9
 kDZeS3oVs8CSlpDqNkzCwNvO0RWXb+2EeZX3JTrPKfnEM5RL0rvnU67/R1sl43s0Vh2n
 2sPw5FyzhdjI52m1cRamw7PkpKh8wNruSCe05pn74fQ8hI3CdleBPL7NMopU+P14yZvl
 3ExbQsF04VJrAJFTIg89on/L7KGdIFq3U2c8Gg1wz8WyW2BejfH0RvbP2JdGPFN+TRd/
 WoybPZYNFO/K5+OVdip/z0ilywh7LOLGlyjuNGgBMzg+Fo02R4i5N24B0dnXmR4/tJf8
 E67w==
X-Gm-Message-State: AC+VfDz3GUA1bst8CnuoTyuB2HSkz16U1XOC0g6s7NQyO6/6Di01Ol5W
 H/IcATMckaHT10LxYsu/apcnVjQK0rVNAtAm9RWmkD5X
X-Google-Smtp-Source: ACHHUZ7poZgOitdfQqtIlPzYx5Qk56gFW9JRYK0fJ/hsY7AKW7RFp3/ZwhYX+SOn+yAUhmAJCncEuRY5yF/6vgL4jRQ=
X-Received: by 2002:a05:6808:59:b0:38e:eaf:cf29 with SMTP id
 v25-20020a056808005900b0038e0eafcf29mr4889151oic.29.1683815157913; Thu, 11
 May 2023 07:25:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230509163712.376117-1-robdclark@gmail.com>
In-Reply-To: <20230509163712.376117-1-robdclark@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 11 May 2023 07:25:46 -0700
Message-ID: <CAF6AEGv4kThhyCEhf3NeqTSwVT5X7rgxM5nuM_jq3aFbfUHpqA@mail.gmail.com>
Subject: Re: [PATCH 1/2] iommu/arm-smmu-qcom: Fix missing adreno_smmu's
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org
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
Cc: Rob Clark <robdclark@chromium.org>, Lepton Wu <lepton@chromium.org>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, Emma Anholt <emma@anholt.net>,
 Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Elliot Berman <quic_eberman@quicinc.com>, freedreno@lists.freedesktop.org,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 9, 2023 at 9:37=E2=80=AFAM Rob Clark <robdclark@gmail.com> wrot=
e:
>
> From: Rob Clark <robdclark@chromium.org>
>
> When the special handling of qcom,adreno-smmu was moved into
> qcom_smmu_create(), it was overlooked that we didn't have all the
> required entries in qcom_smmu_impl_of_match.  So we stopped getting
> adreno_smmu_priv on sc7180, breaking per-process pgtables.
>
> Fixes: 30b912a03d91 ("iommu/arm-smmu-qcom: Move the qcom,adreno-smmu chec=
k into qcom_smmu_create")
> Suggested-by: Lepton Wu <lepton@chromium.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Any chance I could get an ack for landing this fix via msm-fixes?
Broken per-process pgtables is kind of a serious regression..

BR,
-R

> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.c
> index d1b296b95c86..760d9c43dbd2 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -496,20 +496,21 @@ static const struct qcom_smmu_match_data qcom_smmu_=
500_impl0_data =3D {
>  /*
>   * Do not add any more qcom,SOC-smmu-500 entries to this list, unless th=
ey need
>   * special handling and can not be covered by the qcom,smmu-500 entry.
>   */
>  static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[=
] =3D {
>         { .compatible =3D "qcom,msm8996-smmu-v2", .data =3D &msm8996_smmu=
_data },
>         { .compatible =3D "qcom,msm8998-smmu-v2", .data =3D &qcom_smmu_v2=
_data },
>         { .compatible =3D "qcom,qcm2290-smmu-500", .data =3D &qcom_smmu_5=
00_impl0_data },
>         { .compatible =3D "qcom,qdu1000-smmu-500", .data =3D &qcom_smmu_5=
00_impl0_data  },
>         { .compatible =3D "qcom,sc7180-smmu-500", .data =3D &qcom_smmu_50=
0_impl0_data },
> +       { .compatible =3D "qcom,sc7180-smmu-v2", .data =3D &qcom_smmu_v2_=
data },
>         { .compatible =3D "qcom,sc7280-smmu-500", .data =3D &qcom_smmu_50=
0_impl0_data },
>         { .compatible =3D "qcom,sc8180x-smmu-500", .data =3D &qcom_smmu_5=
00_impl0_data },
>         { .compatible =3D "qcom,sc8280xp-smmu-500", .data =3D &qcom_smmu_=
500_impl0_data },
>         { .compatible =3D "qcom,sdm630-smmu-v2", .data =3D &qcom_smmu_v2_=
data },
>         { .compatible =3D "qcom,sdm845-smmu-v2", .data =3D &qcom_smmu_v2_=
data },
>         { .compatible =3D "qcom,sdm845-smmu-500", .data =3D &sdm845_smmu_=
500_data },
>         { .compatible =3D "qcom,sm6115-smmu-500", .data =3D &qcom_smmu_50=
0_impl0_data},
>         { .compatible =3D "qcom,sm6125-smmu-500", .data =3D &qcom_smmu_50=
0_impl0_data },
>         { .compatible =3D "qcom,sm6350-smmu-v2", .data =3D &qcom_smmu_v2_=
data },
>         { .compatible =3D "qcom,sm6350-smmu-500", .data =3D &qcom_smmu_50=
0_impl0_data },
> @@ -540,12 +541,14 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct =
arm_smmu_device *smmu)
>                 /* Match platform for ACPI boot */
>                 if (acpi_match_platform_list(qcom_acpi_platlist) >=3D 0)
>                         return qcom_smmu_create(smmu, &qcom_smmu_500_impl=
0_data);
>         }
>  #endif
>
>         match =3D of_match_node(qcom_smmu_impl_of_match, np);
>         if (match)
>                 return qcom_smmu_create(smmu, match->data);
>
> +       WARN_ON(of_device_is_compatible(np, "qcom,adreno-smmu"));
> +
>         return smmu;
>  }
> --
> 2.40.1
>
