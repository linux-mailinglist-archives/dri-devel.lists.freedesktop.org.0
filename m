Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0C4C7A6F2
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 16:12:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB5810E89C;
	Fri, 21 Nov 2025 15:12:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ITZhY9Cw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84DC510E89C
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 15:12:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 41A7A4089A;
 Fri, 21 Nov 2025 15:12:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1421C4CEF1;
 Fri, 21 Nov 2025 15:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763737965;
 bh=0pQsw6YqEHyPK56ix6znWLkOdaepGxe12FjZqbBnn+M=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=ITZhY9CwXeZWdnyczZwovFe/mqvGe8EkH6IQ2ROQc7b5tz5OxNVn9iFCNQtOTmEwS
 vipr2dlB0oGwZhOoajEhPQtLVCFJkDMnJ6nLEuXS9mWmwcEIH6Op4zUnwnDBuPECA9
 8sXKSbycj+j+0fUDSgVr5pdUMAlA8AiNjeyMVa9VLgVb0XiEwyVZ5HWojcWmBdYbiG
 4z0mcf5XcKSuqjwY+SNdSOfLdu7XoK43KIPtLcQWPUi08tGaDYIEs31iun7yyMpT3U
 Hb/8obwoWfaCg4xkcFR05R/oF5mt4cGNV+6Rh/F5PWXFNY9XhuePiUhQWFfqKNVPZt
 OzM5BYUk4Akbw==
Message-ID: <165d97e3434aa8dd46508da3450b59e5@kernel.org>
Date: Fri, 21 Nov 2025 15:12:42 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Ludovic Desroches" <ludovic.desroches@microchip.com>
Subject: Re: [PATCH REGRESSION] drm/panel: simple: restore connector_type
 fallback
In-Reply-To: <20251121-lcd_panel_connector_type_fix-v1-1-fdbbef34a1a4@microchip.com>
References: <20251121-lcd_panel_connector_type_fix-v1-1-fdbbef34a1a4@microchip.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, "Anusha
 Srivatsa" <asrivats@redhat.com>, "David Airlie" <airlied@gmail.com>, "Jessica
 Zhang" <jesszhan0024@gmail.com>, LucaCeresoli <luca.ceresoli@bootlin.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Simona Vetter" <simona@ffwll.ch>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
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

On Fri, 21 Nov 2025 14:20:48 +0100, Ludovic Desroches wrote:
> The switch from devm_kzalloc() + drm_panel_init() to
> devm_drm_panel_alloc() introduced a regression.
>=20
> Several panel descriptors do not set connector_type. For those panels,
> panel_simple_probe() used to compute a connector type (currently DPI as a
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
