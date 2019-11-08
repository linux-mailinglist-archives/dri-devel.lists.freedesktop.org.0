Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A16FF4DE2
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 15:14:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0214A6F9A8;
	Fri,  8 Nov 2019 14:14:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2174D6F9A8
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 14:14:36 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id t5so6403384ljk.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2019 06:14:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=S5xQsxTRD9v398MxaxODAzxI1XXxWGLGvfx8IXp/RPA=;
 b=atVnEI3SRI5on+3I7rX6eFkNz87XVKF6RWxr8m+6B68Vk5HSCHE5CJ/ORTZf1FpJIE
 JpcocrPHouLsnP1gF3ibvG3Obetqn2CC+Qma2aa8Jr2YJIOCWnm7gGoK6udorqdTwu7o
 VR/vcNUHiYhvJiDK3g1v9pjWIXlQfzovcP15yesW5WoH+qSdO+hV3azh9k8JVAChkV4O
 YQQ4tLYeh3z8W0+WNu4NqlkY+NfQQvzDoccAyeqCOPagh1/yJwoh7Tn1KPItcQZPp8hC
 E6adsq7cLJVKRejb3UdtCsOqFyxU34sDVHTTEw2xKu+7P3S5b2SlnmMqaKDTjLU8IxYM
 O4NA==
X-Gm-Message-State: APjAAAVL/RZz2yuhb+SBw5BMm3VVoP/pzJVC349UYChNGr7zsOXqdGTL
 tb2vN36gWJFgR5qsyIKI8UU=
X-Google-Smtp-Source: APXvYqy7GkyWxuMjSszu/wfcVqsu9WPZO98uUnxyZP2JHk79JFdg73/MJduIAfYxFIAOy2waScZNsA==
X-Received: by 2002:a2e:3a1a:: with SMTP id h26mr7131021lja.25.1573222474501; 
 Fri, 08 Nov 2019 06:14:34 -0800 (PST)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id z17sm3077988ljz.30.2019.11.08.06.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2019 06:14:34 -0800 (PST)
Date: Fri, 8 Nov 2019 16:14:29 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 0/6] drm: trace: Introduce drm_trace() and instrument
 drm_atomic.c
Message-ID: <20191108161429.4111ee9c@eldfell.localdomain>
In-Reply-To: <20191108085030.GW23790@phenom.ffwll.local>
References: <20191107210316.143216-1-sean@poorly.run>
 <20191108101659.648ef44b@eldfell.localdomain>
 <20191108085030.GW23790@phenom.ffwll.local>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=S5xQsxTRD9v398MxaxODAzxI1XXxWGLGvfx8IXp/RPA=;
 b=AtoqFfmAGwlB/+TaqnTBA8vJF5nwPls4jp8Wc1ZvwzDNVZkJWu9DFPkPti1Q6ngPQY
 te+uu4AJgCuUVh0dneKXNbbJ1PDYKVImWOfGjdxHla7J/VTwKfknmvc1i02s/AkhY4Z1
 CZLUqUtAVJoEvwS+8LAxAGnGtkiZEy+0hba5AlkQ6i7hrdrwFtlVHAc3tlbfi7Vm4yyB
 korGafqOuR8f7KXhacluZ5Wrwy/IR7g/Ne6WaPqmOFQqyYkr6UDYTyjybNtNpSzct6/Z
 9vSDlbn+Ta3m/j5A5c3If28PSqlBBdTJbdlm/SIMJ+at553S2/J5L8eJFT1S7eywm9Z9
 oSFA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, tzimmermann@suse.de,
 Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============1470486216=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1470486216==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/RSvsu0nIz40KXCh_TFKzOcY"; protocol="application/pgp-signature"

--Sig_/RSvsu0nIz40KXCh_TFKzOcY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 8 Nov 2019 09:50:30 +0100
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Fri, Nov 08, 2019 at 10:16:59AM +0200, Pekka Paalanen wrote:
> > Is it ok to build userspace to rely on these trace events during normal
> > operations, e.g. for continuous adjustment of timings/timers? =20
>=20
> Aside discussion on this: If we add this (I think userspace might want
> some information about the point of no return and why we missed it) then I
> think we should expose that with an improved drm_event and clear
> semantics.
>=20
> If we start to encourage compositors to use tracepoints to figure out why
> the kernel doesn't behave (TEST_ONLY failure, or missed flip target), and
> use that for behaviour, we've baked implementation details into the uapi.
> And then we're screwed.
>=20
> So if you have any need for timing information that you see solved with a
> tracepoint, pls bring this up so we can add proper uapi. And yes I know
> that if someone doesn't we still need to keep that tracepoint working, but
> with all things uapi the question isn't whether we'll screw up (we will),
> but how often. And less often is massively better :-)

Haha, sorry, that particular question was practically trolling, but
OTOH something I can well imagine someone doing. Trying to fish out
reasons for TEST_ONLY failing is a much better example.

On third hand, profiling tools probably would depend on some trace
points specifically.

As for the uapi for a DRM flight recorder, I'd be happy to have that in
Weston as my time permits. Alas, it needs two people and I can be only
one: either the reviewer or the author. :-)

I can see two ways to use a DRM flight recorder:
- a file you grab as a whole after the fact, or
- a stream you subscribe to and store the results in your own ring
  buffer

The former is simpler, the latter would allow interleaving DRM and app
notes as they happen rather than trying to rebuild a log from
timestamps afterwards.


Thanks,
pq

--Sig_/RSvsu0nIz40KXCh_TFKzOcY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl3FeEYACgkQI1/ltBGq
qqchrg//VQzUEqQPpsRMCi7OaIE2EOTu4+mXR2M+U3mseIiRpI4N+vfsvaWel4l2
dugCvoeXO7FUKwn5GQedLZzJSLoteU03uwes35rOmkBQr88s23E4+xUm1FLn3ki9
s4qEIRrYSU9316dXbd0V9RBm8gzryJL6O2fKYKv6C4Fg6Z/8XqK7BmxbP1RgJ7vy
43nKGsAMopD5pTCZ3+EWk45YtZx9S4Px1RwQfjX4fuTGrFO+5WqxgkQmtR6UywEu
/OOConOFSsW84IPmTQuO1g9ntbROGOdEf1kkn7P1e/Iz9vu/+DBW9fR07z46ZnrN
idEcHTAYgLmLkYiMg4J1b7Tv9q7UPhYReh+dZ50Na8QgsE7EYmpsMkJVk/KxThCO
JRnro4Tm1IF3kM5caFIwsAYyPZhVtqLvkRSKu4pqPcOpvM6fYTOv88wzG72EihkR
//RsYQq0yx1GJ9mxUST6QuyU5awdopUWS8ESWXC5rIhY7ino66myxbJCCZYdPIY4
vMjmiR7pEzl5MH2nuT10tMoSobggyKwqwddoAe29j222fiaFiIXxdlA+SEGrfJ3b
quZG6VgKwk19oF8q/fFEDxMwUxxFPlyPh6vnCWw96amei4kXBdAGQQkwCazwXf3m
DEoqhrBO+BOhp0I8lJ+N8T5Hmonhgsz5H2VqWEBKfD4jz0s5zPM=
=pO0F
-----END PGP SIGNATURE-----

--Sig_/RSvsu0nIz40KXCh_TFKzOcY--

--===============1470486216==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1470486216==--
