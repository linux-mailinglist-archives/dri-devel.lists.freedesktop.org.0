Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA922A79CE
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:57:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC2B36E18F;
	Thu,  5 Nov 2020 08:57:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 622386E18F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 08:57:04 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id x6so747470ljd.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 00:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=ejnwyGoimynFoAlD3BIiRaCoFWukkEzVSUhcx7Nqcbk=;
 b=KNin3+Yjoo2S5QPFSjpkapLWhp+bF8RC4HZHTQCIQnOUk+bnGiXpXEONJQJzv6JL16
 vmLpNG7zc9tHafPEwazrCe2CIprvfGfCPKhKXmckORXjEZQ9ze8kTJSWlNb570v87mU8
 lWbe5hDpfQakLXToVX/Z1Ixxdp6Ld/Ga32rh41lLU4qBwQBiy2txdUG44Ep5xUrycWpe
 sPwgtkxl4am1C5t/VZs6Ia7zoDWjiAJsSF1LHk1tuVOt8J4z81GpUqB3TVr5o6aidXQk
 dz9mqfuQu+bbLEYXSzxJVLmYpVdO/gQSflnklVC+u9vUX0heXpJcqNUrJ/paEjsp7Mnn
 ur6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=ejnwyGoimynFoAlD3BIiRaCoFWukkEzVSUhcx7Nqcbk=;
 b=pgsuvuk+LmOXHOJarlBPP8+RV5SKh738nHK10dAIAQ+ID3/lToCVHSZbzv3ZfLaeZG
 hYYm8O03yCHSOpIJb8iEbFqhxpTjBc8L5ZGm3qA+GxSoZ16jDrLMvRO3vP5T/1Mcvaaa
 dAs2s1ElFFlQhI/nq5WyjBQmgvHBf5IjGjc7wg1ZeQ5iyBx4FsBOzHbqGGw/g6XXTjDP
 xh5hgFEhH8eWFyscQndzPhkQpb1I0pEV/61L3436c9w1A4h8TkK7c0LHxBFy9J9vcdE2
 k5/OM6SjXp7rHZMrb1gkc2AkWkTozb+X1CKkOvQNLRQd5L7Icrzljatx1+Pcy02I1YME
 J+Yw==
X-Gm-Message-State: AOAM530cM0fk6wY3K6lkEmA0uHbyF2sGwrm1EOH23IbIu/iDVUo8u4Cv
 F98AjaCFqBvbrjbbgvGdZts=
X-Google-Smtp-Source: ABdhPJwmdVd5NKKd4nPHgTdOqllOE9w7wl+5ugeoSeQ/Jb05PqtEWtTfUvXzDS+wq6EGIRnhCgsT/g==
X-Received: by 2002:a2e:151e:: with SMTP id s30mr555137ljd.44.1604566622845;
 Thu, 05 Nov 2020 00:57:02 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id u1sm115832lfk.130.2020.11.05.00.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 00:57:02 -0800 (PST)
Date: Thu, 5 Nov 2020 10:56:53 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2] drm: document that blobs are ref'counted
Message-ID: <20201105105653.07e806c5@eldfell>
In-Reply-To: <wgav99DTGfubfVPiurrydQEiyufYpxlJQZ0wJMWYBQ@cp7-web-042.plabs.ch>
References: <wgav99DTGfubfVPiurrydQEiyufYpxlJQZ0wJMWYBQ@cp7-web-042.plabs.ch>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0670131794=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0670131794==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/92or1WpTZ=1t24BdsOD8.iD"; protocol="application/pgp-signature"

--Sig_/92or1WpTZ=1t24BdsOD8.iD
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 04 Nov 2020 17:01:40 +0000
Simon Ser <contact@emersion.fr> wrote:

> User-space doesn't need to keep track of blobs that might be in use by
> the kernel. User-space can just destroy blobs as soon as they don't need
> them anymore.
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Signed-off-by: Daniel Stone <daniel@fooishbar.org>
> Reviewed-by: Jonas =C3=85dahl <jadahl@gmail.com>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  include/uapi/drm/drm_mode.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 863eda048265..5ad10ab2a577 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -924,6 +924,12 @@ struct drm_mode_create_blob {
>   * struct drm_mode_destroy_blob - Destroy user blob
>   * @blob_id: blob_id to destroy
>   * Destroy a user-created blob property.
> + *
> + * User-space can release blobs as soon as they do not need to refer to =
them by
> + * their blob object ID.  For instance, if you are using a MODE_ID blob =
in an
> + * atomic commit and you will not make another commit re-using the same =
ID, you
> + * can destroy the blob as soon as the commit has been issued, without w=
aiting
> + * for it to complete.
>   */
>  struct drm_mode_destroy_blob {
>  	__u32 blob_id;

Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/92or1WpTZ=1t24BdsOD8.iD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl+jvlUACgkQI1/ltBGq
qqdGjg/6Ay+QUiEa8wKpgWF1eX/TclTwxTMjg73B2mZAL9g5bx0+GbGvo7K+oaoB
kfN5ZhLOaaLGIdmG1pvnk/nan2S9sRMfy8sBr0mVk17AL1PcJdolaXXLLymyV0BY
NHK1zFvQ+tgr2nlfPyX3MrLwDj3x+OY7KU2OL/Fyk5I8gfyEm3QWhJPOas9OnpfG
yZshwrHwya6yLyjsRd0toKHm7Vbuc7UrqeDDdnwy47TF2bCfoGdwZTtBo/KcGuMa
3sDXhgBV9X53QCSzbdXxHh3u4OOMAUlU7DI8LglIFK6MtJ9P2B7JSiBAJzqSDAzW
j+TUb+2CYucqrs0jARKZtyTDCqdmydfOzvc0xnotqABjozgOz3sam+lQV3CmPbR+
y3jH7fSkrtjmRRo2zlkhp2gQs6Dd5X1/LebqEj/RTeuYJUGzxAj5JYpNWVWtSbeY
oK9sxQ9NKyfDWw9eG0og3utj5kv8Xs+0xaSr+PFXnFUybfRKEy5cc3M+txAsQAlT
TWs8KEMQpevzouJylBIS7tLH3KhQSUgQzupBUxpc8tfl7k0Zz7Hk3Rbe5UtEctKW
4gRdMVxfKbRD7Z7ARvb0+L+PgbAl0rXe2h1GiG8FviiQdQZEXaP0pt0TwvaQn2Mk
0nDaD/bVs6d8/+d1B7agWA4CPenj+IaabCnK4EPHSWkJy2vN8MA=
=IfM6
-----END PGP SIGNATURE-----

--Sig_/92or1WpTZ=1t24BdsOD8.iD--

--===============0670131794==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0670131794==--
