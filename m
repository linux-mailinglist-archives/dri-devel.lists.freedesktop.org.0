Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFA53B1CB8
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 16:39:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A4076E919;
	Wed, 23 Jun 2021 14:39:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 027436E919
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 14:39:34 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id D996C58062B;
 Wed, 23 Jun 2021 10:39:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 23 Jun 2021 10:39:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=0HsLLey/fKRoKjdaUNTlRKglMem
 573ETn+6PBaZhBlA=; b=qlQdZFetQFNz5/Zr/PNIwv/XABwMWCK4shyMf8XCiNx
 /nYEihGoj26BjdB5aU2E5nTBxwYL9cQXFa/91zesFfeIEMh1vkhiCpIeNUPjYb7h
 VOIjgOSkTEnqfUN3C0AzpbHB3GIVLM8flLxO/2TW4gaAbXV6fAhtSzQjWbYql/fd
 jDSR3+pavj2kHvl1caC7hr9ZNtr9FirK2Pg2KMsUPYOJM2CJFSvh3Chqs3G8sDy4
 AUE+mDpkCSlAvcLsgXVMTUmxAbD4n9xWKcoBYNkcDgw/43sLey9L9AHnW34rJphg
 MRyQi6ZQQfE37xy8KNfw2HLLgD2hysrYvF8hj8k0fGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=0HsLLe
 y/fKRoKjdaUNTlRKglMem573ETn+6PBaZhBlA=; b=k8goKRCtv30z60+G0WpDPe
 0Kl/TAC/cTXPU/00+i9hyjvPkYU3O0WriDwv8FxkAvX7I6UekoWJrikYjnmZiSSQ
 ME57XRoQVKire1wpx9MNoYST5PhZaFlpKZVq6eMcEMup4Xzka3ApXBOPHEB1Tx3K
 XS7OiJLmQklpPwDctMAPD1fHbFYv3re8tDTvomkBvC9imy3bTYPWyfi7TmPq3OsM
 oXRIB2f3OF9nD4j2P4o2jSFkLAM5VWK4YmnHiQ5S2oIGRCegVkqifrNgJ9QIE4sM
 aULpb0Gd5QUX6rWN5DtkKkGjzv7vUWjbhG9Q1gskqiQA5Or2NuT9aUZOdp59/6nw
 ==
X-ME-Sender: <xms:okfTYFH9Y5JwLcxIa28cR-0p7f39WUbQNsYMTd34PvdGUqZ5xbQ3gA>
 <xme:okfTYKW9yzYaXFkZiqavzlGCTs4cdYEDd0solwQeSdL4CC8CKnJguoAS-RF3pXGND
 VSmgKekA2Khwau4F0E>
X-ME-Received: <xmr:okfTYHJVnkIdNalGGK8dsY7ZBk9irxpZB3y2uWg3VorHDvfhptJKTcCXA_9aGhr2rooo4iz-D99zFA6SWCLMk9ZKyO5FlZD2ngpH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeegfedgkedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:okfTYLE5KoTeWvMi538qBEVwzxvUAmBgVNaKwY-29In-xk9YLjuJNA>
 <xmx:okfTYLVaPx9j0bJCANeMwBqGKLWypbCv58ZSQDFVXIcHOKgKQvS-JQ>
 <xmx:okfTYGPZOk9APMOyZETZF_tn_LzLyIwzLu6JCcgnRepHWAWB78g3Vw>
 <xmx:o0fTYEsYOZp9MgqG3Bv6SxlPOuI_NlBkpBQ46DgN6JXombZcsfddVg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Jun 2021 10:39:30 -0400 (EDT)
Date: Wed, 23 Jun 2021 16:39:28 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Esaki Tomohito <etom@igel.co.jp>
Subject: Re: [PATH 0/4] [RFC] Support virtual DRM
Message-ID: <20210623143928.ickbxz32w6lbpofn@gilmour>
References: <20210621062742.26073-1-etom@igel.co.jp>
 <9853d0a9-6053-db64-9c79-40b7e0689eec@suse.de>
 <20210621092454.jvdmelk2h427jn5v@gilmour>
 <cc08f858-7440-05f9-0d10-243f5115d209@igel.co.jp>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zrpqm6ro3pys2ppq"
Content-Disposition: inline
In-Reply-To: <cc08f858-7440-05f9-0d10-243f5115d209@igel.co.jp>
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
Cc: devicetree@vger.kernel.org, Takanari Hayama <taki@igel.co.jp>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--zrpqm6ro3pys2ppq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 22, 2021 at 01:36:48PM +0900, Esaki Tomohito wrote:
> Hi, Maxime
> Thank you for reply.
>=20
> On 2021/06/21 18:24, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Mon, Jun 21, 2021 at 09:10:19AM +0200, Thomas Zimmermann wrote:
> >> Am 21.06.21 um 08:27 schrieb Tomohito Esaki:
> >>> Virtual DRM splits the overlay planes of a display controller into mu=
ltiple
> >>> virtual devices to allow each plane to be accessed by each process.
> >>>
> >>> This makes it possible to overlay images output from multiple process=
es on a
> >>> display. For example, one process displays the camera image without c=
ompositor
> >>> while another process overlays the UI.
> >>
> >> I briefly looked over your patches. I didn't understand how this is
> >> different to the functionality of a compositor? Shouldn't this be solv=
ed in
> >> userspace?
> >=20
> > I think there could be a bunch of use-cases for something that could
> > "steal" a plane without the compositor knowing.
> >=20
> > Something I'd really like to work at some point for example is that the
> > downstream RaspberryPi display driver has a visual clue when it's
> > running too hot or is in over-current.
> >=20
> > I don't think this is the right solution though. The DT binding makes it
> > far too static, and if there's a compositor I'd assume it would want to
> > know about it somehow (at least if it's from the userspace) ?
> >=20
>=20
> I will reconsider the DT bindings.
>=20
> We want to separate the resources from the master in units of planes,
> so we proposed virtual DRM.
> By separating the plane from the master and making it appear as
> a virtual DRM devicein userland, the plane can be accessed from
> userland using the general DRM API.
> What do you think about this idea?

I guess you'd need to detail a bit more what your use case is exactly,
and what issue you're trying to address.

Generally speaking, I'm not really sure how you can separate a KMS
driver from its planes.

Like, assuming that you have that super important application putting
the rear-end camera on the display: I'd assume you want the connector
and bridges to remain enabled? How are you going to synchronize with the
compositor if it wants to disable it, or change resolution?

Similarly, some features exposed on the connector, like bpc, might
affect the input format you want to have for your planes?

Maxime

--zrpqm6ro3pys2ppq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYNNHoAAKCRDj7w1vZxhR
xSYqAQCeBYrlpqR5FSj6MJ47x6cTdMpmzNwtz5kdH40wQJkV7AD/de9z5dNUHVoD
IFn98/cS3zYxIr7sbZYk5LkBlbuvaAg=
=owdM
-----END PGP SIGNATURE-----

--zrpqm6ro3pys2ppq--
