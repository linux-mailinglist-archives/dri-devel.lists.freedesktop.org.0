Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3229ACCC6
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 16:38:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C5E10E7FA;
	Wed, 23 Oct 2024 14:38:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Y7jGJCf5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC7D10E7FA
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 14:38:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CC0C2A44F99
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 14:38:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AADD3C4CEE6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 14:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729694321;
 bh=0JqvrPoAl0IeTaLk4IwiVcZMi7aNs5KY80Y/mwm0Ihs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Y7jGJCf5XPlg6FhMcZZxHnU43XGMqCWy0zgJZiTZw3LmL9uIaoEggURVp2ODsOpdo
 +300kakIpAx0/GKN3TnxZyh5oEhjHgtwTuMtIqsGukcF6Zndd49LtkNXg1gbGYx0vj
 5DGX4Dh1AZTC26GNlCEWSzsgFWMxRuV8kJFELNuCzSUcnWlNL2t+ac8d7WNbUeknf6
 gRz6eUNoXkcuOIN6xMWt4etfHrdyk/bG4MaA6a0DtuyUQ6tseUKopwP3cPdIzako4Y
 CN/903JmCJLvpQokdP3vjoykoEMq9kWDubY2Kpn9uW1DKHPuc++54KNYjkTH1GY53F
 +2S2JKwAzjB/g==
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-71e467c3996so4610887b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 07:38:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU9UCIrvxjTuJgF/B6hO7jrD3Rn4bZlCaqFPNSnihpuSieykAL0VNFPB/TusZUr/3jyPrLO1D66cxY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyptCE7NLflWzy9I9udn+MZBSUDNgnyiZRD2xz+I4OwS5y3ADG9
 3q+zzrqWBJ16qjwnlMPfIkpfI0q155VBPnbQiNRT4ZINwjRNNujY6DF9kX5mq+mdFX8R4tuapEQ
 e8hZ0gu/Ss3khQTYIv17PvExjEQ==
X-Google-Smtp-Source: AGHT+IG/RdVxY7RG85NyF0P3I6XAtxRrRLMBLPXslpGReJZYhGUeFy1bxVKhKy/eGSVOAqET/hE7xY0gvgcONdeUlT4=
X-Received: by 2002:a05:6a00:ccf:b0:71e:795f:92e4 with SMTP id
 d2e1a72fcca58-72030a61bccmr4130356b3a.2.1729694321137; Wed, 23 Oct 2024
 07:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <20241019052935.553886-1-fshao@chromium.org>
In-Reply-To: <20241019052935.553886-1-fshao@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 23 Oct 2024 22:39:02 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9qjcZoQS3KqEqbhKNw9nza+1ggXN44snwThzjLLJ2KNw@mail.gmail.com>
Message-ID: <CAAOTY_9qjcZoQS3KqEqbhKNw9nza+1ggXN44snwThzjLLJ2KNw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: mediatek: dpi: Update device list
 with power-domains
To: Fei Shao <fshao@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, CK Hu <ck.hu@mediatek.com>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
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

Hi, Fei:

Fei Shao <fshao@chromium.org> =E6=96=BC 2024=E5=B9=B410=E6=9C=8819=E6=97=A5=
 =E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=881:30=E5=AF=AB=E9=81=93=EF=BC=9A
>
> There are two kinds of MediaTek DPI devices in the tree: the ones with a
> power domain and those without (or missing). The former are the majority
> and are more common in newer DTs. Only three older DTs fall into the
> latter category: MT2701, MT7623 and MT8192.
>
> However, the current binding only allows particular DPI devices to have
> power domains, which results in spurious binding check errors against
> existing and new DTs.
>
> Instead of diligently maintaining the allowed list, let's do it the
> other way around - create an exception list for devices that are fine
> not specifying a power domain. This list is expected to be fixed, and it
> encourages new MTK DPI devices to describe their power domain whenever
> possible; if not, those should be listed with proper rationale.

I've applied patch [1]. I think that patch fix the same problem with this p=
atch.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
commit/?h=3Dmediatek-drm-fixes&id=3Daf6ab107ce2c338790c6629fe0edc0333e708be=
8

Regards,
Chun-Kuang.

>
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
>
>  .../bindings/display/mediatek/mediatek,dpi.yaml   | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.=
yaml
> index 3a82aec9021c..c464642bbfb6 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam=
l
> @@ -81,14 +81,13 @@ required:
>
>  allOf:
>    - if:
> -      not:
> -        properties:
> -          compatible:
> -            contains:
> -              enum:
> -                - mediatek,mt6795-dpi
> -                - mediatek,mt8173-dpi
> -                - mediatek,mt8186-dpi
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt2701-dpi
> +              - mediatek,mt7623-dpi
> +              - mediatek,mt8192-dpi
>      then:
>        properties:
>          power-domains: false
> --
> 2.47.0.rc1.288.g06298d1525-goog
>
