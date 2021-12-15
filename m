Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 091FC475B54
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 16:05:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A57FA10E4DE;
	Wed, 15 Dec 2021 15:05:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD4D710E4EF
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 15:05:39 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id DFE8D3201134;
 Wed, 15 Dec 2021 10:05:38 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 15 Dec 2021 10:05:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=J5J6Uj0oXJV7NKbOg6ULTjcWWGZ
 BN1z9WSdnEEcV+BE=; b=VYxRsebZDR+jjLRMljFNWrPa7LJ+OZRrcQCucCtABso
 oewit3FxWyIx7cSaEncTZk6sGuFVvmoPzXM2x+QqusPwts2d9By41CL0Gcd+FCTl
 NynDQ3r8wZfUWUvmkSnogaW/7XRHcSHhvqKC2fzLjI+/tifKrL2KCw2WCb/+p63v
 9RrIE6SBMV9a+9Jombovn/eL2ndf6YGL2H/hyAtajcR8rylbKXxRLIt4e1oKFAjd
 /8WsSrV+zJHhhwG+a6Q9NexIi7pUzAyLTKJ46o4b7j+VgsFTZ89DWlQVDEoWzIy5
 cGR0fgic3vlwiQBR/Z5JjmEJ2eAlGxdQa0w06CB00XQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=J5J6Uj
 0oXJV7NKbOg6ULTjcWWGZBN1z9WSdnEEcV+BE=; b=M4t14uYr15dUjGFRCXfgTd
 2pHaKnwvMIw4ArsQZxKnIUM91uTo9IwDQJybsfrUVkTFhI0H+CLhiyiZuO5POXDO
 laRBQqtrF+3koiRdEBOL+5oHNmLK5tWJ0xYeiVFVUIoc+6HaYiwC0bRnObfBLRNt
 Q4b1UxADRYPNidKCN0q9WlgtRVjtUEX+Y50JqCU43BN2tDmGFZEdCeb4aLf9AXv+
 6hRPG53H43sQuXjoKYcX2+VyqJrpmC3kCqaIQvNjnqVXdYXBwRLSil8iy6Wj3xFL
 CFh9ZvIqp0O2sy9ZzPCLkC//UtRK3NJ38VJ37UV/K0argSXI0kbpAFF0CWKMxycw
 ==
X-ME-Sender: <xms:QQS6YSVe-34Qpjhh0zPd68mpdmKbHM3luj2ldYPe-IyrnRZjfijwQQ>
 <xme:QQS6Yelvrg_1BxBp8jpSdEvEt_PQGcc8PBRtLhiU_g4k9QxdV_ehCdVjVxTRCKt2j
 QNd-JH_0AG6tfBHN0s>
X-ME-Received: <xmr:QQS6YWZU_ZW0URQVwvzuechVj2wQJw1xdtI1xXNiSSSlszSg_Po7SGi3Q7ArgHn_asgptwwtJUWupzq6K0pVhfq3TLF3RF33y8cStyU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgdejfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:QQS6YZX_m_3CYPmCHG7uVMsn5t8uNHUAHe-UVw87lxqTt0RslADD2g>
 <xmx:QQS6Ycl0qzJ_cZTIHyBSMMkrFm5NYPQt2db399m-VmL2_KgW0qMSYg>
 <xmx:QQS6YefrHxYvFDT-Axwhy77rrAPeAGVcZUMpBhX4YujAJxuf71Gepg>
 <xmx:QgS6YWhHrSQOoZ4gIGhPfe7AhFnKhwK10SbqH7ung1Yc0Jqqr0NWPQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Dec 2021 10:05:37 -0500 (EST)
Date: Wed, 15 Dec 2021 16:05:35 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/3] drm/ast: Fail if connector initialization fails
Message-ID: <20211215150535.m4tyh6pqsewjbtbp@houat>
References: <20211201153100.403-1-tzimmermann@suse.de>
 <20211201153100.403-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sabzoqhpq36ellel"
Content-Disposition: inline
In-Reply-To: <20211201153100.403-4-tzimmermann@suse.de>
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
Cc: airlied@redhat.com, sam@ravnborg.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--sabzoqhpq36ellel
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 01, 2021 at 04:31:00PM +0100, Thomas Zimmermann wrote:
> Update the connector code to fail if the connector could not be
> initialized. The current code just ignored the error and failed
> later when the connector was supposed to be used.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--sabzoqhpq36ellel
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYboEPwAKCRDj7w1vZxhR
xYSBAP9dYVhpmEqwpiSkZsqR/R1VzCKzAu8boHT4ymCWpp9c6AD/VC8Eu24gVCb5
+gv7yfLrd3ytWkJQFVGr/99VW/ZprQA=
=RpVn
-----END PGP SIGNATURE-----

--sabzoqhpq36ellel--
