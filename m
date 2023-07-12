Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E57F750D4C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 17:58:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A4C10E584;
	Wed, 12 Jul 2023 15:58:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F41910E584
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 15:58:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B7791C0007;
 Wed, 12 Jul 2023 15:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1689177525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+1Zhaf288c6QgZc0cVQIG/zrggMJajpMOeOYvAdfLSs=;
 b=LHBnv7EoIEQqNpbXaWGGJm61J1W/U840LsDsteL3KiaM7v6/HH3Ow4nzlXntEOWUPvMicw
 DsgR33JyIlfh5z9LDKunk0dP9O/zximA/8B99hQ8mBjpso3iL64R4DU2GBnbM5SwA5gq7X
 C17ApIcYqsc1HofddyEiw44mT3tba9UFtwC80jRUsnKDUscnDVsOcEmYmLf5iKXf97nGH/
 eR9PC//du22kMhBXweLn3GS/pIYGKGWHzLgVTaCcW+T4FEEkRI/QmHodQiqfnhF27orrMh
 lm0+CckLvqLMbspIx3qKYRArOTdKHjzPwlMu6haVUtwjMsSkLYTFNcakkc94SA==
Date: Wed, 12 Jul 2023 17:58:42 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>
Subject: Re: [PATCH v3 0/2] Small of/device cleanup
Message-ID: <20230712175842.12ee7e8c@xps-13>
In-Reply-To: <20230622213214.3586530-1-miquel.raynal@bootlin.com>
References: <20230622213214.3586530-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

miquel.raynal@bootlin.com wrote on Thu, 22 Jun 2023 23:32:12 +0200:

> My previous attempt to slightly clean the OF core wrt device structures
> was rather unsuccessful as the idea behind the discussed cleanup was
> more impacting than what I thought, leading to most of the previous
> series to be dropped. However, aside, two patches seemed actually
> relevant, so here they are, alone.
>=20
> Link: https://lore.kernel.org/all/20230608184903.GA3200973-robh@kernel.or=
g/

I expect this small series to go through the drm tree, but as I actually
sent it right before the beginning of the merge window and because I am
not an experienced drm contributor, I would like to know if I am
required to resend the patches or if they are fine as-is (I don't
expect any conflicts with v6.5-rc1).

Just let me know if a re-send is expected.

Cheers,
Miqu=C3=A8l

>=20
> Thanks,
> Miqu=C3=A8l
>=20
> Changes in v3:
> * Fixed the dev->parent referencing in the host1x driver.
> * Collected Rob's Acked-by.
>=20
> Changes in v2:
> * Dropped all the of_device.h/of_module.h changes
> * Directly used of_device_uevent() from the host1x driver
>=20
>=20
> Miquel Raynal (2):
>   of: module: Export of_device_uevent()
>   gpu: host1x: Stop open-coding of_device_uevent()
>=20
>  drivers/gpu/host1x/bus.c | 29 ++++++-----------------------
>  drivers/of/device.c      |  1 +
>  2 files changed, 7 insertions(+), 23 deletions(-)
>=20

