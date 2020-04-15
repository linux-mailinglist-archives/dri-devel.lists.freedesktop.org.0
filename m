Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDF61AB913
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 09:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA096EB04;
	Thu, 16 Apr 2020 06:59:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB2B6E94E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 10:12:57 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4DB285800D5;
 Wed, 15 Apr 2020 06:12:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 15 Apr 2020 06:12:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=s0d/RgblpxRTpjT4bbVue6KEZrZ
 fSGVOQKbJKOBuu9A=; b=BaShE054Cu8Fnh/acc0XEM6aGr2IdsHSkCR9zQQPoWq
 /aTmayYFa1i876Z7z82YolyKSCv+sSCevnTUFtxinPBkn8GKyebYvCT6pPJ9zRFr
 +NJTV6cEhOa7ffWGY8hX8Qs8DSR/P/9odcyi/uCy/D6n9FbxLtigv5q+MvXjCQh/
 ts+GP1GwXvzH9hoKVZUpDYB3VmicdPXaGhKrXUPsyACGXlU3xfHbxGb3MytL2eOB
 ekvCku+QNFJQgDMw//fevXI8+zwzbY6vlSIIxg8yg4HK+X3u5VoHUa9bReq0Q0TP
 YDFUvMiQW9A4UiSCoCOmSKv6rJ88u56CqdSmWl+Zaow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=s0d/Rg
 blpxRTpjT4bbVue6KEZrZfSGVOQKbJKOBuu9A=; b=oLHqxo4uH7p4gID2Qfnx+n
 xTsOExk6MG4B0jJvQekYdqA0zg+qiJN/dSMI8PXd059NTmcBvXzqFaAQWsCvnnVE
 r+QzsD4lKzgSnGO5DyJvru3RA0X5Iz4aHbpMe57n1iiY3z/99OPYCWFys2qZ+Uig
 cTMw/2nF0nW/xekuYY04A3l9YlNpaNsJpDJGuHpuRtLscLwQbmUYzvrxutiIbsr6
 oKVP1afJWmj/IwNwClKoABb1nQVSOPgQZC8fuhifL8oNF25OWpnxiWybTwUm9gnw
 ojVbNiUrtarBNMy3BBcCCXPsfUd7SrGyLttkc8OvuckbN18ZCU4Yl4/+mTTH7apw
 ==
X-ME-Sender: <xms:JN6WXkp19ZHWXzjjhwwmwbdOPcn0MVPAoGysA4CHDf6qu7mq_HtyOQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrfeefgddugecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:JN6WXod6O9K8OpB2X5BQN7PGUGIJznWSSS6cdbBC5H0J7w-kqNbZYA>
 <xmx:JN6WXjqrHaeqthMijteG5ve3Eny-UFarS3pVNI9vFRFqYd7YHy2Dqw>
 <xmx:JN6WXpFRhkOqF7jbtSROO4HBcn7D2xf4JnjK_iBuz8tNwSN2k6bYZA>
 <xmx:J96WXrRWOVF0KWZkQ3adnheXFK8UNYgZRjktsI970Lrnzt5ahKFV-A>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3FE073060060;
 Wed, 15 Apr 2020 06:12:52 -0400 (EDT)
Date: Wed, 15 Apr 2020 12:12:51 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v6 01/12] dt-bindings: add img,pvrsgx.yaml for
 Imagination GPUs
Message-ID: <20200415101251.o3wi5t6xvf56xmhq@gilmour.lan>
References: <cover.1586939718.git.hns@goldelico.com>
 <06fb6569259bb9183d0a0d0fe70ec4f3033b8aab.1586939718.git.hns@goldelico.com>
MIME-Version: 1.0
In-Reply-To: <06fb6569259bb9183d0a0d0fe70ec4f3033b8aab.1586939718.git.hns@goldelico.com>
X-Mailman-Approved-At: Thu, 16 Apr 2020 06:59:07 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>,
 James Hogan <jhogan@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 linux-samsung-soc@vger.kernel.org, letux-kernel@openphoenux.org,
 Paul Burton <paulburton@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Philipp Rossak <embed3d@gmail.com>, openpvrsgx-devgroup@letux.org,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 kernel@pyra-handheld.com
Content-Type: multipart/mixed; boundary="===============1195540522=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1195540522==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jbdyoswmyxbgpiz2"
Content-Disposition: inline


--jbdyoswmyxbgpiz2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Wed, Apr 15, 2020 at 10:35:08AM +0200, H. Nikolaus Schaller wrote:
> The Imagination PVR/SGX GPU is part of several SoC from
> multiple vendors, e.g. TI OMAP, Ingenic JZ4780, Intel Poulsbo,
> Allwinner A83 and others.
>
> With this binding, we describe how the SGX processor is
> interfaced to the SoC (registers, interrupt etc.).
>
> In most cases, Clock, Reset and power management is handled
> by a parent node or elsewhere (e.g. code in the driver).

Wouldn't the "code in the driver" still require the clock / reset /
power domain to be set in the DT?

Maxime

--jbdyoswmyxbgpiz2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXpbeIwAKCRDj7w1vZxhR
xU7VAP0ctDLTdRYVZSwO4CYzL5No4vlTBQEUBes1IQ1qFIdPwwD/XfAzl1dg/Sh8
EZ+Ln+utszFGNQD3stVRlNmI74tEyAs=
=V+IJ
-----END PGP SIGNATURE-----

--jbdyoswmyxbgpiz2--

--===============1195540522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1195540522==--
