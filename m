Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 717AF82EC07
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 10:46:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A0BE10E1AC;
	Tue, 16 Jan 2024 09:46:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E8110E010;
 Tue, 16 Jan 2024 09:46:27 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-50e80d14404so9179806e87.1; 
 Tue, 16 Jan 2024 01:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705398326; x=1706003126; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=At3B4QtrmUgiNbmYWMG1cCFn3JGTUgYF5xXfwvD36po=;
 b=gZAa4oP8hyvz4IJB1ZSpzo2JjJGd2/QXs2JBV86Dr3PnpvjIcA3TnwEIkBsJwMpxsj
 3ak2QgMVXFMC5HKoySGH2ls7xgRzrrvlX0E4qu0wYE4vKSGjEVtdtPgRIiDHTxHxd6QY
 xNKT3ylk05W0jFCe9g5sF1JPioQNeG6igJYrpeJplhavPButjYagp72Tg4E/9t1gKXIi
 HQFIEBdspYe0gJpN8nnXAm3UXJ6v9Ykl+HtQElj+8c7szGStQggpVZ8PcrG+SwRbH/I2
 Z7EaOMEtVaxdQExNVt/3s68h0R5dbnAHS0GTGfRPg/LzleZ/iaoxpuFJt6Y6Myw+0xFX
 ydMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705398326; x=1706003126;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=At3B4QtrmUgiNbmYWMG1cCFn3JGTUgYF5xXfwvD36po=;
 b=H/Ar70sn8TNiHhvI30oLhsa/hzFODBn/6Rs2obIOdIBwUc/hX2vfMiBL53gevNavnh
 Kp3LH410iWio84VsrRq6O1u4TznchsxnoeF5OS4FQTJI3LWonaAzRowq0hevOIYNCdLU
 Vw6iBEyZiSuue4/+Ly7LrL34ZWxq9tXlEif7dnUVU2sNKKoZ/0m9Y8cAG+nZ5uRpMiiA
 2KPx8KDpGmK7SoYEP3730bWKZvox83KAMDkW9HPKFGECyqjXpg0SHx+ICf6Jz9rfce92
 XlwORK8aKOZneOB4U6m4Gd/y8gITE03MsF3oXNUeqcLBBPBwo9nodZKwejeAm3F0r/9n
 K8Ow==
X-Gm-Message-State: AOJu0YzOenjjFFFUeizsYojJGxFWkZDiXk+3itn7pQ/CeUDqBl0MouFJ
 TDWCCAgKF4jyYZAkAIE7cUY=
X-Google-Smtp-Source: AGHT+IFyMG7eYvg8LSV5tNpbngAXDBcufgSyuhCwNWX2XrqZTzxCIqdYkVwV4ZdSUCFyqvwg2OriXg==
X-Received: by 2002:a05:6512:2355:b0:50e:a431:de30 with SMTP id
 p21-20020a056512235500b0050ea431de30mr4479968lfu.6.1705398325438; 
 Tue, 16 Jan 2024 01:45:25 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 a6-20020ac25206000000b0050ee78fd23esm1404395lfl.262.2024.01.16.01.45.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 01:45:25 -0800 (PST)
Date: Tue, 16 Jan 2024 11:45:22 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Subject: Re: [PATCH 0/2] drm/atomic: Allow drivers to write their own plane
 check for async
Message-ID: <20240116114522.5b83d8b6@eldfell>
In-Reply-To: <20240116045159.1015510-1-andrealmeid@igalia.com>
References: <20240116045159.1015510-1-andrealmeid@igalia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Qpm4_L9s_xn4TQueKpnXLKx";
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
Cc: daniel@ffwll.ch, 'Marek =?UTF-8?B?T2zFocOhayc=?= <maraeo@gmail.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Xaver Hugl <xaver.hugl@gmail.com>, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com,
 Daniel Stone <daniel@fooishbar.org>, Dave Airlie <airlied@gmail.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Qpm4_L9s_xn4TQueKpnXLKx
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 16 Jan 2024 01:51:57 -0300
Andr=C3=A9 Almeida <andrealmeid@igalia.com> wrote:

> Hi,
>=20
> AMD hardware can do more on the async flip path than just the primary pla=
ne, so
> to lift up the current restrictions, this patchset allows drivers to writ=
e their
> own check for planes for async flips.

Hi,

what's the userspace story for this, how could userspace know it could do m=
ore?
What kind of userspace would take advantage of this and in what situations?

Or is this not meant for generic userspace?


Thanks,
pq

> I'm not sure if adding something new to drm_plane_funcs is the right way =
to do,
> because if we want to expand the other object types (crtc, connector) we =
would
> need to add their own drm_XXX_funcs, so feedbacks are welcome!
>=20
> 	Andr=C3=A9
>=20
> Andr=C3=A9 Almeida (2):
>   drm/atomic: Allow drivers to write their own plane check for async
>     flips
>   drm/amdgpu: Implement check_async_props for planes
>=20
>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 30 +++++++++
>  drivers/gpu/drm/drm_atomic_uapi.c             | 62 ++++++++++++++-----
>  include/drm/drm_atomic_uapi.h                 | 12 ++++
>  include/drm/drm_plane.h                       |  5 ++
>  4 files changed, 92 insertions(+), 17 deletions(-)
>=20


--Sig_/Qpm4_L9s_xn4TQueKpnXLKx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmWmUDIACgkQI1/ltBGq
qqeVeA//crRWJQuEXHaVAo60Oo43iWZpDJ9PFF6fFN4a0ez+KAFPjNRNo21jRuSw
waL6xm/WyX46I37DXUSRZHiDD8pOrZ+/VBxoT47EWsNpCJE3muJFsLQq1Wt+htwE
wL1rludAND0O63+sY4TGsyfR6EWNUg81teQoVZT+kEKDoxsJ+7eKDIgf1s7vKzT1
lv5thV2FTEAHD8zcnWons4bKpARIdtq0ZFbnkC0ycV9RzctH2ZxTgARts16DU8e9
5QmJEOYf1POkwHOCZoioBiejixLy9jPHuUw2i4ZIu07nuPncXnxMxXRPi5Y8zzJD
t6X2rHBwo/ZFBlcNdXiIRCUiPoV0POeKm2Q3mjicpn+AsR6abbVoR6oNOis/SrTL
jrQQ7BtP5lXCUSrsMrNErXiDwKnXkgg4ewI59HpJ7aWSrt6gXr19votpVACAeemM
aTVBVdPHZxr3fdUlVOHhPqrq2+bHDU3sld6or2da8hZ1sMUNYNe1z31h55FiUpEH
HL4IQ3EsqFeJbsq/3VrVY3V7PCYwSHYQb4ULl1MwqWai/oqQYgrFqTOjqcpGDq/P
yXyyXWLJD7OVMkhSATZuvzow2zBYpMm0dPdYhOPSOQmKraIvvs/Sj4AkTga7Q9Jz
cm3FWB4qP9H+6qBlk/coEue22ncdunJTApcIh/SI8AA0n58Dhz4=
=GGuB
-----END PGP SIGNATURE-----

--Sig_/Qpm4_L9s_xn4TQueKpnXLKx--
