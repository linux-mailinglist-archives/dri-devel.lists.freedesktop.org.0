Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF8275789A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 11:56:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71C9010E307;
	Tue, 18 Jul 2023 09:56:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A3A10E307
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 09:56:35 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b93fba1f62so31983711fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 02:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689674193; x=1692266193;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=3Q39b9yojtD09I452loIgpM2S1YMnY2Zi278Jq51Opk=;
 b=Hvs+8+Q02jumAf6+oFr/K+JxPwj9cGOMH0gGS3m3ZzxlBVd3FRKhL8KJ93Vz+SHStW
 +YCQ2ntKngealPEdu5hq6OBFJxUS/L/ZHV6AwgZdut8vRsTHJpg79MMoABpIsVPnBpio
 waNG1hbwpxcPy47FWcmn41v5sT3gSXFH4NHdtcfBNPLgVicRqvLBkilOpFcec7bT3QSp
 y/3kQLDG5h1/DQYZnT4ejXqlWB988I+S4RLctWLM7opJz8+WyFO61GChkP/mRFzHAcvY
 VNzQRDQlOk0Abi8CgtzoYNurA0mRphNmCS4IMxMw60tnzbpOdjzoHLAJddnF3FcMopai
 2C6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689674193; x=1692266193;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3Q39b9yojtD09I452loIgpM2S1YMnY2Zi278Jq51Opk=;
 b=Clic1oMI7sdVJ/iNJMsSBnASB3jyUJX0epJce8S7QgypwRO2oh8SLwIyDwHu/daYeG
 tFhvd30Lk1MfUGHPBCbJA9ivD93odrUsiHDy9KXzzuYrZYjOnc442KZgyL81Bda0C2qt
 mYcdxz1jKPy47KWm0SgSBplBcCdPw6Ykym+nSHsTB9PM7fn5bik0INwA83zQVgV1y9Ie
 KsydTFuBv3cjAnjSO2M5d5YnGfIXYj2cQiZr5zk/Ej+ogfqp+zg2XoIG7o1XqRDuET9F
 BusefS2rjPCgHbxU80BGqwdZNdt4iLZ2n8KByKhWpgxQajqi0q/GAhJ672A7YQhABoIU
 S6hQ==
X-Gm-Message-State: ABy/qLYphWoC17ImtfVkBpYYu0iIt8btF61XZrMyGuoR0lv4Wv2BjoYV
 7RGxdLN6b3771yCAJ9N8C+A=
X-Google-Smtp-Source: APBJJlExg9FL6KQTalg6BizlQiHmEo0sdrjEgElsWMjbtGqOTFYZ6v2l7e+ox8XsWwCay3B+FoOJmg==
X-Received: by 2002:a2e:84d7:0:b0:2b4:75f0:b9e9 with SMTP id
 q23-20020a2e84d7000000b002b475f0b9e9mr10295519ljh.10.1689674192729; 
 Tue, 18 Jul 2023 02:56:32 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 q17-20020a2e9691000000b002b6e13fcedcsm394846lji.122.2023.07.18.02.56.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 02:56:32 -0700 (PDT)
Date: Tue, 18 Jul 2023 12:56:23 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v4 2/8] drm/atomic: Add support for mouse hotspots
Message-ID: <20230718125623.111499ff@eldfell>
In-Reply-To: <87wmyxipc3.fsf@minerva.mail-host-address-is-not-set>
References: <20230628052133.553154-1-zack@kde.org>
 <20230628052133.553154-3-zack@kde.org>
 <20230628104106.30360b55@eldfell> <20230628105424.11eb45ec@eldfell>
 <2fb2f3985df4d6710e5ad33f6e618a52004714df.camel@vmware.com>
 <20230629110348.3530f427@eldfell>
 <6c5449cf-b7a6-1125-9493-0fe968166915@vmware.com>
 <20230704110845.490344f5@eldfell>
 <ce7754be-8085-ffd1-93f3-a774f7fcdb87@vmware.com>
 <20230706110146.0abeda0a@eldfell>
 <247b630c-8b16-7c33-987e-8b3451be3c70@vmware.com>
 <20230707113837.1a9d31e9@eldfell>
 <6be74496-f14e-302c-329e-d865f5ee3c36@vmware.com>
 <20230710111706.209cfd55@eldfell>
 <9768c00d-536b-dd7b-c8e2-e9d920cd6959@vmware.com>
 <20230711101442.72530df5@eldfell>
 <87wmyxipc3.fsf@minerva.mail-host-address-is-not-set>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IUg642l8pF07Sw1ArX9vZmx";
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
Cc: "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Michael Banack <banackm@vmware.com>, Martin Krastev <krastevm@vmware.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, Ian Forbes <iforbes@vmware.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>, "zack@kde.org" <zack@kde.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/IUg642l8pF07Sw1ArX9vZmx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 18 Jul 2023 10:41:32 +0200
Javier Martinez Canillas <javierm@redhat.com> wrote:

> Pekka Paalanen <ppaalanen@gmail.com> writes:
>=20
> Hello folks,
>=20
> > On Mon, 10 Jul 2023 10:46:56 -0700
> > Michael Banack <banackm@vmware.com> wrote:
> > =20
> >> On 7/10/23 01:17, Pekka Paalanen wrote: =20
> >> > On Fri, 7 Jul 2023 13:54:21 -0700
> >> > Michael Banack <banackm@vmware.com> wrote: =20
> >
> > ...
> > =20
> >> >> So I guess I would vote for trying to include something to that eff=
ect
> >> >> as context or explanation, but not try to strictly define how that =
works?   =20
> >> > Yes, exactly.   =20
> >>=20
> >> Okay, if we can keep the mouse/input stuff on the fuzzy side then I=20
> >> think we're on the same page. =20
> >
> > Very much of the fuzzy side, yes! All I am saying is that one cannot
> > explain the hotspot property without saying anything about it being
> > connected with input devices in some way. The very key I want to see
> > documented is that all cursor-needing pointing input devices and all
> > KMS cursor planes exposed to the guest OS are meant to be associated
> > with the same single conceptual pointer. That is all.
> > =20
>=20
> So if I understand correctly Pekka doesn't have any issues with the actual
> implementation and is just asking for better documentation ?

Correct!


Thanks,
pq

--Sig_/IUg642l8pF07Sw1ArX9vZmx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmS2YccACgkQI1/ltBGq
qqfyZA/6AqhoAUZqSMGH/snN87t/HX8+2ofzbZ+mlyDDYX4Rr9I7rZWSJ1gGLZit
QxTXAgyWQhCk0A3LonuciVfdLA76YLXGDS/SSlepHk0IB87q3ndBj1ST0HAvjZXS
bZH+X4eNdE+hm/kawA5YIeEzcuNMp5xNmzNjLpK09GsHmi+KqCN2oRK3G2bEbj4k
qJiy4FeZ+IFR8Jekzfz75pUCslridnfKWx2Pck9ccYF6SaP5ZG9RsiHtL245WYvA
ZRqGUwxrEEMQFZmR/DkZvqDVGu4hWU2EXA4yjSTBM+vYWom5tQnq/3wKJ1g0rfFH
MuH6p8W7caeHVpNGD+63FecpEFl0KFy7DmVqPKTtWDEOWxDuk647LysTimuSOzxB
WlTGPWLhudIbvVaMftK/xlDoSOakoL8eZN7DhZKgr/TAwrTHwey2krZtXs3JKinS
g97rC+o/yg1L5NABG870DVJtgIaDz0FMNlXZ3S6SeOA78oAgfztGoZHwYpSEeXRe
THoMoWInQ1zvNP8TRF8HTIaXH4vzBhNzlBqXsHJexbwHJO0AruKcCix5mlDThWHS
2AZV/G0jZUAg3xsbtNM1WpKFfamXT2sVnFN7Lmy0fb8gGgZNKMzCFPs7i6usK1Hq
luwLNvFPwblmbW+U7D1pl7XgDwQ95svauY+s7IRwhW/MI0j3yHg=
=JU3J
-----END PGP SIGNATURE-----

--Sig_/IUg642l8pF07Sw1ArX9vZmx--
