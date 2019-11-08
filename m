Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F7EF41FD
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 09:17:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D2B6F8A6;
	Fri,  8 Nov 2019 08:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 390166F8A3
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 08:17:13 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id j14so3739935lfb.8
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2019 00:17:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=YrTcIpyl4OPZWn6xw/VNOc0TyaE4MtarlxlLrC24UEc=;
 b=Hg2CE5sWNwjSBInDUJoEST45ps4WSSsSigzzFgZnrBxEa/KcAsezR4XqMIH3TuUCJm
 5NJIm6iNTGdMVeumM5V4Eyrb0oXDWJo9oOJmPzLeMJyeWSCGOvEtrajW5OQQEX+Bcc2b
 qQq6huxKInM/EHrzcbbzHPMsx2S/Eq9AJIZHl7IKhtYEI+OKScyBRcPlAiJnAi6l4sT2
 Dk5i1nq0Qyz1QhnjuxLsKwEojiNXUPaEE2n3B4ZDZEp1VDcxSV4FyP3Nw3Icma08NxSo
 D7ZZfyb+koMRR4q3xiKCkUPidpQp0Ps4REdBoH6H/6JsgWSZBf0kfPCQ0J93w4ZuaZ0S
 aRsg==
X-Gm-Message-State: APjAAAXzbTZk7pWoOfqfS6eOTVo9JhbdnGxBIoPJCH2N5JPf+ZGnfgxa
 2uaW1pgEggulIR7T9+p0XFE=
X-Google-Smtp-Source: APXvYqzWUHRpWndAvxI9CRz/zrr8sm2nS3mjGmuE4Dv55224y88WS8yt0NmosFx99p1HAnbHe4VfKQ==
X-Received: by 2002:a19:41c8:: with SMTP id o191mr5648665lfa.101.1573201031396; 
 Fri, 08 Nov 2019 00:17:11 -0800 (PST)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id w20sm2668642lff.46.2019.11.08.00.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2019 00:17:10 -0800 (PST)
Date: Fri, 8 Nov 2019 10:16:59 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 0/6] drm: trace: Introduce drm_trace() and instrument
 drm_atomic.c
Message-ID: <20191108101659.648ef44b@eldfell.localdomain>
In-Reply-To: <20191107210316.143216-1-sean@poorly.run>
References: <20191107210316.143216-1-sean@poorly.run>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=YrTcIpyl4OPZWn6xw/VNOc0TyaE4MtarlxlLrC24UEc=;
 b=FMZm+RJDO3ZRvGkuSebhdEMZuVTpy39tey1iB+qBFv3Un1NN6Ab87sXJZ9LhL8kR/8
 rymjvEsISvQ0l2RMceLMnysmGPBMAcIgaZXeQx7JtCvqRZhyMz0PWp2Hy7wUPdKYLnxM
 /cqfNG1dUO+bIlL0x9DQPgxzSGSfzdkJddxqQZ+M/mBgCGYrT99+dg8C++TrIuZBkNmd
 W9dNeyBcYz0tJJJ9/ubZ+pRBmXMmFqn+yFPW06RLfihG0DFN5X4SSV3v7nMgAn9ESLky
 Kg1+AWb0QkxqQdICBfHDHkUoJDcC7jiDK0XMDuX5EuhLYSAr31ogAUVYPSS5lYkIfvtX
 xjBw==
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
 Sean Paul <seanpaul@chromium.org>, tzimmermann@suse.de
Content-Type: multipart/mixed; boundary="===============0287474590=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0287474590==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_TbcpaacXfiuM4=uSVP/2yg"; protocol="application/pgp-signature"

--Sig_/_TbcpaacXfiuM4=uSVP/2yg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu,  7 Nov 2019 16:02:59 -0500
Sean Paul <sean@poorly.run> wrote:

> From: Sean Paul <seanpaul@chromium.org>
>=20
> Hey all,
> I'm back with another trace events patchset. My first attempt [1] went
> better than expected, with enthusiasm for the idea and distain for the
> implementation.
>=20
> As promised, I went through and added proper trace events.
>=20
> Before I get _too_ far, I wanted to post this set to get feedback on the
> direction I'm going. I've gone back and forth on whether to introduce a
> bunch of trace systems vs using the trace class enum. I've settled on
> the trace class enum since it seems more extensible and easier to use in
> production that just having the blunt "enable this system", or
> the tedious "enable each event I'm interested in individually" methods.
>=20
> So, consider this one an RFC unless we're all in agreement, in which
> case we should apply it :)
>

Hi Sean,

thanks for working on this. I'm not at all familiar with the trace
infrastructure, so I'd like to know how flight recorder type of
behaviour (a continuously written fixed size ring buffer) can be
achieved. Let us have a display server in userspace which in production
hits an unexpected condition with DRM and needs to record information
for post-mortem debugging. What should it do to have a trace log after
the fact to attach with a bug report?

I assume that is a major use case for this new feature. Is performance
profiling another use case?

Is it ok to build userspace to rely on these trace events during normal
operations, e.g. for continuous adjustment of timings/timers?


Thanks,
pq


>=20
> [1]- https://patchwork.freedesktop.org/patch/335350/
>=20
> Sean Paul (6):
>   drm: trace: Make the vblank queued/delivered events classed
>   drm: trace: Introduce drm_trace() and trace event classes
>   drm: trace: Add trace events for atomic state lifetime
>   drm: trace: Add crtc state trace events
>   drm: trace: Add connector state tracing
>   drm: trace: Add plane state tracing
>=20
>  Documentation/gpu/drm-internals.rst |   9 +
>  drivers/gpu/drm/drm_atomic.c        |  61 ++-
>  drivers/gpu/drm/drm_trace.h         | 563 ++++++++++++++++++++++++++--
>  drivers/gpu/drm/drm_vblank.c        |   8 +-
>  4 files changed, 609 insertions(+), 32 deletions(-)
>=20


--Sig_/_TbcpaacXfiuM4=uSVP/2yg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl3FJHsACgkQI1/ltBGq
qqe4CA/8CAI+Y6wnTgVLNoCyVUpjG/0FE8898iXA7MYVHgievEKBV8GqtNXJ9p45
Mvb4R5ViaxDuNSrMM6FDfbC8vmIos5QyQVxi/DVJXJDMtW9KHJLeH87/urXKL4/m
PizkevDHmMkUFptBYoH4lwo4X8irlAFjLVm/bRJ7zq7RlAPxPzLhr9TOCRB8r3gF
m57fHei8oviJ+FxIyQ/yXalZx4f22sUuwUnQcFuluEgn7bsAT/8962VVTQShKNJG
gneZTj8piqKYNd8+TujA03iEeU73mJ8ELP8Ib3bc1vOcKapKE/IpkHAKincZP1t4
lzs5WUcj08AQ9yR0VUo+TRpEOv2DjXWIjj9Yx4vOlP8i/2LzxjxDGrwHT5S0EgQr
j9jpcd+KIV7CsYwVV/6DD/IEeQnMcR+QQX9KmO5W34pKwjbtoeEFpMFIH2kNC0Cp
dpxoPCy/2AYZhXhwzMatanWHF4C8+wFf1NCaYeK9ERAm2kUUfq8M81/aOLxeoJbN
6mD5ZrawFYex1+/jk+BhuryH/Q7qxIlhwR9E2yU2bhbd+3hjdWFMlgyz2zGjgbzA
ZikFyE9FcGU7tmoUGjgXUo2BWF63uOHKA9xdaulZr78nwkB0y8+vFAFYmRYbBpuj
j85t/TfyuB/Al57pa4zL1emIp96/r7pxR1tI52wjnYr1TpLEufQ=
=CN4/
-----END PGP SIGNATURE-----

--Sig_/_TbcpaacXfiuM4=uSVP/2yg--

--===============0287474590==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0287474590==--
