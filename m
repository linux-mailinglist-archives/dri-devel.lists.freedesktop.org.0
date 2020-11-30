Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6852C831D
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 12:24:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05BDD89317;
	Mon, 30 Nov 2020 11:24:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF558931F
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 11:24:52 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id t22so17322119ljk.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 03:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=PXhNYYSzDzeTVXahvboHw6AFlds5mpcfPiLiIglW9K0=;
 b=E4sbICK8jsOKppzVP6TcGwbWOs42FPc+n0jsg1nthIILUHCxW2MiYTErmKj4pbfkcF
 Ypz7+KQokynW6X2kWEvz3TS+8A0xghVgLSoitq4FMZQ5nxNaDL4Xd7Q9oKWwhYUZQmfV
 tPHrQeUEmUEFCHg+Jfrwj42eeAgbOgXEzeO9Vihz5pEYq+csm9MmLVMitkDpvt9rGKWU
 2YGwb2nBo26Lk4Z2c7x4P/xdYcL+mlp50sAeL6TGO+0hehSlx5LqWGz1yskHhwzzbUWY
 ZNnT0HTYteSNIUoVs0vX5+GDvqiGNDcbzSvMIDiLbSY6g1y1GkBz9gjnFrouxi2TWz4n
 NFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=PXhNYYSzDzeTVXahvboHw6AFlds5mpcfPiLiIglW9K0=;
 b=sQaKSR1fMkWry6IkXtBlHCBmEdehdAVQD2IzfRVWWion9Uu+H3kvpAZeNWynDSFoQu
 37Krb1n+BQZS2B53XHKDlkorF+b8IPVTWm76Oa6vC2PWvs1CKziAyQ5EeOnFgg7zE3WI
 y/E3kbNj/YRcLancNB1rMr1rLy1yfrZEGhOJoBzQwa98ZIH3xezUVbiebiTzTumV2NcC
 ydlrpxd0f5O2ep+qEGvPsk/HQx7gbBQKdrKcBZqBFwtDzTkgdRViZAEtxNiLbKklp3xd
 g3qUxPtwWSRAoK82y608X0Es4SigPq6wiXmCPMk/KUPyxs4S/b6iUaZtym+02gXfaHDX
 KypA==
X-Gm-Message-State: AOAM530/MIXIGotmVUycoLuqrajwzHNZ41z0WaFJOPMxL5woGOyrygV4
 /mtotmbL6sPvA7OaOXmWSFc=
X-Google-Smtp-Source: ABdhPJwSEAV4nhNtqEqksbDvK+yIz4+U3Qwlb4yWI1pfHIDXnSpc9LKI5JxcPJdzWFnfDZWVmREXjA==
X-Received: by 2002:a2e:5742:: with SMTP id r2mr9120118ljd.161.1606735490481; 
 Mon, 30 Nov 2020 03:24:50 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id w12sm2869704ljo.67.2020.11.30.03.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 03:24:50 -0800 (PST)
Date: Mon, 30 Nov 2020 13:24:46 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/vkms: detect modes during output initialization
Message-ID: <20201130132446.79fffe6e@eldfell>
In-Reply-To: <YRhSWPjik2k5GCYf4l8kqw1zY3oERBjpDYT2eNMzDwKMiO3J1qI7U0kj-6OoR0fjWuOndwgIXknXIGauQYHRzohhiefgzvW7EOfFz-hPf2w=@emersion.fr>
References: <d589025b-76b2-1826-1798-60f61000b14a@collabora.com>
 <20201124143947.GP401619@phenom.ffwll.local>
 <9365f1d0-2bb7-d7e8-dad6-62111abadee8@collabora.com>
 <H5TtDGvtYXHmWmVpmi1NyWShzr17yAkVlxZOuKcP-fekJpvYX_Ec7JQtizWk8Xpkaw95TIkTqhzWZER4xwl0mOguSjIQSGLBgGQVMPAejyY=@emersion.fr>
 <20201130131326.7ac87605@eldfell>
 <YRhSWPjik2k5GCYf4l8kqw1zY3oERBjpDYT2eNMzDwKMiO3J1qI7U0kj-6OoR0fjWuOndwgIXknXIGauQYHRzohhiefgzvW7EOfFz-hPf2w=@emersion.fr>
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
Content-Type: multipart/mixed; boundary="===============0329523959=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0329523959==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/XL38OHEcQb7dmzswT.8X9tb"; protocol="application/pgp-signature"

--Sig_/XL38OHEcQb7dmzswT.8X9tb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 30 Nov 2020 11:16:56 +0000
Simon Ser <contact@emersion.fr> wrote:

> On Monday, November 30, 2020 12:13 PM, Pekka Paalanen <ppaalanen@gmail.co=
m> wrote:
>=20
> > where is the discussion? =20
>=20
> https://dri.freedesktop.org/~cbrill/dri-log/?channel=3Dintel-gfx&date=3D2=
020-11-26

Thanks, I read that.

> > Please record the justitication for that patch in its commit message.
> > "Can't" does not explain anything. =20
>=20
> Yeah, sorry about that. I'm just annoyed by all of this get_connector
> uAPI, so I don't really want to spend a lot of time documenting why
> it's so gross.

But I still don't understand why the kernel cannot be fixed to do the
right thing that most of us assumed it should be doing: probe
automatically so userspace never needs to.


Thanks,
pq

--Sig_/XL38OHEcQb7dmzswT.8X9tb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl/E1n4ACgkQI1/ltBGq
qqfIKRAAjueYyPi41MmVKP8ghvrA8p1wJArcRjDTIzBN3wXOlhVyevOjylCQLIT0
cyxmqDRtAGpx4VDOcx/+ufEDzggJu1CQPOe3r5MVt3rxaPSlZfkC4B1APpFPfbYm
nhe5EnFD99J2bLwVzpUuiuTfEBwiZxEeeIpUwF1d51vCYTJY9roOu2uGKpQeYpcB
vcBaLMDh7XiLi1jSnFpEE25qyCtrbU/bPgCDcEAo/I+NyF4akW1YRtq2wgV6LzG5
AUYrDx9NINH4IDahGP+ZsceTv7PqKXs9E8tCO0v/k3re9iOVbbMAHVX/TqALutCz
/NnNGp0tZ3DvO+nFWJU1bZp+sp5KmlMtwojg2hEj/M3tjVLB6aJslGtY3CWZv3OZ
bvGv0QwKMGs1T7feM22CJYzT/QD0AyMdGeFgHNcTFjpeZxKDAW0aqIW7+H/cZXJm
FfEC+SpYDyXF6Nl+IBJS2arXEFH5Q0bJrQC8xqFIE3ERJhgdGMaeyZ2q9rk2teCk
jUVfsJKSUggjwoVUSRgmddghQPQV5QsKIBReTy4OztxCw8hNKkDSGBNKMO2j9Efe
8+8R5ckh6ytdIeKeWt3Ciq7APBPUwku/0sNkq7GWVwb43f/eW8mJfA2WYVEkG5HE
Ykklr3TjHwnWo9C/nK3wURC1uo7y8pNuv8dS64wgIY+No3LIN0s=
=Igtz
-----END PGP SIGNATURE-----

--Sig_/XL38OHEcQb7dmzswT.8X9tb--

--===============0329523959==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0329523959==--
