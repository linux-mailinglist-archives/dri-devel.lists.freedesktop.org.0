Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B20359BA90
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 09:48:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB8911A6F9;
	Mon, 22 Aug 2022 07:48:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D83AD1121BF
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 07:48:05 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id A0A70580281;
 Mon, 22 Aug 2022 03:48:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 22 Aug 2022 03:48:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1661154484; x=
 1661161684; bh=kU6Wak9ut3j71FNKf2BBeHdpI0gagJvWCf5yFVBoM/c=; b=H
 bUPksQAhrtg9+tEqN67qHrIjYx3E3y97nKNFMOxfK9lHY4b0HrFeFzwozV1/UuEk
 jnqKKcP3stC2iPQhWubYR88DpkpCQ+uuMuFjx16zDOnclzYiNDLuggYk0ma1ecqH
 iWU9QgfapN+nXI9i8uiDnSxjt5JQ0TdqPQkalfV8y5CjJrDw5vLmAbP+jVpj8DnB
 e00fXNBJmCfyaUsLab5atJYRR19hsiMzWrcUAp6mAmXg8R0hLFxe8qLanowPSM73
 qxRm1ZhHc0NbjkRMgacLggOo41+6BKIXohNNiHiZRJHUJsgkzYdriS7mbp+x3UKS
 nsizcFAvC+Ux46VqmhIlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661154484; x=
 1661161684; bh=kU6Wak9ut3j71FNKf2BBeHdpI0gagJvWCf5yFVBoM/c=; b=u
 w8EINgU0Xp5GQ1lo0oDnlD4M/3g7NrEmQW26OlQO6syTa+PG3Mg9ydwcYBiOHF46
 /FIvYYYKzJ1H7bRCJZE6ylyiqNjP54dWpgjBgYyd1OO83wKp0MpsFbUGnqfm8j8u
 QzFH+F9F0je0NoE2TbLidJmmTOfr7n4Djzrpo0CXy00gS8AdWsGHvBD0Tbz9YOw4
 h/9V+JwELqdfASTX2ADBR+PMZmtCcIkiM30mB3CPlg6uo9qJIFaGUyrO+fa6CeDz
 6oraXWrl7eAXPVXj96Vqqi0vmkritmpm6oNtSE4T2trpYRb6JVf4kIXT1Vbq5Krm
 WKHp8GO5PibBRxF51f3YQ==
X-ME-Sender: <xms:szQDY32-2c5mWR1G6LxeX0Vg7R3v1CLjTsw2XvN3mxrjkZXBQxpRXQ>
 <xme:szQDY2GFDP3KlWF34_cFVKizKKs3AWrYs9Q6vZenN070CU510oF2QPdSKmgrHCNfL
 NcroseR0DtwkaxouIo>
X-ME-Received: <xmr:szQDY35I9gju5RuUA5mCnt-8ZEN5A8t_TQMzhO7xKy8Bf_-ZrT77_cSEAek>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeiiedguddvjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtugfgjgesthhqredttddtudenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeelleefieelleetteefvdeikeeffeffvefhtdevgfehveduveehjedv
 vdeiledtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:szQDY819CXMEtZQrV0_neGd6rhjyRqdXcgvkSrSflAOfQMUjguxR9Q>
 <xmx:szQDY6GCUH1QFarSCmhw55TTNlA9OuQjfAtYBXUkE-DiVJOwqpOjgA>
 <xmx:szQDY9_g9jurhG8LSKWZHyrOCyfYXnKQN_sPCEwC2Nq6ucBlxHumIA>
 <xmx:tDQDYz3bSMaJOuQoZ4cxJb4caJ73u13HBUwmHbOAwYXx3L6nBBs47A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Aug 2022 03:48:02 -0400 (EDT)
Date: Mon, 22 Aug 2022 09:48:00 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v1 00/35] drm: Analog TV Improvements
Message-ID: <20220822074800.qzyctchqn5usr55g@houat>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <987d6114-5fcb-d668-3b0d-ad6d8723dfdb@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <987d6114-5fcb-d668-3b0d-ad6d8723dfdb@tronnes.org>
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
Cc: Emma Anholt <emma@anholt.net>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, Aug 21, 2022 at 06:33:12PM +0200, Noralf Tr=F8nnes wrote:
> Den 29.07.2022 18.34, skrev Maxime Ripard:
> > Hi,
> >=20
> > Here's a series aiming at improving the command line named modes suppor=
t,
> > and more importantly how we deal with all the analog TV variants.
> >=20
> > The named modes support were initially introduced to allow to specify t=
he
> > analog TV mode to be used.
> >=20
> > However, this was causing multiple issues:
> >=20
> >   * The mode name parsed on the command line was passed directly to the
> >     driver, which had to figure out which mode it was suppose to match;
> >=20
> >   * Figuring that out wasn't really easy, since the video=3D argument o=
r what
> >     the userspace might not even have a name in the first place, but
> >     instead could have passed a mode with the same timings;
> >=20
> >   * The fallback to matching on the timings was mostly working as long =
as
> >     we were supporting one 525 lines (most likely NSTC) and one 625 lin=
es
> >     (PAL), but couldn't differentiate between two modes with the same
> >     timings (NTSC vs PAL-M vs NSTC-J for example);=20
> >=20
> >   * There was also some overlap with the tv mode property registered by=
=20
> >     drm_mode_create_tv_properties(), but named modes weren't interacting
> >     with that property at all.
> >=20
> >   * Even though that property was generic, its possible values were
> >     specific to each drivers, which made some generic support difficult.
> >=20
> > Thus, I chose to tackle in multiple steps:
> >=20
> >   * A new TV norm property was introduced, with generic values, each dr=
iver
> >     reporting through a bitmask what standard it supports to the usersp=
ace;
> >=20
> >   * This option was added to the command line parsing code to be able to
> >     specify it on the kernel command line, and new atomic_check and res=
et
> >     helpers were created to integrate properly into atomic KMS;
> >=20
> >   * The named mode parsing code is now creating a proper display mode f=
or
> >     the given named mode, and the TV standard will thus be part of the
> >     connector state;
> >=20
> >   * Two drivers were converted and tested for now (vc4 and sun4i), with
> >     some backward compatibility code to translate the old TV mode to the
> >     new TV mode;
> >=20
> > Unit tests were created along the way. Nouveau, ch7006 and gud are
> > currently broken for now since I expect that work to be reworked fairly
> > significantly. I'm also not entirely sure about how to migrate GUD to t=
he
> > new property.
> >=20
> > Let me know what you think,
> > Maxime
> >=20
>=20
> I don't know if it's related to this patchset or not, but I do get this:
>=20
> pi@pi4t:~ $ sudo dmesg -C && sudo modprobe -r vc4 && sudo modprobe vc4
> && dmesg
> [  430.066211] Console: switching to colour dummy device 80x30
> [  431.294788] vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
> [  431.295115] vc4-drm gpu: bound fec13000.vec (ops vc4_vec_ops [vc4])
> [  431.295467] vc4-drm gpu: bound fe004000.txp (ops vc4_txp_ops [vc4])
> [  431.295804] vc4-drm gpu: bound fec12000.pixelvalve (ops vc4_crtc_ops
> [vc4])
> [  431.298895] [drm] Initialized vc4 0.0.0 20140616 for gpu on minor 0
> [  441.444250] vc4-drm gpu: [drm] *ERROR* [CRTC:68:crtc-1] flip_done
> timed out
> [  441.446529] Console: switching to colour frame buffer device 90x30
> [  451.684321] vc4-drm gpu: [drm] *ERROR* flip_done timed out
> [  451.684347] vc4-drm gpu: [drm] *ERROR* [CRTC:68:crtc-1] commit wait
> timed out
> [  461.924255] vc4-drm gpu: [drm] *ERROR* flip_done timed out
> [  461.924281] vc4-drm gpu: [drm] *ERROR* [CONNECTOR:45:Composite-1]
> commit wait timed out
> [  472.164006] vc4-drm gpu: [drm] *ERROR* flip_done timed out
> [  472.164031] vc4-drm gpu: [drm] *ERROR* [PLANE:61:plane-1] commit wait
> timed out
> [  482.403877] vc4-drm gpu: [drm] *ERROR* flip_done timed out
> [  482.403903] vc4-drm gpu: [drm] *ERROR* Timed out waiting for commit
> [  492.643799] vc4-drm gpu: [drm] *ERROR* [CRTC:68:crtc-1] flip_done
> timed out
> [  492.647073] vc4-drm gpu: [drm] fb0: vc4drmfb frame buffer device

Module unloading/reloading has been janky for a while.

I've fixed it up recently but it doesn't surprise me that there's still
some situation that won't work. Is it on a Pi3?

Maxime
