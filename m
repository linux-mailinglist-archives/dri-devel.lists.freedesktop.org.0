Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51ACCAFFB69
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 09:55:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FDB110E898;
	Thu, 10 Jul 2025 07:55:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FM6534TB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D3310E898
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 07:55:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ACA6C5C6BBC;
 Thu, 10 Jul 2025 07:55:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CAE0C4CEE3;
 Thu, 10 Jul 2025 07:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752134101;
 bh=miC9ULvehpVK+bWFsSxBlt+WLo0btkBVIubocwNZI6o=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=FM6534TBp/dZa+q1OJNW4Nfhqqvrf4xMtLZBGTv3Ry0Jl93UewiIybj0RNGTC7Tjf
 6PR/Z4yFlQ9Vsu+/HHZH3S76dnwUCSg15QDJC5USE1gVNi10tvR7iq36U9sIzKyBbK
 hPoQc6yDrBoIcC3BYVbDOjZVwkaW+6H2/I1KFAoXAWaO0h8qyum8U1UsGC/fuo8gqh
 XN4nD8by+RJm5LhS7Udy48izYkaRohq+FOpPbpyJDPx4TyLhZZ/nibwTKtFio824bX
 rzVizmL95en6GlXrHfJ8zf5DCIvaf/A28ljlilXFaLcl8IrY+mOLGaxmum0BEaCRbw
 SbnPmttCneE3g==
Message-ID: <79541d9510b217170c8f66d6e3fefc22@kernel.org>
Date: Thu, 10 Jul 2025 07:54:58 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 3/3] drm/bridge: display-connector: put the bridge
 obtained by drm_bridge_get_prev_bridge()
In-Reply-To: <20250709-drm-bridge-alloc-getput-drm_bridge_get_prev_bridge-v1-3-34ba6f395aaa@bootlin.com>
References: <20250709-drm-bridge-alloc-getput-drm_bridge_get_prev_bridge-v1-3-34ba6f395aaa@bootlin.com>
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

On Wed, 9 Jul 2025 17:59:39 +0200, Luca Ceresoli wrote:
> The bridge returned by drm_bridge_get_prev_bridge() is refcounted. Put it
> when done.
>=20
> To keep the code clean and future-proof use a scope-based free.
>=20
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
