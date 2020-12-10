Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E8F2D5E6C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 15:48:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B6E86EA94;
	Thu, 10 Dec 2020 14:48:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB19D6E418
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 14:22:04 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 7AE1432B;
 Thu, 10 Dec 2020 09:22:03 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 10 Dec 2020 09:22:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=8I6HkdsKWLxM21wcjcBjiuNy2uS
 3GadHulgvntN0NnY=; b=K6u1plxxy5bu/KKKbvnWHVCgtFLqVpi3rG5l++aZPmS
 b4u4SEYDBApyJfnZhwXjAhue2bWVetcYoHkMuIANt/NPW0+RCrin0RQd5eh1wZDE
 BhopbbzD2ADAGbJOxkBGg3IsZwTxvRl/Yn8n7jSTHyq4ZAum8OXivCDwbEwDJ6Cc
 K7ByCjpY4bDeqoDGFdSSIWlmFgFSSQwMqVM7b6WjU5nBNdZXlDpxDgtaMGYfG9p0
 OtgJzKnDG4h0QyRXthcRYAg2sBwXUizRvARZZLOy1WQSAe17W4A12sROj9TeyqNB
 fIruD8vKLTTUpJCFxX1TFEnnsfLF3dULP8DBG0pPkWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=8I6Hkd
 sKWLxM21wcjcBjiuNy2uS3GadHulgvntN0NnY=; b=mY4liH/hGmh7Z/OtcWms5i
 ZAwZqCEQXoB0oz9rM1Jcvc/NlS6H+VNeXr4f1AXzyqmpSy7xQKSX771XmE2LsbZu
 STiFVAfPPBigM342coS/1fezDSMERrtntP0wBqA28s65JhGi8mmOUvs+1w+QHUr8
 Z0kJmsoilr39oh2HDEjBSdKt0pnvkhge/N6NI63EgkDRbteXu/4foxyIXAnOoBYV
 OuyfHDBd8Do3ZCs2LAm3wIZv4aqGWCw3uwhY4almFfgx9Y0LAQan7BUNcKU4f64P
 IbSV+ahT+oktt5qQNHNZrPtFddkS1Rhs/fqheh9NIra75uxDaK8gQWdSsgUpZlwQ
 ==
X-ME-Sender: <xms:By_SX661-7jVCygRULsjd762cmsKA-vOIsTtTMG42xeAxXEef7YxFw>
 <xme:By_SXz7LxJC70taXCfbjGyDS3V0Rg6wX15FFgFkjjH2XdlK9mure3RT_l-cqjUARB
 VdAYLTh-8CsE1JoHAo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudektddgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:By_SX5eV7Iqp6KoLuDvOeb3uT9GBttV_bV6HACrAJ9ddN7Sw8S6P1w>
 <xmx:By_SX3LHONN675Z3qvIGMMh8sqXJW2qjg05w90B0SJx7n28GuPztzQ>
 <xmx:By_SX-IbuefC3JzbRW9259JHVJibkyjaPENgpoOwCrE4ZFH_3iLuLw>
 <xmx:Cy_SX_qgD5Zjg5dDQM5Q0zkt4405oDQCmbFlVpOav7Xxlsn9_ilBXA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id E5DF91080057;
 Thu, 10 Dec 2020 09:21:58 -0500 (EST)
Date: Thu, 10 Dec 2020 15:21:57 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v5 9/9] drm/vc4: hdmi: Enable 10/12 bpc output
Message-ID: <20201210142157.2zm6rgz3a6jpeui6@gilmour>
References: <20201207155719.17149-1-maxime@cerno.tech>
 <20201207155719.17149-10-maxime@cerno.tech>
 <CAPY8ntC=7WC7kfJw2KOEBv+SwTrZxgvKbpXM5RsK4FMS03K2jQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPY8ntC=7WC7kfJw2KOEBv+SwTrZxgvKbpXM5RsK4FMS03K2jQ@mail.gmail.com>
X-Mailman-Approved-At: Thu, 10 Dec 2020 14:48:10 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============2070407158=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2070407158==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lsc7ep7b5bzkhpkc"
Content-Disposition: inline


--lsc7ep7b5bzkhpkc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Wed, Dec 09, 2020 at 03:27:05PM +0000, Dave Stevenson wrote:
> Hi Maxime
>=20
> On Mon, 7 Dec 2020 at 15:57, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > The BCM2711 supports higher bpc count than just 8, so let's support it =
in
> > our driver.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  drivers/gpu/drm/vc4/vc4_hdmi.c      | 71 ++++++++++++++++++++++++++++-
> >  drivers/gpu/drm/vc4/vc4_hdmi.h      |  1 +
> >  drivers/gpu/drm/vc4/vc4_hdmi_regs.h |  9 ++++
> >  3 files changed, 80 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_h=
dmi.c
> > index f4ff6b5db484..fb30ddd842b1 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > @@ -76,6 +76,17 @@
> >  #define VC5_HDMI_VERTB_VSPO_SHIFT              16
> >  #define VC5_HDMI_VERTB_VSPO_MASK               VC4_MASK(29, 16)
> >
> > +#define VC5_HDMI_DEEP_COLOR_CONFIG_1_INIT_PACK_PHASE_SHIFT     8
> > +#define VC5_HDMI_DEEP_COLOR_CONFIG_1_INIT_PACK_PHASE_MASK      VC4_MAS=
K(10, 8)
> > +
> > +#define VC5_HDMI_DEEP_COLOR_CONFIG_1_COLOR_DEPTH_SHIFT         0
> > +#define VC5_HDMI_DEEP_COLOR_CONFIG_1_COLOR_DEPTH_MASK          VC4_MAS=
K(3, 0)
> > +
> > +#define VC5_HDMI_GCP_CONFIG_GCP_ENABLE         BIT(31)
> > +
> > +#define VC5_HDMI_GCP_WORD_1_GCP_SUBPACKET_BYTE_1_SHIFT 8
> > +#define VC5_HDMI_GCP_WORD_1_GCP_SUBPACKET_BYTE_1_MASK  VC4_MASK(15, 8)
> > +
> >  # define VC4_HD_M_SW_RST                       BIT(2)
> >  # define VC4_HD_M_ENABLE                       BIT(0)
> >
> > @@ -179,6 +190,9 @@ static void vc4_hdmi_connector_reset(struct drm_con=
nector *connector)
> >
> >         kfree(connector->state);
> >
> > +       conn_state->base.max_bpc =3D 8;
> > +       conn_state->base.max_requested_bpc =3D 8;
> > +
>=20
> Having added protection from the kzalloc failing in 4/9, this adds
> back in dereferencing conn_state without having checked it succeeded
> first :(

Yeah, you're right :/

I also noticed that we kfree the connector->state pointer, but nothing
really guarantees that the base field in our structure is at the offset
0

I've fixed both issues, I'll send a new iteration

Thanks!
Maxime

--lsc7ep7b5bzkhpkc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX9IvBQAKCRDj7w1vZxhR
xX9mAQD5Z4WsHksJwl2RwNdp5LFa3skez0ubQjQSrNSxKGgGigEA0NRQR44tDC8S
0ilOBhd1fMFfDo1aX1mcoKw6dpTG/w0=
=RcF7
-----END PGP SIGNATURE-----

--lsc7ep7b5bzkhpkc--

--===============2070407158==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2070407158==--
