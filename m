Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 129B26903B2
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 10:30:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A04CB10E97B;
	Thu,  9 Feb 2023 09:30:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28ECB10E97B
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 09:30:23 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 36A0A5C01D1;
 Thu,  9 Feb 2023 04:30:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 09 Feb 2023 04:30:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1675935023; x=1676021423; bh=7GMDemmSsg
 3z6NUttiJEjbZ0QVlQVFUB9m3Ja30FNVg=; b=Xz/6As1wZxj7mWSjdmifRWq8rA
 D/Jlxf0umssOgqJcl3TCGXe0DUqG+Zlr9p69c6a+gtZ2l5AfG2FHne+e1/opWHAA
 Y1rL3ynpkxxo4WeNsnhLnQ8joi4LrCap+luDTt4RmCsGam1suf6279MMjEi2rHf6
 G8dp7XI3+YiOtDYf3wqSJMcEZ/AE+TWEjDEaTgtXfbC/pytQgkpS+wDABh3TQL6L
 FHfySoRHomNSKYWtBjnirgrhkLq0GacP5G4bCRvT32TsUSHjwOHoozDkOh5RyL+2
 4qy3vf4B89w4Katq//Afl8LDtGtsNwUlMloI3K3EXoB2flyPfjAAycI8WofA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1675935023; x=1676021423; bh=7GMDemmSsg3z6NUttiJEjbZ0QVlQ
 VFUB9m3Ja30FNVg=; b=g+vkFWo3+lUACJHmkaBhEupzLCzFUStrD6SWEpa52sYM
 G28Usd1L3ihJNIVWN94BfX/qBOWx5KSDH0Ksbpwe8O7W182gcCvHLFV9OvnS4yMa
 Z2aFkijayJeA7wyPVmUHacGzu/qSvCEr7JXtJqZk+V1AUhHLdHfRu/RJewbIs7ND
 2haf59AjvZHFN0MM1hHcrSH97whT8zGO6EoneJ2i8mRNZLaKImMThtfHbBnT+OIa
 goFI8m7dppsSrsAMEU0YD4xhnC9b/tWEC7TmZRMaHtj3iGO3zeCv2mgAjcsDJX9V
 oX5+rwNAkWsa4PEhOnH46HktVJTcfqHjrq5nuI70Rw==
X-ME-Sender: <xms:Lr3kYyOxl52GWF5oAGuTuC_DUaKCTN_UbTz9MO8LlRohJGYI0sWApg>
 <xme:Lr3kYw_69VBmeY0Gnyb-u5Wg_F4Clgnbe9lNYF-yq6D8R3E1XlQm1Oc_82Pexpdwr
 5GI9lmXEtnb3_mJvgI>
X-ME-Received: <xmr:Lr3kY5RKmfbNeDR4GB9pRVrSJce1Ylvbh9QlP20dn4-6mjQ_opuk1bC9gQILO2DDgS111w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehfedgtdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:L73kYyslmRVlfrdoqE0R2_WdkC1DoogLuC22uqjfuQxBxkHF9kvnHQ>
 <xmx:L73kY6c5gZMQaxizhoLd6oSe67sYKPmlqukuT3Ge7jVGjrE0_o2wSQ>
 <xmx:L73kY20yrGA2Nabhl1WbNObN2SvGjVsPwRki-SJr3DMpv4Ji-QfLkg>
 <xmx:L73kYySlL0J9KgOhD6xCe-hugoR0vB9y7XaJ6jnl7LblzPDiyEYMJA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Feb 2023 04:30:22 -0500 (EST)
Date: Thu, 9 Feb 2023 10:30:21 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/client: Convert to VISIBLE_IF_KUNIT
Message-ID: <20230209093021.pnwu57uqq62fnkqc@houat>
References: <20230202110312.808607-1-maxime@cerno.tech>
 <9eaa27aa-85e4-aee2-22ba-1c49465ecbc6@suse.de>
 <20230202123555.r2qvjjhtqwx7e2zo@houat>
 <ec8c04f7-963a-6e70-fe5b-0fd032bb1455@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oni6ssrfhqq3o4y3"
Content-Disposition: inline
In-Reply-To: <ec8c04f7-963a-6e70-fe5b-0fd032bb1455@suse.de>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--oni6ssrfhqq3o4y3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 02, 2023 at 02:05:14PM +0100, Thomas Zimmermann wrote:
> Hi
>=20
> Am 02.02.23 um 13:35 schrieb Maxime Ripard:
> > Hi,
> >=20
> > On Thu, Feb 02, 2023 at 01:22:01PM +0100, Thomas Zimmermann wrote:
> > > Am 02.02.23 um 12:03 schrieb Maxime Ripard:
> > > > Commit 8fc0380f6ba7 ("drm/client: Add some tests for
> > > > drm_connector_pick_cmdline_mode()") was meant to introduce unit tes=
ts
> > > > for the static drm_connector_pick_cmdline_mode() function.
> > > >=20
> > > > In such a case, the kunit documentation recommended to import the t=
ests
> > > > source file directly from the source file with the static function =
to
> > > > test.
> > > >=20
> > > > While it was working, it's generally frowned upon. Fortunately, com=
mit
> > > > 9c988fae6f6a ("kunit: add macro to allow conditionally exposing sta=
tic
> > > > symbols to tests") introduced macros to easily deal with that case.=
 We
> > > > can thus remove our include and use those macros instead.
> > >=20
> > > I like that this include statements is going away.
> >=20
> > Yeah, when I saw that it was now available, I remembered you really
> > didn't like it :)
> >=20
> > > But changing symbol visibility for tests is likewise awkward.
> > >=20
> > > Maybe i'm askin gtoo miuch for this simple patch, but can't we have a=
 helper
> > > macro that generates an exported wrapper for Kunit tests? Something l=
ike
> > > this:
> > >=20
> > > EXPORT_KUNIT_WRAPPER(struct drm_display_mode *\
> > > 			drm_connector_pick_cmdline_mode,
> > > 			struct drm_connector *connector);
> > >=20
> > > which then generates something like this:
> > >=20
> > > struct drm_display_mode * drm_connector_pick_cmdline_mode_kunit(
> > > 	struct drm_connector *connector)
> > > {
> > > 	return drm_connector_pick_cmdline_mode(connector);
> > > }
> > >=20
> > > I know that the macro for generating this code is more complex than
> > > illustrated here. But this solution separates Kunit and functions cle=
anly.
> > > The static functions that are exported for Kunit testing still need t=
o be
> > > declared in a header file. That could also be done via such a macro.
> >=20
> > I mean, I guess we could do that, but what's the point? I don't really
> > get what that wrapper brings to the table.
>=20
> The big benefit of the kunit wrapper is that we don't change the visibili=
ty
> or implementation of the tested code. The currently existing macros invite
> linker errors because symbol visibility now depends on whether Kunit it
> enabled.

Sure, it can happen, but saying that it encourages them is a stretch.
And fortunately, we have build bots to detect that.

The huge downside of the wrapper approach is that you're no longer
testing the function you want to test but something else, and you have
to trust that it's exactly the same thing.

And it's far from obvious that we're supposed to do that in the first
place, especially when everyone else is doing something else, and we're
doing it ourselves in a similar situation.

It's still fairly new in kunit, but if it was indeed creating any kind
of friction, I think EXPORT_SYMBOL_FOR_TESTS_ONLY would have been
reworked some time in the last 4 years.

> It's also not clear to me how Kunit knows the symbol. Is there a
> function declaration in the Kunit test's source code? If so, it might
> diverge from the implementation; with consequences.

apparmor has been using an internal header included in both the test
file and the implementation. That way, the compiler will make sure
there's no inconsistencies.

Maxime

--oni6ssrfhqq3o4y3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY+S9LQAKCRDj7w1vZxhR
xXe7AQDrNukv6ZGvdXgpPgfZRtiCZENXgurLi4veDVYuPAz0KgEA2CErm6X3VyHv
s7dud8ZsS02lnbHhvLf724LbAKyJNQY=
=bPto
-----END PGP SIGNATURE-----

--oni6ssrfhqq3o4y3--
