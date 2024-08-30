Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE49966169
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 14:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA50410E0E4;
	Fri, 30 Aug 2024 12:18:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YX6Gpw1i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4502F10EA95
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 12:18:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id E017EAE41BE
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 12:18:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3290BC4CED1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 12:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725020300;
 bh=fzW3G+TfB+bO5ebL/bX9LdeCTen9lbExGhAdJz/gUE8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YX6Gpw1iAM1qcXKu7BASnn7Qo45teZi4XXjDrmwn/Vm4TnZW3bXHuZf+aIV8rnhz0
 7VJ9gf240vFlFx69v7Gytuo+daKbx/S4payvqKJCL+wpO6Oj2vwKuHWo7VYnjGJPaH
 41rQ1hCheK7YWyiteSj1QCLB193pxleVPtw7pyJvPaKHgasT2isgNCGwpSMjSXlqGC
 ec5a8ppcWoJn+0Tc8EDxaWlAPdgEfZCp/oJarZBv6gWXXd/cQRri2pRcMwEFPnD7H/
 vm9Fdfxn+WilUW8TBmM/UkaC0ahgKu+wuig8BUCdyRxxq9ujl/xkxdJs1NJJWOBhSV
 9hwmywR7owrdQ==
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2050b059357so14245895ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 05:18:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXLADYCyIyJIOGDP3OE0bK7D4EpMG1thOKo3pkoM45hJUN+xLoct7cl5ep1DcgJcD3+L9I+0lgzcdQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRoZconMQn/vs8/gKOaz78pHf50xH9ncTy+r42NDchNXY/hbIE
 3Up/D7W8Ugh6BVaGg0tKWn2Fn26AE7N3eJHhx1su0tZiQc8eOXEAQy0sVnYLCSGN39t48EAl53K
 5i6XSza5qXUnN6IoZ5CiqNcQVww==
X-Google-Smtp-Source: AGHT+IF2p5CQY3b8HPQl1+/RqA1ZHqHcuWEQh2qoVHx4PAKoc7yqtJdfN0iZ0lNlEvXu5ud9ENOdM8aJpEyK48XB/pY=
X-Received: by 2002:a17:903:124c:b0:202:18de:b419 with SMTP id
 d9443c01a7336-2050c524e84mr78003075ad.63.1725020299631; Fri, 30 Aug 2024
 05:18:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240830084544.2898512-1-rohiagar@chromium.org>
 <20240830084544.2898512-2-rohiagar@chromium.org>
In-Reply-To: <20240830084544.2898512-2-rohiagar@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 30 Aug 2024 20:18:33 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-1bT-=jU4vCZTfe18Ks6WiAL=7M3y0eK3DyGkfWmsFKA@mail.gmail.com>
Message-ID: <CAAOTY_-1bT-=jU4vCZTfe18Ks6WiAL=7M3y0eK3DyGkfWmsFKA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: display: mediatek: dpi: Add power
 domains
To: Rohit Agarwal <rohiagar@chromium.org>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 ck.hu@mediatek.com, jitao.shi@mediatek.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

Hi, Rohit:

Rohit Agarwal <rohiagar@chromium.org> =E6=96=BC 2024=E5=B9=B48=E6=9C=8830=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=884:46=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Add power domain binding to the mediatek DPI controller
> for MT8186.
> Also, add power domain binding for other SoCs like
> MT6795 and MT8173 that already had power domain property.

For this patch, applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Rohit Agarwal <rohiagar@chromium.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> ---
>  .../bindings/display/mediatek/mediatek,dpi.yaml | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.=
yaml
> index 5ca7679d5427..3a82aec9021c 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam=
l
> @@ -62,6 +62,9 @@ properties:
>        - const: default
>        - const: sleep
>
> +  power-domains:
> +    maxItems: 1
> +
>    port:
>      $ref: /schemas/graph.yaml#/properties/port
>      description:
> @@ -76,6 +79,20 @@ required:
>    - clock-names
>    - port
>
> +allOf:
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - mediatek,mt6795-dpi
> +                - mediatek,mt8173-dpi
> +                - mediatek,mt8186-dpi
> +    then:
> +      properties:
> +        power-domains: false
> +
>  additionalProperties: false
>
>  examples:
> --
> 2.46.0.469.g59c65b2a67-goog
>
