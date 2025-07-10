Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06054AFFB66
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 09:54:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD63310E897;
	Thu, 10 Jul 2025 07:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PZjisULI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB7B510E897
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 07:54:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DD06661473;
 Thu, 10 Jul 2025 07:54:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 053CDC4CEF9;
 Thu, 10 Jul 2025 07:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752134089;
 bh=eXSl8bjCjU1L5SLY+H6M5Dz42CkLWVlyk69+k1VhgRE=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=PZjisULI1PKs1YMYdRGmn9zN/XPVP9ytBtdWZCaeAg6+wDgz/wK3w16tYfHNr3dGc
 NoE+rcDcNegIavSmOZ4KBUJ8yrOeCUjBB6fy+5bbXNuq7+QYjcRgcYhvNx7JcVwcca
 4/NZ4GUELDBB25zj6usP4yomgnDhf+X8hK8wtrZH39RWvSvIW47jK8R6fl63nvYu4H
 hGefoO7vkZ/FjPfG9HBCmDs4IVQLTlEj8sKiu1/3vgyxsxwYRSF+fIf5igWysMR9Ci
 S1bbYsueXIOGRv4yOtUxADXmP6Q4C3PWi8VwRmDlSeVnWip2DBetYNLLTDMj6lyh+5
 jubxDGhscurtQ==
Message-ID: <a599626ffe0fff92bead9f693c1a0090@kernel.org>
Date: Thu, 10 Jul 2025 07:54:45 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 2/3] drm/bridge: select_bus_fmt_recursive(): put the
 bridge obtained by drm_bridge_get_prev_bridge()
In-Reply-To: <20250709-drm-bridge-alloc-getput-drm_bridge_get_prev_bridge-v1-2-34ba6f395aaa@bootlin.com>
References: <20250709-drm-bridge-alloc-getput-drm_bridge_get_prev_bridge-v1-2-34ba6f395aaa@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "David Airlie" <airlied@gmail.com>, "Hui
 Pu" <Hui.Pu@gehealthcare.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Jonas Karlman" <jonas@kwiboo.se>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>,
 "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
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

On Wed, 9 Jul 2025 17:59:38 +0200, Luca Ceresoli wrote:
> The bridge returned by drm_bridge_get_prev_bridge() is refcounted. Put it
> when done.
>=20
> select_bus_fmt_recursive() has several return points, and ensuring
> drm_bridge_put() is always called in the right place would be error-prone
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
