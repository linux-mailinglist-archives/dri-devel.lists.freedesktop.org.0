Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 455428C2596
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 15:23:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7052910E22D;
	Fri, 10 May 2024 13:23:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iTl/9Qry";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98FFC10E22D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 13:23:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 72A7ECE1DE8
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 13:23:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 108ACC32783
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 13:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715347388;
 bh=tYhskMo0rXSumUEeBpvmlx1SbCm7JZfH6Sx8+QpS5CA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=iTl/9QryRDw5m6CI9fHWDlqfd+WgiPIjjwmVmxh9Y+HKDsz5HJr3zOdFIV0ISuMpf
 ZYRsomgmN++PBr3+k4xbr8npEB14Bwdbs+wV2TNoARERT5HFfjOFKA84a/3q2YkOb+
 7McgvfcnEwz1wIfC4b0rz+dl6f1QOXnd978pV2i8OL7W79nle/cvCwbSPqeqMrE3u9
 Z9vtzPLKzfAC9uPILO0j2Yz3zhGHNbzixj4EGQyRSNDOyVLgWEKVI3ubIzodmI6QJC
 ZdGsWF3WnRC/ozb7k2rTeZtifP/fjezzM6hh66RN5Ld1fSG6hJGvNXvWZzyhkj7cNV
 ForFdv6Gbj3LQ==
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-51fcb7dc722so1839761e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 06:23:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW3M2/PNtU1Yk6bAu23AAkwHQ17gRUUA+rgL1HXJrZo9aN3ayoHRwIz2A1Xx2dZQoRR6waAE4p7H3R779UHDtoVW5R4FBWjFvOVF9Xhk5e7
X-Gm-Message-State: AOJu0YyCyBPU9ZY0H33/Wlnd1o54PkaF+J7LtrLjJvqWP0E4OjhzZvIN
 0eoxA0Raoo5jWrk6HbbbHf7Ts2lAiwq/vQ97Ijjo6aFVglcZPYn7sTgqOgLJGr0nF4uvZdwQ1+n
 Uo1K+uN4uDliWsKQyyoOkhrZVmg==
X-Google-Smtp-Source: AGHT+IEJUcElvfTVu1yNEdpP3G4HTKH4TMjcX6DBrmz3x3jO6gk043nAqUWr2yavjxlCjyZwuuW1s4qLooweEnK1zis=
X-Received: by 2002:a05:6512:684:b0:51c:590f:4305 with SMTP id
 2adb3069b0e04-5220e3736c2mr957712e87.8.1715347386370; Fri, 10 May 2024
 06:23:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240510-hotplug-drm-bridge-v2-0-ec32f2c66d56@bootlin.com>
 <20240510-hotplug-drm-bridge-v2-1-ec32f2c66d56@bootlin.com>
 <171533049583.3304069.11759668175103213313.robh@kernel.org>
 <20240510123717.437ffe6e@booty>
In-Reply-To: <20240510123717.437ffe6e@booty>
From: Rob Herring <robh@kernel.org>
Date: Fri, 10 May 2024 08:22:53 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+mZLkq16OcVBcspxLrMZ=M+h57yOQohhsgn3VXVfyiLQ@mail.gmail.com>
Message-ID: <CAL_Jsq+mZLkq16OcVBcspxLrMZ=M+h57yOQohhsgn3VXVfyiLQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: connector: add GE SUNH hotplug addon
 connector
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Dragan Cvetic <dragan.cvetic@amd.com>, Maxime Ripard <mripard@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Robert Foss <rfoss@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Arnd Bergmann <arnd@arndb.de>, Derek Kiernan <derek.kiernan@amd.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Saravana Kannan <saravanak@google.com>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Paul Kocialkowski <contact@paulk.fr>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>, 
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, 
 Jonas Karlman <jonas@kwiboo.se>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

On Fri, May 10, 2024 at 5:37=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> Hello Rob,
>
> On Fri, 10 May 2024 03:41:35 -0500
> "Rob Herring (Arm)" <robh@kernel.org> wrote:
>
> > On Fri, 10 May 2024 09:10:37 +0200, Luca Ceresoli wrote:
> > > Add bindings for the GE SUNH add-on connector. This is a physical,
> > > hot-pluggable connector that allows to attach and detach at runtime a=
n
> > > add-on adding peripherals on non-discoverable busses.
> > >
> > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > >
> > > ---
> > >
> > > NOTE: the second and third examples fail 'make dt_binding_check' beca=
use
> > >       they are example of DT overlay code -- I'm not aware of a way t=
o
> > >       validate overlay examples as of now
>
> As mentioned here...
>
> > >
> > > This patch is new in v2.
> > > ---
> > >  .../connector/ge,sunh-addon-connector.yaml         | 197 +++++++++++=
++++++++++
> > >  MAINTAINERS                                        |   5 +
> > >  2 files changed, 202 insertions(+)
> > >
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > Error: Documentation/devicetree/bindings/connector/ge,sunh-addon-connec=
tor.example.dts:49.9-14 syntax error
> > FATAL ERROR: Unable to parse input tree
>
> ...this is expected.
>
> Any hints on how this can be managed in bindings examples would be very
> useful.

Overlays in examples are not supported. Add actual .dtso files if you
want examples of overlays (maybe you did, shrug).

Overlays are somewhat orthogonal to bindings. Bindings define the ABI.
It only makes sense to validate applied overlays. Now maybe overlays
contain complete nodes and we could validate those, but that's a
problem for actual overlay files and not something we need to
complicate examples with.

Rob
