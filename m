Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 338CA6B7B49
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 15:58:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0CDA10E561;
	Mon, 13 Mar 2023 14:58:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E015410E561
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 14:58:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4354A6131B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 14:58:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8993C4339E
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 14:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678719506;
 bh=jxq03yf7Xaet9VvXtMUxebKs/p10RnENOfVyO8UP0Lk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DLFsLjwo+BuHJT1ZiIB6bTBvN4gZMT25idQ6lmBXeqJaNIAChRP+0fDpi3hUr6C9Q
 oOMKZXCBRRoUSXHlmcEnePsR06R6o2cr+/GSXH6tE2nKh6nXZpVl/MG4QLbquyNKDC
 LWITduQsZqaKKdGI/crSA/t0VYnNvkz9V/TCHY02eLUFMgJiBvsQX/Za52pNDiF2l+
 uGQscnQyTocAPZSec3mVWpRxME/rEL9V9SOwumrPhDYcmxmBkGsMAK6D2D7u9WFagf
 YKdUJqMkT7E7eBtKI8izB8gWyG14cYQuPpUZxwUtX8q7ul4S8AchypF2U6knDo8Uhr
 76rn2PJNZ11Iw==
Received: by mail-lj1-f170.google.com with SMTP id t14so12920718ljd.5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 07:58:26 -0700 (PDT)
X-Gm-Message-State: AO0yUKVPkX1Y/DcFdyT4fECvp8R6L+g81A3YjXQEUSsOlRqFO+FbB6nt
 x2Ao2Q5H9YTcrGzDtY7t7urJrqBnZFqqslRZZA==
X-Google-Smtp-Source: AK7set93ppgf/8A7GowcaF9AMzop4M7RVXL14Ayxlc7lTWoPuXT4WNBru8d2Tw5m+TfhTYQd+XOp94bBcFBQulE38wc=
X-Received: by 2002:a2e:a36a:0:b0:295:9040:fb0b with SMTP id
 i10-20020a2ea36a000000b002959040fb0bmr10850100ljn.10.1678719504691; Mon, 13
 Mar 2023 07:58:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-3-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-3-45cbc68e188b@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 13 Mar 2023 22:58:12 +0800
X-Gmail-Original-Message-ID: <CAAOTY__Qam0O+VhU1st20O=srxggPXNyrCE2T76E+E8hd3Q7qQ@mail.gmail.com>
Message-ID: <CAAOTY__Qam0O+VhU1st20O=srxggPXNyrCE2T76E+E8hd3Q7qQ@mail.gmail.com>
Subject: Re: [PATCH 03/21] dt-bindings: display: mediatek: color: add binding
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
> Display Color for MT8365 is compatible with another SoC.
> Then, add MT8365 binding along with MT8183 SoC.

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml |=
 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,co=
lor.yaml
> index d2f89ee7996f..9d081da433e8 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y=
aml
> @@ -39,6 +39,7 @@ properties:
>                - mediatek,mt8186-disp-color
>                - mediatek,mt8192-disp-color
>                - mediatek,mt8195-disp-color
> +              - mediatek,mt8365-disp-color
>            - const: mediatek,mt8173-disp-color
>    reg:
>      maxItems: 1
>
> --
> b4 0.10.1
