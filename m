Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BDB36C047
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 09:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C9FB6E909;
	Tue, 27 Apr 2021 07:40:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F566E909
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 07:40:36 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id r128so65268275lff.4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 00:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=xA0OXEy/hQ+ryM3R/7AZM1xS0/MEJYlyDya+2jgPT1w=;
 b=P5ij16QsMdkIQ1jPPug6UeafJ71yyqfOcO8TmzRvhFTCqu91OfpxOGXq+LqPuWGM/7
 tTkwyvKjd3jbmEGHBragFdnaHLvdQYrsrX2Lcwzyaqk7uanb7VAJcni4r/XEu75XnD+G
 xFwdN4RcvMu/WYpLk/gaMP6N5i2JFNd/HT1cHhv0GKBUcMwkMPA4KJnetK2QxeCiU1PY
 L7Hk0FTRCoO7aBj9a/Ib/LnKNXlHfan67a+NmItYeN6S884fIv3cFyJHstXILLjwEroM
 gzZGXNkA/f24wXWypiI1drGS3alLgmcZTjapP1D8BbeFion7G6CE3gwbsJN5j2LvWicF
 tjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=xA0OXEy/hQ+ryM3R/7AZM1xS0/MEJYlyDya+2jgPT1w=;
 b=f1SG4VI50oc2Gb6BVCIlhAaFwCpqAmvIDFRnYHJbcnucok9Sxr/y4xTOcmLphTaWzr
 BwgWL5rTS5F6cT/cYLJvhEQwdvVRmbsK5co1oQkqY1D/UgoqYEil3/cqPbyc1EvBeKHh
 3SPLMZdyF2kLQLrb8JcihqjImypP1EqQV7jM766gwblvncHE0vimeNn4lHWZN5CsD8wf
 cA5/KMCgx6YnOxFAjGebIGl14QSeBR2qlL9mjOfTTdsMJLafrij2uh4ue/3UeXTthls5
 E08c/h4pgp5cUjT3/4K2lhVFLcGhUYC95xoILPDyDqrbdqXseqhaoBJYfmmbtl5SyScN
 aH/w==
X-Gm-Message-State: AOAM531OoINBVVpe154Ie4GObBsoyDqd8dcsgm4Uaobb8/R3YI7js3qF
 XSnrWeLRkBpWawR3AXjm1bo=
X-Google-Smtp-Source: ABdhPJysfHgeU/hOabKbl9NiYxSXo3h020TzIioL+wovdDDvrKIPYdW+CaIQMXVIfHxcsSGplHXwLg==
X-Received: by 2002:a19:f615:: with SMTP id x21mr16437155lfe.540.1619509235421; 
 Tue, 27 Apr 2021 00:40:35 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id c4sm255296ljd.115.2021.04.27.00.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 00:40:34 -0700 (PDT)
Date: Tue, 27 Apr 2021 10:40:24 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Subject: Re: [PATCH v2 1/1] drm/doc: document drm_mode_get_plane
Message-ID: <20210427104024.4e8aa086@eldfell>
In-Reply-To: <550b87d0-d180-32cb-349e-1ff000c0530f@collabora.com>
References: <20210422181004.34247-1-leandro.ribeiro@collabora.com>
 <20210422181004.34247-2-leandro.ribeiro@collabora.com>
 <20210423141126.308d4145@eldfell>
 <3c3a5d35-10bf-4b32-1970-aed4bc1d6488@collabora.com>
 <20210426103656.0a212089@eldfell>
 <UucmifK8H9QRiWjD9XezmvdKmY-gXYG2c5LcJlAtmZDvpmvX3dqiNqzng6EPm6Kj_1_1nKi4S2vzFPTpKYoou_ARj-27xlxSoeMtrcpxLUk=@emersion.fr>
 <550b87d0-d180-32cb-349e-1ff000c0530f@collabora.com>
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
Cc: airlied@linux.ie, kernel@collabora.com, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2064532519=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2064532519==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/miWbWeTSxNcyYfh0QYhuYba"; protocol="application/pgp-signature"

--Sig_/miWbWeTSxNcyYfh0QYhuYba
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Apr 2021 14:30:53 -0300
Leandro Ribeiro <leandro.ribeiro@collabora.com> wrote:

> On 4/26/21 7:58 AM, Simon Ser wrote:
> > On Monday, April 26th, 2021 at 9:36 AM, Pekka Paalanen <ppaalanen@gmail=
.com> wrote:
> >  =20
> >>>> This should probably explain what the bits in the mask correspond to.
> >>>> As in, which CRTC does bit 0 refer to, and so on. =20
> >>>
> >>> What about:
> >>>
> >>> "possible_crtcs: Bitmask of CRTC's compatible with the plane. CRTC's =
are
> >>> created and they receive an index, which corresponds to their position
> >>> in the bitmask. CRTC with index 0 will be in bit 0, and so on." =20
> >>
> >> This would still need to explain where can I find this index. =20
> >  =20
>=20
> What do you mean?
>=20
> > This closed merge request had some docs about possible CRTCs:
> >=20
> > https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/102
> >  =20
> I'm afraid I don't know exactly what you expect to be documented here
> that is still missing. Could you please elaborate?
>=20
> Thanks a lot!

The documentation you add is talking about "CRTC index". What defines a
CRTC object's index? How do I determine what index a CRTC object has?

The answer is, AFAIK, that the index is never stored explicitly
anywhere. You have to get the DRM resources structure, which has an
array for CRTC IDs. The index is the index to that array, IIRC. So if
one does not already know this, it is going to be really hard to figure
out what the "index" is. It might even be confused with the object ID,
which it is not but the ID might by complete accident be less than 32
so it would look ok at first glance.

If the index is already explained somewhere else, a reference to that
documentation would be enough.


Thanks,
pq

--Sig_/miWbWeTSxNcyYfh0QYhuYba
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmCHv+gACgkQI1/ltBGq
qqemXA/+M/8vIKTxcgDuhzkSrfFO/9WR1qrHLRTOFBTwkn9UiLpw7FxiES6wybeE
Ne/IToINAqyFBx83tPRPevfdtbB+8hiQNBMw/AOPKIroWk+jt0BTq9r/kScsAPvV
3ZGywP5Ty4D9O9E2zYf8PbIoj0vkegXcMJY9ZuAgZ01qh8BpSyoUiA6/4YGQH5Q+
7ffZfbdywdbdBDHRFK58FWlF0IZAF+CBqriJejc4uTJs8nYKLYY+85kygVmhjWWU
+thNdtibjGqol78maiubcSfNLN+xhU2aFsiJJqdBpRfjq/KdHfSRRm4p2p889Icu
W0//pq/lwvyzpDsOnUhqA1kKETAg9lC1u34R2ohSj/jBeEzc292KwHQrxOHLNS5L
VFqp3g3999hZp5dOpJ1qALqCZL2y3A2CrVV3o9pG3bk597hyzAOLskHG93fuIHzk
4O4h8n36yqYX3dYgvelFdVuSe7ldfCYLCQFUHgPAHV9dGYsSOrhArxuBklbgwmrz
kgTb+Moafh6W3Ki6+sDloXgjRctFwIZjIpFf3VxdOksfev0eatffAB5Qz7THgHjK
FVV1UZZ9Swtujn3pHgY4pLaBcsGd/aBz0R5pdDZO4iRCQICm6C4oRKfjvYddKLzF
o7kcdo7IqJ6zyRsj7IrdkGk7PBnXaY5nsQcavFMoch2y4hrurLE=
=X+hm
-----END PGP SIGNATURE-----

--Sig_/miWbWeTSxNcyYfh0QYhuYba--

--===============2064532519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2064532519==--
