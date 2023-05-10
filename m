Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2280C6FDA3A
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 10:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 761FD10E469;
	Wed, 10 May 2023 08:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 401F110E46E;
 Wed, 10 May 2023 08:59:37 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f137dbaa4fso7998278e87.2; 
 Wed, 10 May 2023 01:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683709172; x=1686301172;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=k8pWocH14zoRXjTTSKh+iHYFvCHQ7gmZ6Qot4GVFic0=;
 b=mBCxbaZVLXwMG5uslTcZBOrsk7IGYf/P7QbF8XsLlhvJaYlj8KK5hb8t1A/ONCUJGM
 iT85Zt1F7O4Pv9D0A8PIHkiP9fivbZLzhGMfMg0ettmt9wkSelOfOK2r3SSy39eWCJtQ
 aKpVJCRwL3ozr2Fh9JrcuUj5+tdHpLVFNW6ZyaT69tNS7kYsFciswEz86/Ny+FT/ZtRX
 ffeahEJDq4fQRGs8sjo5/cYY2BtGfK2JTFIWO+iQMLrkHWpD00n/nmOnEizdqBaWvQXY
 8pXrIRlk0xSGNM4lCEBN1CyZI7j4aZ0GzVhddICOfA/EbZMz6zBDiLKK1hV/GpyBWO5A
 1Jlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683709172; x=1686301172;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k8pWocH14zoRXjTTSKh+iHYFvCHQ7gmZ6Qot4GVFic0=;
 b=fSH7+fbj1AnBuZbmnsGrYshVexlcRlauzDJru/BcSy1ndGGUDVxH0AJyZ2QhXD9cHC
 4KxqpV0F1gs0Zh3W4mAYi0AyMecEkLFcwrVPTQv9mn07OOXseQyxYOt/MeNoyYk1tyni
 Tn6+t7bwKOVZseKRkW//HEoRzhjJydYHJzDAIDWHWJAZ8nVDioSihGDZzPQtsY9lRv6e
 viP8cpEBlZa1C1/ngTyF9nUx2tFrEdUILWRl3C5xOcV+s8RfvJg78CuECf7vuri3uOfU
 Y2I4ccDKoWETHXoCep9nf9MvZuWY1pJgXz9wsNJv6fCWtF3avGI8MTyyvYxELseQjOMD
 hayA==
X-Gm-Message-State: AC+VfDxTCqIvwndX8UnuHfJtRDjqXXW9XLL3TP6dqneMMRcN31f7DFlj
 gwwN1BBKbD87yiVExKGv3nc=
X-Google-Smtp-Source: ACHHUZ6iKW8Ys+Ueh4f2oAGRZrdfslx8dXFhFqPi3SZaoBBoalQEX72xh0CcwoOK+tcdMNzOzHWs0Q==
X-Received: by 2002:ac2:4104:0:b0:4f1:4040:8143 with SMTP id
 b4-20020ac24104000000b004f140408143mr1568965lfi.60.1683709172099; 
 Wed, 10 May 2023 01:59:32 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 y20-20020ac24214000000b004dc4becfcd6sm652097lfh.54.2023.05.10.01.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 01:59:31 -0700 (PDT)
Date: Wed, 10 May 2023 11:59:28 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>
Subject: Re: [RFC] Plane color pipeline KMS uAPI
Message-ID: <20230510115928.42755c9d@eldfell>
In-Reply-To: <ZFtO2bMQOWVhRkSG@redhat.com>
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
 <CAPM=9tz54Jc1HSjdh5A7iG4X8Gvgg46qu7Ezvgnmj4N6gbY+Kw@mail.gmail.com>
 <CA+hFU4x++RDOxkc-_ZvDtQs3DtupwDV0KJyD3YAgrdh4daLotA@mail.gmail.com>
 <CAPM=9twjPr9fiJwbyNS9j=mCKmLhxbTjB5Vzq9F+Du8sdHac-A@mail.gmail.com>
 <e903d920-788f-7d70-c6f0-1faaac3c9843@amd.com>
 <CAPM=9tyOFhE0zC8540KBOkDaZE1c3zTtke_vX=DEkMTmo04A4Q@mail.gmail.com>
 <QL28tg_ZcXPQ1W5l8Hp3rDlvyKuMh09kjGHpj1GRKVrMqlB-hNI2F6FzRSP-NyfkMpk6tsO55t8UYF6Uk9b7IF1O1BHH1WKc88kNTgY2Ugk=@emersion.fr>
 <ZFtO2bMQOWVhRkSG@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.24; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JWHKKfB2/dO=jmTSo78QFUU";
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, Aleix Pol <aleixpol@kde.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>, Melissa Wen <mwen@igalia.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <mdaenzer@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/JWHKKfB2/dO=jmTSo78QFUU
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 10 May 2023 09:59:21 +0200
Jonas =C3=85dahl <jadahl@redhat.com> wrote:

> On Tue, May 09, 2023 at 08:22:30PM +0000, Simon Ser wrote:
> > On Tuesday, May 9th, 2023 at 21:53, Dave Airlie <airlied@gmail.com> wro=
te:
> >  =20
> > > There are also other vendor side effects to having this in userspace.
> > >=20
> > > Will the library have a loader?
> > > Will it allow proprietary plugins?
> > > Will it allow proprietary reimplementations?
> > > What will happen when a vendor wants distros to ship their
> > > proprietary fork of said library?
> > >=20
> > > How would NVIDIA integrate this with their proprietary stack? =20
> >=20
> > Since all color operations exposed by KMS are standard, the library
> > would just be a simple one: no loader, no plugin, no proprietary pieces,
> > etc.
> >  =20
>=20
> There might be pipelines/color-ops only exposed by proprietary out of
> tree drivers; the operation types and semantics should ideally be
> defined upstream, but the code paths would in practice be vendor
> specific, potentially without any upstream driver using them. It should
> be clear whether an implementation that makes such a pipeline work is in
> scope for the upstream library.
>=20
> The same applies to the kernel; it must be clear whether pipeline
> elements that potentially will only be exposed by out of tree drivers
> will be acceptable upstream, at least as documented operations.

In my opinion, a COLOROP element definition can be accepted in the
upstream kernel documentation only if there is also an upstream driver
implementing it. It does not need to be a "direct" hardware
implementation, it could also be the upstream driver mapping the
COLOROP to whatever hardware block or block chain it has.

For the userspace library I don't know. I am puzzled whether people
want to allow proprietary components or deny them.


Thanks,
pq

--Sig_/JWHKKfB2/dO=jmTSo78QFUU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmRbXPAACgkQI1/ltBGq
qqevexAAm/1DkNQRPQLQhpdf/jzbIfEbKnYfLcOYIzxbcxOhkSIunTPT6icEoE+q
Q18tQRxPfVOhkvnDx4gKdp6B6SXsiQP8o+JSDRnMrmvmkmpGLcXOnT/bCwZiPUh7
wd7D/8nEi8IqoApZZKZ1sVnyAB7g8nM8nJAQebm5XdSOYHqmy9i9RpF5y8R2CTfF
XIYiImv8JIG5wRIakRL74Fdb/SWrgsQ+zH+ufoabAoiFM1zAie4ftevzkCRO79hw
DsbyJTzvPP4T5D0INhV5/97vjYBCRu1s/N9UknQKBhW5gGn1e2B44RfT87RhmgYn
XMTI5jHLC/wmyCR+YUId9mmqn3bPVM/p/2yWTYQGNdYRx6EAONGPhMsMZbHUhz4p
AXbMhQ7Z/ByiE1pA+e0KWBAcdQn4XqtJKUuj1nmT+RFpvp4VtbIdaHDju5IrtAg6
rvVq1Ids+AMTOI3EzakCLkYeWWOiRf91ZgB/Fk61Z5CcJq+uOPH5K7YBYfmGoHA0
4dimeRBIU5r64hyH0KgTLUZHMpb1PWOSmPokzm5d6cydBZcwGMs4PisV7lshR7b9
fDxYIeRKkyBQOvm+InjZ9flSKoTEPlNN5Srsu+JuTO+wXYB1RYPSDI61Cr7Lc+aR
pZ/6ElIepDD/0WhR/gZuJIfFoxyWBko5dknEPWCLxDNxucMryNw=
=XJva
-----END PGP SIGNATURE-----

--Sig_/JWHKKfB2/dO=jmTSo78QFUU--
