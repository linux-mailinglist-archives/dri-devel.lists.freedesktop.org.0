Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E90E216A69
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 20:41:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49ECC6E821;
	Tue,  7 May 2019 18:40:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 515 seconds by postgrey-1.36 at gabe;
 Tue, 07 May 2019 18:40:56 UTC
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E9B6E821
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 18:40:56 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id C820C2223B;
 Tue,  7 May 2019 14:32:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 07 May 2019 14:32:20 -0400
X-ME-Sender: <xms:M8_RXGVpWOxjzPhwUFMnXsvaJ-Mb_cDKiDBskqqNuJM75pyc-aY4ig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrkedtgddufeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurheptggguggjfhfuhffvkfgfffesghdtreertderjeenucfhrhhomhepffihlhgr
 nhcuuegrkhgvrhcuoeguhihlrghnsehpnhifsggrkhgvrhhsrdgtohhmqeenucfkphepud
 efgedrudefgedrudefledrkeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpeguhihlrghn
 sehpnhifsggrkhgvrhhsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:M8_RXLlj6CY7zM84fCEoOOU7gNejfbKVTKYzbPjThgAKRX10dd8k0A>
 <xmx:M8_RXEG_822RkF7QXGPc9rdhycwtExaXRkXj-8sDsMtqxm4KxUbrkg>
 <xmx:M8_RXEQk1aD5VqwLizIxkvT2wgvcgV-0FgEf0pCXKd5H6xttKI7NuA>
 <xmx:NM_RXHqHORIX2OkdzjZmiG4mLfuzsY86mAd4P7JfgFWHLvVPr45mtg>
Received: from localhost (unknown [134.134.139.83])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6A4EDE4625;
 Tue,  7 May 2019 14:32:19 -0400 (EDT)
MIME-Version: 1.0
In-Reply-To: <CACvgo50x7jbnQU_AvNw_ASa3f_=oy+LDWTNbchCEx97Ncamcbw@mail.gmail.com>
References: <20190502180346.4769-1-john.stultz@linaro.org>
 <CAOvepGk_0UTnXztVgXh6qYGBF_3aQFBqs4HUpwhmfMV0G8TMNQ@mail.gmail.com>
 <CALAqxLXQV4jJpcV5VgECXQR5rw288v7LvBjEvzKm5eJb7oqPjA@mail.gmail.com>
 <CALQgHdmcPgGrW+0TfH6V3UGPwkf5i6SBsDPbag-4zNpvxJ+qAg@mail.gmail.com>
 <CAJs_Fx6ZjeVKL2pSs7TKO3DAxg0-O7KPzwc_y6jk-rm6A9CgGg@mail.gmail.com>
 <CACvgo50x7jbnQU_AvNw_ASa3f_=oy+LDWTNbchCEx97Ncamcbw@mail.gmail.com>
Subject: Re: [RFC][PATCH 0/3] mesa: Initial build fixups for AOSP/master
From: Dylan Baker <dylan@pnwbakers.com>
To: Emil Velikov <emil.l.velikov@gmail.com>, Rob Clark <robdclark@chromium.org>
Message-ID: <155725393752.4885.8369239915194856200@anlee.localdomain>
User-Agent: alot/0.8
Date: Tue, 07 May 2019 11:32:17 -0700
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pnwbakers.com; 
 h=content-type:mime-version:in-reply-to:references:subject:from
 :cc:to:message-id:date; s=fm1; bh=59cDnYNVnPy9DxSWI7S5HfFMIzOUaD
 kOdXpLysoFsvw=; b=BJzD4BLcBcvSYyq+YDLr6SVhB+SMfC+WXercyya/FMA8PH
 we0kzMQDJiPUNozdMKXzLKIZWi3HunkEJREqeUlrlUXO7BU8hXTalmRjSxPPmSNu
 j4uryv2UOzHlNHr7NMXZgdCnzy2CI8brBWW7nJqgDIR0NL+BNBatWevctH/4SbmT
 5OZDOUbMRnJj624NRyWFSsrQfQdR6SF59DWrz2PS+lk33vXe+d5lD8UD5ttowGap
 KpX3ar6jilbG/s6T8htM0CTV+yzhrbcH9WL/6YGTyDRHidqZPssuQwbAp1xgpsol
 AAv49mCdy+qKTu9ERW9TzctxZ1Xf3NVzMkBJlz7Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=59cDnY
 NVnPy9DxSWI7S5HfFMIzOUaDkOdXpLysoFsvw=; b=2PNvg2DX18eceDBmQ/8U/y
 X4XGDG9CtJArWFkWgfxwz3uffk5R++k+upbEJYmV12CGNUyQSDtXkQZJRZUO5tY+
 MD+xg05DzpfuANw+0IxDsFCYuhyNE3oTEWZXqw7cIyWEtwPmM9WrWP5GNkXWu8Iu
 zfedMf90JowWpyaYhLpD2GPr59rsvjeG9TQDRqMOhedGRLrvwZ6iP2Zc3OD/qVSC
 73Z3WsSC39/PfiYRM8WQiYl0hlEdEvU0Ysoyw5v9KDIIoBtTU1ldSssj07Jybteo
 26GzngU4lWTKtxlJebdHx0xhTykfpWNPIlZFF46W7+NX4izsW9lG972mQ/NIvWbA
 ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Amit Pundir <amit.pundir@linaro.org>, Greg Hartman <ghartman@google.com>,
 Alistair Strachan <astrachan@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dan Willemsen <dwillemsen@google.com>, Jason Ekstrand <jason@jlekstrand.net>
Content-Type: multipart/mixed; boundary="===============1820651092=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1820651092==
Content-Type: multipart/signed; micalg="pgp-sha512"; protocol="application/pgp-signature"; boundary="===============6701619805145195680=="
Content-Disposition: inline

--===============6701619805145195680==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Quoting Emil Velikov (2019-05-03 03:41:42)
> On Thu, 2 May 2019 at 23:19, Rob Clark <robdclark@chromium.org> wrote:
> >
> > On Thu, May 2, 2019 at 2:57 PM Dan Willemsen <dwillemsen@google.com> wr=
ote:
> > >
> > > On Thu, May 2, 2019 at 1:52 PM John Stultz <john.stultz@linaro.org> w=
rote:
> > > >
> > > > We need solutions for the xgettext and the python-mako usage.
> > >
> > >  Android doesn't support translations at this level, so you may be
> > > able to just skip xgettext altogether.
> > >
> >
> > from quick look, gettext is just needed for docs build (which I guess
> > android doesn't do) and driconf (not supported on android afaiu,
> > although it could be nice if there was a way to support something like
> > driconf on android, but I guess a different topic[1]).. so yeah,
> > probably not needed
> >
> Pretty much what I've mentioned last time John brought the gettext
> patches - simply disable/drop the thing for Android.
>=20
> One of these days we should even look closely at these "wanna-be
> translations, yet 90% not translated" and drop all together?
>=20
> -Emil

Eric Engrstrom and I talked about this some time ago, the translations are =
very
incomplete and out of date at this point. Unless someone wants to step up a=
nd
maintain them I'd be in favor of dropping them all together.

Dylan

--===============6701619805145195680==
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Description: signature
Content-Type: application/pgp-signature; name="signature.asc"; charset="us-ascii"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRxxLdWILx1cItL2yVMlfqrPrBz7AUCXNHPMQAKCRBMlfqrPrBz
7CPhAQDyNheC+72taLkoCrRv3R9TNzaGPlLCtE3pHaHgp3SQ1AEA4g9brn22N/vl
24oWvVwY4LeKa/jStXGqtfyt6vrwrAo=
=2Nl6
-----END PGP SIGNATURE-----

--===============6701619805145195680==--

--===============1820651092==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1820651092==--
