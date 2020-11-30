Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 330C82C82EB
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 12:13:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9772889F27;
	Mon, 30 Nov 2020 11:13:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF9889F27
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 11:13:32 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id a9so20830631lfh.2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 03:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=poP6Q1l+eqOFBI64nm9FltMgPlHwyCaSOi0P93RPgSA=;
 b=g3lnTDUK+Ae/1gTQTeQ10vfuD7VM6oCKHUHHX5iYHlvj20azmv1jTxOCemWmjCaTsr
 sSkq7KJCapovFR24xNRKbI1tyuDokhohpMyn17ienDbiQ+ExoGHT7Yi/uq7RMX/J+r2b
 lSLMLJ9KGd3JG4i9Hx1ns2yUBENEQ3at8vTJdRjMmZBG0aBVImeyycMYxHQVig/PlWRo
 upCn1rA6LbKp3t4azAcwOA6qXC/8Hy/BTYLNX6G1DkQkPKyGS2D4Qg4vNAMBqM0CYAXw
 G/mszOaMkI/K8wVC1zTAJZT5ngeN0UVS4Y+sQIYv9BmXSN+JneZbThoOZ+fA6RqW9+dE
 CiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=poP6Q1l+eqOFBI64nm9FltMgPlHwyCaSOi0P93RPgSA=;
 b=EjcXNi9Y1Njc3n/VDaFuXtuia1EtP+j6CbfIcijA6CagyV1se2pgbnT/TZ4zvbn/MK
 kgut5AeqErHlnKVmYJkf97AM2qcJ7FGGhRshLwW1ob6rYLI8WAvgb4CzfORf9lfu9Cf6
 kMMMEJ3bMM3aoiWsAM0PyQGFAxiXW2zenVpphS8NoNAC5THl2tV6O2FCk/wlRhsTxQod
 FqpVzEfEj7n3T1H636mVBSD3MUhOqcW0EeCmK5ZBkMUB8U7BtIUZ7wiESj/y27Patetz
 VrmRwiJPyAg4ijPrT8McwB9uWf2jD2cjUiSUVqPQ6OXyWbC6BecWcREhhwIQlJLpBK4L
 TJjg==
X-Gm-Message-State: AOAM532WFtJ982zxm5wTsUO20v94pSHaSlql0vrSMi1rXYVUM2y4DURO
 UaSv8pLViu0F+WzeI7Ydh/I=
X-Google-Smtp-Source: ABdhPJxwdSFczpm9NFMtnvpf5Z6p8bWzq/NQnB4/pG0MN/4GEoizfMq8uiS6wUY4HmIlUqS75lXbBQ==
X-Received: by 2002:a19:655c:: with SMTP id c28mr9524178lfj.549.1606734810483; 
 Mon, 30 Nov 2020 03:13:30 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id t6sm2422425lfk.207.2020.11.30.03.13.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 03:13:30 -0800 (PST)
Date: Mon, 30 Nov 2020 13:13:26 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/vkms: detect modes during output initialization
Message-ID: <20201130131326.7ac87605@eldfell>
In-Reply-To: <H5TtDGvtYXHmWmVpmi1NyWShzr17yAkVlxZOuKcP-fekJpvYX_Ec7JQtizWk8Xpkaw95TIkTqhzWZER4xwl0mOguSjIQSGLBgGQVMPAejyY=@emersion.fr>
References: <d589025b-76b2-1826-1798-60f61000b14a@collabora.com>
 <20201124143947.GP401619@phenom.ffwll.local>
 <9365f1d0-2bb7-d7e8-dad6-62111abadee8@collabora.com>
 <H5TtDGvtYXHmWmVpmi1NyWShzr17yAkVlxZOuKcP-fekJpvYX_Ec7JQtizWk8Xpkaw95TIkTqhzWZER4xwl0mOguSjIQSGLBgGQVMPAejyY=@emersion.fr>
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
Cc: Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>
Content-Type: multipart/mixed; boundary="===============0497442584=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0497442584==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/xBRTMpo0U=NO.p0go12Gys."; protocol="application/pgp-signature"

--Sig_/xBRTMpo0U=NO.p0go12Gys.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 30 Nov 2020 10:23:04 +0000
Simon Ser <contact@emersion.fr> wrote:

> On Monday, November 30, 2020 2:03 AM, Leandro Ribeiro <leandro.ribeiro@co=
llabora.com> wrote:
>=20
> > In userspace we can use drmGetConnector() or drmGetConnectorCurrent() in
> > order to retrieve connector information. The difference between both is
> > that the former retrieves the complete set of modes and encoders
> > associated with the connector, while the latter only retrieves the
> > currently known set of modes and encoders - but is much faster.
> >
> > This performance improvement is the reason why userspace applications
> > may prefer to use drmGetConnectorCurrent() when they need to retrieve
> > information from a device. =20
>=20
> We discussed with Daniel Vetter and it turns out user-space should
> always use drmGetConnector(). See [1].

Hi,=20

where is the discussion?

> [1]: https://lists.freedesktop.org/archives/dri-devel/2020-November/28950=
6.html

Please record the justitication for that patch in its commit message.
"Can't" does not explain anything.


Thanks,
pq

--Sig_/xBRTMpo0U=NO.p0go12Gys.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl/E09YACgkQI1/ltBGq
qqdJZw/+O5H0/vfT3s9oiEuYgVMGtvNZSkxM0oedmPY6YHQbKxy+qwoUfiIGZ00V
izDbgCA37XIE5Nq2bxMIcyBl8drFOI2cLoQD6n78rU19LHTXTrZQ7nDRaimxT8xK
azGrbXz4iqKxdSSnCx+kHE1MpY34ntHfSWIm5OVxRzmbQVxpcnI7Vf7MaI0EWFym
Ag4venykxafNKYpxuByxQDX23tlmefL2Zm4MTbLncl4uQddlb3wxwgxqCrr+rQce
SGAu9qASU+uufC88i/hsx6P+zA6hqvZN0W59cu6kteDmV5J1POdeW2RxiC/WkRIr
2vIPzSrVS+oa66mA3IN3Sq1paKzLLTrbvcQ4er7pYFW+orTsFhEimylePPH18czU
sikwVeAjB+nYsePfSRaSyS4B5kNTv6F7I/f8vKZT7GMu5QWD6RhY7A3+rgspvZ7y
eE/J+qpQIGccl/qMZn2O8uzmDDxJvu0yTX3HpTAbzNXLinwblYyrvZNOKUhYaE4W
C8gH4NtO/YBu+oUfKyCoaHvfwdVMcKE3fdukd+cd67kD+annuAhdcmQ0bJkGJsEi
M0/V3K1SjQcxtJf0h8twgnbtbxx5QFLM3zc5uH6VzmtvFSiL24vOzmpK+znyJtA5
dsRmp+fx0eGI4cJEp1u7+HR05/c3WyPUHZAs6UzjLumM9FI6V5k=
=56UH
-----END PGP SIGNATURE-----

--Sig_/xBRTMpo0U=NO.p0go12Gys.--

--===============0497442584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0497442584==--
