Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6B32ECBF0
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 09:53:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75566E415;
	Thu,  7 Jan 2021 08:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E7FF6E209
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jan 2021 15:01:14 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 63103580598;
 Wed,  6 Jan 2021 10:01:13 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 06 Jan 2021 10:01:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=pq8hbaVaGOc5OfRuGXlFeZiorUD
 Bn36VjDYOTFbKyxs=; b=ShorEpq6Yy/xlS5QvMGkj+VfDauayX3AdBUr1HljprH
 epgaFW4HMvXaU2fu/f4XvWkSl7WdtKSZ4vM6vgzLQGhMhv+jfigzIs78kLH3KZnA
 8GiFsnbb3VoKHbh8vV1B5VKSDGa9Dq9WGAe5hrYOQpjTMNyjRM598D0xRrwtKAYY
 pyc3Byv2GEC/G1is55ynRXo18eQHBrFbtCyODpd+IExfrBd82tffr8lMJPIVSNRE
 LUmpvtYBmRaN4buNBJBlyPY3E7NeBnc2a+XVfoZDmZqIcDO1PQ5YVEeVAtqymKXD
 DkvX8hITuI6W7EoN9i962AkZNhE2Ghp6zeU2SJJyMRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=pq8hba
 VaGOc5OfRuGXlFeZiorUDBn36VjDYOTFbKyxs=; b=G2+/xdgGTg+7Sb7rGZlocO
 WELj2rOd0jxhZESLpr2idKjVFSpNX+VDdTSrcge64TtopX1VwY4dbEXhg3PoU1BD
 6VUNVYZ6sSe1OC7eye6YnPU/GFzOqKcrBpmkYoTsQSHby3t/9e6z6h8KDa2illXt
 fxGG5KYR/Ubt/XKs4yjJdU4/mtopFR/0iNKXrcT4imw8eL3DpOh+4H4GtVbE5JSp
 djl4fPO7c01hpjfoNI9lpzUkCKTtQ0WgAZ21mb4xuGFhc9DINe/PjYVGLDo66nUO
 QLjt5jIvY7ASaUeKOS1VvTwqBI15dGNEdpxK+YmBOd7hIyAdQJqPrFzfLAPmRNPg
 ==
X-ME-Sender: <xms:ttD1X6DuimkHB60BlhDYf2Kx883cy5xRN-1AAf-yBoF9WgPa_ZOn_g>
 <xme:ttD1X0h2AcYf0LyeV6my4J48yRpLTVvT3-bvHAJO25R6T9MDjrniW-rVdLMItihow
 wZ1upqMtkoyi1ipZls>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdefledgjeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ttD1X9lkpBBbiHitDcxmiFduqUaKPEon7-5KIsw_nkro4S_XFnPDJw>
 <xmx:ttD1X4xSiTOqPMceL4g2WaOdhoTu1fw1MebvYOP-ddFQ2r9S_AJKtg>
 <xmx:ttD1X_Sx9Q42PxnPp-eI8qgLlWhuKJsV8P2KWAN27artatgz0DLSpw>
 <xmx:udD1X6E1isxixEyjuMJrjLeRlHORYUcCpiZS2qLNX6btlbvyJ329ig>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 999F0240066;
 Wed,  6 Jan 2021 10:01:10 -0500 (EST)
Date: Wed, 6 Jan 2021 16:01:08 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH] dt-bindings: bcm2835-vec: Add power-domains property
Message-ID: <20210106150108.cjb35gbbystmgnhe@gilmour>
References: <1608751473-12343-1-git-send-email-stefan.wahren@i2se.com>
MIME-Version: 1.0
In-Reply-To: <1608751473-12343-1-git-send-email-stefan.wahren@i2se.com>
X-Mailman-Approved-At: Thu, 07 Jan 2021 08:53:13 +0000
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
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: multipart/mixed; boundary="===============1052659383=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1052659383==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dezckgshvmtg3jl4"
Content-Disposition: inline


--dezckgshvmtg3jl4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 23, 2020 at 08:24:33PM +0100, Stefan Wahren wrote:
> Adding the missing property power-domains to the bcm2835-vec schema to fix
> the following dtbs_check issue:
>=20
> vec@7e806000: 'power-domains' does not match any of the regexes: ...
>=20
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--dezckgshvmtg3jl4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX/XQtAAKCRDj7w1vZxhR
xYwJAQCFCpfWlhu2SNIDx7JiCMtTUmYbKRmrMFZyFMWDRnbUnAEA/L1wi9hHHfaU
2PEhQ+98gvY1IRnS+Qe0CplsaAWh2AY=
=iFbb
-----END PGP SIGNATURE-----

--dezckgshvmtg3jl4--

--===============1052659383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1052659383==--
