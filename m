Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A1D4B9CE5
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 11:16:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CCF310F08D;
	Thu, 17 Feb 2022 10:16:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95CCA10F087
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 10:16:17 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id o9so7523478ljq.4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 02:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=Nmn0JSXYFz1hIDL1/wW7UG7AeNYS6zrR/HrLEhvymsE=;
 b=jR5xb9r/gmmYnscXhbvJ2QQFvZ6Ss1wVD9Vgdl8RN+VGj0IvjYWjpCjQnnW2Xp115Z
 33UAKaPW8ddVE9BCglp69WejxAyB3gMkg4k710k7R741WZgG46RUpRvo8i6a6cdxxlhs
 QGM7xHRKGoxZnr/gNaci9GzhUr6ItBwg307/59qxzryDHvTCsTf+RbwTBJjXhBVPgkFd
 hyi2WNIaRGkRHhxMKSARuoTE8ZMGhVhwtlZLDRs5IJu2DSXTXmMWwiD8E3jvvD6BplSg
 0FCWayja7aYhNPGvYJjoAyPzdIwUvuCHQUnvowYB0/MvvyJzWXHPlxppq/yTIq651B13
 zwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=Nmn0JSXYFz1hIDL1/wW7UG7AeNYS6zrR/HrLEhvymsE=;
 b=osI30+ovXLmb+n9WIB2HJX2vG7RAs03R9zb9flYDDy2e6GhbfYQCnrjzukTyUuD2Gj
 mpgfX9JcmChGoOWgdHAB4BtB9eVADb7v3nRmi1N+kUlZfIIJNIlh0QT2s9rMVmSt/HcI
 NfAXC6TWqBiFW9EGkIhPZyGOrCyppgkzKYoCMu1kwPschzQJlKpDbWQPqtOEZ/RB/l+u
 v95JN6KxlvCBCke5VR5oJpZWu2WGdcu1snacSst1ZL8i7f7l1Udve2IB6VaP2D2KGtk7
 mPwHF22z40ZFwbgp/3H1rDMihZQCaxG6C/ZTlJO0Cp9GM2N3UHZX7KNIP8beGzFquyBK
 MXyA==
X-Gm-Message-State: AOAM530ZY0LxDmTrwgEcHD47pLX10l6RJm0A+v612TUKne1+LUjS9/5Z
 5/GLipVDw6N8/C9fMrkRg4w=
X-Google-Smtp-Source: ABdhPJxge2OqSJsRoRKCis0JK1JOOZ0Hr2b1Ohcf8DyG+ZIs9S178aJsxYZE+MEzrO8QphYqbbEt8g==
X-Received: by 2002:a05:651c:c7:b0:244:f9d7:7c48 with SMTP id
 7-20020a05651c00c700b00244f9d77c48mr1800342ljr.300.1645092975792; 
 Thu, 17 Feb 2022 02:16:15 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id t20sm88159lfe.277.2022.02.17.02.16.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 02:16:15 -0800 (PST)
Date: Thu, 17 Feb 2022 12:16:12 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] linux/fb.h: Spelling s/palette/palette/
Message-ID: <20220217121612.66011b8c@eldfell>
In-Reply-To: <20220216083922.2913515-1-geert@linux-m68k.org>
References: <20220216083922.2913515-1-geert@linux-m68k.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_HUuAzPNnPIuJlK_Inr6/=4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/_HUuAzPNnPIuJlK_Inr6/=4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 16 Feb 2022 09:39:22 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Fix a misspelling of "palette" in a comment.
>=20
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  include/uapi/linux/fb.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/include/uapi/linux/fb.h b/include/uapi/linux/fb.h
> index 4c14e8be7267761b..3a49913d006c9bf6 100644
> --- a/include/uapi/linux/fb.h
> +++ b/include/uapi/linux/fb.h
> @@ -182,7 +182,7 @@ struct fb_fix_screeninfo {
>   *
>   * For pseudocolor: offset and length should be the same for all color
>   * components. Offset specifies the position of the least significant bit
> - * of the pallette index in a pixel value. Length indicates the number
> + * of the palette index in a pixel value. Length indicates the number
>   * of available palette entries (i.e. # of entries =3D 1 << length).
>   */
>  struct fb_bitfield {

Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/_HUuAzPNnPIuJlK_Inr6/=4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmIOIGwACgkQI1/ltBGq
qqc2wBAAimjDWNfhRvmN1ywJLVoX6Zm68Sz18nAxeBNxhwkSMOU02YP3CbyL2gPA
Rn0eL/PpbG9sJV1hZqHgskZILdV5u6rNTHY5HBYSV0PAIjSOpNUKHQkXg405vFrm
ywEx32oUFuUIGV+c455v6qy1kubU/GwBRdXvFiD+IX+VgenW6I9fu71ZPJeq6D0f
Vhb0p48pd03hBLhgs0405OvHcOra/4aPcFHhx57AVd7DGDvOS0PGmhElCLluKeiB
5CLtAh1MC1Y7nafoRNJ5hquOCx14kWPBk1cOmxGcZ5RP9aA/66gKnB7wE7UVYNP9
TIiKr68O6ocvuKy5iBYgjmXWabugbIvl+YozDKj/UvQpRcE5UxiHUjLu3mYYfypb
OTuOPTbJiTtTjvnMkwk16ex/SwLEd3tK1c0wubbnZ/RcW3vlrL23IX72b6bYohca
/jIIU3r7WCZdCYa5qmdkfAkm2sDbOw0YqHT1JseGvqdG53Cp+9YtUdsd7wXF3xhL
CWMLhI94FQOUmfOcDhBWvgq2Lpe5uhh/daAQsaZUfYO1oBQWaw1GRPLg6urnTouC
YSP17QPPkG6pjEY3XhQeWsPaFXxCTCu+4FoqZSpuC8lEjrA/ObuziSr8/uvNoZW1
fRLJYTvVwt7vyEPohUvwIwBImwajIV6rnJS7V8j4fQj+SdW+Czg=
=75si
-----END PGP SIGNATURE-----

--Sig_/_HUuAzPNnPIuJlK_Inr6/=4--
