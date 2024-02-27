Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3739A868A7E
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 09:09:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4231110E04C;
	Tue, 27 Feb 2024 08:09:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C52E010E452
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 08:09:35 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-6087d1355fcso22868697b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 00:09:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709021374; x=1709626174;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FxX6RgMhHn+61tSmT8CWOQW7owJHb+LAZ7EIbG00Oes=;
 b=IsA3qw8AbPMmVMwxl8ZREeXu5vgLMVerH4YUhDHEMElVu4gyzsd9oEFMv4M/ipFwuD
 +7pE+Cpa4BM9lhogaMWhfxGQhhI4+2a4v9LHDENex2SyEKo5bgFVMJrMnej6Ren0KFV6
 VoUqUlURmkB14UvALpcmtVQduZEnE1K4f69ne0Z7vS2TDBp7d7wkEKDWIFPRVCV1sFaj
 NaDEoxId/vRXRckukh5PwSHaBZwq5urXOPfWl6uLm4WNOQpfi2SIjFyU43/uvlVw0xJy
 zgDxbXnsGap75hpoKz/RuBR7ntWUdyIw9xuSd12xwxFK3HlhgG1EF1dze4p30/u5NHaZ
 sl9Q==
X-Gm-Message-State: AOJu0YxXgGVe/OjxgQJIZBxmEIMhVwgI/Guke0XZ4BeAN+aChs2D/FsK
 RA6zlI8FLez0iQ6RQEgZc99oQRky4LbTTpZi/j7C2G7Z2tqPuNljGeFysKA45Qo=
X-Google-Smtp-Source: AGHT+IEn9oegVbtHkEn0kipi3WFFzB520ztuO/Bunnv3pxfkmmvkDoBQZWTIysPtZkOLgN38NhA7GA==
X-Received: by 2002:a0d:e6c4:0:b0:600:3a38:a815 with SMTP id
 p187-20020a0de6c4000000b006003a38a815mr1431913ywe.35.1709021374503; 
 Tue, 27 Feb 2024 00:09:34 -0800 (PST)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com.
 [209.85.219.173]) by smtp.gmail.com with ESMTPSA id
 w65-20020a817b44000000b00604198c3cafsm1636429ywc.61.2024.02.27.00.09.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 00:09:33 -0800 (PST)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-dc238cb1b17so4234286276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 00:09:32 -0800 (PST)
X-Received: by 2002:a25:8392:0:b0:dcd:1f17:aaea with SMTP id
 t18-20020a258392000000b00dcd1f17aaeamr1417412ybk.26.1709021372474; Tue, 27
 Feb 2024 00:09:32 -0800 (PST)
MIME-Version: 1.0
References: <20240227034539.193573-1-aford173@gmail.com>
 <20240227034539.193573-2-aford173@gmail.com>
 <CAMuHMdWhtu7nuBpC=TSY6rMaReJNgYok535xXotDyKJDT1_Mzw@mail.gmail.com>
In-Reply-To: <CAMuHMdWhtu7nuBpC=TSY6rMaReJNgYok535xXotDyKJDT1_Mzw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Feb 2024 09:09:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdViTAxWk8uvT-tgD4X2MJW5R3R1aqrv1K=FyQLdAciFcg@mail.gmail.com>
Message-ID: <CAMuHMdViTAxWk8uvT-tgD4X2MJW5R3R1aqrv1K=FyQLdAciFcg@mail.gmail.com>
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

Hi Adam,

On Tue, Feb 27, 2024 at 8:48=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> On Tue, Feb 27, 2024 at 4:46=E2=80=AFAM Adam Ford <aford173@gmail.com> wr=
ote:
> > Update the binding to add support for various Renesas SoC's with PowerV=
R
> > Rogue GX6250 and GX6650 GPUs.  These devices only need one clock, so up=
date
> > the table to indicate such like what was done for the ti,am62-gpu.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>

> > --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml

> > +          - renesas,r8a77951-gpu
>
>     ... # PowerVR Series 6XT GX6650 on R-Car H3 ES2.0+

All compatible values for R-Car H3 variants use the r8a7795 "base" value,
so that should be:

     - renesas,r8a7795-gpu # PowerVR Series 6XT GX6650 on R-Car H3

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
