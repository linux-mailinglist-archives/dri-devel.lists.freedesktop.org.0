Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB1219D1E8
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 10:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D58D06EB2B;
	Fri,  3 Apr 2020 08:14:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA3D6EB2A;
 Fri,  3 Apr 2020 08:14:17 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id r17so1469186lff.2;
 Fri, 03 Apr 2020 01:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=etpdu2SY3020hFrclDVLisJPY8j08ns+2OMnc8bhH3A=;
 b=s2SL38aVGxVljiRJdOpNGD3AnxuEOkDkGYIDL/gZUGI7i6f349+x17bZ457caI1uus
 JcfD/hs1lPIJcDPy1YqzUachAuV6F2xNmaUryFPpHrGo3PsXvWxoOYrfa1xp4BNEv97v
 SX6BzOuEi11QL65sgyc9JRcQMVUzdztcMBwgo2z200pNaiE48ukqAsSU1K1YgctoF7Vn
 FsatKTytZCVoU2fRjGQ5/PZlBzIwnulWTXj7QyDnQvJatKyVNSvThXlLkpk+da8PZHpf
 V0wNx4UifPdGLtT36pEuSxv1W+19eNiND0sR0RzW8mytUSv0emyctJASiIwERCVJ3Stz
 xAIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=etpdu2SY3020hFrclDVLisJPY8j08ns+2OMnc8bhH3A=;
 b=uTBPVgLI6ynh4nsw0/Qq5INw2CSeyyVtYt2i2He7n75OWWr/c0yHv5IlH1HyjsUTgi
 MHaoQxnNhRIMaVh9IJp+7iDGy9t4V9obccvGZ2dL1tAVMcxU1auKuIuoudALP/v5K9tk
 pj1aiNf7ox2uwJIRTrxLUOaVHPG46xa+/GvcFI7fOMHDnp1ZRhvrLHkUoZvirv0eRW2w
 LR5hl5hRyvNnb4IVuqc08hs58f4Yx6wXPXUCYikYOb/0qieGFpUmhirAqUTNjR9+CSt5
 imIHy7Gl9J6C+b69vCUFkbTpwEy5qp2su9y+wMlFDXLAtXALzjpFWH8yqjalAVh+85Rk
 fGDA==
X-Gm-Message-State: AGi0PualW8RXqSMfq+X44UlfM0h9iCYqSRupCBUOFywfyH2i50379Sfv
 IaDmxeB1Svg0BF6Qvrm+0ZA=
X-Google-Smtp-Source: APiQypLG595avOz4gU1lCusl8Dt/PH36BDJknIElTEcrFJfvqkUtQ2znLrAfyxj6LRdXcnRz2XXP+A==
X-Received: by 2002:ac2:44bb:: with SMTP id c27mr4725817lfm.91.1585901655561; 
 Fri, 03 Apr 2020 01:14:15 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id f28sm5428765lfh.10.2020.04.03.01.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 01:14:15 -0700 (PDT)
Date: Fri, 3 Apr 2020 11:14:11 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Matt Hoosier <matt.hoosier@gmail.com>
Subject: Re: Aliases for DRI connectors?
Message-ID: <20200403111411.5e4e6bfe@eldfell.localdomain>
In-Reply-To: <CAJgxT3-11eZqvysgCQMCYtKEUVsNWWHd+7au91uNC7SWK1Fyug@mail.gmail.com>
References: <CAJgxT3-11eZqvysgCQMCYtKEUVsNWWHd+7au91uNC7SWK1Fyug@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org,
 wayland mailing list <wayland-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0369271960=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0369271960==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/fA/EhPPPYn3ofxyG6A1NO_p"; protocol="application/pgp-signature"

--Sig_/fA/EhPPPYn3ofxyG6A1NO_p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 1 Apr 2020 14:38:37 -0500
Matt Hoosier <matt.hoosier@gmail.com> wrote:

> I'm searching for some sort of scheme that will let my DRI master query t=
he
> set of available connectors and select the one carrying a prearranged
> designation. The problem I'm trying to solve is to allow deploying one
> standardized userspace component across a fleet of devices that have
> varying numbers of displays, with the use cases not always driven on the
> same connector topologically.
>=20
> I had a look around the properties available on my system's DRI connector=
s,
> and nothing immediate jumped out at me. Is there a standard connector
> property that (assuming I can find the right place in DeviceTree or simil=
ar
> to) that would be a good fit for this?

Hi,

I've never heard of a thing that could accomplish that. DRM connector
names are not even actually communicated to userspace. What userspace
sees is connector type (enum) and some counter numbers (which are not
persistent, so not reliable if you have e.g. multiple DRM drivers
racing to initialize), and then userspace manufactures a connector name
from those. This has been most painful with Xorg, where the different
video DDX drivers used to use different conventions in making up the
names, meaning that if you switched DDXes (e.g. between driver-specific
driver and modesetting driver), the connector names changed
invalidating your xorg.conf.

However, the problem of non-persistent connector names has been thought
of, see e.g.:
https://lists.freedesktop.org/archives/dri-devel/2019-June/221902.html
The thread has messages also in July and August.

If you had reliable, persistent connector names (and used e.g. device
path from udev to reliably identify DRM devices), maybe you could build
something on top of that?

Though I doubt if maintainers would like your config to be in DT or
kernel, maybe it needs to be handled in userspace?


Thanks,
pq

--Sig_/fA/EhPPPYn3ofxyG6A1NO_p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl6G8FMACgkQI1/ltBGq
qqcpJA/+JIYwpk1Lka0aELuF6noJ9Mjq3wQgxW9eHcZUE5debja9ePCg3sJ6IEgh
dtquOm+nwVMRM2zo+c/afBM4DosxqeeIKuakpQcBcD/Qloe/pulI4BLICDY6wy4y
3YLdqrJXfbC3cLHtzfG6HNPrgvQJs63eNUXntPlcCEOFSKEOYhVALOjbionsEhix
hr1W3SNkUkEZW+Fk5CK3/L/oKUzMzmQZh2XJ3ndZU3Ej4q1Ac47E/KJyq9b/esqy
bgW9TpvjGdinSe281Sg0rPOAc2+kqdgiU9zXGptR6YmA+Y4IlIaEIef9m0x2jR6o
x2+hSdjEx8RzimT6PEIR+rNeox/sytNNMPoWZRN8belgLERSWwdWr6DGkj4OTmfs
no7HSQdAQ6b1ZOaN9WNWA9qJCoHAT+BMh0mGrjH9+Sf7VswXSAM2faQkmIspxf6E
otpIlBLYFUAIWt5Lr1UlVmgIzUv4V7YYkjFYI4x4Ma8vGjVHywjw8+G4QdHn/vvy
W7qwCdcvv31WdleCdpX/jrOVYHGc2W4yDOfM/u02LKMqP8CbW5AXy6g7OhxGCjBU
2ldyYIwWnJpkZQQ6Bx6NYePCMO/yT+TxFecHNzpbe2kvtckEBX5Lkt9pEtoAzUD0
KmYeoXG8NGMxRpfgQADPXvdfqz1U1uT7ejyPId1SDJJoLsS1Nlc=
=j+gZ
-----END PGP SIGNATURE-----

--Sig_/fA/EhPPPYn3ofxyG6A1NO_p--

--===============0369271960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0369271960==--
