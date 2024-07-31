Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBD19430F8
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 15:34:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE6CD10E637;
	Wed, 31 Jul 2024 13:34:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZnHFNj3V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F1910E629
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 13:34:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 972E9623F6
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 13:34:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C762C4AF09
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 13:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722432869;
 bh=A+80YZ1JEr//DzbbfCPYd8sgD69akjqIYMI4pV9hTXo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZnHFNj3VxhaEY5RPZEthUUpJti6CuGvrzLT5UiOZjIqeBX6sW8OshcUR3VfVPpdkA
 SQmCMXJlsQDYqdmtoJ1/cpwhOimBiBUalB+KOO45moiDx2mPC+3zINLaWJnGND6N/B
 AYVlpy+hyWUiZqxGXR5hP/nDn5yq/Bhs/BPtLplu1QhNPBMbFj/jUF2eTfMSPWMsdl
 t6nRWKjSTASv/54p/b53VsXUxdgwJqonT4gv9PvBxNBw28tAdUivjVe456TuyLJqZz
 LX4x0RgYav53nNo7zRnTd/TqWiqEwFRCQuJmQWh3zuT8ZQIOvo/CcXFPBz/hrTZgBP
 pW/QmB7x/TbIw==
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-70d399da0b5so5011003b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 06:34:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXUYWs2spklTOliZGZaARXlxVJZIi7LurgJwf5nZyXfZeQbxo8/F1Zvk+/eoR8Jr2b8QSfIwcdNU8d1yD4T13dm/ToCYqbHMiHL6/DqvDw6
X-Gm-Message-State: AOJu0YwPtpxcWepN4acqKne2Af9eFDEv/fk4Vv4MiCF5shHP8wXi/TnH
 rSGdOKXl3diL7LcI05xLzfqRuqVtlU0rCrQpuwIIhOyM9QTzfN6hONiw7u/jk2zKHxNriC/vI/U
 eAnj3VTAR0HAKhc2GqZwEONXAXA==
X-Google-Smtp-Source: AGHT+IFcXLX+kvOqT2wFnw1+ymXM2RCkqARP0iez8K/CuS6OcnyEGO/v4tJGIFKipqmPugj8auqSb13TYf9e2F5nJRc=
X-Received: by 2002:a05:6a21:328e:b0:1c4:6be3:f571 with SMTP id
 adf61e73a8af0-1c4a13a375fmr17120024637.39.1722432868814; Wed, 31 Jul 2024
 06:34:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240717-alpha-blending-v4-0-4b1c806c0749@mediatek.com>
In-Reply-To: <20240717-alpha-blending-v4-0-4b1c806c0749@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 31 Jul 2024 21:34:39 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8ThuusfHk9Gd5pFP8VhJkG2seuJmkFiruK1rPQFZGBzg@mail.gmail.com>
Message-ID: <CAAOTY_8ThuusfHk9Gd5pFP8VhJkG2seuJmkFiruK1rPQFZGBzg@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Support alpha blending in MTK display driver
To: shawn.sung@mediatek.com
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>,
 CK Hu <ck.hu@mediatek.com>
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

Hi, Shawn:

Hsiao Chien Sung via B4 Relay
<devnull+shawn.sung.mediatek.com@kernel.org> =E6=96=BC 2024=E5=B9=B47=E6=9C=
=8817=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=881:24=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> Support "Pre-multiplied" and "None" blend mode on MediaTek's chips by
> adding correct blend mode property when the planes init.
> Before this patch, only the "Coverage" mode (default) is supported.

For the whole series, applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.=
com>
> ---
> Changes in v4:
> - Add more information to the commit message
> - Link to v3: https://lore.kernel.org/r/20240710-alpha-blending-v3-0-289c=
187f9c6f@mediatek.com
>
> Changes in v3:
> - Remove the Change-Id
> - Link to v2: https://lore.kernel.org/r/20240710-alpha-blending-v2-0-d4b5=
05e6980a@mediatek.com
>
> Changes in v2:
> - Remove unnecessary codes
> - Add more information to the commit message
> - Link to v1: https://lore.kernel.org/r/20240620-blend-v1-0-72670072ca20@=
mediatek.com
>
> ---
> Hsiao Chien Sung (5):
>       drm/mediatek: Support "None" blending in OVL
>       drm/mediatek: Support "None" blending in Mixer
>       drm/mediatek: Support "Pre-multiplied" blending in OVL
>       drm/mediatek: Support "Pre-multiplied" blending in Mixer
>       drm/mediatek: Support alpha blending in display driver
>
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 36 +++++++++++++++++++++++++--=
------
>  drivers/gpu/drm/mediatek/mtk_ethdr.c    | 13 +++++++++---
>  drivers/gpu/drm/mediatek/mtk_plane.c    | 11 ++++++++++
>  3 files changed, 49 insertions(+), 11 deletions(-)
> ---
> base-commit: 8ad49a92cff4bab13eb2f2725243f5f31eff3f3b
> change-id: 20240710-alpha-blending-067295570863
>
> Best regards,
> --
> Hsiao Chien Sung <shawn.sung@mediatek.com>
>
>
