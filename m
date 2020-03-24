Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15980192268
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 09:17:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74DB96E5A0;
	Wed, 25 Mar 2020 08:17:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B91546E3E7
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 15:49:27 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 963E4580208;
 Tue, 24 Mar 2020 11:49:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 24 Mar 2020 11:49:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=i7HBmzxid/ci7fk+gbb7Mxl+YrD
 WbK/5oiBZwSKFtdo=; b=omQWnEiN35VVoWHD5HNnqs+mGwGhtQ/DUI+4MwgSrOI
 5xKUariUf8Hqcn5hsOp6ol5Oldyos3xuIURl6a7E1e8kFBL4WdsKpy8/n1XpdYD3
 YwXSjFpaojQ+uMJu0GusJTUOTF9PG/RGvqFMCve4mIBYTNVA0B9tD2edyv8agphF
 Oi70ygmukHOdawpsnx3HWEdUcRVbcL+e6u5Ee5AEz8kri/obJgykARX8hSJAcO/B
 r7b6dM+sZYYgvE910PS4Guc6gXcfo4YPRGGiQr7lQlEz8Q201je4xzxSt9yQDl7p
 txJns9ytOdaTpLqs0DBeTrtLHIlIowuFh91Ylm2rfmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=i7HBmz
 xid/ci7fk+gbb7Mxl+YrDWbK/5oiBZwSKFtdo=; b=Sa24C2bMReuBLUxas1IqsB
 t7aUDg2OcLRo5hBwzT1O/hU+WJDqz5gP3v6s8ziTfuIANB/G7qmGMwXaUkax03Zd
 bIH3jYRQ2GM2EJEBOyZcuP7A9qDHf0tB3Lp2gbNdnKv7uhOt1u+t5vHt0Qzv22Zk
 UvYoBBW0sAWEMceUhydqsUI9Ulo6RNCsm1Gcbi7linSp3+viSn1RzUX6itf5BTgn
 tObmpbNk8JVKJb3thFuYKJrizSuLSoE/J71K+q0H9CTDGT3/M99iik+83YvrycWy
 ORPwwIdCWOHS9w9FQaE0wkzHOaDnBuB6VL5VCc+VIL+BeMh+LwwRwk6cFRMnJK+A
 ==
X-ME-Sender: <xms:Aix6XggI_XoaSRKF1cTbec_S__4Ws_hUKhL7Xb3u3gCW7Xv6gxjBCQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudehuddghedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Aix6Xi_hiquxvOuvSn2hh2bm6t0Ev4R1CVq4EpwP6xkG6H-f7ZZuFw>
 <xmx:Aix6Xp8kpUGnmlgCJGyrT29fExKE_3YhPocZYrvHIBj2wPJZ95M9LQ>
 <xmx:Aix6Xsvw0sz2LWAqfvg33JkDn5xh228gLSdXctVhd1TWNba11nskxQ>
 <xmx:BCx6XkBm-5giGTWGlsOJG8qvnhn90YLLEpzTGbzJvoJqa-zuVlPQSQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 85815328005A;
 Tue, 24 Mar 2020 11:49:22 -0400 (EDT)
Date: Tue, 24 Mar 2020 16:49:20 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Pascal Roeleven <dev@pascalroeleven.nl>
Subject: Re: [PATCH v2 0/5] Add support for Topwise A721 tablet
Message-ID: <20200324154920.sof6pu7eolnhwkrg@gilmour.lan>
References: <20200320112205.7100-1-dev@pascalroeleven.nl>
MIME-Version: 1.0
In-Reply-To: <20200320112205.7100-1-dev@pascalroeleven.nl>
X-Mailman-Approved-At: Wed, 25 Mar 2020 08:16:37 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Mark Brown <broonie@kernel.org>,
 linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0811684612=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0811684612==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6vyavs63upj3cdfk"
Content-Disposition: inline


--6vyavs63upj3cdfk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Mar 20, 2020 at 12:21:31PM +0100, Pascal Roeleven wrote:
> This series add support for the Topwise A721 tablet and it's display.
> It is an old tablet (around 2012) but it might be useful as reference
> as the devicetree is pretty complete.

It looks good to me for the last 2 patches, I'll wait for feedback
=66rom Thierry or Sam on the panel side.

Maxime

--6vyavs63upj3cdfk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXnosAAAKCRDj7w1vZxhR
xeQMAQC1tUnrU73kvtF/6Q8eBOkIo4PsfbA/FzLXnyX9q4izkgD/UhROpt15xFmZ
fjKg+K19nxzSkwcl7IBQrED6L4Ok1wk=
=SI+q
-----END PGP SIGNATURE-----

--6vyavs63upj3cdfk--

--===============0811684612==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0811684612==--
