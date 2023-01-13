Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8576166944E
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 11:36:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA6F010E9E1;
	Fri, 13 Jan 2023 10:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9093C10E9E1;
 Fri, 13 Jan 2023 10:36:09 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id D35825C00C6;
 Fri, 13 Jan 2023 05:36:07 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 13 Jan 2023 05:36:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1673606167; x=1673692567; bh=B4xgVGbZP/
 /mPID47KYBQmz2/ryc50GyA9PU/HCj7es=; b=EQP9lIamhGnb+YFu0N+BdtPgTT
 f7LCY+JFCMqiXIoHJf3xOMDA4QvULy+RS/n4vDud72qnaYlXFcGUhSca7eo/kz11
 8vw7HyXypoJMj7HqE+NPaz4UZGOpPJT2W7XWMn7h7i/Ptm37almORI/4iO63cjpj
 PvgYA1o56IwALPzSWJ/3xQdwbTyaz3ayOgV3JpZcKhaKa5MTCDGBF0OIaZdguNDD
 /i9x3cRr2hPCdb5m/qO9Hf4LgkSvKUCq/Eu/xG9Fq0S6xOGYP9j4ZPdDTSqMghDM
 orzNe/f8XHtOsLxVFmT7kq2Nq1SVK2FWPu6Tmj1qSg7K5tdhDPiOYG0ccnsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1673606167; x=1673692567; bh=B4xgVGbZP//mPID47KYBQmz2/ryc
 50GyA9PU/HCj7es=; b=MCSaH7i7lEFjTqeaqYSQdUrrXKgBUZAhoET36saYkLLH
 h2nrVyrTUZmk/giT8ht0cypOivzO48ydrSYAESc4DVaiQT7Dhrl3JWm9rY8vIt6W
 CpnJUWlBvHKSEbuHgstPzApU2DsLlLHaaCvGpO/W8tzq5CdoV+m5ETkFwE/Qb+Gg
 kqhDP0IJJcTXq+Gtcme8CQEfQdax7LCQzLHmKgoGFYUQ0ArMrH6gemuJLRn8q+U6
 Iqev56qTfO9kik29Y+96prZ7JumZdjuuPSSX0Y62pCRlan2PMomeHni1SqvMT/fl
 H01/4qOId/WmzwA5YlHpbjUyc2/NVGN1+2NTx1pgmQ==
X-ME-Sender: <xms:FzTBYx_OmF1qC_nRc4duADYSgCxHiTC9jBExYPWvrqPCeTErP8COUQ>
 <xme:FzTBY1u5yVHQ4d7c3D54Vl9jv0z66sea2MisK66aG8rtq2fefWvBnBeUH67zJQAwt
 i1p6Str1B4ZDfUozaw>
X-ME-Received: <xmr:FzTBY_AFsNC-0qw3y4MDpj2kqGo882l6-BosTfOYOsP4U4Ae6PtBo9HYLR1ci0BoAFUL7MA2b5TmG2z2oydcV2rprrfcAzd7VIunU4zmEKfGvQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrleekgddufecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheehfffh
 vedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:FzTBY1eTa97DFEbgB-U7hSrKi62yQG_ao3X94G3VhXiXONGsARpXbg>
 <xmx:FzTBY2OqpdwRV_9x62MouMI7F4AxxSJ7-TkP5eMnp9rHpWybcRxYaA>
 <xmx:FzTBY3kayTforKEvs0rL6fZ7AEiCeNLTPJXVkSxNYgJC6fb-yOvbDA>
 <xmx:FzTBY7ZXGtH0YRCh31yNOgvtnmrdOQxY4249Lk2GlZWs_ks4evZQ0g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Jan 2023 05:36:06 -0500 (EST)
Date: Fri, 13 Jan 2023 11:36:04 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/5] drm: Do not include <linux/fb.h> unnecessarily
Message-ID: <20230113103604.bh6ey24ehpufwuab@houat>
References: <20230109101243.26995-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="74tcum4n2u6zdlwk"
Content-Disposition: inline
In-Reply-To: <20230109101243.26995-1-tzimmermann@suse.de>
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
Cc: f.fainelli@gmail.com, amd-gfx@lists.freedesktop.org, sam@ravnborg.org,
 thierry.reding@gmail.com, bcm-kernel-feedback-list@broadcom.com,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--74tcum4n2u6zdlwk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 09, 2023 at 11:12:38AM +0100, Thomas Zimmermann wrote:
> Remove unnecessary include statements for <linux/fb.h>. I recently
> changed this header and had to rebuild a good part of DRM. So avoid
> this by removing the dependency.
>=20
> Some source files require the OF or backlight headers. Include those
> instead.

For the series:
Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--74tcum4n2u6zdlwk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY8E0CgAKCRDj7w1vZxhR
xTGjAP0e3aO1L9q/tCCMkUhwmR4mqzeR9hDDwfaljUDORAYpfwD7BE4GRZrFWerW
7C24p9S26l562JuDbNR9BlEAIz6ylQw=
=x8tq
-----END PGP SIGNATURE-----

--74tcum4n2u6zdlwk--
