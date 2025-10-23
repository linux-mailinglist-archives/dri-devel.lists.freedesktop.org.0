Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 986FFC00C63
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 13:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E12F10E3D4;
	Thu, 23 Oct 2025 11:35:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mwztSIhR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDBA410E3D4
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 11:35:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3A35D63FD0;
 Thu, 23 Oct 2025 11:35:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44433C4CEE7;
 Thu, 23 Oct 2025 11:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761219324;
 bh=d8rz3zIwAwu9M9rBfgRioNMIncSdp2C2P3bxzwJ3Zrc=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=mwztSIhRT03cJoNoZebHH56YanbdiQMq03NIX1h9noC1v9QeTAGs9Q91D6f8TLhii
 onnAFGn26g78iInyewejiE9XKKN5bpmiIHbMvEHvFIzy2i/8ia12GMjHJo6fHETNCS
 Pm38WssKUcHF+ZcxM4/Kam8maQEtpMowAQYlM1EVxfAcSDpwK1eegxC5MKcTwLyIcf
 Q+Uy2uKPsLy9ywtwfBKKJKEsZiI8uKApP/Q73NzVl7gNpIniSh4GNPh8ohiNeh4IJA
 tZTpmtMIvfTzZ95DiMrfop2RTrOHd9UBbAVGwlJMZYsZcbosF08E+2+kB2xUobsiUg
 APGrKH04IdCnA==
Message-ID: <464a144d33bc61580325aebac55f0617@kernel.org>
Date: Thu, 23 Oct 2025 11:35:21 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: =?utf-8?b?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Subject: Re: [PATCH] drm/tests: hdmi: Handle
 drm_kunit_helper_enable_crtc_connector() returning EDEADLK
In-Reply-To: <20251022092233.8020-1-jose.exposito89@gmail.com>
References: <20251022092233.8020-1-jose.exposito89@gmail.com>
Cc: airlied@gmail.com, cristian.ciocaltea@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lumag@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 simona@ffwll.ch, tzimmermann@suse.de, "Maxime Ripard" <mripard@kernel.org>
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

On Wed, 22 Oct 2025 11:22:14 +0200, Jos=C3=A9 Exp=C3=B3sito wrote:
> Fedora/CentOS/RHEL CI is reporting intermittent failures while running
> the KUnit tests present in drm_hdmi_state_helper_test.c [1].
>=20
> While the specific test causing the failure change between runs, all of
> them are caused by drm_kunit_helper_enable_crtc_connector() returning
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
