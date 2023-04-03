Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C38136D4E0D
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 18:36:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAEB610E511;
	Mon,  3 Apr 2023 16:36:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448A110E511
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 16:36:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A3CA8621B4
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 16:36:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 133BCC433A4
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 16:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680539806;
 bh=Kt9moSViwJx5yBWxvRA4G9k3CxuCk+dcQWzL3AwN3FE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ahWI5wtUMMDF/JK6RX094BK6NZ4T3EfR3FIlVMMZneVIfsnYjpL09ROA1rQ6N5jfQ
 sRX9euqVfFzODLoLQso+AiLu0FoMjhWvYGA5C7Cdd/+NzJiHkqmP5bCMRxQPmEli69
 URsh71mUZUFo3QSt1BlR6mhlS4XBNMQXcRgbncFMGYq8HoteBav1rRoR3IrUzF67dp
 Vs/ZGSfMozsTso9jBogHMNAOICUDN1o7lp1uSHkGCUmL7mxK1k7BW5g/kCsM1bVBFr
 8dtlBK8VMT8B6Om9g1PGZ+jeQxgi5TI2dbmkKnwTP3tQ7/cI3ydNFRXEp4NS7lXPPF
 Is0zZPWMKCb/w==
Received: by mail-lj1-f182.google.com with SMTP id h9so31004813ljq.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Apr 2023 09:36:45 -0700 (PDT)
X-Gm-Message-State: AAQBX9fc+ysSsfpw1lvy73K78/4jKyB5YnytucNTUpHbGsdgTE3Hdfn9
 QqixHFHb326hp2olpYFIRctKTzZ9kMJi40G+7w==
X-Google-Smtp-Source: AKy350YI8MSRmypV7liUfnAR04I0V60fJ/SJAQ6mMQYLy3vXtuAOgKEuMnQZv1aQSY0uDcu20Z1RIZDPBPLHhmfbBBA=
X-Received: by 2002:a2e:9dda:0:b0:2a6:199a:bd38 with SMTP id
 x26-20020a2e9dda000000b002a6199abd38mr30959ljj.10.1680539804050; Mon, 03 Apr
 2023 09:36:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230403071929.360911-1-jstephan@baylibre.com>
 <20230403071929.360911-3-jstephan@baylibre.com>
In-Reply-To: <20230403071929.360911-3-jstephan@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 4 Apr 2023 00:36:32 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-cd0gQ6AEK_bLZf6m87M0G7Ag_AYKKPBFyBXGgh-2y1g@mail.gmail.com>
Message-ID: <CAAOTY_-cd0gQ6AEK_bLZf6m87M0G7Ag_AYKKPBFyBXGgh-2y1g@mail.gmail.com>
Subject: Re: [PATCH 2/2] phy: mtk-mipi-csi: add driver for CSI phy
To: Julien Stephan <jstephan@baylibre.com>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "open list:DRM DRIVERS FOR MEDIATEK" <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek USB3 PHY DRIVER"
 <linux-mediatek@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Andy Hsieh <andy.hsieh@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Louis Kuo <louis.kuo@mediatek.com>, Phi-bang Nguyen <pnguyen@baylibre.com>,
 "moderated list:ARM/Mediatek USB3 PHY DRIVER"
 <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Julien:

Julien Stephan <jstephan@baylibre.com> =E6=96=BC 2023=E5=B9=B44=E6=9C=883=
=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=883:20=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> From: Phi-bang Nguyen <pnguyen@baylibre.com>
>
> This is a new driver that supports the MIPI CSI CD-PHY for mediatek
> mt8365 soc
>
> Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> [Julien Stephan: use regmap]
> [Julien Stephan: use GENMASK]
> Co-developed-by: Julien Stephan <jstephan@baylibre.com>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  .../bindings/phy/mediatek,csi-phy.yaml        |   9 +-
>  MAINTAINERS                                   |   1 +
>  drivers/phy/mediatek/Kconfig                  |   8 +
>  drivers/phy/mediatek/Makefile                 |   2 +
>  .../phy/mediatek/phy-mtk-mipi-csi-rx-reg.h    | 435 ++++++++++++++++++
>  drivers/phy/mediatek/phy-mtk-mipi-csi.c       | 392 ++++++++++++++++
>  6 files changed, 845 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/phy/mediatek/phy-mtk-mipi-csi-rx-reg.h
>  create mode 100644 drivers/phy/mediatek/phy-mtk-mipi-csi.c
>

[snip]

> +
> +#define REGMAP_BIT(map, reg, field, val) \
> +       regmap_update_bits((map), reg, reg##_##field##_MASK, \
> +                          (val) << reg##_##field##_SHIFT)
> +

Use FIELD_PREP() macro  so you can drop the definition of SHIFT symbol.

Regards,
Chun-Kuang.
