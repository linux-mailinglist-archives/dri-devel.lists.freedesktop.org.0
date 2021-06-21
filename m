Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F533AE696
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 11:55:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C8D89C27;
	Mon, 21 Jun 2021 09:55:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E92B89C27
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 09:55:31 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id u20so4562715ljl.13
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 02:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=etufu7VDtLdvOV7ePLkdJ6AJ3LGiq6y0n5v3BuXZjew=;
 b=iVVcG+HtMkNGlkLGYMsltzaYHncZVGPstq/4TJYk5G5ySD6HHtSPMr48BjcMPXWlN8
 qL4Gly/V4H3FG/F3Wx46nD+4Jai9oZryhSf2586vqIlMFW83Rsc6/duF54aIR8ZFVvuW
 Xezl2M1tfbC/PxA8psFg2r1kSBIomYXso1Aj1d5iNd6GsW8fwa8l/9CcTS+fgyg38kCI
 mcNKW3QGLn6/8n6oh4oJWnsYq7T1iqXvRNKb+cCCtyymIp/V3QCQZ4aKt4gYzihNUqLO
 JTeJx6zXo+2+73NaMi/kh+ame0japCfEUoEKkbP/BQMQt+LYvxe/E+f3W/Nif26k9ygl
 rrbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=etufu7VDtLdvOV7ePLkdJ6AJ3LGiq6y0n5v3BuXZjew=;
 b=D3kf3d5h6lTjm0RfvEMLSmNQ6XJ//d6mfe7eDiNskkWFjfbV9u1SmRxkpdGwjNUR7Z
 Toz9FTmctWHB8gbk2Z5nX/KdkY6HL7UX22ndYM22sAlQzJR6pz4vbHDbekthLJcMiMAB
 Z9nYYJ5jxXTLkJHU6oAAefc2r7E6vQsz5p/ohRXSYGrm1UfOhlNW6b7hw6y7uzRd/ZR5
 k2se7UWyAJJ9pkDTRoVvEZHHAZNjtzB9YMbQCQhMmTbtkYebKDkakLtCp7MNk+M/zrfU
 3wPd6J1zcdVxYptCa5Vo4fsGs57c5q3dxvafGf+eT561gF6fnWe0eRuFIxE+QhtkGJqZ
 N6cw==
X-Gm-Message-State: AOAM533OgzR9SeZhck876LMOQBklLzZNZhpxcgQSEBHpYjlG8doMoTGq
 ISDg4NN8H4ar5/eoLaIl2Rw=
X-Google-Smtp-Source: ABdhPJxYrirVuXfqGjJRV/twEUoif5ststNfss0IWj31PAJ37RQgPY/CDhzN90hvHGG/GlAyUrVkpA==
X-Received: by 2002:a05:6512:ea1:: with SMTP id
 bi33mr11328045lfb.281.1624263692434; 
 Mon, 21 Jun 2021 01:21:32 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id s10sm819651lfi.62.2021.06.21.01.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 01:21:32 -0700 (PDT)
Date: Mon, 21 Jun 2021 11:21:27 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3] Documentation: gpu: Mention the requirements for new
 properties
Message-ID: <20210621112127.5d4c7f7f@eldfell>
In-Reply-To: <YMyPQ/gLspPGn/zg@pendragon.ideasonboard.com>
References: <YMh21WBrADbZDcbp@pendragon.ideasonboard.com>
 <20210615131656.2ecefdc4@eldfell>
 <YMpnlDmzn0Re4Urn@pendragon.ideasonboard.com>
 <20210617102701.28f820b2@eldfell>
 <YMskHF8Bo/z3kqxf@pendragon.ideasonboard.com>
 <20210617143311.19896458@eldfell>
 <YMtQClnvjGNDhn9q@pendragon.ideasonboard.com>
 <20210618115152.79af3537@erebos>
 <YMxuWZWpmggDtvT9@pendragon.ideasonboard.com>
 <20210618143200.7e145f95@erebos>
 <YMyPQ/gLspPGn/zg@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/7/Dehh=ZdS0/4gj6GB_3fMp"; protocol="application/pgp-signature"
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
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Xinliang Liu <xinliang.liu@linaro.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sandy Huang <hjc@rock-chips.com>,
 Melissa Wen <melissa.srw@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Marek Vasut <marex@denx.de>,
 Jonathan Corbet <corbet@lwn.net>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Russell King <linux@armlinux.org.uk>, Steven Price <steven.price@arm.com>,
 David Airlie <airlied@linux.ie>, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Noralf =?UTF-8?B?VHLDuG5uZXM=?= <noralf@tronnes.org>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Chen Feng <puck.chen@hisilicon.com>, Hyun Kwon <hyun.kwon@xilinx.com>,
 NXP Linux Team <linux-imx@nxp.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Tian Tao <tiantao6@hisilicon.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Edmund Dea <edmund.j.dea@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alison Wang <alison.wang@nxp.com>, Roland Scheidegger <sroland@vmware.com>,
 Shawn Guo <shawnguo@kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 Maxime Ripard <maxime@cerno.tech>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Sean Paul <sean@poorly.run>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Paul Cercueil <paul@crapouillou.net>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Tomi Valkeinen <tomba@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Yannick Fertr e <yannick.fertre@foss.st.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Robert Foss <robert.foss@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Qiang Yu <yuq825@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/7/Dehh=ZdS0/4gj6GB_3fMp
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 18 Jun 2021 15:19:15 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> Hi Pekka,
>=20
> On Fri, Jun 18, 2021 at 02:32:00PM +0300, Pekka Paalanen wrote:
> > On Fri, 18 Jun 2021 12:58:49 +0300 Laurent Pinchart wrote: =20
> > > On Fri, Jun 18, 2021 at 11:55:38AM +0300, Pekka Paalanen wrote: =20
> > > > On Thu, 17 Jun 2021 16:37:14 +0300 Laurent Pinchart wrote:   =20
> > > > > On Thu, Jun 17, 2021 at 02:33:11PM +0300, Pekka Paalanen wrote:  =
 =20
> > > > > > On Thu, 17 Jun 2021 13:29:48 +0300 Laurent Pinchart wrote:     =
=20
> > > > > > > On Thu, Jun 17, 2021 at 10:27:01AM +0300, Pekka Paalanen wrot=
e:     =20
> > > > > > > > On Thu, 17 Jun 2021 00:05:24 +0300 Laurent Pinchart wrote: =
      =20
> > > > > > > > > On Tue, Jun 15, 2021 at 01:16:56PM +0300, Pekka Paalanen =
wrote:       =20

...

> > > > > One very typical difference between devices is the order of the
> > > > > processing blocks. By modelling the KMS pipeline as degamma -> cc=
m ->
> > > > > gamma, we can accommodate hardware that have any combination of
> > > > > [1-2] * 1D LUTs + 1 * CCM. Now, throw one 3D LUT into the mix, at=
   =20
> > > >=20
> > > > But you cannot represent pipelines like
> > > > 1D LUT -> 1D LUT -> CCM
> > > > because the abstract pipeline just doesn't have the elements for th=
at.
> > > > OTOH, maybe that ordering does not even make sense to have in hardw=
are?
> > > > So maybe not all combinations are actually needed.   =20
> > >=20
> > > If userspace wanted such a pipeline (I'm not sure why it would), then=
 it
> > > could just combine the two LUTs in one. =20
> >=20
> > Maybe? You can also combine the 1D LUTs into the 3D LUT in the
> > middle, too, but the result is not generally the same as using them
> > separately when the 3D LUT size is limited. =20
>=20
> Yes, my 3D LUT has 17 points, I've heard about LUTs up to 33 points
> (with bilinear interpolation), that's quite little if used as a 1D LUT.
> There's also the fact that interpolation will result in cross-talk
> between the three colour channels.

Hi Laurent,

that is not what I meant, but that's true too.

What I meant was this:
https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/582#note_951=
271

pre_curve and post_curve are the 1D LUTs on each side of a size-limited
3D LUT. pre_curve controls the 3D LUT tap positioning to concentrate on
the areas where the approximated function needs more taps.


> > Why would a generic userspace library API be a more feasible effort? =20
>=20
> I'll make a parallel with the camera world again, because I think
> display hardware is taking a similar path, just later.
>=20
> We used to have capture devices that offered a fairly high-level
> interface at the hardware or firmware level, with a set of features that
> were more or less standard. Devices could be exposed with an abstract
> model, as done in KMS today, with a set of standardized controls (V4L2
> uses the word control when KMS uses property). We had way less automated
> testing, and didn't enough attention to consistency of the userspace API
> (we're talking about code from the beginning of the century, if not
> earlier, the world was different), so different drivers were not
> consistent in how the API was implemented (for instance the API didn't
> specify gain units, so drivers would use different units), but more or
> less, you could write a standard V4L2 application that would work with
> most devices, with a few quirks here and there.
>=20
> Then the world changed. Cameras become more complex, with the raw sensor
> and the ISP exposed to Linux in the OMAP3 that Nokia used in the N900
> and N9 phones. For a while we tried to stick with V4L2, and implement
> ISP control within the kernel, with the help of a userspace daemon
> behind the scenes to which the kernel driver called back. The daemon was
> required, as control of the camera required complicated computation that
> really benefited from floating point math. It was horrible, and the
> daemon was closed-source, but from an application point of view, it was
> still high-level V4L2 as before. This hit a big wall though, to expose a
> high-level API on top of a low-level hardware interface, we had to
> bridge the gap in the kernel. This meant hardcoding use cases on the
> kernel side, which clearly wouldn't scale, as not everybody had the same
> use cases (an industrial vision application and a smartphone camera
> application really don't see the world the same way).  We were facing a
> dead end.
>=20
> We then decided to expose a lower-level API from kernel to userspace,
> giving userspace the ability to control everything. That's how the Media
> Controller API was born (its purpose is to expose the internal topology
> of the device as a graph of connected entities, that's about it), as
> well as the V4L2 subdev userspace API (in KMS term, that would mean more
> or less exposing DRM bridges to userspace, with the ability to control
> them individually). This simplified the kernel implementation (no more
> hardcoded use cases, no more daemon behind the scenes), but at the same
> time resulted in an API that wasn't a good fit for applications to
> consume directly. One step closer to the hardware, one step further from
> the user. You can think of this as the API exposed by GPU kernel
> drivers, it's not enough, a userspace component to translate to a
> higher-level API is needed.
>=20
> This was followed by 10 years of limbo as Nokia pulled the plug from
> Linux (and then smartphone) development. Fast forward, at the end of
> 2018, we created libcamera as the mesa of the camera world to solve this
> issue. It offers a standard camera stack with a high-level API, where
> device-specific code can be added (and kept to the minimum, as a
> centralized framework means we can share code that is common between
> devices).
>=20
> I see lots of parallel with display pipelines getting more complex. It
> wouldn't be fair to expose a very low-level API and ask every single
> compositor to know about all the devices out there, but at the same
> time, we're reaching a level of hardware complexity that I believe makes
> it a dead end to try to abstract and standardize everything at the
> kernel level. This doesn't mean we should allow all vendors to throw in
> any kind of crappy properties or other API extensions, we can still
> enforce some ground rules, such as proper documentation, reasonable
> effort for standardization, and reference open-source userspace
> implementation in a project we would consider to be the equalivant of
> mesa for KMS.

Thank you very much for explaining this! It makes perfect sense to me.
It also sounds like a =C2=A4&!%=C2=A4# amount of work, but really does soun=
d like
the best plan in the long term.

GPUs have OpenGL and Vulkan, but I suppose with cameras and display,
there is nothing standard to aim for, for either hardware designers nor
software designers? Chicken-and-egg.

> > > BTW, if we want to expose a finer-grained topology of processing bloc=
ks,
> > > I'd recommend looking at the Media Controller API, it was designed ju=
st
> > > for that purpose. =20
> >=20
> > Sure. However, right now we have KMS properties instead. Or maybe they
> > should just go all unused?
> >=20
> > Maybe the rule should be to not add any more KMS properties and tell
> > people to design something completely new based on Media Controller API
> > instead? =20
>=20
> No, I think that would be too harsh, my point was that if we want to
> expose how the building blocks are layed out, the MC API is meant to
> expose a graph of connected entities, so it's a good match. Controlling
> the device should still go through KMS properties I believe.

Ok.

...

> > To be able to plug device-specific components in compositors, we need a
> > driver-agnostic API through which compositors can use those device
> > specific components. Still the same problem, now just in userspace than
> > at the UAPI level. =20
>=20
> Agreed, it pushes the problem to a different place :-) I however think
> it may be easier to solve it in userspace, as it's a better place to
> hardcode use cases. A general-purpose compositor may not want to make
> use of all hardware features, while a specific-purpose compositor may
> want to exercise the hardware features differently. This however opens
> the door to introducing badly-designed and un(der-)documented
> properties, which is not something I want, so we would still need to set
> ground rules, such as documentation and reference implementation in a
> given userspace compositor/stack.

Right, sounds fine, but I think it also shifts the KMS UAPI paradigm a
little, away from generic and towards driver-specific. If the DRM
maintainers agree to that, I'm fine with it. It's just different from
what I have understood so far, which is why I'm so keen on getting UAPI
documented precisely.

> On that note, I think we need to do a bit more hand-holding. I'm sitting
> on a patch series that is several years old to add 3D LUT support to my
> driver, and while I believe I'm quite experienced with KMS development,
> adding support for this in a reference compositor in userspace is a
> really big task that I don't know how to tackle. I also know very little
> about colour management, and have nobody in the team who has that
> knowledge and could help me. I'm thus facing a bit of a dead-end, not
> because I don't want to spend the time required for this, but because
> the bar is so high that I just can't do it. I would expect many
> developers to be facing the same challenges. If the community doesn't
> make an effort in fostering collaboration between developers (most
> kernel developers won't even know who to ask for help if they have to
> step out of the kernel to userspace) and providing good documentation,
> we'll just scare developers away.=20

That's why I'm screaming here, to make contact. :-D

And Simor Ser is another, and I have seen him even offer to implement
userspace bits for new KMS properties in development.

But a 3D LUT in display is a really tiny piece in the landscape of color
management. Color management on Wayland has been talked about, oh I
don't remember, for a decade? Weston code has been experimented on for
the past few years at least. But only last week, the very first piece
of actual color management exclusive code was merged in Weston upstream.

Getting a display server project into a phase where it would actually
start experimenting on KMS features can take a decade - not just work
but finding the funding. Weston is not quite there yet either, not even
with all the currently open merge requests.

Then, if your 3D LUT is after blending, I'm not sure I would have use
for it in Weston! If it was on a KMS plane before blending, then yes, I
would have use for it. All this depends on how the blending color space
is chosen, and the idea we have right now does not have use for a 3D
LUT after blending - except maybe for fullscreen single-buffer
scenegraph, e.g. video and games.

> It took me weeks to figure out how to
> run Weston on this device, as it has no GPU that I can use, and falling
> back to a software compositor required finding out that lots of
> documentation is outdated and referenced command line options that were
> not accurate anymore (or I could mention painfully finding out that an
> issue I was blocked with for days was solved by plugging in a USB mouse
> to the board, as Weston didn't want to start without an input device).
> Another developer from my team tried before me and gave up, thinking it
> was impossible. That's the reality that many kernel developers are
> facing, the same way I suppose than me saying saying "you just need to
> recompile the kernel with this option enabled" is not very helpful for
> lots of userspace developers.

Why have I not heard of your problems with Weston?!

We have Gitlab issues, mailing list and IRC. You're warmly welcome to
ask when you hit a wall. :-)

I even read #dri-devel very often, so if you mentioned Weston there, it
would have had a good chance to reach me.


Thanks,
pq

--Sig_/7/Dehh=ZdS0/4gj6GB_3fMp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDQTAcACgkQI1/ltBGq
qqeXlhAApxWYfkend4vpcjm1BRJiNS0o9uEk9x1darMzZzRxeP1QIOat5okoelOe
0zW38/T83ca0ZhzqB+lRuEkZhfowqWu6heEfpIIcOZj639klz9JgAfwGy2SjSLQc
3ODhzrETbMoJsrmIL9zIGPrP+y8dVnC71zhaHl+Rl4kkCC3iAiztMeHJnvSEpYdY
I7LJAjYkceyMewV1vc/ZXNUQbBWGSe1gUBatuJqUc2eP6vq0ij+TE+AwjAiq0E00
VKhjGGUgITuvl0eDT+tB8ndZazFBkPSpwxhQV78szEC86l0et2HOKvnoZetj45Fp
t5gK8Cww/r+v/jiJG7qZhCrHKdkZ1GiNlOzb2n2rOQQiuAJvi3EZe4WrLoDIJ1CX
RN0oa9QrcdiuSLBsx/u6ed0wgaCTTbzKtROrKrhI9C/CSyVypBAeBbAujUnSwkb0
1ICROdX3ym8fNdmWVOLhqSTY+0JNppIRHiMWjw2yXsLBCNnggdkDLpjOb4lB4Tfr
Xb86YOUJZf7sdwFpARzGP3tN5UpZmpPp+rqqNMSxKC/wslqg2Ts/F2TF1NCrgvdg
OLrFc6eNJOOgQQRsoCkTWfITaRm0W5qf296C3unm93VATvI8aPLkXeoJDZ0e3XcF
tM2Opme1Gc3/gFYI7qrU2xug03XZIi0Ufr+vRHtgvTRpxsR7cOs=
=0qyH
-----END PGP SIGNATURE-----

--Sig_/7/Dehh=ZdS0/4gj6GB_3fMp--
