Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD332DA8F8
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 09:07:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D136E18E;
	Tue, 15 Dec 2020 08:06:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605546E28A
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 15:27:42 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 141647BD;
 Mon, 14 Dec 2020 10:27:38 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 14 Dec 2020 10:27:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=ntJmrGCcAbQquVvbRfQicceFKNU
 MSarHFqhD8v0/wxE=; b=PAELf08UrchWI/nqe6Gr4rBvBrMK9IeIszHQoK5oIEZ
 bsZaoisXh7mjmUWFznWynkUZZvvlY2lFvBWKmu787Timhbe2KuVK8rHH1SxYKf52
 XA3OBqEodCpYELSQYmFCPjqAKUBIxBOn1pJBtzQfWbWB71RGaljwZCZQ8PlgtiRZ
 zhlbvgaPtsg+5idSo3TkaeX+yF5fUW8ugFZ/Z+MD5DNRlg/fNKsGy+Cis4ODfKZz
 7lcaOpsUrw2mYHWpER90yuwi3GtUT8ZohH6ViYhjgOrSmdAj/cYCJ626IOY4vV1j
 YkaDn8fGRr8sdTd62V5BNZu4EdU71VJrL6MK1lqCngw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ntJmrG
 CcAbQquVvbRfQicceFKNUMSarHFqhD8v0/wxE=; b=d+ljFMqQxFAuI3rRYc+7nO
 Hq5jd85qB4R83rnfYOfw7VV1TgDOX3WEhSdZm8wLmuI7g+vfyU9QOHI0p2rMDgaL
 LdPhty83TxbWu44q4CzOpjNKN4lfdth379+D49/JHw0bSlqSN3JZn582Hz97KA0S
 qSnyRZqoE/gS8Quzbjcft9pmqp4TrU4yzBNxYJUQ9ivU4fq58i/j3pihEycoS317
 fiYb0aT3d8gRqJisyzkS3mGRmI6cBoirH5eCha3OWURU0WaUDm+hOHXR2CAREMPZ
 /YfNslYQH83gEXbmpzuugGKuxRS97/r3Arrq3w9c930rNQC+WoWwpEQ4DzzmAZhQ
 ==
X-ME-Sender: <xms:ZoTXX0oF7-4eVD8WVuPp5f6zuoxr4BxQGwx6fT3rhdBVUqjXiUg1Sw>
 <xme:ZoTXX6rYs847KgWSjV8miZEkU_2XN9b3a5qYs9fXn1AS48OtnYbY33cckhr1_chXT
 oKihsvPiqTUZ_fpfFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudekkedgjeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ZoTXX5NUVLegLe3lOJZzvLzo1uB0wkuxppo62sdmZPa-_RO5HGDM3w>
 <xmx:ZoTXX76AS4nA1n5XIwSz6PSdSkwaaTUqt_B0vqGwdkZmTKS_6CcFgA>
 <xmx:ZoTXXz5JPPqjPoRnCF60l9j4-OhZq8W2vyogWYqWGpKZu3Zot_s9uQ>
 <xmx:aYTXX6IxlKBR1KIubJHXRVyPbRSlP9DE0bYwvrc6ww69d-V0YLVKCuU0juA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7B74E1080064;
 Mon, 14 Dec 2020 10:27:33 -0500 (EST)
Date: Mon, 14 Dec 2020 16:27:31 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 01/15] irqchip: Allow to compile bcmstb on other platforms
Message-ID: <20201214152731.mgoo2hvlu6uoi5md@gilmour>
References: <20201210134648.272857-1-maxime@cerno.tech>
 <20201210134648.272857-2-maxime@cerno.tech>
 <e0f1aed2b0007eab6e9192ac73fd411f@kernel.org>
MIME-Version: 1.0
In-Reply-To: <e0f1aed2b0007eab6e9192ac73fd411f@kernel.org>
X-Mailman-Approved-At: Tue, 15 Dec 2020 08:06:55 +0000
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0989632653=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0989632653==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jdibhl3czonwcpge"
Content-Disposition: inline


--jdibhl3czonwcpge
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Marc,

On Thu, Dec 10, 2020 at 05:59:09PM +0000, Marc Zyngier wrote:
> On 2020-12-10 13:46, Maxime Ripard wrote:
> > The BCM2711 uses a number of instances of the bcmstb-l2 controller in
> > its
> > display engine. Let's allow the driver to be enabled through KConfig.
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  drivers/irqchip/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> > index c6098eee0c7c..f1e58de117dc 100644
> > --- a/drivers/irqchip/Kconfig
> > +++ b/drivers/irqchip/Kconfig
> > @@ -131,7 +131,7 @@ config BCM7120_L2_IRQ
> >  	select IRQ_DOMAIN
> >=20
> >  config BRCMSTB_L2_IRQ
> > -	bool
> > +	bool "Broadcom STB L2 Interrupt Controller"
> >  	select GENERIC_IRQ_CHIP
> >  	select IRQ_DOMAIN
>=20
> I'm always sceptical of making interrupt controllers user-selectable.
> Who is going to know that they need to pick that one?
>=20
> I'd be much more in favour of directly selecting this symbol
> from DRM_VC4_HDMI_CEC, since there is an obvious dependency.

It's a bit weird to me that the HDMI CEC support selects it, since that
interrupt controller is external and here no matter what. Would
selecting it from the ARCH_* Kconfig option work for you?

Thanks!
Maxime

--jdibhl3czonwcpge
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX9eEYwAKCRDj7w1vZxhR
xWdKAP9HIP+OMr/KnqPVosdzxr1LAk22AajNLnBMwtjovde35AD/QxAm/KxE2Ja3
qr3tvsmhqVBZ1mRShJTfY0ZkqKT4ZgA=
=199y
-----END PGP SIGNATURE-----

--jdibhl3czonwcpge--

--===============0989632653==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0989632653==--
