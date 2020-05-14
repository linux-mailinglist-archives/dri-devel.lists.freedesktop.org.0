Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEDE1D29C0
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 10:11:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F04E089E2C;
	Thu, 14 May 2020 08:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF8889E2C
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 08:11:35 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id j3so2468502ljg.8
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 01:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=daE/qp2lRyMqE5ox4rLUjWqF0gJXG1Hf2MSmE3P8zuE=;
 b=d2OEFF/YGGFs2Z+rW4mwA8wfsXcr41dwbvYNA1D1ds/q+j4lV6m95EXY+HGIURC9OO
 btnfiDMiH5MAhXuLMB0e/U667i1BgNrmze2CmzItPV9UN79jNCKr6egKzNDptOjBwrwr
 pmze3ZKfUp0wF8DX9HFiYo4WF5+hqd9Svjihd9bXHbTktcItVB4CuP5zrOB/KAidS7IB
 DBXQRl9t/4KT1jHo4Ky7gI7p1mrQVJFYTpTapfgRkypo4fw9btTN13dIiU6P77Fb7q2S
 UrxVG89Cco5T9dWVgzcaJywOITcDlmZFYB0Nw/+m4/nIVw6LwgHp/n+pqo3a4Z4lmk1q
 QKbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=daE/qp2lRyMqE5ox4rLUjWqF0gJXG1Hf2MSmE3P8zuE=;
 b=RIJ2I62t/zAzeUQtJha9qlD+K9cBqALjh7zTaCZ/OQNx+miOOuuutXZ3rAHZzqfKDN
 2Z4TbnWBws2fVUpoxWHwb+4InNywyoiCdenvTIX//Wy7VpC3Lg4mnivB1grw1Gd/Tyt9
 E81hgzoLOa9gwq5nAUEanRmXCoidUWpKNElM8rwiJSAHiinKLPjs3L+eoE9EMWeQJQqi
 uQvzFaGN3XCoxVsk0GWdf4npaVvmrFbd8yZqFDYHZhfUUpwLpqkN/RpLX0OwR2SYEn+9
 i+hbmhW00aWobDUTLW7Wrn1XsAs32zen1Bj8cTMz5wfwgELBrdgmrdDtawkr8ltVz56p
 KQIA==
X-Gm-Message-State: AOAM530wKU4zfccIFSls1PblSpNPNtg+xMbk7cgnZ8Qh+Ujyleu7wJBz
 O8+wSN3O0Ms5qgBb8ambTk4=
X-Google-Smtp-Source: ABdhPJwCGU7JpJNr3yxx8+wJxAOcke6rA8L4v1AmqWENVtJ2WK1hBgztUH/KSVABglLMpttG2qPqbw==
X-Received: by 2002:a2e:8e92:: with SMTP id z18mr1834840ljk.195.1589443893430; 
 Thu, 14 May 2020 01:11:33 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id f2sm1016352ljg.98.2020.05.14.01.11.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 01:11:31 -0700 (PDT)
Date: Thu, 14 May 2020 11:11:21 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Rajat Jain <rajatja@google.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC v2 0/1] drm/connector: Add support for privacy-screen
 properties
Message-ID: <20200514111121.758d2f89@eldfell.localdomain>
In-Reply-To: <CACK8Z6FP-5BzhW6_wf=XrdN=9k9c4U9MaPBNSe7g5p5zCingWA@mail.gmail.com>
References: <20200511174724.21512-1-hdegoede@redhat.com>
 <CACK8Z6HG3sM-4cBYurHCba1jopk_5SVBd7KULEvOR27eKfxpyg@mail.gmail.com>
 <8f273c2a-2544-10fa-02f3-832cb1f398ad@redhat.com>
 <20200512172032.185de3d7@eldfell.localdomain>
 <a415bd37-ae23-9cd9-dff3-702824685a60@redhat.com>
 <20200513104943.34d92639@eldfell.localdomain>
 <CACK8Z6FP-5BzhW6_wf=XrdN=9k9c4U9MaPBNSe7g5p5zCingWA@mail.gmail.com>
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
Cc: Sonny.Quintanilla@dell.com, Mario Limonciello <mario.limonciello@dell.com>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Jared Dominguez <jaredz@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Mark Pearson <mpearson@lenovo.com>
Content-Type: multipart/mixed; boundary="===============0038623060=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0038623060==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/K3A5i7j4wHhPBnpc2pglQJu"; protocol="application/pgp-signature"

--Sig_/K3A5i7j4wHhPBnpc2pglQJu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 13 May 2020 11:28:38 -0700
Rajat Jain <rajatja@google.com> wrote:

> On Wed, May 13, 2020 at 12:49 AM Pekka Paalanen <ppaalanen@gmail.com> wro=
te:

...

> > On Tue, 12 May 2020 10:38:11 -0700
> > Rajat Jain <rajatja@google.com> wrote:
> > =20
> > > The chrome browser currently uses the API exposed by my (previous)
> > > patchset to control privacy screen.
> > > https://source.chromium.org/chromium/chromium/src/+/master:ui/ozone/p=
latform/drm/common/drm_util.cc;l=3D180?q=3D%22privacy-screen%22%20-f:third_=
party%2Fkernel%2Fv&originalUrl=3Dhttps:%2F%2Fcs.chromium.org%2F
> > >
> > > I know this doesn't help directly, but just to say that there are
> > > users waiting to use an API that we release. If these changes are
> > > accepted, I expect to see the change in browser again, to match the
> > > new API,  although that will be not until we decide to uprev our
> > > kernel again. =20
> >
> > Chromium counts as userspace, I think many new features have landed
> > with it as the userspace.
> >
> > Is that from some development branch, not actually merged or released
> > yet? If yes, very good. =20
>=20
> No, it's released (in Chromium for chromeOS platforms).

That is really, really bad.

You are lucky that the upstream discussions ended up changing all the
property names anyway, since now there is no way to ever use the
original names you used. Changing their meaning would have broken your
released userspace, and the kernel is simply not allowed to do that.

So that's a door closed for the kernel. Thankfully we didn't want to go
through that door in the end.

> > When you submit kernel patches with new UAPI,
> > it would be nice to point to the userspace review discussion where the
> > userspace patches have been reviewed and accepted but not merged. =20
>=20
> I doubt if that would happen - because they won't do it unless a
> feature is available in the kernel they are using. I can definitely
> create a public bug about what they need to do though.

Sorry, but that is the DRM development policy. Point your people to
https://www.kernel.org/doc/html/latest/gpu/drm-uapi.html#open-source-usersp=
ace-requirements

I have the feeling that the doc in the link does not underline enough
"fully reviewed but NOT merged to something that will release".


Thanks,
pq

--Sig_/K3A5i7j4wHhPBnpc2pglQJu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl68/SoACgkQI1/ltBGq
qqfT0BAAmTCj9uAiwSM0kH/8wZxpkDFsTjjsSVwXsWyNiPZiZXknkonIBqlj4dHz
r2LybRvAT2m5und5JncvPIrjQh6aMxXZrpaXIiTiW8+MFbVLh6QHyWV/Q+YhurNf
qnB6yPXr9gmNIWT50Jda4HBulEBHHKwCQy8e8R2zmPf8TYUKzJvbjBgvhxY1pD8g
r+UGtskHDMTqovkKWmawAeXa/l/dF4xVlee2uC0rvJrqC8mLkX3PDTEDVc4eH3Yb
VOX2UU9estH6sHbk9mEiTpJiS4oyPRqKqX10NpfUo64X1apiIMIACYHxsBROMRwM
GMWWPktYYwRuFUGIC5aIfXwaxbVhKGvtMQljs8CMeR7u5lkQDuwzaC6fUOuwRHD6
SBJhrWj+YJmcWwNaPmB2RDBNDhFAtjZJvwYocK1YewlW7i6aCesIxkFEHmwAYEtr
eRpA6QgFgfd8q4iBB+lC65ErF8VWTfoGsMyJ5xvC5fq7iWdpmV3YEAXhpmYybXG8
9yacq+qaEL6CCsev3hDBLIFbi97bPom2VPYYlpSvfyW4SwYimWzWK6neckDDS2No
IagCz68PgvfKYafvSdRKJl43kd5RrrXTyMYu0iBf+dnyMxLfsq6FoCozl3javoVY
XEc+vymqZbTrDrXoR2G1JKyl3O16IU4sRb+85fT1coMijR9Oh5g=
=i/Gg
-----END PGP SIGNATURE-----

--Sig_/K3A5i7j4wHhPBnpc2pglQJu--

--===============0038623060==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0038623060==--
