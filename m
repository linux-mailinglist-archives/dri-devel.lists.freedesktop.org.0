Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C05E8B2E718
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 23:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC0910E288;
	Wed, 20 Aug 2025 21:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fibm73+9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC18210E288
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 21:03:36 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3b9dc5c6521so162029f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 14:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755723815; x=1756328615; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vy010xYTys+UZoDQTPjjsGwPqUv0ncRF4YEufPj6XPc=;
 b=Fibm73+90D/yuPyxTEH8SgxFgTdyttGi8wEBfkyUcrx+dYqNvPAwhhwSWCq4m1nZgx
 H4VR25neq6uOEBJkYFDYr+fU34m5HlIAdeOM36yE5upnmgs0o5sPV846uIIMe1lfSC8V
 /QMeMtskIWIFn41vFoSFuZWNyz2CySUNoPnTkbYwrwkFAg1JW+DZYtg+DzU5zp17lFbU
 G86dxG9U1JQtullHxsxdgqByI+BfdvhNG0swPVRyyLCzIOqhIWAjj4YzVqmxOQ/7bmqE
 B44PEOmNjsh07B/QRL4pbTZglehCGplYGykZ4hYgP7fnhEKNFwJxu0HQgfmtiGMmTHIc
 XRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755723815; x=1756328615;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vy010xYTys+UZoDQTPjjsGwPqUv0ncRF4YEufPj6XPc=;
 b=YHwuM0Bi+Vw/hJD9mlomjeIebkXfrMYh7ExhLpKSyjWO3n2XAo7cMB4/cZDI+2Gkpx
 dcWyubsSFgxvfxvE4r+I9a+1WsRvPIqdAej+MbFZVKOtdkt/oWuJ5a+CYAmW6hWcxlKj
 OrO+Y2qC35ii+H02INUCWyrkdlpvyAOrpz+VGOis602cQe5gHLU3SRs8jWH1ZH4/w488
 XVbV58QvdKRRHsuD6ha/N0UDG5MrjCKAFHx5+Rux4NOaRUASwjuA11zglQz5SndHeoWV
 GLabBiwaP/KVucfcFobf829OCfsm+uaLSuzlw3dIDBzRXPDzfK8ysJgj2Tz0AM4GEBoj
 RqCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4NJPlMdwoHJ8r5R8iYJOSSErSfnZDFnuiAaXRGUWgozeEWIzkbQbTpwTG3QeM9oe8CIa9HIyAn1o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywpch5WhgfRoGZwRKivLDD5yCBPLqrXDdEnxFCiA7R80H7meJux
 WFXESQoEaoCZb/Q1t4+V2pekJ/5eay4mZN0rxjgmRlfX70R4CxZqSSFsHo1JaJ5p1J/J4gvNHzt
 PCgpKVIBY337m7KChsddgz7n8rWbgzfU=
X-Gm-Gg: ASbGnctLIUpj3adBmHIiZBJXixyvXD466ZBrIS+D0lWxjpgi+gEZ4gJ2/dNboir/uh8
 LHRrb4UfTGw6xqMa+TIoSrJGPyeOK0VSiyVel0ozv2oSJKR8zeLgL64SD3/rb8C+nP3SfyGfZQb
 AXiFVFAGA7zQ9m/NvFITuOHBsSwrK/GRi/R11h6zJZ4lg1PXCFULWE7DmPQNQ8ZlF9iL4g1hsVb
 gfHV9agwOxJjpl6fKDqJE+f31tM2XX9xN/Eoeg=
X-Google-Smtp-Source: AGHT+IGT//JNStzo4AlhT/6OheyMDPgA/6lgp/LDJeHE9GSKv3SnvMDHwyZ3usfH9U7sFiP3cseTePwHmagievN+lhs=
X-Received: by 2002:a05:6000:2883:b0:3b7:75dd:f37d with SMTP id
 ffacd0b85a97d-3c4916baf57mr176679f8f.0.1755723815030; Wed, 20 Aug 2025
 14:03:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdXSJO1MOoNS5M2M1Zs=iWmiBbmc8Xc9tMDsXd_kM6bj=Q@mail.gmail.com>
 <20250819145401.GW5862@pendragon.ideasonboard.com>
In-Reply-To: <20250819145401.GW5862@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 20 Aug 2025 22:03:08 +0100
X-Gm-Features: Ac12FXwsqvwmh8r7YOIa3bc7OmC72sWL4CV-OApkkov7Ybminzq3pg16uZOVgCk
Message-ID: <CA+V-a8unzKr_VhOsUihp8fNgmPxcOy1618qtY0xKXJ7qGCHb1Q@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] Add support for DU/DSI clocks and DSI driver
 support for the Renesas RZ/V2H(P) SoC
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Hi All,

On Tue, Aug 19, 2025 at 3:54=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Aug 19, 2025 at 03:48:08PM +0200, Geert Uytterhoeven wrote:
> > On Mon, 28 Jul 2025 at 22:14, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > This patch series adds DU/DSI clocks and provides support for the
> > > MIPI DSI interface on the RZ/V2H(P) SoC. It was originally part of
> > > series [0], but has now been split into 6 patches due to dependencies
> > > on the clock driver, making it easier to review and merge.
> >
> > Thanks for your series!
> >
> > > Lad Prabhakar (6):
> > >   clk: renesas: rzv2h-cpg: Add instance field to struct pll
> > >   clk: renesas: rzv2h-cpg: Add support for DSI clocks
> > >   clk: renesas: r9a09g057: Add clock and reset entries for DSI and LC=
DC
> > >   dt-bindings: display: bridge: renesas,dsi: Document RZ/V2H(P) and
> > >     RZ/V2N
> > >   drm: renesas: rz-du: mipi_dsi: Add support for LPCLK clock handling
> > >   drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) SoC
> >
> > On the renesas-clk side, I am (almost) totally happy with this.
> > Any feedback from the renesas-drm side?
>
> Tomi told me he added the patches on this review list.
>
Shall I send a v8 fixing review comments from Geert or wait for Tomi to rev=
iew?

> > The last patch depends on a header file introduced by the second patch,
> > so I will need to provide an immutable branch containing the first
> > two patches (probably/hopefully based on v8).
>
Cheers,
Prabhakar
