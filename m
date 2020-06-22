Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A28E6203901
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 16:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ABAE6E802;
	Mon, 22 Jun 2020 14:22:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 303CD6E802;
 Mon, 22 Jun 2020 14:22:03 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id g2so9749181lfb.0;
 Mon, 22 Jun 2020 07:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=hnHEW0PtmSzLmQIRTZqiJOXO64siEWMDKwk4JvVIiYo=;
 b=p5Nb53KljHviy1Ae5/DzN8J1HmqPP1AeMrKuYs9xjS5XAmsUFjcqIkOpGxIcO5sGLt
 80zV/lgKsHIVjCads6WRcY806AB+1MuN+7tijHuX6mddGwFs3fplAHZf7vRB07qaCIZk
 h/H7qY8YMHH3ZFsuf9QtxFrQTKhrpRwvpBsZ3awFzc9iwlOlESPjXY72OKismWslo80n
 BKOv+Bwv3TpgZhpvog6IQpCdwGNvNjpRJL9jQAlOCcno/aEavup4zDRrDpnh3uLOAfyt
 nYIfkNvCIfhbmPdOlNaJE2lkUs4I1FJ2D0BQuJnk6iSN5CYzlDd7VWQDio7PW52b4mKc
 5GXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=hnHEW0PtmSzLmQIRTZqiJOXO64siEWMDKwk4JvVIiYo=;
 b=lIV0CWPh+Hz6SSxvqGQB0Z8C8QQhAzs99Th8cZRG39OX09Ct6RRohfqRHo66OIC9kr
 AuaL1Fhd8itgnipgL1VGqbRKb9dIvNtSiBl3Px0jcfFRQ01AVvZlbkPB8A4OOjfDQ38F
 Q2BJ82wqSIUO1HzyyoSEQS0ZvUg2c//mUcksqP8ytgWDhORRBG5FiEWw3kDMmyT4SwPK
 5/ATOAw2cMRzllGttjwhztqZteA6VneQAZFSQ76lQh04lzw9nBgFcqO3vfWxEzrSFqi1
 iqnYuy0FA9OJRee/LouwLw+PwrKyV6Wk68loXpKd2hAyF3w2rVSNNhzMoj1epNLgyEGj
 cFPw==
X-Gm-Message-State: AOAM533s5USz2FimXSK+Tjx1/NR0zKW5v1Zzqwa3Q9xxVxLAapIg3g18
 n8lHeIeABJkEdwS2Xwg7AXE=
X-Google-Smtp-Source: ABdhPJxWkVcwyd/Mz8G/Dn0iyOPBDXraF1p3zcmT/3jvPiUABf84KHATZYzZbE70zgAgQjGBv1K0Ig==
X-Received: by 2002:a19:6a02:: with SMTP id u2mr10049109lfu.9.1592835721610;
 Mon, 22 Jun 2020 07:22:01 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id 4sm2736831ljq.34.2020.06.22.07.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 07:22:01 -0700 (PDT)
Date: Mon, 22 Jun 2020 17:21:57 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 1/8] drm: Add dummy page per device or GEM object
Message-ID: <20200622172157.49b835ca@eldfell>
In-Reply-To: <20200622093501.GZ20149@phenom.ffwll.local>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-2-git-send-email-andrey.grodzovsky@amd.com>
 <20200622093501.GZ20149@phenom.ffwll.local>
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, ckoenig.leichtzumerken@gmail.com
Content-Type: multipart/mixed; boundary="===============0780695557=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0780695557==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/gIzkqumkmVaaFjciwTB04lR"; protocol="application/pgp-signature"

--Sig_/gIzkqumkmVaaFjciwTB04lR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 22 Jun 2020 11:35:01 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Sun, Jun 21, 2020 at 02:03:01AM -0400, Andrey Grodzovsky wrote:
> > Will be used to reroute CPU mapped BO's page faults once
> > device is removed.
> >=20
> > Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> > ---
> >  drivers/gpu/drm/drm_file.c  |  8 ++++++++
> >  drivers/gpu/drm/drm_prime.c | 10 ++++++++++
> >  include/drm/drm_file.h      |  2 ++
> >  include/drm/drm_gem.h       |  2 ++
> >  4 files changed, 22 insertions(+)

...

> > diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> > index 0b37506..47460d1 100644
> > --- a/include/drm/drm_gem.h
> > +++ b/include/drm/drm_gem.h
> > @@ -310,6 +310,8 @@ struct drm_gem_object {
> >  	 *
> >  	 */
> >  	const struct drm_gem_object_funcs *funcs;
> > +
> > +	struct page *dummy_page;
> >  }; =20
>=20
> I think amdgpu doesn't care, but everyone else still might care somewhat
> about flink. That also shares buffers, so also needs to allocate the
> per-bo dummy page.

Do you really care about making flink not explode on device
hot-unplug? Why not just leave flink users die in a fire?
It's not a regression.


Thanks,
pq

--Sig_/gIzkqumkmVaaFjciwTB04lR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl7wvoUACgkQI1/ltBGq
qqcUyQ/+LaN0YJZlDsxGxEJmoZk0QpRB22ZJbPDZxPewRzpNIj5RRg4ozEgN4Kaw
rpI97WwpcQofRSX7FRuRlIeYPxCM51IdW2WtN/yvUunZmiXLmPaXD1HA8YxVTH8C
GOGSf0DQ1hZPqDjqInI2mYIBD8wW/XECqRqZPMni1hWKOtaBM7dLoYp1zXys16Hg
1UndNIRSQv9KMOTUzaGobsONK5wlsCvXiH6JQxL4OIJJ2FrS8DffY2JR8yAiASvc
8g2zK4enMK9jiARCIK3OKUQNbhONN8zcrc8uHH6ZbayWITrfDWmtjEWtj5rm+2pK
rIJxASlIxAWynNdlw5VixahFgF9giDdk/1RPdsxfdCB3Rn8uoYoCMDvsJb6VCgoY
7UTH2zfKaMPUX9/Et1c7DI1eCLZEEKFQZBKRomU77NfaDpawZPUuDKqvQk3MH2Zz
gsVL1MsrerBppeih+SrgBNVrYT6BmL5s8zn/yWY6YFZXIY6sH23JzETtkCEajCl+
bDdd8FxWWz0elA9Nt6TiXViQyar4TKg0MGq9fd/WnbHh8PrxIlz+dz5YU19GvELW
z4m2TSKpbSld4rGqFO4ptFeRLDOh47fZ2DJJc8/gGJ7Yz/zHfT+QOzOb6iNkRtGj
c31s/JTXnmbDb+ynpmvdhyFX/Q6LRDms+BO4AvPwNEtspU+jHwg=
=JfBv
-----END PGP SIGNATURE-----

--Sig_/gIzkqumkmVaaFjciwTB04lR--

--===============0780695557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0780695557==--
