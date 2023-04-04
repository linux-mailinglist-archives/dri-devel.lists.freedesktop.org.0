Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1466D683B
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 18:04:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D2E410E6EB;
	Tue,  4 Apr 2023 16:04:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2095610E6EB
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 16:04:22 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 75E1D5C006A;
 Tue,  4 Apr 2023 12:04:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 04 Apr 2023 12:04:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1680624261; x=1680710661; bh=B7
 /5AIBnfIH/2s6wMTpXdZQPThBIIGqSpAmW70gcxJ8=; b=SUYHFB99wp5EVSYI4A
 gEXfk4DR2sIW53SKv/sK8mQ40h9uHeZar2fOLogWctRXeyONjcRP5mkOyj43e20q
 44m/5PqF9aAGQ0H6jYWa0EMDMo1k0AEYvZSylvUEiEJO0KL5m24acn6OocLRekEw
 My46wpqs4Ug+IxaK7MtBwRQFiKV5afdHzg95mVg6idRaOaSZ2EhS4N5w2ywV6oM8
 SVEpKF67XSH/o8uayDtAZZb7mrm0CKULLwYjV5S4fIWgTCC2otNNEA3wPcyeGr2l
 QDqPst680TbS1zQz8M3lz8O2jfjC2txXhLwHcGEIx6ahePX1hRuAdZ7noQzjJDQQ
 0Ebg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1680624261; x=1680710661; bh=B7/5AIBnfIH/2
 s6wMTpXdZQPThBIIGqSpAmW70gcxJ8=; b=vZBInLoRUKTwFqkSv7Om1qQpT0X9Q
 NcFP90yaX0kv2V8raXfljaw0C0qKHuB+wmZQ2A74HefTdA+0wJvziBERC/2gwlD2
 K+adDuhmGi25+PR/UJ05w+Q/D7qsVueSsn0TLpV3dH4guPg8lSJaEEJBcuDiM8Oi
 hksBILaaknSQ4z8MqV6fNeO8lj9m1Dpu3acfAcCLRPvy1fsmMeW3cJL8WwdfSank
 l7hr4UX4wL0O1gsomnV3KQNDy1eprXCxHoj3tPYZVMKB9RZpMp8HcSiRc+ygcKpY
 613ebUUXdtNV5QE+8VkZ8Hp5EkZ/zUSq7rMQoBrLEfYZ+QeRetARqZB4A==
X-ME-Sender: <xms:hUosZKD9yIXHX1ngbO9PMdL2NNmrCIaLr69DgD70Oa2J0kPmzBOY1g>
 <xme:hUosZEjZ52G6SYecvog42CHGvsTJE-JFJ0Xi4Y2VILzNAeO8JWIS8c5CH-rr52dJi
 vFzP_l8NBSr4mB2A-g>
X-ME-Received: <xmr:hUosZNmLrrIX4CNFcSdwpp4ANTIgzs2je6h05rrUhipLQlDAsLEALASX3cd5SfRlajEbicpv8sBOBPavSp1mzxRKtvEIDrk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgleeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedtleekjeeiudefvdfhieffteelhfeivdeliefgieeugffhvdelieffjeei
 geetjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:hUosZIzt5USDVNgBRVjmO02gVpu3Mh1sgxkyKJkdzez4VQo55eUUKg>
 <xmx:hUosZPSwpYpkmyfhNFJE_ufFjg0Vs-SYc4NmMJhxeQWQN6iuXpHbwQ>
 <xmx:hUosZDYsXh9UMf1r5abS4VR4xyngz_VmqAI7dt31IYU3P8c4cyxxfw>
 <xmx:hUosZOBnLbfNxdFy2qK1moPd_tGUDaNOL5kxABGqVGYWyZywAj3Ukw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 12:04:20 -0400 (EDT)
Date: Tue, 4 Apr 2023 18:04:19 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [PATCH 7/7] dt-bindings: display: add panel-timing property to
 sitronix,st7789v
Message-ID: <20230404160419.xlnlxq7sbsqopfwo@houat>
References: <20230314115644.3775169-1-gerald.loacker@wolfvision.net>
 <20230314115644.3775169-8-gerald.loacker@wolfvision.net>
 <20230316215735.GA3940832-robh@kernel.org>
 <dd26836f-d54c-65d1-0acc-8a09745bb066@wolfvision.net>
 <20230329091636.mu6ml3gvw5mvkhm4@penduick>
 <d5a31f75-eb93-0ff2-cd5b-19cdec58e103@wolfvision.net>
 <20230330145811.asot2cvux4ebbeqy@penduick>
 <5f1f90e2-eee8-d941-e4b0-7f2411a9d415@wolfvision.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="v7utqc2px55llm33"
Content-Disposition: inline
In-Reply-To: <5f1f90e2-eee8-d941-e4b0-7f2411a9d415@wolfvision.net>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Gerald Loacker <gerald.loacker@wolfvision.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--v7utqc2px55llm33
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 31, 2023 at 11:36:43AM +0200, Michael Riesch wrote:
> On 3/30/23 16:58, Maxime Ripard wrote:
> > On Wed, Mar 29, 2023 at 12:08:50PM +0200, Michael Riesch wrote:
> >> On 3/29/23 11:16, Maxime Ripard wrote:
> >>> On Thu, Mar 16, 2023 at 11:29:53PM +0100, Michael Riesch wrote:
> >>>> Hi Rob,
> >>>>
> >>>> On 3/16/23 22:57, Rob Herring wrote:
> >>>>> On Tue, Mar 14, 2023 at 12:56:44PM +0100, Gerald Loacker wrote:
> >>>>>> The sitronix-st7789v driver now considers the panel-timing propert=
y.
> >>>>>
> >>>>> I read the patch for that and still don't know 'why'. Commit messag=
es=20
> >>>>> should answer why.
> >>>>>
> >>>>>> Add the property to the documentation.
> >>>>>
> >>>>> We generally don't put timings in DT for panels. Why is this one=20
> >>>>> special?
> >>>>
> >>>> For now, having the timings in the device tree allows for setting the
> >>>> hsync/vsync/de polarity.
> >>>>
> >>>> As a next step, we aim to implement the partial mode feature of this
> >>>> panel. It is possible to use only a certain region of the panel, whi=
ch
> >>>> is helpful e.g., when a part of the panel is occluded and should not=
 be
> >>>> considered by DRM. We thought that this could be specified as timing=
 in DT.
> >>>>
> >>>> (The hactive and vactive properties serve as dimensions of this cert=
ain
> >>>> region, of course. We still need to specify somehow the position of =
the
> >>>> region. Maybe with additional properties hactive-start and vactive-s=
tart?)
> >>>>
> >>>> What do you think about that?
> >>>
> >>> I don't see why we would need the device tree to support that. What y=
ou
> >>> described is essentially what overscan is for HDMI/analog output, and=
 we
> >>> already have everything to deal with overscan properly in KMS.
> >>
> >> Thanks for your response, but I am afraid I don't quite follow.
> >>
> >> How are we supposed to expose control over the hsync/vsync/data enable
> >> polarity? I only know that the display controller and the panel need to
> >> agree on a setting that works for both. What is the canonical way to do
> >> this?
> >=20
> > So typically, it would come from the panel datasheet and would thus be
> > exposed by the panel driver. st7789v is not a panel itself but a (pretty
> > flexible) panel controller so it's not fixed and I don't think we have a
> > good answer to that (yet).
>=20
> Then it seems to me that creating a panel driver (=3D st8879v panel
> controller driver with a new compatible) would make sense.

I don't see why? The entire controller is the same except (maybe) for
some initialization data. Doing a new driver for it seems like taking
the easy way out?

> By coincidence Sebastian Reichel has come up with this approach
> recently, see
> https://lore.kernel.org/dri-devel/20230317232355.1554980-1-sre@kernel.org/
> We just need a way to resolve the conflicts between the two series.
>=20
> Cc: Sebastian

That's not a new driver though? That approach looks sane to me.

> >> A different question is the partial mode, for which (IIUC) you suggest
> >> the overscan feature. As I have never heard of this before, it would be
> >> very nice if you could point me to some examples. Where would the
> >> effective resolution be set in this case?
> >=20
> > So, back when CRT were a thing the edges of the tube were masked by the
> > plastic case. HDMI inherited from that and that's why you still have
> > some UI on some devices (like consoles) to setup the active area of the
> > display.
> >=20
> > The underlying issue is exactly what you describe: the active area is
> > larger than what the plastic case allows to see. I don't think anyone
> > ever had the usecase you have, but it would be the right solution to me
> > to solve essentially the same issue the same way we do on other output
> > types.
>=20
> OK, we'll look into the overscan feature. But still the information
> about the active area should come from the driver, right?

No, the userspace is in charge there.

Maxime

--v7utqc2px55llm33
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZCxKgwAKCRDj7w1vZxhR
xVipAP9Iuopj25k9qKGAx0RxPd382YqPkKlLJHe75NBMZWCIEgEA+Yk5S6h0cLuD
lqjyBNtPVjpd1r1ePFYCbs/04ufdNwQ=
=tyEC
-----END PGP SIGNATURE-----

--v7utqc2px55llm33--
