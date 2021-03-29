Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF3234C6A1
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 10:09:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E9696E311;
	Mon, 29 Mar 2021 08:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A476E311;
 Mon, 29 Mar 2021 08:09:31 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id 184so14850980ljf.9;
 Mon, 29 Mar 2021 01:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=xtbZYsv+BDEeYSBBrB3T0nHYv9KG1H/KKGnrekUwMOw=;
 b=hVJ9hn/HWZHVabUIMyFjW2efbUrx6bffdXZOkVKAbR8Nmpcf49Gy2Wsrh2Ft56oyT9
 2vEWoUq0DxVR7rUC+W95nh1snL1CJAtG8NOw6ehELWvSnAabGqUO9o+vLVOQWmVv5BFA
 AsdUP+RcN2lKXcVJ1uoy0o0Wcb+mgo/qHDR+MkKNPAfC2fHNL01i5DSzILGiOuHv94Un
 dJBWeSBlBbn3VvHRasEwCUInUGRpZrIVw1AFCnCKDf2cbPu3stOjvyWSoEKDdwuXVEaR
 TiV1m9ZDjCZ0MMc8/sXr0MiXiFzDQj+Ki7IaLP/cWtI2hzuP5SroJF8eAXsZx38tC4uJ
 yhTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=xtbZYsv+BDEeYSBBrB3T0nHYv9KG1H/KKGnrekUwMOw=;
 b=mTjsMlqEmXLU19H3qlWwX51T1AfRZYUdxQEVy8CYGWixgWhiCEkQ7ipdVdhJO1o4rq
 K8IAsawXr1KAjb1KAvtzWCx/It/YyWnx0rpVvzsWdZcYznk/7Y3WKg1rnU2N8hgbrmVh
 NXdkKHGK7pl51fk+vrVqx6006tQV/J9q9N/x0ln7nVGvZKt5Yi6xwJ0yny9CutAbq651
 JBJfL/JYuQGPdHD6qKZOqVjRoNBiCU7MX17jCn7nQoJ63TAaRfxifgl/V5uh9IGUKA2A
 xHz+TV5OL9ibdYMSzCn6bnD4i9cql30ROx6dQN6zmRFmBl3OEkmQdB0I0ATBs4tcd7zd
 o+4A==
X-Gm-Message-State: AOAM5325hyCehwh4Xa/7xfQHs82s7YLi9eY+0zm9PthrA2sVKUgNfoOh
 Ll1zIL4djE1VeA87EAOZNAY=
X-Google-Smtp-Source: ABdhPJx5F//zq5rPNfbcRxlQbV7ciYSXSiHJ1sWWpmSLQYcqCZkb9OMocrnN/oXZYtvh03gqE0Bx0A==
X-Received: by 2002:a2e:701:: with SMTP id 1mr16670130ljh.264.1617005370018;
 Mon, 29 Mar 2021 01:09:30 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id f8sm1751408lfs.143.2021.03.29.01.09.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 01:09:29 -0700 (PDT)
Date: Mon, 29 Mar 2021 11:09:26 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: Color mode exposed to user space?
Message-ID: <20210329110926.2a479842@eldfell>
In-Reply-To: <CADnq5_N9AqX=Lx=yVKCFQahREFT6SCER17KMbZyw-iQ2wnTVqA@mail.gmail.com>
References: <e557c681-4218-dbe3-4e92-f6eaf352b614@tuxedocomputers.com>
 <CADnq5_N9AqX=Lx=yVKCFQahREFT6SCER17KMbZyw-iQ2wnTVqA@mail.gmail.com>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Werner Sembach <wse@tuxedocomputers.com>
Content-Type: multipart/mixed; boundary="===============0752970391=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0752970391==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/=0L2r6027DOn/=jTydH60HK"; protocol="application/pgp-signature"

--Sig_/=0L2r6027DOn/=jTydH60HK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 25 Mar 2021 12:12:09 -0400
Alex Deucher <alexdeucher@gmail.com> wrote:

> + dri-devel
>=20
> I don't think it's currently exposed anywhere.
>=20
> Alex
>=20
> On Wed, Mar 24, 2021 at 5:11 AM Werner Sembach <wse@tuxedocomputers.com> =
wrote:
> >
> > Hello,
> >
> > is the information which color mode is currently in used for a display =
(RGB, YCbCr444, or YCbCr420) exposed to user space somewhere?
> >
> > If no: Where would be the best place to put code to expose it to sysfs?

Hi,

a very good question. Wayland compositors implementing color management
will be interested to know this, and even better, to explicitly control
this.

See e.g. Color Calibration Auditing System notes in
https://gitlab.freedesktop.org/wayland/weston/-/issues/467 .


Thanks,
pq

--Sig_/=0L2r6027DOn/=jTydH60HK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmBhizYACgkQI1/ltBGq
qqeW9Q/9GKNUGaHBd6pWYLY/fdPZm4RjkFPjB9uHlu69J1TmRsK1MsJwVAYErPbN
JZpocng8rCvCkgkE5m/d66E5rkrvO1Kmz1A/AljoxF3zCSnG/AejIT0m5w2uEPxd
0271lGAKzSaoNev1hMRo/6i424X7qcXQmDjsRt/KmXmHEwH3NUwRLvSi/g6kgP+c
R/HoTC2QX0LacCrRyvPNeR0i3o2oKZG3byrgVRc9oaoPSp3/zdHDIEXj3b1FWCPR
/p+L9tuLea+hNFHyLJJ/pmrB/duhitiG4Igsfi+lrvAWkHFhjEMfIVpzB1ygRgqE
obRMg34Aj54IN2ZfzGW9U4kuELP6fCyjUOC7J4scpNI+X7LVLLckmM0jMHVx9CuB
L6rZQV0J336JQ38Um/qMRaQODyxyBC6XJcsCvK7TEGZh/YNWeB5uVeGoxm243uap
bOMLVDB2dh1c2kIR2k5FnKbaiY2Ysgx9bdvTsq8z9nVTDe/RtuTGeGAgxd1rxSZT
h9GYzuSFw1jFut8N1TY3Q/WvOPvzLoP/WgBOeXQ/VtKi9N1FdsbTaehtqfWcJ4bM
9FDN0TW/xBnZfcHxsD3rbievDdO2AB5dMPXeypVZe6obl5xtS0UE0CRPwAeQVqLD
+yUE1D3nbh605486ZpBsp5gJ9denBR0gbHP0bgRifjdABI5l5dY=
=Xo6f
-----END PGP SIGNATURE-----

--Sig_/=0L2r6027DOn/=jTydH60HK--

--===============0752970391==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0752970391==--
