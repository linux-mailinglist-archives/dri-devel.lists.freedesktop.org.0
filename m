Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D7537BDA3
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 15:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6786EB9C;
	Wed, 12 May 2021 13:04:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E8666EB9C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 13:04:37 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id x19so33638253lfa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 06:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=ym0b9O+CB0QI/hj9m7fIxEYvj45mWXiUhctohPs3XV8=;
 b=WBGjabg4UUUnBNE4tseNIO2BPs4KZaueML0OFIx3+Fn0AxnJ6c1//EWljitNq88iQJ
 uCy/l7IQjFOVAEGuASTVdhfW+btED48hau1EXCET/Jk6xCppEPuojXmedyrIzDd9WK3m
 f7wVG9ZlM2w9mYFwAY1iQv+0ZDaz0HjXck3w13VnbePrpRveBfa/X/2yDx3ceesmG8mC
 wHqfO/80JiRP6XJn0SlSl3B2o2NS+hbQ1ZnznJE3KUeRNo3b8x5XX9IX2IqVKiq7zmjE
 Fwqr6IlzBeFFkRhwpcaRXZabJuJieW+aapsd1rNvWoSBLGU4OEKssFg9SCjzUN75g6Jf
 idWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=ym0b9O+CB0QI/hj9m7fIxEYvj45mWXiUhctohPs3XV8=;
 b=Qo9vEImKw7kdlQPr0nsTlSWY+ppMpmlolMMzdwxc9kIkMM6aRVd64gCfvpTmNr+HZN
 u/Fu3vHx0cTj/mrj2Pb01ptbEWtepC8aDOS2EKb5n5YX1ALPZWo9Q5DO/IV1mhFTD5FT
 a4VKp/MrEXdiCF5NlA5RHFAu4V1THSFJe744ZOs40aBD4rO7zwWjYGrboRBKho+eJoW+
 BIrFPWqqGHRP9isljyTyeVoLGzTu0Zz5TP/c14UZR/vlaT+rqwczTNQ9o+8jjvMMfgQt
 I7w4Gt3mjF0oB4CCvSzkt+igZTq08SXjeA0gyMEMu8MEbIvtDbK6EdGgs2PoNUOTinqq
 s3LA==
X-Gm-Message-State: AOAM531p7321PGMXWAcR4jagTx+QU7RGEpdd6g3YZhg2tDZTHhewD9LV
 nD2yg85byRX8893zJY6perY=
X-Google-Smtp-Source: ABdhPJyxNi9vmHnNTmKRIAAzbafXS/EBSraL6qVDke+BuOc6D0/vsgcB33n5Ku3c78NS32Vtqa8iOw==
X-Received: by 2002:ac2:554e:: with SMTP id l14mr18334359lfk.394.1620824675556; 
 Wed, 12 May 2021 06:04:35 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id z11sm2202327lfu.135.2021.05.12.06.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 06:04:34 -0700 (PDT)
Date: Wed, 12 May 2021 16:04:22 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Subject: Re: [PATCH 1/2] drm/doc: document how userspace should find out
 CRTC index
Message-ID: <20210512160422.66f3be04@eldfell>
In-Reply-To: <f4cfbb53-bfc6-768f-461b-252380b5b5a6@collabora.com>
References: <20210428213651.55467-1-leandro.ribeiro@collabora.com>
 <20210428213651.55467-2-leandro.ribeiro@collabora.com>
 <20210506115053.15741550@eldfell>
 <f4cfbb53-bfc6-768f-461b-252380b5b5a6@collabora.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/da2gzr1w7eMN4SggIyi1ISc"; protocol="application/pgp-signature"
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
Cc: airlied@linux.ie, kernel@collabora.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/da2gzr1w7eMN4SggIyi1ISc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 12 May 2021 09:50:14 -0300
Leandro Ribeiro <leandro.ribeiro@collabora.com> wrote:

> On 5/6/21 5:50 AM, Pekka Paalanen wrote:
> > On Wed, 28 Apr 2021 18:36:50 -0300
> > Leandro Ribeiro <leandro.ribeiro@collabora.com> wrote:
> >  =20
> >> In this patch we add a section to document what userspace should do to
> >> find out the CRTC index. This is important as there are multiple places
> >> in the documentation that need this, so it's better to just point to
> >> this section and avoid repetition.
> >>
> >> Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
> >> ---
> >>  Documentation/gpu/drm-uapi.rst    | 14 ++++++++++++++
> >>  drivers/gpu/drm/drm_debugfs_crc.c |  9 +++++----
> >>  include/uapi/drm/drm.h            |  3 ++-
> >>  3 files changed, 21 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-ua=
pi.rst
> >> index 04bdc7a91d53..1aa52a6ac567 100644
> >> --- a/Documentation/gpu/drm-uapi.rst
> >> +++ b/Documentation/gpu/drm-uapi.rst
> >> @@ -457,6 +457,20 @@ Userspace API Structures
> >>  .. kernel-doc:: include/uapi/drm/drm_mode.h
> >>     :doc: overview
> >>
> >> +.. _crtc_index:
> >> +
> >> +CRTC index
> >> +----------
> >> +
> >> +In some situations, it is important for userspace to find out the ind=
ex of a =20
> >=20
> > That could be said about everything, so this sentence has no
> > information value. Instead, you could start by stating that CRTCs have
> > both an object ID and an index, and they are not the same thing. CRTC
> > index is used in cases where a densely packed identifier for a CRTC is
> > needed, e.g. in bit-for-crtc masks, where using the object ID would not
> > work.
> > =20
> >> +CRTC. The CRTC index should not be confused with its object id.
> >> +
> >> +In order to do this, userspace should first query the resources objec=
t =20
> >=20
> > Instead of saying what userspace must do, you could just explain where
> > it can be observed.
> >  =20
> >> +from the device that owns the CRTC (using the DRM_IOCTL_MODE_GETRESOU=
RCES =20
> >=20
> > So here you might start with: DRM_IOCTL_MODE_GETRESOURCES populates a
> > structure with an array of CRTC IDs. CRTC's index is its index in that
> > array.
> >  =20
> >> +ioctl). The resources object contains a pointer to an array of CRTC's=
, and also
> >> +the number of entries of the array. The index of the CRTC is the same=
 as its
> >> +position in this array. =20
> >=20
> > Anyway, the idea here is right.
> >  =20
>=20
> So what about:
>=20
> CRTC's have both an object ID and an index, and they should not be
> confused. The index is used in cases where a densely packed identifier
> for a CRTC is needed, for instance in a bitmask of CRTC's. (maybe a link
> to the possible_crtcs field of struct drm_mode_get_plane? as example)
>=20
> DRM_IOCTL_MODE_GETRESOURCES populates a structure with an array of CRTC
> id's, and the CRTC index is its position in this array.

Sure, sounds good.

Capitalized 'ID'?


Thanks,
pq

--Sig_/da2gzr1w7eMN4SggIyi1ISc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmCb0lYACgkQI1/ltBGq
qqeHThAAo84f6SVOpb+dz/l9rQPeSQKTKxLYigBgwmN3EbORu0fU5O/rnQcTbTpy
wvWDS5ED/zf5CQkd5QCMbW+iL5bOKRR8ioAEJiapI+vvHRSCJs9CBBa8tHMbX9rR
9+foa/oSy1cN8uvJSN4X7AezLj5al+koo7Y5ehw8uvJkmj/pm0eozv+Ja1MWf8HE
Xagzx8Zek/6joR3yaIgvnX2TWCRee2ryu8tQfLpuZzGP9d+0uTCT95BeRjnTuG00
PkI7K5y7OChZwDPyFkPEeWJg1Zja4d8GkT2qXEfn3DC4FLi2cqOjrsqv6zJUl193
VmLcNtSj6qg5aorvf9VZbhfdBHhD+aIjKzMInee8fu3HQk/B/9KNbl8estjlqdPi
SXu4yGvxppKUhq+9y+xllfy3hYpxawNvIhtGlcoL1+X/YtBJgkQOPJj/pZgBgnQ6
qk4HK5pnzLfZJX7EjzOf6e/V3z32y9YF3k37DVtkGmrSI1LbtO3tEaQyVdSGSelq
+w5V10lNc0OqxZetmH2BUYsdpvi5TVxok+qBjk2aMgsOjTuYZ02ow89EoowWb13C
kEi2Zs4gOJTHVQkwSjVGZcfx4xk65W5TFnkspE20AEHoE1skqBF0bquQ0aYuSlhc
h5rf+CRCG93aqnAFeiu6KUTZth/0PBnr955efdasrQajJ3umS7c=
=rniE
-----END PGP SIGNATURE-----

--Sig_/da2gzr1w7eMN4SggIyi1ISc--
