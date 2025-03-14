Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C248A618C8
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 18:58:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 717E210E365;
	Fri, 14 Mar 2025 17:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Bw1jHUi3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6ED010E35D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 17:58:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E95BE5C542D;
 Fri, 14 Mar 2025 17:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E66A8C4CEE3;
 Fri, 14 Mar 2025 17:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741975131;
 bh=z6B4P6li35NYfvylmnEIJbA99kfnu8jlKpUXmSAMqD8=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=Bw1jHUi3Ya3L6oLYeiERZiA1MI/e5bpo7F/Y15CRB6uQ5cBl6rauUOJ6hB9NRKdoC
 v5IPQSKHkxpJgDLxYKOh4+Bmzb1eLA1/Lzaqq6EJ9uPIBDuV1WnuA7KdRk262rbtKa
 Y5hCo9VHoLGAMPl9zE7emTWBoFJGyhkMoQDsk7v/b6Uc5qwZksQWU2oXe02jORkneO
 MjxyIozdSoT3xoTkTo4QdCTZU4QNUNpCQB0K0Qr5bGCYNfovRHKVWvZa63MEUwRMw7
 l2AmNkiIOZCpeB2dCmZqmNryEGuGxVp9yx3fpSy8BaO9/bZuZuf4aOgUd33QAZewtV
 HxBIi6NEi7m/Q==
Message-ID: <ab48cc194d9fc1f5d3fc7846abbf4cce@kernel.org>
Date: Fri, 14 Mar 2025 17:58:48 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v7 01/11] drm/bridge: add devm_drm_bridge_alloc()
In-Reply-To: <20250314-drm-bridge-refcount-v7-1-152571f8c694@bootlin.com>
References: <20250314-drm-bridge-refcount-v7-1-152571f8c694@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Anusha Srivatsa" <asrivats@redhat.com>,
 "David
 Airlie" <airlied@gmail.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Fabio
 Estevam" <festevam@gmail.com>,
 =?utf-8?b?SGVydsOpIENvZGluYQ==?= <herve.codina@bootlin.com>, "Hui
 Pu" <Hui.Pu@gehealthcare.com>, "Inki Dae" <inki.dae@samsung.com>, "Jagan
 Teki" <jagan@amarulasolutions.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Jonas Karlman" <jonas@kwiboo.se>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Marek Szyprowski" <m.szyprowski@samsung.com>, "Marek
 Vasut" <marex@denx.de>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Paul Kocialkowski" <paulk@sys-base.io>,
 "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Robert Foss" <rfoss@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Stefan Agner" <stefan@agner.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
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

On Fri, 14 Mar 2025 11:31:14 +0100, Luca Ceresoli wrote:
> Add a macro to allocate and initialize a DRM bridge embedded within a
> private driver struct.
>=20
> Compared to current practice, which is based on [devm_]kzalloc() allocati=
on
> followed by open-coded initialization of fields, this allows to have a
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
