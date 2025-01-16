Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9DEA1348A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 09:00:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E1A10E8C9;
	Thu, 16 Jan 2025 08:00:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ftdNVW85";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8309710E8C9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 08:00:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AEE79A40ECD;
 Thu, 16 Jan 2025 07:58:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C57CC4CED6;
 Thu, 16 Jan 2025 08:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737014437;
 bh=UqMwLRdfqeiC7wOMJaByXRkqiNcELM6bQ67mEIz6UcU=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=ftdNVW85ECyrzq0vGsUNx0rTFKv99BC4ONH5sxm5FcfoeMtmJ8MWbAPCVOXLvTB0J
 /CAMuQ2lSQjSRX38LmTFwqv9rW4Xqo4cyuA9wpyXdsJZcIbJfWSHEbU36qs2rrux8z
 rmR8Moz9fqU6zsQxmTe+TKJcZnu52z2fmB0iXkWCSZ81g5/xCv3945xVfAqu/GXIyL
 6CiBtmPUBYJNyou0YUi7NE58p21TvNiU7ypkTe+tpVPSDxHO6XaHyd/mLZag7VPmo4
 mUUFR2wq7Jk/R3xv7pUKi4TBXKRbiEQ98Y+tEh/UE5MFsTXa9BynWZvRbGnRRC9LML
 QyKF2C/0qNtDQ==
Message-ID: <ffe5edde9469cacb8e396e858a4d0b89@kernel.org>
Date: Thu, 16 Jan 2025 08:00:34 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>
Subject: Re: [PATCH v8 4/8] drm/vkms: Switch to managed for crtc
In-Reply-To: <20250114-google-vkms-managed-v8-4-da4254aa3dd5@bootlin.com>
References: <20250114-google-vkms-managed-v8-4-da4254aa3dd5@bootlin.com>
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

On Tue, 14 Jan 2025 15:05:46 +0100, Louis Chauvet wrote:
> The current VKMS driver uses managed function to create crtc, but
> don't use it to properly clean the crtc workqueue. It is not an
> issue yet, but in order to support multiple devices easily,
> convert this code to use drm and device managed helpers.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
