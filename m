Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFD7431249
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 10:41:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 231116E991;
	Mon, 18 Oct 2021 08:41:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9542A6E991;
 Mon, 18 Oct 2021 08:41:51 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id F28233200E8E;
 Mon, 18 Oct 2021 04:41:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 18 Oct 2021 04:41:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=NuxYKvOyWduzc0gjAk/aabJvFPe
 VUu1WatQDsIsbc50=; b=lwplPaXANULAyw028wF0+LUHtuGataWUdFM/ySv5Inz
 MaMrMhuaog5TMwwR8LCK0AuJ3azF2VXAEsBtm6rdAAJWAwQiysqD5wIYFeMd13pO
 cRd4mD/txFmQaa2IXzNRGAJ8vYMCSewZlrpdSamzw03W6mSugoRqcgt+XrRDDtWU
 vbz6dz+yu3N9ecJkcvXFoWUe6jgGRrS+yTAxzR+A8oXUDz/oPJx7VroVGh9APfvg
 SR+hSFcdOdGLiOYUg21RxWhetWU7oGk2rL5yNvLCAoAfKtGOE9vIZnsu5VT7WOUK
 hqN8JihyvQyDzpL5kdkNIDy2cCx3GIBJR97zZpBg6eQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=NuxYKv
 OyWduzc0gjAk/aabJvFPeVUu1WatQDsIsbc50=; b=cBHqFm04ov+OhlNzvhOOKK
 3vHqyZDnDuuThaYp91mlH+AIWp0iR7MaJbP5NtxlBIDob1kfyt48ASLEW0ij85ko
 9NcXtg6pxmMdTdfc04F9ah1Ry95HEDsvnMWVRyjel9CV1jQuOKtrQqA7fcGkLh2B
 Im398OaEjPr6fpb+uF2jlBBIWZ/z2jIlvPv18zwfoLX2WTaeHK3sZ62XqRTpBffd
 ehoeK6+oeg+94bOEhp/f1tD+1FYSk5FwpEA58bxgQdpk9a0sGes1Pwa/RI0YSpHk
 TAsoFIlta6blsEka8P8VWLGVIgRzaYRFy8CQ6nuCaEOo/euXzs5qOGZq8U9oGm2w
 ==
X-ME-Sender: <xms:TTNtYZSLQ0JjpXwSQVv_TWEBAc-Zw_A_SbeBY5WE7_c1Ha3EiW0SVQ>
 <xme:TTNtYSyCjzJW31jxgwtAQDj-Pl45CiOWDej91vqwDkRI8NOQ0gD9Z6n4Iaoteq2hb
 iVkCpoEUWFchMohi6c>
X-ME-Received: <xmr:TTNtYe1M_pWNLwvbVbRM8wz_YjOhsTcRFnGFmI2edmaR3sXkFUC_ljiKQM1zOZ6YrxpU4JUY7RuDGqENIpXldyGna5dFYIRwNXgXRoCM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvtddgtdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
 gfevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:TTNtYRAbwwsi78ovZ6W3FblO0okl_P1RwNekaLdqz_CqCbedZirxQQ>
 <xmx:TTNtYSiqZltLGGg7D-VSMJHAyX6fJMolO-Rfa_lqxxmdHpBcwm0KJw>
 <xmx:TTNtYVr_XDU-13VXwLvVsj193GnLQknVQHWec0e0hIccRCLlGpE6yw>
 <xmx:TjNtYae4B9j2JAG2sE-HLDZIYMNmT5PZjSsYgH8DLZGHDLtDBcqlIw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 Oct 2021 04:41:49 -0400 (EDT)
Date: Mon, 18 Oct 2021 10:41:47 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com
Subject: Re: [PATCH 1/3] drm/dp: add helpers to read link training delays
Message-ID: <20211018084147.iuexgyykyrrx2ykw@gilmour>
References: <20211014150059.28957-1-jani.nikula@intel.com>
 <871r4muxds.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mucs4vrm2uxzg2uc"
Content-Disposition: inline
In-Reply-To: <871r4muxds.fsf@intel.com>
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


--mucs4vrm2uxzg2uc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jani,

On Fri, Oct 15, 2021 at 06:21:35PM +0300, Jani Nikula wrote:
> On Thu, 14 Oct 2021, Jani Nikula <jani.nikula@intel.com> wrote:
> > The link training delays are different and/or available in different
> > DPCD offsets depending on:
> >
> > - Clock recovery vs. channel equalization
> > - DPRX vs. LTTPR
> > - 128b/132b vs. 8b/10b
> > - DPCD 1.4+ vs. earlier
> >
> > Add helpers to get the correct delays in us, reading DPCD if
> > necessary. This is more straightforward than trying to retrofit the
> > existing helpers to take 128b/132b into account.
> >
> > Having to pass in the DPCD receiver cap field seems unavoidable, because
> > reading it involves checking the revision and reading extended receiver
> > cap. So unfortunately the interface is mixed cached and read as needed.
> >
> > v2: Remove delay_us < 0 check and the whole local var (Ville)
> >
> > Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>=20
> Maarten, Maxime, Thomas -
>=20
> Ack on the first two patches in this series?
>=20
> Should we merge them via a topic branch to both drm-misc-next and
> drm-intel-next, or is it fine to merge them all via drm-intel-next? We
> might be at a point in the development cycle that it takes a while to
> get the branches in sync again.

I guess the easiest would be to send a PR so that we can merge it in the
two branches then.

Maxime

--mucs4vrm2uxzg2uc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYW0zSwAKCRDj7w1vZxhR
xfC8AQCCLDrkZi9cHM+CqFCgQN7LbdiaolKM2bJXXMJVyjaUIQEA2aPR8E0Rq6ml
LTma9nItvfaF+3kfqd2dcQubi456JAQ=
=hxmm
-----END PGP SIGNATURE-----

--mucs4vrm2uxzg2uc--
