Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F437A17DA
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 09:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C9610E5C6;
	Fri, 15 Sep 2023 07:56:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3065F10E5C6
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 07:56:43 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1c328b53aeaso15808445ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 00:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694764602; x=1695369402; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Sa23m9Sh+czmtoCmVFBbzydEhVvJnPH9LtopoO7enGk=;
 b=QRa0nJUsymWHVHi+xhl4j8toKjMQ50zHpDIX5Oa+l3OOdpRpYv66MnmhtKoAk/X/W7
 V937Y1V6u8Xm4yBGUwEHozbidcxGDe3qUMGb1A/bLcUh6qxijPwJ+j9OVzR3ZKPycsJc
 tAG5Qo7MOAWZq4RE03NshmcqNG2LZbBm3/2mpJDEwops3M8pAN5UUHqLFlAfwpdIA+Xc
 6r1fxhaJze1f4swBgQ+COlDfzy5FblS7FNj5aIQ4tyworw1s0NhqhHA1z2/MK1FOrgfw
 H2RVmEG3DFj1EV6CQRoAsglmRjda5HhtgzKIuxQ2keu84pHD+2JWrob2WLqy2ueBv8sa
 kjCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694764602; x=1695369402;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sa23m9Sh+czmtoCmVFBbzydEhVvJnPH9LtopoO7enGk=;
 b=DxV2gLl2FZffwW1EMypDY6V9qwH1ux+hQx3ysBQt+GAQMi6qp5O54iv7r4/rwxBugU
 YowOyv6NnwP5ANV92yrbCFfa434gJl3IuyUlOg1mRlZAcCqF8XBQPKnz+CN0WzSS1sXg
 0hMnjJrGzRa2pZt5V1BvT3lSPpUCoCb/Wxb7waeNDoc+AP2teLYahu2fR7Y1uc099R7P
 F3ql3E3uA7T+JMwKfoiFSOPLZWpWlcSa07HSU4LJUjJyUMi4om/65YfO2EWa9u4BVPIW
 6aEqfBjYOxL6BFkYETyLErPfjlfjosrJk7UNs7LLLsgwleJ7EEMY545p8j6A4ekJE+Ox
 V+Aw==
X-Gm-Message-State: AOJu0Yz5Hb/1Xdo6sH/UfTXXCsTdSujqDH+doB5Atbn5z5F3IdPrjkc/
 kU/RIURF5gBg1rEn2KeKjFk=
X-Google-Smtp-Source: AGHT+IE9RcRJ910CnL7JvJNrqjoaC0IFvFSCZdBwD31Y9Swflcx2melRR4bsTZgiId84hdnlKqufcA==
X-Received: by 2002:a17:903:1210:b0:1bb:7f71:df43 with SMTP id
 l16-20020a170903121000b001bb7f71df43mr1107314plh.34.1694764602592; 
 Fri, 15 Sep 2023 00:56:42 -0700 (PDT)
Received: from debian.me ([103.124.138.83]) by smtp.gmail.com with ESMTPSA id
 u5-20020a170902b28500b001bb750189desm2836147plr.255.2023.09.15.00.56.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Sep 2023 00:56:42 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id 88F408AA8414; Fri, 15 Sep 2023 14:56:38 +0700 (WIB)
Date: Fri, 15 Sep 2023 14:56:38 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: angus gardner <angusg778@gmail.com>
Subject: Re: [PATCH] staging: fbtft: Removed unnecessary parenthesis around
 conditions to comply with the checkpatch coding style.
Message-ID: <ZQQONo8biMWlCiG3@debian.me>
References: <ZQEKFR1OPoXGI2lO@midnight> <ZQERJIGOOeYxgX3E@debian.me>
 <CAC5tM5u8L50fAhReAmP0dqexSmv-PdZJKa_ES2hxZMp41MJjGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jzeagO5P9A3kQsYx"
Content-Disposition: inline
In-Reply-To: <CAC5tM5u8L50fAhReAmP0dqexSmv-PdZJKa_ES2hxZMp41MJjGQ@mail.gmail.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--jzeagO5P9A3kQsYx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 15, 2023 at 11:58:47AM +1000, angus gardner wrote:
> Thanks for the feedback Bagas,
>=20
> "Then checkpatch is wrong, " lol
>=20
> Ill double check my SoB.
>=20

tl;dr:

> A: http://en.wikipedia.org/wiki/Top_post
> Q: Were do I find info about this thing called top-posting?
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?
> A: Top-posting.
> Q: What is the most annoying thing in e-mail?
>=20
> A: No.
> Q: Should I include quotations after my reply?
>=20
> http://daringfireball.net/2007/07/on_top

Also, don't send HTML emails as mailing lists reject them away.

Last but not least, this is the third time you do parentheses fixup, for
which Greg's bot said:

>   You sent a patch that has been sent multiple times in the past few
>   days, and is identical to ones that has been recently rejected.
>   Please always look at the mailing list traffic to determine if you are
>   duplicating other people's work.

Again, read all Documentation/process/*.rst docs so that you won't make
mistakes again as kernel developer.

Bye!

--=20
An old man doll... just what I always wanted! - Clara

--jzeagO5P9A3kQsYx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZQQOMQAKCRD2uYlJVVFO
ozABAP9f4cJ4x4CFW0UEkBJrggxsKLo1ON0XZG0LmZPzzQI2JQD/fEkTFsH2KkSP
z0qFevhjEpUHaH2/N4WS6Tya9TaUdwo=
=iIZ2
-----END PGP SIGNATURE-----

--jzeagO5P9A3kQsYx--
