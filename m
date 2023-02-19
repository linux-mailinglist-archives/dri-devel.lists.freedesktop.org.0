Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE2569C351
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 00:09:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C6AF10E036;
	Sun, 19 Feb 2023 23:09:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44EC810E02B;
 Sun, 19 Feb 2023 23:09:48 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id q13so884211oiw.10;
 Sun, 19 Feb 2023 15:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=28a8B8Fp7+D1JO9Fuegh+FMpqwFzGd+RsgVRY+bgRU4=;
 b=X++hY1TU1rA72KqeeDf2LcbCBg2B6O/X/muDVFp3OFoeohaj4fBXqjbgItNXU5rCYz
 Sv1rcqIxKPRtJ0Mdqm7S7am19lru1byAYDDz1ApNqybEw4uWEVuvqaT2IlSgL6fDbin/
 +ukxY7552yZBQ5hdW9Hmk343jONTP0etFjI0sp4s/L2Yv94Xu3XSAQQ+sgQd4EJvTFE1
 5CkneXnnptvaar+ca4/rYYkciNaFDkm9eA6Hw4cJQlPMq8fWNfyvtr7c06avQaVdVTiX
 YHumFn/y8/cM2eK37gpbcBbO6lwkWe4pY4O78KOwN+0N5UUMeB7LZXegnbbJ29qKE18s
 jGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=28a8B8Fp7+D1JO9Fuegh+FMpqwFzGd+RsgVRY+bgRU4=;
 b=qm9AxAV6lBrSnLm3bq615JR0D07bFVM7tAyJqFfQusdsNfkLWmTjBmtQM6mkvQpWGm
 fK29+A3fMaiObhns9SY90dHyxk80sTZyTczOuZP3CvQQv+PH9UASPqghQiklredGiII3
 9irWcS8pft/FecxU6pI/THbtdg9KD6JyKptBMpOEGqzyS/2yL93zlS97TjrIWTrm2d07
 WE3MHGqXGn9Q0SOJmlC5hk8+DtUSmqBD67TTggmAuvPQfkqlXwLOttvivJ6Mh/CgRGFi
 SFwjbGMR8bvPggj1NtFZq9oWnrMCne1rEA6HBYW5LQdwqGUAaZ+9aD9hLFllfQLBxYIJ
 6/dQ==
X-Gm-Message-State: AO0yUKU77hhBTfyzipHqSvt0lhsL9KseO+POaWzt9FJyFju+lzHu3xaf
 tjl1DTTf0iWcE3gL3Q7K2bf1xMs8X3HBQxqm6Ns=
X-Google-Smtp-Source: AK7set9iYVFVecNn2E8x5CkWhPIgcgrPQHPs8+TJQs4BfkkeohxATSwZMyalt1uv7OJQ/q2Gq4Qkyzv18JzRzNcN3gc=
X-Received: by 2002:a05:6808:ec7:b0:364:c0a5:1fcf with SMTP id
 q7-20020a0568080ec700b00364c0a51fcfmr923596oiv.58.1676848187246; Sun, 19 Feb
 2023 15:09:47 -0800 (PST)
MIME-Version: 1.0
References: <20230219185401.10479-1-rdunlap@infradead.org>
In-Reply-To: <20230219185401.10479-1-rdunlap@infradead.org>
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 19 Feb 2023 15:09:36 -0800
Message-ID: <CAF6AEGv7xU2vhSi95MbsjzpRv4ANQ-vOOrchjJ=-uwW9f2q6Eg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: fix new Konfig dependency warning
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 19, 2023 at 10:54 AM Randy Dunlap <rdunlap@infradead.org> wrote=
:
>
> DEVFREQ_GOV_SIMPLE_ONDEMAND depends on PM_DEVFREQ, so in order to
> select the former safely, this symbol should also depend on
> PM_DEVFREQ to avoid a Kconfig dependency warning.
>
> WARNING: unmet direct dependencies detected for DEVFREQ_GOV_SIMPLE_ONDEMA=
ND
>   Depends on [n]: PM_DEVFREQ [=3Dn]
>   Selected by [m]:
>   - DRM_MSM [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && (ARCH_QCOM || SOC=
_IMX5 || COMPILE_TEST [=3Dy]) && COMMON_CLK [=3Dy] && IOMMU_SUPPORT [=3Dy] =
&& (QCOM_OCMEM [=3Dn] || QCOM_OCMEM [=3Dn]=3Dn) && (QCOM_LLCC [=3Dy] || QCO=
M_LLCC [=3Dy]=3Dn) && (QCOM_COMMAND_DB [=3Dn] || QCOM_COMMAND_DB [=3Dn]=3Dn=
)
>

Actually, I fixed devfreq[1] so that we no longer depend on
DEVFREQ_GOV_SIMPLE_ONDEMAND .. probably we should just drop
DEVFREQ_GOV_SIMPLE_ONDEMAND from the kconfig instead, sorry I forgot
to do that already

BR,
-R

[1] https://patchwork.freedesktop.org/series/113232/

> Fixes: 6563f60f14cb ("drm/msm/gpu: Add devfreq tuning debugfs")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> ---
>  drivers/gpu/drm/msm/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
>
> diff -- a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -9,6 +9,7 @@ config DRM_MSM
>         depends on QCOM_OCMEM || QCOM_OCMEM=3Dn
>         depends on QCOM_LLCC || QCOM_LLCC=3Dn
>         depends on QCOM_COMMAND_DB || QCOM_COMMAND_DB=3Dn
> +       depends on PM_DEVFREQ
>         select IOMMU_IO_PGTABLE
>         select QCOM_MDT_LOADER if ARCH_QCOM
>         select REGULATOR
