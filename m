Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6DBCC7070
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 11:18:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C0C410E64E;
	Wed, 17 Dec 2025 10:18:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="H15BsT0e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8634E10E64E
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 10:18:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4863F44549;
 Wed, 17 Dec 2025 10:18:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FE9CC116B1;
 Wed, 17 Dec 2025 10:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765966681;
 bh=63wq7cQ07cPk2UFbCtAzGzxdoxkYBSOxCsTLdH1kFZ0=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=H15BsT0eaQ1D/ebqcBYDmXAEMdfwMhRHNg5Ft0Pb9y4mAQbfuzLUa8KjmKUqQMhqF
 +XRVFdfgcosWyhZrYK9yGr/D+xAWGEMkyEJc81MQ6SxQyKSmCK8p4H9aiuXMbAlw/a
 mpulpwF5Ar7SptGzBiNgyNtKQgQADBrhVFd+LpPAydtJjvpKNTfeQT34bEApChZnZ5
 6AY2Mgbs7XQCh0iiVgKoRwpEsouVmfyQ6p2Un1/F7sNiMgyMVN6ddcxHHOmnLgJzrB
 D0Nwqfm9qu3uqpe+nCJwVRpZNRTB9P12Noc0YhpWh0TGsU24IKggSzaVftcX6h6vGY
 XaXZoPwwd3n0A==
Message-ID: <0330f880f446091e7bb31872f69f6de5@kernel.org>
Date: Wed, 17 Dec 2025 10:17:58 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 10/22] drm/meson: encoder_cvbs: get/put the next bridge
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-10-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-10-b5165fab8058@bootlin.com>
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

On Tue, 16 Dec 2025 18:58:43 +0100, Luca Ceresoli wrote:
> This driver obtains a bridge pointer from of_drm_find_bridge() in the pro=
be
> function and stores it until driver removal. of_drm_find_bridge() is
> deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
> refcounted and use bridge->next_bridge to put the reference on
> deallocation.
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
