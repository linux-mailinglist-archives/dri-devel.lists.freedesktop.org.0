Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1DF92CA5C
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 08:07:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9907F10E5B0;
	Wed, 10 Jul 2024 06:06:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ffQDskmS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17FCF10E5B0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 06:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9QIzD0j4zL4nNNrCXdfBx195jkWyBbwel+g/TW4MoGk=; b=ffQDskmSPcigRKLOlWgrxijAIP
 z+5RmZTtF2W4ztZL9BN9ueFOrNx08fFU5k7VZw1PSwm+4B7DrWyiJ5d8oXqGiUMG6Q+6U9374h8TT
 +irvxAjZpD1Za328GJ2S9Q4+r5regD0dQ5DyjpLbiIOuHh4GzilJPYBozpQu7igmn2gQVH0g7ZkUQ
 BUeXhe3bOSM7PSy8+HrJm3cQD//TKuccsItSn4pSOYD1QSU3i4P0NvvemXCtxmH2XSvT7hpXJkzlC
 V32Mf875uARQH2Ib+kK9DqV1DCbz/mrDvNccstjPRaCKL/Y/CAVspdC2jazD7PEQiernO+4o8vXks
 +CN7Aq5Q==;
Received: from 62.83.34.243.dyn.user.ono.com ([62.83.34.243]
 helo=[192.168.0.17]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sRQTf-00D68f-Ck; Wed, 10 Jul 2024 08:06:55 +0200
Message-ID: <d15dedd5ee4fcecac132a7558f29b555831cbb17.camel@igalia.com>
Subject: Re: [PATCH 00/12] v3d: Perfmon cleanup
From: Iago Toral <itoral@igalia.com>
To: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 kernel-dev@igalia.com,  Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date: Wed, 10 Jul 2024 08:06:54 +0200
In-Reply-To: <20240709163425.58276-1-tursulin@igalia.com>
References: <20240709163425.58276-1-tursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

El mar, 09-07-2024 a las 17:34 +0100, Tvrtko Ursulin escribi=C3=B3:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>=20
> When we had to quickly deal with a tree build issue via merging
> 792d16b5375d ("drm/v3d: Move perfmon init completely into own unit"),
> we
> promised to follow up with a nicer solution.
>=20
> As in the process of eliminating the hardcoded defines we have
> discovered a few
> issues in handling of corner cases and userspace input validation,
> the fix has
> turned into a larger series, but hopefully the end result is a
> justifiable
> cleanup.
>=20

Thanks for going the extra mile with this :)

Patches 1 and 5-8 are:
Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>

Iago

> Tvrtko Ursulin (12):
> =C2=A0 drm/v3d: Prevent out of bounds access in performance query
> extensions
> =C2=A0 drm/v3d: Prefer get_user for scalar types
> =C2=A0 drm/v3d: Add some local variables in queries/extensions
> =C2=A0 drm/v3d: Align data types of internal and uapi counts
> =C2=A0 drm/v3d: Fix potential memory leak in the timestamp extension
> =C2=A0 drm/v3d: Fix potential memory leak in the performance extension
> =C2=A0 drm/v3d: Validate passed in drm syncobj handles in the timestamp
> =C2=A0=C2=A0=C2=A0 extension
> =C2=A0 drm/v3d: Validate passed in drm syncobj handles in the performance
> =C2=A0=C2=A0=C2=A0 extension
> =C2=A0 drm/v3d: Move part of copying of reset/copy performance extension
> to a
> =C2=A0=C2=A0=C2=A0 helper
> =C2=A0 drm/v3d: Size the kperfmon_ids array at runtime
> =C2=A0 drm/v3d: Do not use intermediate storage when copying performance
> =C2=A0=C2=A0=C2=A0 query results
> =C2=A0 drm/v3d: Move perfmon init completely into own unit
>=20
> =C2=A0drivers/gpu/drm/v3d/v3d_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 =
9 +-
> =C2=A0drivers/gpu/drm/v3d/v3d_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 16 +-
> =C2=A0drivers/gpu/drm/v3d/v3d_perfmon.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 44 +--
> =C2=A0.../gpu/drm/v3d/v3d_performance_counters.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0 16 +-
> =C2=A0drivers/gpu/drm/v3d/v3d_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 106 ++++---
> =C2=A0drivers/gpu/drm/v3d/v3d_submit.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 285 ++++++++++------
> --
> =C2=A06 files changed, 281 insertions(+), 195 deletions(-)
>=20

