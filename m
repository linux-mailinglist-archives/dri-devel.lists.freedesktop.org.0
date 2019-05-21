Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2324F24944
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 09:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE5988910D;
	Tue, 21 May 2019 07:47:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2675890C5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 07:47:39 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id u27so12273249lfg.10
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 00:47:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=Dicc+T9IrDxp0fnR3m1/jrj3BxuxAv88P1pataligq0=;
 b=HpvsH3W3euLXLAuUt+Sl4CdWaNQMNnjlGUiWlqthfn1N9HiPyAm0bumtjxnk+20XkR
 beP0cEqroXOMUb3WOgsq3eH2jrVwkoKCSJ7aBAyMly9lbv1djY4JyXE2U0nB4u2mq4xO
 M5HJJLyJz+S+Yztz2OpaAe4XszFbwFJmKyZ6B31kl+bvcDRbKnIVUYchOL1ZQKcdQ819
 mdCsFO3uvnD9U7issBAaefszFp/R0wLuN9AtLCrbktgGOV3BxLGWglVdpJvv6MDZWkZF
 wlrJzpSy2gM2ZpqgrQTXvLB69C1WJKE876DelhsaQ7pP5BgJE6LImvR0jv+IJ2lpptV8
 UIBg==
X-Gm-Message-State: APjAAAX3dOGiYG4VHjvNbM98ADo1fZMzYmaGSJgBv+gOrctYGkFDKnRo
 V8d6uQH181R6argTl+0BR0atpJNQ
X-Google-Smtp-Source: APXvYqx3go6kPaFZQ3cGHhye5zwX3TDp0V0lC9ovkdIoqZbVs6B2OSdU0om6gVOq2Pj5Ewo4Ya60yw==
X-Received: by 2002:ac2:4428:: with SMTP id w8mr35404633lfl.99.1558424858066; 
 Tue, 21 May 2019 00:47:38 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id n26sm5342617lfi.90.2019.05.21.00.47.37
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 21 May 2019 00:47:37 -0700 (PDT)
Date: Tue, 21 May 2019 10:47:34 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 2/2] drm/doc: Document expectation that userspace review
 looks at kernel uAPI.
Message-ID: <20190521104734.2d8853ac@eldfell.localdomain>
In-Reply-To: <20190424193636.GU9857@phenom.ffwll.local>
References: <20190424185617.16865-1-eric@anholt.net>
 <20190424185617.16865-2-eric@anholt.net>
 <20190424193636.GU9857@phenom.ffwll.local>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=Dicc+T9IrDxp0fnR3m1/jrj3BxuxAv88P1pataligq0=;
 b=rIEK0D0ur9pEw2gBKsrNFfy61GB9tHacmVMuAxNZpTngVh7JPLrdVNYKTA9rxA5ayr
 hb4JurJ8TrB7dZDiYlfeXBKGMlx/QVxKEb3VjKV8UnJvHvmUptaVBoD9oBooruylq1xm
 llxuAUsftE7/kKnyzI4nn7+X12/qkltPGk7vKzRhIU+rN7l+5IqSV2inA8xmwF7p0bOA
 /QK+yMv7MTryf22K8dJK64z2b9ISQjqPY5WAII84EnFeLhquDC1/TOAWkPeMBl+hSVZj
 xjZO2rOehyEx4CAxsvcRUnZJc9GwTrZ13jr6ETfTtZRtlR4gG3uKwVn9WKkZzh6MlwGQ
 O9lQ==
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: multipart/mixed; boundary="===============0756018085=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0756018085==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/OliU07hw75zzQ=tC8_AG_Hi"; protocol="application/pgp-signature"

--Sig_/OliU07hw75zzQ=tC8_AG_Hi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 24 Apr 2019 21:36:36 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Wed, Apr 24, 2019 at 11:56:17AM -0700, Eric Anholt wrote:
> > The point of this review process is that userspace using the new uAPI
> > can actually live with the uAPI being provided, and it's hard to know
> > that without having actually looked into a kernel patch yourself.
> >=20
> > Signed-off-by: Eric Anholt <eric@anholt.net>
> > Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > ---
> >  Documentation/gpu/drm-uapi.rst | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uap=
i.rst
> > index 8e5545dfbf82..298424b98d99 100644
> > --- a/Documentation/gpu/drm-uapi.rst
> > +++ b/Documentation/gpu/drm-uapi.rst
> > @@ -85,7 +85,9 @@ leads to a few additional requirements:
> >  - The userspace side must be fully reviewed and tested to the standard=
s of that
> >    userspace project. For e.g. mesa this means piglit testcases and rev=
iew on the
> >    mailing list. This is again to ensure that the new interface actuall=
y gets the
> > -  job done.
> > +  job done.  The userspace-side reviewer should also provide at least =
an
> > +  Acked-by on the kernel uAPI patch indicating that they've looked at =
how the
> > +  kernel side is implementing the new feature being used. =20
>=20
> Answers a question that just recently came up on merging new kms
> properties.
>=20
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Hi,

for the record, I personally will not be able to provide such Acked-by
tag according to kernel review rules, because I am completely unfamiliar
with kernel DRM internals and cannot review kernel code at all. This
might make people expecting Weston to prove their uAPI disappointed,
since there are very few Weston reviewers available.

If you meant something else, please word it to that you actually meant.


Thanks,
pq

--Sig_/OliU07hw75zzQ=tC8_AG_Hi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAlzjrRYACgkQI1/ltBGq
qqcAjA//e30nrMgcjuYTZipx7Pb25l9/mASh6SM6RkiQ/qsh3YZV9LTfG+EPXvoJ
xx3wpdCqTnrCgV4h4jo91a1C7TaKAfaSNwmN9cw1N1A2qi/bMNA5B84mT6Mgc+hD
LQF1qkEecc6czCOnrqubvH1xY+ApZTmYwktjGPLinpJA/TFa9QYggoRvJE76XuHi
Vs99hYkCHHQQVPzKMnOkFhIRsuvGOy14K/L3UAWyCT41qfTIMN43O6eBXMr6e31Q
RLo3051KHVq4+Rsdszyg870435Anf+efve1ihs1DEMB9I1olxZLbiAtvjGIh+V21
XMbeRfSYeVQg4ANfB+aIPRwwOIc5a6uJzto5UmVVJw3TFLPVS9BUWfsRBCG9q2m8
h6y5L+9f5XDlmxXELBAg5kpOkk/BQYUBmvhFH7kiMNDusv7sVeMYHXETlk7p5+FL
r3KpX74f4UiyzwjvxqHsN4GLW9rXjywTnPxzKXHnhtb4AYIxwQPb5BTiWoWxc+Nn
wK4oQI3Jucxwrk9vidHNfB5lz4uyVGqs9cUN810ZoW3JzGJOsvdoYtu7UlF423yX
SWIMZWA9AgiNUYGzQRbep+YjSCRPIMKXK7KOQopOK+WBxmp2/0cmxB1GeMbT2DLv
urtj+KzuU6p2hNVc1MDfM1W6Q6rCBk/z77dZQ3S2GJ3dZ4TMQI8=
=IAUN
-----END PGP SIGNATURE-----

--Sig_/OliU07hw75zzQ=tC8_AG_Hi--

--===============0756018085==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0756018085==--
