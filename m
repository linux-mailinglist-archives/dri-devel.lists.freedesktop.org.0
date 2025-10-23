Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24242C00C5A
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 13:35:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6685B10E3D2;
	Thu, 23 Oct 2025 11:35:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="i751N5XN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A8110E3D2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 11:35:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CFCC663FD1;
 Thu, 23 Oct 2025 11:35:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 294F9C4CEE7;
 Thu, 23 Oct 2025 11:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761219306;
 bh=UFVCPRofApNYLXoEiB0EWJeZKw7KAl9ZbfbTyLnEy8g=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=i751N5XNkGObtoCHaZ17UaflhbXg4RHhNGF/kHWkHwUfwbZG19HR7AvW+VIH48am9
 +mFlZvWCgMgFz7V2Cs+lQerQCJfpzmPHb6G9JUhvQ429fu9v/+wDouL5Iqm1NZSy9J
 BQz4vVJZkhnwJGjmRfBD18P+QsGMlJSevuWsMgfY8nVb7c1pt+L7L3HLp/3bgIR+Kc
 c23NGMvi24taknXvtLTOXCaysB+izLNWYORZxhNxuF0KieL1MJusmoHqPRrRKqZO+R
 DIFrIpdOmOh4hePNBYtx+KV/9MOeZ00PWw2pq+aFzTFewX3BjqKomeRD9SaNQDZNpL
 CgyWvVMwGn/pw==
Message-ID: <4dec6866040cd2f7f234e5e76879d4d5@kernel.org>
Date: Thu, 23 Oct 2025 11:35:03 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: =?utf-8?b?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Subject: Re: [PATCH 2/2] drm/tests: Handle EDEADLK in set_up_atomic_state()
In-Reply-To: <20251023054614.6267-2-jose.exposito89@gmail.com>
References: <20251023054614.6267-2-jose.exposito89@gmail.com>
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

On Thu, 23 Oct 2025 07:46:06 +0200, Jos=C3=A9 Exp=C3=B3sito wrote:
> Fedora/CentOS/RHEL CI is reporting intermittent failures while running
> the drm_validate_modeset test [1]:
>=20
>     # drm_test_check_connector_changed_modeset: EXPECTATION FAILED at
>     # drivers/gpu/drm/tests/drm_atomic_state_test.c:162
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
