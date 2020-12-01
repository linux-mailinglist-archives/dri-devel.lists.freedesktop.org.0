Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A54D2C9A49
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 10:01:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A8F89E8C;
	Tue,  1 Dec 2020 09:01:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7835C89FBC
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 09:01:09 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id f24so1597418ljk.13
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Dec 2020 01:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=1+tnGazrLA8NlwxHK7cX6F++OX21pWD8sYIkKeBIvY0=;
 b=bWZIrWNSQcRKO7Xmmw2TAcAlF6BfcVXURUcHZ0H/+3P5vFERaoirxwIoZ2RbZ/HoqO
 g0S92Gw0C+wNNMFSdzIh7aI3dKaC2qUQPFxojEvmWAFc97Ufi/jvI/tr8JUUlYtn53TI
 5U7nkKjuWoU6xjYxugD9jV0CVon2pJkPEYQXkCGdrpoP+FcG7Xac+8kdzwbfXe6BJxdX
 K4cX5e6RwPdiNT6QkqQCiMs9CHBrFPIu7Rb0JjBcrpvbJ4xpSF0G/Vy3vkOGVjAoyBN5
 zUmrVKpTZlHEe7yCKJ5wB9B1ot/4BUaRG/xWjNPs7/GEdGSWBQwOHu12BJIuVg4gpfkP
 tlBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=1+tnGazrLA8NlwxHK7cX6F++OX21pWD8sYIkKeBIvY0=;
 b=Zg0NDVG1E0YUtp+Qa9E1t+3qR8AUFh6XnFHXIDB5SZ4yBO+PaoQgn2rt8RTmd8Wi7J
 /ra5sCNtgGE5OGfHY9Lzylgoe/LSBIdrW4kVLKmF00+yL0B3PWyZNBkLsJJ+DwIdt+1U
 verryB0jI/s+4pa9GdAe92tlXl/bn/3zshzofGElTdIMKugE06tnWKdLvp2duA4jU2iV
 Wj+pnw13cijgRdWhMsQrwE7FlCKbFbiktCGG1nT+lzYKXMs4LrcdNrw2BM5EP+I9+5Kl
 aSwPDbQwjM3UIDj5JOzVBgBApjunTflXnqx7gx4njaWST8UTHvIhumJw384Ku56XdVg7
 1klA==
X-Gm-Message-State: AOAM532u0o+bYmhHDGl7hsWx8mAPyBN5fMwc6+parw8kZPBzpLrymob9
 lpGwfHN3cvx3f586lWQ82P4=
X-Google-Smtp-Source: ABdhPJyWUpwIYKrHWYNnYnfO5YVqhZBZJ1lGWF0RgS0IObwqSjPQOadMazk4v0hJUxPNPOWUbMmI5w==
X-Received: by 2002:a2e:918a:: with SMTP id f10mr796125ljg.156.1606813267893; 
 Tue, 01 Dec 2020 01:01:07 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id t11sm129846lff.253.2020.12.01.01.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 01:01:07 -0800 (PST)
Date: Tue, 1 Dec 2020 11:01:04 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2] drm: document that user-space should force-probe
 connectors
Message-ID: <20201201110104.0d95f0b9@eldfell>
In-Reply-To: <AxqLnTAsFCRishOVB5CLsqIesmrMrm7oytnOVB7oPA@cp7-web-043.plabs.ch>
References: <AxqLnTAsFCRishOVB5CLsqIesmrMrm7oytnOVB7oPA@cp7-web-043.plabs.ch>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1814637198=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1814637198==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/L4SMX9k9ld_73ZPmKVxV2Pr"; protocol="application/pgp-signature"

--Sig_/L4SMX9k9ld_73ZPmKVxV2Pr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 30 Nov 2020 16:26:12 +0000
Simon Ser <contact@emersion.fr> wrote:

> It seems like we can't have nice things, so let's just document the
> disappointing behaviour instead.
>=20
> The previous version assumed the kernel would perform the probing work
> when appropriate, however this is not the case today. Update the
> documentation to reflect reality.

Hi Simon,

yeah, this message actually explains something. Good.

> v2:
>=20
> - Improve commit message to explain why this change is made (Pekka)
> - Keep the bit about flickering (Daniel)
> - Explain when user-space should force-probe, and when it shouldn't (Dani=
el)
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Fixes: 2ac5ef3b2362 ("drm: document drm_mode_get_connector")
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> ---
>  include/uapi/drm/drm_mode.h | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>=20
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index b49fbf2bdc40..1c064627e6c3 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -414,15 +414,12 @@ enum drm_mode_subconnector {
>   *
>   * If the @count_modes field is set to zero, the kernel will perform a f=
orced
>   * probe on the connector to refresh the connector status, modes and EDI=
D.
> - * A forced-probe can be slow and the ioctl will block. A force-probe ca=
n cause
> - * flickering and temporary freezes, so it should not be performed
> - * automatically.
> + * A forced-probe can be slow, might cause flickering and the ioctl will=
 block.
>   *
> - * User-space shouldn't need to force-probe connectors in general: the k=
ernel
> - * will automatically take care of probing connectors that don't support
> - * hot-plug detection when appropriate. However, user-space may force-pr=
obe
> - * connectors on user request (e.g. clicking a "Scan connectors" button,=
 or
> - * opening a UI to manage screens).
> + * User-space needs to force-probe connectors to ensure their metadata is
> + * up-to-date at startup and after receiving a hot-plug event. User-space
> + * may perform a forced-probe when the user explicitly requests it. User=
-space
> + * shouldn't perform a forced-probe in other situations.
>   */
>  struct drm_mode_get_connector {
>  	/** @encoders_ptr: Pointer to ``__u32`` array of object IDs. */

Sounds good, err... accurate to me.

Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/L4SMX9k9ld_73ZPmKVxV2Pr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl/GBlAACgkQI1/ltBGq
qqeSMg//aEp3vfanVPr1qQUM1j/8z01zjwCO19GKvLRAQ8oYQOJvDda1oMZRrqy4
KC9qpoCz5jV31kW1liZ6UlhiZLERZt0kSGCV6PveM4Ew7r7yWkX6Zj579Toapyn4
MUpjKk7bI+llDuQ6SCRi5hxi9CiVsPnYLXgx74yivCxjoPfhbLZYLZ61LYiGXGiV
TyuO09KAuZMGqZ7n1uT0jyOljMRedDTjxlqIc/RVcdQZvgMKsTn/WCKiJeZhnT0X
CSknqLBtb97qA3kKKyp/kRY0eB1Aj/slo08h4TN4fTtBbzbv9cSh9NQMDtTsolFK
ufLMgApzA6SP5HvJFmskktDw2X2N4lYPqxT1RNwAvoWw2/UUS/j6V+1XJ/84yLOL
JMeW4WO4uc7frPRJSX8RKOV1bc2FIUeHkyJ9Jazr6tzSrPqgey+v5JzkGCmIn4/c
NlFERn9/kAaX+ZQGEHh/gsaVzJF8SiJ3unIHxBD3/nBlZcAB5dBMmoEDb/UNHJUU
t3ukTzTWgMSpbAI9x7pLNIkmKyXio64ZcDD7C8NfdwM6Ib6LX2mtC66NxKfYkA1P
3tKem4BL/+s27+OuUmHMui8kkK7FjP0c8eNdpNpJXeuz6QIuPu/Xo3tP5T9zYRpo
e85EdI0VO9put7YZmbzOJavgpE0/zPQo7Zf4R1nZ78ucCA0HmWk=
=zYa/
-----END PGP SIGNATURE-----

--Sig_/L4SMX9k9ld_73ZPmKVxV2Pr--

--===============1814637198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1814637198==--
