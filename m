Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4E0A03C93
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 11:37:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEEE810E3E5;
	Tue,  7 Jan 2025 10:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cmuemykS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1974D10E300
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 10:37:02 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2ffa49f623cso198266151fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 02:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736246160; x=1736850960; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EbZfbhz7iEzPycXJ2CVFWfaIcALTm8Fom6fe6QVaJ3Y=;
 b=cmuemykS32myuYFC9G4v2osIRQrXRKZt9gcMwvgz7Z/69v7lLnjTluBz5WkLb1cAOK
 PRs611mmlYDpGVDEwuD+fxQQi8jSFRjFE695LGh8C0HKRJJAhf+kXp5P5OoQsf4vPQXC
 crd9rHb78B7tdj+t2q0VpK3CYjKyVlButNuM6cVkPzEv8Vqnow0roX5lPsnu9h+uOrog
 8X3EizS3U+mk3kUQhwMDel90KU6rpInibYFu2Acjxvu+Xolw0+/I9R5a3NzCjSCZ+yMl
 B69yTQJiF5v4+t2CXsXto/NMaLjbuorQZpRIsytnkfsOWPS3Rzv/0xBPeHcATrB1Rg/T
 pcqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736246160; x=1736850960;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EbZfbhz7iEzPycXJ2CVFWfaIcALTm8Fom6fe6QVaJ3Y=;
 b=qoAQ/dWlacM/pHUo4LGNRCuPADdJzhBigyF3v8CVAK0PALDrlS16PDie4U+TBi7obO
 z7mOO/oj0BTJwf2KRcyN00P+BoCFsuG46Kklqvi9X9JynOcl3M/ZqOR743UHB/U+DX4U
 c921Ggl+8JOViGmb5AD04w2OPfnlTIb/qFRQvEsUafqlliAUtNhlWUHU4J3avICOXaaw
 k4YFy6AnAr/Uw9Fb6t8+EvwIrojljnuD8kMMgOjB3fBy2bSFbRQLGeLZok2KT9jcyUo/
 FCPqts4rCQTi3qLJJYtAoOzEI8GRNrJbr2zSmgsabGrJmY30Lhlv4rumcHVmEMYv0soH
 HENQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlywumdz9G3WzTJ/j0lOjRhYpVAQz4pf86i7gd6YJSdNoHuvl+CLSUqfM8g75LdDnz9onZBfu7SRo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7CWQJa/v2EVTY6BFilQwqtCSf1EUt2S+oa5CHTId9Hf7XWKwJ
 mnGbwRlmvqwPsZrCoSsH219DCqiEsyzqkFWvCUsuuFXdNZuR37QVI/kMS4wJs5JxEtZJM/U27c7
 VtSWvTuCSbyphF/XqWNltWC1FR73XlLEn
X-Gm-Gg: ASbGncubz/Xg9rFstBDmZ5z4Syy90mot3+vQZG9ixrG/19r/tE7qS6RlK6ZCmoAe0Aj
 AH3CJ5gbkG34hKSEzOvDDCdfNgPIUXjFuGu1mfzJlnyyJGD+WfjVnDFrKbsvkDGsvI2H9ag==
X-Google-Smtp-Source: AGHT+IH/zgB5AIW8SXe9fLjt6csgYHV150OAiMaYUNGL55jIFK9HyFHffxA0F1up0XAC1lvyFU3qoTZjri7PgMpYmPM=
X-Received: by 2002:a05:6512:104c:b0:540:1fec:f321 with SMTP id
 2adb3069b0e04-5422958243bmr18443941e87.41.1736246160170; Tue, 07 Jan 2025
 02:36:00 -0800 (PST)
MIME-Version: 1.0
References: <20250107094943.518474-1-alexander.stein@ew.tq-group.com>
 <20250107094943.518474-3-alexander.stein@ew.tq-group.com>
In-Reply-To: <20250107094943.518474-3-alexander.stein@ew.tq-group.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 7 Jan 2025 07:35:48 -0300
X-Gm-Features: AbW1kvbqKfp_hBVMEYDDaHbQzJ92mQ9GQWt0UJSLPvbJH41ssSImPCn2Z_2AU3U
Message-ID: <CAOMZO5CasQDRu=U7zUxzuFVBHyREZ7oyG8+SJjg2BF58B9G3wg@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: samsung,
 mipi-dsim: Add imx7d specific compatible
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
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

Hi Alexander,

On Tue, Jan 7, 2025 at 6:50=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> This add a imx7(d) specific compatible which is compatible to imx8mm.
> This silences the dtbs_check warning:
> arch/arm/boot/dts/nxp/imx/imx7s-mba7.dtb: dsi@30760000: compatible: 'oneO=
f' conditional failed, one must be fixed:
>  ['fsl,imx7d-mipi-dsim', 'fsl,imx8mm-mipi-dsim'] is too long

The warning here is about using fsl,imx8mm-mipi-dsim.

> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  .../devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,mip=
i-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mipi=
-dsim.yaml
> index 4ed7a799ba26b..e43fec5609417 100644
> --- a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.=
yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.=
yaml
> @@ -27,7 +27,9 @@ properties:
>            - fsl,imx8mm-mipi-dsim
>            - fsl,imx8mp-mipi-dsim
>        - items:
> -          - const: fsl,imx8mn-mipi-dsim
> +          - enum:
> +              - fsl,imx7d-mipi-dsim
> +              - fsl,imx8mn-mipi-dsim

But you added a fallback to fsl,imx8mn-mipi-dsim, so this does not look rig=
ht.

I have already sent the following fix to address this issue:

https://lore.kernel.org/all/20241217131431.1464983-1-festevam@gmail.com/T/
