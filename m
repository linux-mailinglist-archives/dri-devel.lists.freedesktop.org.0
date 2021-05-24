Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F1638E5DE
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 13:53:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4EEB6E217;
	Mon, 24 May 2021 11:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3CBD6E217
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 11:52:59 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0A88E5819C9;
 Mon, 24 May 2021 07:52:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 24 May 2021 07:52:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=ddz0tcBZgmkT/3hhpfbba4g3NSo
 MMo+qdHQ5L1UgRU8=; b=vWx8W6fmH/naMYdG5IF03h95a7zlcw8npvdQr7+/mIs
 5yN0tE7Y0DBge0dxEwz+I0PVp2AmOXdlW93ScrRXWTU3FiLWdtaviGzN2fZChutI
 /X69WoiKM8+z/Oh8o9Nj+d9FsbwpfswHVKzUE52U4kxjV2HzaBs5SV8/N+QrMhNP
 FW4ABjbNjpABEovuvOEv65dVjj/vcIgR5KgyVpKFQoEkqm18rdgEaL7jXBo6mh0h
 Nn3Mf3t5o2Orl+1f9s3gzwXs8urZ5/S7dFxhKsRxD18iunNGqSEeo0Fr3LSr2TMA
 oYeijGArOOSjcDKIRS9k4dTPRETyjtQjT0LYImzknDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ddz0tc
 BZgmkT/3hhpfbba4g3NSoMMo+qdHQ5L1UgRU8=; b=S9v7N3gXwGyhvpQR2XWJJM
 +N+h/WflGyGWMl1/EbHxRbgi5bii84c2+5RNZZrC/7ZPZTmArOKjGW7q5zaYuI94
 rRnAW27S5W/UX+W2RYHKZbZJqHvZlPK7CAyWbd00u4WUpT6Qp7YkQTa4QJ8ODcGG
 7/1kPQ3nJV536Z6yysCkgXpW5nyCPLPG7R3B63ItFkMD/yXgtQhSpQ4JuEKBagyv
 0VaoRaKYarSLWo8q7+oA6Zg6BH2hrZHOiFGQrIlhjKJO8YXFy1Zci4cYKzzkHQ1o
 HHJBd4yMYnFncrOHts3Qhl5iBVJQNGbeGYYNOCy9UNIqT+4vBxZ0YqKuIgyJUnqA
 ==
X-ME-Sender: <xms:mZOrYCjjEaSG__fIYfMms9Q1ZJDnPkB5e4PRkfL8OdMjBF2m7z-CRQ>
 <xme:mZOrYDDEiU5XkJYFzmuyHlO76w3xY6gW8_uzqBYE7-TGiKKkL0yjSLIP9E9DAzMxF
 2WuV_a-ySAKUL4D9E0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejledggeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:mZOrYKEAjKpP2rKOOiqk_UwpXU6lnldtrTPI_b4mkcex6nHNtgvp6A>
 <xmx:mZOrYLRWfN2TentfjRPO3lkIr8tQwq8DZE580GScoTXfthjd1-Fzjw>
 <xmx:mZOrYPxmCkZ9XBAKZq08jMhchuRYQQtz-jjOMlZzewytu3-l1zPJTQ>
 <xmx:m5OrYELO6d68Zbop3zu1BsL1W3CZWpxePMV8xpjp6A31RL5dnunNSA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 24 May 2021 07:52:57 -0400 (EDT)
Date: Mon, 24 May 2021 13:52:54 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/4] drm/vc4: Add support for the BCM2711 VEC
Message-ID: <20210524115254.ifjtledccze2ueos@gilmour>
References: <20210520150344.273900-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ykg4l6l5w6w2sirq"
Content-Disposition: inline
In-Reply-To: <20210520150344.273900-1-maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 linux-kernel@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ykg4l6l5w6w2sirq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 20, 2021 at 05:03:40PM +0200, Maxime Ripard wrote:
> Hi,
>=20
> The composite output in the BCM2711 is dealt using the VEC. While the ear=
lier
> SoCs were properly supported, it wasn't functional on the BCM2711. Add the
> needed support from the RPi downstream kernel.
>=20
> Maxime

Applied patches 1-3 to drm-misc-next

Maxime

--ykg4l6l5w6w2sirq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYKuTlgAKCRDj7w1vZxhR
xWjLAQDLX/sHQD+jkjAd/Zn718/CwW+EIPefPc5zOy1TC0ktUwEAgPalmAbaIPW1
5FiL1xD5zn2aBZ2Tqbon037NVt74sws=
=0UQA
-----END PGP SIGNATURE-----

--ykg4l6l5w6w2sirq--
