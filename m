Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F349F661983
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 21:49:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B4E10E00C;
	Sun,  8 Jan 2023 20:49:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3602 seconds by postgrey-1.36 at gabe;
 Sun, 08 Jan 2023 20:49:50 UTC
Received: from 1.mo550.mail-out.ovh.net (1.mo550.mail-out.ovh.net
 [178.32.127.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4786110E00C
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 20:49:49 +0000 (UTC)
Received: from director10.ghost.mail-out.ovh.net (unknown [10.109.156.62])
 by mo550.mail-out.ovh.net (Postfix) with ESMTP id 48F3E24071
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 19:32:53 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-47dbt (unknown [10.110.103.73])
 by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 82FB61FDA8;
 Sun,  8 Jan 2023 19:32:50 +0000 (UTC)
Received: from sk2.org ([37.59.142.110])
 by ghost-submission-6684bf9d7b-47dbt with ESMTPSA
 id suVQGmIau2PZhg0A1/aQ0w
 (envelope-from <steve@sk2.org>); Sun, 08 Jan 2023 19:32:50 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-110S004d95a66cd-0637-4714-9dc0-8c81f479a7fd,
 5128B599F7D401446F64D4771BE19AB2B9CD7A8B) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
Date: Sun, 8 Jan 2023 20:32:46 +0100
From: Stephen Kitt <steve@sk2.org>
To: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Subject: Re: [PATCH 15/15] backlight: backlight: Drop the deprecated
 fb_blank property
Message-ID: <20230108203246.3ca507df@heffalump.sk2.org>
In-Reply-To: <20230107-sam-video-backlight-drop-fb_blank-v1-15-1bd9bafb351f@ravnborg.org>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-15-1bd9bafb351f@ravnborg.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yBkUQ5TN6WQX1gLgYbjZw/r";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Ovh-Tracer-Id: 1901926421308278406
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrkeeggdduvdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfofggtgesghdtreerredtvdenucfhrhhomhepufhtvghphhgvnhcumfhithhtuceoshhtvghvvgesshhkvddrohhrgheqnecuggftrfgrthhtvghrnhepfeffgefhgfeuueeffeejieefieefgfefffethfdtudegvdejueelhffhfeegjeeinecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdduuddtnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshhtvghvvgesshhkvddrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdpoffvtefjohhsthepmhhoheehtddpmhhouggvpehsmhhtphhouhht
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-omap@vger.kernel.org, Antonino Daplas <adaplas@gmail.com>,
 Robin van der Gracht <robin@protonic.nl>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, linux-staging@lists.linux.dev,
 Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Jingoo Han <jingoohan1@gmail.com>, Paul Mackerras <paulus@samba.org>,
 linux-fbdev@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 sam@ravnborg.org, Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/yBkUQ5TN6WQX1gLgYbjZw/r
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sat, 07 Jan 2023 19:26:29 +0100, Sam Ravnborg via B4 Submission Endpoint
<devnull+sam.ravnborg.org@kernel.org> wrote:

> From: Sam Ravnborg <sam@ravnborg.org>
>=20
> With all users gone remove the deprecated fb_blank member in
> backlight_properties.
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> ---
>  drivers/video/backlight/backlight.c |  2 --
>  include/linux/backlight.h           | 22 ----------------------
>  2 files changed, 24 deletions(-)
>=20
> diff --git a/drivers/video/backlight/backlight.c
> b/drivers/video/backlight/backlight.c index b788ff3d0f45..9b0557d094c5
> 100644 --- a/drivers/video/backlight/backlight.c
> +++ b/drivers/video/backlight/backlight.c
> @@ -118,14 +118,12 @@ static int fb_notifier_callback(struct notifier_blo=
ck
> *self, bd->fb_bl_on[node] =3D true;
>  		if (!bd->use_count++) {
>  			bd->props.state &=3D ~BL_CORE_FBBLANK;
> -			bd->props.fb_blank =3D FB_BLANK_UNBLANK;
>  			backlight_update_status(bd);
>  		}
>  	} else if (fb_blank !=3D FB_BLANK_UNBLANK && bd->fb_bl_on[node]) {
>  		bd->fb_bl_on[node] =3D false;
>  		if (!(--bd->use_count)) {
>  			bd->props.state |=3D BL_CORE_FBBLANK;
> -			bd->props.fb_blank =3D fb_blank;
>  			backlight_update_status(bd);
>  		}
>  	}
> diff --git a/include/linux/backlight.h b/include/linux/backlight.h
> index 614653e07e3a..c8622d6cc8c5 100644
> --- a/include/linux/backlight.h
> +++ b/include/linux/backlight.h
> @@ -218,25 +218,6 @@ struct backlight_properties {
>  	 */
>  	int power;
> =20
> -	/**
> -	 * @fb_blank: The power state from the FBIOBLANK ioctl.
> -	 *
> -	 * When the FBIOBLANK ioctl is called @fb_blank is set to the
> -	 * blank parameter and the update_status() operation is called.
> -	 *
> -	 * When the backlight device is enabled @fb_blank is set
> -	 * to FB_BLANK_UNBLANK. When the backlight device is disabled
> -	 * @fb_blank is set to FB_BLANK_POWERDOWN.
> -	 *
> -	 * Backlight drivers should avoid using this property. It has been
> -	 * replaced by state & BL_CORE_FBLANK (although most drivers should
> -	 * use backlight_is_blank() as the preferred means to get the blank
> -	 * state).
> -	 *
> -	 * fb_blank is deprecated and will be removed.
> -	 */
> -	int fb_blank;
> -
>  	/**
>  	 * @type: The type of backlight supported.
>  	 *
> @@ -366,7 +347,6 @@ static inline int backlight_enable(struct
> backlight_device *bd) return 0;
> =20
>  	bd->props.power =3D FB_BLANK_UNBLANK;
> -	bd->props.fb_blank =3D FB_BLANK_UNBLANK;
>  	bd->props.state &=3D ~BL_CORE_FBBLANK;
> =20
>  	return backlight_update_status(bd);
> @@ -382,7 +362,6 @@ static inline int backlight_disable(struct
> backlight_device *bd) return 0;
> =20
>  	bd->props.power =3D FB_BLANK_POWERDOWN;
> -	bd->props.fb_blank =3D FB_BLANK_POWERDOWN;
>  	bd->props.state |=3D BL_CORE_FBBLANK;
> =20
>  	return backlight_update_status(bd);
> @@ -403,7 +382,6 @@ static inline int backlight_disable(struct
> backlight_device *bd) static inline bool backlight_is_blank(const struct
> backlight_device *bd) {
>  	return bd->props.power !=3D FB_BLANK_UNBLANK ||
> -	       bd->props.fb_blank !=3D FB_BLANK_UNBLANK ||
>  	       bd->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK);
>  }
> =20
>=20
> --=20
> 2.34.1

Reviewed-by: Stephen Kitt <steve@sk2.org>

--Sig_/yBkUQ5TN6WQX1gLgYbjZw/r
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEnPVX/hPLkMoq7x0ggNMC9Yhtg5wFAmO7Gl4ACgkQgNMC9Yht
g5y/2w//YCUl1TkgG93owd5rHJe5atRiC7gzYhi2cXiLb4frAyT/Sq738el5nh/Z
6/kSEgZzvvj/iz1dFtHOpIyTANzgs3yBsojNX4ho8fkvt3J/dAKj30B14B0mJs0P
mLGiJUxnW0fDk+fMdFcZnLoy2gf9urLiFq/p96r0lSehWJPXDisX/Me4DYjzbJq4
UlhEPo4j3lqG8624kue9o8gTptP07mUVVs3O3dGvwTFXWw8PJmnyg3nsQ+rgpXUq
iPbugQwwQf4AAnJQJ7UfYYeKEu/I5edKumccCgWwOC/oIh6JcJ9I0C1UUz2g32YD
IU24rf9kRptTdECdkIHPD4h8EHN4PZa5IFKEQ6xXBb7vpyxCEMiuXw2ey3UcRLc3
K/lsX1EBfzGEIgPVH0uSPyFyoIHrz8azEL2p9Eq+DnZfF5UKhXHFFQiL5vAVECiH
RupGAdt83VvLAw4l7Lz2Pi3yFs109SBqHcM/mVQTVEn2Zl+0xmjrywo3Avnh2ECw
87e12iSv8J2QckPFlzQDVHrmnNqk5Ue9dTLiYDnMW4aiYxVsiHzEC6cXlQtiOofE
MS0UF5PBVgSc1BXa6v9tSVoHsPSNh/GWRTY6Mm74AHKjIxsOy/tLf9KFyDP+Lt2e
M5T4OHPlMrKyE5e0ULdVRc9fF50cFsb/jbJHbdPiZ7lIKlKVUko=
=PJeH
-----END PGP SIGNATURE-----

--Sig_/yBkUQ5TN6WQX1gLgYbjZw/r--
