Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB3FA0260B
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 13:57:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6285C10E674;
	Mon,  6 Jan 2025 12:57:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GqTqaWSL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567BC10E674
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 12:56:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B6657A416FC;
 Mon,  6 Jan 2025 12:55:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED08BC4CED2;
 Mon,  6 Jan 2025 12:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736168217;
 bh=iIYkpk4v246bDtF++ZTNgGEp/dxMLVfOwboOFgwy2zE=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=GqTqaWSLHpjB2iPMXonBJoaWT5I7mgHxfbI64KSTIU4waDBoSRb7vMmIyc6U52j4/
 CvdV0fGnuoEd2zicfVDZtPUOMd3pNw2L0sMHmP54qfeQa6xpqDJbzLFLJymtdiji3f
 +gIJkw2XJkwTUWfGOZlgcGaYswhn74IKeBNcEsFvK8m4GMTEJCjKTNs0PKd3HUn5i5
 QqxF7o/gueuAOhv1AbUmJEK54+1Aa4eZhaAqUh3GlYbAAiZFGUfDOgaFZxZZLsNLn9
 w4Oa+ZguYy/lIaMdMBM6VTc7qpESSheJnWe/90/wfMTmvfuannUcVZRAx3kx+KNiGF
 g/tB+pUk4IE9A==
Message-ID: <92bfa91cd85168cefd60d1029bcb19e4@kernel.org>
Date: Mon, 06 Jan 2025 12:56:54 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>
Subject: Re: [PATCH v6 5/8] drm: writeback: Create an helper for
 drm_writeback_connector initialization
In-Reply-To: <20241230-google-vkms-managed-v6-5-15c7d65cd63b@bootlin.com>
References: <20241230-google-vkms-managed-v6-5-15c7d65cd63b@bootlin.com>
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

On Mon, 30 Dec 2024 19:37:35 +0100, Louis Chauvet wrote:
> As the old drm and the new drmm variants of drm_writeback_connector
> requires almost the same initialization, create an internal helper to do
> most of the initialization work.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
