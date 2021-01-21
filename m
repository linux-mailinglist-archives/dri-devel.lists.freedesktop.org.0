Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A612FFE83
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 09:46:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4B36E9BE;
	Fri, 22 Jan 2021 08:45:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCDE46E419
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 13:21:58 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id E98425C01BC;
 Thu, 21 Jan 2021 08:21:57 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 21 Jan 2021 08:21:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=ZHkc6P+my9W7RkV8NOgQVCb7k8v
 abyn0b1zxcUQk0xw=; b=ura8Wra1dJEA5DN4WdTn41Rx2GDAO31AZ5xoc6FDrqB
 YQSe7LKnhmIriXt+MsESmRGRhedG5mTeL+5Zqqdxx/P0pZ/n+gVFMBCzjl74Tl16
 QDgb7kaLBoBxho2+ez7e4K3xv+jcf95xMxVjsiW7JrKSfEJ+yxbT16v6T/dxEFG5
 7AfFkP8ax+KHeQfs4E7G7YiEkQYO6eeqbOhJIVygkOH+V45sdebtAFUkji3hCMEJ
 q7Ysx5CNSB1xJbwWOK7gGr2omhcQ0Od8HWHfYAkjWkO+QnrKuzlBo3VrNODB9sOg
 0+nb9Y7/pfiHMdGXym2YX5ln+6CZumTNGQia83f+ahQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ZHkc6P
 +my9W7RkV8NOgQVCb7k8vabyn0b1zxcUQk0xw=; b=Mdamb/qwJqhpYvBPjGKb57
 uGWRxFas7tJiXmQPyQgcJUDYA7b2LWJN5Ulka8BKAPuwsZXpqdaVkPfvKi9HOX3C
 WRnkpVnmmcMmp/5dlhCxH3st65wJ/J7dKAjvNTyWYvwAS8yb48ukzZczk7M4LiFW
 ebbZi+xxjaegb/2/nGFkiQHXhejMLH99Elapt7gUK5hKVkEqK4WOfAIxt8bU7LBG
 flq4oSHHwtsm7QIH8ZaCKIpTvp1rqPPh4Oe9mg5IK4gNzwW3vZ3lR9dNUtlURAJX
 CiTFdFeZLpMfMCMjY+QZZC+U0A54t4Ip4b77NaIiTDDOiN8a+1Zzy668swzOWLGQ
 ==
X-ME-Sender: <xms:838JYOfGSTg8dHQ7A3wm4qQGW2sfAKZZKlOKUgT-Ox42cmDK1421QA>
 <xme:838JYINWBzf1IfBNZrYW3O0Y6lEBykV7biOTYHBfAk5tuxjIeWkY9H7ux8VB5iNWv
 OiFMpVlFtohTOir_l0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeggdehfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:838JYPjf_Vc_4T6ZmT3c5ubANz1QJl48KhMCxTuqfRQ8ZJHwGuBivg>
 <xmx:838JYL-Y1FsU0GBKg-6-dEzXOq45OmOmpiHa-EYyWcv2DlU2FEf-fQ>
 <xmx:838JYKtnGMlP8v5Mn_mKStGXg-8EQRSnDXCjpKkq3dOjS2P2cdVpFg>
 <xmx:9X8JYMLN0zN5Noz9kI6xXf2DJEGTMDFS1wLWm0jIEY3WrvnNoLEbkQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 92A5A1080057;
 Thu, 21 Jan 2021 08:21:55 -0500 (EST)
Date: Thu, 21 Jan 2021 14:21:53 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm: Update todo.rst
Message-ID: <20210121132153.a4kialnb5pnqcaxq@gilmour>
References: <20210121112919.1460322-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
In-Reply-To: <20210121112919.1460322-1-daniel.vetter@ffwll.ch>
X-Mailman-Approved-At: Fri, 22 Jan 2021 08:45:43 +0000
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============1099037309=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1099037309==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fz7orcxuuz6ja4ud"
Content-Disposition: inline


--fz7orcxuuz6ja4ud
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Thu, Jan 21, 2021 at 12:29:19PM +0100, Daniel Vetter wrote:
> Interrnship season is starting, let's review this. One thing that's

  ^ internship

> pending is Maxime's work to roll out drm_atomic_state pointers to all
> callbacks, he said he'll remove that entry once it's all done.

I plan on sending it by the end of the week

> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  Documentation/gpu/todo.rst | 28 +++++++++++++++-------------
>  1 file changed, 15 insertions(+), 13 deletions(-)
>=20
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 009d8e6c7e3c..492768dd2fd9 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -577,20 +577,24 @@ Contact: Daniel Vetter
> =20
>  Level: Intermediate
> =20
> -KMS cleanups
> -------------
> +Object lifetime fixes
> +---------------------
> +
> +There's two related issues here
> +
> +- Cleanup up the various ->destroy callbacks, which often are all the sa=
me
> +  simple code.
> =20
> -Some of these date from the very introduction of KMS in 2008 ...
> +- Lots of drivers erroneously allocate DRM modeset objects using devm_kz=
alloc,
> +  which results in use-after free issues on driver unload. This can be s=
erious
> +  trouble even for drivers for hardwared integrated on the SoC due to

                                  ^ hardware?

> +  EPROBE_DEFERRED backoff.

Thanks!
Maxime

--fz7orcxuuz6ja4ud
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYAl/8QAKCRDj7w1vZxhR
xbBNAQCT9jM8WKqyvw/42DNLaDRsPPsEydq6cj5W8+FtC1rsoAD+OnPiX1PpHJaR
eMMi72xLcI29MLnjZ3se9/MyEotX5Qw=
=/zyQ
-----END PGP SIGNATURE-----

--fz7orcxuuz6ja4ud--

--===============1099037309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1099037309==--
