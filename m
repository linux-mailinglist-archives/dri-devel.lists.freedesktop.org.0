Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDB17DB190
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 00:51:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D36910E1F2;
	Sun, 29 Oct 2023 23:51:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E5D810E1F2
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Oct 2023 23:51:01 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1cc2575dfc7so13167165ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Oct 2023 16:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698623461; x=1699228261; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tnaUx4F8KrZZ3PGoAEtrzlrFKiWjXS8sFp/d/9HvjiA=;
 b=Xi9NbcI9CyokClvfLFtyII+hD1ygHJ7wUXwraKVHK56qQUGywO4x0ON6LEL7GjBOZK
 5qCUcqEVwVQHGusPNrq7zdLfcpR9Pj3ssxH1KAt4MptF6+DQUeGjQMxwBV2ENeEFceyo
 75pMTWxOIZrW5ry/1EpHcpPG3lcMF/XeiU7B0+XyUHsSTGnZKKS4X04ZHRuPrBMVkC+I
 zhBzZBq3NTmG3sXHq3M9VAsZlqkc//PhglPk3xRLO740X3z/E0ug7utLio2GUtccarh9
 CU4jDn/fNBGVc8Z9KUSFqfzXSir5eFwjSYutWzRRaB8LZYID74iIdtkvcf29YbgXE7ui
 Tcyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698623461; x=1699228261;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tnaUx4F8KrZZ3PGoAEtrzlrFKiWjXS8sFp/d/9HvjiA=;
 b=RHKM0Y1lrEnohqwwiSY3BTQmS0Cqifzeip+kvOoNmK/Q1x6UJl+9lG1LBxRo3HfjFL
 jPgNGmnn7UrqMqVB4xgYqtlhV6TFxUPTBsycTtKNmPRwodPqjstoM+jJa6VqVgLV78oy
 M/OwY8PC6ipmBr9fq1hwPpG/97VSSxEp72Is7Atazbs6YiIM4TwPZi5rLC8mZdlQ/wac
 1h63MV3Oj3CfEixm18X+z0gyJL556uSc/XFAlpCFt4PPQhnbj8XJK6On4sqGVkaq/pYI
 Osp05Li3ra60+8RrMItbDfYwmgoX2hlPRpS+puQZiPxSry5PJV2zo6jTvDziViTeqwf2
 Ytpg==
X-Gm-Message-State: AOJu0YzBogO9ztDXGLi3HMOp1+7HcaBT4rHDRncEosy98TjknTaN4egr
 UZ/60d0EIsZ+wrDP4HFeVJ0=
X-Google-Smtp-Source: AGHT+IHxBs7QaWgZIVC/mTGf2u0/bmEMVPy6LqzGkKMozIa2+zb2CUBE2+Sgs/lTnSYfa4r0xCiPgg==
X-Received: by 2002:a17:902:db09:b0:1cc:3065:9167 with SMTP id
 m9-20020a170902db0900b001cc30659167mr3416006plx.23.1698623460693; 
 Sun, 29 Oct 2023 16:51:00 -0700 (PDT)
Received: from debian.me ([103.131.18.64]) by smtp.gmail.com with ESMTPSA id
 p4-20020a170902bd0400b001b06c106844sm1077916pls.151.2023.10.29.16.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Oct 2023 16:51:00 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id 461598039BBC; Mon, 30 Oct 2023 06:50:56 +0700 (WIB)
Date: Mon, 30 Oct 2023 06:50:55 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>,
 Dorine Tipo <dorine.a.tipo@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Helen Koike <helen.koike@collabora.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Nick Terrell <terrelln@fb.com>, Daniel Stone <daniels@collabora.com>,
 Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH Resend] Fix line Length
Message-ID: <ZT7v39jG4WTxPYjm@debian.me>
References: <20231029144312.5895-1-dorine.a.tipo@gmail.com>
 <alpine.DEB.2.22.394.2310291610030.3136@hadrien>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hxSAXAGVE2cfMdh7"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2310291610030.3136@hadrien>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Outreachy <outreachy@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--hxSAXAGVE2cfMdh7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 29, 2023 at 04:11:01PM +0100, Julia Lawall wrote:
>=20
>=20
> On Sun, 29 Oct 2023, Dorine Tipo wrote:
>=20
> > Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
> >
> > Fix the line lengths of lines 8 and 49
>=20
> The Signed off by line should be here, below the log message.  Please see
> the patches sent by others.
>=20
> >  export IGT_FORCE_DRIVER=3D${DRIVER_NAME}
> >  export PATH=3D$PATH:/igt/bin/
> > -export LD_LIBRARY_PATH=3D$LD_LIBRARY_PATH:/igt/lib/aarch64-linux-gnu/:=
/igt/lib/x86_64-linux-gnu:/igt/lib:/igt/lib64
> > +export LD_LIBRARY_PATH=3D$LD_LIBRARY_PATH:/igt/lib/aarch64-linux-gnu/:=
/igt/lib/x86_64-linux-gnu
> > +export LD_LIBRARY_PATH=3D$LD_LIBRARY_PATH:/igt/lib:/igt/lib64
>=20
> There was a suggestion that it was better to keep this as one line.
>=20

Hi Julia,

The submitter touched one of CI scripts for the DRM subsystem. To test
this patch, there must be a way to run these scripts locally (which
may requires non-trivial setup).

Cc'ed DRM maintainers.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--hxSAXAGVE2cfMdh7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZT7v2AAKCRD2uYlJVVFO
o954AQD8oXo0ltpyVgNj+W2HrUdj0qfZcYHTNndycvvkv2Y9hQD+IgA8U6ryTDQ/
pvwMNit/pa5/2yFf2sQWJmC+jlJpKAo=
=Wy7e
-----END PGP SIGNATURE-----

--hxSAXAGVE2cfMdh7--
