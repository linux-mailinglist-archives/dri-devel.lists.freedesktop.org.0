Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 964A01C0E97
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 09:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE1F86EA73;
	Fri,  1 May 2020 07:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 402136E221
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 15:06:39 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id B54D7246;
 Thu, 30 Apr 2020 11:06:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 30 Apr 2020 11:06:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=xeYUSzizreuaYphksMpyWqjTJec
 L7d9Xwl6zIofVoEY=; b=lp6zVlpE3eoz9SYKA88UDswb1xxapdzJZmAnRgUG5B1
 PYJWbMW5muAIoBqCDokmHux9qoVl13bmpqtZvbVe5WAGOLC7KLkDXQ8b+9K8N6Zq
 YuRGY45RCjxVIo9tzDcBbH6+eRF7vXAP7RLVEovJbaHHi/pBq+qpZDXccqinetAd
 CZybS1xl/9CrDHjVInsjsiNsIZgKoQ5xbao9SOarTD30zYK1qSQnvKJjvUMH2qMy
 xb6X8/GIhO/pDOAmxjttdpjc924CoTFLx9JVSAQt9OsjhwwXDEYMWoX2QLktfoDG
 H+52AxC3+A/Rb0r4JUKrQjIrzCITyeOH8GRT9PFvnOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=xeYUSz
 izreuaYphksMpyWqjTJecL7d9Xwl6zIofVoEY=; b=cdKcxH1KGK98bzRIMgetPN
 9F7B9olUs9M9ZUZ6XH7yhU4EDCUO4WjtPT/6Evz/XcE6d2kMX0FHq9iB3dmoOB3X
 rPDn9gCh4C+MXDKCb0OyEV5JpF6jDLjJSCUCPbqI/ww9N+hUz7EDYOxklg3KvjR7
 XOXuJMEfy2ArCaFQXv8X07mPJnDdLsjbZE0N1mTZKhVwpGh1OzgxOZeKSYyxdBPg
 ggdvAeHHiwlZLfPEp004MN1V61630DNqwjhN5m2GwFnAa66xeo5J1wdzuf0DJfiw
 xAN/a2Roe+jWakXfRzQdAeX2BX13Bp1vCaSEzVDMpBjuFiiWVDDdlPJT3Mj11uoA
 ==
X-ME-Sender: <xms:e-mqXsban-fsGmkv5_OhAW_tF5_eLXapM9rgiwvbgI4ojK_wjPIVoQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrieehgdekgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtderre
 dttddunecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghr
 nhhordhtvggthheqnecuggftrfgrthhtvghrnhepuddvudfhkeekhefgffetffelgffftd
 ehffduffegveetffehueeivddvjedvgfevnecukfhppeeltddrkeelrdeikedrjeeinecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimh
 gvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:e-mqXjBBR52nqK-zxgR-1G7jCWx1ArBxPPA07WEBQtCRUk7rw1qOmA>
 <xmx:e-mqXhZYCk94Sn5hdWvk4fJ7zLqLNmFG_uVpFogL-HDnXScXLrnfqw>
 <xmx:e-mqXkheQp4_GXv_UiRlLyI0XQLkF4nByEM-SdbnmpZRnyEVyPxp5Q>
 <xmx:femqXk1-IUJsjrcJbbO5ZJS4U14XdbWE1aZ4ofeIHpMxtmontqDhB3tsy4k>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9CBF73065F35;
 Thu, 30 Apr 2020 11:06:35 -0400 (EDT)
Date: Thu, 30 Apr 2020 17:06:34 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Emmanuel Vadot <manu@freebsd.org>
Subject: Re: [RESEND 2/2] drm/format_helper: Dual licence the header in GPL-2
 and MIT
Message-ID: <20200430150634.42zna3xwhj4cwsnd@gilmour.lan>
References: <20200430145537.31474-1-manu@FreeBSD.org>
MIME-Version: 1.0
In-Reply-To: <20200430145537.31474-1-manu@FreeBSD.org>
X-Mailman-Approved-At: Fri, 01 May 2020 07:22:25 +0000
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
Cc: tzimmermann@suse.de, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kraxel@redhat.com, tglx@linutronix.de
Content-Type: multipart/mixed; boundary="===============0549658951=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0549658951==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hbb2lqbyfl32a4jv"
Content-Disposition: inline


--hbb2lqbyfl32a4jv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2020 at 04:55:37PM +0200, Emmanuel Vadot wrote:
> Source file was dual licenced but the header was omitted, fix that.
> Contributors for this file are:
> Noralf Tr=F8nnes <noralf@tronnes.org>
> Gerd Hoffmann <kraxel@redhat.com>
> Thomas Gleixner <tglx@linutronix.de>
>=20
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> Acked-by: Noralf Tr=F8nnes <noralf@tronnes.org>
> Signed-off-by: Emmanuel Vadot <manu@FreeBSD.org>
> ---
>  include/drm/drm_format_helper.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_hel=
per.h
> index ac220aa1a245..7c5d4ffb2af2 100644
> --- a/include/drm/drm_format_helper.h
> +++ b/include/drm/drm_format_helper.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */

You changed the GPL license there, was that intentional?

Maxime

--hbb2lqbyfl32a4jv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXqrpegAKCRDj7w1vZxhR
xVnGAP9cMyJIv4AkRNCKjdSzj/K4g5e8uw/jvdXScgB+ctQFaAD+K463Hxv77qvo
2lLF+91XcxMo/HIXjZAkKeW4uI9Udw4=
=Cwsu
-----END PGP SIGNATURE-----

--hbb2lqbyfl32a4jv--

--===============0549658951==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0549658951==--
