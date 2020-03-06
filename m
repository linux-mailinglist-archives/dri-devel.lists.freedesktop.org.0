Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D37017C2BB
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 17:18:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 998886E4AE;
	Fri,  6 Mar 2020 16:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B91D86E4AE
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 16:18:00 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id s23so2344790lfs.10
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2020 08:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=Z+TJMGEeVoGtC49ptXlQFv7le4nU8temgCblUT4vbVU=;
 b=mTpAGJks0WsFlELSXp3Du/jidQlD93dWjc024/xOuNY30kBjARicDYFfvmosqSZXyq
 IDx7jqBxS5J0xYtZe5jG8pEPuKBu/z6SNrj52+Bz9YmP0+nWu9kP60a57/4W4TqkLv+9
 yvCmE6DDVl5vEy36xyI0gv68OW3yDlcKJ00hDSQNEBUqBoQhAYfllOVlQ62fQtad5Hhn
 WIqGlIDQSbO7Nvp9Q2aGjkRGlxGxV1nVe4Xs4JXRuJEDT0Smb65gC5Bb8tSz1aX+73io
 b/Cdxdkkqg9u1B0i5fYuaRtR+7NTH6brln6Zg0pnSQql7QdNlM6ktmv/0s6X0QFmCg2d
 XKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=Z+TJMGEeVoGtC49ptXlQFv7le4nU8temgCblUT4vbVU=;
 b=lGnOvvViLnJ7iQDYVt39EBZo/eAfflESMfh8pQdDNuBBSAvZKGKF6tbea/SxczEr0D
 wGOho8A8t7VCbJZKrm3hSrLW89NjPg9N5qcv9rf0Id0I41i6AziOXcuPBZh6yab/QYVx
 Z4+It81Mz4PnMYDnKtN2cN0qIzvRjTrE64QFkY7eeEJy1c/hf/dH/EeuGnBH82AXIB2y
 L2054k3vhnAX4awo2XeN7JSJy41Ri2Wq1PvDeyzF4OeFE5QddxwqEZuBVR3vyylQI3DH
 oMWqHTN7YI9o4N1RtouaelwHMdIU45YzJiC1tuxWbtKEMr5WYubmEFJMyP9uRBbFH18d
 5WwA==
X-Gm-Message-State: ANhLgQ0TcuXa+zHvkrypyQOip+n5U8a5XVJiaCV7SvLcz4tqTpsyJ0j1
 aIAiZK6tfaMt2VCldw5FRbU=
X-Google-Smtp-Source: ADFU+vuwI6V8yMCkBVEfEewYfNim0qzEgKl4clXc2U7TnaM4A3YLgo87+3yB8AqQvMGoDHbSLJ1YPA==
X-Received: by 2002:a05:6512:108a:: with SMTP id
 j10mr2458169lfg.35.1583511478908; 
 Fri, 06 Mar 2020 08:17:58 -0800 (PST)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id j26sm17383971lfm.3.2020.03.06.08.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 08:17:58 -0800 (PST)
Date: Fri, 6 Mar 2020 18:17:47 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/4] drm/fourcc: Add modifier definitions for describing
 Amlogic Video Framebuffer Compression
Message-ID: <20200306181747.5dbda69d@eldfell.localdomain>
In-Reply-To: <27d09559-055a-7bf3-0f23-9948da0e1f76@baylibre.com>
References: <20200221090845.7397-1-narmstrong@baylibre.com>
 <20200221090845.7397-2-narmstrong@baylibre.com>
 <20200303121029.5532669d@eldfell.localdomain>
 <20200303105325.bn4sob6yrdf5mwrh@DESKTOP-E1NTVVP.localdomain>
 <CAKMK7uFgQGrnEkXyac15Wz8Opg43RTa=5cX0nN5=E_omb8oY8Q@mail.gmail.com>
 <20200303152541.68ab6f3d@eldfell.localdomain>
 <20200303173332.1c6daa09@eldfell.localdomain>
 <20200306101328.GR2363188@phenom.ffwll.local>
 <27d09559-055a-7bf3-0f23-9948da0e1f76@baylibre.com>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-amlogic@lists.infradead.org,
 nd <nd@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============1383120678=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1383120678==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/QRgxWOW3=LdfxDd168gPaIX"; protocol="application/pgp-signature"

--Sig_/QRgxWOW3=LdfxDd168gPaIX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 6 Mar 2020 15:40:01 +0100
Neil Armstrong <narmstrong@baylibre.com> wrote:

> Hi Pekka, Brian, Daniel,
>=20
> On 06/03/2020 11:13, Daniel Vetter wrote:
> > On Tue, Mar 03, 2020 at 05:33:32PM +0200, Pekka Paalanen wrote: =20

...

> >> Sorry, it's waypipe, not pipewire:
> >> https://gitlab.freedesktop.org/mstoeckl/waypipe/ =20
> >=20
> > I do think this is very much something we want to make possible. They
> > might pick a silly modifier (compression modifiers only compress bw, by
> > necessity the lossless ones have to increase storage space so kinda dumb
> > thing to push over the network if you don't add .xz or whatever on top)=
. =20
>=20
> The AFBC, and Amlogic FBC are not size optimized compressions, but really
> layout and memory access optimized compressions, without a proper network
> size compression, transferring plain NV12 would be the same.

FWIW, waypipe is not intended to be the most efficient network
streaming protocol, but it is intended to be a direct Wayland protocol
proxy (X11 forwarding, anyone?), which means that it needs to be able to
transmit also dmabuf buffers as is. It does not want to understand
modifiers but just send opaque data.

It may or may not do lossless compression of the data it sends over the
wire, but it will replicate the dmabuf on the remote end.

Or so I'm told.


Thanks,
pq

--Sig_/QRgxWOW3=LdfxDd168gPaIX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl5id6sACgkQI1/ltBGq
qqd8PhAArj8wtOHDFlSHaRYFMSEtCurAGSLkUTpmQWl6J1kvS7Stv5XI9jgfSCws
IITQFVQc/DxIvzf4KO9zECMi+oIrhw3vyrvJEIErhE6LuZdqgR2MNP3ATNBKU8WR
OTEawk87ZvZQENGUYPiV9R3uF0+yr2Qlz2FqmizM8lD6fmWXV1QBBKr8AgkZ+/qK
E4e6GRAn+3mBZLS4dxEeU/pATGoZNnOoMpmp/z27AIaibtN88Qpzxy+WtyYUREGm
oTjidQaSOgwEt8nDdhdTFCfZcN4HwH8n5p5JleSvKVziTQlTy5IQZasa5ViuX0wB
eC+x6OmdrxZ0wBuDfZBp26jKmWP3QDxfwaL+QCRnor+9Ao7Tty9MoGVAbPuy1mwc
SzJpjIYsY0OGIjp6OL/Isi5wPZbawkeifutoPVdo9o9PdRIzhR3PJtoOZPN8Ywva
yFP28GivCkapKxSlM3NDDjzA5dT+rUFEeBGurXuZqPZe9rKocN2CmXQ96wsmYJ/a
WMsJNg7EiswQoUf/JadWfm5dpSK42wyGGs9M1i6yRpTo+QGGzQVkmT5Kx7uLAd+p
vuYVc+bNjwNeELU4UhEBXZVWM3n7l7OIcL38NshrnBhdOs0Zy/ElXnSmHkgpccbv
sfZp+i8Id5jdyzKGwzbFsG8OQ/zlUyM9B7yhHhejzP7Q482a3gA=
=KY6f
-----END PGP SIGNATURE-----

--Sig_/QRgxWOW3=LdfxDd168gPaIX--

--===============1383120678==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1383120678==--
