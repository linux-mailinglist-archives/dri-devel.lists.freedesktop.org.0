Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3AE7D4CAF
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 11:40:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 923D910E30E;
	Tue, 24 Oct 2023 09:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD7F910E30E
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 09:40:40 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-507b96095abso6333830e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 02:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1698140439; x=1698745239;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pFZJO3NvFyuTGjb36RJAaXGwhe1Ycdi/eoT9Ykdj5nc=;
 b=AnxwaCIY1RcHqK7dQh94sMAJR1y7IxX8G/BNlXV5pDmlYWv9cjSyRSH0UUVDcXm7Ms
 gLR4DgwtJDl9lBxsqfKJS+1WulLWZjx/VlDYWNq2EC8tZ/Q12bxPbR1S7hiDRc62JIfW
 YV+JBGxPoOnr+T4BUvDV1fUgoLprnfWgM0cdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698140439; x=1698745239;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pFZJO3NvFyuTGjb36RJAaXGwhe1Ycdi/eoT9Ykdj5nc=;
 b=Vrf1F/bDRxFVeqwZLdgufA3PVHnLsbpqflZiO/0lYAICCuGFwuVDW+PEZNGBU9ZHRC
 c9ch5z6I4fyTrvZ95YzLaN7wg14rvS+0i8veZ81bgSFrqSEJD+6zCfmbbSAQeO7LpAmr
 /R5422jF708SOrTkUVrcsH5nqLYz91UO8jwjhl9Cl8MeqqYEQmR0iMostzrv7cDQ5Nff
 JNZioaWysSqEaUZekvEcpq40s4PtIFkCA3CldfyCXBkDwNjO/CFF2epn8oHJqxjDUarI
 b9s0Xu0pBaK6y2cYp7Gj9V2L7aJjPUnaNEXnU9jon2W1F7P+gMuZK15maAHa9ZTIRTVI
 InTg==
X-Gm-Message-State: AOJu0YxP5H0UQPgvJ43pOS24iU0+GQbY/A3oQhbJCT4EChmKP4Bmm7y/
 UbaDAAl6dcPUyZkB1Hq8ELuPnupgvO74VEtUGZNNHA==
X-Google-Smtp-Source: AGHT+IFRZoOVcRS4ZKYarSnzLWrQREggh2jb5IX+ohhI5nUZEVJ5YlSwxKC/Th6J+FUnLbHbkRFl8qn3j0n8dWEz5WA=
X-Received: by 2002:ac2:58e2:0:b0:503:9eb:47f0 with SMTP id
 v2-20020ac258e2000000b0050309eb47f0mr7287602lfo.59.1698140438950; Tue, 24 Oct
 2023 02:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
 <20231023-display-support-v1-3-5c860ed5c33b@baylibre.com>
In-Reply-To: <20231023-display-support-v1-3-5c860ed5c33b@baylibre.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 24 Oct 2023 17:40:27 +0800
Message-ID: <CAGXv+5Hwe8jhgthnxwXEPezhwvhfcE=WMp_My3W8FisRagRTKQ@mail.gmail.com>
Subject: Re: [PATCH 03/18] dt-bindings: display: mediatek: color: add binding
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
Cc: devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, linux-pwm@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 23, 2023 at 10:40=E2=80=AFPM Alexandre Mergnat
<amergnat@baylibre.com> wrote:
>
> Display Color for MT8365 is compatible with another SoC.
> Then, add MT8365 binding along with MT8183 SoC.

This unfortunately doesn't match what the patch is doing.

ChenYu

> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml |=
 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,co=
lor.yaml
> index f21e44092043..fbf15242af52 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y=
aml
> @@ -39,6 +39,7 @@ properties:
>                - mediatek,mt8188-disp-color
>                - mediatek,mt8192-disp-color
>                - mediatek,mt8195-disp-color
> +              - mediatek,mt8365-disp-color
>            - const: mediatek,mt8173-disp-color
>    reg:
>      maxItems: 1
>
> --
> 2.25.1
>
>
