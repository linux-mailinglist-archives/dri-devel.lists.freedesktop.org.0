Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A142A3DCDC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 15:32:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C698089B70;
	Thu, 20 Feb 2025 14:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MRVxiU7o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D93AC89B70
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 14:32:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8F3F0614A4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 14:32:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7B4BC4CED1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 14:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740061922;
 bh=GoGvedSskUunt8JR0ab0OKe1KhMr9oaefFluEv4FAqY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MRVxiU7o67O3FIKBBl1kglyQ70mhNufEgyvsPm24+MnObiKppxwPDeGetnAbCnP1n
 bfInsRGRgTuWHoen6CmytTuo2OvSOwJkMnUVHwEAYef1ogM2pcoPjbZp9qkDolEEE/
 u1rCUshyBtkb2WhY4Fprtqm4fqT9yxPdzLw8GQYznAH270ttdYmBHAoMsZs3Cdtl27
 mvQalAbMWwa3ZBAgbfU6IFNCoEdpzh9zPOY61wFYG8WgLUxBAVq5vAVFkY04sC2d/X
 Rxms8YbodBco+uhh1HvvpwiA1sDRIv+8EGRX7e6oLC1f1kG5xbmMIX5PqelXRlDidB
 D+BXbBZHlHsQQ==
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2fc3027c7aeso2092808a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 06:32:02 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXftcneXlrjgY6DwgSp/hfXFsWummhAb1nBDtPldLuO564thv4uawmXr9XMFZP+7a1p7ifFm3b1URM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOl3cHopEs9fuQwHkGimeTmLJbf0fQbCQd2q2ZdENQbsOoUJUB
 cR/M54cJq2PH2nfaTdo2+tw/+vyZkhuyrVlycsAc8NfcQlR7ayyDdG6FH9CgFTq5e/anRhj7YNs
 PE3IVPBHG7sMXIuiFd+YPX9MQNw==
X-Google-Smtp-Source: AGHT+IEEvVnA4H81470tv1H4G5h0w0yEGHELm51+9xXj/GLBqX14Y9VHjS4nUzKS5Ntqk6uBqNxa9Lc6bKjwcl3wf1E=
X-Received: by 2002:a17:90b:3809:b0:2ee:d024:e4fc with SMTP id
 98e67ed59e1d1-2fc411509b7mr38299734a91.33.1740061922487; Thu, 20 Feb 2025
 06:32:02 -0800 (PST)
MIME-Version: 1.0
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
 <20250217154836.108895-34-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250217154836.108895-34-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 20 Feb 2025 22:32:47 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8a+oV_XwBACyy09bKdwKVy+iEPxbfZBkkdYm2jYD_k2w@mail.gmail.com>
X-Gm-Features: AWEUYZnj0eBVMJFGwcqYWEal64YwZLRUffmMdq4xRpXkJqA2A3_JsPYTIk5oAgc
Message-ID: <CAAOTY_8a+oV_XwBACyy09bKdwKVy+iEPxbfZBkkdYm2jYD_k2w@mail.gmail.com>
Subject: Re: [PATCH v7 33/43] drm/mediatek: mtk_hdmi: Cleanup function
 mtk_hdmi_resume()
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
> Remove the error print in case of mtk_hdmi_clk_enable_audio()
> failures: since the APIs will already print on their own, having
> one in there is redundant.

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
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediat=
ek/mtk_hdmi.c
> index 50f9ab48cbf9..2614561e2634 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1704,15 +1704,8 @@ static __maybe_unused int mtk_hdmi_suspend(struct =
device *dev)
>  static __maybe_unused int mtk_hdmi_resume(struct device *dev)
>  {
>         struct mtk_hdmi *hdmi =3D dev_get_drvdata(dev);
> -       int ret =3D 0;
>
> -       ret =3D mtk_hdmi_clk_enable_audio(hdmi);
> -       if (ret) {
> -               dev_err(dev, "hdmi resume failed!\n");
> -               return ret;
> -       }
> -
> -       return 0;
> +       return mtk_hdmi_clk_enable_audio(hdmi);
>  }
>
>  static SIMPLE_DEV_PM_OPS(mtk_hdmi_pm_ops, mtk_hdmi_suspend, mtk_hdmi_res=
ume);
> --
> 2.48.1
>
