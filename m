Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E90C98FC29B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 06:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 486B510E2BF;
	Wed,  5 Jun 2024 04:20:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="hHEj/6sK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188AC10E2BF
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 04:20:26 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-52b98fb5c32so4432445e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 21:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717561225; x=1718166025;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gzVsE2WVQtDSaAM6UmCM20Z/lAeEvRcu2iqhxm+Mwa8=;
 b=hHEj/6sKCqDI21LXnXV6SJcsvPhGwrqpwafPFiog/EZSAigp/CzBCnmlylp/1ycnba
 zZhjuuGCzuytlHV315Kx8a0WUvqlSZs4/3ucERg6TD2J/5J9VOYjK7A5pozimIdFPp4+
 KvYxs2p8lE27QBv19BfKOlqvkiu28MOGhKqGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717561225; x=1718166025;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gzVsE2WVQtDSaAM6UmCM20Z/lAeEvRcu2iqhxm+Mwa8=;
 b=aJFbvDS67s8A5pvhTrcMdsENVgMBogy0JT/kawaNHm8PYVRNl22fDhGiuulLTe3qWd
 hZth7oHHNiXvjQl0AkwaGXHR1k8EJkhEGwYs4MTHR84w5rrwJBZ9dfOGnsITSOFm5242
 dcPADrhOq1yKjfN/4yk4ESUwIa8XMwPSoKMJvCSHW9oC5sxfeapaAlSuxaEMlcHoGfoT
 rmcadd0BIT/8uEqc11QiXNTFdUHT6uFcFxd/sG+HD/ln7dOQkgCoKJgigHuSPKxI/8Cp
 GbcMpTmxdR0rSgrCXHsuGWXi3kIJ10AGZDG5QURc9woNTUfe5CEHqqBt3UXfp5kOExWP
 lABw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV37BxOOue9E2F5robaG9ozOulJ733yGKvGwVqfS/z78mwSsr1+4KgGAu8NFsfp+BQMhdQo61e9+L8CwlL7cjeP1GXO6pPR2SyCCk2nTxYj
X-Gm-Message-State: AOJu0YyoUEvE5EKiM4Uyynk70Ijch+D/PhX2eOL4qqoaoB2s4vXFyfAw
 khT7hpyBCU06Cli7V4hhX0uy/CaU1Or+wwcwma3viOOKhP6gxzeZwqWrxvqb9Yag5ZKQgAKmRXB
 F4505Eqov3V/7+HQY7g20Y9Z0WTrYHJX5AXQ+
X-Google-Smtp-Source: AGHT+IFjiCTeLxR5Rrc6kuVzd7PjI0caEZqFLRKsHokalU9T+t04/Xl7kHt8MmAkD3exLz2xwKl4SHO//vTdXIubI38=
X-Received: by 2002:a05:6512:b9e:b0:529:b718:8d00 with SMTP id
 2adb3069b0e04-52bab4ca25fmr1391310e87.8.1717561224514; Tue, 04 Jun 2024
 21:20:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240604123922.331469-1-angelogioacchino.delregno@collabora.com>
 <20240604123922.331469-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240604123922.331469-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 5 Jun 2024 12:20:13 +0800
Message-ID: <CAGXv+5E09RGRX=7Ra0H-VtbPKMVg6MiM+hZn75AyJ0KmEd5EEw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpu: mali-bifrost: Add compatible for
 MT8188 SoC
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: boris.brezillon@collabora.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 steven.price@arm.com, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
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

On Tue, Jun 4, 2024 at 8:39=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add a compatible for the MediaTek MT8188 SoC, with an integrated
> ARM Mali G57 MC3 (Valhall-JM) GPU.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml =
b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index e796a1ff8c82..8acb46adabe2 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -34,6 +34,7 @@ properties:
>            - const: arm,mali-valhall-jm # Mali Valhall GPU model/revision=
 is fully discoverable
>        - items:
>            - enum:
> +              - mediatek,mt8188-mali
>                - mediatek,mt8192-mali
>            - const: arm,mali-valhall-jm # Mali Valhall GPU model/revision=
 is fully discoverable
>
> @@ -195,7 +196,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: mediatek,mt8183b-mali
> +            enum:
> +              - mediatek,mt8183b-mali
> +              - mediatek,mt8188-mali
>      then:
>        properties:
>          power-domains:
> --
> 2.45.1
>
>
