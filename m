Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E429ACD5A
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 16:51:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46CDB10E801;
	Wed, 23 Oct 2024 14:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZI5jh9Rf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCBB510E801
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 14:51:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 828CC5C5E7D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 14:51:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3A35C4AF09
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 14:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729695099;
 bh=V0WnmKHkiubGXH7powCeniKJAeXlAH+b4/k8QVVp3oY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZI5jh9RfHhvV8BXkELReKNk+DT5nZqXcJQanuVnxbnJiUgBsPdOYsrZ4QuA6Vuq+a
 8E75CpBgCCLrwe7L+V580X5wva+3hC4FC5gD1J+WnmyMBAYMCRHkE1nOTY19p+OlGC
 8GmNkH2/H8NL+4iF41aadGcdnmWOCFp9tdYr8v2ZxeMO48fhIJ+XZtLd09ZtI4goW4
 aq2+0nIlPcOtIx8f3RTUJXJYXIP4Z47kWuuTIYCui5KPSnfl0RgWnoB32USvY/CqT8
 jL0ZX85cCrSW7lldtTW0H7wxv16fFYmGswFSIE3yUaUR3HMnvCYUBgkgFwNrlJzYPJ
 WMs3m3CbPiqmA==
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-20b5affde14so48792045ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 07:51:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWKC1hrAyf4e63T9auWM9hH+s9xBriNjJQoyefMnwtFcdr5YBMLXM+OVPH2Gvfttl4N1/Rdy71eor4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1DGbEu/17HHFXphkKHWKjusbVSbHsk99p4hHsxKj89cwOi04+
 PXCvpjmkmWgW04rrSvve42NdYVrq1GoRyYTA7Z1+bgrDMtxjdd88ha0zE96joJqOFyuX4e/dSSf
 TE2Mrq8iorNYaXdQOvWop0GDgDg==
X-Google-Smtp-Source: AGHT+IGiOV49HPeVWqZgqUDfen8sjZxWmSvuRAGE4z98/inzDbsAH3T7NKTZ/wjACKOgmYMVQ+VQCdv4ftbQedq6e9Q=
X-Received: by 2002:a17:90a:d512:b0:2e2:e545:82c5 with SMTP id
 98e67ed59e1d1-2e76b5b7edcmr3019116a91.3.1729695099200; Wed, 23 Oct 2024
 07:51:39 -0700 (PDT)
MIME-Version: 1.0
References: <20241007022834.4609-1-moudy.ho@mediatek.com>
In-Reply-To: <20241007022834.4609-1-moudy.ho@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 23 Oct 2024 22:52:00 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-jPWv1nHf9NnxNkVW2+ZOFOagAPf1DFQu5AD1KnCQNYw@mail.gmail.com>
Message-ID: <CAAOTY_-jPWv1nHf9NnxNkVW2+ZOFOagAPf1DFQu5AD1KnCQNYw@mail.gmail.com>
Subject: Re: [PATCH v5] dt-bindings: display: mediatek: split: add subschema
 property constraints
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Macpaul Lin <macpaul.lin@mediatek.com>
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

Hi, Moudy:

Moudy Ho <moudy.ho@mediatek.com> =E6=96=BC 2024=E5=B9=B410=E6=9C=887=E6=97=
=A5 =E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=8810:28=E5=AF=AB=E9=81=93=EF=BC=9A
>
> The display node in mt8195.dtsi was triggering a CHECK_DTBS error due
> to an excessively long 'clocks' property:
>   display@14f06000: clocks: [[31, 14], [31, 43], [31, 44]] is too long
>
> To resolve this issue, the constraints for 'clocks' and
> other properties within the subschemas will be reinforced.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 739058a9c5c3 ("dt-bindings: display: mediatek: split: add compatib=
le for MT8195")
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
>
> --
> This is based on [v2] dt-bindings: display: mediatek: split: add clocks c=
ount constraint for MT8195
>
> Changes since v4:
>   - Eliminate the possibility of varying quantities in the 'clocks'
>     property of mt8195.
>   - Move the constraint for 'power-domains' to the top-level.
>
> Changes since v3:
>   - Correct the compatible name for the mt8173 split in the subschema.
>
> Changes since v2:
>   - Revise the commit message.
>   - Enhance the descriptions of 'clocks'.
>   - Strengthen the conditions within the subschema.
>
> Changes since v1:
>   - Adding functional descriptions and quantity restrictions.
> ---
>  .../display/mediatek/mediatek,split.yaml      | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
split.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,sp=
lit.yaml
> index e4affc854f3d..4b6ff546757e 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.y=
aml
> @@ -38,6 +38,7 @@ properties:
>      description: A phandle and PM domain specifier as defined by binding=
s of
>        the power controller specified by phandle. See
>        Documentation/devicetree/bindings/power/power-domain.yaml for deta=
ils.
> +    maxItems: 1
>
>    mediatek,gce-client-reg:
>      description:
> @@ -57,6 +58,9 @@ properties:
>    clocks:
>      items:
>        - description: SPLIT Clock
> +      - description: Used for interfacing with the HDMI RX signal source=
.
> +      - description: Paired with receiving HDMI RX metadata.
> +    minItems: 1
>
>  required:
>    - compatible
> @@ -72,9 +76,24 @@ allOf:
>              const: mediatek,mt8195-mdp3-split
>
>      then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +
>        required:
>          - mediatek,gce-client-reg
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8173-disp-split
> +
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +
>  additionalProperties: false
>
>  examples:
> --
> 2.34.1
>
