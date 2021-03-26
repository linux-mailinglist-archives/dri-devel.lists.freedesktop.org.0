Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2F034A9E6
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 15:37:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A9B6E213;
	Fri, 26 Mar 2021 14:37:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE2BE6E210
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 14:37:22 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 50E805C0709;
 Fri, 26 Mar 2021 10:37:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Fri, 26 Mar 2021 10:37:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=BKbkEFN8uWf6/5XzOIUJ/zSrTAR
 0hmJdAto/Rq8x6Gc=; b=IIxLG9ba7mVnfP9WpjehPAWNJ7jIpXBMf2x9MrjuMd3
 6+oc2Ncn3dOkKsh3U3XxQiq7ef/sXJusncocRVpyEr4N8CcXVny5k5XldEjYBoaf
 nkoyYCQ15gr/4CT7EH42CPjk73leZlFc+M5h2MdmjI8I9bC8R3rqjWmD8D9jqVrk
 fBXg4NBnX2w9FhhJcZj2QyAv0Jz07zHJdKBNUxwVUzy09S1hSUL3aRYDaZf6QGj+
 wR02tVA+qmbXjbeJdJ0BaL4WpGp8seMaCooT/mIzk4XDo0FM04ss03Wf+xIUCGTr
 sz7IPnIhm/wqXCbjzVOT1G++oE8yUrZPuyU/BOFQuvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=BKbkEF
 N8uWf6/5XzOIUJ/zSrTAR0hmJdAto/Rq8x6Gc=; b=LcZklxOYE+10C+292gYbfy
 h3P/1JPkrEVp3O2J0Z7odMNLDX1Tx5rSy4oBOCbTpPCT1vrwWEwm6Fk2nzuckRqK
 Jd4+8noDZlWaJ6MdicQwWnj+O0KdekFB4Ssg8wI30s6pfKcabrJnxYHTJtt03QIq
 GpeM34aepqHqCYIpVdpcpO5lIWeZF6AvzuIOfXlBUyshuXwgjVCsYMX0bNaWVxDR
 /HhNurIFiQUngZV1zDZ/jYQdlPEDx19/ir+NoBy5jsXLEbQO7Gvs8+0QXdMdmsCa
 MrEbu27+/BMXTbo/WzB3xmWC3HRwWUCYreJQUMmfi7TtffReGScNQrT1xtM/J1mA
 ==
X-ME-Sender: <xms:nfFdYBz01OflNeRefy3fRVVpPTbRLDKpo2_eVqA6HyMc-zDxJ3iNYQ>
 <xme:nfFdYCiZpvY5uH19s8sX0OP6XfVyhbK-6UjC1nGZ-3wY8S74-7vkf5Kt01f-mVztl
 -DfKzPGvnaAhANkVlY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehvddgieekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:nfFdYArhCOEnmKb8twNSWWwKgo5Nz59VkK6iFLiZQqn9aKtQ3KgSJg>
 <xmx:nfFdYBdfZ7vD0K0VHBpnlXelJv4-LpvCpnbpxJqcKoi8-D921qqGFQ>
 <xmx:nfFdYDfzzRc0bBm6ZaGHIvwq-cfbh4mn9xS11H-b2hXyV8HGv8wVqA>
 <xmx:n_FdYCEym37a9T4dokuplcSSUaDXxuDseimCNWMTIZMsoM0maW5kqQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A5AE41080054;
 Fri, 26 Mar 2021 10:37:17 -0400 (EDT)
Date: Fri, 26 Mar 2021 15:37:15 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH v5 09/10] drm: rcar-du: Perform group setup from the
 atomic tail handler
Message-ID: <20210326143715.tpk4o62xgjvigefe@gilmour>
References: <20210322163535.1090570-1-kieran.bingham+renesas@ideasonboard.com>
 <20210322163535.1090570-10-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20210322163535.1090570-10-kieran.bingham+renesas@ideasonboard.com>
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Ulrich Hecht <uli+renesas@fpond.eu>, linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1369846972=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1369846972==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nydjxzy5xve57wtg"
Content-Disposition: inline


--nydjxzy5xve57wtg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Kieran,

On Mon, Mar 22, 2021 at 04:35:34PM +0000, Kieran Bingham wrote:
> Create rcar_du_group_atomic_check() and rcar_du_group_atomic_setup()
> functions to track and apply group state through the DRM atomic state.
> The use_count field is moved from the rcar_du_group structure to an
> enabled field in the rcar_du_group_state structure.
>=20
> This allows separating group setup from the configuration of the CRTCs
> that are part of the group, simplifying the CRTC code and improving
> overall readability. The existing rcar_du_group_{get,put}() functions
> are now redundant and removed.
>=20
> The groups share clocking with the CRTCs within the group, and so are
> accessible only when one of its CRTCs has been powered through
> rcar_du_crtc_atomic_exit_standby().
>=20
> Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>

It's a bit weird to have both your and Laurent's SoB without a
Co-Developped-By or an authorship from him.

However, using a drm_private_obj shared between CRTC has a gotcha: you
don't have any ordering guarantee between commits if they affect
different CRTCs (and they are non-blocking).

Let's assume we have two subsequent commits, commit1 and commit2, both
non-blocking, and affecting different CRTC, plane and connectors. In
this case, commit1 old private state will be commit0 new private state,
and commit 2 old private state will be commit1 new private state.

If commit2 is executed before commit1, then it will free its old state
when done with it (so commit1 new private state), and will thus result
in an use-after-free when commit1 is ran.

In order to fix this, you should store (and get a reference to) the
drm_crtc_commit in your private state in atomic_commit_setup, and call
drm_crtc_commit_wait on that commit as the first part of your
commit_tail to serialize those commits.

Maxime

--nydjxzy5xve57wtg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYF3xmwAKCRDj7w1vZxhR
xbtPAP9DE5c1AG+thwHS9ps9NCp44Y6DX7aLK8RJvtyi+VoF+gD/Rqulso4AYAuU
N+k101boqfKcYPmLsilSOvdfMdLeFwo=
=DUQq
-----END PGP SIGNATURE-----

--nydjxzy5xve57wtg--

--===============1369846972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1369846972==--
