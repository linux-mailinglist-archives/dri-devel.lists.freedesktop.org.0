Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD804AED778
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 10:38:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0112810E3BA;
	Mon, 30 Jun 2025 08:38:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AsPbnEVe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 883CC10E3BA
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 08:38:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 061265C5AFE;
 Mon, 30 Jun 2025 08:38:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 378BAC4CEF2;
 Mon, 30 Jun 2025 08:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751272704;
 bh=PLIXEwxWC7QQ+4j+LLRtCwneBwdS5keVrROQQcKq2wg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AsPbnEVeeT6DMTbgBs5s9l+FTADNSJXYPbtIqiPsS/hU/aVY9Fy9OH3DwzduKxOUM
 fH2aIm8nT/GLFGZEsjjqzUeb352NzzCk0HbW7W4wFuN6Vom3QjrVjRUfTAq6jqIrkp
 NU6VZOrUnmat+iYPFSCC/VtJctGTXtBq8qveyVuyedbHsX7mCA95Ct0zAafMKEWrL5
 ZZyrTXPeFtyKU9Gm1Ccq0urSRwCPu6MSLl+1JbpmqNrjulRxwRWdjMpXVQAyajs0cs
 3uA1vTK0rMUERie5ddq8JL6W74ggIkLnTkRFFASbjlOqZD46FVe4GZkeVOHwjHrOy8
 mYHlD/8S21AFg==
Date: Mon, 30 Jun 2025 10:38:21 +0200
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
Message-ID: <20250630-stirring-kiwi-of-adventure-8f22ba@houat>
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
 <20250623-simple-drm-fb-icc-v2-1-f69b86cd3d7d@fairphone.com>
 <20250627-mysterious-optimistic-bird-acaafb@krzk-bin>
 <DAX7ZB27SBPV.2Y0I09TVSF3TT@fairphone.com>
 <1129bc60-f9cb-40be-9869-8ffa3b3c9748@kernel.org>
 <8a3ad930-bfb1-4531-9d34-fdf7d437f352@redhat.com>
 <85521ded-734d-48e8-8f76-c57739102ded@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="hbtofy4xtgn6gof3"
Content-Disposition: inline
In-Reply-To: <85521ded-734d-48e8-8f76-c57739102ded@kernel.org>
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


--hbtofy4xtgn6gof3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/5] dt-bindings: display: simple-framebuffer: Add
 interconnects property
MIME-Version: 1.0

On Mon, Jun 30, 2025 at 10:24:06AM +0200, Krzysztof Kozlowski wrote:
> On 29/06/2025 14:07, Hans de Goede wrote:
> > Hi Krzysztof,
> >=20
> > On 28-Jun-25 1:49 PM, Krzysztof Kozlowski wrote:
> >> On 27/06/2025 11:48, Luca Weiss wrote:
> >>> Hi Krzysztof,
> >>>
> >>> On Fri Jun 27, 2025 at 10:08 AM CEST, Krzysztof Kozlowski wrote:
> >>>> On Mon, Jun 23, 2025 at 08:44:45AM +0200, Luca Weiss wrote:
> >>>>> Document the interconnects property which is a list of interconnect
> >>>>> paths that is used by the framebuffer and therefore needs to be kept
> >>>>> alive when the framebuffer is being used.
> >>>>>
> >>>>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> >>>>> ---
> >>>>>  Documentation/devicetree/bindings/display/simple-framebuffer.yaml =
| 3 +++
> >>>>>  1 file changed, 3 insertions(+)
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/display/simple-frame=
buffer.yaml b/Documentation/devicetree/bindings/display/simple-framebuffer.=
yaml
> >>>>> index 296500f9da05e296dbbeec50ba5186b6b30aaffc..f0fa0ef23d91043dfb2=
b220c654b80e2e80850cd 100644
> >>>>> --- a/Documentation/devicetree/bindings/display/simple-framebuffer.=
yaml
> >>>>> +++ b/Documentation/devicetree/bindings/display/simple-framebuffer.=
yaml
> >>>>> @@ -79,6 +79,9 @@ properties:
> >>>>>    power-domains:
> >>>>>      description: List of power domains used by the framebuffer.
> >>>>> =20
> >>>>> +  interconnects:
> >>>>> +    description: List of interconnect paths used by the framebuffe=
r.
> >>>>> +
> >>>>
> >>>> maxItems: 1, or this is not a simple FB anymore. Anything which needs
> >>>> some sort of resources in unknown way is not simple anymore. You need
> >>>> device specific bindings.
> >>>
> >>> The bindings support an arbitrary number of clocks, regulators,
> >>> power-domains. Why should I artificially limit the interconnects to o=
nly
> >>> one?
> >>
> >> And IMO they should not. Bindings are not supposed to be generic.
> >=20
> > The simplefb binding is a binding to allow keeping the firmware, e.g.
> > uboot setup framebuffer alive to e.g. show a boot splash until
> > the native display-engine drive loads. Needing display-engine
> > specific bindings totally contradicts the whole goal of=20
>=20
> No, it does not. DT is well designed for that through expressing
> compatibility. I did not say you cannot have generic fallback for simple
> use case.
>=20
> But this (and previous patchset) grows this into generic binding ONLY
> and that is not correct.

Can we have a proper definition of what a correct device tree binding is
then?

It's a bit surprising to have *that* discussion over a binding that is
now well older than a decade now, and while there is definitely some
generic bindings in ePAPR/DT spec, like the CPU ones.

If you don't consider that spec to be correct DT bindings, please
provide a definition of what that is, and / or reasonable alternatives.

Also, no, a device specific binding isn't reasonable here, because we
*don't* have a device. From a technical standpoint, the firmware creates
the framebuffer, Linux just uses it. Just like you don't have a
device/platform specific compatible for PSCI, SCPI, et al.

And from a process standpoint, that driver is typically used years
before we even get to writing a driver for the actual display driver.
And since bindings are far from standard and actually pretty
opionionated, even if we submitted a binding to use a proper binding
without having a clear idea of what the hardware is, or what a driver
would want, we would end up with either a broken binding, or a broken
driver.

Maxime

--hbtofy4xtgn6gof3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaGJM/QAKCRAnX84Zoj2+
dp8lAX0XjiHwXCRnaTDs4vlk7Mk0E+SF7vXGwL4XES2VVQuafyI5PHmNPASOj50l
8IbNN4EBfjVbhdmCzLalbOYCKk+4j8bq9hixo+ZfPzxdRT2Esn8tvlUHMJa/Um+T
DOcMcoHSYA==
=uZYT
-----END PGP SIGNATURE-----

--hbtofy4xtgn6gof3--
