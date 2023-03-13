Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 120796B7B7F
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 16:07:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBDE810E56A;
	Mon, 13 Mar 2023 15:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7740A10E568
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 15:07:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2F909B81189
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 15:07:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68EE3C433A8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 15:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678720070;
 bh=9uDAGZu4CJyMoYzZK2RUuQqShh9kqX6wJsiU6PIlzuE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qLMBvQhsNBgoWCgd+R9FhR31f+41+FX6l3p7oDgiAvisb1mK8aFGZeUWxTXcRinyM
 A+9EJOnF3pr9gdQ+xqubBulIiZOFXfZ6IE2VWj4dqBlBh1ZCodv19JbU1PLy0l0Phe
 dWuuZsI12q+YpDn/DW4XagMSw4VDFLGeD0YUQ0FwN7N5LO50rwjmQ+8x7qCQDEiN2B
 ZwRW7ySB2tMHBfhmdf7w5Rr28ejjmZkX4P36GYwyZ0T1BeA78MHKSrwhDQVcnbbpd9
 uapqtSh+bFX4p0MTokoXCoFnBsrhW9O0RSRpCHYUQY4X3nkgOHe4OSI+Sbohl45qkA
 31vSu0JOc0MwQ==
Received: by mail-lj1-f180.google.com with SMTP id b10so12993241ljr.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 08:07:50 -0700 (PDT)
X-Gm-Message-State: AO0yUKVNTav5biBVrCGVZJl6r6JkIQFsA6U1VUkreoI/k+j/KLCoUSAL
 HMwzezSAETHYzcGt3LpDAuiiQWvfBCreeu5oBQ==
X-Google-Smtp-Source: AK7set96FceeAgzIrNFk6O5tGtdzNZKS74mjeYqgSiEvYzM4A13lNdDb9HBRGzIk8lESKcb8+sqursSIAO3pnU2VYxM=
X-Received: by 2002:a2e:b55c:0:b0:295:d632:ba20 with SMTP id
 a28-20020a2eb55c000000b00295d632ba20mr10877049ljn.10.1678720068446; Mon, 13
 Mar 2023 08:07:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-8-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-8-45cbc68e188b@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 13 Mar 2023 23:07:36 +0800
X-Gmail-Original-Message-ID: <CAAOTY__1rm_neb7UPDt0xum2Yr81++Z+uz0KMsLRm2QLvBUSFQ@mail.gmail.com>
Message-ID: <CAAOTY__1rm_neb7UPDt0xum2Yr81++Z+uz0KMsLRm2QLvBUSFQ@mail.gmail.com>
Subject: Re: [PATCH 08/21] dt-bindings: display: mediatek: gamma: add binding
 for MT8365 SoC
To: Alexandre Mergnat <amergnat@baylibre.com>
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
Cc: linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Xinlei Lee <xinlei.lee@mediatek.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Alexandre:

Alexandre Mergnat <amergnat@baylibre.com> =E6=96=BC 2023=E5=B9=B43=E6=9C=88=
9=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8810:23=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Display GAMMA for MT8365 is compatible with another SoC.
> Then, add MT8365 binding along with MT8183 SoC.

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml |=
 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ga=
mma.yaml
> index a89ea0ea7542..f54859cfc97b 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y=
aml
> @@ -30,6 +30,7 @@ properties:
>                - mediatek,mt8186-disp-gamma
>                - mediatek,mt8192-disp-gamma
>                - mediatek,mt8195-disp-gamma
> +              - mediatek,mt8365-disp-gamma
>            - const: mediatek,mt8183-disp-gamma
>
>    reg:
>
> --
> b4 0.10.1
