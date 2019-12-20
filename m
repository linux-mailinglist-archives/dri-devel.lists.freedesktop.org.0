Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F981292E6
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 09:12:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 085246E1D7;
	Mon, 23 Dec 2019 08:11:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536FA6E0ED
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 15:56:53 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id E392E66C;
 Fri, 20 Dec 2019 10:56:50 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 20 Dec 2019 10:56:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=F0ZTuTVtEpXsyVrrlDYq9u8KfXH
 qETwffs4VBzezgnk=; b=AH1J+DkmGRQHf2B1O9ds/lUMr5jrvc3TyrZvDHvpuQf
 PQq4YQP9MgYt85BvoeCaouEgRefoBx2O8IYcTZYLa/f67k3GL4OLrpu0xLZiAC6x
 soIR4V0lO3x0rqGV//xSLhfzplGeT9ZbhoTeIhfkkbIlXZrqZ6tR8rNd+OdlnXsM
 X/oFp5UBJwOdNVPOjldJEpMz+M5fPYlXg10mNAxhqm2ggSG0cfoOxCV22maKT+/s
 dYHt0kSxXFG0M6BlL3M4GIjRz8wHkxONw42gfC+gS0S7Vxk28NLjgptORWjWywEg
 MEcTLlb/C9QAbzIsb52WjCZcLV1sjrNKv0JrdittQZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=F0ZTuT
 VtEpXsyVrrlDYq9u8KfXHqETwffs4VBzezgnk=; b=N7bvmD5dRQmiZQ3VimUSH1
 kkq9cTG11wdCIZR8KlysCKvpZeT2sbbqW/VYH7ro2FjxgO+NqaH5ZATFsCEPZk06
 HmEQ9nylW5XDvsCNdiDljHx/5zR1VtdrHjzKGZ4J74bZc0XI5uX5vhCXXOTlkB5S
 HS4CMxYULbGiII/eF6i5hQgXoZBntrLp84mSaTI7+XG5dRJ+s08Q7HINngxUJvYk
 N2uzkUjBug+bS1O8chVhtvVd+BHqvdym3rq6EzRZ4jOlzjPQBbPb+CTyturcpmBX
 dO3+t+JzySfcznBZmTNUFNFW85vkd9OcZcPkp6MI9TR881h52u+kX8gxBPu5IYiA
 ==
X-ME-Sender: <xms:QO_8XVGL-FPCRc4l-HYjdDbxXk5rPaPP3L_faRv4jLEwwKbwWbNXEw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddufedgkedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggv
 rhhnohdrthgvtghhnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:QO_8XQVpkjlN5CpM3r85FwBsyS-DDo4SToFASwkO2sXcjvGl7899Qw>
 <xmx:QO_8XTkeSucT_BKuze1NHxK7SbfTCPfPKrDocrlrSLkNyqHrgQ2HdQ>
 <xmx:QO_8XQo1r9BXihOxn9A3aBxX8cwtjPaoZvdoItFXC4m7S8uEN2N_rA>
 <xmx:Qu_8XaTXV5gCQsYGnGTUZJCSQ_tgr6Y0pXmLg27eQdkhX6aDqztsqxnrflQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8D9DE8005B;
 Fri, 20 Dec 2019 10:56:48 -0500 (EST)
Date: Fri, 20 Dec 2019 16:56:47 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH v5 1/5] dt-bindings: display: ti,k2g-dss: Add dt-schema
 yaml binding
Message-ID: <20191220155647.vh2ip3xobbvvcwdf@gilmour.lan>
References: <cover.1576857145.git.jsarha@ti.com>
 <a89be75beefdc4e9ab5f194495b49f3538c9fc5e.1576857145.git.jsarha@ti.com>
MIME-Version: 1.0
In-Reply-To: <a89be75beefdc4e9ab5f194495b49f3538c9fc5e.1576857145.git.jsarha@ti.com>
X-Mailman-Approved-At: Mon, 23 Dec 2019 08:10:46 +0000
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
Cc: devicetree@vger.kernel.org, yamonkar@cadence.com, praneeth@ti.com,
 dri-devel@lists.freedesktop.org, peter.ujfalusi@ti.com, robh+dt@kernel.org,
 tomi.valkeinen@ti.com, laurent.pinchart@ideasonboard.com, sjakhade@cadence.com,
 sam@ravnborg.org
Content-Type: multipart/mixed; boundary="===============0016737240=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0016737240==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rzpvugffskt2owpl"
Content-Disposition: inline


--rzpvugffskt2owpl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 20, 2019 at 05:55:09PM +0200, Jyri Sarha wrote:
> Add dt-schema yaml bindig for K2G DSS, an ultra-light version of TI
> Keystone Display SubSystem.
>
> Version history:
>
> v2: no change
>
> v3: - Add ports node
>     - Add includes to dts example
>     - reindent dts example
>
> v4: - Add descriptions to reg and clocks properties
>     - Remove minItems when its value is the same as maxItems value
>     - Remove ports node
>
> v5: - itemize reg and clocks properties' descriptions
>
> Signed-off-by: Jyri Sarha <jsarha@ti.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--rzpvugffskt2owpl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXfzvPgAKCRDj7w1vZxhR
xTODAPwOByWmvTGMA8krKLuu1Px++TumFAd708LgyplZEQZCuwD9F4wYHCVFjwVw
6KUrC7O+5senInlwizcO3XtfnZetJwY=
=xUwG
-----END PGP SIGNATURE-----

--rzpvugffskt2owpl--

--===============0016737240==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0016737240==--
