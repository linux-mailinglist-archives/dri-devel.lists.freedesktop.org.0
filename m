Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C309EE0CC
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 09:03:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B1C210ECDD;
	Thu, 12 Dec 2024 08:03:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BR/0VgML";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B0B10ECDD
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 08:03:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A24435C6842;
 Thu, 12 Dec 2024 08:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 449E5C4CEDE;
 Thu, 12 Dec 2024 08:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733990580;
 bh=gEtg6k4+jAA27/mwhy/FA8PtloL7/FESqCtmrmaO7BQ=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=BR/0VgMLmeBvtGLMhmxicV1p3cT0rJrL7HMfyUDwbFDKrTsWMxIezNqF03ItvwzQm
 BWCxKncYJ4DuvDj28nHX8gF66YLkzRa1jyLtovsPam05NUHK+UaTOTdCWvH1UnPCLG
 djylASve6pz+jBANGjaOinZxwQ6zFmwWRO2nUDx1j5qbxXnA5iEvrpy5SjzDdvtap4
 fEn8ZD5mI0ACd9DQdVfsJOFoRAfNI9lQqedW+hUGKJjSSLxXcIrRTYVKzgVYJtlFwN
 Me41vB3x9e2uoQCbKy12dIp8ygwLzGaLeSQqsqN9vm5h/T9NXLrah9H/7TeMRI4qMT
 xDUi3JlSL+CLg==
Message-ID: <f3051a8c08d8af623d686cea162c945e@kernel.org>
Date: Thu, 12 Dec 2024 08:02:58 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Liu Ying" <victor.liu@nxp.com>
Subject: Re: [PATCH v6 12/19] drm/imx: Add i.MX8qxp Display Controller KMS
In-Reply-To: <20241209033923.3009629-13-victor.liu@nxp.com>
References: <20241209033923.3009629-13-victor.liu@nxp.com>
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

On Mon, 9 Dec 2024 11:39:16 +0800, Liu Ying wrote:
> i.MX8qxp Display Controller(DC) is comprised of three main components that
> include a blit engine for 2D graphics accelerations, display controller f=
or
> display output processing, as well as a command sequencer.  Add kernel
> mode setting support for the display controller part with two CRTCs and
> two primary planes(backed by FetchLayer and FetchWarp respectively).  The
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
