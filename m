Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 974B54DAD3C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 10:10:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59F1710E580;
	Wed, 16 Mar 2022 09:10:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9838010E580
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 09:10:12 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id w12so2627026lfr.9
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 02:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=VZ6ofM8ou68e7YnPjx4KJBxVWRlqaqdrmiLEpd1Voks=;
 b=YaesKL+/o2VEB71FT3zW1A8LD0eg9MLdYwEcn5ZY/IgV4/SA5W+tZ97C85aS2aaAyN
 XpNVYyierU+yGWaWyY79K+dQXH9w94T7tZtO9xWjOCLYf7raoIvAVP6sFRxu1eccOSPY
 e9wP1CI7Y7pZ3Pzmi3DvdHp3sDbyCRHbHv+qSVHw4jUpkvo2T68FBTnjfWteEB294lr1
 G/TLcSLayrmnV+2GE5hix73rOmaPGD+97YeDYZRwp1IRIBFoxaI8V2M34PX4yGMENCaC
 iaCq9MdOvKjdG7cXsFfxgeZ4XhxX9i7RE0kaEPnSJ5/BnCpQWdh/C54K7s8EBKddKjj6
 1Zlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=VZ6ofM8ou68e7YnPjx4KJBxVWRlqaqdrmiLEpd1Voks=;
 b=A2bCknyeIfrvo+iu4ltvVkUb4hw9UyiZZoLwKeCyJqyfTcshA9vTtDmshXbNRBmwnV
 H3/LRrqYtzL94g2KDmSRP9N1cD80i63RG0t/d0vM8RJAWzRXhFfHl7qQLghAYxLQrsGS
 Di2KoZdiCyVa1BWyYYf7oTnhm+OieJBISRNYIXxyagU9u+h6hvV5te6MNwOwd4YLMsMV
 e07bD3BxWC0gdBru03R/1Ly8NE6IFqS9vUuDvlRlp/3Ln1ZbEft0zHYoXVdbrk2PGnkI
 y/yMSm1ZdB+7z3gWxZp/iSX+oU8rOOzWh6orqszS4/gi3fF0HlwcHFzf9RICGfWxQdve
 QVtA==
X-Gm-Message-State: AOAM533z570pPJ50Fi4s2j8LrXfIriuzooxHaIfYo6s/2Z4fgxeLtsP7
 GSyi4Zdj/05IwVTo1dsyJVI=
X-Google-Smtp-Source: ABdhPJz/9igdyPinL7/DBxWJRbZqvRfkGcjd/kZIOukC/xU+/ftar0Yvr4H920gb+Bni8ttWmLYEUg==
X-Received: by 2002:ac2:5933:0:b0:448:3821:571f with SMTP id
 v19-20020ac25933000000b004483821571fmr18992642lfi.375.1647421810706; 
 Wed, 16 Mar 2022 02:10:10 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 br37-20020a056512402500b00448b91c5653sm102321lfb.131.2022.03.16.02.10.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 02:10:10 -0700 (PDT)
Date: Wed, 16 Mar 2022 11:10:07 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: Parallel modesets and private state objects broken, where to go
 with MST?
Message-ID: <20220316111007.6c194fd9@eldfell>
In-Reply-To: <3c8a7bec021ba663cc0a55bdedb7030a555457dd.camel@redhat.com>
References: <3c8a7bec021ba663cc0a55bdedb7030a555457dd.camel@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/F9jJzATOa8+UxwilOYImmz/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/F9jJzATOa8+UxwilOYImmz/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 14 Mar 2022 18:16:36 -0400
Lyude Paul <lyude@redhat.com> wrote:

> So, the actual problem: following a conversation with Daniel Vetter today=
 I've
> gotten the impression that private modesetting objects are basically just
> broken with parallel modesets? I'm still wrapping my head around all of t=
his
> honestly, but from what I've gathered: CRTC atomic infra knows how to do =
waits
> in the proper places for when other CRTCs need to be waited on to continu=
e a
> modeset, but there's no such tracking with private objects. If I understa=
nd
> this correctly, that means that even if two CRTC modesets require pulling=
 in
> the same private object state for the MST mgr: we're only provided a guar=
antee
> that the atomic checks pulling in that private object state won't
> concurrently. But when it comes to commits, it doesn't sound like there's=
 any
> actual tracking for this and as such - two CRTC modesets which have both
> pulled in the MST private state object are not prevented from running
> concurrently.
>=20
> This unfortunately throws an enormous wrench into the MST atomic conversi=
on
> I've been working on - as I was under the understanding while writing the=
 code
> for this that all objects in an atomic state are blocked from being used =
in
> any new atomic commits (not checks, as parallel checks should be fine in =
my
> case) until there's no commits active with said object pulled into the at=
omic
> state. I certainly am not aware of any way parallel modesetting could act=
ually
> be supported on MST, so it's not really a feature we want to deal with at=
 all
> besides stopping it from happening. This also unfortunately means that the
> current atomic modesetting code we have for MST is potentially broken,
> although I assume we've never hit any real world issues with it because o=
f the
> non-atomic locking we currently have for the payload table.
>=20
> So, Daniel had mentioned that supposedly you've been dealing with similar
> issues with VC4 and might have already made progress on coming up with wa=
ys to
> deal with it. If this is all correct, I'd definitely appreciate being abl=
e to
> take a look at your work on this to see how I can help move things forwar=
d.
> I've got a WIP of my atomic only MST branch as well:
>=20
> https://gitlab.freedesktop.org/lyudess/linux/-/commits/wip/mst-atomic-onl=
y-v1
>=20
> However it's very certainly broken right now (it compiles and I had thoug=
ht it
> worked already, but I realized I totally forgot to come up with a way of =
doing
> bookkeeping for VC start slots atomically - which is what led me down this
> current rabbit hole), but it should at least give a general idea of what =
I'm
> trying to do.
>=20
> Anyway, let me know what you think.

Hi Lyude,

as mentioned in IRC, I believe parallel atomic modesets on separate
CRTCs have very limited use, so serialising them in the kernel is good.
Any userspace that wants to reliably program more than one CRTC will
collect all CRTCs into the same atomic commit.

The reason is that userspace does TEST_ONLY commits first to see if
things will work, and then do the real commit. If some other commit
lands in between, then the test results are invalid and would need to
be re-done. So parallel modesets are a gamble at best.

However, parallel modesets are not just an attack vector, they can
happen accidentally through DRM leasing. With DRM leasing, the DRM
master gives access to some CRTC to another process, which will be
doing modesets of its own. These two processes will race each other,
not having any idea what the other one is doing or when.


Thanks,
pq

--Sig_/F9jJzATOa8+UxwilOYImmz/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmIxqW8ACgkQI1/ltBGq
qqcnEQ//ZncwyvLKDqBYWJBGuWKt3zKnluZGlQoMGUt8+gqXhFHhAz92gdIAdjRp
Ik30BLkkS5bng+1gT7vOCEOleH/h0T3opon2Zfp4JnnWunQaBpAuPS4VNsYi5VYP
Ex3RGv+4HWYWKOrS5o/U2VmZOXvD2zQC4KIR9+w/s/2DV6xKF/xlaf+4lpauHnn5
q+/QYokNwUCeNC1twNfUh9OcxgP90ikP5YNAk0C+Xhd7YFKS7Awg4YmBiFbC5lCE
DUw1hBjyMk/8gEZ9X4RJKcjci8GyXckQojMIWP7xGTxx+LDATD7IhK7zot6q1Cur
KBlawTWLil5/KrvtH11RWfNs3o5uxENdZk6/BOWUpJpznhG1L0kSfSKwabZxpmTx
90kLKR5f5yqG2dzx8T6kqzaQbF0mDGy+NpU3PCyYOHmFnyR+o//KzNBXMbvO1Cqy
GflfRARWmCi5pN2njR0FiLeRdDLlf4CGco5VkPBlsSm1FGzYWhZhmXFu/pJD6H8w
qF7YFPx3CNMQyLqXgAT9gtyFIFNdPYdCuxbIbnSqfpVkI8VJnpWYIXRQt+ZP/1J1
+1KVoH7aV0A9yi9EQz/3BWJHXTwvSRulC/cl+clJzB7aSGngoPaaXh+X7CvveaZh
yDbiVL0WX8Ns8DwPokLOBl2CiM/zHiTW8bFkCG/qp1jVllfSzOo=
=7XGN
-----END PGP SIGNATURE-----

--Sig_/F9jJzATOa8+UxwilOYImmz/--
