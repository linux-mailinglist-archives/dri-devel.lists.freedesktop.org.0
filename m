Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B13729F45C8
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 09:14:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA6D10E86A;
	Tue, 17 Dec 2024 08:14:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA01C10E86A
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 08:14:41 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id
 a1e0cc1a2514c-85bc5d0509bso962551241.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 00:14:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734423280; x=1735028080;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BPpiGaA1e5dMiDjkAszyfRMBt3SwUPjlRJm/tlaPvdg=;
 b=EHe9wx/a6w+0BOGRdwhzlmn3WuW3ny0Ea9DG2qcGyraHip8ze+Z0vHVOreKX7QKB0H
 ogKN+CGnVDCuwgVghV2llU/y9iIde189M7kif5gNp5i+abmcyx6nuDlf0KbUvUtjBAZd
 aosNxeUf+upOrV2uRbEtkv8nxIOXk3JbmFcFHq1R6tCWIlej1TlJ3FxNawlw4qgqcniy
 E1MSTfTso2GMVmnpgqT6leXehT66D/2lWVPgWuufmgJmf0k8qIre8z7Mqd+NWXoeTTwD
 2+Flv8ZwFciMExIEqYkawIO5MS4UnYWgk1LBQgIq26HYliyIejkADPO7fTgtw3dkCjPC
 BvwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTYvC65p6HqJVeACdQGI9E+VtWId6pepsommfkKNhRkIFMHjae3j3WsT1+xO+RjhQdDOhd9G4x/ks=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw37tabdTm6IzdrMaVeoswPIRrklOeO2jKH6ziC53Cv8Fs1L7tI
 P3Hs3pen9gYBtRMNCHOC8sqWcwpkskxbtzASzfxKTkrhDs13rFAXpdkl1arI
X-Gm-Gg: ASbGncv8k0D9fckXSb3/LWgHd+9MoPDY84NHo+MNJU9eWo/Mx0XBKT5IMFuDAv9SpsC
 GotVCdhOeYwEz4Q4IfuG1lP+50KY6qFD86JpvNVLi+3TBR4mNYvqWjTQhFcFwMfY4piPcEI6kgb
 oeez7BmcKZ3f1LtR7sKzup4SgmY7ZNPL0Hq+IxJgqsT3BpaQV8P9/TZNJTSQpnHdesoU/nvg6t4
 Dt0L5Cb1//ZZXmNVR5vH/vNPa0heW1foAqvREXDWLUdWJ1oMKXtArfmPHh/Le7LnR3AW0QkfrCs
 j9AOC0dVu/YDJNQcATkzg8I=
X-Google-Smtp-Source: AGHT+IFrHiLHj1r+IEZOm+T2x5LeJwf2YiyEje4ayG8yUxQlwasc+1rJbhRY01+VFgJViNZsfdso/Q==
X-Received: by 2002:a05:6102:4d:b0:4b2:77df:466f with SMTP id
 ada2fe7eead31-4b277df4b89mr7062944137.8.1734423280241; 
 Tue, 17 Dec 2024 00:14:40 -0800 (PST)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com.
 [209.85.221.176]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-4b2703c7a2asm1090940137.30.2024.12.17.00.14.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 00:14:40 -0800 (PST)
Received: by mail-vk1-f176.google.com with SMTP id
 71dfb90a1353d-518808ef4a1so1496151e0c.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 00:14:40 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX+iIRRbRbb32hYhpaZEuwbz29mqKmqVTQBlpEaxcL/cCsYdci8s6g108acOJsowyVLCGxs5xZWLNE=@lists.freedesktop.org
X-Received: by 2002:a05:6122:2a09:b0:518:7777:a61e with SMTP id
 71dfb90a1353d-518ca39a80fmr14871103e0c.5.1734423279879; Tue, 17 Dec 2024
 00:14:39 -0800 (PST)
MIME-Version: 1.0
References: <20241217-rcar-gh-dsi-v5-0-e77421093c05@ideasonboard.com>
 <20241217-rcar-gh-dsi-v5-3-e77421093c05@ideasonboard.com>
In-Reply-To: <20241217-rcar-gh-dsi-v5-3-e77421093c05@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Dec 2024 09:14:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUczNArF7JSfjrb11OTpd8LvHv5-gUFPFCayr+Qezsbbg@mail.gmail.com>
Message-ID: <CAMuHMdUczNArF7JSfjrb11OTpd8LvHv5-gUFPFCayr+Qezsbbg@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] dt-bindings: display: renesas,
 du: Add missing constraints
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Magnus Damm <magnus.damm@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>, dri-devel@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-clk@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
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

Hi Tomi,

On Tue, Dec 17, 2024 at 6:32=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>
> The binding is missing maxItems for all renesas,cmms and renesas,vsps
> properties. As the amount of cmms or vsps is always a fixed amount, set
> the maxItems to match the minItems.
>
> Also add the minItems and maxItems to the top level properties.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> @@ -77,6 +77,8 @@ properties:
>
>    renesas,cmms:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
> +    minItems: 1
> +    maxItems: 4
>      items:
>        maxItems: 1
>      description:
> @@ -85,6 +87,8 @@ properties:
>
>    renesas,vsps:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
> +    minItems: 1
> +    maxItems: 4
>      items:
>        items:
>          - description: phandle to VSP instance that serves the DU channe=
l
> @@ -489,9 +493,11 @@ allOf:
>
>          renesas,cmms:
>            minItems: 4
> +          maxItems: 4
>
>          renesas,vsps:
>            minItems: 4
> +          maxItems: 4

AFAIK these two additions are not needed, as they already match the
values defined at the top level.

The rest LGTM.

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
