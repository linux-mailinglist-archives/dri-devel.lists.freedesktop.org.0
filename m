Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD7CAEDA33
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 12:45:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7993E10E3F5;
	Mon, 30 Jun 2025 10:45:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Wv8UFVB1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED45A10E3F5
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 10:45:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A47685C5C3F;
 Mon, 30 Jun 2025 10:45:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D78F1C4CEE3;
 Mon, 30 Jun 2025 10:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751280310;
 bh=wXMWujE7XchWdZ1zs2TcjwFnfNGsISRibnIGmp2rHBg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wv8UFVB1aU4AvzIw1ixfToJE1xEcqMoMHqYghwS78xjMENr06K8/DX6FHA3Mf3wDe
 Eo1Rr3ee6ZGEWGAmOKgF1i6f3GVlN3nDpwd+riFvj5z/BPnxA4R0AWJn0S6DItq05o
 8WK0Bl96+tRkn2HLbNoy1AJcIEkXViT3bIG340LONbwIuedqpekwlBzGYT9X4XwUWX
 W5ORZ8Ej2+zfwfiortCTzgSvQfJZ+6FspsFztS+1QHk2wTxbd7yzXeKoo4fZvrHJLW
 umdUfe8Bu2okJ3c99tNMqapZJfNw1yTPvNhE12oaOwYI3iQDTghzvzB50ZWBwK6TSh
 hvPlygaXqrocg==
Date: Mon, 30 Jun 2025 12:45:07 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, 
 Luca Weiss <luca.weiss@fairphone.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: display: simple-framebuffer: Add
 interconnects property
Message-ID: <20250630-tapir-of-astonishing-artistry-ad0bd8@houat>
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
 <20250623-simple-drm-fb-icc-v2-1-f69b86cd3d7d@fairphone.com>
 <20250627-mysterious-optimistic-bird-acaafb@krzk-bin>
 <DAX7ZB27SBPV.2Y0I09TVSF3TT@fairphone.com>
 <1129bc60-f9cb-40be-9869-8ffa3b3c9748@kernel.org>
 <8a3ad930-bfb1-4531-9d34-fdf7d437f352@redhat.com>
 <85521ded-734d-48e8-8f76-c57739102ded@kernel.org>
 <20250630-stirring-kiwi-of-adventure-8f22ba@houat>
 <b9f010ca-1564-4a3a-b004-ef179d5c90a6@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="2z4ar3mqh5a4nutv"
Content-Disposition: inline
In-Reply-To: <b9f010ca-1564-4a3a-b004-ef179d5c90a6@kernel.org>
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


--2z4ar3mqh5a4nutv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/5] dt-bindings: display: simple-framebuffer: Add
 interconnects property
MIME-Version: 1.0

On Mon, Jun 30, 2025 at 11:36:51AM +0200, Krzysztof Kozlowski wrote:
> On 30/06/2025 10:38, Maxime Ripard wrote:
> > On Mon, Jun 30, 2025 at 10:24:06AM +0200, Krzysztof Kozlowski wrote:
> >> On 29/06/2025 14:07, Hans de Goede wrote:
> >>> Hi Krzysztof,
> >>>
> >>> On 28-Jun-25 1:49 PM, Krzysztof Kozlowski wrote:
> >>>> On 27/06/2025 11:48, Luca Weiss wrote:
> >>>>> Hi Krzysztof,
> >>>>>
> >>>>> On Fri Jun 27, 2025 at 10:08 AM CEST, Krzysztof Kozlowski wrote:
> >>>>>> On Mon, Jun 23, 2025 at 08:44:45AM +0200, Luca Weiss wrote:
> >>>>>>> Document the interconnects property which is a list of interconne=
ct
> >>>>>>> paths that is used by the framebuffer and therefore needs to be k=
ept
> >>>>>>> alive when the framebuffer is being used.
> >>>>>>>
> >>>>>>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> >>>>>>> ---
> >>>>>>>  Documentation/devicetree/bindings/display/simple-framebuffer.yam=
l | 3 +++
> >>>>>>>  1 file changed, 3 insertions(+)
> >>>>>>>
> >>>>>>> diff --git a/Documentation/devicetree/bindings/display/simple-fra=
mebuffer.yaml b/Documentation/devicetree/bindings/display/simple-framebuffe=
r.yaml
> >>>>>>> index 296500f9da05e296dbbeec50ba5186b6b30aaffc..f0fa0ef23d91043df=
b2b220c654b80e2e80850cd 100644
> >>>>>>> --- a/Documentation/devicetree/bindings/display/simple-framebuffe=
r.yaml
> >>>>>>> +++ b/Documentation/devicetree/bindings/display/simple-framebuffe=
r.yaml
> >>>>>>> @@ -79,6 +79,9 @@ properties:
> >>>>>>>    power-domains:
> >>>>>>>      description: List of power domains used by the framebuffer.
> >>>>>>> =20
> >>>>>>> +  interconnects:
> >>>>>>> +    description: List of interconnect paths used by the framebuf=
fer.
> >>>>>>> +
> >>>>>>
> >>>>>> maxItems: 1, or this is not a simple FB anymore. Anything which ne=
eds
> >>>>>> some sort of resources in unknown way is not simple anymore. You n=
eed
> >>>>>> device specific bindings.
> >>>>>
> >>>>> The bindings support an arbitrary number of clocks, regulators,
> >>>>> power-domains. Why should I artificially limit the interconnects to=
 only
> >>>>> one?
> >>>>
> >>>> And IMO they should not. Bindings are not supposed to be generic.
> >>>
> >>> The simplefb binding is a binding to allow keeping the firmware, e.g.
> >>> uboot setup framebuffer alive to e.g. show a boot splash until
> >>> the native display-engine drive loads. Needing display-engine
> >>> specific bindings totally contradicts the whole goal of=20
> >>
> >> No, it does not. DT is well designed for that through expressing
> >> compatibility. I did not say you cannot have generic fallback for simp=
le
> >> use case.
> >>
> >> But this (and previous patchset) grows this into generic binding ONLY
> >> and that is not correct.
> >=20
> > Can we have a proper definition of what a correct device tree binding is
> > then?
> >=20
> > It's a bit surprising to have *that* discussion over a binding that is
> > now well older than a decade now, and while there is definitely some
> > generic bindings in ePAPR/DT spec, like the CPU ones.
>=20
> Hm? In ARM world at least they are specific, e.g. they have specific
> compatibles.
>=20
> >=20
> > If you don't consider that spec to be correct DT bindings, please
> > provide a definition of what that is, and / or reasonable alternatives.
> >=20
> > Also, no, a device specific binding isn't reasonable here, because we
> > *don't* have a device. From a technical standpoint, the firmware creates
>=20
> You touch internal parts of the SoC and you list very specific SoC
> parts. Interconnect is internal part of the SoC and only specific
> devices are using it.
>=20
> You define here generic SW construct for something which is opposite of
> generic: the interconnect connecting two specific, unique components of
> one, given SoC.
>=20
> > the framebuffer, Linux just uses it. Just like you don't have a
> > device/platform specific compatible for PSCI, SCPI, et al.
>=20
> They follow some sort of spec and still they do not reference chosen
> SoC-design-specific properties.

ish.

I mean, on theory, you're absolutely correct. In practice,
assigned-clock-parents, assigned-clock-rates, or protected-clocks for
example exist and are *only* about SoC-design specific behaviours.

Maxime

--2z4ar3mqh5a4nutv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaGJqrwAKCRAnX84Zoj2+
dh39AX9zdlE7lH+G78LqemzNaC1qyQx2EBeMEMVM3nimVQN4kHOYHHm+tp+q2szm
O8OMuqkBgMxiYf+EbLKsRFdu5yB6Q8lQ1WgOmR8mtOKsPjecd8iby7KGmzt/2n/d
5IpPDuJG2w==
=h3OD
-----END PGP SIGNATURE-----

--2z4ar3mqh5a4nutv--
