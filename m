Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB45D653D56
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 10:13:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9774D10E531;
	Thu, 22 Dec 2022 09:12:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2A0B10E531
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 09:12:47 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::224])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id F234EC8ACD
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 09:03:55 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7B92DE000A;
 Thu, 22 Dec 2022 09:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1671699813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T4gOPWGjEg88chOoWuaav23pjpL5Y5e5uaZVe/EqBqE=;
 b=QeGD5dLYPEuaEGCcki0adCUzRqSKZ/zV31K71rU2ze+Figq+pEPdRZgrSchKyv0X9dVVLd
 E4Zgew6xIafwewAasolBVx4tkU7epbCps3/37BBPtagS1o2eBEWyQ90dPbzFI7SmayUXpC
 /4irqMiMWzfHCCQpB45qqr1f03QVKbIlNhe7wzVxa8ZhbEsjSdhDOKmCu7oVyMzSDc/ko7
 LY/2AlLiBGZPqUD1hUAnJngvTe6kAqNaSI7PQQK/fmEopXzCbseH5gG118ncWstV8uhhyI
 oRv3L5QCAPiw/qPFMO7puyrSsxEEng2gkOHvWI5S2TDyya9Dy+mYxZI/dgNJ3Q==
Date: Thu, 22 Dec 2022 10:03:28 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 00/21] Add Tegra20 parallel video input capture
Message-ID: <20221222100328.6e341874@booty>
In-Reply-To: <a99fa7e5-31bc-4286-17e5-6ba6e4932bcf@gmail.com>
References: <20221128152336.133953-1-luca.ceresoli@bootlin.com>
 <a99fa7e5-31bc-4286-17e5-6ba6e4932bcf@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, Richard Leitner <richard.leitner@skidata.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Dmitry,

thanks for your review.

On Tue, 20 Dec 2022 23:21:49 +0300
Dmitry Osipenko <digetx@gmail.com> wrote:

> 28.11.2022 18:23, Luca Ceresoli =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Tegra20 and other Tegra SoCs have a video input (VI) peripheral that can
> > receive from either MIPI CSI-2 or parallel video (called respectively "=
CSI"
> > and "VIP" in the documentation). The kernel currently has a staging dri=
ver
> > for Tegra210 CSI capture. This patch set adds support for Tegra20 VIP
> > capture.
> >=20
> > Unfortunately I had no real documentation available to base this work o=
n.
> > I only had a working downstream 3.1 kernel, so I started with the driver
> > found there and heavily reworked it to fit into the mainline tegra-video
> > driver structure. The existing code appears written with the intent of
> > being modular and allow adding new input mechanisms and new SoCs while
> > keeping a unique VI core module. However its modularity and extensibili=
ty
> > was not enough to add Tegra20 VIP support, so I added some hooks to turn
> > hard-coded behaviour into per-SoC or per-bus customizable code. There a=
re
> > also a fix, some generic cleanups and DT bindings.
> >=20
> > Quick tour of the patches:
> >=20
> >  * Device tree bindings and minor DTS improvements
> >=20
> >    01. dt-bindings: display: tegra: add Tegra20 VIP
> >    02. dt-bindings: display: tegra: vi: add 'vip' property and example =
=20
>=20
> This series adds the new DT node, but there are no board DTs in upstream
> that will use VIP? Will we see the board patches?

I'm afraid I have no such plan. I don't have any public hardware with
Tegra20, with or without a parallel sensor. I have a custom board.

> In any case, given that you're likely the only one here who has access
> to hardware with VIP,=20

Likely indeed.

> you should promote yourself to the tegra-video
> driver maintainers and confirm that you will be able to maintain and
> test this code for years to come.

I can definitely add myself as a maintainer of this driver and join the
maintenance effort, I'm adding that in v3. I also have a board that I
can permanently use for testing.

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
