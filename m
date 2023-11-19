Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3318A7F0660
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 14:24:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF21110E0AD;
	Sun, 19 Nov 2023 13:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD27310E0AD;
 Sun, 19 Nov 2023 13:24:39 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1cc0d0a0355so24068565ad.3; 
 Sun, 19 Nov 2023 05:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700400279; x=1701005079; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+BRkKo1UDNyPwLET0kko4yMFYg9wtyizgbwaduapHpU=;
 b=Y2J3M9LOEAOL3Ycv9QRJROX8446qvYnNQyvVxMAL/TiyOkj+PVZSq9FicmreYYfqvv
 yKxmgYzSSDIY2Vk/auYOEEGTR9Sx1sIKnMwq9M2XOpyWzsPv7BceVUMR6NMFfI3srYmk
 dx6tL4QhglsCBT/c9f8mlwfibJt8rqJ3GF81qqFWNdTQwhTGe2WEn5hMgTG289llOVuH
 GrsRp4m3G5FHqOQ1HMgO2AfnVHMlXOEg+ugDSNBVFlcwQLNRqTGrFad0FQeamjX6vGLT
 gG7Lpz+7RZCu2SEZRpY4Fw2nw0e4soMXypQgVvynR8PkVlZi2mle6bkJF6vWJ+yxfe3+
 DNpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700400279; x=1701005079;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+BRkKo1UDNyPwLET0kko4yMFYg9wtyizgbwaduapHpU=;
 b=Os2thxXaWpGt9SQeks7cOORhbdFNLdY5Yy6Ju7PyFpzbhcfOecc3ylnF+VEnxvO575
 cTYgKqO/Rotyj3CSA1qyI6JfpszzlB72gEa5BKBncotPgZHEtgSNmnWKJ0vhgeiuDjt1
 Jc4VsjMtlpt9fAtTdiCFdmnOu2WGJ8pjR4l7R8i+MwMvlPbSQ8icXdUewnrdKrweL38x
 +QzzrpyLqFqc2ial1ILpezzqPsMV2x6oLaLGl+usiCRCaqXoQXBmNNqqzlMnMZ7WJVsj
 FUg5jnVCo4LulIUR23+Jm5KTnV/g7K586gx5RdOTUPmiJJ+rYDre7XMEA8Wo3Lo6yRy1
 ne7A==
X-Gm-Message-State: AOJu0YwDuGtxCx/reM9v8Bx/y0tMUC8JXsuuEEB9NGV5f9fB0k/xI3Eo
 OH59ijs1gc86l8v2LiHZSCFfPaZ4gtneiQ==
X-Google-Smtp-Source: AGHT+IH+GUySa5SoJL2NpO5wI6AD3djXnM6Z0QKKx43P1ujsH4FL99jFgWVrO0t4Qct9yRRYsyuIag==
X-Received: by 2002:a17:902:70c8:b0:1cc:ef37:664a with SMTP id
 l8-20020a17090270c800b001ccef37664amr2876743plt.31.1700400279063; 
 Sun, 19 Nov 2023 05:24:39 -0800 (PST)
Received: from archie.me ([103.131.18.64]) by smtp.gmail.com with ESMTPSA id
 n4-20020a1709026a8400b001c5dea67c26sm4292539plk.233.2023.11.19.05.24.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 05:24:38 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id 3FFFF101D92E3; Sun, 19 Nov 2023 20:24:35 +0700 (WIB)
Date: Sun, 19 Nov 2023 20:24:34 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Dave Airlie <airlied@gmail.com>,
 Linux Regressions <regressions@lists.linux.dev>
Subject: Re: Radeon regression in 6.6 kernel
Message-ID: <ZVoMklvIVClr_IIH@archie.me>
References: <87edgv4x3i.fsf@vps.thesusis.net>
 <559d0fa5-953a-4a97-b03b-5eb1287c83d8@leemhuis.info>
 <CAPM=9tw-8pQWFso0zuLqpsqd5BSHWtc4As9ttdjY-DDr70EMqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="A17eLGPWZDe3T98X"
Content-Disposition: inline
In-Reply-To: <CAPM=9tw-8pQWFso0zuLqpsqd5BSHWtc4As9ttdjY-DDr70EMqQ@mail.gmail.com>
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
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Linux AMDGPU <amd-gfx@lists.freedesktop.org>,
 Phillip Susi <phill@thesusis.net>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--A17eLGPWZDe3T98X
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 19, 2023 at 04:47:01PM +1000, Dave Airlie wrote:
> >
> > On 12.11.23 01:46, Phillip Susi wrote:
> > > I had been testing some things on a post 6.6-rc5 kernel for a week or
> > > two and then when I pulled to a post 6.6 release kernel, I found that
> > > system suspend was broken.  It seems that the radeon driver failed to
> > > suspend, leaving the display dead, the wayland display server hung, a=
nd
> > > the system still running.  I have been trying to bisect it for the la=
st
> > > few days and have only been able to narrow it down to the following 3
> > > commits:
> > >
> > > There are only 'skip'ped commits left to test.
> > > The first bad commit could be any of:
> > > 56e449603f0ac580700621a356d35d5716a62ce5
> > > c07bf1636f0005f9eb7956404490672286ea59d3
> > > b70438004a14f4d0f9890b3297cd66248728546c
> > > We cannot bisect more!
> >
> > Hmm, not a single reply from the amdgpu folks. Wondering how we can
> > encourage them to look into this.
> >
> > Phillip, reporting issues by mail should still work, but you might have
> > more luck here, as that's where the amdgpu afaics prefer to track bugs:
> > https://gitlab.freedesktop.org/drm/amd/-/issues
> >
> > When you file an issue there, please mention it here.
> >
> > Furthermore it might help if you could verify if 6.7-rc1 (or rc2, which
> > comes out later today) or 6.6.2-rc1 improve things.
>=20
> It would also be good to test if reverting any of these is possible or no=
t.
>=20

Hi Dave,

AFAIK commit c07bf1636f0005 ("MAINTAINERS: Update the GPU Scheduler email")
doesn't seem to do with this regression as it doesn't change any amdgpu code
that may introduce the regression.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--A17eLGPWZDe3T98X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZVoMjwAKCRD2uYlJVVFO
o2QaAQC6Z6Oet9ctoQNb/3mlbO7qKOQNiQjysEw57sJGJ5fCrgD9EY2N+PxFc4ZM
7JJJBQvw63BIl4tWd1RfxzxM4knFaQw=
=1kus
-----END PGP SIGNATURE-----

--A17eLGPWZDe3T98X--
