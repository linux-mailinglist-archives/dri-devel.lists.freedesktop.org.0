Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8F1A4463B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 17:37:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB2D10E174;
	Tue, 25 Feb 2025 16:37:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QqEP1QVh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC3A10E174
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 16:37:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0B4925C710A;
 Tue, 25 Feb 2025 16:36:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49C83C4CEE6;
 Tue, 25 Feb 2025 16:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740501431;
 bh=LlMj69HNK8Gixe/zQvhWq1RH82NksrA/DDwQ2DhgQPw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QqEP1QVhO4wBCcnQdcXCBiitu7Bqzze59GZ0kFBX46FD3ABL67NzfKjzzxfn3hO7w
 aMI/cEwS+i9Y0KFsDfZyTLvNbdMqgPnQmwBBHhSS8Xf0fSSBp+pB5E2XDpgL81gDZy
 WhkM1Pf+Qf9bG9m58tRrLGFiKqvsaeKwg9nfpBNEap7REsy2LlzIA6kkQkdWv8p38i
 uXJqMD0BReWpsdTqbVHjOMxA/Md45OtD2PsYGl+UbKR9eMzhuJ4NHylDL8BcAwdqM0
 xn2zI5XWw+MrzUSZ9j4MBiyZl7bz5kJjfRgSg9tKGw3Pc8swpa6YCVVdWkXH6RhWBR
 0ltscaYZPqZDA==
Date: Tue, 25 Feb 2025 17:37:08 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 32/37] drm/bridge: Make encoder pointer deprecated
Message-ID: <20250225-bouncy-crystal-hog-cc54b7@houat>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-32-e71598f49c8f@kernel.org>
 <nfb4fb6lzjw4j5brsh242htgw3au2moklqjalfa3zzxjsi2qn5@l3censelmgbz>
 <20250214-arrogant-strong-hoatzin-efdcd8@houat>
 <yy37e4kne7i2hl7coix6v7vajb5bm4zohod4fdzayvxr52l57u@cxturs2uxgcm>
 <Z7Nl8JiFncngynNy@phenom.ffwll.local>
 <dksptjtgipcuuivp3tud5lhghoiqrak5t33m5pz4jtssegz75t@fanvtjdmy2pp>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="gwfphj56dgq3mxbs"
Content-Disposition: inline
In-Reply-To: <dksptjtgipcuuivp3tud5lhghoiqrak5t33m5pz4jtssegz75t@fanvtjdmy2pp>
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


--gwfphj56dgq3mxbs
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 32/37] drm/bridge: Make encoder pointer deprecated
MIME-Version: 1.0

On Mon, Feb 17, 2025 at 09:47:51PM +0200, Dmitry Baryshkov wrote:
> On Mon, Feb 17, 2025 at 05:38:08PM +0100, Simona Vetter wrote:
> > On Fri, Feb 14, 2025 at 03:29:12PM +0200, Dmitry Baryshkov wrote:
> > > On Fri, Feb 14, 2025 at 02:07:18PM +0100, Maxime Ripard wrote:
> > > > On Thu, Feb 13, 2025 at 06:35:15PM +0200, Dmitry Baryshkov wrote:
> > > > > On Thu, Feb 13, 2025 at 03:43:51PM +0100, Maxime Ripard wrote:
> > > > > > Other entities (drm_connector.crtc, drm_encoder.crtc, etc.) have
> > > > > > pointer to other currently bound entities. They are all conside=
red
> > > > > > relevant only for non-atomic drivers, and generally perceived as
> > > > > > deprecated in favour of the equivalent pointers in the atomic s=
tates.
> > > > >=20
> > > > > I think there is a significant difference between mentioned field=
s and
> > > > > drm_bridge.encoder: the former fields are variable and can change=
=2E The
> > > > > latter one is static and set at the bridge attachment time. Never=
theless
> > > > > I think it is a good idea to deprecate it.
> > > >=20
> > > > I'm sorry, it's not clear to me here what you want here either. Do =
you
> > > > want me to change anything to that patch?
> > >=20
> > > Well... I was thinking if we should expand the commit message. Most
> > > likely it's fine though. In the end, I've r-b'ed the patch.
> >=20
> > I think this one is wrong, since the bridge->encoder link is static. Th=
is
> > is unlike the connector->encoder->crtc chain, which isn't, and where you
> > really want to go through the atomic states or you get funny stuff.
> >=20
> > I don't think we have bridge chains with multiple connectors though, so
> > this is fairly academic and so maybe still a good idea to make this all
> > more flexible? Unless I've missed the memo and atomic bridges have
> > flexible routing, and in that case yes this shouldn't be used.
>=20
> No, bridges are still attached to a single encoder, however I see
> Maxime's idea in uniformity. It's easier to remember that all direct
> pointers are deprecated rather than remembering that bridge->encoder is
> static, but everything else is dynamic and should be accessed through
> the state.

Yeah, I still find it a bit inconsistent, but the new approach Sima
suggested on IRC the other day increases its usage, so it's even more
weird to both deprecate and use it more heavily in this series :)

I've dropped that patch

Maxime

--gwfphj56dgq3mxbs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ73xtAAKCRAnX84Zoj2+
dsTiAX9tlOhJAfJwcthfsy0ox5+Qql2zlqH8f8uMPadGUYT+BenUbzn2YQDMDYq6
9jxN9y0BgJfZJDcC7TRkDF1eepaiOs3SC/Jml4MR+7QQAg/OTJ8o8JYD/Ns1ZNoQ
xQj/VtzUbQ==
=Gjgw
-----END PGP SIGNATURE-----

--gwfphj56dgq3mxbs--
