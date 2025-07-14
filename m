Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 282E1B0376D
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 08:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62FA910E406;
	Mon, 14 Jul 2025 06:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="IoZlEsfT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC0010E1AF
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 06:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jg884M7ZLGYtgSLpfWOIPpG+tIsp4ixo/WzB1CPe1qE=; b=IoZlEsfTKBpFmaaJnvpmOfOds+
 e+nXRbr9ag+EgiSGO3T9PwAl5hrJ4On+Nf+wgnocgj9LIzdn2R5GWLVegiTnAyG79CfGZNKF2Uayk
 sVwl2RPVV3NQ8JR06PjOaH2aE2WLAnBd/TP8pF1IQzfiQ8rYGJcAF2OwUOujtQwrJ22wB/P+KMCSe
 aVdwlowMukz0tCiT+8bq6jnfbN5qLywfyz/0e4uBv79Z85XIp+4+B7wVnKG443jFNg64NOUH+dSTw
 QojFTBrAPa/WVq2FaZs6kOas9zkLruFdhiyfWlg4AHIpyPPplRJ+u74VoaFRLhSEiA+OFaAIdshgW
 RuS2eGcg==;
Received: from [159.147.180.92] (helo=[192.168.0.17])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ubD4Q-00GJ4x-OQ; Mon, 14 Jul 2025 08:53:50 +0200
Message-ID: <1b561f8dface4038402e4dc616cb26f73ce7ec9b.camel@igalia.com>
Subject: Re: [PATCH 0/2] drm/v3d: Expose global and per-context GPU reset
 counters
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, "Juan A. Suarez"
 <jasuarez@igalia.com>, Melissa Wen <mwen@igalia.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org
Date: Mon, 14 Jul 2025 08:53:40 +0200
In-Reply-To: <20250711-v3d-reset-counter-v1-0-1ac73e9fca2d@igalia.com>
References: <20250711-v3d-reset-counter-v1-0-1ac73e9fca2d@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
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

Looks good to me:
Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>

Iago

El vie, 11-07-2025 a las 12:18 -0300, Ma=C3=ADra Canal escribi=C3=B3:
> The GL extension KHR_robustness requires a mechanism for a GL
> application
> to learn about graphics resets that affect a GL context. With the
> goal
> to provide support for such extension in Mesa, this series implements
> global and per-context GPU reset counters that user-space can
> retrieve
> using the DRM_IOCTL_V3D_GET_PARAM ioctl.
>=20
> The corresponding user-space implementation for this series is
> available at [1].
>=20
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/35965
>=20
> Best Regards,
> - Ma=C3=ADra
>=20
> ---
> Ma=C3=ADra Canal (2):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/v3d: Add parameter to retrieve the glo=
bal number of GPU
> resets
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/v3d: Add parameter to retrieve the num=
ber of GPU resets
> per-fd
>=20
> =C2=A0drivers/gpu/drm/v3d/v3d_drv.c=C2=A0=C2=A0 | 11 +++++++++++
> =C2=A0drivers/gpu/drm/v3d/v3d_drv.h=C2=A0=C2=A0 | 11 +++++++++++
> =C2=A0drivers/gpu/drm/v3d/v3d_sched.c |=C2=A0 5 +++++
> =C2=A0include/uapi/drm/v3d_drm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 =
++
> =C2=A04 files changed, 29 insertions(+)
> ---
> base-commit: 917b10d90990fd2138b5dbc2d22cfa428c070ade
> change-id: 20250708-v3d-reset-counter-ab231c87bd35
>=20
>=20

