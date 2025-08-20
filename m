Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 011EFB2DE9B
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 16:03:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECAE210E74F;
	Wed, 20 Aug 2025 14:03:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GO4cLoCj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C2210E74F
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 14:03:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2B0135C698F;
 Wed, 20 Aug 2025 14:03:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12A73C4CEE7;
 Wed, 20 Aug 2025 14:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755698601;
 bh=IccV/Q9ra7VHQK1y01z+Z3/M29farXhVNSHqvsySnjs=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=GO4cLoCjoSf0WPd0gwApMmk5skpyMxHQevzmoYwUFa/51uZiW0znA/PPk0aQccW3D
 W/3mSnGkOg4vl9uNS2z8Alu6ZJDWhdU/jBwyZqceGtUj95QmXF419X9HzDjLhl/U6r
 2RaIw4senGIhyenM90bsPUcczDwLKe0qLm+7cqVFxVkBBUQEvu6GCfbjPIpjTXpnaj
 yzuuVW8B/4QfEcVB7S1cnaW+QxxZTZ3MYnIrHM8ZZ4pZneCIzht9ZbfX7htn0zcb/B
 Gy4RmQYl9gIZG9GgKq1bPpiIGqkuWlzpcgcScMWEa2RS/FTQED+eS0VOm7bz6G4cFN
 qZI12tW0TcSWQ==
Message-ID: <48178acdbc14a3a73ab2e04a6ab7346b@kernel.org>
Date: Wed, 20 Aug 2025 14:03:18 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Xiaolei Wang" <xiaolei.wang@windriver.com>
Subject: Re: [PATCH] drm/tests: modeset: Add drm connector
 atomic_[duplicate/destroy]_state
In-Reply-To: <20250811063403.98739-1-xiaolei.wang@windriver.com>
References: <20250811063403.98739-1-xiaolei.wang@windriver.com>
Cc: airlied@gmail.com, dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, simona@ffwll.ch, tzimmermann@suse.de,
 ville.syrjala@linux.intel.com, "Maxime Ripard" <mripard@kernel.org>
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

On Mon, 11 Aug 2025 14:34:03 +0800, Xiaolei Wang wrote:
> Commit 66671944e176 ("drm/tests: helpers: Add atomic helpers")
> added the atomic state path, so adding the drm connector
> atomic_[duplicate/destroy]_state is also necessary.
>=20
> WARNING: CPU: 0 PID: 96 at drivers/gpu/drm/drm_connector.c:234 drm_connec=
tor_init_only+0x934/0xee0
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
