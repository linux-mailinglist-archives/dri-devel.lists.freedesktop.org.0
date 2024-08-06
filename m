Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA09C949305
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 16:29:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA5110E38B;
	Tue,  6 Aug 2024 14:29:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mEQMgsIS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CBF10E38B
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 14:29:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 627E6CE0E74;
 Tue,  6 Aug 2024 14:29:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E713C32786;
 Tue,  6 Aug 2024 14:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722954539;
 bh=0Hx1Sp3D04anpn/09flgLpvtKrFpagEoFdQXws7Jd5M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mEQMgsISHrAucpkdduMCeXk7e3ZKo5LpbJk+K0K0x+9P4LMjkBmuB6X1JKngp7WV5
 pEOGL09t5c3JNj2ak02CnO9fWJh4XMl1hE5s1ASrf7AiksJanVw4/B5QUQqBNzz+DN
 2AUTAY+9PAFOHQANDb5qmiWVTMQxKIxhctt8h6FVKqvQqnCwVZaB0nA4bliG5SwDzm
 abOc10VqctHYg5bPxHOFGf0UO6HHF7EU1e/A7auSWg8d6+2eWINvx8wEyehROn+kxl
 CGK7bENxY2BRLDNDu20jQuz1GAvU12hliWB3W/6uNeYUHjV3kVxwhL3A6dkVn509gQ
 by40/W9g6n5cg==
Date: Tue, 6 Aug 2024 15:28:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Takashi Iwai <tiwai@suse.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH 5/9] ASoC: audio-graph-card: use new of_graph functions
Message-ID: <151740cc-4d87-4b13-9dfd-1fa0145b022c@sirena.org.uk>
References: <87mslqw8mj.wl-kuninori.morimoto.gx@renesas.com>
 <87frriw8l9.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cezL0FvenkR3DiRm"
Content-Disposition: inline
In-Reply-To: <87frriw8l9.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: One picture is worth 128K words.
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


--cezL0FvenkR3DiRm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 06, 2024 at 04:58:42AM +0000, Kuninori Morimoto wrote:
> Now we can use new port related functions for port parsing. Use it.

Acked-by: Mark Brown <broonie@kernel.org>

--cezL0FvenkR3DiRm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmayMyMACgkQJNaLcl1U
h9BDjgf+I1ux9GtDYKacTSneur75Qi0XAIzzAKY3sWi71rG40AVO6Fkw3kX8xFNe
rjKBKPes7GIi3oPJXQzleBkX4hawg5/BXWyGO0X4ElCv6CWTXwrkxLkSHxTQrBeI
jJDx+45hvOGxh7TlAiWQt1edXSvWe6tRljwLYM7ogR5d1KKK9Olcw91O1xOszrTU
Ca6MjZFZYYaQcGr/LaIQ+7KX67nVD80cpTmoPXR4iSqhEJOJbOnZ9hB8SavS4iBv
fzVBavalYoSGCBB3TJQs2qxgH6Giqucza14Hwdvg6+vqklV19F8ZtAOD58Ir3wB4
I6SHiuEhZGW0Rg/wUlI2KRulmUmqkA==
=tqHi
-----END PGP SIGNATURE-----

--cezL0FvenkR3DiRm--
