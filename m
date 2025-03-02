Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED725A4B2D3
	for <lists+dri-devel@lfdr.de>; Sun,  2 Mar 2025 17:07:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D8910E18F;
	Sun,  2 Mar 2025 16:07:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TLEwWNmR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC4B10E18F
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 16:07:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 755E4611C3
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 16:06:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60B2FC4CEE6
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 16:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740931621;
 bh=6Z1K2XeEqTJ+PjSTHPmZvbQCAwrBgXMnsTzeuQ32us4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TLEwWNmRzoxu50gGetzLmCrV55ix9FhhrsO+ah2335y0pn9Qi3RFBfkZYkYOMS2ab
 j9TjFANBQb+7XL6fMzePFbbvwAN7fMzd+fPngIunbIpQ5mhvfdDzuEFiBkS9YU4WVs
 zpJ38yLhwZYTN79b/EvKXeFBpHgyPRR1LG8yei1iV882TMyauEBkHI0lhsvb9Udwhj
 khewVtukix9yqVAnPHB5w3JAXCfWS0Vtx3NR/1vcQp8NkoOoZZ97hBHfMdKuOTWxK3
 MpXDyRlc4Btp+XN74DkPAyeUa0/j+hd/C0QFzKjkDfGb4Ke4tQ/96asbH8mU6mELPR
 oVWCFltGcEQvg==
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2feae794508so4835212a91.0
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Mar 2025 08:07:01 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUr/tnQJW2f4Tk8S5Ydi5uI6ehWl6kY8LfvVR7SwIV43vZscH1xMp4GpUh2/dgM1AdeZNB/I7D8Cfo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzH76LL6WzL0STHexSyhNwUhfkGkmTDw5+mS5+Q1Hv87b51tPbv
 2//NVfC9ut1qJ8nxKbXonD78j6qsxM9a1Jg95ypkJvBTZmmgW6n6TihHCJ3pw6tqaUmwiR2yk/j
 lsuDv2s1edBKaJnxIrni9zybHwg==
X-Google-Smtp-Source: AGHT+IGgpVK4aKVTw1AYLTQHunnH0lP0Xo7e0HySRK7+dlps4YjnoiELgWFMnKkx9EIddZ2irPPWBjpXbYwY6LnMy7Q=
X-Received: by 2002:a17:90b:3511:b0:2fa:1f1b:3db2 with SMTP id
 98e67ed59e1d1-2febabcfedfmr14936364a91.25.1740931620948; Sun, 02 Mar 2025
 08:07:00 -0800 (PST)
MIME-Version: 1.0
References: <20250218090427.20318-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250218090427.20318-1-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 3 Mar 2025 00:07:48 +0800
X-Gmail-Original-Message-ID: <CAAOTY__aFqL=LnE5vU2RP9JHmQEgkrvPmiYjxmETWo9CvwiwLA@mail.gmail.com>
X-Gm-Features: AQ5f1JrHQ_avSblgi4HZQ7x19rsI4_LP2M6FFBaV9IRM5Ur_SJsfW7MiHzcF_cw
Message-ID: <CAAOTY__aFqL=LnE5vU2RP9JHmQEgkrvPmiYjxmETWo9CvwiwLA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: mediatek: dsc: Add MT8188 compatible
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com, pablo.sun@mediatek.com
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
2025=E5=B9=B42=E6=9C=8818=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=885:0=
4=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Add compatible for Display Stream Compression (DSC) IP found in
> the display controller of the MT8188 SoC.
>
> This IP is fully compatible with the one found on MT8195.

Applied to mediatek-drm-next [1], thanks.

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.=
git/log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dsc.yaml     | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dsc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.=
yaml
> index 846de6c17d93..a5b88eb97e3b 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yam=
l
> @@ -22,6 +22,9 @@ properties:
>      oneOf:
>        - enum:
>            - mediatek,mt8195-disp-dsc
> +      - items:
> +          - const: mediatek,mt8188-disp-dsc
> +          - const: mediatek,mt8195-disp-dsc
>
>    reg:
>      maxItems: 1
> --
> 2.48.1
>
