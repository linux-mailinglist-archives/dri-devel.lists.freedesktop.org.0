Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0523AB0D278
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 09:19:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1D2E10E2AB;
	Tue, 22 Jul 2025 07:19:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WQRGtc2A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE27A10E2AB
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:19:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B30EA5C5F82;
 Tue, 22 Jul 2025 07:19:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8300C4CEEB;
 Tue, 22 Jul 2025 07:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753168776;
 bh=6AgzjhBZxA3wEqcXfXHf90mqgnB60GOi2YIsHje5XqM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WQRGtc2A+jcXZ+jiKUu3KUdQL2TgUEQKNuEmGtlIGvKGw1rmPkiNMcCTvewcahhHN
 tJk2rRkVl+Zz1j4PdYX2PAvkl5oysQ/nkCKOXxFU1pom7zUp+zCa50T9aycvTO6R+z
 fDzsYdpwBB70PQaqXsFoWjDqppVQNDFPeb6Uvop3PhG5cB49SJEF/1ibkCXCQ4ryw/
 EIVEQQXcvV4XYtvmX8Chxhy/g3eZoB36XPzLKt2+DLd+eYr3I1O35dyACfZhcPvf8m
 AVatrVdWRZXoLef4eIcCcUFKGpO4qpNl37IeU6iZHdkiljZ6InRW9zvRyJUt7yei0t
 aaS/gaELh+S9w==
Date: Tue, 22 Jul 2025 09:19:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Otto =?utf-8?Q?Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Kevin Tang <kevin.tang@unisoc.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/12] dt-bindings: display: sprd: adapt for UMS9230
 support
Message-ID: <20250722-imported-origami-cat-dbfaad@kuoka>
References: <20250719-ums9230-drm-v1-0-e4344a05eb3d@abscue.de>
 <20250719-ums9230-drm-v1-1-e4344a05eb3d@abscue.de>
 <9966b9e4-399b-4446-81e4-15daf9acbff7@kernel.org>
 <aHz1Z94swDewvriQ@abscue.de>
 <40fd4502-71d5-435e-83f2-2df933c0467b@kernel.org>
 <aH0o3HlyPci3-7DK@abscue.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aH0o3HlyPci3-7DK@abscue.de>
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

On Sun, Jul 20, 2025 at 07:35:24PM +0200, Otto Pfl=C3=BCger wrote:
> On Sun, Jul 20, 2025 at 05:38:02PM +0200, Krzysztof Kozlowski wrote:
> > >=20
> > > The clocks should be the same on sharkl3 (sc9863a) and ums9230, but
> > > the existing bindings don't really make sense here or are incomplete.
> > > AFAIK there is no SoC in which this display controller is directly
> > > connected to the PLL as shown in the example. The DSI controller is
> >=20
> > This is not the PLL. Gate either. You are looking from wrong side - how
> > clock is generated.
> >=20
> > You describe here CLOCK INPUT.
> >=20
> > > connected to a clock gate. The DPU actually does have two clocks, both
> > > of which are clock muxes that allow selecting different frequencies a=
nd
> > > one of which is behind a clock gate. I can add the second clock for t=
he
> > > DPU if needed.
> > >=20
> > > Since nothing seems to be using these bindings at the moment, would it
> > > be okay to drop the old clock names that refer to specific frequencie=
s?
> >=20
> > It is still completely irrelevant whether these are muxes. Dropping
> > existing properties is ABI change, but anyway first figure out what is
> > here really.
>=20
> I was trying to point out that the existing clock names are incorrect
> because they refer to a specific source that is not necessarily used
> for these clocks, instead of giving a name for the clock input.

OK, if the old name refers to the same clock input as in your new
device, you can deprecate old case in the binding.

>=20
> For the DPU, would "core" and "dpi" be more appropriate as clock names?
> DPI refers to the interface used internally between the DPU and the DSI
> controller.

Sounds fine.

>=20
> For the DSI controller, it seems that the clock is actually an APB bus
> clock needed for accessing the control registers. Again, it is not
> required to be connected to a 96MHz clock source as the name used in the
> binding suggests. Would something like "apb_clk" or "pclk" be more
> descriptive?

Yeah, both are correct. I think pclk is preferred.

Best regards,
Krzysztof

