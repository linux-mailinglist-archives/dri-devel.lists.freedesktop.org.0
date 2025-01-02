Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B445B9FF9E7
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 14:43:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A5C510E3FA;
	Thu,  2 Jan 2025 13:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kPmq1f3v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F63F10E3FA
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 13:43:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 743865C5F0D
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 13:42:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AD8FC4CEE0
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 13:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735825399;
 bh=Lf0HL/WDMxh9e4xI2VHJmK8Uk1/y9zM9fP+Yqjx5kXw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kPmq1f3vTzrv81fg7oblXEuyFGi12fV6K/sxZW/qxfXSUiRj2/Ngv3xGqQmFtb9EB
 0ORTrqSHMm0AjPwpVpqxb3CRwqUeVCWiAQ4TMAK+J8IeaMzWJTUsj1E/dCs2PT/gRD
 5uo1bACyeVioXSvSCRuM6S40Hz1qK6cfJIziO5MSe4MoLVXfpsgK1bEi2QKqRIGRUZ
 +CZki6/tTUs/9ZE8zWx5v+0a3HhvAPwA/g86zqfapPb3YojmPYGfzK2xMTlQZ/YM+j
 JHVxPUSadwS2LJpYAPYd0aJGneo/cBwyZsFIX4WYf9MuVRdc9jq90Ydon0dw7Jcg/k
 3lK5sLTAkX6Zw==
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-2f13acbe29bso14023843a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jan 2025 05:43:19 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWyolw+tKCTEL8MsiW6UuSQ5caOg2NO/dpz61V9gKZlBJeik+RP1B6o/vAlPriHvQ0oCWv25UM3pgg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzc+C3Dg5BbR9JLhtRDMr1yN0XdL/3RqF0Las8BPJRXrTHX/Vj9
 WbFnpXTS1RqM84uz3JOvsYodUzn3mGJrfj54o0UGsWE5hcrH8SrgdK8jZROO3FRl5mQAYcu54iT
 ZPDpAKrQ2y7JK81AD0jwt2g6Q8g==
X-Google-Smtp-Source: AGHT+IHCxTQkblgIukaSC0qoCzRgvJzZht4dI4RJs3qplCpdoTIBV1OD+tbt8prOFp1oNASqkY/F9sDtdJoiqhDkTzo=
X-Received: by 2002:a17:90b:54c4:b0:2ee:e2f6:8abc with SMTP id
 98e67ed59e1d1-2f44360816cmr69363501a91.10.1735825398962; Thu, 02 Jan 2025
 05:43:18 -0800 (PST)
MIME-Version: 1.0
References: <20241204142626.158395-1-fshao@chromium.org>
In-Reply-To: <20241204142626.158395-1-fshao@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 2 Jan 2025 21:43:53 +0800
X-Gmail-Original-Message-ID: <CAAOTY__Wiva0V52ZTY7-vdrNKWeCGWb5KTBp+CHWoNxHxi0Kyw@mail.gmail.com>
Message-ID: <CAAOTY__Wiva0V52ZTY7-vdrNKWeCGWb5KTBp+CHWoNxHxi0Kyw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: dp: Support flexible length of DP
 calibration data
To: Fei Shao <fshao@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org
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

Hi, Fei:

Fei Shao <fshao@chromium.org> =E6=96=BC 2024=E5=B9=B412=E6=9C=884=E6=97=A5 =
=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=8810:26=E5=AF=AB=E9=81=93=EF=BC=9A
>
> The DP calibration data is stored in nvmem cells, and the data layout is
> described in the `mtk_dp_efuse_fmt` arrays for each platform.
>
> There is no guarantee that the data is always a 4-length u32 cell array.
> For example, MT8188 has a data length of 3, preventing it from passing
> the preliminary check and undergoing calibration.
>
> Update the logic to support flexible data lengths. Specifically, we
> validate the length returned from `nvmem_cell_read()` against the
> platform-specific efuse format. If out-of-bound access is detected, fall
> back to the default calibration values. This likely indicates an error
> in either the efuse data length described in DT or the efuse format
> within the driver.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
>
> Changes in v2:
> - use %zu identifier for size_t in dev_warn()
>
>  drivers/gpu/drm/mediatek/mtk_dp.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index 36713c176cfc..55671701459a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -1165,17 +1165,25 @@ static void mtk_dp_get_calibration_data(struct mt=
k_dp *mtk_dp)
>         buf =3D (u32 *)nvmem_cell_read(cell, &len);
>         nvmem_cell_put(cell);
>
> -       if (IS_ERR(buf) || ((len / sizeof(u32)) !=3D 4)) {
> +       if (IS_ERR(buf)) {
>                 dev_warn(dev, "Failed to read nvmem_cell_read\n");
> -
> -               if (!IS_ERR(buf))
> -                       kfree(buf);
> -
>                 goto use_default_val;
>         }
>
> +       /* The cell length is in bytes. Convert it to be compatible with =
u32 buffer. */
> +       len /=3D sizeof(u32);
> +
>         for (i =3D 0; i < MTK_DP_CAL_MAX; i++) {
>                 fmt =3D &mtk_dp->data->efuse_fmt[i];
> +
> +               if (fmt->idx >=3D len) {
> +                       dev_warn(mtk_dp->dev,
> +                                "Out-of-bound efuse data access, fmt idx=
 =3D %d, buf len =3D %zu\n",
> +                                fmt->idx, len);
> +                       kfree(buf);
> +                       goto use_default_val;
> +               }
> +
>                 cal_data[i] =3D (buf[fmt->idx] >> fmt->shift) & fmt->mask=
;
>
>                 if (cal_data[i] < fmt->min_val || cal_data[i] > fmt->max_=
val) {
> --
> 2.47.0.338.g60cca15819-goog
>
