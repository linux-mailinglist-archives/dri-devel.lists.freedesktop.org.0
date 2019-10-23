Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B63E1354
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 09:42:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D1C6E97E;
	Wed, 23 Oct 2019 07:42:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 261256E97E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 07:42:32 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id q64so19946384ljb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 00:42:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=umd5e4bQ/KQRsp86jGzXcyXYNSxoKBo2b9txpsBKc0M=;
 b=nTHG6DjOHDPPys6SsjSdFYEQlVh+FG6xD9OZnEMFa/XsN4jS6reLDNsJvOOnkCFmqn
 gtUrszpTj1+gZEUrs08J4e7SiAElJvcWYXPCLW2WuOxNuTJwxmuHLqIGePda2tV/FjK5
 AS4P6SgQvQgXVxsBQGzw85pESDON5+MDkL6PYzOoIWbZxMmC6zRXNTPpu8yzKN9lp4W4
 eR5yDdbCr67A0KefsWQ21R0ARsk1dIrBonC5G28l5Ou9Kho8qKeRYSpt8Ncb8aBbLUpH
 rTnrnL02CK0NSS+VAzFzcErqIRskQXDpKKXQfN6CZX2TS2QmrXPi42aRtlobI0mrzJD/
 /7bw==
X-Gm-Message-State: APjAAAVHDyD9TlOrQBgtKaPgnhW03VdVICOLPsGk/M+uoundpBLIm+7i
 i/5gcHEeswE2EvAQDJCwhYs=
X-Google-Smtp-Source: APXvYqzP3nHP3yBMGrQPXRbwbDXpw9gnlGvnf2FfII1W2RSEZaxPWvnZOz3MxtOEKUbWdWPfXJ/fuw==
X-Received: by 2002:a2e:9b02:: with SMTP id u2mr21911370lji.50.1571816550284; 
 Wed, 23 Oct 2019 00:42:30 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id h3sm14682074ljf.12.2019.10.23.00.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 00:42:29 -0700 (PDT)
Date: Wed, 23 Oct 2019 10:42:25 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Subject: Re: UDL device cannot get its own screen
Message-ID: <20191023104225.60f969a0@eldfell.localdomain>
In-Reply-To: <536af56f-924d-f089-a2d8-180f4dee1613@pr.hu>
References: <536af56f-924d-f089-a2d8-180f4dee1613@pr.hu>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=umd5e4bQ/KQRsp86jGzXcyXYNSxoKBo2b9txpsBKc0M=;
 b=jfaU16xAcpofjOHF7YJw94gWoy1eqi+DzSBsi8mgwEwaAmm94jy6nF2VTir0iemMyV
 zY3L86TOkK6AAubLzbWIyhx2De3V5qUwA3JEe4rHCWajscUKty1YtEKlm0NmqcMjsICp
 c/YlQiM1SHnHQ9qYZMF8uAURtlDjAu45Z0U42sweECm2m8c3ANmcaeVhTYq7Adzt3EL/
 wgsuSydHTKHX85H4b6BfFPrHrWcjPPSX5sj2/uDOa9nVt/sNdbGE4qcxWSVueuz4se+C
 KpsdKCTd7xSNeQ6kylCXuanmMKCXVxRG6sYZ6yh7Y8pvRtZhW9fCyzqgwnpwsDviM2Ty
 D1nA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: xorg@lists.x.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1512561482=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1512561482==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Bh+R+SxpsL/bRsxKk/CzeZD"; protocol="application/pgp-signature"

--Sig_/Bh+R+SxpsL/bRsxKk/CzeZD
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 22 Oct 2019 17:50:21 +0200
B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zboszor@pr.hu> wrote:

> Hi,
>=20
> I have the below configuration for an Intel based POS system that,
> while advertises 3 outputs (DP1, VGA1 and HDMI1 with xf86-video-intel),
> only two are usable. DP1 for the built-in touchscreen and VGA1 for
> the external VGA connector.
>=20
> I wanted to use an USB DisplayLink device as the 3rd output, with all
> three output using its own Screen number, i.e. :0.0 :0.1 and :0.2.

...

> The third observation is that while I am using this configuration below,
> so the UDL device should be assigned to :0.2 (and active!), it is really
> assigned to :0[.0] as an inactive output. See that there's no "*" indicat=
or
> set for any of the supported modes on DVI-I-1-1.
>=20
> How can I set up 3 different Screens correctly for 3 separate fullscreen
> applications?
>=20
> I am using Xorg 1.20.4 patched with the "autobind GPUs to the screen"
> patch from Dave Airlie that at least wakes up the UDL device and makes
> it visible without extra magic with providers/sinks.

Hi,

for your specific use case, auto-bind is exactly what you do not want.
So drop the patch or (since the patch is in upstream master already)
use the option it adds to stop auto-binding.


Thanks,
pq

--Sig_/Bh+R+SxpsL/bRsxKk/CzeZD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl2wBGEACgkQI1/ltBGq
qqeRiw//erNEqfrwCC9Ejo8WJIISDY54fPEaAgfmFNiDIvHGZrPE+d9cue0+FOqF
TPhrabOdqSTgsvLAC79LbOovd6eIgYs1oJV5qWUgAF8FkrkXJxCZMaHkAZQ5kFOp
NX6uDuLfhM9mDjOd2rjk1qNV3l/aqPjmUoNpwpwqW6QW48u5KeDvW4J8uA4cF5XD
Cbw4FRkJcp+HkHcLSK+0bkjvRp0O+LEgpwRA8OnZcy29vGqMroLey6j8pk2sGNTd
oVIisuGlOeFr3/yIXej7QVxI4mV7p2yxNogXhZYJyOULvo++6bIEhc/Y4Ot5syyZ
5H3FaosKO8NjKosDGlEYRBOxKaFwM/eHG42kwzZXfgxa03ayxJqlNbjSKF0c8IFJ
oYIRqrKxejOuackQqMdT491t2wg8eYoe25tbqh1POVe9wjU/D8ujyZnjYa4+ydti
SKq8XqfgmoAsgdAGayG0I3P17S3+lyW/6/y1OzzSW6KmHJQTPVxSjs0NsFEj1Lf3
QJBoPrRzNeGVabaWadLAaC7Rpyc3TkcUmsvGj6B95MR8l9EUyOC2oaW+nMxlmZUz
q/vDMczVWDGXIosPZh3C2JZy9ZdjUY8eGQvJyDykAdWsrEQykUf01lHpXr8iePUb
ceALtQk6LVsO6jeTLZRa2tTyfZ/MVdlh6egJywTvUJwk7uTkPE8=
=ZHJ8
-----END PGP SIGNATURE-----

--Sig_/Bh+R+SxpsL/bRsxKk/CzeZD--

--===============1512561482==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1512561482==--
