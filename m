Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96120DA80E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 11:10:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075DB6E457;
	Thu, 17 Oct 2019 09:10:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB9CA6EA12;
 Thu, 17 Oct 2019 09:09:56 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id q12so1233789lfc.11;
 Thu, 17 Oct 2019 02:09:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=Hy1s5qBOipPdCc612UplfJSTsYxLuHrl23z2YQ5DVmU=;
 b=ZVmT9JVSsHNYqIkzh5vmpqSKS9m81fO6m8mg7bjYQjZMONB/3AU1SczPZp6P+YPegQ
 WmsmT3pishBe4JgtKOKurmP+H5i3bxcFQ4fYRtQJaSi65TokYDznaaGmNB2zhDekCzuJ
 euPqAy/gG5oaf0oEz2TkyzAgRjaXg8fS9RPwdrFgEMtlPmVxmU2U3pGLCE+GBaLHUz3c
 bFeQtsOuIta09x15EcUlpQmzDzrz8Q6KRfrtYLxWmwSK52G+F2grQrrOVn0P/KAAiXi0
 ugpVxz3IvojA1k/NKiRaGJm90eM190EYqwqgjzU8bfbbBbxRwlH1HNJfUOPro8IbOMss
 +HWA==
X-Gm-Message-State: APjAAAUWphPwfHazd8p4Cg0ENpZy0QAU8ipdyYSeleXTBkzqn2993Nzh
 MdTiZKPUhO56j4GQjGU+/Wo=
X-Google-Smtp-Source: APXvYqx76SitEOqtfeDor5Hrh+WeUwpBmKrqMo2NHtpi2fDd5R6RQtcPrnIWknGywOhCSawSpg3iNA==
X-Received: by 2002:a19:750:: with SMTP id 77mr1572490lfh.81.1571303395003;
 Thu, 17 Oct 2019 02:09:55 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id q124sm729482ljb.28.2019.10.17.02.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 02:09:54 -0700 (PDT)
Date: Thu, 17 Oct 2019 12:09:44 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: James Jones <jajones@nvidia.com>, Scott Anderson <scott@anderso.nz>
Subject: Re: XDC allocator workshop and Wayland dmabuf hints
Message-ID: <20191017120944.09877cd3@eldfell.localdomain>
In-Reply-To: <0c34116b-a234-f436-2691-55dca6aecaca@nvidia.com>
References: <febd361d-7594-e6f6-a55c-247e2c770830@anderso.nz>
 <0c34116b-a234-f436-2691-55dca6aecaca@nvidia.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=Hy1s5qBOipPdCc612UplfJSTsYxLuHrl23z2YQ5DVmU=;
 b=ByF5CECMiJ1HH2WvehCBtxjBoUasRprBBUprYrbNiVgdpAeU8wjrGmvMxRZ3/2XFXW
 vQ6ROpp3v/VQcZmqsaIvwcjhfC4Ru5PftaYN9vH42LCUvUapCWeOlrwlN0NUi0jKcFoN
 vrgx4THcGh103FNX9qRWLbFPm+zzUXZzNkpky9RwBowUIANgEbKfpwwNKe4ehH7v9k+M
 7HIKvvK//kBXvgMN1B56xRQI2xIr1+6C81wVajmBzhff7NfJgFOVIj2+1VPyiTq+RfDC
 ntLEumyXJdEBh5w5dc85JEbMDioa9j64o3H/x3Op+hH+hLKrifTihzePF6Y1J+xzEpeH
 1rmw==
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
Cc: dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1102992993=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1102992993==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Q.UyAlm1u+9aJK5b8Da2eZ8"; protocol="application/pgp-signature"

--Sig_/Q.UyAlm1u+9aJK5b8Da2eZ8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 14 Oct 2019 06:02:59 -0700
James Jones <jajones@nvidia.com> wrote:

> On 10/13/19 2:05 PM, Scott Anderson wrote:
> > (Sorry to CCs for spam, I made an error in my first posting)
> >=20
> > Hi,
> >=20
> > There were certainly some interesting changes discussed at the allocator
> > workshop during XDC this year, and I'd like to just summarise my
> > thoughts on it and make sure everybody is on the same page.

Hi Scott and James,

thanks for the write-up, it all sounds good to me FWI'mW.


> -As you note, this limits things to formats/layouts that can be=20
> composited (basically, things that can be textures).  "Things that can=20
> be textures" is a superset of "Things that can be scanned out" for these=
=20
> purposes on our HW, so that's fine for NVIDIA.  Does that hold up=20
> elsewhere?  A secondary motivation for me was that the compositor could=20
> transition back to compositing from overlay compositing without=20
> requiring a blit or a new frame from the client in cases where that=20
> didn't hold up, but I don't know if that's interesting or not.

It is interesting.

The compositor transitioning back from overlay to compositing without
requiring a new frame from the client is a minimum requirement under
normal circumstances in Wayland architecture. If a compositor cannot do
that because of a buffer format, how could a conversion blit be
possible either?

In Wayland architecture, having the compositor (display server) wait
for any client before it is able to update the screen is unacceptable
because it has a high risk of disturbing visual glitches.

OTOH, I have heard of special use cases, where all buffers should
always go on overlays and falling back to composition would be
considered a bug. For such cases, there are some ideas towards that at
https://gitlab.freedesktop.org/wayland/weston/issues/244 .


Thanks,
pq

--Sig_/Q.UyAlm1u+9aJK5b8Da2eZ8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl2oL9gACgkQI1/ltBGq
qqeavg//cG46lYsiXfQJOtNHRqR8RfG6jPzjwKvEdVh5FsWwN0iJQZBVoD8BW7oJ
A3l+/jwesUv7zbVa/H1bwHi3hfGUFk6oYGTgY4lNSXZbWVUREM4Us2XpNI4/6B4K
1Kp8878jbM9Cp+KkCJEQrgQWjbs1LWf7wFtE1YX6Asch7Sx4cG1rjmRZRJpYg83f
qLGabMWqn7KpEjVYz0m/UmXCmURa5LY/X9349mbBKjbdwcyU8gLKa3srTn6FIMTz
2YmNekm4m3vZTQreexxu8sF5isqGkqxRR/tnUyKrKTPS99ayzPA3o6vgULME4mw6
MG8b8WqmQgoBnC4JUN4m8uU6sGXc/Ep1wym3pDZqkgVwRjBxtV3F129Ob2Rq/dYp
LLCmSiabzKBsdWFN81GGiigu9IcWF9ID3C5l5CSvvmWN1FSWhjg47QjbZKuobNy+
PJ31hodSZTaGJJJjdDT15BAWNOJ5WZZlavZAn4AjA2V72adLZhVDYPFLjhdh4hs/
6HqPnGT/u9q4uEI46KLWNBZI2zU1K604sa0c95YV9CBV/bB9fM4NFzpTAiPiXAHU
RhKsS/RJG0bLFoucIeo3Th6RL2NlVW21KRPbh+/gZpYxUDUf51YPA7yXzL2TMsiU
gojUDkrYLsqr9Re+83RbdXNPeWVAZxdCr9wrQII9iuRBb/6u5ro=
=Flnh
-----END PGP SIGNATURE-----

--Sig_/Q.UyAlm1u+9aJK5b8Da2eZ8--

--===============1102992993==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1102992993==--
