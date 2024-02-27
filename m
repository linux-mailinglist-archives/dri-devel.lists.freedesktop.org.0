Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C13D868A65
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 09:03:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DF4F10E888;
	Tue, 27 Feb 2024 08:03:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F38410E888
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 08:03:53 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-608ed07bdc5so20549117b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 00:03:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709021032; x=1709625832;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=roGG6meVs6CKhA34aRUxJBf/ohtansRAwEpLm9XFiUw=;
 b=L3G2HNPTtfmMBVPW+bWXluUFxVd+koOraBo1W1lJbRTHc4i60dF/1d2TafIZ3FDlxy
 So7phpqIWoV1yJCAgMgNTAoV/ju+iMKptRThNKQHGQJuxymKijM7qxWVMNHhE78qQ+r0
 SyBR7N3Rbg+o+6BiY+npjjQRAD0ed8ZlItXAxRvq78ZYhaaEjpeMTGwH6xexwK9sy+pk
 2OSyujQ+mEmpWv76N+TEK7JLCeG153W/AIIqxyRMoGSBLn9T6Wu/MzwE03u+he6iQS6g
 HPH4Els5WinGMEB6B/q3MlvM9tq6e8/QDFooC3rzGOo0erpsqb4T7qKWg8z2D5D5iNSK
 oVGA==
X-Gm-Message-State: AOJu0Yy4pwpPMIUrlj/NY3E/XNogCZOPJ5BgMzRmw/ctRUVDUmCdOmAJ
 UgUNcPI/8P8YGQ3tRLEXxs6SGuhJNbBSzHCCTeVwNHxGUQUAQ32PFrP0RkKKgKA=
X-Google-Smtp-Source: AGHT+IG5XM1/n4RT1iGuoS17Q+bX4zxkQcVA+RMDfGaFb7NJmfuYBenNsDMgKeXdGZp/etSkJFVwdg==
X-Received: by 2002:a0d:df87:0:b0:609:151f:cc15 with SMTP id
 i129-20020a0ddf87000000b00609151fcc15mr1502247ywe.8.1709021032053; 
 Tue, 27 Feb 2024 00:03:52 -0800 (PST)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com.
 [209.85.219.177]) by smtp.gmail.com with ESMTPSA id
 c11-20020a81b54b000000b00608d9358ccbsm1499871ywk.132.2024.02.27.00.03.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 00:03:51 -0800 (PST)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-dcbef31a9dbso1954520276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 00:03:51 -0800 (PST)
X-Received: by 2002:a25:8109:0:b0:dc7:4367:2527 with SMTP id
 o9-20020a258109000000b00dc743672527mr1373085ybk.49.1709021031575; Tue, 27 Feb
 2024 00:03:51 -0800 (PST)
MIME-Version: 1.0
References: <20240227034539.193573-1-aford173@gmail.com>
 <20240227034539.193573-2-aford173@gmail.com>
 <CAMuHMdWhtu7nuBpC=TSY6rMaReJNgYok535xXotDyKJDT1_Mzw@mail.gmail.com>
In-Reply-To: <CAMuHMdWhtu7nuBpC=TSY6rMaReJNgYok535xXotDyKJDT1_Mzw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Feb 2024 09:03:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW1wH+oqKRjxCTVAjYuyphV2ysrNyqC7DKchiivRzGn2Q@mail.gmail.com>
Message-ID: <CAMuHMdW1wH+oqKRjxCTVAjYuyphV2ysrNyqC7DKchiivRzGn2Q@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: gpu: powervr-rogue: Add PowerVR support
 for some Renesas GPUs
To: Adam Ford <aford173@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 aford@beaconembedded.com, Frank Binns <frank.binns@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

On Tue, Feb 27, 2024 at 8:48=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Adam,
>
> On Tue, Feb 27, 2024 at 4:46=E2=80=AFAM Adam Ford <aford173@gmail.com> wr=
ote:
> > Update the binding to add support for various Renesas SoC's with PowerV=
R
> > Rogue GX6250 and GX6650 GPUs.  These devices only need one clock, so up=
date
> > the table to indicate such like what was done for the ti,am62-gpu.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
>
> Thanks for your patch!
>
> > --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > @@ -14,6 +14,11 @@ properties:
> >    compatible:
> >      items:
> >        - enum:
> > +          - renesas,r8a774a1-gpu
>
> I would add a comment like this:
>
>     - renesas,r8a774a1-gpu # PowerVR Series 6XT GX6650 on RZ/G2M

After reading [1], s/Series 6XT/Series6XT/g.

[1] "[PATCH 00/11] Device tree support for Imagination Series5 GPU"
    https://lore.kernel.org/all/20240109171950.31010-1-afd@ti.com/

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
