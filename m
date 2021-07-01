Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C06793B8EB0
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 10:14:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A9C96E9C9;
	Thu,  1 Jul 2021 08:14:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3966E99D;
 Thu,  1 Jul 2021 08:14:15 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id h6so7216855ljl.8;
 Thu, 01 Jul 2021 01:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=1IosWlu5UAbnmJP9BeNSDunbBUG48kXGu/h3HHXf5qA=;
 b=S5KqnzviTPzqfFPE4gMt1sk2vzu4sOLTfO5OW57KG5H96pqbZF1J+By0lb6D/UeTkO
 u3QWqhzF/5IfyN42BPD2gL0AQx3pWX/qlYSTzSqTQER2Om6MY2fNfXyCuwKnTXHEwj/S
 CSog21Z3uVU0xbhGzxqFRSTVtmQlODVg1DL5/TW5ccoO7K/uU705UqP389Jms+a5INgB
 Mgc6bPZtL7qo2DciQ7cZOqFgvUmvY1pqigYRnN0wiB7FrwffmSxLAW2KrJeaX1h2FpUU
 MfJAxR+57dvGWdDVO7whxmHCn3T3GgjLMo27fAnvOWwmOn2HqPjlQ+rFi2jBx9u2RBJl
 PWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=1IosWlu5UAbnmJP9BeNSDunbBUG48kXGu/h3HHXf5qA=;
 b=eCvlevnFbj0Xb/k+qp9QqTmfFfYrkWesdAvhO+0c8JdQ06emOQTcaMYXMaLvBIbGHS
 130/fCcqi/civTxyndZgSeOEsL7a0JOAbm4vszRG2Q9pw5IeXgEDGh1WGC+g2fvTrlM5
 29jNYUbTLwxJRorqEMdov9e2k55LkGueIFC7ZQ9O1znMXSDdAIqksL+tzYwAI2dZoUQO
 f5cNF7aVp4Kl1fKWYwNjkvaoWUNcSxmdSi4fAsaFckry21s6ZkibQZO+snRAgLjHweXG
 TJn3ygE2hCvKZVFNNeanSNi/QV6ek8E6s+6wcC6uePGGb8TjBqq8/NxkXAx7Ns3K5/Ge
 eD4g==
X-Gm-Message-State: AOAM533V/6FvgHq+tnxCB0AXAEkvBiAlQxA7dZM3b2RRqzMFfNPUscUR
 XaXrw5gNjwGRNj9Nrx7FYqU=
X-Google-Smtp-Source: ABdhPJwR9qTua+I7qQf5RoxMMLT8gIC0VklwTWp8e2q9qN3a5rdsZGBS1CksGBjZeQ8C62OIRZD8Ng==
X-Received: by 2002:a05:651c:1411:: with SMTP id
 u17mr11650947lje.8.1625127254199; 
 Thu, 01 Jul 2021 01:14:14 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id q4sm2140709lfh.247.2021.07.01.01.14.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 01:14:13 -0700 (PDT)
Date: Thu, 1 Jul 2021 11:14:10 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [PATCH 47/47] drm/i915/guc: Unblock GuC submission on Gen11+
Message-ID: <20210701111410.3fc6551e@eldfell>
In-Reply-To: <05e1d462-57ae-888a-888c-3ad486150821@intel.com>
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-48-matthew.brost@intel.com>
 <88cbe963-7188-f4ae-5acf-01a80bd2fe25@free.fr>
 <05e1d462-57ae-888a-888c-3ad486150821@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kYsol.Yx5eleTZ6uubSo3To";
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
Cc: Matthew Brost <matthew.brost@intel.com>, daniele.ceraolospurio@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/kYsol.Yx5eleTZ6uubSo3To
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 30 Jun 2021 11:58:25 -0700
John Harrison <john.c.harrison@intel.com> wrote:

> On 6/30/2021 01:22, Martin Peres wrote:
> > On 24/06/2021 10:05, Matthew Brost wrote: =20
> >> From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> >>
> >> Unblock GuC submission on Gen11+ platforms.
> >>
> >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> >> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >> ---
> >> =C2=A0 drivers/gpu/drm/i915/gt/uc/intel_guc.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> >> =C2=A0 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c |=C2=A0 8 +++=
+++++
> >> =C2=A0 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h |=C2=A0 3 +--
> >> =C2=A0 drivers/gpu/drm/i915/gt/uc/intel_uc.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14 +++++++++-----
> >> =C2=A0 4 files changed, 19 insertions(+), 7 deletions(-)
> >>

...

> >> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c=20
> >> b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> >> index 7a69c3c027e9..61be0aa81492 100644
> >> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> >> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> >> @@ -34,8 +34,15 @@ static void uc_expand_default_options(struct=20
> >> intel_uc *uc)
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >> =C2=A0 -=C2=A0=C2=A0=C2=A0 /* Default: enable HuC authentication only =
*/
> >> -=C2=A0=C2=A0=C2=A0 i915->params.enable_guc =3D ENABLE_GUC_LOAD_HUC;
> >> +=C2=A0=C2=A0=C2=A0 /* Intermediate platforms are HuC authentication o=
nly */
> >> +=C2=A0=C2=A0=C2=A0 if (IS_DG1(i915) || IS_ALDERLAKE_S(i915)) {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_dbg(&i915->drm, "Disab=
ling GuC only due to old=20
> >> platform\n"); =20
> >
> > This comment does not seem accurate, given that DG1 is barely out, and=
=20
> > ADL is not out yet. How about:
> >
> > "Disabling GuC on untested platforms"?
> > =20
> Just because something is not in the shops yet does not mean it is new.=20
> Technology is always obsolete by the time it goes on sale.

That is a very good reason to not use terminology like "new", "old",
"current", "modern" etc. at all.

End users like me definitely do not share your interpretation of "old".


Thanks,
pq


> And the issue is not a lack of testing, it is a question of whether we=20
> are allowed to change the default on something that has already started=20
> being used by customers or not (including pre-release beta customers).=20
> I.e. it is basically a political decision not an engineering decision.


--Sig_/kYsol.Yx5eleTZ6uubSo3To
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDdeVIACgkQI1/ltBGq
qqeQgRAAkIJvCZDu1CVdjVduAYd6syxsyXcxuaHOLl3dYGZdS4zjWxI4ky4E1cAf
T9CwDnUz0yxkrHBVgkf4n29oDmHpAyeLbTxuK3+5hmqT5bw492hpH0qixeLzXXgO
Co+DaQngcLmaUPWQIp0lOcQRBXVaaJkbJ6rxoI6p/LMlosl5K9wWc16SrGrtjlNA
OndC9XkQbcJ+t/olb/0eOGqhAVqy2d7UPU1MvokxTpGvxveOUS0Im+4pCWDGjtoi
Gz3CfKJs0nnXExkYbqEttGk4whgyvlLSf+QPASayF/RGmYh2ws0y74GsR4O+tB6h
0N34vqCvbpu5aiLFfprEr/vVVxtlGUzFeU2vavF9x1nGHlwrTvZUNsaImeRCJJIN
meDcsZ2Q84yRdvncFSGAW3lXpqlhG5kkl6kBUkgGr3uPCn0eqFxj2KFZmiPu4fgv
NLVYwKspA//xjIK1tW8PCGeYJmRwPPFS2MSoDuvIQLIKTOL27oJUsCDaTItDWweY
495HI63t14/sPdhrq+8//U1LXiJkdg7y9KizjdWvuCRKaS/UF7ydTMjPyAqK9qqf
kKeWuO1l7Nhu0t2Z8nTdBrWebM6SFOcoDq/4BQKLVEWoMbRmfqBb4EWX41wjlNn1
JGYCuNechO32ASXbJHwxXWqKW4QCC83C+9onUW6zlLaxNOYAId4=
=p7r+
-----END PGP SIGNATURE-----

--Sig_/kYsol.Yx5eleTZ6uubSo3To--
