Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37332AE35E6
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 08:40:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1821A10E191;
	Mon, 23 Jun 2025 06:40:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="R2912Q90";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAED110E191
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 06:40:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AECD760EDF;
 Mon, 23 Jun 2025 06:40:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E23EBC4CEED;
 Mon, 23 Jun 2025 06:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750660828;
 bh=zCQz8reKW3Gzs8l9axUjAYNyAFFEzKogKMzC6QHOp6U=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=R2912Q90VgRmdjxh2YCszp7rIYKaMkHCS8CKzIBkQjxDcG+IIpln3cdq/blnz6+1x
 FqZGVwgeKaIYslbfkZAGs6PNAXIWUQP97e4lNuF6j13c5tZZ6ZoEjSdHz4w6KZA5is
 WZTl7kWBug7pa5Ggzcq6Zur+UhtbUmI7IEMmcJLCyXP7gSFQcj/gi0xoiPnXyQ+JRz
 GF3evS8XDy/jXjCw/avFjLk6UvC3hR0ce7C+JAjtL2eCN3pp8vf8qwGNmC1Q1Riel5
 Ji88kedl/BpnjpLRWxx5/F+nz6XQHSkdfj05QR4rxRK8kQPgJjWdUJsyfd3V2hWym6
 kVa0tRi+IR4Mg==
Message-ID: <dd169e5617e160873896b46e94f3d0f2@kernel.org>
Date: Mon, 23 Jun 2025 06:40:25 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v9 3/3] drm/bridge: add warning for bridges not using
 devm_drm_bridge_alloc()
In-Reply-To: <20250620-drm-bridge-alloc-getput-drm-bridge-c-v9-3-ca53372c9a84@bootlin.com>
References: <20250620-drm-bridge-alloc-getput-drm-bridge-c-v9-3-ca53372c9a84@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Anusha Srivatsa" <asrivats@redhat.com>,
 "David Airlie" <airlied@gmail.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Hui
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

On Fri, 20 Jun 2025 17:59:55 +0200, Luca Ceresoli wrote:
> To the best of my knowledge, all drivers in the mainline kernel adding a
> DRM bridge are now converted to using devm_drm_bridge_alloc() for
> allocation and initialization. Among others this ensures initialization of
> the bridge refcount, allowing dynamic allocation lifetime.
>=20
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
