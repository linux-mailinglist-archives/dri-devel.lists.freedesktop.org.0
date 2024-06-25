Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81120915FE4
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 09:21:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ADFA10E4E6;
	Tue, 25 Jun 2024 07:21:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fRQHNIYO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A1110E4D9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 07:21:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 64C02CE1726;
 Tue, 25 Jun 2024 07:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39CFEC32781;
 Tue, 25 Jun 2024 07:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719300079;
 bh=paWhFo4l8mdM1qqnlq7WGsuggTFK1HuSiJILXMv3gB4=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=fRQHNIYOI/OeAebWGlTn5lIYMN2ap0+GwLeKpOPNZYXhkB0b4d5vzgxxHMP8rvjOj
 ctcBPO21BzuzJqdD0oCPkCci5/A0PE69VVqRPB3COrFX1ap0zUJH2L7yPlwrUFEDYb
 ML2KJgGUrF/FYKGIqHH6gWBJXaHfUPcTskAWsdXy9H5Q72jisJTYIoOuYd8H5LkOi1
 LTdtJQN8AKzPSOpOqVmuuSReY5r5DE8yCHFYjdq8kfbB/5/lCmaHVJ58AvA2JKI66n
 fZay/HKkDJSWC2ROhUHbJNoByKMbQ5y7qzenkDdANxIAGIjbhn7ru0lSR+VRtnLumk
 VM/cR+1v0/EWA==
Message-ID: <1f46ea7a6787ad3c63fd3decbca45742@kernel.org>
Date: Tue, 25 Jun 2024 07:21:17 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/connector: hdmi: shorten too long function name
In-Reply-To: <20240624-hdmi-connector-shorten-name-v1-1-5bd3410138db@linaro.org>
References: <20240624-hdmi-connector-shorten-name-v1-1-5bd3410138db@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Daniel
 Vetter" <daniel@ffwll.ch>, "David Airlie" <airlied@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Mark Brown" <broonie@kernel.org>, "Maxime
 Ripard" <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>
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

On Mon, 24 Jun 2024 20:39:58 +0300, Dmitry Baryshkov wrote:
> If CONFIG_MODVERSIONS is enabled, then using the HDMI Connector
> framework can result in build failures. Rename the function to make it
> fit into the name requirements.
>=20
> ERROR: modpost: too long symbol "drm_atomic_helper_connector_hdmi_disable=
_audio_infoframe" [drivers/gpu/drm/msm/msm.ko]
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
