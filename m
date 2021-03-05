Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C6532EF40
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 16:44:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE4646EBAA;
	Fri,  5 Mar 2021 15:44:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 965A16EBAA
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 15:44:19 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id v9so4410667lfa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Mar 2021 07:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=eWlpU4eK0zZjeWkkGDvSlrJyNKKPLQZXCqCxb3Wuy3c=;
 b=WxmXSIBVVdW5vdX8S/P0Kh3pAv01ZKT/Xokxh3UBFgtmdx3H6YbRLJ1s3Xn8yfvvpY
 pxvTuKrez+g01fAB0awepEtDKlYSy0HEP/1YspT+Jl0DOxRNqzMSupAp8pKwEniLrZea
 WHIBfcHDPWZH8OdAUgLv4tRpglgxRCdsXAxYDCv0MyCU5gNfUxZcV0M++EM4yMT+oB+q
 fwnq2Rv0TBaIFieYnd5jcGhRH4nuJStchMmYvz9S2exfoYgBjv+HtB6nJurY2yKx2Wd7
 /QqBj8lkgkkiTMozLljG+H6JBfs1cbbQ/LfbX4VGGcAJV1tPLfLY7iFAuBbrTszxtQOv
 z+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=eWlpU4eK0zZjeWkkGDvSlrJyNKKPLQZXCqCxb3Wuy3c=;
 b=RImo7/zfQEl8/NXbqLEIdlWCex5MDzv+DYPUENoPRKJAn+uzlI9DLzucARGYa7BGOh
 DduHjUM2NSIsOzWtnLg82vpf3NJTSwmhC0IolbChe+8j1yIT4KdW5bvHf9jIUclvifMd
 r1HL/YOE/6xhSArme38HX1shziWvsvd2/LRZKmZrUWtkwp5X1/gl9Rrt5qpVetLWkCml
 xqOF4k0LkYi7xq/JvQYbv+XliCgQg/tMUXRXNtDct/uQ4GNd8WUEOb5ru5IfHqM0QV2W
 +WTrl6ljEdw64dtwCnlD+NSxvu1CR2NFSBjFZyaIeT15Yz6/jdpOOLjEx0TDaqqmYbvT
 39PQ==
X-Gm-Message-State: AOAM531lvy1oXI7/74KtGWWaKXIbr10+qe4TjulNoNstGQwoIMX05h9C
 s7LVKpY5fNIpdhtEZJIa7go=
X-Google-Smtp-Source: ABdhPJwFI/rOnnsCk+gxJxxavz/B4yeWseZDqOYtKERLkBQwBNbsWmjiZno0U+Awz28Eog0EXZstsw==
X-Received: by 2002:a05:6512:68e:: with SMTP id
 t14mr6115845lfe.595.1614959058018; 
 Fri, 05 Mar 2021 07:44:18 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id w25sm347433lfe.298.2021.03.05.07.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 07:44:17 -0800 (PST)
Date: Fri, 5 Mar 2021 17:44:04 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Hardik Panchal <hardik.panchal@matrixcomsec.com>
Subject: Re: Query regarding DRM mastership sharing between multiple process
Message-ID: <20210305174404.1293f25d@eldfell>
In-Reply-To: <CAESbsVNtvJaPGSYqvgzGGeriH11vcnJrQ=nnCJ4sbfyE1Y1pmQ@mail.gmail.com>
References: <CAESbsVNtvJaPGSYqvgzGGeriH11vcnJrQ=nnCJ4sbfyE1Y1pmQ@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0997810727=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0997810727==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/oN.t_T7yrOnFdHsavouFyzD"; protocol="application/pgp-signature"

--Sig_/oN.t_T7yrOnFdHsavouFyzD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 4 Mar 2021 09:43:22 +0530
Hardik Panchal <hardik.panchal@matrixcomsec.com> wrote:

> Hello Sir/Madam,
>=20
> I am trying to render some stuff using DRM with Qt GUI application and
> decoded stream from Intel H/w decoder.
>=20
> I have two applications one is for GUI content and another one is for
> decoded video streams. While doing this I am facing an issue that only
> singal process acquires DRM mastership while the other one is getting
> error.

Hi,

yes, this is deliberate and by design.

The idea of having two separate processes simultaneously controlling
KMS planes of the same CRTC is fundamentally forbidden. Even if it was
not forbidden, doing so would lead to other technical problems.

You have to change your architecture so that only one process controls
KMS. It you need other processes, they have to pass buffers or
rendering commands to the process that does control KMS. In other
words, you need a display server.

> While wondering how to get the privilege to render stuff I came
> across GET_MAGIC and AUTH_MAGIC.
> Please refer to this text from the MAN page of DRM.

Those will not help you with breaking the DRM master concept.

> > All DRM devices provide authentication mechanisms. Only a DRM-Master is
> > allowed to perform mode-setting or modify core state and only one user =
can
> > be DRM-Master at a time. See drmSetMaster
> > <https://www.commandlinux.com/man-page/man3/drmSetMaster.3.html>(3) for
> > information on how to become DRM-Master and what the limitations are. O=
ther
> > DRM users can be authenticated to the DRM-Master via drmAuthMagic
> > <https://www.commandlinux.com/man-page/man3/drmAuthMagic.3.html>(3) so
> > they can perform buffer allocations and rendering.
> > =20
>=20
> As per this the client which is authenticated using magic code should be
> able to allocate buffer and rendering.
> But while doing this I am not able to use drmModeSetPlane() for rendering
> stuff on display from an authenticated client application. It is giving me
> Permission Denied.
>=20
> As per my understanding if the client is authenticated by using
> GET/AUTH_MAGIC it should be able to set a plane and render stuff on the
> display.

No. Authentication gives access to buffer allocation and submitting
rendering commands to the GPU. It does not give access to KMS.


Sorry,
pq

--Sig_/oN.t_T7yrOnFdHsavouFyzD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmBCUcQACgkQI1/ltBGq
qqdTHQ//Z+5z/08tUlHYsG+0s7USiRUDx79FKfH86L9MW/JPd4gJpsyXjVn7xHjq
Cow+E7Sb6+dBL9KhTziQqd4PI4P+KUNOJ6I1zgyNa8RTtOmTdhhGFDlEeWe9IuKI
ckAyMLWhYol6KYsCs5OwwMaPXyM8tYjBG2aDax0Pwt/zlmcZbHIxeBisU8lnbLlv
FhNonGWIpfniAJzRmSLv+ISUy+4aNAHxJ/C0PXdYqe60fmQaqR/+wV/Lc9wL4nfH
pxTIIEUI9iFbStRflyxMIKrTMJCQhPOxy/vsByjgAninduCs0q0y020DbuB7MI6G
No/JOW1pKSMkLpPi93GYfz+IO1aHZDS466oYPkE0PQ4c3jzu2Km6u/9FhmBLQVsh
XEpVuOn12gJfvadqCIuO8C0n4gfh5uOzZeeUW8XfKckcFxTvjJyWkG9snFwqUrut
E/9Rec+mNzb+zeQMKmd/tqc/NSjVHq8u/cPbGxFEFhlt+T4EVwy10a0wWLYgppsb
pQxbWl9pcRWgfmZsmEqUQtweiuLCkKVIQKujBYMZSVeM/g1iVCj012wg7NB+T+2B
u4Q/1PQhJuUt0yViW5a2yrQ/yZbwndzjdVct9n931vb/Kif4SQPqqyZlvQ1HF+8A
b3csvgnMD+GEFNieoh0mknbY3+/RBswElcMcscXnqc+uRjx0pDI=
=cSpO
-----END PGP SIGNATURE-----

--Sig_/oN.t_T7yrOnFdHsavouFyzD--

--===============0997810727==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0997810727==--
