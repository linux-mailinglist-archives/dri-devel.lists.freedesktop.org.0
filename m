Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF42F36E90F
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 12:50:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D747B6E20B;
	Thu, 29 Apr 2021 10:50:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB7246E20A;
 Thu, 29 Apr 2021 10:50:10 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id l22so68535226ljc.9;
 Thu, 29 Apr 2021 03:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=fBz2hTypJluSjziKv7GgA1OX9KQuEuDahZYz6wgVbV4=;
 b=YXwoqfXY6XhKailBMEwyTqgvGcwttrIvQT8rYv5Sm6vVwAeTvmqPzBoifXPL0AdjXi
 R5o0QlZ5JJ2irXROA9a5ad6FRwz6Y04yCurAX22X7zCFu+rVxdM15irI2APRP4KYJ3c8
 XZF3MzFbC3h+dcdIujfVmCdirB134ebMZCDskDrbePNAD5n2kLlIpaq8iFtGU8LfdRVA
 SZ2wugQGvCM9a1x8+w94PVZTc3Lz/k5YKnTWEy5XvZzOVrYDp10me+6HD4Oj81aEajvM
 kvpDvrsY3vzHzeiqnou3hmsAg65MCbSXjOx6LOfXTlBwsPvtNYVvvSeTObBdk0oGpsht
 6K/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=fBz2hTypJluSjziKv7GgA1OX9KQuEuDahZYz6wgVbV4=;
 b=ejJiqIspldLzOnewsI9vzia6FTuC2xgoD64ilkQJkDHoIDuzig9fp8P/wBXMgZNHFf
 ftE7EsfzRt0s/zrwLRZKl0teRbRRGjSUL6sxyEvek5jUl4i+GdZnZFJiYfVTxQSUlyvM
 E838zpKjX5haG7ahVA3uTSaF7NWMfWl35sJ8XWd/mw8C0vq/XoA2PNGDc4Cp15FLLteb
 iPfD2GYqRCW42uJBPJH2EaA5FFhfk7PmEYnJE5vqWhxc/A+jBmN+PTrQVZWxqcrbZgr2
 tftqAfzHoNiYhMCc9ws7q16ZujSlva2LRv6gPmdiCIWJnsYesINY0Rz8BVWBmrpEwO4N
 RHrA==
X-Gm-Message-State: AOAM531dK8hQwtsgm0nbQrB2+FhoxfQF1BrGOnzY07pmyNrlTiN3Kr+u
 xeLsHXN5lEUAoOq2Ea2X8r4=
X-Google-Smtp-Source: ABdhPJwlRk9qDnL1ZGovlBVym9JL/cqVIFEi/RknzkvZxo7opMN02x95e5/dBlbs07lVEk73rRKkqQ==
X-Received: by 2002:a05:651c:211e:: with SMTP id
 a30mr24801066ljq.18.1619693409402; 
 Thu, 29 Apr 2021 03:50:09 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id e20sm482647lja.68.2021.04.29.03.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 03:50:08 -0700 (PDT)
Date: Thu, 29 Apr 2021 13:49:58 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: "Sharma, Shashank" <Shashank.Sharma@amd.com>
Subject: Re: Independent EDID parsing library
Message-ID: <20210429134958.446ef8c6@eldfell>
In-Reply-To: <BYAPR12MB31265E45A92C468AC1660EB6F25F9@BYAPR12MB3126.namprd12.prod.outlook.com>
References: <BYAPR12MB31265E45A92C468AC1660EB6F25F9@BYAPR12MB3126.namprd12.prod.outlook.com>
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
Cc: xorg-devel@lists.x.org, dri-devel@lists.freedesktop.org,
 "wayland-devel@lists.freedesktop.org"
 <wayland-devel@lists.freedesktop.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1995005582=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1995005582==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/p_hvVg0gKYWJI7Iznl+uf7D"; protocol="application/pgp-signature"

--Sig_/p_hvVg0gKYWJI7Iznl+uf7D
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Adding the previous list of CCs.

On Thu, 29 Apr 2021 10:32:58 +0000
"Sharma, Shashank" <Shashank.Sharma@amd.com> wrote:

> Hello Pekka, Daniel
>=20
> As discussed over IRC, I have prepared the first version of the EDID pars=
ing library, which is hosted here:
> https://github.com/contactshashanksharma/libedid/tree/master
>=20
> This is a simple C library, and I have created this library keeping a com=
positor's context in mind, so its easy for a compositor to use it.
> There are only 2 APIs in this library:
>               - libedid_process_edid_info: Get EDID information from raw_=
edid, returns filled struct edid_info ptr
>               - libedid_destroy_edid_info: Free the EDID information
>=20
> I have provided much information in the README file, and have also added =
two simple test apps, with sample EDID, to test it.
> Please have a look and let me know your opinion on this.
>=20
> Regards
> Shashank


--Sig_/p_hvVg0gKYWJI7Iznl+uf7D
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmCKj1YACgkQI1/ltBGq
qqcdDQ/9HSU3stmuAhcaQ7858GfGoyYe1DQKLc/dzQJHFhRXPB17qrQxrtWIPIL6
6lJeCKHVUBKTWpy/a7kgGMye1is5dDSk6mq0YkM4RT2gshLOpzcKM3z8hAMqJM1U
2vFOKhP26xWue4I5RcI7m21bK8p8LNcfpZVOd81pFxLwwEbHMiLhibbUhS/+XEx0
PgezX+Mug5tz8zI+VK3he4pvpJ8GHMrpD+nXT5cM0ylVJc1HvtGp3fXOHScVXJhc
JCO8L1aglbzQ7kMfIZ2En9FzpLwqtnT6wTdZVXj5496Lgp2tsix9xW6A17gSiRTb
JwAD8b4pmD8rJ0BUP2wkGhVk0OFuWk/cfThF66fvTTdM/Qd9mh8EoxcjRdMpJZer
oZysZuZydLtVGS9gEH8oSFN//wINPxDKQkAPqCzHSbrRepw5c0IlowT643peHni1
xeX0AK/HhKshg9bzV70rmlLcBA4QOXt5MY+g3Ktkj3fbqOKMRv8P0r+zqyvOXMud
utZ0A6y/RGnIF3u3zthlD8lAN2LT/uEcqWlA/BfLCvtwmPLE2twf3zQa8helrl2H
Fgsjmo9tzhg+cY4sHNBHXkd1cpNZiJ4UYLzi3hBx+gfPmh7F7XQ9krNu2yYYajpI
6A0/URISJwIH7j26FrIcrdHfMINQ3634ydRLdTFzXA9p2/2oNBI=
=dP8T
-----END PGP SIGNATURE-----

--Sig_/p_hvVg0gKYWJI7Iznl+uf7D--

--===============1995005582==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1995005582==--
