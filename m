Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F5E2A03B1
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 12:08:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F23426EDAD;
	Fri, 30 Oct 2020 11:07:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACDB66EDAD
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 11:07:57 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id a7so7321158lfk.9
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 04:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=iWNGjA9MPIhJYkU0XJf0oB5wFDF8YI6oEqOsitG2U5E=;
 b=jE8NEhqsu8SRMoFnOXlj2dajf1Ac05qLG7c1wmEU8Hids1CRalV0IaPYeZV5yPIK2F
 i8RsYXBKAW4wqSXTRziEGJ0yRWHqpXWecGLvUgJf0ZhOvJzExudC4m98h6Qat01oi1Cm
 e6NBu0M4xGMAub5a/kEs6zYneKsDcN3I8MOcGPTn4VAspAXDghZCz6lsx8dPDSiAgyyq
 8j1esYwCy3RTNLKB0yA1QnIbW/J7dNoBDBbsYTqtOo7+t/YgWGwnP6wiJK7iUURVEsHB
 WxWzr6/Oii2DX3/16sH/0RfasH9qdBhJz+QNoGajUoseDD+EXblKLSkJ3/Q/xfP3JSnm
 eqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=iWNGjA9MPIhJYkU0XJf0oB5wFDF8YI6oEqOsitG2U5E=;
 b=a4G6s3XyNhvnukVU9xJZfLj7NzYm11LdYjM8OMTNiXT6xfgBX0Gb4ijRtNfLrg6ikY
 lUldjlDFFoj4TrSU+/em7fJNInlEMXLHV2QvZ0vx5K8IKbygZl4s9UfWk5wNYhE8oGfx
 fmLCiyhT+jf1PtX8taAkeR+XUCqzd2Aw8qEoJDecG+MxVAi1id5Ut+VtrSQrUmuPe+La
 m0HJiZTEPBdFRNbXxqi1O/Azb9/nBs1LELi61Rcl0JX/IkBaUvnYH2ho9GSApcN/9Eai
 3nOu4ur0gIOA0TkSjJPkQ/cx6gmFfrA3+/aqgr760jS+IjS4TiG9Y/rvRKT1Ndh3jpAx
 /fGA==
X-Gm-Message-State: AOAM532J6jPqtOpBuCUgJJgdWBiYR/Gaxxf5ZJLNQFD9jeUk/YzmZ4Ux
 ZteuMmZvNA0oUCTLAlfOb04=
X-Google-Smtp-Source: ABdhPJzMIiqe2k+13hnY9osfdwCq6luig375AtiNXnSMF+X6nS/M1VaxzFn4CJNVrN4iPi9wPxm+kw==
X-Received: by 2002:a19:7f86:: with SMTP id a128mr674740lfd.359.1604056076135; 
 Fri, 30 Oct 2020 04:07:56 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id f24sm592012lfh.73.2020.10.30.04.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 04:07:55 -0700 (PDT)
Date: Fri, 30 Oct 2020 13:07:39 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Paul Gofman <pgofman@codeweavers.com>
Subject: Re: [PATCH libdrm 2/2] include: Avoid potentially infinite loop in
 log2_int().
Message-ID: <20201030130739.0e6770c6@eldfell>
In-Reply-To: <20201028100602.168752-2-pgofman@codeweavers.com>
References: <20201028100602.168752-1-pgofman@codeweavers.com>
 <20201028100602.168752-2-pgofman@codeweavers.com>
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
Content-Type: multipart/mixed; boundary="===============0538098686=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0538098686==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/LGSHXuZQZG_Kcs8idKTW.0W"; protocol="application/pgp-signature"

--Sig_/LGSHXuZQZG_Kcs8idKTW.0W
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 28 Oct 2020 13:06:02 +0300
Paul Gofman <pgofman@codeweavers.com> wrote:

> Signed-off-by: Paul Gofman <pgofman@codeweavers.com>
> ---
>  util_math.h | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/util_math.h b/util_math.h
> index e2fa95f5..f6bbe192 100644
> --- a/util_math.h
> +++ b/util_math.h
> @@ -38,6 +38,9 @@ static inline unsigned log2_int(unsigned x)
>      if (x < 2) {
>          return 0;
>      }
> +    if (x & 0x80000000) {
> +        return 31;
> +    }
>      for (l =3D 2; ; l++) {
>          if ((unsigned)(1 << l) > x) {
>              return l - 1;

Hi,

I guess that does it, but it seems quite a lot of code that could be
a two-liner:
http://graphics.stanford.edu/~seander/bithacks.html#IntegerLogObvious


Thanks,
pq

--Sig_/LGSHXuZQZG_Kcs8idKTW.0W
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl+b8/sACgkQI1/ltBGq
qqcVbg/8CBbb0WBurKN/gC8o5TgF2TWLJ9wCtsFTV0GlXqvTOnxqqVMw49/7wzKI
KNdveOMijVKhdxXKb3Lzz6Fh44YQSJ/lYhPYf6XDOi3ki3vjj9eN3+Bl3lh6/ky8
oxbACDhdAG/f0UIwB+FU13jyVl3oTc8vknIsKaznvRFz+FhaT14b4aD4I0IIKiNt
gUhb7lJPJoc7a/Mo0r2odbaGTOZovEGTNWFN+bv1f/8G/XzknoMttZ6JaUI35xHw
dyOc0DT77b8luiGojY+Gb9HOIOmvqhd7Y4F6u5vaM8wkyrNue5Owb0F6gdZBTYOE
dtYI+mWKDyi/zD+XKotPDaIOwq3X7e9qtAbpgfbDmDyEd/JXhTkNfn93q6YLRgnC
IiPpLgeOKyUhBYfeeAn17g+P3argK5HyVMFHCtdkShnTiMYeNHc3Zd7heso4ilTr
M1+mqho4YWOToCtmbou91CS6agG9RZVBDTh9C4F/p6VLrtctjtm0BSbqHQKNTurK
p+aZ6gsU30GB4WbbS4i6neaZLni7ImM+ywMB4ERU66BkMrSnCgw+zN7YJt2sBLsw
xxbFGS1iYxrGLo/jvAnNcaLvBZ9HireZdMfp9YKBuMGPS4yJ2V/z50/EClaG8o+I
Nx1clZ0HnpjA5R9JWdkk/+EVD6M7Ged/qffqFMVu+j1N7xsdfsk=
=vFOf
-----END PGP SIGNATURE-----

--Sig_/LGSHXuZQZG_Kcs8idKTW.0W--

--===============0538098686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0538098686==--
