Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5149EE0CA
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 09:03:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C110410ECDC;
	Thu, 12 Dec 2024 08:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SSDWwKZi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0836010ECEE
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 08:02:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5953A5C67D3;
 Thu, 12 Dec 2024 08:02:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F11CEC4CED1;
 Thu, 12 Dec 2024 08:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733990574;
 bh=hZXuWLeRcpitaebs/MTxUMPLPFc8ankf78kpdgoJb/Y=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=SSDWwKZiCYHX9NGGzfbwxjU8OV1dPQ9m32YcoauTAmtyGvHMJvu2+k4V7v+TOfB35
 FVtHtVu9gU7WwCdal7MIdfdBSWDp1ABEKiEk2MUle4vYUC32EvrPZxWbyYZNWzVnvI
 PWPMxpTQvvhqFq/q+n884tUKE0UXg7FuRX/Cm27Ef94jTFVwBRdrFeYJSys1N/Mowl
 2ejeJZRhHmxd3XETDBxexMWAlvSFeGnBNG3gWKeh4hObVhB9UelaO41fr1w2DYWtXp
 FCS0DRAvorLWVTVW9fBJDkOJZLVuySQioLjVNcP3NnhKD6stoOsnM030AjE5/y/wNW
 GcqvOcUVPFppQ==
Message-ID: <d89975ed06ae64a4871a8807f53d1e18@kernel.org>
Date: Thu, 12 Dec 2024 08:02:52 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Liu Ying" <victor.liu@nxp.com>
Subject: Re: [PATCH v6 11/19] drm/imx: Add i.MX8qxp Display Controller
 interrupt controller
In-Reply-To: <20241209033923.3009629-12-victor.liu@nxp.com>
References: <20241209033923.3009629-12-victor.liu@nxp.com>
Cc: agx@sigxcpu.org, airlied@gmail.com, aisheng.dong@nxp.com,
 conor+dt@kernel.org, devicetree@vger.kernel.org, dmitry.baryshkov@linaro.org,
 dri-devel@lists.freedesktop.org, festevam@gmail.com, francesco@dolcini.it,
 frank.li@nxp.com, imx@lists.linux.dev, kernel@pengutronix.de,
 kishon@kernel.org, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, p.zabel@pengutronix.de,
 robh@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org, simona@ffwll.ch,
 tglx@linutronix.de, tzimmermann@suse.de, u.kleine-koenig@baylibre.com,
 vkoul@kernel.org, "Maxime Ripard" <mripard@kernel.org>
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

On Mon, 9 Dec 2024 11:39:15 +0800, Liu Ying wrote:
> i.MX8qxp Display Controller has a built-in interrupt controller to support
> Enable/Status/Preset/Clear interrupt bit.  Add driver for it.
>=20
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
