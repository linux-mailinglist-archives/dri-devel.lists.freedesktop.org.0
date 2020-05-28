Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CA81E6F7E
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 00:47:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE6D6E844;
	Thu, 28 May 2020 22:47:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 319F96E3D8
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 07:31:01 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id B1C135801E3;
 Thu, 28 May 2020 03:30:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 28 May 2020 03:30:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=DzfmDTRER5Rc6vqd8K3tdl/h7IL
 LPrzRW6G6nM/VnN8=; b=Uo/3TSRDGuNYFTVIWjo5nW8GLeNnjf4YCBm0RvH8OIa
 d9NQOKxlUg1FESR6IAXM5mj3dCtfSgJ52b9QgX4BbQXpaWRZ0V2mj5pbElDNg9xY
 WoBkTMIQyU/2uLCVme027EGhgYmAZ/kBGpvEUjaTK8tB8zh7qLFjUq2y9M7CQlM5
 MD+a0zkII7ReHXvr3Myih7oiMCzLIr6qJSbkdU96GdrU2l4xHKx0zu9/9B+e9Nh/
 lH2L+GyXcRjyXo0v1AxKmSNI6EF6GfjfH7d6FDHnMymDy0hH5jhxxXgSNGIWnmZI
 Dq68N3mnkUh8ZEoFVa0f+C8rDUU8HPjXpGGWgHElAbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=DzfmDT
 RER5Rc6vqd8K3tdl/h7ILLPrzRW6G6nM/VnN8=; b=KJHyh6XqKlTQ4MP0B3XhzN
 YCyIFUWT+oDBebBgN3cMKQVzEx6whQoljUpQimvyyMAUdxHNajzjv1Eb6YfSvxem
 Kz+iXJhMpOpKhzTHpkOkRjMEVzADfZLY+cFKzpJbQxpOcmDfZlIKouu8MTaOnwDa
 b4zKDMS9u1OPxxiV65/Et3WpQ+XDk9rQbMJuPZVmi9Ge6EXdzLxWcD5C6D85TWyh
 i65iIRKZS8OVmdVXgZEv0KZwdYv6exg7SwCRISRFiD/SiqzrDgGwpm4kLxFEKEil
 Q8izo1OUn4kMo6xOquuuYDXVcBbgRiqAbztXNUGaU+tzRVfiGRRSTDWokeT4Qz1w
 ==
X-ME-Sender: <xms:sWjPXoONJgJEwoEq_FYCUe_RM3crKMcoo7E-FPok9IxHzYT67Q46Rw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvhedguddtudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevveefffduveeitdegtefhhfetueffteefffdvheevvdehteethedvleff
 gfejvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdeike
 drjeeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhep
 mhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:sWjPXu8OSORrgT7dwCMcLRO_66K0n8kL-N8hkR8uECjCsK3NZ3NpZw>
 <xmx:sWjPXvRtze0HzvnWIkUsiiK-OMC0eioiyU_5C_9VzsvjpWy-KMqdVQ>
 <xmx:sWjPXgt1FAvnCaJsnGRpBcolBHLPyMjUSIl2wixGr4MHY17_SwWhmg>
 <xmx:smjPXo7uLD9f6nuRyVwYhByDit7NnBfwK4Rpk_3NZeXwPXg38J9vyQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 32F0B30614FA;
 Thu, 28 May 2020 03:30:57 -0400 (EDT)
Date: Thu, 28 May 2020 09:30:55 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Drake <drake@endlessm.com>
Subject: Re: [PATCH v2 00/91] drm/vc4: Support BCM2711 Display Pipelin
Message-ID: <20200528073055.znutrhkryzu3grrl@gilmour.lan>
References: <20200427072342.5499-1-jian-hong@endlessm.com>
 <20200428162152.ztsqp7nxqbwqrm6r@gilmour.lan>
 <CAPpJ_efvtVzb_hvoVOeaePh7UdE13wOiiGaDBH38cToB-yhkUg@mail.gmail.com>
 <20200507172158.cybtakpo6cxv6wcs@gilmour.lan>
 <CAPpJ_efxenmSXt2OXkhkQ1jDJ59tyWBDUvmpyOB-bfPMDENQZg@mail.gmail.com>
 <CAPpJ_ed9TMJjN8xS1_3saf5obQhULJSLNgQSAFxgiWM2QX9A7Q@mail.gmail.com>
 <20200526102018.kznh6aglpkqlp6en@gilmour.lan>
 <CAD8Lp467DiYWLwH6T1Jeq-uyN4VEuef-gGWw0_bBTtmSPr00Ag@mail.gmail.com>
 <20200527091335.7wc3uy67lbz7j4di@gilmour.lan>
 <CAD8Lp45ucK-yZ5G_DrUVA7rnxo58UF1LPUy65w2PCOcSxKx_Sg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD8Lp45ucK-yZ5G_DrUVA7rnxo58UF1LPUy65w2PCOcSxKx_Sg@mail.gmail.com>
X-Mailman-Approved-At: Thu, 28 May 2020 22:46:32 +0000
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
Cc: linux-arm-kernel@lists.infradead.org,
 devicetree <devicetree@vger.kernel.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Jian-Hong Pan <jian-hong@endlessm.com>,
 Linux Upstreaming Team <linux@endlessm.com>, linux-clk@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, linux-i2c@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0561290215=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0561290215==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3roh2l2ctvp5d3wy"
Content-Disposition: inline


--3roh2l2ctvp5d3wy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Wed, May 27, 2020 at 05:15:12PM +0800, Daniel Drake wrote:
> On Wed, May 27, 2020 at 5:13 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > I'm about to send a v3 today or tomorrow, I can Cc you (and Jian-Hong) =
if you
> > want.
>=20
> That would be great, although given the potentially inconsistent
> results we've been seeing so far it would be great if you could
> additionally push a git branch somewhere.
> That way we can have higher confidence that we are applying exactly
> the same patches to the same base etc.

So I sent a new iteration yesterday, and of course forgot to cc you... Sorr=
y for
that.

I've pushed my current branch here:
https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git/log/?h=3D=
rpi4-kms

Maxime

--3roh2l2ctvp5d3wy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXs9orwAKCRDj7w1vZxhR
xWNfAQCCSr9BEd1oYBuyc+wf4o1Fm9s0OrK6oNnc5glpsNR6QAEAmnvx5c11Eczw
/TJeEz41Q44p4bi3Fmipemloq5mY/g4=
=elb0
-----END PGP SIGNATURE-----

--3roh2l2ctvp5d3wy--

--===============0561290215==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0561290215==--
