Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B35CB3CB714
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 14:00:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C91316E973;
	Fri, 16 Jul 2021 12:00:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2249E6E979
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 12:00:27 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A63E21FEA5;
 Fri, 16 Jul 2021 12:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626436825; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JTRubu0eZEv409XqsnW1wuADtn90/+TKHJpDTfuvclM=;
 b=t9+TLKkyg5jKjgXAb2F8v66hb2Zb4Z0On1z4utziWpcLRSV1+BVi5GVnWiMEvc2QbKXHTS
 rarFJwUCPgFFm0sp+sI4bGKNLXCyvsvkVEIL2G5Gq7icUcFIkLA6c35QoFME0F6vmnjhJx
 Zxy3p9o0LYZjKBW/A7s3Pe0sqJId7y8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626436825;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JTRubu0eZEv409XqsnW1wuADtn90/+TKHJpDTfuvclM=;
 b=fjiDoxL5H0rwZEakP1ngPUX5VJsAKUkeWW5mZAAclvGMzOZUc/P5Yu7vOF46VcCaewvlrp
 AEFPcUkKDre8bXAQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 730E613AE3;
 Fri, 16 Jul 2021 12:00:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id Py8gG9l08WB0KAAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Fri, 16 Jul 2021 12:00:25 +0000
To: ainux.wang@gmail.com, airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch
References: <20210716095522.27187-1-ainux.wang@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/ast: Return value when do not get edid
Message-ID: <227ae846-c8a4-876a-2d4b-363aec33eca9@suse.de>
Date: Fri, 16 Jul 2021 14:00:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210716095522.27187-1-ainux.wang@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="B1DyJn3fpN0zYW5PO7lGVCFzo3xJlKGYK"
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
Cc: sterlingteng@gmail.com, chenhuacai@kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--B1DyJn3fpN0zYW5PO7lGVCFzo3xJlKGYK
Content-Type: multipart/mixed; boundary="TVYTv3su6wzZVQkBwR0vuSWGL6u5V1HAx";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: ainux.wang@gmail.com, airlied@redhat.com, airlied@linux.ie,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, sterlingteng@gmail.com,
 chenhuacai@kernel.org
Message-ID: <227ae846-c8a4-876a-2d4b-363aec33eca9@suse.de>
Subject: Re: [PATCH] drm/ast: Return value when do not get edid
References: <20210716095522.27187-1-ainux.wang@gmail.com>
In-Reply-To: <20210716095522.27187-1-ainux.wang@gmail.com>

--TVYTv3su6wzZVQkBwR0vuSWGL6u5V1HAx
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 16.07.21 um 11:55 schrieb ainux.wang@gmail.com:
> From: "Ainux.Wang" <ainux.wang@gmail.com>
>=20
> There is should a status when do not get edid.

Well, not really.

So, the problem is that VGA is not hotplug-able. It's supposed to be=20
connected when the computer gets switched on. And there's no interface=20
for sensing the connection state.

But in practice, the cable can be attached/detached at any time. Reading =

out the EDID is the non-official way for detecting the connection state. =

You either get EDID data or garbage, where the latter is interpreted as=20
'disconnected'.

But really old monitors (maybe mid-90s and before) don't provide EDID=20
data. For those, DRM adds standard VGA modes IIRC. And they would likely =

be detected as 'disconnected'.

I'll merge your original patch '(r <=3D 0)' and anyone who's stuck with=20
such an old monitor can probably specify a compatible EDID on the kernel =

command line.

(I'd like to hear other people's opinion about this TBH.)

Best regards
Thomas

>=20
> Signed-off-by: Ainux.Wang <ainux.wang@gmail.com>
> ---
>   drivers/gpu/drm/ast/ast_mode.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_m=
ode.c
> index e5996ae03c49..05df48b3d223 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1231,8 +1231,10 @@ static int ast_get_modes(struct drm_connector *c=
onnector)
>   		ret =3D drm_add_edid_modes(connector, edid);
>   		kfree(edid);
>   		return ret;
> -	} else
> +	} else {
>   		drm_connector_update_edid_property(&ast_connector->base, NULL);
> +		return -ENXIO;
> +	}
>   	return 0;
>   }
>  =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--TVYTv3su6wzZVQkBwR0vuSWGL6u5V1HAx--

--B1DyJn3fpN0zYW5PO7lGVCFzo3xJlKGYK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDxdNMFAwAAAAAACgkQlh/E3EQov+Bd
Hw/+MxQbE3K4mYlLdfsTwXbnvNPJq0vws9PUzBs+vOytHmSCwj1D5+zxe6TtFD2Iv3sKhvAv5qN5
RCCzbsmgZ0rEzGVUqZ6ctS8VnoDx9GIFNCvk5nyxgJpMXI6udKU9gz8LCbVptCZCPOwbsTeiIFjn
DqcSHQaHB0gICPYuOo9JCnPZ7hFFk4Ju9jbez4L5abydaGl78x6Mqg9JvDTTMrtTh8BRj0PuWfN6
EVGf1+wuP92JBhLykhGqUEHqoYtH9BmAfvd+wYjC7KEnSFC0ZqTjMz4LY7ANiRN0aTe2DrvlSDRV
uX+D0ks7Zh0avbZtXzM9Fk+C3lFvAMEgiqs+TZfVYItesbbjO3JgDOy+d0E0/R07yeD3R9px3t0+
psl6beBML5S+8xtWpgq1Bv3RFlEaQ96bbw1qrlCSfcEUJfQvzCMBc2vv3t6bQttuPJ2+AwySOt5I
TMZ27enFtSj6esPJXIXQp4a/2H4+3b9UgVk5PGxfpF3susUqW+72IBkqSYx1Z3vdn3XLVJjfS5y4
WC+sVaLieeZl3EjpGI+YYAbTUphg/Tyy0s/sPDBr99qJItLFD4dTZSJu3XL5xd5bcP72z2djZYIg
MVSvPYhNOCVFW56ZUmW/BFuEheKc8oFuXGMvv6XVoXF1l4L6ZfNUy7eJlC3V1osP1OTt2mti6aBU
zcM=
=td2o
-----END PGP SIGNATURE-----

--B1DyJn3fpN0zYW5PO7lGVCFzo3xJlKGYK--
