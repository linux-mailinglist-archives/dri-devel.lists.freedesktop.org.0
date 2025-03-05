Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6C9A4F8C2
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 09:26:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F0E10E092;
	Wed,  5 Mar 2025 08:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="td0ucEqV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F68710E092
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 08:26:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 003565C66C7;
 Wed,  5 Mar 2025 08:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C68FC4CEE2;
 Wed,  5 Mar 2025 08:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741163183;
 bh=CKep9lIEux6rqMukCPsUfeFS8wPwAtgSYA5QVRjKI8M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=td0ucEqVHK8atYbmGCD+2yVZyseFmvPelf27qLYlwjCJX1PRm2Jl1gp94QHf0E/15
 bDfvcNs0uHO3Mm+SmYEodhe8qT7Qoo/8GPjG65DXb6KDUfVmj/kLZhMahF2rBFCKkU
 Y+H13LWFngwpJoHEahxJNEG62cQuXUj8f01140SikPCPxGwUwqJkgXxaAa8TFAcyMg
 rIfAlhFHFkNSjRchZlOSebYTnWekg6uhO91EABD3w1Rg3T82qZ7eG9iDqrDByfwHJG
 s0IwQyXlNld9cQ7K93Yu7Jx6P8hPA/RfcpHokcZRVZlgpnaYyeWWMTHKdHITMhfTmt
 ZEQgk6BrRbRAA==
Date: Wed, 5 Mar 2025 09:26:21 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Subject: Re: [PATCH 1/5] dt-bindings: display: Document DPI color codings
Message-ID: <20250305-mustard-parrot-of-karma-1caf5d@houat>
References: <20250304101530.969920-1-victor.liu@nxp.com>
 <20250304101530.969920-2-victor.liu@nxp.com>
 <20250304-deer-of-striking-pride-ff6e86@houat>
 <20250305-important-quizzical-chamois-ff48af@krzk-bin>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="5qv5lchsz5iuy4wj"
Content-Disposition: inline
In-Reply-To: <20250305-important-quizzical-chamois-ff48af@krzk-bin>
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


--5qv5lchsz5iuy4wj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/5] dt-bindings: display: Document DPI color codings
MIME-Version: 1.0

On Wed, Mar 05, 2025 at 08:51:35AM +0100, Krzysztof Kozlowski wrote:
> On Tue, Mar 04, 2025 at 11:33:44AM +0100, Maxime Ripard wrote:
> > > +properties:
> > > +  dpi-color-coding:
> > > +    enum:
> > > +      - 16bit-configuration1
> > > +      - 16bit-configuration2
> > > +      - 16bit-configuration3
> > > +      - 18bit-configuration1
> > > +      - 18bit-configuration2
> > > +      - 24bit
> >=20
> > Do we really needs strings there? It would be much better to use an int
> > plus a header
>=20
> So DTS would sill have a name, just being a define? Then what is the
> benefit comparing to strings above in DTS readability?

There's no benefits and no downside when it comes to readability.

However, it's not the only criteria, and not having to manipulate
strings but instead just doing int comparison is a huge plus.

Maxime

--5qv5lchsz5iuy4wj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ8gKqAAKCRAnX84Zoj2+
dmR6AX9CqkD6CQeYuRvWlWgsp7zA1WNfpdOgY78fwFZQvBxUy7DgUkaNJkl7kDij
znChBsYBgOdchqndi69u/xUJVL4Z4hKuZewp7WoAxHunfX0JNjLh2SEustfv649+
zXvzjFWpBQ==
=vkHY
-----END PGP SIGNATURE-----

--5qv5lchsz5iuy4wj--
