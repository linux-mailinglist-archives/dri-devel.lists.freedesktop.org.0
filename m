Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C26DEE1AFC
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 14:42:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB51A6EA84;
	Wed, 23 Oct 2019 12:42:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B7CD6EA84
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 12:42:26 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id q64so20931468ljb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 05:42:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=K0jmkwaxbbfSxy5x5MJqqxqlVs7jaGVm0aBEBFDmj/g=;
 b=EVMY1jxw3t4DjMtX8Duhq7dmToqaGiwRDjoMOmMSESazLtmwSJyjND+aXOlUSIuNrK
 B9rXdb3c75V2S/yA4JGIEicvRa7SkUu+5L7uyAOLefD8RERmEjB/aHrnYAHoSzIVCKNm
 2XjplgRKgG+/g868zChXJuob9HE4UkQTrgrQ+fVtlrHIGsqi+rPjF453Jtdq2jFBLva+
 SkFFpxE2NdUBrSlS56YeYkmCnlc6y56fCq3dTYjoaq578pxijVLMKAG16xATxzds0Xkd
 1B2Xs00jTVv2LLOR3SJyopVcCVGAgKLp5ctjTpdzEWP4+a4CnslW6yOPkchob0TDC/lD
 IilA==
X-Gm-Message-State: APjAAAVpEIGtEYN6kZ903drdvHRXf0YVnvrwKhDZiwXicvVfNao7ufqV
 LqQ4kwWsrxEF6eEaRDgDNHg=
X-Google-Smtp-Source: APXvYqzQxHR6klWbsryLSFqR0c/1XNih7zjGRMlPPZPHnTcASTLHtzw0BN/J0i0aOEnryMviMbr4tQ==
X-Received: by 2002:a2e:6c15:: with SMTP id h21mr19252052ljc.86.1571834544253; 
 Wed, 23 Oct 2019 05:42:24 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id u10sm3445899lfu.94.2019.10.23.05.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 05:42:23 -0700 (PDT)
Date: Wed, 23 Oct 2019 15:42:02 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Subject: Re: UDL device cannot get its own screen
Message-ID: <20191023154202.051cd87c@eldfell.localdomain>
In-Reply-To: <aabe43c6-e0a9-270a-4748-09824ffeec33@pr.hu>
References: <536af56f-924d-f089-a2d8-180f4dee1613@pr.hu>
 <20191023104225.60f969a0@eldfell.localdomain>
 <aabe43c6-e0a9-270a-4748-09824ffeec33@pr.hu>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=K0jmkwaxbbfSxy5x5MJqqxqlVs7jaGVm0aBEBFDmj/g=;
 b=Moke7X7TLP60Pa9beaRz/kEA31mACrMayT6UYsYkhY2qg+dfHz0hbHbLPF0Cy8YDEL
 Q3RyKzYByMKk8bS2TFqKUF/q/UtvC6hqV8NfqB+Uhc5lE6cqWhqREq+OGVK2lvNa9ABP
 sconpqjvXm4J3g7sgCTJTERabH9pEFaDCj+jeIqQmAoJlFaTIVq+HqW3Ka3DInK7un3q
 PlADU6/FPRCAZHcNWp1jQ9qGNJYqzkQWzBkiy5UKDMiAGYL1LkHqrc8jlhp2ZLghA34d
 QMPXfkkMUb8YM9+JiARgl0PlcMAxs/ILaB5/qQre2cB7yVlkF6SPc7gxvfpvR1+w9n0p
 AOWw==
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
Content-Type: multipart/mixed; boundary="===============0596476077=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0596476077==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/GMgDn7cdFQRn_myhCw5C1it"; protocol="application/pgp-signature"

--Sig_/GMgDn7cdFQRn_myhCw5C1it
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 23 Oct 2019 14:12:03 +0200
B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zboszor@pr.hu> wrote:

> 2019. 10. 23. 9:42 keltez=C3=A9ssel, Pekka Paalanen =C3=ADrta:
> > On Tue, 22 Oct 2019 17:50:21 +0200
> > B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zboszor@pr.hu> wrote:
> >  =20
> >> Hi,
> >>
> >> I have the below configuration for an Intel based POS system that,
> >> while advertises 3 outputs (DP1, VGA1 and HDMI1 with xf86-video-intel),
> >> only two are usable. DP1 for the built-in touchscreen and VGA1 for
> >> the external VGA connector.
> >>
> >> I wanted to use an USB DisplayLink device as the 3rd output, with all
> >> three output using its own Screen number, i.e. :0.0 :0.1 and :0.2. =20
> >=20
> > ...
> >  =20
> >> The third observation is that while I am using this configuration belo=
w,
> >> so the UDL device should be assigned to :0.2 (and active!), it is real=
ly
> >> assigned to :0[.0] as an inactive output. See that there's no "*" indi=
cator
> >> set for any of the supported modes on DVI-I-1-1.
> >>
> >> How can I set up 3 different Screens correctly for 3 separate fullscre=
en
> >> applications?
> >>
> >> I am using Xorg 1.20.4 patched with the "autobind GPUs to the screen"
> >> patch from Dave Airlie that at least wakes up the UDL device and makes
> >> it visible without extra magic with providers/sinks. =20
> >=20
> > Hi,
> >=20
> > for your specific use case, auto-bind is exactly what you do not want.
> > So drop the patch or (since the patch is in upstream master already)
> > use the option it adds to stop auto-binding. =20
>=20
> With Option "AutoBindGPU" "false" in effect (equivalent of backing the
> patch out) the UDL device does not get assigned to ANY of the screens.
>=20
> I want it to have its own :0.2 bit that doesn't happen.

Yes, that's another problem. Autobind=3Dfalse is a step in the right
direction, but apparently not sufficient.


Thanks,
pq

--Sig_/GMgDn7cdFQRn_myhCw5C1it
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl2wSpoACgkQI1/ltBGq
qqezcA//boEPMcOps7FRrRT2Y0CZjKFzeQTOBY5r6svD8gQ9LfPxjtfyRbZGZojK
/OZf/zPPc8cRqI87enNrae3bw7i+Hg8Q48E2I403ObPTB7EaaXQohyqR42lhxamf
XHL3d0758RmUf3Rvgw3cEXtaoQ3uwx82PrNzZh2YVgRtHmzjhdPGRXDCzLh28UFH
+2ZDzltI3DlwFXRKUsz13x4IVM/b7mljFDfG12qGLPooHdb7sfrkHb7ZzK7SpUyx
AVV9p7UEYCkEtD+39YikqDR87JIQ8/XK3ZMRgeDCbPriTkHL0seyijJQVUKzuZaA
7xxlblF9Wpbq450BYcpYELI/kYzhKRG+UbbDCOYLvYp2iopVxBliycdGT/BCbvUL
mnnvNOIfnCemFM8Ov0gdjmNOmjszLiLosKw9T/4ScuEhd1CxCd1m5rUDo4Nlk1et
rsSga0+DelyIxf32BttLLo+xPAVB1iTTD2DLSaFuofmsO2Vkgzz5ssOA6b+oK2L3
EG9aIVWpvtdfjZitNxR32++6MTDm+BptfSX5vrKkxvl6GYD44+uHnhiKRg76Y7kW
4E98U4COqkbxIFE+VCDMEkOCpwkks1kakMd6jesZEmAVM0Xi445pgUyYzRaea5Q7
P1WcnbOAo0m7aY5qKi1U1yMHB8m8Czyalfkuc0z0x1czLNuvTe0=
=Tr1r
-----END PGP SIGNATURE-----

--Sig_/GMgDn7cdFQRn_myhCw5C1it--

--===============0596476077==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0596476077==--
