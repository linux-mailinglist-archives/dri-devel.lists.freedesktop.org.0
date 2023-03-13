Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDF86B7B1A
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 15:54:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF6E10E560;
	Mon, 13 Mar 2023 14:54:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F85D10E560
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 14:54:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8292461320
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 14:54:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F1EEC433A7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 14:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678719288;
 bh=RVi6fYh4jybclxQm3QSDLUaM4YKWRTrtAmRx285rCA8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cM1G27iTXCbtjnquaYYI3WJoOMkxRI7Lg095C+TvPxUqCEG2N9PUrxt+4eDw6Fo13
 1s8k6MItUTpVNKa466frh53U1N3ZpaekD7nqaiLSp7FybBL3uUcBP++EZvYHAQ20ul
 MFrbjP905X7LNe/hZhEN9foi4qomPCRpSuU7ucFdlCB4klOzGHjhIBhjqKhPP8vUMd
 f8T8Ys1ZbqfFrgIjmXI49fdZLOPIGdxpJ61c9SjN2ShfiCQdQDZtolEumHknDrtqDb
 fEFCRNUyCrX7quaNtC+090z1yZbCr+74VgXRZZrM6q3RjkumiWehRc1syj8lMQQhq0
 3Ln7vyB+XJ95A==
Received: by mail-lf1-f48.google.com with SMTP id r27so16041124lfe.10
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 07:54:48 -0700 (PDT)
X-Gm-Message-State: AO0yUKXvjkcfz7u36JJNDbDY3ufbfageJkTbfnHk6TMVEZ3ZsrJunmG4
 QWVqFPqn0qV7mcR3K+1fEajKN5EnVHzuZiTvWA==
X-Google-Smtp-Source: AK7set91DAOiAyN87RQ56AGE3nCFsEr0OgCQZvbecBdzLpNVYUAUkjxVgFVuI9G8uAGwMUvkIQJG6G76y+EnIBlWV1A=
X-Received: by 2002:ac2:4c29:0:b0:4e8:4117:67c8 with SMTP id
 u9-20020ac24c29000000b004e8411767c8mr1602846lfq.7.1678719286373; Mon, 13 Mar
 2023 07:54:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-2-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-2-45cbc68e188b@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 13 Mar 2023 22:54:34 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-k2YoVjQExBvqYbN-Gk7vc4-FiB3UhzBXARzS_aAyCYg@mail.gmail.com>
Message-ID: <CAAOTY_-k2YoVjQExBvqYbN-Gk7vc4-FiB3UhzBXARzS_aAyCYg@mail.gmail.com>
Subject: Re: [PATCH 02/21] dt-bindings: display: mediatek: ccorr: add binding
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
> Display Color Correction for MT8365 is compatible with another SoC.
> Then, add MT8365 binding along with MT8183 SoC.

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml |=
 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,cc=
orr.yaml
> index 63fb02014a56..fc999e614718 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y=
aml
> @@ -32,6 +32,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8186-disp-ccorr
> +              - mediatek,mt8365-disp-ccorr
>            - const: mediatek,mt8183-disp-ccorr
>
>    reg:
>
> --
> b4 0.10.1
