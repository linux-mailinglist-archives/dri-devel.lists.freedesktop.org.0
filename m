Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A84ED700165
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 09:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C64F10E0FF;
	Fri, 12 May 2023 07:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC9410E0E3;
 Fri, 12 May 2023 07:24:37 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f1411e8111so10733757e87.1; 
 Fri, 12 May 2023 00:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683876273; x=1686468273;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=La9PpFfjWL0Y3YHKUEFNn6ANLbC+TpXLpG1eydOu7X8=;
 b=F0ZNRdGgi1/vjyAB1CgLHZo9THAFh2sAg4TWz9oiYrK1GJ/mPF3BROuhGw/mgNCWST
 1SArx00tCs5bRkufY72fqLU5eWlx1OS5HKBCAIqUlABDrQdCk4GG+mkzUoPzTiwvaQKl
 A5cc+0FK/jt2/o4Vv216xSsTX8lg0nrbCIFMOAjIHrexyV6ariju+L7aT1mi6rCQ2t0W
 qd2WuNoFawcwA25sVDeKumCD1X19KXUvT2C+88FFl2KfHe+wbTKeyhji6jsfqpOjXL1p
 pFRC6JCOvOWNU8jx7AHyS2F4rER9NgRnERdQ0S7VuIQ2HlHGJme9RbLMxs71l5Vlu7h0
 jfvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683876273; x=1686468273;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=La9PpFfjWL0Y3YHKUEFNn6ANLbC+TpXLpG1eydOu7X8=;
 b=Y4uDcbVZ5x/hnGC89ukBhft21k4fVt7c4cixJ5xgVYKryqtzotgKe0idK6aDQu4UZg
 IgXVEDpIz2CnlAuJafBbFSC2i0Wq3I816hcpXrw6ZBjfAzf/wFLyFp/y0kRIUdyx8+kf
 6ilw1VDUKly1iRZcXPRCenSuRBD7UAeiGpgSKBLZ7vg6r1rkyZcMy64dlnQRaO3v0vya
 mIYIJy59MesBEDJQlSOxqXyOz2T41dgo9OIulZAXtyhRBus/ta1cSdxwriz8IK8JUIpe
 kVV6LhXVLvnOAPZdJdtMjdJtAy804atA5BJulq5T2TrN0vXrJeiGhjErNENuHr1T2wSj
 IUlA==
X-Gm-Message-State: AC+VfDwS+qyuNMcmEN2M1807btI9FFAbTf9Xxa7vyIkxutDPfaar0O6t
 0w361bqqURcYYR0xe0SukbM=
X-Google-Smtp-Source: ACHHUZ4KsDpr21U4PYEpr+H6QQmyKpPyTYQ8OIo1xOE7gEDMKHzT2fkU7JcCl/ooNoFuRIOc4tGkFw==
X-Received: by 2002:a05:6512:374d:b0:4b5:26f3:2247 with SMTP id
 a13-20020a056512374d00b004b526f32247mr3661410lfs.69.1683876272518; 
 Fri, 12 May 2023 00:24:32 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 w12-20020a05651204cc00b004efd57ba3d1sm1371553lfq.57.2023.05.12.00.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 00:24:32 -0700 (PDT)
Date: Fri, 12 May 2023 10:24:10 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC] Plane color pipeline KMS uAPI
Message-ID: <20230512102410.402bf4b5@eldfell>
In-Reply-To: <k6yN8_WlW_AoQ7bxsopuqRsCxAbjFJ_vpM3iJjy_st--rHf305SsBVubqMbNDkSm4ez1ygoPH2Dc7VffRQjlZBk4fyKFpcZpQGpSA5vA6G0=@emersion.fr>
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
 <CAPM=9tz54Jc1HSjdh5A7iG4X8Gvgg46qu7Ezvgnmj4N6gbY+Kw@mail.gmail.com>
 <CA+hFU4x++RDOxkc-_ZvDtQs3DtupwDV0KJyD3YAgrdh4daLotA@mail.gmail.com>
 <CAPM=9twjPr9fiJwbyNS9j=mCKmLhxbTjB5Vzq9F+Du8sdHac-A@mail.gmail.com>
 <e903d920-788f-7d70-c6f0-1faaac3c9843@amd.com>
 <CAPM=9tyOFhE0zC8540KBOkDaZE1c3zTtke_vX=DEkMTmo04A4Q@mail.gmail.com>
 <QL28tg_ZcXPQ1W5l8Hp3rDlvyKuMh09kjGHpj1GRKVrMqlB-hNI2F6FzRSP-NyfkMpk6tsO55t8UYF6Uk9b7IF1O1BHH1WKc88kNTgY2Ugk=@emersion.fr>
 <ZFtO2bMQOWVhRkSG@redhat.com>
 <CACO55tvzdOU4hnqbpTsd=_SeP0GHt235w=NGL74Oq0Fd35V6HQ@mail.gmail.com>
 <CAEZNXZCCn7ZFgyy-NzpSEp0wB0L7PZ-jheHmMWkgQq5pQ+930A@mail.gmail.com>
 <k6yN8_WlW_AoQ7bxsopuqRsCxAbjFJ_vpM3iJjy_st--rHf305SsBVubqMbNDkSm4ez1ygoPH2Dc7VffRQjlZBk4fyKFpcZpQGpSA5vA6G0=@emersion.fr>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.24; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1UTASAXjt1GgJoFSWCoqY9J";
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Karol Herbst <kherbst@redhat.com>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Victoria Brekenfeld <victoria@system76.com>, Melissa Wen <mwen@igalia.com>,
 Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <mdaenzer@redhat.com>,
 Aleix Pol <aleixpol@kde.org>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/1UTASAXjt1GgJoFSWCoqY9J
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 11 May 2023 19:29:27 +0000
Simon Ser <contact@emersion.fr> wrote:

> On Thursday, May 11th, 2023 at 18:56, Joshua Ashton <joshua@froggi.es> wr=
ote:
>=20
> > When we are talking about being 'prescriptive' in the API, are we
> > outright saying we don't want to support arbitrary 3D LUTs, or are we
> > just offering certain algorithms to be 'executed' for a plane/crtc/etc
> > in the atomic API? I am confused... =20
>=20
> From a kernel PoV:
>=20
> - Prescriptive =3D here are the available hardware blocks, feel free to
>   configure each as you like
> - Descriptive =3D give me the source and destination color-spaces and I
>   take care of everything
>=20
> This proposal is a prescriptive API. We haven't explored _that_ much
> how a descriptive API would look like, probably it can include some way
> to do Night Light and similar features but not sure how high-level
> they'd look like. A descriptive API is inherently more restrictive than
> a prescriptive API.

Right. Just like Jonas said, an arbitrary 3D LUT is a well-defined
mathematical operation with no semantics at all, therefore it is a
prescriptive element. A 3D LUT does not fit well in a descriptive API
design, one would need to jump through lots of hoops to turn it into
something descriptive'ish (like ICC does).

I think Joshua mixed up the definitions of "descriptive" and
"prescriptive".

If Gamescope was using a descriptive KMS UAPI, then it would have very
little or no say in what color operations are done and how.

If Gamescope is using prescriptive KMS UAPI, then Gamescope has to know
exactly what it wants to do, how it wants to achieve that, and map that
to the available mathematical processing blocks.

A descriptive UAPI would mean all color policy is in the kernel. A
prescriptive UAPI means all policy is in userspace.

Wayland uses the opposite design principle of KMS UAPI. Wayland is
descriptive, KMS is prescriptive. This puts the color policy into a
Wayland compositor. If we have a library converting descriptive to
prescriptive, then that library contains a policy.

Going from descriptive to prescriptive is easy, just add policy. Going
from prescriptive to descriptive is practically impossible, because
you'd have to "subtract" any policy that has already been applied, in
order to understand what the starting point was.

Coming back to KMS, the color transformations must be prescriptive, but
then we also need to be able to send descriptive information to video
sinks so that video sinks understand what our pixel values mean.


Thanks,
pq

--Sig_/1UTASAXjt1GgJoFSWCoqY9J
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmRd6ZoACgkQI1/ltBGq
qqd+HRAAiVtR5GBIzcVFDCUCQ+RdqRDBMBHxDBJOkwTJAg/QbaIgIdaLRUCtcsM7
630hQosxLXMR88z2u+wbPHbnnmx89mPmyfVtreXzgWWS8k93mDGFabVSKusPrB3J
pGfBfGMNnfTKd9cDP7QGTVYZ9gdtLQSfTX8VyWMlRnlg9GRkZoBRxLOTTKFYDy2S
kx5vmQvBr6ey7F+nGWVBdXgNnOk/YKOHaY2pKZKlK42GKYqooARX5sKBm4f1VUDF
AGVPV2lzJn82aQvo1DvzGa0NgxQjwqlC9YHPea+R3WS0Ry5DvgDr+7C+uIPpxXcp
E5gP88zb9ewdPtnu9InCSQiG3qtEpZpj600HQWm3wsM8iUghsBuTyLgBIOVt6Hbs
MyPoEi/HMH+MNQRYNes4eW8/nG2cF07THfvW//hG0t3PHely8hgLdBb0MF53TbGB
SG0i92u3HjFynms4RdshTEHnwA5jJXbBr81nnaEcZnxRQIso+KCZyzI44/2R27N/
RZW0QdAjx69T9dpEAdMJqxnV2L1xhW1roNArHU5zbo7D8ghPacy37Sytc3n7j4bB
in89Z9SUgFo2+z80jD19aopuEwK11jTZrrEM3/A92gYPUD3+9fDSrG4aRPo9FZCb
GwIEQTrjm3fvtEQVxBEMWHtlAoAYMhwTkh2Xrmd14DWgCD/wShQ=
=NPgJ
-----END PGP SIGNATURE-----

--Sig_/1UTASAXjt1GgJoFSWCoqY9J--
