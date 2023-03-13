Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3932D6B7B87
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 16:08:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E5C10E0CA;
	Mon, 13 Mar 2023 15:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D815C10E0CA
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 15:08:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 51F3E61341
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 15:08:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F29EAC433AC
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 15:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678720124;
 bh=S10P55qoSefp3tquh9o+ql/D/gx54XqqWmAW+yYAqF4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZPqVyGE2rEFwb0iHgg420twm9Dv7NRBiGQ0+Ox+4Ui+3iyrMJoysFuAZIWLGy0Hlr
 uCYfcncRpvwGXEHi2COdJUUvoNDgzmsoKWqf4hwYmtE9d9kLmE7gj/eOMwUlqIBlwm
 SsDaeS22cahCQEAOog5GXItXnKG6ofQmdIRU3keKjC1NSfpW7+7cM04e44BAzH35PE
 imHwLw4OigRkMMFaNyB7Efoco4TXppwpFntnjrJ3mL9GN0tHNOLtUcDd5VreZM9OeO
 W1F03kIYoSb3MEUSs89kzw3Sm72e9HniNftcNoFSkrFKZhDsFm0bLL9wd5F1g1Czsk
 l2dKUNHcFrqrw==
Received: by mail-lf1-f41.google.com with SMTP id s20so16106852lfb.11
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 08:08:43 -0700 (PDT)
X-Gm-Message-State: AO0yUKWodh7wjl9bHDNcfap3CZPOisTbmqG4LfaPHhzZg8prrgdHjvuH
 lZN+Gt2mW6/a1MX7ppxHxlfjp3jB5e06r3qAWQ==
X-Google-Smtp-Source: AK7set8O8oG4SXhOvRL6HCMEQolVFDwrGrQP5nswTrxrSjexg5YyYijOPMKZuhjj2e7ORk3z38TIJ8Y5USlb96Za1fE=
X-Received: by 2002:ac2:5923:0:b0:4d5:ca42:e43e with SMTP id
 v3-20020ac25923000000b004d5ca42e43emr11026612lfi.7.1678720122020; Mon, 13 Mar
 2023 08:08:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-9-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-9-45cbc68e188b@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 13 Mar 2023 23:08:30 +0800
X-Gmail-Original-Message-ID: <CAAOTY_--qP-PBBt9zZwcMewiWB-ow_n2XZSHFAz7FeU=v1Hj7g@mail.gmail.com>
Message-ID: <CAAOTY_--qP-PBBt9zZwcMewiWB-ow_n2XZSHFAz7FeU=v1Hj7g@mail.gmail.com>
Subject: Re: [PATCH 09/21] dt-bindings: display: mediatek: ovl: add binding
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Fabien Parent <fparent@baylibre.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Xinlei Lee <xinlei.lee@mediatek.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-pwm@vger.kernel.org,
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
> Display Overlay for MT8365 is compatible with another SoC.
> Then, add MT8365 binding along with MT8192 SoC.

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml | 1=
 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.=
yaml
> index a2a27d0ca038..20e4ca4fc915 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam=
l
> @@ -41,6 +41,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8186-disp-ovl
> +              - mediatek,mt8365-disp-ovl
>            - const: mediatek,mt8192-disp-ovl
>
>    reg:
>
> --
> b4 0.10.1
