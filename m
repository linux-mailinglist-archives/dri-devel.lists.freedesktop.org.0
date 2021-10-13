Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D532E42C453
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 17:01:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874DC6E866;
	Wed, 13 Oct 2021 15:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11F7C6E866
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 15:01:07 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 70D2F5C0098;
 Wed, 13 Oct 2021 11:01:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 13 Oct 2021 11:01:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=JT3rF9I4EV/hP/NrO3DfS+hQTjz
 QdnfHkTyQokP/KfM=; b=BKE9wmc5whTAODhKWdKIpLLqsi8Ku654esYrrhhAuxe
 PXk4OIpRXE00kSt0aBbosoxnKo1qL6emQ7WafyOqHrUHD3YMDoR3FUpiYBKhujaB
 PeW9PluLZte5NFyh0/iOkATe2UIlZIC42GFU2wH6B7MsfF10d+ptHJFt9I6Mi1mc
 rNu6zPP1Xnv5Tg0pQRfpFUElrshzyJk2RGVd9zvXO72CF56j41gcdhAPBJpTEOJQ
 JK2EMhlxbv/lzf1uzNbA0j8PHR2qrECWBMdWD/Bzi7utbTgSy6Bwodv96wz0tBTP
 vGCXHZSEonY7n8ByWlPKP+lo0GcXhYOsc5IIihqikvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=JT3rF9
 I4EV/hP/NrO3DfS+hQTjzQdnfHkTyQokP/KfM=; b=BiguNnSr5azHDSd6uETkks
 xI7CmBYQzX1k5J/bo77SomyMdrPDGPayDC6YdiW6kS0saYOVh3iQnM0qar7b1CIR
 43u8UKAQxhK5cw2tGOgqcrl/pV/2Iqdkn4zrda5adKUdCMf7whNIagcKEm81uWKe
 ccf6iGK7jE26gFrXnfx4Jk7Il+LGNvD3xf/l/37aNYQr40E30Q728c5DSK1cig1F
 j9JMjD+lYLVvAUV77dgIoEwsI7V+DOy4LCymZSRfjkWr4Q2UawhkWle6A4lyQTDV
 xhK/i4MF8bk7/TSzDWNeppJT83i7kh2aq0L24YAOj1hroqX9gjXXs4RFgB9Jnaqg
 ==
X-ME-Sender: <xms:sfRmYSzRYNcXEV1iFDb8bz6XGL-QZQe5DxGkUd2OeZKbB2fs-IFG0A>
 <xme:sfRmYeSzrPQWbQBkBszrKlou7ZctwUV06QunlXQf_-CtUTLuQmp4kiJ6CJxVo8w-4
 0c0D3fO9EZOHd9yiTo>
X-ME-Received: <xmr:sfRmYUXIt9yiQv4Pr8ZN2JqcbvVo1V3egH8iOBfY2Y87n_O1UXKObcpVGqW-GTNX2xQ6qDzAeD9quiCtsCN2pHzLCviZkQUEjq6lR6U9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddutddgkeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:sfRmYYivrdLJU2l2yVMMVGzfMn9MUBV-7qEFu3tdk50dueQDuCpBYQ>
 <xmx:sfRmYUCxS70-9SFbLFORyvw18s-MpDZ3HT2CXj-xxPqqfvKDaewTcA>
 <xmx:sfRmYZKUYAKsEAV7a-dr5Je5uVTDupv8dzI49OtfF8G_n0c0Q-p43A>
 <xmx:svRmYT6KNJGPJrGm9Aes5mwgfAig4nHoNPSSyauSyv0TmY1_DkrsdA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Oct 2021 11:01:05 -0400 (EDT)
Date: Wed, 13 Oct 2021 17:01:03 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: Regression with mainline kernel on rpi4
Message-ID: <20211013150103.p3rea3ny3rjmohtd@gilmour>
References: <CADVatmOMV5gMhCuoP65O9mbW639x5=0+bGh92WVL8FFX2Mvu3w@mail.gmail.com>
 <CAHk-=wi=8Wp31FSyOH5A8KY+7f3dSuP62zUpvTtyvENm1Hh7xA@mail.gmail.com>
 <CADVatmNZB6yjS6zXqUcY4xsUTyX3pa6VysB6RmT1CGV5LXer6g@mail.gmail.com>
 <CAHk-=wh+y=C5hVhE1X=AvZz+OM5Yp8eLHYGth31pfoJVF7UKKQ@mail.gmail.com>
 <CADVatmPDeSxeY3GTZyC6+G0N76su0E6Y3LF_h6BOcBf5QAtjvg@mail.gmail.com>
 <CAHk-=whASMriPYRdH8kxC_UwObBtwHbPvf7rb58sUEZZyaFxJg@mail.gmail.com>
 <20210924133022.waqgtr5xjjxigong@gilmour>
 <CAKMK7uFxO-ss86k483VJQJiHwcAYxNwD06xSEZStn+fWiRJ6iw@mail.gmail.com>
 <20210928083446.cfji7hmndt6a5nop@gilmour>
 <YVWBP5ZJInH/wt1P@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="peyav3thoy3lt6kq"
Content-Disposition: inline
In-Reply-To: <YVWBP5ZJInH/wt1P@phenom.ffwll.local>
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


--peyav3thoy3lt6kq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 30, 2021 at 11:19:59AM +0200, Daniel Vetter wrote:
> On Tue, Sep 28, 2021 at 10:34:46AM +0200, Maxime Ripard wrote:
> > Hi Daniel,
> >=20
> > On Sat, Sep 25, 2021 at 12:50:17AM +0200, Daniel Vetter wrote:
> > > On Fri, Sep 24, 2021 at 3:30 PM Maxime Ripard <maxime@cerno.tech> wro=
te:
> > > >
> > > > On Wed, Sep 22, 2021 at 01:25:21PM -0700, Linus Torvalds wrote:
> > > > > On Wed, Sep 22, 2021 at 1:19 PM Sudip Mukherjee
> > > > > <sudipm.mukherjee@gmail.com> wrote:
> > > > > >
> > > > > > I added some debugs to print the addresses, and I am getting:
> > > > > > [   38.813809] sudip crtc 0000000000000000
> > > > > >
> > > > > > This is from struct drm_crtc *crtc =3D connector->state->crtc;
> > > > >
> > > > > Yeah, that was my personal suspicion, because while the line numb=
er
> > > > > implied "crtc->state" being NULL, the drm data structure document=
ation
> > > > > and other drivers both imply that "crtc" was the more likely one.
> > > > >
> > > > > I suspect a simple
> > > > >
> > > > >         if (!crtc)
> > > > >                 return;
> > > > >
> > > > > in vc4_hdmi_set_n_cts() is at least part of the fix for this all,=
 but
> > > > > I didn't check if there is possibly something else that needs to =
be
> > > > > done too.
> > > >
> > > > Thanks for the decode_stacktrace.sh and the follow-up
> > > >
> > > > Yeah, it looks like we have several things wrong here:
> > > >
> > > >   * we only check that connector->state is set, and not
> > > >     connector->state->crtc indeed.
> > > >
> > > >   * We also check only in startup(), so at open() and not later on =
when
> > > >     the sound streaming actually start. This has been there for a w=
hile,
> > > >     so I guess it's never really been causing a practical issue bef=
ore.
> > >=20
> > > You also have no locking
> >=20
> > Indeed. Do we just need locking to prevent a concurrent audio setup and
> > modeset, or do you have another corner case in mind?
> >=20
> > Also, generally, what locks should we make sure we have locked when
> > accessing the connector and CRTC state? drm_mode_config.connection_mutex
> > and drm_mode_config.mutex, respectively?
> >=20
> > > plus looking at ->state objects outside of atomic commit machinery
> > > makes no sense because you're not actually in sync with the hw state.
> > > Relevant bits need to be copied over at commit time, protected by some
> > > spinlock (and that spinlock also needs to be held over whatever other
> > > stuff you're setting to make sure we don't get a funny out-of-sync
> > > state anywhere).
> >=20
> > If we already have a lock protecting against having both an ASoC and KMS
> > function running, it's not clear to me what the spinlock would prevent
> > here?
>=20
> Replicating the irc chat here. With
>=20
> commit 6c5ed5ae353cdf156f9ac4db17e15db56b4de880
> Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Date:   Thu Apr 6 20:55:20 2017 +0200
>=20
>     drm/atomic: Acquire connection_mutex lock in drm_helper_probe_single_=
connector_modes, v4.
>=20
> this is already taken care of for drivers and should be all good from a
> locking pov.

So, if I understand this properly, this superseeds your comment on the
spinlock for the hw state, but not the comment that we need some locking
to synchronize between the audio and KMS path (and CEC?). Right?

Maxime

--peyav3thoy3lt6kq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYWb0rwAKCRDj7w1vZxhR
xeHSAQDU0V5TZK2D6sulS8ToJp7H7Q/vdu9etNO4fRwbMpqOYQEAqukjS+xrus3a
wg9JV8BsOTfB7osX5CRL7kqBAWu+uwQ=
=vTbV
-----END PGP SIGNATURE-----

--peyav3thoy3lt6kq--
