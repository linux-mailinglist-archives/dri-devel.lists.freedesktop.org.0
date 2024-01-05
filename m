Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBB4824CD9
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 03:20:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F24710E0F8;
	Fri,  5 Jan 2024 02:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E37510E0FD
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 02:20:28 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6d9bd63ec7fso742095b3a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jan 2024 18:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704421228; x=1705026028; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bdKKoG5sMgJHVoUCvXqbwYc32tQqsp4CLU2LbLkdqVc=;
 b=H0CFeSnJfiQqCYHhh8KVCB5bfu0PRqLU0yF6VVEMDRpIPxzOTXPzk94SO+8kbAjCFN
 CoUEZGoAqopfbTwdBw5WozSl/tFmuzjRfEhX7GBHPMBLn6p7CxkC08Ri+6CzJRDzbpxp
 dlAtide9Cb5lNdF+vjDIJmJDx6Y0pPdqPK6fuRY662sQBIhm5d7MUmZelT5aiS+mIYpr
 byHBzrdBmX2LUp2SSq/JfxtxnbYzatUjx01xAmpUG3A1uAVLmUq7irMnd4XTpiGD5DnG
 8hQKB9bhopoKnIG1kgwFR7xWZGNgjhbGP0kvjeZ/DqTVWYuWkHgUE/xP1rpnCxXuxQa5
 T9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704421228; x=1705026028;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bdKKoG5sMgJHVoUCvXqbwYc32tQqsp4CLU2LbLkdqVc=;
 b=a4NicigW6APP7bxcoLSIoft1FY22oYlYF5L5ho6H5bRVjCygPpBDfl78kuwaJO+2sO
 /o4jsPniQ4+YTTIg7qndoLiKeY6DiyAMsBBjma08L076ITGKHA7r3UrjM4++GQXdb9ZQ
 56UaXHYQ79HC1qSl84n9eWwbX2RP55S+C0Dpdef8Hx1LWDe+SUq1mbGjp8GKy6QMgaUi
 lQchrw8Qc6Ty5P/NOGCvpg6wok3pqoB516hY8ERXeWaBsgPioA/eXKYlu8bS3hdkvlc2
 jhBVffvjsqtVB9VunBEZ5jIODKHgr8yuIdTAm1zysY37AtjuirIsAq8excSzmXJC51co
 5t2A==
X-Gm-Message-State: AOJu0YwZDLNRKw7rX+IKvI0dYKR1RvSH2WbAUuREd0GwGRg55VpfIpKF
 r+w3L3kmSMveqDQiHqMYk5Y=
X-Google-Smtp-Source: AGHT+IFpoDDyUe8N3BJdgkWMF9hUnYUE2Yhvonrt4B2jMoOifNj9mkPaYHPrW8tTywQc7F/N0yCJSw==
X-Received: by 2002:a05:6a00:4604:b0:6da:16e9:9b34 with SMTP id
 ko4-20020a056a00460400b006da16e99b34mr123666pfb.67.1704421227888; 
 Thu, 04 Jan 2024 18:20:27 -0800 (PST)
Received: from archie.me ([103.131.18.64]) by smtp.gmail.com with ESMTPSA id
 w9-20020a056a0014c900b006d9bb4400f0sm318203pfu.88.2024.01.04.18.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jan 2024 18:20:27 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id 282F7183770AA; Fri,  5 Jan 2024 09:20:22 +0700 (WIB)
Date: Fri, 5 Jan 2024 09:20:21 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Sean Young <sean@mess.org>
Subject: Re: (subset) linux-next: build failure after merge of the pwm tree
Message-ID: <ZZdnZZKygnDyyb-T@archie.me>
References: <20231221165805.0c4771c1@canb.auug.org.au>
 <170316329164.542553.8341559295114557258.b4-ty@kernel.org>
 <20231221125801.GG10102@google.com>
 <ZYSFUZf8NcK5vvLv@orome.fritz.box> <ZZaCQahr3t8CUumD@archie.me>
 <ZZaplFvjLADNz-2m@gofer.mess.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="w2Uw4f0A5UHcdBF2"
Content-Disposition: inline
In-Reply-To: <ZZaplFvjLADNz-2m@gofer.mess.org>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Flavio Suligoi <f.suligoi@asem.it>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--w2Uw4f0A5UHcdBF2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 04, 2024 at 12:50:28PM +0000, Sean Young wrote:
> On Thu, Jan 04, 2024 at 05:02:41PM +0700, Bagas Sanjaya wrote:
> > [also add Jingoo (additional backlight maintainer) and Linus]
> >=20
> > On Thu, Dec 21, 2023 at 07:34:57PM +0100, Thierry Reding wrote:
> > > On Thu, Dec 21, 2023 at 12:58:01PM +0000, Lee Jones wrote:
> > > > On Thu, 21 Dec 2023, Lee Jones wrote:
> > > >=20
> > > > > On Thu, 21 Dec 2023 16:58:05 +1100, Stephen Rothwell wrote:
> > > > > > After merging the backlight tree, today's linux-next build (x86=
_64
> > > > > > allmodconfig) failed like this:
> > > > > >=20
> > > > > > drivers/video/backlight/mp3309c.c: In function 'mp3309c_bl_upda=
te_status':
> > > > > > drivers/video/backlight/mp3309c.c:134:23: error: implicit decla=
ration of function 'pwm_apply_state'; did you mean 'pwm_apply_args'? [-Werr=
or=3Dimplicit-function-declaration]
> > > > > >   134 |                 ret =3D pwm_apply_state(chip->pwmd, &pw=
mstate);
> > > > > >       |                       ^~~~~~~~~~~~~~~
> > > > > >       |                       pwm_apply_args
> > > > > >=20
> > > > > > [...]
> > > > >=20
> > > > > Applied, thanks!
> > > > >=20
> > > > > [1/1] linux-next: build failure after merge of the pwm tree
> > > > >       commit: f7baa9ccef93ba1c36a8ecf58c2f4e86fb3181b9
> > > >=20
> > > > Actually it's:
> > > >=20
> > > >   f7baa9ccef93b ("backlight: mp3309c: Rename  pwm_apply_state() to =
pwm_apply_might_sleep()")
> > > >=20
> > > > But don't bank on the commit ID staying the same.
> > >=20
> > > This is likely going to break the build on your branch because
> > > pwm_apply_might_sleep() is only available in the PWM tree right now. =
In
> > > any case, I've now pushed a commit that adds pwm_apply_state() back a=
s a
> > > compatibility stub, so it should be okay for you to drop this if you
> > > run into problems. It's always possible that somebody else wants to a=
dd
> > > a new caller of pwm_apply_state() and in retrospect we should've
> > > probably done this from the start, at least as a transitional measure
> > > for one or two cycles.
> > >=20
> >=20
> > Hi Lee and Thierry,
> >=20
> > I know that we're still on New Year vibes, so some things are not up to=
 full
> > steam for now; but since we're close to v6.7 release and v6.8 merge win=
dow,
> > hence allow me to ask:
> >=20
> > Stephen Rothwell is still complaining about backlight tree build failure
> > due to f7baa9ccef93b, yet it has not been fixed so far. Has the culprit
> > been dropped/reverted as he requested? The worst case is the culprit sl=
ips
> > through and become part of backlight PR and Linus will likely not happy
> > with the build regression (maybe he had to fix by himself).
>=20
> This should be fixed by 9a216587a03df, and on current linux-next I can't=
=20
> reproduce the problem any more (x86_64 allmodconfig).

OK, thanks!

--=20
An old man doll... just what I always wanted! - Clara

--w2Uw4f0A5UHcdBF2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZZdnYgAKCRD2uYlJVVFO
ozZnAQCIq1pIwZLfPonLM2X6j/segPauOJ/3srupo9smbstFPgEA2vMrv0GGTvjA
8UO4PwaPrS7UIn+ScGfmOiFvn2U8mA4=
=8d7a
-----END PGP SIGNATURE-----

--w2Uw4f0A5UHcdBF2--
