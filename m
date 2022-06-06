Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E27F153E3DD
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 11:13:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B11E710E12D;
	Mon,  6 Jun 2022 09:13:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 439BD10E11E;
 Mon,  6 Jun 2022 09:13:39 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id a15so22285935lfb.9;
 Mon, 06 Jun 2022 02:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=yorGsFU4f5zUC8ujjTc43PG2/LSk3r7WV7vHzWDXrgk=;
 b=Kk7K/2lSeDKuk5ytYZp46lTY85rklDXJE8iF4qzPT2Ewpd+dNlYNaSK9qiz7WtGmwp
 47kWkOFJ3Ij8awapLVq+CGy27n/YZF/OlnKiE1vlPJq47Zz7bJtwulbMyFSuZdpupDtJ
 ehoZBbkYKVMqXv/3yTe6Kobs4FonKVo4i1/PCyvdVxQhTewxc4hFlg6MELeyRtvwMZSQ
 AtmnV1oZtde1ZKz72E2MaefvBgk72u7YmbU+3v6T5N2mM5ACGkH3FsHk80npi9JqQlcG
 i2TCn3sLvtBtpHiawewICV47+SLdUr38poPX/4pk8hDOWkiWjsKz6vlA/Br2Clq0FnX2
 fm/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=yorGsFU4f5zUC8ujjTc43PG2/LSk3r7WV7vHzWDXrgk=;
 b=CVjLE9RCoqBNNjnPvicYeFZxAbPiWdYfbCjoZ1JQd+tKazPJ4dhzl4k46uzU5uYgbH
 M7dIUqKRS3YNWWeABYLCITR12Y/3n3DXByWEghZCE67/ByFS6eVr/jpUlhq0JgPHl1kS
 1lYDghbWeGKBoG2/0jFQB0qxDZ8HR+zR2IcPoFMBecdilKrjtEmmNaPdUoQy5FucoeiL
 I7bxvbaUsPnL8PBJaEwwwc5TSGODrvt0VrN1pZu0Lh3ADBKarFyM3uriEchvtbYwipUE
 dOviNBLyHzhF+qEryDTjxeevLRrX+SAFgP5Yi5XIAiG0jVT8nmQ2lXZ2InxZGLdkFJ30
 jJJw==
X-Gm-Message-State: AOAM531jGFMqK3sunATe+t3dR/xTJ62Ii8BVj3WvCJKptqwyXc1LvPYP
 0qsq7+jZD4v0vSxAscKu4wI=
X-Google-Smtp-Source: ABdhPJzuQ61T/iltl8jmkesPizlY04mNdMaXcG+6KEbhPS9TImOD5qiTDsd3tdaCmiRvU2vLzfV8TQ==
X-Received: by 2002:a05:6512:398f:b0:477:c3cd:e009 with SMTP id
 j15-20020a056512398f00b00477c3cde009mr15112162lfu.164.1654506817168; 
 Mon, 06 Jun 2022 02:13:37 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 c4-20020a2e9d84000000b002555d6ca497sm2427304ljj.115.2022.06.06.02.13.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 02:13:36 -0700 (PDT)
Date: Mon, 6 Jun 2022 12:13:27 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Zack Rusin <zackr@vmware.com>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Message-ID: <20220606121327.5dba8381@eldfell>
In-Reply-To: <06E05345-758E-456A-803D-B50978A935CA@vmware.com>
References: <20220602154243.1015688-1-zack@kde.org>
 <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
 <0F911D96-1C9B-4EF1-84D7-F5335B3FFEB7@vmware.com>
 <5Et1VowGX_0a0i5weC4YVMX7bhGDU45hQyiv4CjqyxQStY1CSUJs-xamBowRO8go8yCk1l_jgKmM_OrMB0Fdx166545AX5nL09NGsEYaBs0=@emersion.fr>
 <06E05345-758E-456A-803D-B50978A935CA@vmware.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MZCmFFGI2ZCkfw4lPjuEDso";
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
Cc: Hans de Goede <hdegoede@redhat.com>, David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Martin Krastev <krastevm@vmware.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/MZCmFFGI2ZCkfw4lPjuEDso
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 3 Jun 2022 14:38:54 +0000
Zack Rusin <zackr@vmware.com> wrote:

> > On Jun 3, 2022, at 10:32 AM, Simon Ser <contact@emersion.fr> wrote:
> >=20
> > =E2=9A=A0 External Email
> >=20
> > On Friday, June 3rd, 2022 at 16:27, Zack Rusin <zackr@vmware.com> wrote:
> >  =20
> >>> In particular: since the driver will ignore the KMS cursor plane
> >>> position set by user-space, I don't think it's okay to just expose
> >>> without opt-in from user-space (e.g. with a DRM_CLIENT_CAP).
> >>>=20
> >>> cc wayland-devel and Pekka for user-space feedback. =20
> >>=20
> >> I think Thomas expressed our concerns and reasons why those wouldn=E2=
=80=99t
> >> work for us back then. Is there something else you=E2=80=99d like to a=
dd? =20
> >=20
> > I disagreed, and I don't understand Thomas' reasoning.
> >=20
> > KMS clients will need an update to work correctly. Adding a new prop
> > without a cap leaves existing KMS clients broken. Adding a cap allows
> > both existing KMS clients and updated KMS clients to work correctly. =20
>=20
> I=E2=80=99m not sure what you mean here. They are broken right now. That=
=E2=80=99s
> what we=E2=80=99re fixing. That=E2=80=99s the reason why the virtualized =
drivers are
> on deny-lists for all atomic kms. So nothing needs to be updated. If

Hi Zack,

please, stop removing all email quoting level indicators, you have been
doing that a lot in your more recent replies. It makes reading the
emails really difficult, and I had to stop trying to make sense of the
latest emails.


It is really unfortunate that display servers have driver deny-lists
indeed. All the bug reports they got from being broken should have been
denied and forwarded to the respective drivers instead for breaking the
KMS UAPI. OTOH, I understand that some userspace projects do not want
to stop because of few broken but popular drivers.

> you have a kms client that was using virtualized drivers with atomic
> kms then mouse clicks never worked correctly. So, yes, clients need
> to set cursor hotspot if they want mouse to work correctly with
> virtualized drivers.

I'm very much agreeing with Simon. He has made similar questions and
comments that occurred to me.

Reading as much of the discussion between Simon and Zack as I could, it
seems every time Simon gets to the point, Zack hops to a completely
different use case to make Simon's argument no longer apply.

Like, root-window-less per-window remoting through KMS? How is that even
possible?

> >>> On Thursday, June 2nd, 2022 at 17:42, Zack Rusin zack@kde.org wrote:
> >>>  =20
> >>>> - all userspace code needs to hardcore a list of drivers which requi=
re
> >>>> hotspots because there's no way to query from drm "does this driver
> >>>> require hotspot" =20
> >>>=20
> >>> Can you elaborate? I'm not sure I understand what you mean here. =20
> >>=20
> >> Only some drivers require informations about cursor hotspot, user space
> >> currently has no way of figuring out which ones are those, i.e. amdgpu
> >> doesn=E2=80=99t care about hotspots, qxl does so when running on qxl w=
ithout
> >> properly set cursor hotspot atomic kms will result in a desktop where
> >> mouse clicks have incorrect coordinates.
> >>=20
> >> There=E2=80=99s no way to differentiate between drivers that do not ca=
re about
> >> cursor hotspots and ones that absolutely require it. =20
> >=20
> > Only VM drivers should expose the hotspot properties. Real drivers like
> > amdgpu must not expose it. =20
>=20
> Yes, that=E2=80=99s what I said. There=E2=80=99s no way to differentiate =
between
> amdgpu that doesn=E2=80=99t have those properties and virtio_gpu driver f=
rom
> a kernel before hotspot properties were added.

Why would userspace want to tell the difference between a driver that
truly does not need those properties, and a driver that did not add
those properties *yet*?


Thanks,
pq

--Sig_/MZCmFFGI2ZCkfw4lPjuEDso
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmKdxTcACgkQI1/ltBGq
qqdyvhAAkSJ6i6FG0bxDcQkf1UmpnHPS6FIKuRCWigzfzdCfRIb8gVeKr4fIl4R9
hMS0nfq6mND55/spqpFgAwm6O7zTqicIvCtAbwUVenGKfDOUoQ1XRLD0P2JuYDow
uihXd/BxQAjXpxKr+46nEXjF/UNrvqWU32kqgSydBVa7dv6PvJup6AO2kzJtEfAr
71qqfqbqxre/kWD8lmkSj8SCEbl9CT9bQH47arRVYgQFBt9AKrBYXFNSDNM3cMYH
nEx/kt5c+WzZkMKXySd2vXBY2eyIfOOOmQvaRR0Ka9LhDL6BtPkJ4HCeg5jw4Yrs
3Bd2zfd07+inCAf/UqGSttOoi9Dgqh0z+K6qRhRk8i4w3FCuwgJ8+9ztT7e+17pb
hxDOkq3vwN9JaPVZZBEFXHQODTd/Sim4ivCsOtsHt1Wx5ldhbwODapxv+qYwJG8+
6n7ABQ9tOrqDBAY9zYUL6FL5bIMPVQs7EBNlHmHQJasUyqo1RSQYCdE65OOxrKWR
vjWlgXk9FXpw6JnyE7jKJI7Js42tvcVlXSEgQuCZ9069v6frbl0aWKH7kcZaalZ0
ifS3N+e990IWVxJ73ihB1u9zMGJqfqg7B5zlmR7hJs+aJb6/hJKNpB4JUs4g+uEF
ZGQfgTa6O4C+UckTsUn/pAoI7NHfveMFZXRL+c9+f/PjWYpKMMM=
=hR/p
-----END PGP SIGNATURE-----

--Sig_/MZCmFFGI2ZCkfw4lPjuEDso--
