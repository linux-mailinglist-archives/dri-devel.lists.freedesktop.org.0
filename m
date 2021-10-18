Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 157624311FF
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 10:15:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53BBF6E0A0;
	Mon, 18 Oct 2021 08:15:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6676E0A0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 08:15:13 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id C6D693200D78;
 Mon, 18 Oct 2021 04:15:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 18 Oct 2021 04:15:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=pEJmNTV7gNj9oxTURnsIEF7NuVx
 6lhNIwH4wrbyU3TM=; b=FsuQ4ugzq+FrN0BgDCxhMreZSAxUGW3JSrh7TNHrBdz
 GWldYa05WXCoDDRmqgB/+ux78t8vuf9GSeWvHp+a8F1lE0P6MrI3CnLL0Mr2vfNw
 VMaOxhhSQxwuEGiT6u29AvR5jIShDO6OMI4N3Um6U/DMeMDj3418F5f7YR4TO8Mg
 NG3KAqkblSCYbZtCoiwolf+X/xqC2HShnssG2mVpy6LODiZcRpY22VdOpvfYXTIA
 1u6VKACRkjPJA6Sum3MXP0j0PrOl5cBiP/WG7mlLG0m5LVwByDmV5eLjRn1HdZLE
 H2XOnVOyHEvHMEKhpBdLzLszYTo2AqSavdAmQmJFXNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=pEJmNT
 V7gNj9oxTURnsIEF7NuVx6lhNIwH4wrbyU3TM=; b=MrhQLT+AH26uY6uShNnT4A
 VZPPdjSIPWy6/Jlqtv/ePmviN3z3PYbzgLiG7gQKqiynvoCQ0eY26KYrgQmaheO/
 QtUFu0/cQzSglfoYtHWFy8c81kA+HJH66TlQOuwg+iPcmXaAidu1kAeqcZA016vI
 UV+QiofJ8/SihzKnMoXtnosf2hYdkmJBemOzJyTa3QAmv9Q5b0PqqkY0EvJ5UnFu
 uve7Dyr+EsHKe0QnLFPUETqo8UV+J28WMWhorP7URIioxWkYKwwAgOdDpzulHNeR
 qzxArL5ke/n3aKlxQWzuh/4MRBW+c94cQpJYdvF/Q9/4NSRUF+tBzZlFiZf+AQEA
 ==
X-ME-Sender: <xms:Di1tYSX1KOBBa9riuxKMIklRtOMazB4tmyhJ8RR9e1jiNJZt-3l0tA>
 <xme:Di1tYem6wZn9P2vNpusyp3u7zujpEGBPRM9v9kzi862HgmOXj_V_CG3k0Y51wO20U
 3uhYfF6OeGppMu6iuw>
X-ME-Received: <xmr:Di1tYWZDltlGzv5pJ4Gvm5ca8ljv3DRgHIfY5gMFRxuIZY8GIUOiMr1NsJC1ojp-YivGnhtSFYvUaF4SNem7eopOB7dBPF-hgIHLZgN2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvtdcutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtderredttd
 dvnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhho
 rdhtvggthheqnecuggftrfgrthhtvghrnhepleekgeehhfdutdeljefgleejffehfffgie
 ejhffgueefhfdtveetgeehieehgedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
 rghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Di1tYZXCc4CPBciSCcl1DEHesmf_2V8Yeq7xKINRaWLrfgfPAlvexw>
 <xmx:Di1tYcl7u4VVZLWYeqitF27QYEct0mTRfaEkWI0Z5dWi5if_-wCjJw>
 <xmx:Di1tYefmPE7Q_RlsNGX2fTcy1Qti-j_ezbr5DS7N7_u75hlzQSBRyw>
 <xmx:Dy1tYTsnRqBxRIrR-BN9jQRaQ3nLCQ5O2xqDe6tqI6-Fn34THmvTZg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 Oct 2021 04:15:10 -0400 (EDT)
Date: Mon, 18 Oct 2021 10:15:09 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 5/6] drm/probe-helper: use
 drm_kms_helper_connector_hotplug_event
Message-ID: <20211018081509.bnvagntxwa6qk3fr@gilmour>
References: <20211015163336.95188-1-contact@emersion.fr>
 <20211015163336.95188-6-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="olaiv2pqhs6scyvc"
Content-Disposition: inline
In-Reply-To: <20211015163336.95188-6-contact@emersion.fr>
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


--olaiv2pqhs6scyvc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Fri, Oct 15, 2021 at 04:33:45PM +0000, Simon Ser wrote:
> If an hotplug event only updates a single connector, use
> drm_kms_helper_connector_hotplug_event instead of
> drm_kms_helper_hotplug_event.
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>

I guess we'd also need to update drm_connector_helper_hpd_irq_event ?

Maxime

--olaiv2pqhs6scyvc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYW0tDQAKCRDj7w1vZxhR
xSX4APwKgUEEn2AfjcxhFQZ4OwsOAXvvoH9W1pQsRclav3UIAwD/QdZuK8hWbOGO
pjrLY3EQWG2v5ftMsMKwg69KllaQNAw=
=6WDe
-----END PGP SIGNATURE-----

--olaiv2pqhs6scyvc--
