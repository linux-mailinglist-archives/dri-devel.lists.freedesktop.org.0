Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A746F9D85CF
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 14:04:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27F5510E648;
	Mon, 25 Nov 2024 13:04:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bcL3GYuj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A315E10E648
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 13:03:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 75D715C5A79;
 Mon, 25 Nov 2024 13:03:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EF19C4CECE;
 Mon, 25 Nov 2024 13:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732539838;
 bh=wISbb0QpnxgwSzAh2HAtCG7qz3Bipu7e+h0lEbAx+yI=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=bcL3GYujtllA/mhHdAKmqKokVONHbGNx8Z1r1ZxGBFRulp/zivKwJ44vj+pyi5ILI
 BFihSzwfY8p97SST6ca0nTSYkABHnyJG/jcK/BK0Zvs7UuUcJOwoNZihTtD1hcW62v
 hNfv6GCauhdfgX8vNr8xDRliI1kh2kF5rx+BECBYqlJDuIj6PJlKaQH7tpz6S1/rIc
 xSNoLCeHpKI/2AjBytpHqjo7OtdL8z0hQFExFKuXN7G8LOw8wGWXiPCPBa7/vcZCGQ
 wN9FjGwuOw35z/oHYmINTCkLh0QyNI8KHLGrVTZ0ZpNecIE6fDx8MTFFthqOQliuEB
 hsYVZgO4espgw==
Message-ID: <768ed48e495e965d4964a3950a06b727@kernel.org>
Date: Mon, 25 Nov 2024 13:03:56 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>
Subject: Re: [PATCH v5 1/5] drm/vkms: Switch to managed for connector
In-Reply-To: <20241122-google-vkms-managed-v5-1-1ab60403e960@bootlin.com>
References: <20241122-google-vkms-managed-v5-1-1ab60403e960@bootlin.com>
Cc: arthurgrillo@riseup.net, dri-devel@lists.freedesktop.org,
 jeremie.dautheribes@bootlin.com, linux-kernel@vger.kernel.org,
 miquel.raynal@bootlin.com, nicolejadeyee@google.com, seanpaul@google.com,
 thomas.petazzoni@bootlin.com, "David
 Airlie" <airlied@gmail.com>, "Haneen Mohammed" <hamohammed.sa@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, 
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>,
 "Melissa Wen" <melissa.srw@gmail.com>, "Rodrigo
 Siqueira" <rodrigosiqueiramelo@gmail.com>,
 "Simona Vetter" <simona.vetter@ffwll.ch>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
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

On Fri, 22 Nov 2024 17:27:56 +0100, Louis Chauvet wrote:
> The current VKMS driver uses non-managed function to create connectors. It
> is not an issue yet, but in order to support multiple devices easily,
> convert this code to use drm and device managed helpers.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
