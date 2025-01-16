Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B37A13480
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 09:00:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F5F510E8E8;
	Thu, 16 Jan 2025 08:00:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GmOGMoTz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3DB510E8D2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 08:00:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AACBC5C5A3E;
 Thu, 16 Jan 2025 07:59:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8C93C4CED6;
 Thu, 16 Jan 2025 08:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737014401;
 bh=Jzq5XASc4t/SQAxRtm9CQaLFW8w+oevrMljtiPKYFsI=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=GmOGMoTzwo2Br+Fgd/QB4uxGlHKs+nXlb5oip597es+AQwTw212XN8mE37TmD/d4a
 0+T9maIxM9IbGqdo7XrDH6ri8ZftlXf5FVuUeYhPL/Cc8C28XL82oF+hozVAnK0nkb
 b9leqeAyNpr76TJaa5sIZBixupS/XluxeUO7BEPlMj1tP1zIF7//fdIn+rMW0vHRdI
 JxBT+LITbfrUs0Cj4sGIN+5huiskU8/nkuVPQXbuytBqUj3cKLOnknUaqJ9iJmxMwE
 oxcRgreNtm81qTbuk3/Jd2xLKPKpFGaKnyq4Ir2xHIyzMvz4cYkYyk1gtCMcMPuqjc
 vZGrZYn8yW2ag==
Message-ID: <74e4ccaefdde0aae88e89f77e2ea3e27@kernel.org>
Date: Thu, 16 Jan 2025 07:59:58 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>
Subject: Re: [PATCH v8 7/8] drm: writeback: Create drmm variants for
 drm_writeback_connector initialization
In-Reply-To: <20250114-google-vkms-managed-v8-7-da4254aa3dd5@bootlin.com>
References: <20250114-google-vkms-managed-v8-7-da4254aa3dd5@bootlin.com>
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

On Tue, 14 Jan 2025 15:05:49 +0100, Louis Chauvet wrote:
> To allows driver to only use drmm objects, add helper to create
> drm_writeback_connectors with automated lifetime management.
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
