Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E898A02183
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 10:10:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 863CB10E5E3;
	Mon,  6 Jan 2025 09:10:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Zu/fN+p4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D088D10E5E3
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 09:10:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 75C32A412C0;
 Mon,  6 Jan 2025 09:08:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0BFCC4CEDF;
 Mon,  6 Jan 2025 09:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736154616;
 bh=fmNIgfuaDg0YQaUxrExgtxA4HCsqQIZwPebzqg0iv5c=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=Zu/fN+p4JrP5WDr5tmoc53Oh2PlHVVeAaaS4XvsyEsbb3hfapAvW/kBwdhsb5+AXQ
 GiiV3zm5tBdaBwUjuc6SqmWlbpIvEppJvj9Lp6VjPs2pkOCs4xgrie43zSoKFE7zZS
 Wimsdjfof5bwVbwkx5IV8YimywuCg7j0YfGOzPEGDvzU9qTZlKFS1FVrnnrYtUetDm
 XJbN1Of01cpUfjBnEjs0ve07Vk+Yr4tzjhY9nVO5wROEt0olcO8wyZ9bHU4YMvOV6i
 OD8PkJXLbhkf++iQAh8e5faFXA+y21KuKLmER5kPrOSpMUsITFh7iHWGQez05BS+Zt
 HCpcm1ZYIKnHA==
Message-ID: <f0e86f5019904c0d5295306d1a075fd4@kernel.org>
Date: Mon, 06 Jan 2025 09:10:13 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>
Subject: Re: [PATCH v3 3/3] drm/vkms: Switch to dynamic allocation for CRTC
In-Reply-To: <20241230-b4-vkms-allocated-v3-3-5dda4c1bd459@bootlin.com>
References: <20241230-b4-vkms-allocated-v3-3-5dda4c1bd459@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, "David
 Airlie" <airlied@gmail.com>, "Haneen Mohammed" <hamohammed.sa@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, 
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>,
 "Melissa Wen" <melissa.srw@gmail.com>, "Rodrigo
 Siqueira" <rodrigosiqueiramelo@gmail.com>,
 "Simona Vetter" <simona.vetter@ffwll.ch>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
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

On Mon, 30 Dec 2024 19:39:46 +0100, Louis Chauvet wrote:
> A specific allocation for the CRTC is not strictly necessary at this
> point, but in order to implement dynamic configuration of VKMS (configFS),
> it will be easier to have one allocation per CRTC.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
