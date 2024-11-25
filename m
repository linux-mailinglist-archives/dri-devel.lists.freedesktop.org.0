Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0949D8327
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 11:13:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC2C10E177;
	Mon, 25 Nov 2024 10:13:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ecXyt2kI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B49410E177
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 10:13:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DEF2A5C5707;
 Mon, 25 Nov 2024 10:12:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0524C4CECE;
 Mon, 25 Nov 2024 10:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732529608;
 bh=hUO3cLlT3vdLxWhuhdutCmu0MQDfhoRgoCbEY54Csm8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ecXyt2kIURgzHaGqA6Om1ND2ZukCSUbhfaBgrTVsLdakQL+39aWUtBY8cVoSZlqdT
 dRUwWGz50dH5iV7nF6vRMvqpQpO6xflP3jTA2CWkLuo0/tSXMMPT9IZk533d3ETFFZ
 PUrlqfbTHHr6GC/Q7Nh/2CsDVLIG2Y9KTCtiw2GQvO1agESZR/y+t5VRVptpwuv4r6
 KCzDOe8VEYuNOTyeoKKxYb/vgGlz1h66d2Z4vRgBj17djGa0JjdWrWo7OwLQu3ud03
 SJMORycZfj959fobpZojpgvxp5bui2gfQ8cguN6GQ/nt9w6oroCQLb1zr3MpNrU5bt
 TD5FIj632msXg==
Date: Mon, 25 Nov 2024 11:13:25 +0100
From: Maxime Ripard <mripard@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, 
 ck.hu@mediatek.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v1 7/7] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
Message-ID: <20241125-spirited-industrious-roadrunner-e8154d@houat>
References: <20241120124512.134278-1-angelogioacchino.delregno@collabora.com>
 <20241120124512.134278-8-angelogioacchino.delregno@collabora.com>
 <20241122-cobra-of-authentic-discourse-e2c5b6@houat>
 <03b5a671-e0c0-4d18-a103-e7f0ab18e20e@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="h3ivafm5bqasam2u"
Content-Disposition: inline
In-Reply-To: <03b5a671-e0c0-4d18-a103-e7f0ab18e20e@collabora.com>
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


--h3ivafm5bqasam2u
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 7/7] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
MIME-Version: 1.0

On Mon, Nov 25, 2024 at 10:40:22AM +0100, AngeloGioacchino Del Regno wrote:
> Il 22/11/24 10:20, Maxime Ripard ha scritto:
> > Hi,
> >=20
> > On Wed, Nov 20, 2024 at 01:45:12PM +0100, AngeloGioacchino Del Regno wr=
ote:
> > > Add support for the newer HDMI-TX (Encoder) v2 and DDC v2 IPs
> > > found in MediaTek's MT8195, MT8188 SoC and their variants, and
> > > including support for display modes up to 4k60 and for HDMI
> > > Audio, as per the HDMI 2.0 spec.
> > >=20
> > > HDCP and CEC functionalities are also supported by this hardware,
> > > but are not included in this commit.
> > >=20
> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@=
collabora.com>
> >=20
> > Just a heads-up, you should really be using the new HDMI helpers, it'll
> > remove a lot of boilerplate and potential bugs.
>
> Hmm... the state helper you mean? Or the inflight series from Dmitry?

Ideally both, but targetting only the former would be great already :)

> In any case... yeah, you're right, let me check which helpers I can
> use: that's going to be done for v2 :-)

I think the scrambler support would be great to add there, there's a lot
of bugs in most drivers. If you feel like it :)

Maxime

--h3ivafm5bqasam2u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ0RNvwAKCRAnX84Zoj2+
du1BAYCjKyk+nF1tolybBaGVQDKxzLMP0aXHCAkIJNAu09aAHat9Y0MhN/kPIBXf
tfkB+7MBfjQt2wnl1ouI79g9WFI8G9PRbpuZNHwGd7TOzG9Ro+rG6xY9J8nMPV8N
WxjwIWRu/g==
=mo8X
-----END PGP SIGNATURE-----

--h3ivafm5bqasam2u--
