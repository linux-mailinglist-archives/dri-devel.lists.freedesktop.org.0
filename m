Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 045B8295952
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 09:37:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10EF16E1A5;
	Thu, 22 Oct 2020 07:37:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DFCE6E1A5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 07:37:01 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id a4so849554lji.12
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 00:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=vaNhXr5oWRKlidAiUwmhNl2Iw1Q0TcJyTchjUKydjoI=;
 b=LAKFBmLihNR4irf43P2P0pXMtLed3Nbw2AOJqU/BP7N+D9KvikgrG7Ge1fptR5Z4xY
 VSwZNmfcqaxtHR/mZvCj1PVRKbi+qL1YdqU3764TDb4nhIu5oouShkomOjpBc+KACQO6
 SkjsA4I5aZyaxrQdR2gInciDxCYJqAu5tpuxi6GcUsAr5xG8Xfi/+qSy/bGW0+Xb4Bdu
 J/cM3oJ87flbf698Pm5Px1LHhzwN4/oqNd73W+BcLZtent0eONtGRNllAvT9Eh+wrflU
 kmxg67p3MFDfMcq02abcT/2ZE5/psU9saaRdtpvQW1ghp6oqm3Fxc/nEzCD/pl6aPEf2
 wYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=vaNhXr5oWRKlidAiUwmhNl2Iw1Q0TcJyTchjUKydjoI=;
 b=ZhnF4UekWEBqrwxqQGzAkzh0Ex9GSfD5tRaG2E8uDRbYBQNUWZoQoOMApmpBKPy0P4
 mxUT/7dCtBRFpbWrK8H34lmIH4kw/UTNfiUGllT9gTQNWB/yRoyNZ9LcCEkvJgtyWtjS
 RkMcKIiuXN0Z0tDIlFXgcXoOPxRexBsAscuKre0SnLX86QXjvfnOVlXDj4ItAaI+OaRM
 t8W0ugp3hDnT0W6B7IERys9MZxQfS5SLmpBdnavxLZK1bPoGugW8wxpOJ6zvn67A/ZHO
 OxZyn82Ra0uHQMjnhZsWkR2rW/X8dU9pQJOjAR1wpAx08XQV3C6csDKVKl16acbDY68e
 /RCA==
X-Gm-Message-State: AOAM530qTzr7engnl4F7OH0VkLtZ0QR6sURFFFBWAlDVtQmVCiE/15nY
 H3q6IEg2doZC/ZGK+9/+ocs=
X-Google-Smtp-Source: ABdhPJyxjUTPsuMDXvU4tDa4db2+e1KegXhCjKZxz3NPD32Kttr0FDbyBm9D7+v5xu6vw4yOBVFTaw==
X-Received: by 2002:a2e:a40f:: with SMTP id p15mr532101ljn.261.1603352219545; 
 Thu, 22 Oct 2020 00:36:59 -0700 (PDT)
Received: from ferris.localdomain (85-156-247-180.elisa-laajakaista.fi.
 [85.156.247.180])
 by smtp.gmail.com with ESMTPSA id u6sm136297lfu.32.2020.10.22.00.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2020 00:36:59 -0700 (PDT)
Date: Thu, 22 Oct 2020 10:36:48 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ken Huang <kenbshuang@google.com>
Subject: Re: [PATCH] drm: add client cap to expose low power modes
Message-ID: <20201022103648.26c98d49@ferris.localdomain>
In-Reply-To: <CAPj87rPTSOiFosCfq+LpFaM_++S6Pd150VFuxMWS3gLMNXCp-g@mail.gmail.com>
References: <20201021065404.1336797-1-kenbshuang@google.com>
 <xyxxV-NdH-NcnbRURBYThCKj5j6VFLMi0twD2wptimtzrod1EyQ_Rp5BYQoQlVKUXsmZGxhrltrYBW4dgD4UDvgKSgW2CAzt_Q1e5bCNWlk=@emersion.fr>
 <20201021083415.GN401619@phenom.ffwll.local>
 <CAJxBc99xxc1S6CrE0KswPpY2Rf3KS0AQewNZQOfmOTbMWrtnTA@mail.gmail.com>
 <CAKMK7uECj12NaOeh3PzLM8C_oT=_bce515z-5rDGnjkKf92Htw@mail.gmail.com>
 <CAPj87rMc5=eBKRDJUg0VSCCWcvNk6_8vj1TZeJcK8oPdi=DVwQ@mail.gmail.com>
 <20201021163452.GP401619@phenom.ffwll.local>
 <CAPj87rPTSOiFosCfq+LpFaM_++S6Pd150VFuxMWS3gLMNXCp-g@mail.gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Adrian Salido <salidoa@google.com>
Content-Type: multipart/mixed; boundary="===============0000952110=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0000952110==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/qQ4rfNG95oEgNQakJhos/Ew"; protocol="application/pgp-signature"

--Sig_/qQ4rfNG95oEgNQakJhos/Ew
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 21 Oct 2020 18:09:05 +0100
Daniel Stone <daniel@fooishbar.org> wrote:

> On Wed, 21 Oct 2020 at 17:34, Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Wed, Oct 21, 2020 at 05:11:00PM +0100, Daniel Stone wrote: =20
> > > It makes sense to me: some modes are annotated with a 'low-power'
> > > flag, tucked away behind a client cap which makes clients opt in, and
> > > they can switch into the low-power mode (letting the display/panel
> > > save a lot of power) _if_ they only have at most 15% of pixels lit up.
> > >
> > > My worry is about the 15% though ... what happens when hardware allows
> > > up to 20%, or only allows 10%? =20
> >
> > Yeah exactly, that's what I'm worried about too, these kind of details.
> > Opt-in flag for special modes, no problem, but we need to make sure we
> > agree on what flavour of special exactly they are.

Hi,

I second those concerns.

I would also like to hear the reason why low power should be tied to a
video mode instead of being an orthogonal property. Does low power
depend on different timings? Different resolution?

Maybe extremely low refresh rate plays a role here? Or maybe it goes
into panel self-refresh mode that is somehow different from normal
timing wise?

How does low power mode interact with backlight controls? Does low
power mode automatically change the backlight control range, or the
control value, or does userspace need to dim down the backlight
explicitly, or what should happen?

What if userspace does not do what the driver expects? E.g. the
framebuffer contains too much too bright pixels, or the backlight
control is not set appropriately? What may happen on screen in those
cases?

> > > If we can reuse the same modelines, then rather than create new
> > > modelines just for low-power modes, I'd rather create a client CRTC
> > > property specifying the number/percentages of pixels on the CRTC which
> > > are lit non-zero. That would give us more wriggle room to change the
> > > semantics, as well as redefine 'low power' in terms of
> > > monochrome/scaled/non-bright/etc modes. But it does make the
> > > switching-between-clients problem even worse than it already is. =20

That would seem better to me too, but I got the impression that rather
than non-zero, many dim pixels would be ok in low-power too. So that
may require specifying the formula for how exactly to calculate the
percentage. Mind, that power consumption need not be linear with
luminance, so if power consumption is the primary factor then writing
it down as luminance may not be correct.

Of course, the calculation should be simple and conservative enough
that it can be used with many kinds of hardware.

Also, HDR monitors may have a similar issue: a monitor may be limited
to certain wattage, which means that either you can display a small and
very bright patch, or a large and not that bright patch. It's unclear
to me if the same mechanism would be appropriate for both limiting HDR
display power under normal conditions and cell-phone display power in
low-power conditions.

Maybe "low power" should not even be a yes/no property, but a value
range, like wattage?

I think the problem with switching between KMS clients is something we
just have to solve by userspace restoring also unrecognized KMS
properties on switch-in always, like I have written before. I see no
way around it given the policy that the kernel will not offer any kind
of "defaults" property set (which too would need to be explicitly
used by userspace, or maybe a cap to stop the kernel from applying
it automatically whenever something gains DRM master).


Thanks,
pq

> > Yeah, that would make sense too. Or maybe even add read-only hint that
> > says "if you're below 15% non-black we can do low power for your, please
> > be nice". =20
>=20
> If the hardware can actually do that autonomously then great, but I'm
> guessing the reason we're talking about separate opt-in modes here is
> that it can't.
>=20
> Cheers,
> Daniel

--Sig_/qQ4rfNG95oEgNQakJhos/Ew
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl+RNpAACgkQI1/ltBGq
qqfYgA/6AxYtFOY0RgzAkq1zupxUgxrzlbZ1Y1MRNvju21zixoyjZcDJxCJakIfw
Xlx4tVXaDWWH8xvW+RiXm1LKUVEie6PAZuK2ySrFccdwZRcTQJOZywAG9mTRtgrw
jKbqHX2QMqioyT/AUo1ged4OEWRx7IzejlFCEgJdHEeYE0BWrEMliZZ/7xZt9dkw
038MfLcSAbCPLwYWNcmocO5SIfHJxvfPAXAwQCFh0qI9joTNug3X6RdpsCLgf20L
ppJIRRZMKaipfx8DBDi1TUzvwGGYLqwKZWfHihnsltvMoEdBhsE29LZ4uVvbfcAu
Yip84N0HZ9aeZcVCchQ58RhgaZcUrDjxh/u0ervm+zVUNNvWpAuVtyqctRHPYCDi
sXZ1krtJnkW454COIZcXw3SqOpQoW3CyrjW2jeDhmaDWrR1dQ88+3Y8NBB6bX+LP
i1KM2K7rUwQmz88tlfd/blSr1pNu9WWnpVwF3BDwAzAm/JNBcUw1dFbk5LCP2GxZ
g43NLC1X1uXf3AiCWu6cGf5esksHrfaLdm999r23uFWhIKyvlIkTK4ObRZy7v55G
ZMh9850AwEyUlkfskNQCj20CBXllwXsunICiCYMWsQSmcguYtybRhmBjaiQPUduG
jDocZfvmMAy3iYH69tvnop4nse8FFvQyx538MIA0whhduwOuZnI=
=Kds/
-----END PGP SIGNATURE-----

--Sig_/qQ4rfNG95oEgNQakJhos/Ew--

--===============0000952110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0000952110==--
