Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D7DA3C136
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 15:05:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C97F510E2BC;
	Wed, 19 Feb 2025 14:05:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BUlQLfY8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6046A10E2BC
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 14:05:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9BB935C0F6B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 14:05:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74D5AC4CEE0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 14:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739973950;
 bh=85tPlsB4usIu6yhe/BHQqQ4y6WX5bDga5umRKzU2bKY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BUlQLfY8V3xQrs5YrlQNv3smrE6Q7+YS5w+c+n95W1TBOprHNjsOYaI1d93dFRSuS
 Jj6eNJrTjb30dsRR2H83KNhHckPWX1D30v1Z3L8HrjzhCmVACDogFuUUKz60P0tNM4
 phxfX9Ewg14lO3NDcDO6v+/G5OlFXIcawGUCSrR9tsd5ViNVr0HgRpqiMHIaJL9QoQ
 35ebM/cE25/0P9ThxM2X6VnbAAdRnyD5jDmSeqJyVzut7DBFvOBlg5T3VvTvE4AVlz
 zd+5enri1W/wbw3Q20QvWCmbTIm7SS08GAiDJ3gAy/KAwFAJYJWsUWH8wA23aixsGj
 gDmAcyEcRG4Gg==
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2fa8ac56891so9795250a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 06:05:50 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU9SC5ZtYoHCO2MKnSPs67pWR2hsCD6W3P2iaSVMwVwx88p1Eakv9PP1xlTx6tI/oo0NXA9NtPvSjM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNS9KHX/hDsu7ndCSYJJvd1Dh1tQzV9AbzMDDoxHuwU+UqA2XL
 oDLYINxQqeppHtdhVh0BW+FM2bgifP6eFeBecO8k/2mp9E0Yu5BrZ/pTTQg8e6JxwAE+/iZ7zq6
 CczMEOGlGPsScMeyxt1AAnmCmQQ==
X-Google-Smtp-Source: AGHT+IEsdOUobKrxzG2bHgh8FAnY3IxI3OdMrs5IpBFPR0BmaGsai+pHLZwpl46Br4o8jc93c37YtHPS/ZvBONvysZQ=
X-Received: by 2002:a17:90b:510c:b0:2ee:ab29:1a57 with SMTP id
 98e67ed59e1d1-2fc40d13203mr28805344a91.2.1739973950021; Wed, 19 Feb 2025
 06:05:50 -0800 (PST)
MIME-Version: 1.0
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
 <20250217154836.108895-20-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250217154836.108895-20-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 19 Feb 2025 22:06:35 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-BaK-160A4=oWKkEuYnJE69BXqk7CY3yoc71zn-M9y+Q@mail.gmail.com>
X-Gm-Features: AWEUYZlzg0d2_e6rOyz76Y9yADZ6uIl1Va12EUEGab7yKc_JPlmQYlOnNcjVbhg
Message-ID: <CAAOTY_-BaK-160A4=oWKkEuYnJE69BXqk7CY3yoc71zn-M9y+Q@mail.gmail.com>
Subject: Re: [PATCH v7 19/43] drm/mediatek: mtk_hdmi: Fix typo for
 aud_sampe_size member
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
> Rename member aud_sampe_size of struct hdmi_audio_param to
> aud_sample_size to fix a typo and enhance readability.
>
> This commit brings no functional changes.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Fixes: 8f83f26891e1 ("drm/mediatek: Add HDMI support")
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediat=
ek/mtk_hdmi.c
> index 29000cfcf761..6257503ce639 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -136,7 +136,7 @@ enum hdmi_aud_channel_swap_type {
>
>  struct hdmi_audio_param {
>         enum hdmi_audio_coding_type aud_codec;
> -       enum hdmi_audio_sample_size aud_sampe_size;
> +       enum hdmi_audio_sample_size aud_sample_size;
>         enum hdmi_aud_input_type aud_input_type;
>         enum hdmi_aud_i2s_fmt aud_i2s_fmt;
>         enum hdmi_aud_mclk aud_mclk;
> @@ -1033,7 +1033,7 @@ static int mtk_hdmi_output_init(struct mtk_hdmi *hd=
mi)
>
>         hdmi->csp =3D HDMI_COLORSPACE_RGB;
>         aud_param->aud_codec =3D HDMI_AUDIO_CODING_TYPE_PCM;
> -       aud_param->aud_sampe_size =3D HDMI_AUDIO_SAMPLE_SIZE_16;
> +       aud_param->aud_sample_size =3D HDMI_AUDIO_SAMPLE_SIZE_16;
>         aud_param->aud_input_type =3D HDMI_AUD_INPUT_I2S;
>         aud_param->aud_i2s_fmt =3D HDMI_I2S_MODE_I2S_24BIT;
>         aud_param->aud_mclk =3D HDMI_AUD_MCLK_128FS;
> @@ -1529,14 +1529,14 @@ static int mtk_hdmi_audio_hw_params(struct device=
 *dev, void *data,
>         switch (daifmt->fmt) {
>         case HDMI_I2S:
>                 hdmi_params.aud_codec =3D HDMI_AUDIO_CODING_TYPE_PCM;
> -               hdmi_params.aud_sampe_size =3D HDMI_AUDIO_SAMPLE_SIZE_16;
> +               hdmi_params.aud_sample_size =3D HDMI_AUDIO_SAMPLE_SIZE_16=
;
>                 hdmi_params.aud_input_type =3D HDMI_AUD_INPUT_I2S;
>                 hdmi_params.aud_i2s_fmt =3D HDMI_I2S_MODE_I2S_24BIT;
>                 hdmi_params.aud_mclk =3D HDMI_AUD_MCLK_128FS;
>                 break;
>         case HDMI_SPDIF:
>                 hdmi_params.aud_codec =3D HDMI_AUDIO_CODING_TYPE_PCM;
> -               hdmi_params.aud_sampe_size =3D HDMI_AUDIO_SAMPLE_SIZE_16;
> +               hdmi_params.aud_sample_size =3D HDMI_AUDIO_SAMPLE_SIZE_16=
;
>                 hdmi_params.aud_input_type =3D HDMI_AUD_INPUT_SPDIF;
>                 break;
>         default:
> --
> 2.48.1
>
