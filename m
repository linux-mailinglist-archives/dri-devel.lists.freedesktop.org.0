Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8804B273C4B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 09:46:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC356E0DD;
	Tue, 22 Sep 2020 07:46:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA036E3A4
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 14:43:59 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id B5FE83DB;
 Mon, 21 Sep 2020 10:43:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 21 Sep 2020 10:43:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=EYoRtG+2IiJthJby9+YQ5i6b+gA
 goMFbV3hA15xgC1E=; b=IiY0JNAoCiiC/cGS8cGH83apzTAkmTSU+0iCGSNIe1a
 an05UjbrKkSaDOnZVS4z/6FYqUSZ4yGGYoQ4EnIZ1M0kU7MPXR3ywlA/nOMVR38r
 0hsVkMyVvlcZVfR5ahm3m3cNyPtbShcq/UFX7d/DuoGt8SgZJpTIQ3HVXWrysAep
 H4CS7gyl2+0k63uqAMFspPVD5DwSVcsHZrDCeNZYZkuwUaqN9iv23Oq6OZygm+Yr
 Rg8FVRctkH0rvj2bVdQ7a6VBeLAoxeJq9GzwlIlTZTuAL9RMwn6yoOpIWNsSjmLj
 fVEGgqRslEcgIRIlYE2yMquGEkCGJWtIwyXkf/goRdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=EYoRtG
 +2IiJthJby9+YQ5i6b+gAgoMFbV3hA15xgC1E=; b=aZBRLMVRzd8gU6uw/ecjWc
 G6mBqW2w0MjR0Rnuc0hqGeQFBb/21I4oXQztuD5nj/L2JrukQveQtwa98fwgZS3D
 ZmUGKkwEfTZKYqIyDS8Vd1osTFbWmZcRWn1G7fuhx6UqDcv7gUq2JZzh1Qby8hPn
 YqEyeeeySxbPeEKF3wVYEVIwEbWY7fkuWwE+3sFItx7dyfefCsXqFubU/TxNMIsf
 1vsAEFSt1K4LDjXdTQJtyPufBVu1TJ87foFQ4rQSqg6tWnEez9OvuWKGV0I98SnF
 mEZPTxX9lf1m5bihr4hyGqMxliMyZZ+Km84iSfyDm1VdfVB3qD3h3RgCJGGURCog
 ==
X-ME-Sender: <xms:KrxoX-Sp9MJiuqe3GzpGio-Kav86jbhmdfM-yx6BdSrL6lLFYp-YjQ>
 <xme:KrxoXzxK9XB8vmZ4VuYJ4Ho1NMhxf4THwGa8QV1AujDU-HV9K9JeZ2StOsbOgtbho
 5RpeaA7kWQOe-ZwNv8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddvgdekvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:KrxoX73b0ufThHQq0PEwqYA9SrhrCTo9a1WifQpYhAGCnTxaMiCWdQ>
 <xmx:KrxoX6DJUuMMSE7c_ddJdqXfZfQxrwrvurK4KycUwVhPegOolzIXUA>
 <xmx:KrxoX3hdKQd_gOPcWb0iqUfrDxowHTBN-EMnYxxYLmGTXX0E-ZC4vQ>
 <xmx:K7xoXyVQMJDMYUv8yj_DRJVpV8v_8J8V_Ry7tF51YK2Z7H5RSRqnXw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 68190328005A;
 Mon, 21 Sep 2020 10:43:54 -0400 (EDT)
Date: Mon, 21 Sep 2020 16:43:52 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH] drm/vc4: hvs: Pull the state of all the CRTCs prior to
 PV muxing
Message-ID: <20200921144352.deohjbuzlo4xq2gx@gilmour.lan>
References: <20200917121623.42023-1-maxime@cerno.tech>
 <CAPY8ntDG9fDZ6WwreTCMk_2GedqtDAvQuRD6iiM_YUeEbtS9+Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPY8ntDG9fDZ6WwreTCMk_2GedqtDAvQuRD6iiM_YUeEbtS9+Q@mail.gmail.com>
X-Mailman-Approved-At: Tue, 22 Sep 2020 07:46:37 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1490005422=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1490005422==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rdeo5nfc5emh3nvq"
Content-Disposition: inline


--rdeo5nfc5emh3nvq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2020 at 03:52:55PM +0100, Dave Stevenson wrote:
> Hi Maxime
>=20
> On Thu, 17 Sep 2020 at 13:16, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > The vc4 display engine has a first controller called the HVS that will
> > perform the composition of the planes. That HVS has 3 FIFOs and can
> > therefore compose planes for up to three outputs. The timings part is
> > generated through a component called the Pixel Valve, and the BCM2711 h=
as 6
> > of them.
> >
> > Thus, the HVS has some bits to control which FIFO gets output to which
> > Pixel Valve. The current code supports that muxing by looking at all the
> > CRTCs in a new DRM atomic state in atomic_check, and given the set of
> > contraints that we have, assigns FIFOs to CRTCs or reject the mode
>=20
> s/contraints/constraints

Oops, thanks

I've fixed it while applying it

Maxime

--rdeo5nfc5emh3nvq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX2i8KAAKCRDj7w1vZxhR
xTm7AP9P8ULwR785y4qr8MaWbsJpGOcnsLov6sy2iKNGLYb2gAD+Np/Gic+az9rn
PB9kayIMYYAjVwZZ1sQziyOomkAsoAQ=
=njlG
-----END PGP SIGNATURE-----

--rdeo5nfc5emh3nvq--

--===============1490005422==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1490005422==--
