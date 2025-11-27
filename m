Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABFAC8FED4
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 19:35:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F54510E0A9;
	Thu, 27 Nov 2025 18:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZFRQq2Bk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF1A10E0A9
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 18:35:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8BE686014D;
 Thu, 27 Nov 2025 18:35:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73D27C4CEF8;
 Thu, 27 Nov 2025 18:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764268546;
 bh=sEyv2CMv7yg8V0AZMg5SOcc8gHfzyTLyNNU1PrASTls=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=ZFRQq2Bk8i96AA6r7CkFWEGsXO+988h4iNTZptMAfb9MNxtOKHejpt93Dht9NpeWF
 XyEa42DLqlnUFnrXSyRRVCOOilTvOCKWZX3XZpd1CcBrEZ+DB83tsPdXAfJTRln0uu
 pUMFfdp7jbn6KDbtdDp3wC2i2AMRdCgTlsstnJC2li4XfmyvIGVGd1PMWWaUG5dbro
 ET4kl6PAThEFA/lG4H1Y4a/R6aR90YgSr3eRerd+0idkHH8vARYvRLZp40+7CPLO9P
 00klZ8GOzX6OwQr/FD22vCkuSyN6jF57Qy4FeJVSnNDMW9z0BsLvFSP0tLph9QZZhe
 qnqJ8SWF07VjQ==
Message-ID: <546bc098a35360c659b6dfb88d5cb451@kernel.org>
Date: Thu, 27 Nov 2025 18:35:39 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 0/2] drm/bridge: handle gracefully atomic updates
 during bridge removal
In-Reply-To: <20251112-drm-bridge-atomic-vs-remove-v3-0-85db717ce094@bootlin.com>
References: <20251112-drm-bridge-atomic-vs-remove-v3-0-85db717ce094@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert
 Foss" <rfoss@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
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

On Wed, 12 Nov 2025 17:34:33 +0100, Luca Ceresoli wrote:
> This is a first attempt at gracefully handling the case of atomic updates
> happening concurrently to physical removal of DRM bridges.
>=20
> This is part of the work to support hotplug of DRM bridges. The grand plan
> was discussed in [1].
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
