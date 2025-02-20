Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 462D0A3DC55
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 15:17:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C18A710E969;
	Thu, 20 Feb 2025 14:17:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hmDAx/bL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CC3B10E969
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 14:17:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D6E1B614A1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 14:17:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E5CC4CEEB
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 14:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740061026;
 bh=phtVfpAQP2gqJ9uhxpOiCBTEsxgIpvS5igy/qXNkMDI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hmDAx/bL+DtKimxCl9L1Ouu9reCfWS9G4jSWwbwFIt62paGHuLWpefNgpk6rEu9mY
 xZW4LhwkcMuT7rH1d6qZGTSApMyHQYHP/fpyyRhBvV+DjXvOnUH6GOLoTa2xssxUow
 bUZuyAFc+GmYnNKCa5ACj4s+NdjMC/QflQ6vupSIK5wqLBtCH250twMfbw5duc4ltw
 nuH3lqb+ocRpyyMo4xPgz18M58FQS6S7PFLwq7rc/+9gl/OkZgzgl28Ex0gxg+7D7r
 w0AQgd+dHiiP6+vcctnz/+qeAh4+MirPOfxaOcaZqqEt8BYd1ahdBw9+OYkkuOqrJh
 5EfRZBi4NQS1A==
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2fbfc9ff0b9so1575660a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 06:17:06 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVu/JSdi9gQUh5F0WI3n++KlLhGkV22vAD0Dmfh0QVdQhd7C903ewPEwINFNFAgWSA3L8i4LOCqW4w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMPk++cRh7JQqROg4TtdyAvPSxis6qJisftX1z/1i83H92bKMu
 v8Eluq7hYiUXUjprEvVN2t+UKn0OYCORjqmP2Azk4GEVXkjiwF4CYiXpvgqAWAZHA06WHr44zpN
 6949qrDAZsZk/Ac9Wm4BtwxrmTQ==
X-Google-Smtp-Source: AGHT+IGyx5QWB4rzHyre9LMXoPdg2qp8oLeofiBp2HooA+47pReCBBVwzDOuk8vQdFLX+87Wzj+OpnchkAQUrEFYbI8=
X-Received: by 2002:a17:90b:2e50:b0:2ee:aa28:79aa with SMTP id
 98e67ed59e1d1-2fc40d14ac5mr32787274a91.6.1740061026314; Thu, 20 Feb 2025
 06:17:06 -0800 (PST)
MIME-Version: 1.0
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
 <20250217154836.108895-31-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250217154836.108895-31-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 20 Feb 2025 22:17:49 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8G36w1KZpfcVPbfZ6RjbAs3=GHdzdnPHZw=4Njnid35A@mail.gmail.com>
X-Gm-Features: AWEUYZn7UqFdQMaggAe3FK4XBZKbvE_M4ZaCHMfj6Eg3FDhoHOMNrpbhRQkeUao
Message-ID: <CAAOTY_8G36w1KZpfcVPbfZ6RjbAs3=GHdzdnPHZw=4Njnid35A@mail.gmail.com>
Subject: Re: [PATCH v7 30/43] drm/mediatek: mtk_hdmi: Remove ifdef for
 CONFIG_PM_SLEEP
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com, 
 jie.qiu@mediatek.com, junzhi.zhao@mediatek.com, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
 dmitry.baryshkov@linaro.org, lewis.liao@mediatek.com, 
 ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com, 
 jason-jh.lin@mediatek.com
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

Hi, Angelo:

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2025=E5=B9=B42=E6=9C=8817=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8811:=
50=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Since the SIMPLE_DEV_PM_OPS macro and the pm pointer are anyway
> defined when CONFIG_PM_SLEEP is not set, remove the ifdef for it
> and indicate that the mtk_hdmi_{remove,suspend} functions may be
> unused (as they are, in case PM support is not built-in).
>
> While at it, to improve readability, also compress the
> SIMPLE_DEV_PM_OPS declaration as it even fits in less
> than 80 columns.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediat=
ek/mtk_hdmi.c
> index f539472307e2..bf8cf7fc8c07 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1694,8 +1694,7 @@ static void mtk_hdmi_remove(struct platform_device =
*pdev)
>         mtk_hdmi_clk_disable_audio(hdmi);
>  }
>
> -#ifdef CONFIG_PM_SLEEP
> -static int mtk_hdmi_suspend(struct device *dev)
> +static __maybe_unused int mtk_hdmi_suspend(struct device *dev)
>  {
>         struct mtk_hdmi *hdmi =3D dev_get_drvdata(dev);
>
> @@ -1704,7 +1703,7 @@ static int mtk_hdmi_suspend(struct device *dev)
>         return 0;
>  }
>
> -static int mtk_hdmi_resume(struct device *dev)
> +static __maybe_unused int mtk_hdmi_resume(struct device *dev)
>  {
>         struct mtk_hdmi *hdmi =3D dev_get_drvdata(dev);
>         int ret =3D 0;
> @@ -1717,9 +1716,8 @@ static int mtk_hdmi_resume(struct device *dev)
>
>         return 0;
>  }
> -#endif
> -static SIMPLE_DEV_PM_OPS(mtk_hdmi_pm_ops,
> -                        mtk_hdmi_suspend, mtk_hdmi_resume);
> +
> +static SIMPLE_DEV_PM_OPS(mtk_hdmi_pm_ops, mtk_hdmi_suspend, mtk_hdmi_res=
ume);
>
>  static const struct mtk_hdmi_conf mtk_hdmi_conf_mt2701 =3D {
>         .tz_disabled =3D true,
> --
> 2.48.1
>
