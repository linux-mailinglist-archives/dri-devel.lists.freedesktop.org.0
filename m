Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7E46E05D1
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 06:16:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67DA910EA23;
	Thu, 13 Apr 2023 04:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11FC010EA23;
 Thu, 13 Apr 2023 04:16:21 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id w11so13746272plp.13;
 Wed, 12 Apr 2023 21:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681359379; x=1683951379;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IVdcMCSPC9IdbB1xsDX6nGCc2/KXvPpMpeLbbNIoZdo=;
 b=ixhStj/lXF2Wb6en9bP6aQn57tdm/ux1IsYvjHemNcm/wBViqRJNPuEFXppLu0E/t2
 uleZxtEXXiVc6dyJrKWpl7HpfdmkOHFAgl1OxRTbZ9Q+uEQ3+rVyduNe/a/fuE60UE+u
 uZ/5TJDBkch0aS5/uXkpo8XWmMdTS+k8mFJbyHuzacE+aTvFivhdrHEBeACfuvbLCdcI
 FI1AtMgnxjrvfF4uBfUxdHZ1TGJXpM+5KJo/9hjgwHT9FlG40e2G5kZ8sK/AhU17YP4/
 adlzlQoYHHsl6QaDPE+7Q4IShVTBtt0Zrr+XFGq5yuPWPKSNP1ctOj5El1Bglxox+aGA
 j3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681359379; x=1683951379;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IVdcMCSPC9IdbB1xsDX6nGCc2/KXvPpMpeLbbNIoZdo=;
 b=lZdszs+v8JAOazI9TFM54oUKXNr605vbUUyozMpwNeUQxLdxYEvS3UHkACrp0zVy9z
 EgjCwI85gig8If/9IXB7gtKPTKbRqs1ZGkXL96Zb5PVaMTBEdX91KXrSnekkRH85P6yW
 DYlHr7JHZ/j0ODZDPC3zy/7FzmpjJ/JwxcpCKgPlOHOgOUbRqFcLkCAt2yFP/E04xrvQ
 ljuc4486agzuAUusDk2kOhhJZro7QFdT4TZU06sp235XGmqE979+JAOdXvY9AT+4ttJP
 ed0ngm2SL1PbWz+poKYdrBxpMuMHDROlzpHhfFoWFSVZ3zirXzun94xzSPdcFsiOckxM
 OV1w==
X-Gm-Message-State: AAQBX9fxvR/rWORJh417mcw9JD5VvouRH3gJEDuUeJsMPJRiyqVejqpq
 7+2EWwoSQV3/soawNnngKdI=
X-Google-Smtp-Source: AKy350ZxVVjpIXli7JXsRewIfhWAjg80eCXA9xHAm4QsrsGgjV6RpllcsCD234fzfx934OmJduhV0g==
X-Received: by 2002:a05:6a20:c110:b0:d9:33a3:e7c5 with SMTP id
 bh16-20020a056a20c11000b000d933a3e7c5mr781664pzb.35.1681359378790; 
 Wed, 12 Apr 2023 21:16:18 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-66.three.co.id. [180.214.233.66])
 by smtp.gmail.com with ESMTPSA id
 x47-20020a056a000bef00b0063418ea5032sm284183pfu.1.2023.04.12.21.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 21:16:18 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id 70224106755; Thu, 13 Apr 2023 11:16:15 +0700 (WIB)
Date: Thu, 13 Apr 2023 11:16:15 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>
Subject: Re: Linux 6.2.1 hits a display driver bug (list_del corruption,
 ffff88811b4af298->next is NULL)
Message-ID: <ZDeCD5HuM7KJt4fu@debian.me>
References: <6feae796-db3f-1135-a607-cfefb0259788@gnuweeb.org>
 <ZAGqet3U8AMm4Uf1@debian.me>
 <ZAOTU5CRwdEC1lGH@biznet-home.integral.gnuweeb.org>
 <87v8jetaik.fsf@intel.com>
 <ZAXT1B1GTlmA78Ld@biznet-home.integral.gnuweeb.org>
 <ZDYw0vVg7Y1oExJL@debian.me>
 <ZDaPNx7WSKeMqgmj@biznet-home.integral.gnuweeb.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bhJLHQiEgQvFLfqm"
Content-Disposition: inline
In-Reply-To: <ZDaPNx7WSKeMqgmj@biznet-home.integral.gnuweeb.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linux Regressions <regressions@lists.linux.dev>,
 Intel GFX Mailing List <intel-gfx@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 linaro-mm-sig@lists.linaro.org,
 Linux regression tracking <regressions@leemhuis.info>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--bhJLHQiEgQvFLfqm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 12, 2023 at 06:00:07PM +0700, Ammar Faizi wrote:
> On Wed, Apr 12, 2023 at 11:17:22AM +0700, Bagas Sanjaya wrote:
> > From gitlab issue above, I don't see any progress on bisection attempt.
> > Ammar, have you successfully boot Ubuntu 20.04 with v5.10 kernel and
> > test there?
>=20
> I am still using Ubuntu 22.04. Haven't tried 20.04. I'll arrange time
> for it this week.
>=20
> > Anyway, I'm adding this to regzbot (with tentative commit range):
> >=20
> > #regzbot introduced: v5.10..v5.15.103
> > #regzbot title: Linux 6.2.1 hits a display driver bug (list_del corrupt=
ion, ffff88811b4af298->next is NULL)
> > #regzbot link: https://gitlab.freedesktop.org/drm/intel/-/issues/8274
> >=20
> > (Also Cc: Thorsten)
>=20
> Not sure why you marked it as regression. I haven't even found the last
> good commit. It's possible that it's always broken since the beginning.
>=20

OK, marking this as inconclusive for now:

#regzbot inconclusive: Still on process on finding last known good commit

Thanks!

--=20
An old man doll... just what I always wanted! - Clara

--bhJLHQiEgQvFLfqm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZDeCDwAKCRD2uYlJVVFO
oyDQAQCpRHiwWX5dI6Er50EYf4tUXS1tL3eFJnh7YP059N3xcgD/WqgxlPTZGAiH
sI/ZeNdqtFgb4R4FLXyRHG1gh18ugQA=
=US0W
-----END PGP SIGNATURE-----

--bhJLHQiEgQvFLfqm--
