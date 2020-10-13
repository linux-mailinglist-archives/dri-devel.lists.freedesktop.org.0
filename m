Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA5C28CB7C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 12:19:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95166E0D5;
	Tue, 13 Oct 2020 10:19:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75FC66E0F5
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 10:19:50 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id j30so19114287lfp.4
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 03:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=fxPKMb5izU78ACFq21hzVS2x+oPDFnwnN95aW1TOaKw=;
 b=hFnm5hI2dZYHx/dpDQEpi57HrnJC+E4UVCD/FFqeV5tMnc/OqJ3ogLHLJb3DUEnfcd
 +e+1gy7U4DuOEHmfWmhsY8NKc3ko+aTUsJg2U2t5Ej0RLY2Ow6i/89mjFHHPD+OVTRve
 fznB003yjWfRjhu7L2Mmj5706MkhiG6haqU3C3//JD1CtrFh0Kpc17L7M8/kFj4Eixab
 FsWgdXaweG8KbP5azfudHjUTSvWtfGS+ElnMRuFKHINjsXSKnY+LyHSFu+bb/mjVRD3a
 Vb2AaEb4ymfdqZ8kR7IXSLoIJYJ2GP4x/k6vjoABidL77hw2lD7Vwqs4XIAQoioO80+1
 Zeyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=fxPKMb5izU78ACFq21hzVS2x+oPDFnwnN95aW1TOaKw=;
 b=XfGiVDC+A4kN8LzbLT5uIWqPZb8/wZCcFrjiOHoQBCggUSWGBE1kL6NQntBpHGRKau
 nWnkE7kpyMKTHRgiVOhgeA9QmCtPMpE83rv0kSeQ+pRK6Sk1jOE3H7ieyxY6hD/NsZaU
 wmKhV4R2zxzbeCNl70wSyL5X/dWee9v9AiBNWQb8nkItvwt51hGVKdzr/Nkz6wdkxicC
 84TUh8crGUYoH4sG+sxUnEG31Ys78DlNHTjoiw8YV5/xf94XHVeVzOWkb4VqdN1ijfRu
 /NLInohoFghvHxp39V92OXy6JLbSf8Nal8nC6+WWE/zsqe/NA3q17h21AT9DH9XUERas
 KEPg==
X-Gm-Message-State: AOAM5327nZt8afI4tBEjxOOOS7qsj0j8NTmbtZtACUKKUW/0NnMxMNPg
 jmHaxHPlQ/WdKXPZGSKvaws=
X-Google-Smtp-Source: ABdhPJyPP4beS0yUvz52pmgTbd5y2kNX7URemLDVIe39rVSOeQWaTUUZHKd9qwdQA0+VGnc4QrLpsQ==
X-Received: by 2002:ac2:43ab:: with SMTP id t11mr6904320lfl.256.1602584388884; 
 Tue, 13 Oct 2020 03:19:48 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id c6sm2093885lfm.226.2020.10.13.03.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 03:19:48 -0700 (PDT)
Date: Tue, 13 Oct 2020 13:19:38 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 3/3] drm/vkms: fbdev emulation support
Message-ID: <20201013131938.73a5d1c6@eldfell>
In-Reply-To: <CAKMK7uHY_nrB=0-xkWi+FXFosCY1XPVXLJb+mGqDR+GpRZ6C6Q@mail.gmail.com>
References: <20201009232156.3916879-1-daniel.vetter@ffwll.ch>
 <20201009232156.3916879-3-daniel.vetter@ffwll.ch>
 <20201012132452.1241297a@linux-uq9g>
 <9ad2c6dd-9f3e-8b88-e013-dcb0e1fd8005@baylibre.com>
 <20201012142335.GY438822@phenom.ffwll.local>
 <20201013091410.06c98a1c@eldfell>
 <CAKMK7uHY_nrB=0-xkWi+FXFosCY1XPVXLJb+mGqDR+GpRZ6C6Q@mail.gmail.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============0669788363=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0669788363==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/F.izL.Okzu/h/bAVsFt+v.L"; protocol="application/pgp-signature"

--Sig_/F.izL.Okzu/h/bAVsFt+v.L
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 13 Oct 2020 09:53:44 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Tue, Oct 13, 2020 at 8:14 AM Pekka Paalanen <ppaalanen@gmail.com> wrot=
e:
> >
> > On Mon, 12 Oct 2020 16:23:35 +0200
> > Daniel Vetter <daniel@ffwll.ch> wrote:
> > =20
> > > On Mon, Oct 12, 2020 at 02:40:58PM +0200, Neil Armstrong wrote: =20
> > > > Hi,
> > > > =20
> >
> > ...
> > =20
> > > > It's weird because it the kernel is misconfigured and no console is=
 specified on the cmdline
> > > > this console could become the main console...
> > > >
> > > > It's a great feature, but couldn't this be a module parameter ? =20
> > >
> > > If you have vkms enabled in a distro, you're doing it wrong. =20
> >
> > That's really not a great position to take. I would prefer that
> > if a random contributor writes a Weston patch and runs 'meson test', it
> > will use VKMS to run Weston's DRM-backend tests on his machine
> > automatically, maybe save for some seat and device node access
> > permissions bits which distributions could be delivering as well.
> >
> > Just put the VKMS device node into a non-default seat, and Xorg etc.
> > will happily ignore it.
> >
> > For the fbdev device node, I don't know. Maybe a module parameter
> > really is a good choice there, defaulting to off. I have no interest in
> > testing anything against fbdev, but other people might disagree of
> > course.
> >
> > Why? Gitlab CI is still not running tests for every commit, just per
> > MR, and it might even be infeasible too.
> >
> > I am also hoping for a future where I don't have to build my own kernel
> > just to be able to run Weston DRM tests with VKMS. That means I want to
> > be able to run my machine with VKMS loaded and active at all times,
> > without affecting the normal desktop. I already have such a setup with
> > an extra AMD card, but you can't run most KMS tests against real
> > hardware drivers. =20
>=20
> I just realized that building vkms is no problem, since it doesn't
> auto-load. And if our Grand Plans with configurability come true, then
> your test-harness will want to do that loading and setup itself
> anyway. With that there also shouldn't be any problems with fbcon,
> since presumably you already have that bound to the real gpu.
>=20
> So I think we're all fine here, for everyone.
>=20
> Now if you built-in vkms, that's a different thing. And for that I
> really think a "don't do that" is the right choice.

Very good.

My remaining wish is that VKMS would be fully configurable and usable
by an ordinary user, but I suppose that should be solved with a
privileged userspace daemon somewhat similar to logind that hands out
VKMS "sessions" somehow.

Not sure configfs is the best choice for VKMS configuration, unless
maybe unprivileged userspace could ask for a VKMS instance with its own
configfs tree it can access without CAP_ADMIN...


Thanks,
pq

--Sig_/F.izL.Okzu/h/bAVsFt+v.L
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl+FfzoACgkQI1/ltBGq
qqe4MhAAsBOpey/2anWNUHk+wu9g1jNlGpy4qYKRNM0DQ3gCDnXbVSkAQM1L0Nie
p5J4xVyWcqVazk28IHkWUnvfRxx9Msv2XKLSyCRv3OCYkY8f8zbdrcgcSSBBWwMg
/2UcK26lcZHphT2SGzsiuX0M+tYtZAsWb8AKvI4HVOU1bNu8YwdSSCQMft12FmLB
/5k6ma5WPdMX3hSYYmNx/fdplYvYnlvJu2CkSe2BtAalb5Q7SMgV3qhI/WTpHg5y
tUWrr3BM2YBDOe8ioMnRXxptFvJdoZihJvxTCbBRTrGICavHSGcvGCNnmllT9x5F
ZqteRoQ/z8B+tGxPrrucMEN8sP3nzy5f+UDqEuTeWd1l/m4zN4HSJS07kRUS8jDa
uwi3ZovnHFj043/zI1egr0MPeticukhN3ZuI0jKkuq3YFhfyudq2u1oyLzf+nWyU
lDxL+SHuktW0wfWY8W1IPd5ynWDcdB03fSHzryd0XYJP0kqthQYJ2LUJ+QkBM3xr
BH5GJqsxNNFlDak6fqKUx5rNXYvhHds8BHiIz0EYxL/HxqjR4jIGExzLlTmAQfIL
Hb729ulCl2FEQ3k1XwtPEaE/ik/uP9F79OlBtCGvW0UUlRnhwxUqUUOmyz+G2ITs
5gJB2zsG7qi63W9tFyxokweaadt9TJXVpG9cRhUtTdyOrlgs+EE=
=b4tL
-----END PGP SIGNATURE-----

--Sig_/F.izL.Okzu/h/bAVsFt+v.L--

--===============0669788363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0669788363==--
