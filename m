Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA40A05C20
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 13:53:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E50D710E29E;
	Wed,  8 Jan 2025 12:53:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com
 [209.85.221.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF0210E29E;
 Wed,  8 Jan 2025 12:53:38 +0000 (UTC)
Received: by mail-vk1-f175.google.com with SMTP id
 71dfb90a1353d-51bc2363fd7so3902685e0c.2; 
 Wed, 08 Jan 2025 04:53:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736340815; x=1736945615;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5DPVgWRoBgp5UUwkNErzWNpDubic5Irpv9/KSUHnOLo=;
 b=nWyQYjfj25t18A7FwC2qVCKaMRdAyHsu5D/gXLqtiGUBYkljELuEFaDFJDlt9o+9Z2
 ZFvFYy1XJ93avY1IUGMwFnNdQiuaqd0rrrEDQ9ZxKKuu+9fFuHwywAdShnw53WQfJRy6
 MeQm71ESr0O8qBB23gP0uFtFcZzVpSSF/5JsUsQeoo4eLx7QteNUl9aQMEVZrK/Rwap/
 lPWB6GfCjOSCnU6AM9G+DHiWiKlZ0uuspoBSRfzwVr2QONqbIoKY24pMnplw1aiHGnfP
 DgdMlawMLSL7wq8xoiwem4kIf5/gpTIYRStYDrDn5lSFrlDLMPYBG0rqEe9Q3VVRYCYR
 fXgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWt+ReLVzAdRnqfHnHGqgmWd0Pn/bDuCHo6QYcEkVOZK3rq99B+J8k3109teO8k6429JXLOc5KWWctU@lists.freedesktop.org,
 AJvYcCXVdKJ33T9Act3CXkdrQ2fZESNqKCQfpYfydCQ7jO2jy6LUXgz/HaoETGrjb2snJoUtjv8RpV/BxTU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxT9NCOIlOGYnEeKaumuMUj6OhNiJcZBJgJku+RSQX/FQtJxCiO
 0oPT71xn0fVMj7EwvnYbmFkloX+YeZaCEZUdr2VhOVTGny5GYggQCgVqIWEd
X-Gm-Gg: ASbGnctpZeE3H65ojIDpeDNf787G+gvHP0T2RTJVUQoggTnATk/0mDnDd5PJezl7wpx
 8lRUQhGRC254aUUbsWqKJWzDwGvzy3BDKirbPXwRiotf1dZq4iApYvq8PzvBTOGQRqyo8ZbeP64
 n89ogA5yF3WFgLv7GsUyTYqDMjoXYBayXR9tkEkIBw49AvLjZzj7TbK3TfN18NYo+wYJaI6By2U
 d18/zNmP9dCRVxtm9lwtsbxLXHB929L5PA5aB3BxBRdXRPopf6Q8V2EP5XU0k4T8IAKYc9mZkVB
 uzIAedkoATKzqsG8tBM=
X-Google-Smtp-Source: AGHT+IGh6vIB8ejyuMQYuw2nekmVHv/UUAirzWfsP5y/Qedx+LajFZPSw3PB3Zz8W8SmJYz0gymocg==
X-Received: by 2002:a05:6122:4684:b0:518:8ac7:396b with SMTP id
 71dfb90a1353d-51c6c50fa85mr1426171e0c.8.1736340814779; 
 Wed, 08 Jan 2025 04:53:34 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com.
 [209.85.222.41]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-51b68b7d627sm4881132e0c.3.2025.01.08.04.53.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jan 2025 04:53:33 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id
 a1e0cc1a2514c-85c5316f15cso3885477241.1; 
 Wed, 08 Jan 2025 04:53:33 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUttN5T1+JSDm/fIrA0/01aw5qlxS2/vFLYnoiQozeLpabsH5qzK3plAHZF5OaNg4fvN9yi/Ezt7Cs=@lists.freedesktop.org,
 AJvYcCXcfIdAo+mHVcIIEVfmEVl1FKnDa4+CmIkVeQf0Dr7TH8mgO5wexHIxQPdI+4K9XO2GMAg0hKu14iY6@lists.freedesktop.org
X-Received: by 2002:a05:6102:f11:b0:4af:fc14:f138 with SMTP id
 ada2fe7eead31-4b3d0f94834mr1605383137.7.1736340813382; Wed, 08 Jan 2025
 04:53:33 -0800 (PST)
MIME-Version: 1.0
References: <20250107125854.227233-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250107125854.227233-1-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Jan 2025 13:53:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXq3pLB1K5N9gFmBF6B0ohpLdKf0aj0WSuK17U-Bs4oUw@mail.gmail.com>
X-Gm-Features: AbW1kvb03s6-ioyEsxQhihv8HJWEPeM4AbdJ5u2RlFP_T025eauQBHNT5poBSNc
Message-ID: <CAMuHMdXq3pLB1K5N9gFmBF6B0ohpLdKf0aj0WSuK17U-Bs4oUw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: Correct indentation and style in
 DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Lucas Stach <l.stach@pengutronix.de>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Mahadevan <quic_mahap@quicinc.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, dri-devel@lists.freedesktop.org, 
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org
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

Hi Krzysztof,

On Tue, Jan 7, 2025 at 1:58=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
>
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/display/renesas,cmm.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,cmm.yaml
> @@ -58,10 +58,10 @@ examples:
>      #include <dt-bindings/power/r8a7796-sysc.h>
>
>      cmm0: cmm@fea40000 {
> -         compatible =3D "renesas,r8a7796-cmm",
> -                      "renesas,rcar-gen3-cmm";
> -         reg =3D <0xfea40000 0x1000>;
> -         power-domains =3D <&sysc R8A7796_PD_ALWAYS_ON>;
> -         clocks =3D <&cpg CPG_MOD 711>;
> -         resets =3D <&cpg 711>;
> +        compatible =3D "renesas,r8a7796-cmm",
> +                     "renesas,rcar-gen3-cmm";

Nit: the compatible values fit on a single line.

> +        reg =3D <0xfea40000 0x1000>;
> +        power-domains =3D <&sysc R8A7796_PD_ALWAYS_ON>;
> +        clocks =3D <&cpg CPG_MOD 711>;
> +        resets =3D <&cpg 711>;
>      };

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
