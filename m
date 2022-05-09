Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B748151FEBA
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 15:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57BE210E2D8;
	Mon,  9 May 2022 13:48:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB07510E2D8
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 13:48:30 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 9A07E320092E;
 Mon,  9 May 2022 09:48:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 09 May 2022 09:48:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1652104106; x=1652190506; bh=3e5pRSL4nu
 5eGrvENtFi20xsUaRnMtdktTMgw7m0tkw=; b=H/bezbk+9aGlACifYoX0yu7ZWl
 29qvJQLBlet1iHJ0G7SiP+ftnsCghbE2CtovDZlh+DNFY+KFFbJODpasFdSgcgfO
 aXoIwXWc2hpUapv5iTXXpg/nTlktagah/hjJyxKBJknPMYDd/Q83b6ObAJMtchWe
 PKRbpNwbiipwuiDLDJAIfh1V6kwdLIQcqPAdH+DLvmPsNYVIE9mslJcBYCDlemtR
 k2oar53OC1GqAsaVz3aN+zy6LBmi2XldRhc+ifxIIUTH7XfqmtZFKIRog8YmicrJ
 lOyDd46B2h40sQNjuRT/rnyRxFy0ORsgzg0L5t6wZn4fQjamMpMBRmxHfb0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1652104106; x=
 1652190506; bh=3e5pRSL4nu5eGrvENtFi20xsUaRnMtdktTMgw7m0tkw=; b=l
 FcCQkX2JCmrmH/W03TA6qxe91G6eIskGmvFJTuVmD9eXtrcCVfDvYoBHryapx2sW
 I7ZccsavnfG2amor6IlaZMyMiY7/3ZTdqmYV6hei/vgWst4dksQhN1wXthHT6qQr
 7iUWfIkhmPUVsFt1xMoRjAD+bdci/u4+0RHPSLKrNDirKLy3lf2b9cIkNiXix1Oc
 zzjqT3X1EW4L62TOAqBg0czo3Xk7RvDY0ZiLiH8YPEobjMur+o7O5K1dDIO7kJJp
 f1fPWOdP+MqIVooX/lyc5jL2sOSFaVmR3+4NnyPBXcd6Z9ZMOjltmiyw2/BaYkaA
 0wCb2OZIkK2dElEm56S+Q==
X-ME-Sender: <xms:qRt5Yo_WUGbO1g2znlcjQr8lupMQPDCDT_gpXTs5fFOMJJxRQOy18Q>
 <xme:qRt5Ygvx-Ub6Y1KFNIDD7K-5s7_MgVbI7U6rgIzpF89hkdvFckiAa5JvKu95SWTl7
 t4kLlgJw004k1CMZKI>
X-ME-Received: <xmr:qRt5YuDbf3518f9R_eDQjwdqaNzRds9eHessJFRaCrO7Ck5XkCaFbIzl72IoyakZmku3AzKZraCfDGMvZ72sTEWk_Jj92YF5-Nv7VUc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelgdeikecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheehfffh
 vedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:qRt5YodKX_PcbEiL9x9wTCD_xi0B_9gSaKmNH1yITl3k8msgktEuHw>
 <xmx:qRt5YtPJPz_pXBvdqYoFoAcaNkpWZ5tSvbxi9wobfhB9eA07X5JsgA>
 <xmx:qRt5Yikd58aSEOFC4HrD1LOYFaZ3syPNuficpEGwSpzVzONITUKcgA>
 <xmx:qht5YgfUvUSMaJVHMNCSF0OTzq_q6Yqm5jyvfiiaYGDcn7GUkXk3Vg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 May 2022 09:48:24 -0400 (EDT)
Date: Mon, 9 May 2022 15:48:22 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH] drm/todo: Add entry for converting kselftests to kunit
Message-ID: <20220509134822.dqrhjg4afp7vwla7@houat>
References: <20220509130846.694397-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="r4276qbvkxdfmdmz"
Content-Disposition: inline
In-Reply-To: <20220509130846.694397-1-javierm@redhat.com>
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
Cc: Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--r4276qbvkxdfmdmz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 09, 2022 at 03:08:46PM +0200, Javier Martinez Canillas wrote:
> Many of the kselftests in DRM can be converted to kunit tests instead,
> since that framework is more suitable for unit testing.
>=20
> Suggested-by: Maxime Ripard <maxime@cerno.tech>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--r4276qbvkxdfmdmz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYnkbpgAKCRDj7w1vZxhR
xap/AQC8MQkqKXlju0gJmPJo9GioFfw21TN3KDNqYkauGunXmwD9G3zqCqtyF8Lc
U5XDJOkzurG86yL9HQReimLsipvf7w8=
=7gSU
-----END PGP SIGNATURE-----

--r4276qbvkxdfmdmz--
