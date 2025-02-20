Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1B9A3DC23
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 15:09:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D26710E970;
	Thu, 20 Feb 2025 14:09:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HiWxuCyn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7370D10E971
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 14:09:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2A55361465
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 14:09:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7276EC4CEDD
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 14:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740060593;
 bh=x9CYPp92qt7nrQ8n1R6hogiZ3ztLUyzp5dk9F+0pnAE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HiWxuCynedPnTLyt9VduRt3IIwD1IfgC1Cnl08Vn2y0UtKvqjmxX7ucBMSN8sRzkA
 8XEK6trVBftYiqPjsDxU5Hn3rX7tZ/WsbN0JNuKQY5BGUFikvybXRtAwPvTXNeZthT
 jYhAR5N91dXRWNGvY9vysE7EvcsmJGMzS6hY2YMuCJvdbTFarAu4H0Urq2WE/H+pdb
 ttRKIzKxjpjfOKtPFZ5DTBfbWISx/puz4crnoNVq+KTT5C3eZnD2ud8w1YZ73edmHz
 pLq9FhUZ4cxQfGqaKPph2YRru4cADZYuseTSZf3/ZjDXAh+k39ze+ZqVL0TBXzoMkf
 wWS15/BieXUeg==
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-2fa7465baceso2033158a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 06:09:53 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXpE5WvX8abZzmcggqSoQs9FYY5LxvAu8MQz2rLayqsJf4IF3NHBlG/pagwoJ3soaeyfxX3mFAIY5A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzY7ueOrVG9LybNQoNhv6ITSLgsJv1MgNgJOcEAxUxwz6jUjmqR
 hGJHEjOP5nxTGL6yJAa3Q8i36WqRQHjTWscGRzWBs36JjL1sjNmgjcwlLJfAO6RmLKBw/22nGGU
 HHuPIsR9CAlxVYvdI9ZsELPHXZw==
X-Google-Smtp-Source: AGHT+IE0v84Qb6FC/gDtH8xNJeXoFkB/nAfUjSnTsVJesFFxd/imMIypRaefBomgcHEC0WrtRHoFrNT9UaSnKPKXvqk=
X-Received: by 2002:a17:90b:4c07:b0:2ee:b8ac:73b0 with SMTP id
 98e67ed59e1d1-2fc40d1245fmr35061143a91.2.1740060593030; Thu, 20 Feb 2025
 06:09:53 -0800 (PST)
MIME-Version: 1.0
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
 <20250217154836.108895-30-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250217154836.108895-30-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 20 Feb 2025 22:10:36 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9U4gNASfdiF=B-5+er0qs+F7V=gO1RwjuXw7FagMiUwA@mail.gmail.com>
X-Gm-Features: AWEUYZkEgaHMKjmDQHz4a-_W0aseAk_FLY9Y1EUWnfNXr-s5564_MkXpbtF3WgU
Message-ID: <CAAOTY_9U4gNASfdiF=B-5+er0qs+F7V=gO1RwjuXw7FagMiUwA@mail.gmail.com>
Subject: Re: [PATCH v7 29/43] drm/mediatek: mtk_hdmi: Use devm managed version
 of drm_bridge_add
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
> Simplify the probe/remove functions by using devm_drm_bridge_add()
> as now there is no more need to manually remove the bridge.

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
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediat=
ek/mtk_hdmi.c
> index e79ebed21eab..f539472307e2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1674,14 +1674,15 @@ static int mtk_hdmi_probe(struct platform_device =
*pdev)
>         hdmi->bridge.type =3D DRM_MODE_CONNECTOR_HDMIA;
>         hdmi->bridge.vendor =3D "MediaTek";
>         hdmi->bridge.product =3D "On-Chip HDMI";
> -       drm_bridge_add(&hdmi->bridge);
> +
> +       ret =3D devm_drm_bridge_add(dev, &hdmi->bridge);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Failed to add bridge\n");
>
>         ret =3D mtk_hdmi_clk_enable_audio(hdmi);
> -       if (ret) {
> -               drm_bridge_remove(&hdmi->bridge);
> +       if (ret)
>                 return dev_err_probe(dev, ret,
>                                      "Failed to enable audio clocks\n");
> -       }
>
>         return 0;
>  }
> @@ -1690,7 +1691,6 @@ static void mtk_hdmi_remove(struct platform_device =
*pdev)
>  {
>         struct mtk_hdmi *hdmi =3D platform_get_drvdata(pdev);
>
> -       drm_bridge_remove(&hdmi->bridge);
>         mtk_hdmi_clk_disable_audio(hdmi);
>  }
>
> --
> 2.48.1
>
