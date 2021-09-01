Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E87043FD714
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 11:43:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1CE86E165;
	Wed,  1 Sep 2021 09:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A276E165
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 09:43:54 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 6082E5C0226;
 Wed,  1 Sep 2021 05:43:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 01 Sep 2021 05:43:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=tPaaO9Wsip2Db1F49Na9e6nwAhl
 yg/DljRWFcHhYfaA=; b=MUI6wKaH+Q6eJyb4F9yxJlVLHYDLtrZV1DF5cSD86Ml
 0MSFORP9DwlD3lCnCsNunqd8BMZkfmajhXTB3ffl5tDz/S6QytXSAlS2DtsX5zUL
 7SqPSgBlp6SUndMPt+JAxEgCl2lOdcUFDLzvP7sQjfX5zizvEalaKXfKxpD7hoLS
 kxfWBfecGDoaj9JIg41RQi8B1P0CkbCUTQZxPc7ROrlLIkrht6KZZiP0NBj1SoLV
 bXE2n+hcHV0tpcYTKymTCqUNzn+DRmNPjOfju1gzGcm9XrZuoSeTjZqv+0jrpT1h
 9BPtj9E872xuyo31w401VWIhDcxX9LG7JDyvi4fai0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=tPaaO9
 Wsip2Db1F49Na9e6nwAhlyg/DljRWFcHhYfaA=; b=nXU6fk8ywlaTIR487GKrrq
 noTyW3927OmlxQMstqz+wWt7NECFKo+jumAGMaGlF52UnZX70DULtQwKGLwuRLdZ
 kGuFpeapXiqz7Z0jpMstkuOia1t9MnfODm2EFsZkCb4lI62zo6J3TkrU8f1IXhuV
 sfox+gnH6+ej3RGqClEY+Wmq6avGCMLPflXu3XYMrGgx7Oa24cDr0DZz68h6ZIwy
 bkXU/3SMEYWML6hhTvyXqzKur7rVIkeecdOx6uEZ8Y6AMLUegaHC8msaVBnmI1A6
 yCIcvIRMhx6y//AaLQrEMA7iJB9S+INq23LfSOsqRaxVhiVSNuip8ET5cSZNSH+g
 ==
X-ME-Sender: <xms:VksvYY2mxo4ONXJeb-EpwOG8fM8h75oEvXZE0FodXV6lA5U_pusqjQ>
 <xme:VksvYTG0KVzYhxfxchBd9iJQUAbiP8fbON3dM-RL1Ji1Fg1VHnvFvH4Of5s5UhUWd
 sS-FOGrzXsYVHw8Yv0>
X-ME-Received: <xmr:VksvYQ4XMkiQdN3uPN3l9tU96EqXzZCTpeRsgDTmketqnk2lH4Ch8vKyoUZUfP_8tSGrQGRWyCFrbchsrIEVNftClDaQL_MXjQyj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvfedgudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:VksvYR3R1WcdCl4GfcLtCaENcEXhkAq3U5TMrXMtF61qLHLXwDSsMA>
 <xmx:VksvYbHb6XiyskRzO8J3oRPAvGbGWhYV6jRJdMwSNc6O4pqXofjKvQ>
 <xmx:VksvYa8sBh2V3lmKgSndrQBd9mn-B5UQ1JmMsKbspNdWppprL0oqCw>
 <xmx:WUsvYfg4ZHeqFf0N6KINrH6PEjBzDucZBU9QLRjVTU5RFgOIHwXxtg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Sep 2021 05:43:49 -0400 (EDT)
Date: Wed, 1 Sep 2021 11:43:48 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/vc4: Make use of the helper function
 devm_platform_ioremap_resource()
Message-ID: <20210901094348.tbpyn7cygmlt7zoh@gilmour>
References: <20210831135903.4931-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="537hztmt54oz6r25"
Content-Disposition: inline
In-Reply-To: <20210831135903.4931-1-caihuoqing@baidu.com>
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


--537hztmt54oz6r25
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 31, 2021 at 09:59:03PM +0800, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
>=20
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Applied, thanks

Maxime

--537hztmt54oz6r25
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYS9LVAAKCRDj7w1vZxhR
xZdVAQCb8y8BWfgy/CsY3VIjfyQOtwIfaSADdy+WoAdBKGVs2QD9GiCse9sedc9m
Vq+T8eoy/7lBR8i2oBH04vn2bNXqGgM=
=Pvqy
-----END PGP SIGNATURE-----

--537hztmt54oz6r25--
