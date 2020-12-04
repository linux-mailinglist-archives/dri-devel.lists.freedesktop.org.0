Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A03F52CE943
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:12:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E8C76E134;
	Fri,  4 Dec 2020 08:12:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72EDC6E134
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 08:12:03 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id r24so6476600lfm.8
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Dec 2020 00:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=BUMYckdNXc2AgoK7KZmuMtqFktG5Sat51Ybj8L1C450=;
 b=G+aIVRCa0YPZ6Si9x86gPNFLJmlk8Pg9oDpYCt8XUfyiqZSqhyiUm6T2hUuWpxB1pR
 kKi0RQsqh5NurtXjj2bQxTsq0x2m8z2Yd4VfhQ2JNQRDpn3GvCbvSi64wM3ohXnkYHqF
 aZ1TDIMpaUe30IeqXRAAqWvFOsv/KBTicZvThkpg4ddX2dyc4nZZm1QC2FyL0gnn3Z5/
 Op105mzPEyBJJ1VtSal+Q9F1X+bipV9euvNK7thj62ZqAoqWKTS63+Lp294hGil4KP2i
 ZLPRD1TAERQ/WUfFJSczG0g/SuGdSNdEobUzyq62AbbI66ZRtLjea6uORhFWeOWccFNj
 82Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=BUMYckdNXc2AgoK7KZmuMtqFktG5Sat51Ybj8L1C450=;
 b=IZSO1s0/J6N65np5C0vOnqICwoEJ4MyA/VeagTcSEi3IzZDp/FpmzOVpii6mRhtBXr
 ZZGP8YvPj5xfHIEPHRtq7djMGMIhkqs5LqUBDM7vmXrZosNs6vEOh39QobUwysZFdKHn
 6GtU3VCkKShs1fEs8BfXNuJ2fTjfctHTWnzoCq9K3gibcFv9VwBRoweG+6I6K5hyXxVw
 qDdYDqzjTeQKTWY/0WJi7C56AAgKKzAXAS6tWmDJr53NfQiRX+pelR+l2FByHz1+ePQG
 UpLoEzsBU9/uJJNv0TfHN9fsf0g/LDc1pbp76AAHwik47eTkUgqI9X7YjmKWtqEOnVyp
 G83A==
X-Gm-Message-State: AOAM5306jySNzsyWLB+IefzqTJVjpgRDAbqngofLSiKlNZgihecT6NRe
 Uyg7fDkUkOvSjeS3wcbfjSs=
X-Google-Smtp-Source: ABdhPJxGPo2Z1RAUJAMZyJLltyOJyrKN9cpT/3Jjdo0sEDLQ2chKNg7Yj5YbFyiyPH1Jy5zRhq5QjA==
X-Received: by 2002:ac2:446f:: with SMTP id y15mr2884666lfl.415.1607069521822; 
 Fri, 04 Dec 2020 00:12:01 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id v21sm1468229lfa.1.2020.12.04.00.12.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 00:12:01 -0800 (PST)
Date: Fri, 4 Dec 2020 10:11:51 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: Fix drm.h uapi header for Windows
Message-ID: <20201204101151.55f487b8@eldfell>
In-Reply-To: <CAKMK7uG3JbUuaJ3UUTHgeYCKnD9+n_bbeX=xka9o+TLJHwHJZQ@mail.gmail.com>
References: <1606816916-3724-1-git-send-email-jpark37@lagfreegames.com>
 <1606816916-3724-2-git-send-email-jpark37@lagfreegames.com>
 <f1432016-4a83-8cc6-a5cd-6e0d74b9e156@daenzer.net>
 <CAKMK7uF=St1Uf_smL3HLi458cKfyOYM27FUX5+vjG5qSSD3Jnw@mail.gmail.com>
 <2dbbc3dc-4df8-9ca4-4dce-808df0b24950@daenzer.net>
 <CABjik9dprmMzvmiu8XDPL+x9a7mbbOfPVAfbtAd1Sv74HxVSdg@mail.gmail.com>
 <c68d121c-ead2-dbe9-cb26-8b18ccb86011@daenzer.net>
 <CAKMK7uHZGAT6qUc1AbOHar0h=q0uJKOHuNL_HdiOgLx+iiy-kg@mail.gmail.com>
 <CABjik9dFoGSaxOouXsMdNgeFK57-RP28dhrPi4EXX81OswgeSw@mail.gmail.com>
 <CAKMK7uG3JbUuaJ3UUTHgeYCKnD9+n_bbeX=xka9o+TLJHwHJZQ@mail.gmail.com>
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
Cc: Michel =?UTF-8?B?RMOkbnpl?= =?UTF-8?B?cg==?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 James Park <jpark37@lagfreegames.com>,
 James Park <james.park@lagfreegames.com>
Content-Type: multipart/mixed; boundary="===============1926994520=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1926994520==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/wq1la.68T1rXH/XrqTS7bf3"; protocol="application/pgp-signature"

--Sig_/wq1la.68T1rXH/XrqTS7bf3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 3 Dec 2020 21:45:14 +0100
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Thu, Dec 3, 2020 at 7:55 PM James Park <james.park@lagfreegames.com> w=
rote:
> >
> > The trailing underscore for  DRM_FOURCC_STANDALONE_ isn't
> > intentional, right? Should I put all the integer types, or just the
> > ones that are used in that file? =20
>=20
> Yeah that trailing _ just slipped in. And I'd just do the types
> already used. I don't think anything else than __u32 (for drm fourcc)
> and __u64 (for drm modifier) is needed.

Hi,

can that create conflicts if userspace first includes drm_fourcc.h and
then drm.h?

I would find it natural to userspace have generic headers including
drm_fourcc.h and then DRM-specific C-files including drm.h as well
(through libdrm headers). I think Weston might already do this.

The generic userspace (weston) header would obviously #define
DRM_FOURCC_STANDALONE, because it is used by non-DRM C-files as well.


Thanks,
pq

--Sig_/wq1la.68T1rXH/XrqTS7bf3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl/J70cACgkQI1/ltBGq
qqerPA//aMgDYNIJ4sodrNOqSyvJ18uH96ST6BMNRiByVqcq2fjhsU3C+nWKWg5U
vsHgMkCYbCp3wSUO9TRb9uhDMB0K8NyVDuzYZAt4HekHFPlF/USsFPvL1M85taDC
+slkxDKk6gTuNxtTUhDlQAvSWxJy8Wl+Y0b0qcSY2NNtOQqaPcSF3iBLkEq+t/pC
YSCaRC5fiBOkbcGehN2VXXoWMde+vRK19IDvAqS0VvgIR5eocn2hiX0BmPX5Pqh9
aRYOFTrdnS9w4wM0q2kMQ/ytZnbqhSGS0n+KJiNgou60e00P4rq5VyV1/heA0sMv
3rwxd//iVAz+/mtskmsQioCzeBB1OSOVMbbitYwYQzh3Y+6DLtS5j7/6OraCBQj4
S2SACrUZNCpYjhzHRl3tZS5WcjO/zR8o7JscPiIK9gZdpfw/0a3pbhP/QCka/+Xt
WxWiL+MkupFCFNBhaNhIP3oaXzkr9Z4QzrqbQ+oiEPDNSDhL5Pip9FlgD1FVjSUN
vqbBopNAP7TsXD1AqWXyvP2mk07C/GzAG2zF52JoKUmPTB0SQTNN1JKpAPW+ynTr
+xzF/HmEuGS7UU8eC3XrFxMUNaqJ5zVh7Mkb9rvlQrICrpgisIGoaLBKy9ekPGgn
SGMoeX1FxRcZPWOwdc0LLa1n4XV1rwiQas/+RqM2IBgngs8Lt9o=
=+ndT
-----END PGP SIGNATURE-----

--Sig_/wq1la.68T1rXH/XrqTS7bf3--

--===============1926994520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1926994520==--
