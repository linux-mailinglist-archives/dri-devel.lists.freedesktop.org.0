Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B72CC70C1
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 11:19:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C42310EC04;
	Wed, 17 Dec 2025 10:19:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aQeoRHM+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB7D10EC04
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 10:19:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 685A84432A;
 Wed, 17 Dec 2025 10:19:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBBFFC19421;
 Wed, 17 Dec 2025 10:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765966785;
 bh=fJfYyQsSeLQOss48wj6CAg5BxlIApsVGcX6BEMY+KK8=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=aQeoRHM+TibsLmXwFNHe2NxMIf97IfBwI3Pg30hMh9GSe9zJkjaTYVqnVFvUzK1eO
 hqEQHweDaAiEYuLlPpORiJkPZIkXeo6wCE9zochTalRWSUuAlc5hFIsrO83aOjMHQc
 dRDBXCaydtBWbBPLhu4uiRNN5MNGkCxbiijFFTpwoKsMjBiyz7fSzN05w0kR1HecYr
 2BzJ+YfrqyRk3+VKVNamL+je8lR7xEqaXbUUbdtOq2oWqaScH4kTOjKtiYYWZwhkAP
 PrQCawA95SgM7kkFgsvUlGK8wVa42zlA4iNvg64opzMHA23KfnBNWF7wPh3QPeq1fZ
 N57d79xsvAOMQ==
Message-ID: <aff5a75a33e6e111347a7a79ebc26ddc@kernel.org>
Date: Wed, 17 Dec 2025 10:19:42 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 14/22] drm/bridge: imx8qxp-pxl2dpi: remove excess
 error message
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-14-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-14-b5165fab8058@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, "Alexey
 Brodkin" <abrodkin@synopsys.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "David Airlie" <airlied@gmail.com>, "Fabio Estevam" <festevam@gmail.com>,
 "Hui Pu" <Hui.Pu@gehealthcare.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jerome Brunet" <jbrunet@baylibre.com>,
 "Jonas
 Karlman" <jonas@kwiboo.se>, "Jonathan Corbet" <corbet@lwn.net>, "Kevin
 Hilman" <khilman@baylibre.com>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu
 Ying" <victor.liu@nxp.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>,
 "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Phong
 LE" <ple@baylibre.com>, "Robert Foss" <rfoss@kernel.org>,
 "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn
 Guo" <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
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

On Tue, 16 Dec 2025 18:58:47 +0100, Luca Ceresoli wrote:
> imx8qxp_pxl2dpi_find_next_bridge() already emits a DRM_DEV_ERROR() for
> every error except -EPROBE_DEFER. The caller emits another one, which is
> redundant. Remove the message in the caller and keep the two in
> imx8qxp_pxl2dpi_find_next_bridge() as they are more informative about the
> error cause.
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
