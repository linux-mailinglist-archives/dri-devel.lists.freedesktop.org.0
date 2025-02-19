Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 511B4A3C196
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 15:13:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 389C310E2DB;
	Wed, 19 Feb 2025 14:13:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FnsiTdTj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B37010E2DB
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 14:13:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 97AA6A42868
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 14:11:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6FC7C4CEEB
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 14:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739974415;
 bh=jso5qQFQSYU2mgkN6qCTfJjd+ezV54v2ynj9RTPzjc4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FnsiTdTjIta96r2UPsWQppWhDfdDVi33yIdAv7br0buBtK0uCnRlPz0zRE70iN7jh
 qU5jsaxlcf56OVAeYMyc9UZZcCMR60GxCxst2IolLXGVZ/dvgaC8RZOOj8Re+N/zrA
 25NjV3xP/6CV/+rhx4njuRt3Wv0qvCfwVw5iHK5l6YA1fngr3GwC+Ota629c+VKEye
 qVFF9FH0D0rsAHnroytvbw/un7iO2yCsCfutiArUcaWitMcJArqal9WgfQ6dY7HtAi
 bzGz9inzKseg0RKM85ZLNScRMNjpmwIXJK5dU1ihYmGpvi2DKeeFrYZ/lOeaTOtDtK
 3yJ424zphsNFA==
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2fc4418c0b9so5930660a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 06:13:35 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU25ahnW6dK6V7Hbrw58GfFUYEMq2lbF0UIO2NiSDLIe4bmCw2dPeqkl7gSrtMq5aobCegWvetgoeA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXTGyjm6WTv43vT9JcAu3WTkKUvilFg8P5vSbDDaw/NAS6OvWo
 P7NvZWs380fcfrj6Gd2RKGnHUQHGzTbC3vuvBOV3ZhiNobDBSw+vMYlHgF5yWKD2lhiTX3dpMY9
 jQrUCxLIj8GjAs2a+USnpbzjg6A==
X-Google-Smtp-Source: AGHT+IFa8R6i4Eeuldo8axIMgGyezQE2Aih3YKW/uwabG5hR2Fqqcd+qkA666mlQjsQf/SRPn9uJJ5YEmt8CiUS/WUI=
X-Received: by 2002:a17:90b:3912:b0:2fa:229f:d036 with SMTP id
 98e67ed59e1d1-2fcb5abe3cemr5694227a91.30.1739974415205; Wed, 19 Feb 2025
 06:13:35 -0800 (PST)
MIME-Version: 1.0
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
 <20250217154836.108895-17-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250217154836.108895-17-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 19 Feb 2025 22:14:20 +0800
X-Gmail-Original-Message-ID: <CAAOTY_99Q5X+PurxQKewJRN4e=cxwMwX-6qzrZztOe5Eu2KuPg@mail.gmail.com>
X-Gm-Features: AWEUYZmtLYXEQSNosRWwGHhpXxbA8tfEaeBMbNB5Y9ryg9Aq3cPAidz3jkYE8sg
Message-ID: <CAAOTY_99Q5X+PurxQKewJRN4e=cxwMwX-6qzrZztOe5Eu2KuPg@mail.gmail.com>
Subject: Re: [PATCH v7 16/43] drm/mediatek: mtk_hdmi: Compress of_device_id
 array entries
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
49=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Compress the entries found in the of_device_id array to improve
> readability of this file and to make that consistent with other
> kernel drivers.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediat=
ek/mtk_hdmi.c
> index 1e50b3918069..be71105ba81d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1780,15 +1780,10 @@ static const struct mtk_hdmi_conf mtk_hdmi_conf_m=
t8167 =3D {
>  };
>
>  static const struct of_device_id mtk_hdmi_of_ids[] =3D {
> -       { .compatible =3D "mediatek,mt2701-hdmi",
> -         .data =3D &mtk_hdmi_conf_mt2701,
> -       },
> -       { .compatible =3D "mediatek,mt8167-hdmi",
> -         .data =3D &mtk_hdmi_conf_mt8167,
> -       },
> -       { .compatible =3D "mediatek,mt8173-hdmi",
> -       },
> -       {}
> +       { .compatible =3D "mediatek,mt2701-hdmi", .data =3D &mtk_hdmi_con=
f_mt2701 },
> +       { .compatible =3D "mediatek,mt8167-hdmi", .data =3D &mtk_hdmi_con=
f_mt8167 },
> +       { .compatible =3D "mediatek,mt8173-hdmi" },
> +       { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, mtk_hdmi_of_ids);
>
> --
> 2.48.1
>
