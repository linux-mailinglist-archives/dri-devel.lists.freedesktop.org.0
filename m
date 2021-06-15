Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F13853A778D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 09:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 097BD89DDD;
	Tue, 15 Jun 2021 07:03:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57CE89DDD
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 07:03:50 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id i13so1966822lfc.7
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 00:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=VkwmMqPudgwi4etGPGZGNiMyJFzHTdvib67KTwHrvhA=;
 b=iXpYaGHu18TLp90IFe6ackY+h/zE8YgJjlHLVfN1WTOdZSNYWBEe2WRzppBCevzPDb
 z34LGGj3jg0WlcESX3NQKy+Pt97aq9gD6BTyjm0P1Y3TmT0PXCxPb7erFt2Ecq5KnLWB
 XmVJUhzvDU1LjZbPHBMODCzMh7jv7rWKHSroF1iWraM+8F/aSp84CqJKTlzYoa8VHfeF
 t5Ard0quzBmpyD+6cFGe5xXGz0/m+2U4iO7Dh8tbIuBn99L+zLed9F8iwwBidoRcxEbX
 7lp7pCZw4V+x6PW1XG+otLNa9Ci0WIP77K9ip4rGK3vgmk2R0CFAyVwZlqtYSF5nyNX9
 4JSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=VkwmMqPudgwi4etGPGZGNiMyJFzHTdvib67KTwHrvhA=;
 b=N7I60t1uibc9uE8BLjLxNlsXMcrdljSH5mGCh+wBvyN6fEu+KHUxxUx222LnEmuX0X
 pZ0HnxwyZbn5QqFC38gdMyuiDTJqlR/Frp2BrSQaQQILIT2VqZ9d5PBN6YKOQ3ojnND+
 H1/vMDQiYFo/o7+DNiCentL7yNl11RpC75Ckq7MsX9u4PGi0LgomVi9b+y3yiTp/exiZ
 pRNBIizbBT3IiiIGMD95kF9tTJTzz9i1wQydCmc4+dbctsN/yeXOWrY9kC70x74YJ/dJ
 8cggh8j8wJ6tf2uG9HYfwJ2Zcy00oeB+cSls0DomZCfBiAHE47TDTQd8mOTb6yRFRsWs
 Gfiw==
X-Gm-Message-State: AOAM5323VPV+JvWnM6mcg/Vpyo9NBv5FmhwZxykiCt1k1E1t4+wbIKD8
 9a2LYyTpjWXMEk+ApJ5Vm+c=
X-Google-Smtp-Source: ABdhPJxWg3lpxFg1wyEWPHypcY9KBqPR7efrO0kmYm9WXqr/s+n+sZ71uXbtAbqCp85D4X4hcfWvGA==
X-Received: by 2002:a05:6512:324b:: with SMTP id
 c11mr10816366lfr.623.1623740629053; 
 Tue, 15 Jun 2021 00:03:49 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id f3sm1029796lfu.33.2021.06.15.00.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 00:03:48 -0700 (PDT)
Date: Tue, 15 Jun 2021 10:03:35 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3] Documentation: gpu: Mention the requirements for new
 properties
Message-ID: <20210615100335.0b8f96d5@eldfell>
In-Reply-To: <YMeE63G+9DSLPB3N@pendragon.ideasonboard.com>
References: <20210610174731.1209188-1-maxime@cerno.tech>
 <CAKMK7uG_Wkko0L6sv0U1bXWdYk4fg3OTcp5=+qfRV0CP9V44=A@mail.gmail.com>
 <KNFHfqvJUVq9oy9BSdznj1S6xhDoZUAx1_DwfSNvUv8u1d-TroKBTq2hxtv7u1aJnxnpI5CxUXSMTn73YsVhZjnRW78gv-QLsK6AkJ5m3Fw=@emersion.fr>
 <20210611120309.2b5eb4htupv5ss32@e110455-lin.cambridge.arm.com>
 <20210614174912.15a49336@eldfell>
 <20210614152413.nguqia3s4tlowio4@e110455-lin.cambridge.arm.com>
 <YMeE63G+9DSLPB3N@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Z+N+5PIJptXMUZOhK2K2MQi"; protocol="application/pgp-signature"
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

--Sig_/Z+N+5PIJptXMUZOhK2K2MQi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 14 Jun 2021 19:33:47 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> On Mon, Jun 14, 2021 at 04:24:13PM +0100, Liviu Dudau wrote:
> > On Mon, Jun 14, 2021 at 05:49:12PM +0300, Pekka Paalanen wrote: =20
> > > On Fri, 11 Jun 2021 13:03:09 +0100
> > > Liviu Dudau <liviu.dudau@arm.com> wrote:
> > >  =20
> > > > On Fri, Jun 11, 2021 at 08:14:59AM +0000, Simon Ser wrote: =20
> > > > > On Thursday, June 10th, 2021 at 23:00, Daniel Vetter <daniel.vett=
er@ffwll.ch> wrote:
> > > > >    =20
> > > > > > If there's a strong consensus that we really need this then I'm=
 not
> > > > > > going to nack this, but this really needs a pile of acks from
> > > > > > compositor folks that they're willing to live with the resulting
> > > > > > fallout this will likely bring. Your cc list seems to have an a=
bsence
> > > > > > of compositor folks, but instead every driver maintainer. That's
> > > > > > backwards. We make uapi for userspace, not for kernel driver
> > > > > > maintainers!   =20
> > > > >=20
> > > > > In wlroots we have a policy of only allowing standard KMS propert=
ies to
> > > > > be used. Any vendor-specific property is going to be less well-de=
fined,
> > > > > less widely useful, potentially have more design issues, potentia=
lly
> > > > > overlap in functionality with other vendor-specific properties, l=
ikely
> > > > > have some hardware-specific assumptions, etc.
> > > > >=20
> > > > > What matters here is discussing with other driver & user-space fo=
lks to
> > > > > make sure the new property's design is sound. Designing uAPI is h=
ard.
> > > > >=20
> > > > > If kernel folks are struggling with a user-space implementation, =
they
> > > > > should discuss with user-space folks to see which project would be
> > > > > interested. There's a chance a compositor will be interested in t=
he new
> > > > > property and will just do the user-space part for you, if not we =
can
> > > > > suggest candidate projects.
> > > > >=20
> > > > > tl;dr strong agree with Daniel here.   =20
> > > >=20
> > > > I think the assumption you and Daniel are making is that the first =
implementation of
> > > > a new KMS property can be made standard from day one and that it wi=
ll work for any
> > > > late comer driver as is, without having to make changes to its beha=
viour in a
> > > > significant way. In my experience that is not the case.
> > > >=20
> > > > I think we have moved from the times when we were trying to impleme=
nt in the Linux
> > > > world features that were available in the hardware but needed a ker=
nel and userspace
> > > > API. The set of properties that exist in KMS cover a lot of needed =
functionality and
> > > > I don't expect to see new properties for stuff that is already supp=
orted by hardware.
> > > >=20
> > > > What I'm expected to see in the future is new functionality that ge=
ts implemented by
> > > > one hardware vendor and the kernel developers trying to enable that=
 for userspace. It
> > > > could be that the new property is generic, but there is no way of t=
esting that on
> > > > more than one implementation yet, so I'd say we are generous callin=
g it "standard
> > > > property". When the second or third hardware vendor comes along and=
 starts supporting
> > > > that property with their own set of extra requirements, then we can=
 call it
> > > > "standard". =20
> > >=20
> > > I agree that is a problem with trying to make generic anything. But it
> > > does not mean you should not even try. Maybe trying really hard saves=
 a
> > > couple revisions. =20
> >=20
> > Agree.
> >  =20
> > > What I think should be planned for is revisions. How to add new
> > > properties that do the same thing but better, while documenting that a
> > > userspace KMS client can use only one revision at a time. You never
> > > remove old revisions, unless maybe with a DRM client cap they
> > > could disappear from that file description if that is necessary for
> > > seeing the new revision.
> > >=20
> > > While designing this, one also needs to take into account that KMS
> > > clients need to be able to save and restore properties *they do not
> > > understand*. So exposing two revisions of the same feature
> > > simultaneously would break save/restore is that's an error. =20
> >=20
> > I quite like the idea of having versions for properties. =20
>=20
> It's an interesting idea. We'll need to consider bundles of properties
> in that case I think, as in a v1 a feature could be implemented by
> properties A, B and C, while in v2 C could be replaced by D and E
> (beside A and B themselves also being changed in v2).
>=20
> > > > Then comes the effort cost: would it be easier to start with a vend=
or
> > > > property that only the vendor needs to support (and can submit patc=
hes into the
> > > > compositors to do so) and when the standard property gets added mov=
es to that, or =20
> > >=20
> > > But you can't move, you can only add? You can't delete the old proper=
ty
> > > in kernel if it was ever released with a kernel and anyone used it. In
> > > the same sentence you also imply that there is a user of it, so
> > > removing it will break that user. Then you'll have to track the
> > > userspace lifetime to figure out which decade you can try removing it=
. =20
> >=20
> > Not that I am supporting the workflow, but I was trying to address the =
comments that
> > vendors are going to push their own userspace implementation for their =
vendor
> > properties. If that is the case, when they switch to the standard ones =
they can drop
> > the support in userspace for their changes. With the implied assumption=
 that you will
> > have fewer vendor implementations hence easier to make changes, KMS pro=
perties can be
> > deleted if you know there is no user of them (e.g. the vendor has upgra=
ded all their
> > software to the standard property).
> >  =20
> > > > should we start with a generic property that gets implemented by th=
e compositors
> > > > (maybe, but then only one vendor supports it) and then later when w=
e actually
> > > > standardise the property we will have to carry backwards compatibil=
ity code in the
> > > > kernel to handle the old behaviour for old userspace? My proposal t=
o Maxime was for
> > > > the former option to be reflected in the documentation, but I would=
 like to hear your
> > > > thoughts. =20
> > >=20
> > > You have to carry the backward compatibility in all cases, right?
> > >=20
> > > Userspace OTOH can drop support for older less supported KMS properti=
es
> > > while taking advantage of a new revision. Userspace is not required to
> > > support old kernels forever.
> > >=20
> > >=20
> > > Here's a wild counter-proposal off a tangent:
> > >=20
> > > How about we make "implemented in and testable with VKMS" the rule,
> > > instead of "is generic" for new properties?
> > >=20
> > > VKMS is what compositors (will) use in CI. I would feel hugely less b=
ad
> > > about using a property that only one hardware driver ever implements,
> > > if also VKMS implements it in a way that compositor CI can observe it
> > > working.
> > >=20
> > > I don't expect this proposal to be accepted, but it's food for though=
t.
> > > The major problem for compositor projects is testing as you usually
> > > don't have the hardware, IMO. CI tends to not have any hardware. =20
> >=20
> > While I don't dislike the proposal (I think it is quite sensible), I am=
 worried that
> > for some behaviours VKMS will implement them in a quirky way. To pick (=
again) the
> > example of writeback, real hardware will have a way to tell if the buff=
er has been
> > sent successfully to memory and it might take more than one refresh per=
iod, while
> > VKMS (if I remember correctly) fakes it and signals the fence at the ne=
xt vblank. If
> > you code your compositor based on VKMS you might get unexpected artifac=
ts on real
> > hardware. =20
>=20
> I'm also worried about properties that related to hardware processing of
> frames, for instance related to colour spaces, or even scaling. VKMS has
> a software composer implemented in the kernel, it may get fairly
> complicated if we need to implement all kind of processing.

Hi,

indeed it will, but what else could one do to test userspace KMS
clients in generic CI where all you can have is virtual hardware? Maybe
in the long run VKMS needs to loop back to a userspace daemon that
implements all the complex processing and returns the writeback result
via VKMS again? That daemon would then need a single upstream, like the
kernel, where it is maintained and correctness verified.

Or an LD_PRELOAD that hijacks all KMS ioctls and implements virtual
stuff in userspace? Didn't someone already have something like that?
It would need to be lifted to be a required part of kernel UAPI
submissions, I suppose like IGT is nowadays.

Requiring a software implementation for testing has another huge
benefit (or disadvantage, depending on who you ask): "hardware does
secret magic" would not fly anymore. The software implementation would
need to deliver the same results, or at least one would need to define
the tolerances for e.g. color conversions. Otherwise userspace
compositor test suites might pass on the software implementation and
fail on hardware implementations. For compositor developers like me
knowing the exact formulas would be a huge benefit as it would allow me
to use KMS to off-load precision-sensitive operations (e.g.
professional color management). Otherwise, compositors probably need a
switch: "high quality color management? Then do not use KMS features."


Thanks,
pq

--Sig_/Z+N+5PIJptXMUZOhK2K2MQi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDIUMcACgkQI1/ltBGq
qqcghw//aI2Skk4Q4FEBc7oB34e0Ce4b4N8O5o9gXoTrq/Ha7GF1qjZ6LLLHWKun
uA3351HPsYJN7DP67iqJbtTgoULZ66OmDjF/EdTlQIgYeNS4T5i0/IlSIyf+uDIo
ld3iZgkmQU7SD8ykV/Vtl4gCO8rnfL0fLBljQQy+LQn5hkXO1LH/cgyAc7uc2Yf/
eNjpqlozHCqmqVnr2jTIRTgYaJ/YrgYD5Qi9MeXI5yszSUik2OrkKGrlnAqaLkFn
/daW35Sd3bQFtcFUB+K3V6RGdyx4Yn2Zpls3qxQ+VcM1Fys4x+E0JOSn/uAmipyF
2vaa/RnaZ3j6sQYGhIcBNf8ZSgbAAHFnBMQLkaXh+Eal27gs9MPpDv1jMhIpWy1t
6x7+32//c+rnuxlB6Vh6WE42PLmuwc1MXoWvoQxNfyyb2wcOfJcj7v/u0CqVWnGS
2lDViOfuGjkJnqqb1f/vTHcf5moZ3RYcXGHqpqZUHHvLMTT4An1Vda6VkVWepxud
x62yFEe6SJm5uaLQWVA9O1oUmDnpXarrlUzCmiKkhCGqhRvQvYgJfMTq5jUNFV7t
+UOvarux0u6RQ0IS1RtwbwPmAIdu09ob18pddG8yjGUBeM030Y95HevIqCIzFi2N
bDQU/USIKW1b5QSK8gdvPKNeldp2SGBCJji8rnVGg7af9/6mbiA=
=S5De
-----END PGP SIGNATURE-----

--Sig_/Z+N+5PIJptXMUZOhK2K2MQi--
