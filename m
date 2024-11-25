Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A509D85D1
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 14:04:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F79B10E649;
	Mon, 25 Nov 2024 13:04:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="L+OBS5o0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A1D10E64F
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 13:04:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3CC285C4D58;
 Mon, 25 Nov 2024 13:03:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19B4AC4CECE;
 Mon, 25 Nov 2024 13:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732539849;
 bh=KHvW4Onn19WYFMw2iYzTcZkbAoTI3RCvTBDCiMQzLB4=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=L+OBS5o0qFxjQi0Wv4YmbLOAscDUh0xzwRIjHxUZTGyJmolfYpRXPSwr1qLq8XZQw
 AouBExp4obsp9u3wnyE7oN5dB9rSCIG+hRGOj1ztJ+FEnI74HDH7Eoc4EJYxnnApZb
 3OmkWW/P4Iuylwz8ld8aLiiNTJKhVH6FpnsLlaZJ4kwRQE7Jkumj8CngZN66HYszEB
 KL34/NcPT3FkcMVMgSDP6uyGBMO3XrKeif3HJ+wgKwA4KFypsPySDdttBCrmRH5x7c
 V8vbtSF6EqiZzNgANJ2SRoji2ngxiUXNEQiIDIpBkdQSCcrGunzXu509trYVc+7Bdx
 6s9hkXD8p4DKg==
Message-ID: <ebed01d2da63995dce745cf9a4a6e676@kernel.org>
Date: Mon, 25 Nov 2024 13:04:07 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>
Subject: Re: [PATCH v5 2/5] drm/vkms: Switch to managed for encoder
In-Reply-To: <20241122-google-vkms-managed-v5-2-1ab60403e960@bootlin.com>
References: <20241122-google-vkms-managed-v5-2-1ab60403e960@bootlin.com>
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
Content-Transfer-Encoding: 7bit
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

On Fri, 22 Nov 2024 17:27:57 +0100, Louis Chauvet wrote:
> The current VKMS driver uses non-managed function to create encoders. It
> is not an issue yet, but in order to support multiple devices easily,
> convert this code to use drm and device managed helpers.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
