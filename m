Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F85366736
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 10:45:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FF196E194;
	Wed, 21 Apr 2021 08:45:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B310D6E194
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 08:45:00 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 7F6935C0109;
 Wed, 21 Apr 2021 04:44:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 21 Apr 2021 04:44:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=BJKF3HFMqCDqpikARYsHWbdK2LE
 YC24070F4f1pr7qo=; b=v63pYMcDGlynjONp7XU7QQFjfhnr2CTcEpueax7xVFi
 B7RIprqaKy3G7WYRSDb1YrwelCADiUIXql9jcfqeP7xNh2jmLbQeNeOgf/wc+BCR
 wYeRUWsMOpJnrrZzTgIIqJnCBikTKgxLxURVrVuwTuGBo2Bsmjf2LwoxqfHI3EJx
 8qXAmKd40eezVlVGBW4uCYcN9uTNuUTpSoQ9q2DgKYcPl033R0LQx3SEEpAxOBHx
 3FtPEmP/JcFAabHn+RplHHocSi8Q8twcX2xA/Cl1bHlI1AQmzXaR2EwdeLpfkorV
 340EK4Ep0jJ2FnUfPowKfKKrxSKgbBGJKAe7hjuJVWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=BJKF3H
 FMqCDqpikARYsHWbdK2LEYC24070F4f1pr7qo=; b=KfG13fYaRsPFfnvhTtZZml
 AwHAGF9lUmCdU7/8JGodQBAzCkaT9u0nDWxOP4/5BTJFulN5nIw5TYuNYzD1HMqH
 LRZFLD9YpnMWZ3TDhc3IKV6dNXMwDmvsZYiqrjOXDViy6JjCJ/2fjYIIScpUhbQ4
 lNmO/YKKzUW2OfNlpSokRJUoxs5kcOxb9ZsJs1rMtANkezERrYGcBuVGt3guqxN+
 NmAXLgUV15UzLlPphVHEDOAkwQ31iFjY7QEJy9OLGRblD5BnBb2euTrbCk0hkzPW
 icew2KT87B03aVtjIyHxcsH6zAAL6EHLN7ly81QO/jBuvbSLqYgOCgEMj/HgSIkw
 ==
X-ME-Sender: <xms:AeZ_YP8E2MFZy1WHnkQ5brISu-HaEUwU1u6t2uwiN_tMIHAYRjbfuw>
 <xme:AeZ_YLtWgaJmaAa6L_5KOhlubwRcdgi0PYLwpKsrtGFlnyLtBZZ1TfSWuZhBWCl-6
 yz6_P25gNB9KTFknt4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtkedgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:AeZ_YNBHwnqtCFosCvMNmP38t-U_DhyCn3MFbblN3TqwDdkSCACVVQ>
 <xmx:AeZ_YLff4KkzNrgzzHxw5J5X0TGQgYvyq-eG9Nyol9kmesW8H3wy0Q>
 <xmx:AeZ_YENvtYhS3byqCIiDV0BNtU2cSVM-sISjdoGCSw_jtrIRqHyTSw>
 <xmx:A-Z_YJoVhgh1xyBNaXB7CvppTZvfzoobghNpYoF3xFFO0EjBLG-TlQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4137F1080069;
 Wed, 21 Apr 2021 04:44:49 -0400 (EDT)
Date: Wed, 21 Apr 2021 10:44:47 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] drm/vc4: remove unused function
Message-ID: <20210421084447.5igon4bjxw5la2dr@gilmour>
References: <1618476325-112629-1-git-send-email-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <1618476325-112629-1-git-send-email-jiapeng.chong@linux.alibaba.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1500989285=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1500989285==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="itw6l6a2pxgxfotk"
Content-Disposition: inline


--itw6l6a2pxgxfotk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 15, 2021 at 04:45:25PM +0800, Jiapeng Chong wrote:
> Fix the following clang warning:
>=20
> drivers/gpu/drm/vc4/vc4_vec.c:201:1: warning: unused function
> 'to_vc4_vec_connector' [-Wunused-function].
>=20
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Merged, thanks!
Maxime

--itw6l6a2pxgxfotk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYH/l/wAKCRDj7w1vZxhR
xU5EAQDn5Jd5WIf37k9BdcNfXVCoUDe8Ll/W9Tt9ZIfVy9MLdwEA8hhFwVtkF5yD
vJxGE9kSZJzvaE3614YEzmLa7RlU8QQ=
=O/zW
-----END PGP SIGNATURE-----

--itw6l6a2pxgxfotk--

--===============1500989285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1500989285==--
