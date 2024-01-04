Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AD6823F24
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 11:02:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D130710E3FF;
	Thu,  4 Jan 2024 10:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F8310E400
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 10:02:46 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-7bb97d5ee3aso10033339f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jan 2024 02:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704362566; x=1704967366; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SsqoTQQ6S/KQGXZbxBXDB57O2mR0DxuaSI6RPEYNPsE=;
 b=eE1x7lyBw17e7/CfiY5r95kR1w2geEAJnIZOwo4W0flw7jv63J6Nr5V4Jo5c54pVWS
 BQOqEXiYewFlFgGdfnSbtkR8BMOsiFskZMy+WBp8pHLU8Ob9HVbjltFgpumPJ7jmSedM
 6xm7Cr+skOYn6v5yRtDN2W56OSbsv4MMgGd9JBBH1LgsWbH4uXfVxwu8+/PhDggkf/WK
 uNUPd7M3vVttuyg+ehA1OrW99yx1Cgw5lpwTrpcHMvCEdCKOxPImzZv8kRwEtW+WnczU
 y/hql1zV/6YyHhQDGq36HeloDGtpsqEgDso6HqBuAEgsGt2+8ng8k0zM7n9LCD/VdTT7
 5lUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704362566; x=1704967366;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SsqoTQQ6S/KQGXZbxBXDB57O2mR0DxuaSI6RPEYNPsE=;
 b=OA9pyY8wG55wssbrtuGRrgwVbO6rudY6gUQc1f8Vv2oQsZdD0HBq+eGk8j3/UhO1by
 /LEGYMWn4SAZWycI2CWJyuyl7VtpQSbryEkPAcKK/5/ftkbLsHPdgrYCQHpXPb5ahMjF
 onikhwq20dDP0RozmnlPOgVPVnBb4B+MmnyiW/Y7YNxB2FNJPqTVRXxS75Thvzi+Lcfc
 1ZtADzApBzGenugwMNN+cgK3CR5kAMtr+ACJ6DKUToAYmU52GFtHv3CBbvX9jXn3aHTQ
 wsZsxnlc0xtNX612qcaba+f36Pu9k1gVBIK7d6DeWj7I4MWGcxNGYJT8a9w9iyU8GBkL
 EwyA==
X-Gm-Message-State: AOJu0YyEI83JPre1NAJFTNnVblA2T9/QZ6JtPv8UFgfChIymiG9zVDu5
 LrqYucIAxkQ4wge/qQ0VYQM=
X-Google-Smtp-Source: AGHT+IHtMu0xJK7BgXR1mY9KqI8ZLSMyeedAVcmhyKe3ivPI1qN0EGK2LBFepnpRDMyyXgJILbV73g==
X-Received: by 2002:a6b:6505:0:b0:7b7:fac9:b3aa with SMTP id
 z5-20020a6b6505000000b007b7fac9b3aamr320812iob.29.1704362565707; 
 Thu, 04 Jan 2024 02:02:45 -0800 (PST)
Received: from archie.me ([103.131.18.64]) by smtp.gmail.com with ESMTPSA id
 g33-20020a635221000000b0058ee60f8e4dsm23870038pgb.34.2024.01.04.02.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jan 2024 02:02:45 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id 582A91837AF8A; Thu,  4 Jan 2024 17:02:41 +0700 (WIB)
Date: Thu, 4 Jan 2024 17:02:41 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: (subset) linux-next: build failure after merge of the pwm tree
Message-ID: <ZZaCQahr3t8CUumD@archie.me>
References: <20231221165805.0c4771c1@canb.auug.org.au>
 <170316329164.542553.8341559295114557258.b4-ty@kernel.org>
 <20231221125801.GG10102@google.com>
 <ZYSFUZf8NcK5vvLv@orome.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="QNFbmQpVZ93cppeG"
Content-Disposition: inline
In-Reply-To: <ZYSFUZf8NcK5vvLv@orome.fritz.box>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Sean Young <sean@mess.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Flavio Suligoi <f.suligoi@asem.it>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--QNFbmQpVZ93cppeG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[also add Jingoo (additional backlight maintainer) and Linus]

On Thu, Dec 21, 2023 at 07:34:57PM +0100, Thierry Reding wrote:
> On Thu, Dec 21, 2023 at 12:58:01PM +0000, Lee Jones wrote:
> > On Thu, 21 Dec 2023, Lee Jones wrote:
> >=20
> > > On Thu, 21 Dec 2023 16:58:05 +1100, Stephen Rothwell wrote:
> > > > After merging the backlight tree, today's linux-next build (x86_64
> > > > allmodconfig) failed like this:
> > > >=20
> > > > drivers/video/backlight/mp3309c.c: In function 'mp3309c_bl_update_s=
tatus':
> > > > drivers/video/backlight/mp3309c.c:134:23: error: implicit declarati=
on of function 'pwm_apply_state'; did you mean 'pwm_apply_args'? [-Werror=
=3Dimplicit-function-declaration]
> > > >   134 |                 ret =3D pwm_apply_state(chip->pwmd, &pwmsta=
te);
> > > >       |                       ^~~~~~~~~~~~~~~
> > > >       |                       pwm_apply_args
> > > >=20
> > > > [...]
> > >=20
> > > Applied, thanks!
> > >=20
> > > [1/1] linux-next: build failure after merge of the pwm tree
> > >       commit: f7baa9ccef93ba1c36a8ecf58c2f4e86fb3181b9
> >=20
> > Actually it's:
> >=20
> >   f7baa9ccef93b ("backlight: mp3309c: Rename  pwm_apply_state() to pwm_=
apply_might_sleep()")
> >=20
> > But don't bank on the commit ID staying the same.
>=20
> This is likely going to break the build on your branch because
> pwm_apply_might_sleep() is only available in the PWM tree right now. In
> any case, I've now pushed a commit that adds pwm_apply_state() back as a
> compatibility stub, so it should be okay for you to drop this if you
> run into problems. It's always possible that somebody else wants to add
> a new caller of pwm_apply_state() and in retrospect we should've
> probably done this from the start, at least as a transitional measure
> for one or two cycles.
>=20

Hi Lee and Thierry,

I know that we're still on New Year vibes, so some things are not up to full
steam for now; but since we're close to v6.7 release and v6.8 merge window,
hence allow me to ask:

Stephen Rothwell is still complaining about backlight tree build failure
due to f7baa9ccef93b, yet it has not been fixed so far. Has the culprit
been dropped/reverted as he requested? The worst case is the culprit slips
through and become part of backlight PR and Linus will likely not happy
with the build regression (maybe he had to fix by himself).

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--QNFbmQpVZ93cppeG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZZaCPQAKCRD2uYlJVVFO
o30uAQCpOUQNLZSsWEF7o4VwnEeONRRU8z0ZDQlzK20JAUQHPwEA2mqQa3jDEv5p
vSerVltHJ5q3FS1SCjRw9gKeiD+FjQo=
=wZkt
-----END PGP SIGNATURE-----

--QNFbmQpVZ93cppeG--
