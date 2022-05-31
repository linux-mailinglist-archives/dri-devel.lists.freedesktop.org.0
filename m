Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09661538D4E
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 10:58:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA5A10FB04;
	Tue, 31 May 2022 08:58:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ACDD10E6F8
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 08:58:41 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 163C25C0178;
 Tue, 31 May 2022 04:58:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 31 May 2022 04:58:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1653987521; x=
 1654073921; bh=oo43um3ROPuCPfC/KF7MzWcIrCP9C5yRfhjmYx4w5Bk=; b=N
 hhpvJx3+mrLCx5kBTPw04hgqsM8qeNe20J/ISTHZzSyOiKLuOFtJ8JJOZWZqLw/e
 g3BfrWbGhC+7dX0J4FszaINTCshzB56lFdN/WFLhJucJ9lZj3g01n6i+JzkHhenF
 bk6aPcyhNwMmCa+r5DGUG+uMVhih5L0ouOJaN73VUjhNHIshT+IdAK0h30Cu2pD7
 thubFBdmtTYAxGZUq2QpRvBsXYyJAsmjc0JTsJZxRnpoM/wGD1BEaE2S+4i5WViF
 gDEKgP6Vawu+Q6GXH/1JQbi2/QWr4aBu09Lm22pYnHAs0WnToWko/fUXWIjZlrhe
 X1Nb8XpYLkqoDzAUZSSrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:date:feedback-id:feedback-id:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; t=1653987521; x=1654073921; bh=o
 o43um3ROPuCPfC/KF7MzWcIrCP9C5yRfhjmYx4w5Bk=; b=iH35DW97Ah1NSmTkb
 tVz2iBYatAt4nAvefd9g/wzaBT3wtQ5MMi+4dFUm7NzpR6MYCHUJl6qvPS1pYLCK
 hq0hyiLO+YeIbUv3p4113AzEMc/4UUeDuybshE6UO7lrkHDTw8EhliDO7BIt1685
 cm8U2/f7vWlGFggl1pjvKsH3zzxwdfIn7RBhJHVpbANY4D5iBP2Rb6sYzaRTV7D8
 rbkgdnN5Ytherw5mWfOPpLcIPAmINdEBW2CksTkcbf/K9H1GVtAo8THWZo31/Msj
 78Pwui8jvgAVRwVFny1oG9vMLMTc9IXT4qetkgObXQEREAiMcq6Hrhlvl6Ccj9UV
 W+CjA==
X-ME-Sender: <xms:v9iVYm9brSS65NNHeTKa2aSAGuMhNuV_q02NqitHKIflWnyskPm93Q>
 <xme:v9iVYmvEPzIa6t8R0DpvIt20T_x2F-CuvHUh5PhWnDzhF2bxhd3KZmVzY2jSFMPHc
 rVf6sZAi_bHYy9zAN0>
X-ME-Received: <xmr:v9iVYsAbo4OglaOhlIdmxiDh4TkGUQLy0JQ-DnyspWLuS2cSVjWUV6VEFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrkeekgddutdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepgfejtedtjefggfffvdetuedthedtheegheeuteekfeeghfdtteejkeeludeg
 vddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:v9iVYue8RPFp1z-n5TDYcwmL08SVETCWBoiOkGM0Sj6DVf0ap9EGoQ>
 <xmx:v9iVYrO8My_Z2Um84Ljo0zAf5qBuSDu7j1Yhzm_MSrHcpsLPN30f3Q>
 <xmx:v9iVYonGekT-cC8ZcFo5elxoAmfC0a5p63TnPymE-i5SQLIN4aRP-Q>
 <xmx:wdiVYl0RpjWOCUCQSxgWM6t29uxM_f_xUVVu5CeL80V0FPNXRfX-7A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 May 2022 04:58:38 -0400 (EDT)
Date: Tue, 31 May 2022 10:58:35 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Samuel Holland <samuel@sholland.org>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Alistair Francis <alistair@alistair23.me>,
 =?utf-8?Q?Ond=C5=99ej?= Jirman <x@xff.cz>,
 Andreas Kemnade <andreas@kemnade.info>, David Airlie <airlied@linux.ie>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Liang Chen <cl@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Peter Geis <pgwipeout@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 00/16] drm/rockchip: Rockchip EBC ("E-Book
 Controller") display driver
Message-ID: <20220531085835.grw5nt4vyofis3po@penduick>
References: <20220413221916.50995-1-samuel@sholland.org>
 <20220414085018.ayjvscgdkoen5nw5@houat>
 <Yo5kz/9cSd6ewC5f@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Yo5kz/9cSd6ewC5f@phenom.ffwll.local>
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

Hi Daniel,

Thanks for your feedback

On Wed, May 25, 2022 at 07:18:07PM +0200, Daniel Vetter wrote:
> > > VBLANK Events and Asynchronous Commits
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > When should the VBLANK event complete? When the pixels have been blit=
ted
> > > to the kernel's shadow buffer? When the first frame of the waveform is
> > > sent to the panel? When the last frame is sent to the panel?
> > >=20
> > > Currently, the driver is taking the first option, letting
> > > drm_atomic_helper_fake_vblank() send the VBLANK event without waiting=
 on
> > > the refresh thread. This is the only way I was able to get good
> > > performance with existing userspace.
> >=20
> > I've been having the same kind of discussions in private lately, so I'm
> > interested by the answer as well :)
> >=20
> > It would be worth looking into the SPI/I2C panels for this, since it's
> > basically the same case.
>=20
> So it's maybe a bit misnamed and maybe kerneldocs aren't super clear (pls
> help improve them), but there's two modes:
>=20
> - drivers which have vblank, which might be somewhat variable (VRR) or
>   become simulated (self-refresh panels), but otherwise is a more-or-less
>   regular clock. For this case the atomic commit event must match the
>   vblank events exactly (frame count and timestamp)

Part of my interrogation there is do we have any kind of expectation
on whether or not, when we commit, the next vblank is going to be the
one matching that commit or we're allowed to defer it by an arbitrary
number of frames (provided that the frame count and timestamps are
correct) ?

> - drivers which don't have vblank at all, mostly these are i2c/spi panels
>   or virtual hw and stuff like that. In this case the event simply happens
>   when the driver is done with refresh/upload, and the frame count should
>   be zero (since it's meaningless).
>=20
> Unfortuantely the helper to dtrt has fake_vblank in it's name, maybe
> should be renamed to no_vblank or so (the various flags that control it
> are a bit better named).
>=20
> Again the docs should explain it all, but maybe we should clarify them or
> perhaps rename that helper to be more meaningful.
>=20
> > > Blitting/Blending in Software
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > > There are multiple layers to this topic (pun slightly intended):
> > >  1) Today's userspace does not expect a grayscale framebuffer.
> > >     Currently, the driver advertises XRGB8888 and converts to Y4
> > >     in software. This seems to match other drivers (e.g. repaper).
> > >
> > >  2) Ignoring what userspace "wants", the closest existing format is
> > >     DRM_FORMAT_R8. Geert sent a series[4] adding DRM_FORMAT_R1 through
> > >     DRM_FORMAT_R4 (patch 9), which I believe are the "correct" formats
> > >     to use.
> > >=20
> > >  3) The RK356x SoCs have an "RGA" hardware block that can do the
> > >     RGB-to-grayscale conversion, and also RGB-to-dithered-monochrome
> > >     which is needed for animation/video. Currently this is exposed wi=
th
> > >     a V4L2 platform driver. Can this be inserted into the pipeline in=
 a
> > >     way that is transparent to userspace? Or must some userspace libr=
ary
> > >     be responsible for setting up the RGA =3D> EBC pipeline?
> >=20
> > I'm very interested in this answer as well :)
> >=20
> > I think the current consensus is that it's up to userspace to set this
> > up though.
>=20
> Yeah I think v4l mem2mem device is the answer for these, and then
> userspace gets to set it all up.

I think the question wasn't really about where that driver should be,
but more about who gets to set it up, and if the kernel could have
some component to expose the formats supported by the converter, but
whenever a commit is being done pipe that to the v4l2 device before
doing a page flip.

We have a similar use-case for the RaspberryPi where the hardware
codec will produce a framebuffer format that isn't standard. That
format is understood by the display pipeline, and it can do
writeback.

However, some people are using a separate display (like a SPI display
supported by tinydrm) and we would still like to be able to output the
decoded frames there.

Is there some way we could plumb things to "route" that buffer through
the writeback engine to perform a format conversion before sending it
over to the SPI display automatically?

Maxime
