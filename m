Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D843AA5DC3
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 13:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1445010E5BC;
	Thu,  1 May 2025 11:33:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="XVSs1ZiS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-10627.protonmail.ch (mail-10627.protonmail.ch
 [79.135.106.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51C6D10E5BC
 for <dri-devel@lists.freedesktop.org>; Thu,  1 May 2025 11:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1746099199; x=1746358399;
 bh=VVC9Pka6kqwu4IOEqBTzL+U/l9Z4CFnMDHudKbxJ7Rw=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=XVSs1ZiSVfZm+p3CHJaKnHIL7VFFsugDV2Q+o/S5hlvRac7vJa7MQ20GMAKpg6FZw
 tSEqrOyCYAm0x03k+TqJ9L8le2SHt3NVHXC2ukaf70mQ6XXQxOz5jB+bNvUdzAtKH2
 ZqcfDMoMBxu+IPaudyVUvcSAZMLAnACaltrLq3qxJgCjvrOprYDPvPWvYbZxkuFjio
 JwNnPFEpwso8pbGjNSmIpjBUWnBbo2QAEG0AVzaGd7BuxlBK/SGQkl2JUegn1v2UE0
 tG/EbvztMdrs4qRLUhNJWpGMvz4w7NoLV+D/mE8SgDs6n63T12/+KkQEe/nEnRZUfP
 PItOIpPRRa1rw==
Date: Thu, 01 May 2025 11:33:13 +0000
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 =?utf-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 David Turner <david.turner@raspberrypi.com>,
 Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH v2] drm: document DRM_MODE_PAGE_FLIP_EVENT interactions
 with atomic
Message-ID: <XfRHxhjQc7lEyDt9K-krug5FpJqRm0K7mQ2Icv-ZbuXPKPWpzdBr-pAw88cehrvV-tHVldFK4LDiebIrjUDMpL5PHcZVafp3suTIx2tS0OQ=@emersion.fr>
In-Reply-To: <20250501112945.6448-1-contact@emersion.fr>
References: <20250501112945.6448-1-contact@emersion.fr>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 422c1ec7fe853b560e1d8652d673adb68b0350ec
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Note, I just noticed I wrote an earlier (less precise) version of this
patch here, which I completely forgot about:
https://patchwork.freedesktop.org/patch/546972/
