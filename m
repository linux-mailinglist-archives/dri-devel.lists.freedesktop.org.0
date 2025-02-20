Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B167DA3DC9D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 15:25:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA22A10E988;
	Thu, 20 Feb 2025 14:25:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fgYP5nVX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF1610E97E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 14:25:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 32A065C5E35
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 14:24:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9C0EC4CEEA
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 14:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740061520;
 bh=iJw0LuLV1NQL5MljcDvcrTafJWx8F0Mgu90Nuo9CPBQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fgYP5nVX6K3cEeC6Xtpa2YYOrXt4jQeXL8JCyvGMF/Wq9c/Dl1/rzYfnGKwkDKuVR
 gHb6C+na0d68Og2C7gXIj0iZJM/3qULNH6hQDAa+vTSZk+GFYMOa3A6fCw2mvk5u6/
 5uVn7cN2Q4sF+6TSewFuRa6c15BcwOzD6G3+xxYO1TO42azPYmzrGDuN94WZ9MN13A
 /zC+sCSTBD90yJpZAjlY+scHgCW6bQaqC1h6OSdy3vVf4GhwPcG90FifloOqbqG+JM
 Q3kcjg4+GG8Qe7hehQ2kR6/y1OqdCXRiFqVcwDx9tuwEGi1ReteqysuVMEMzKcrt/F
 TSz8OW1ul2wig==
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-2fc1c80cdc8so1650126a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 06:25:20 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUtAmu0skokGWG+z7ENAuVlTuaDL8lnRRT6x/+yb0gMxYNgRn4iWQReww8yzYYtx4v6e71Rbidz/ew=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHmnGAbLfuwUqYWqRB3847AG7YFR8Nt/b4hKFlIy+F2uzTDetA
 CBS1ks3rnYPun9/75kJ9nhk0YVNO6l2jAlo16SNsmMFnweoawBj/EGbbwbJEAzie0Yj6VmBelL3
 /znV38faq4Zhgy46IG7zK56rlQA==
X-Google-Smtp-Source: AGHT+IG6zBpHgkEKWKPXjExGKcMJ3P8RA+4Pl+cW3k6VsvdLJSFhWdQ6SLc1qU7bLx4Pas4JfqVSRji56XJkJ5sp9FQ=
X-Received: by 2002:a17:90b:510b:b0:2ee:f076:20f1 with SMTP id
 98e67ed59e1d1-2fcb56e68dfmr15217411a91.0.1740061520261; Thu, 20 Feb 2025
 06:25:20 -0800 (PST)
MIME-Version: 1.0
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
 <20250217154836.108895-33-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250217154836.108895-33-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 20 Feb 2025 22:26:05 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-54w+_nZtoKiOjw0z3+BxoygKR0zUvUevW4ZijrBWA4Q@mail.gmail.com>
X-Gm-Features: AWEUYZm7oGrflVbB-goWTArAWPiYKFdjfVm86uPsqne31Recqtf46FuqDQvfcSk
Message-ID: <CAAOTY_-54w+_nZtoKiOjw0z3+BxoygKR0zUvUevW4ZijrBWA4Q@mail.gmail.com>
Subject: Re: [PATCH v7 32/43] drm/mediatek: mtk_hdmi: Remove driver bound to
 HDMI print
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
> Remove the "driver bound to HDMI" print to avoid useless spam in
> the kernel log, as registered and bound drivers can be debugged
> through debugfs.

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
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediat=
ek/mtk_hdmi.c
> index 2e98a8ed6cbe..50f9ab48cbf9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1632,7 +1632,6 @@ static int mtk_hdmi_register_audio_driver(struct de=
vice *dev)
>         if (ret)
>                 return ret;
>
> -       DRM_INFO("%s driver bound to HDMI\n", HDMI_CODEC_DRV_NAME);
>         return 0;
>  }
>
> --
> 2.48.1
>
