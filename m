Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE33C62F062
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 10:03:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6EE10E1F2;
	Fri, 18 Nov 2022 09:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADDC110E1F2;
 Fri, 18 Nov 2022 09:03:05 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id x21so5950697ljg.10;
 Fri, 18 Nov 2022 01:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=nqcxBaH31lx2u4NIPdlyV3PifFPN0d4S/QmfunVd5Yk=;
 b=pzu+Omu355frg0ueGuI5x6myuBFpz9v0G4ogyNwP77A6ylVn9Y/TuVQnusC2JtxDLR
 YEAvjv5588Ew35vhP3rPTHmfPVcX3mfP8GsNDNz1E7Vro6vbneEqxEH/bVcw/nmejf5Y
 l4Gl0iE5xGv7KvHBi6A6sY3d+NybKvKirKZXs4G1CWOGSzshL72qnV8qKLdHi/yYj7s5
 qxJtJ53VOJfcvIVjI4Z+N5sH08PAYVvSxts037FdSu6dFZKaP6eM/mQXiXkiBJZQjksU
 yA6aefDDXkp5R2oQUOQhlTLJ7zyuxzMAUreAYgf0Nv8kiJjOlwNl8tEgWpFUN5CJJPKB
 dl5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nqcxBaH31lx2u4NIPdlyV3PifFPN0d4S/QmfunVd5Yk=;
 b=Gy1jb7fqckMjZM3KWgrES1/ahLkiPtx2U91rYFsVSief4Zglp8Ek5G3pZMvYS/MGQb
 IWNSNIJBMwfh4fiEyz1xX/0j4SJCTeHPHQmapySzu7Jgwipwx8+4Id9EFqDyHUyPd6hH
 Y52sc7juprvYjUNiuC7L/MYwDRVen0sGqs+sSdEfDziTzSR32HFbcwZ/Zgcg0Zp1Keoo
 oLEUp/uIzO2vFQrnlUiqJTv6JqhpMTOlAB6Ur+u1eL8bHl/ht0mg+ECAcd8lXaHZaxUs
 CiQUriSmN2kO8tNn27qSxsBAc5uO8AbJ9HHmoHHGFWMnia0p71K3rQhfPLXgY3T6l15/
 QI2g==
X-Gm-Message-State: ANoB5pmxMVNUquvW5GhV5bkZ1GLRKMAAmGh9hJ3gAt9enJUPb08/nopW
 QKQBgbN+QGCS5OvApvJEfNs=
X-Google-Smtp-Source: AA0mqf57s1A4UeuwIQPDjK0NIxekjS3jE4N0LT4pzxr4wLxGtLZP1MyvPCA84rPZui9W+7rONxDHnA==
X-Received: by 2002:a2e:990b:0:b0:277:5a8:91c8 with SMTP id
 v11-20020a2e990b000000b0027705a891c8mr2042285lji.173.1668762183677; 
 Fri, 18 Nov 2022 01:03:03 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 s12-20020a056512314c00b004b0317a1035sm581958lfi.109.2022.11.18.01.03.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 01:03:03 -0800 (PST)
Date: Fri, 18 Nov 2022 11:02:33 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Sebastian Wick <sebastian.wick@redhat.com>
Subject: Re: The state of Quantization Range handling
Message-ID: <20221118110233.4e93786a@eldfell>
In-Reply-To: <CA+hFU4z59z=P1pYzmxY=Mz=XWK9_zk7J2FtoKY=QJmztAN8J7Q@mail.gmail.com>
References: <CA+hFU4w8=yTU5tQgqZj4qUvJddAQL9fj5teTVSB_dvNcwCyr6g@mail.gmail.com>
 <20221116143401.3d7621b9@eldfell>
 <CA+hFU4z59z=P1pYzmxY=Mz=XWK9_zk7J2FtoKY=QJmztAN8J7Q@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/te9gkBy7/N5O1t77Qlfxl3j";
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/te9gkBy7/N5O1t77Qlfxl3j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 17 Nov 2022 22:39:36 +0100
Sebastian Wick <sebastian.wick@redhat.com> wrote:

> On Wed, Nov 16, 2022 at 1:34 PM Pekka Paalanen <ppaalanen@gmail.com> wrot=
e:
> >
> > Is it a good idea to put even more automation/magic into configuring
> > the color pipeline and metadata for a sink, making them even more
> > intertwined?
> >
> > I would prefer the opposite direction, making thing more explicit and
> > orthogonal. =20
>=20
> In general I completely agree with this, I just don't think it's
> feasible with the current state of KMS. For the color pipeline API [1]
> that's exactly the behavior I want but it should be guarded behind a
> DRM cap.
>=20
> For that new API, user space needs direct control over the
> quantization range infoframe and the kernel has to somehow tell user
> space what quantization range the sink expects for the default
> behavior. User space then programs the infoframe when possible and
> builds the color pipeline in such a way that the output is whatever
> the sink expects.
>=20
> The issue really is that if we push this all to user space it would be
> a backwards incompatible change. So let's fix the current situation in
> a backwards compatible way and then get it right for the new API that
> user space can opt-into.
>=20
> Does that make sense?

It makes sense as far as userspace does not need to be changed to make
use of this.

But if userspace will need changes regardless, why continue on a
dead-end API? One reason could be that a new explicit API is too much
work compared to when you want your issues fixed.

If you are introducing a new KMS property (the override control), then
by definition userspace needs changes to use it.

[1] OTOH is a re-design the world -approach, which is am not suggesting
when I talk about making this explicit. I'm thinking about a much
smaller step that concerns only quantization range handling inside the
existing color pipeline "framework". E.g. deprecate "Broadcast RGB"
property and add "quantization range conversion" property that is
orthogonal to another new property for the quantization range metadata
sent to a sink.


Thanks,
pq

> > > Appendix A: Broadcast RGB property
> > >
> > > A few drivers already implement the Broadcast RGB property to control
> > > the quantization range. However, it is pointless: It can be set to
> > > Auto, Full and Limited when the sink supports explicitly setting the
> > > quantization range. The driver expects full range content and converts
> > > it to limited range content when necessary. Selecting limited range
> > > never makes any sense: the out-of-range bits can't be used because the
> > > input is full range. Selecting Default never makes sense: relying on
> > > the default quantization range is risky because sinks often get it
> > > wrong and as we established there is no reason to select limited range
> > > if not necessary. The limited and full options also are not suitable
> > > as an override because the property is not available if the sink does
> > > not support explicitly setting the quantization range.
> > > =20
> > =20
>=20
> [1] https://gitlab.freedesktop.org/pq/color-and-hdr/-/issues/11
>=20


--Sig_/te9gkBy7/N5O1t77Qlfxl3j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmN3SikACgkQI1/ltBGq
qqeqsw//Z+dwpSjcBoaECZ41ctCJGhlliwWiB5Cf2412rHc0jEtXKW+qLBIFldaL
iFBSsazoYCFs2Te2ichyobln9hiTcLuImORXAjtWrxCeULu7pZ7NSxQtl5dgVfxi
fB2QffP9A3/AWTI5YDH8ejFWGCOR61Ls7Egk3MuwUA7Vqj5L7l5BH6huG8OQjW/G
5UC5YWfnsAmFiCeZdvyS+/qQP34FZZyMRPAaBdZDF+D2sa2eaXnQOYHPf9AOdbrU
MeqGJESSbAcF8YOziniUJsqHTjHmdit3u0Be0gYshzhT6UfQwQKbZV7dDA4luSCD
a0wpQallVi1fMzwK8D5MFu93RWOa8zj2a189kdg6iTPdVDkeQgNQpvjEVhDEwXyp
/743L1/j7qBXuoYL7rsbRExxT6vv/jeiemNqy1DoNwsMTXuYAihiYfoRARP1sNLv
qZmFcU3q/yxohhUaSp/UMaBA3Xe4vislyCh7Jlc/6aPrzrlFflNecwhFYmVUDhfi
FBtpQPwX0NccqSMQNsRg2l/5FfpyK4eLUXzYDm3iY0KDcmFTX/uZjxTg2G4lwLts
idwImhofbHP5F8pHQi9GbVquTAOy1e1nQB0cwe/sxrQKUAz+p7utYOXLPuLSzKnv
D3fceEM8MwllQP08On2i3IgZYQ5E+HeJ+mVHEp4qkQJQXFLMauw=
=A6h1
-----END PGP SIGNATURE-----

--Sig_/te9gkBy7/N5O1t77Qlfxl3j--
