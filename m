Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B41739E017
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 17:17:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C9766E8F1;
	Mon,  7 Jun 2021 15:17:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15DE16E8F1
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 15:17:48 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 83946580717;
 Mon,  7 Jun 2021 11:17:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 07 Jun 2021 11:17:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=3+Ytd2j/Je+mm4cK0lXUfRdrWys
 FY2W0dEzHPKfD6EQ=; b=dzi73O82uOE/W0XEXQk+M0XBK0QyWqybgV/CaDJgd6F
 66WLaUyp1SWcEgSY6FvaF/II9lohHwzFHfgIf99ec1tGAwR+fWAyviWGwjx89NSp
 NFlWlCGDy3EEoOIQEDoHTmRsiijoAHzUVB4X/9j+QkdhE6m1K8MTg/jhMNlI9QXr
 EsCY24vM0pN0Ly880TLf2jcYupGsjDD9rZDp/OREzIvpvwNzqzljwo65KhRUZOJE
 usfT4wdiHOxbl7+5IFZ2djniKEVRu5w1hFbpdNOTvpJMQcrYybFidN8HMDIYJH5O
 dbMDnR976++ibiu9iXNlgfu3uswZEDJRET8nlaMorLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=3+Ytd2
 j/Je+mm4cK0lXUfRdrWysFY2W0dEzHPKfD6EQ=; b=I0mt0/ntq78E7nblsrQRvi
 oQTzWBAyJB2WRxzbJO73XSxQk8bxYd3g2AoIineV+jBZxlRqr8uBsVkbRCIpPr0D
 lWISsarfJi9oZvpGYzoVeSHGV697QtBNS4+yxQPb5xDJNONagsPMJxvsXbEgUbYa
 ftTrqxAucRXeYfvv65+xuSafK79U8ktD/JwGEdNIqAvE1ofzcdrq0ZWqDqznq/8s
 wxFNq6bCj4NrRnhIyGKvvYzWTCmOLkH9QXGCGDyACjBDOC781HafCHwU+T3D+bHM
 X0BVZQlO3jBd/UBp/kf8IAy81ELXJH53TLufOCQn+3RGPZHP87vDPu84w9hp8oCA
 ==
X-ME-Sender: <xms:lzi-YPj61jXEzVfSGyO6IqTbJLA4vhPVYyea8nTqmVFr2PWSZzNBMQ>
 <xme:lzi-YMDHmcZWaaNqg_o3XQ9Afa_SvAfwGz_Vc8gm3qiR6BhGyW0o3UaDLhHewkKqT
 DsPcHmI3Y0dDMPdSpc>
X-ME-Received: <xmr:lzi-YPHkUFUR52TGk5_rQLPx9Hdqv70G3vduYk_GLs3aM5O4o4Wcr20KSgJJkbr78zxdg8O9UfkruP9moES0MjWnNiUsa7FmZ3eE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtjedgkeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:lzi-YMRsMVJfyIZigmiGz4lMaUo24GQXOlUz5eV-WqvCuj6Ltd832w>
 <xmx:lzi-YMwrt986aJzQG0XIZP5U2H4NhlfUlax9nZ_iV76aOfVHyg9MOg>
 <xmx:lzi-YC6KTZupYNczqk94FMBMyWld-jxOBPCxd3UFxAmY7KY9bCBDZw>
 <xmx:mji-YBpJsCRowsowFsWLLCfIPOyCYz3db0ntdcyiHFDt6d3nwzhS2w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Jun 2021 11:17:43 -0400 (EDT)
Date: Mon, 7 Jun 2021 17:17:40 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] arm64: cache: Lower ARCH_DMA_MINALIGN to 64
 (L1_CACHE_BYTES)
Message-ID: <20210607151740.moncryl5zv3ahq4s@gilmour>
References: <CGME20210602132541eucas1p17127696041c26c00d1d2f50bef9cfaf0@eucas1p1.samsung.com>
 <4d0c8318-bad8-2be7-e292-fc8f70c198de@samsung.com>
 <20210602135123.GD12753@C02TD0UTHF1T.local>
 <130ce34f-460a-0046-f722-00144f2d5502@samsung.com>
 <20210604100114.GC64162@C02TD0UTHF1T.local>
 <0d10411d-49fe-fbca-0479-e2983af16aa8@samsung.com>
 <20210607120118.GC97489@C02TD0UTHF1T.local>
 <20210607130859.GD97489@C02TD0UTHF1T.local>
 <20210607133953.GB7330@willie-the-truck>
 <CAK8P3a0sj0qtC0VpQv4+Ah-C8jyZaGgfqsx326mChuW+e5mvrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tu5rdijrpja4fgx7"
Content-Disposition: inline
In-Reply-To: <CAK8P3a0sj0qtC0VpQv4+Ah-C8jyZaGgfqsx326mChuW+e5mvrQ@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, emma@anholt.net,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Will Deacon <will@kernel.org>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Catalin Marinas <catalin.marinas@arm.com>, kernel-team@android.com,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--tu5rdijrpja4fgx7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 07, 2021 at 03:57:41PM +0200, Arnd Bergmann wrote:
> On Mon, Jun 7, 2021 at 3:39 PM Will Deacon <will@kernel.org> wrote:
> >
> > [Adding VC4 folks -- please see the KASAN splat below!]
> >
> > Background here is that reducing ARCH_DMA_MINALIGN to 64 on arm64 (queu=
ed in
> > -next) is causing vc4 to hang on Rpi3b due to a probable driver bug.
>=20
> The great news for the patch that caused it is that this has nothing to
> do with DMA alignment.
>=20
> > On Mon, Jun 07, 2021 at 02:08:59PM +0100, Mark Rutland wrote:
> > > On Mon, Jun 07, 2021 at 01:01:18PM +0100, Mark Rutland wrote:
> > > > On Mon, Jun 07, 2021 at 11:58:32AM +0200, Marek Szyprowski wrote:
>=20
> > > [    3.728042] BUG: KASAN: slab-out-of-bounds in vc4_atomic_commit_ta=
il+0x1cc/0x910
> > > [    3.728123] Read of size 8 at addr ffff000007360440 by task kworke=
r/u8:0/7
>=20
> This is offset 0x40 into struct vc4_hvs_state, which is the
> 'pending_commit' pointer
> for the array index 4, i.e. one after the end of the structure.
>=20
> > > [    3.728495]  kasan_report+0x1dc/0x240
> > > [    3.728529]  __asan_load8+0x98/0xd4
> > > [    3.728565]  vc4_atomic_commit_tail+0x1cc/0x910
>=20
> It seems to be this loop:
>=20
>         for_each_old_crtc_in_state(state, crtc, old_crtc_state, i) {
>                 struct vc4_crtc_state *vc4_crtc_state =3D
>                         to_vc4_crtc_state(old_crtc_state);
>                 unsigned int channel =3D vc4_crtc_state->assigned_channel;
>                 int ret;
>=20
>                 if (channel =3D=3D VC4_HVS_CHANNEL_DISABLED)
>                         continue;
>=20
>                 if (!old_hvs_state->fifo_state[channel].in_use)
>                         continue;
>=20
>                 ret =3D
> drm_crtc_commit_wait(old_hvs_state->fifo_state[i].pending_commit);
>                 if (ret)
>                         drm_err(dev, "Timed out waiting for commit\n");
>         }
>=20
> I notice that it checks index 'fifos_state[channel].in_use', but then
> uses a different index 'i' for looking at the 'pending_commit' field
> beyond the end of the array.
>=20
> This code was introduced by Maxime Ripard in commit 9ec03d7f1ed3
>  ("drm/vc4: kms: Wait on previous FIFO users before a commit").

Awesome, I tried to find out that bug a few weeks ago but couldn't
reproduce the KASAN spat. You're right, it should be channel here
instead of i. Since you did the whole work, do you want to send the
patch?

maxime

--tu5rdijrpja4fgx7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYL44lAAKCRDj7w1vZxhR
xYTnAQC+O2TXSIpP+CfIi/ZKSNaVHwoQyB8g+t22EGIjOarX2AD4uXPEkFyW+EkM
AfZOLs6fvWKl2I7vWL4S7qVSgiCrCg==
=SAcg
-----END PGP SIGNATURE-----

--tu5rdijrpja4fgx7--
