Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E45B33D8D34
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 13:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85BEF6E9C3;
	Wed, 28 Jul 2021 11:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E876C6E9C3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 11:54:25 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3AB4C5C00E7;
 Wed, 28 Jul 2021 07:54:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 28 Jul 2021 07:54:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=1xqt7KTezd7B+8knlEY1h4ifSLV
 iKAGI4K83e6m5dMU=; b=0lzLhgyKnZcaTBLpMblHo2mdF4qP+n7ywW9Pc5rJ/bz
 t+j7TrvtrIaZN5nqBJN0PxZ+xOYQK6X+5ubl3Qr8/nBb5cTxeT00qzqbOVLHa/yk
 n41HezpvTvk2EUA2PZzQfMrfoBvcI2Sd+QvHHr3ZGHq1r/Ym0c8ICayhgiigaxCw
 cbGCw0b2rvBK/00hgNxvq6FNazO9Q8sp9bTCnlohLC5SiDRc7LHUXEXCuPBlxDkt
 9fgYL+F95XBCBaRYnL3cjHxly9FzTS2jr515npRx+R/DbghAIgIHNOKbsAtT8uPo
 vHHZ4S/MDOLdvFUiqrTVyGKV6YKubhhh8d0DS7lSDAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=1xqt7K
 Tezd7B+8knlEY1h4ifSLViKAGI4K83e6m5dMU=; b=rTvZqaHci/YLsdQdLJySj8
 2rGLLNwrvCTrzJ2Dm3HreBl/4F2RDYiFtOChDRC1hPCdtxx3emt9IU0Wc8+FFjOP
 gb6cgz81XZ/24M0h5nAq5bvheEp0KXYFf8BLCP8p5U7NpmUQhL01HjrGj04DJWXN
 t13hZ5+RUswYn9X4zrpk2zY4RleuIqlxx6nnimfLAndp3+vBTeeS5pQCilhYNvB1
 43c1HR/E735SW3cM/fvLDxyE6cBtLt5evRbGW1bsfqNw2NsNYXx+u/3W66WNp0yS
 3kZwIyZfOSnvjJ++AYS3qAeF0MXBQ+kGEu2X4Iz7ZvmxwagqsvAGpeeELH5uJ7Zw
 ==
X-ME-Sender: <xms:cEUBYeab7_sgZcUzpbAZRV3BDZjcIOdYshL6gvXwwd3wDIwjxMojkw>
 <xme:cEUBYRYhFP9LtjESM5MkF9nKeinNDLvQeLJ9KWIsZlj7dqJIFTI7yxXBqfgqCw-Pz
 4KFVL6NPWJOUqXlfZ8>
X-ME-Received: <xmr:cEUBYY8y9DyIMTwWEV1y8skZhbcG2-CLLK1dkwrxOXZoD_7UqFE93QeHUavEniF_h8brWREHjValqry-xbt5tZNVHhs8vXfM0rGJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgeelgdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:cEUBYQptHTw3iiPxKKDqnvLKHgTeZiygjjUHIVgGYZeRRtGfNyAxuA>
 <xmx:cEUBYZot-nXIpjVKwmN8yBCZoszHGyE_oqIKwODYwk7MTbly1rGN4A>
 <xmx:cEUBYeRiXBduqKUvRehdWgNc5nDiaE_eN4fM9c8-OKP_6V2ImIOIpw>
 <xmx:cUUBYalMHEPbgg2ZLaOod4Dqm2o5_EdHfwtFzMNc-F18JQzoy_WGbA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jul 2021 07:54:23 -0400 (EDT)
Date: Wed, 28 Jul 2021 13:54:19 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: "Ivan T. Ivanov" <iivanov@suse.de>
Subject: Re: [PATCH] drm/vc4: hdmi: Add debugfs prefix
Message-ID: <20210728115419.kt3tdhx5jmmk42u2@gilmour>
References: <20210723072414.17590-1-iivanov@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rotth3xlzxm5wim2"
Content-Disposition: inline
In-Reply-To: <20210723072414.17590-1-iivanov@suse.de>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Emma Anholt <emma@anholt.net>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--rotth3xlzxm5wim2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jul 23, 2021 at 09:24:14AM +0200, Ivan T. Ivanov wrote:
> Without prefix debugfs can't properly create component
> debug information tree when driver register more than
> one component per device, in this case two. Fix this.
>=20
> debugfs: Directory 'fef00700.hdmi' with parent 'vc4-hdmi-0' already prese=
nt!
>=20
> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>

Thanks for your patch.

However, that part changed fairly significantly recently so you'll need
to rebase it on top of the drm-misc-next (or linux-next)

Maxime

--rotth3xlzxm5wim2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYQFFawAKCRDj7w1vZxhR
xSo9AQDI2NTYVqSA2pkWlD+4Sqebxb1NKxDNprh8vzsltJFq6QD9HsHa+guhDvGX
U1Cxfh+vtki37RRS3K0JfmtpMvm+WgM=
=s2kW
-----END PGP SIGNATURE-----

--rotth3xlzxm5wim2--
