Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BC0C00C48
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 13:34:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F423010E3D0;
	Thu, 23 Oct 2025 11:34:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GnbT5Fbl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C3F310E3D0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 11:34:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D049963FD0;
 Thu, 23 Oct 2025 11:34:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE2FFC4CEE7;
 Thu, 23 Oct 2025 11:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761219288;
 bh=wZSFPlfJ5Wws9I4AlQE1HXuapFLuMLNmf+WneBD3X+M=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=GnbT5FblF+vK9H99mez4qb5fYxlyMnE098aehLMt0dIQS+ENW1HlEhk8B3b51CGlr
 Cha4LKL1zNu+SkLb8NOhbfbLTyJGCpB4r0EEKf28zIUDcJnSdxVCXxbRWX2MaB1tnT
 hrtt5Msb8eHZ5JIXidaGCK4tVdq5KGQZtF2g0JS2CwFLAbW5cGkSN7PWQfJOJn5a1Q
 q5ExVQXpsk5VieslD1mHVGfUtG9Lr/f2qMJWIEiiMmqFlTe6u5zuVeL5zUn/4WE6nS
 cU/enV3uIp9LGulBOs0FkfOpBLO2sxGN3NkyeBdQaZBopp0die3i3NW8174jd3pKVd
 fRejx1GBRnu5w==
Message-ID: <adb145ba87ca8bb38c2edef1b1b275ed@kernel.org>
Date: Thu, 23 Oct 2025 11:34:45 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: =?utf-8?b?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Subject: Re: [PATCH 1/2] drm/tests: Handle EDEADLK in
 drm_test_check_valid_clones()
In-Reply-To: <20251023054614.6267-1-jose.exposito89@gmail.com>
References: <20251023054614.6267-1-jose.exposito89@gmail.com>
Cc: airlied@gmail.com, dan.carpenter@linaro.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lumag@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, simona@ffwll.ch,
 tzimmermann@suse.de, "Maxime Ripard" <mripard@kernel.org>
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

On Thu, 23 Oct 2025 07:46:05 +0200, Jos=C3=A9 Exp=C3=B3sito wrote:
> Fedora/CentOS/RHEL CI is reporting intermittent failures while running
> the drm_test_check_valid_clones() KUnit test.
>=20
> The error log can be either [1]:
>=20
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
