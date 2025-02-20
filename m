Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 957DEA3DBFC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 15:01:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7384E10E960;
	Thu, 20 Feb 2025 14:01:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Q+KTDZMh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6765F10E960
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 14:01:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 13E9961467
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 14:01:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C873C4AF09
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 14:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740060114;
 bh=b4AZKnm/4CW7chhpu6yQW9p0aspr3R6qCEzhfg2YT2I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Q+KTDZMhrGHww4kznoyoJFRb3olr8UODUOwgc0KY/L9KBdW9BoIXyszGXXv4Ynh6Z
 cO0HdO06VC3E/UqF/Jg8NUdTCasfU7SOTlMugQ16kiTF2vZGHhv7tudwRpKchBJDcY
 8VcxRDg9kr3ykokUeRV1/TPRR3+pN/SwC5fjv62+HwG3C4tb3DfGpdAHVb+l3BvvIW
 uo3aq8fCpm2E2YrplY+KvwQMHgVPbrsIVesZTtmr2Ku21/tlm46VDSYvvXMCK1jhVv
 XBzNMX4ScWWBxkf1CsgRWByYXYhUwiB7AuXrTU5hTSZIWGsL4ttlO1axyFx0nIeMiz
 Hr+pDlJKgKBOA==
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-220bfdfb3f4so20268245ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 06:01:54 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWiYQ7UUQfiCeOboy9xf+TAyb7XGmTIIAxNqJ56LhYaGqcglch1mdoh5AkCTAAdIsp5KQ9ZUDIhbB0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziFjllw1TYQOjegInfN4ThVdpQfj6d4xhayht4AhUN7mfh7Bfo
 X0J0f55ZM+zBtRBHNjI9QBc+RNRifGaijQoHsv8ZHA2j0m1wb8x35NC6kki3am4a+QzlOi+qwN2
 vWKcFrulqkv7/TMdMBIrDnzmINQ==
X-Google-Smtp-Source: AGHT+IFapzn+NKHW52s4K7DIT+hFK+iRpE1/gZU7kl7MdKEYaDixn7SWx5ZWS9wyFmn3w4NhHQTiw5+aDFJOtqZJANg=
X-Received: by 2002:a17:902:f689:b0:220:bd01:6507 with SMTP id
 d9443c01a7336-22170988a48mr119225175ad.25.1740060113565; Thu, 20 Feb 2025
 06:01:53 -0800 (PST)
MIME-Version: 1.0
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
 <20250217154836.108895-28-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250217154836.108895-28-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 20 Feb 2025 22:02:38 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8xmwncZUdjpfFNZdTc-xVm2tqE7yxFTOHK8=ihPfXL9g@mail.gmail.com>
X-Gm-Features: AWEUYZlmnVy895-w6W37aRIYiIz5B_4hc6yNRSLEcLY9PIsmLv3U1pSvn8yAnCY
Message-ID: <CAAOTY_8xmwncZUdjpfFNZdTc-xVm2tqE7yxFTOHK8=ihPfXL9g@mail.gmail.com>
Subject: Re: [PATCH v7 27/43] drm/mediatek: mtk_hdmi: Remove unused members of
 struct mtk_hdmi
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
> The hdmi_colorspace csp member of struct mtk_hdmi is initialized
> once but then it's never used at all.
> Remove said member and the only assignment to it as a cleanup.
>
> Also remove the ibias, ibias_up, min_clock, max_clock, min_hdisplay
> and max_vdisplay members, as those were really completely unused.
>
> This commit brings no functional changes.

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
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediat=
ek/mtk_hdmi.c
> index eb3b1009c305..6e4900f99b51 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -162,16 +162,9 @@ struct mtk_hdmi {
>         struct clk *clk[MTK_HDMI_CLK_COUNT];
>         struct drm_display_mode mode;
>         bool dvi_mode;
> -       u32 min_clock;
> -       u32 max_clock;
> -       u32 max_hdisplay;
> -       u32 max_vdisplay;
> -       u32 ibias;
> -       u32 ibias_up;
>         struct regmap *sys_regmap;
>         unsigned int sys_offset;
>         struct regmap *regs;
> -       enum hdmi_colorspace csp;
>         struct platform_device *audio_pdev;
>         struct hdmi_audio_param aud_param;
>         bool audio_enable;
> @@ -1036,7 +1029,6 @@ static int mtk_hdmi_output_init(struct mtk_hdmi *hd=
mi)
>  {
>         struct hdmi_audio_param *aud_param =3D &hdmi->aud_param;
>
> -       hdmi->csp =3D HDMI_COLORSPACE_RGB;
>         aud_param->aud_codec =3D HDMI_AUDIO_CODING_TYPE_PCM;
>         aud_param->aud_sample_size =3D HDMI_AUDIO_SAMPLE_SIZE_16;
>         aud_param->aud_input_type =3D HDMI_AUD_INPUT_I2S;
> --
> 2.48.1
>
