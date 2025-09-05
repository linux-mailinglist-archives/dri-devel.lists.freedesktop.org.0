Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33554B4619D
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 20:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EDCD10EC1D;
	Fri,  5 Sep 2025 18:02:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="g5UnQh6Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D0010EC1D
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 18:02:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 78BB14E40C74;
 Fri,  5 Sep 2025 18:02:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 396876060B;
 Fri,  5 Sep 2025 18:02:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 27AFE102F27E4; 
 Fri,  5 Sep 2025 20:02:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1757095339; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=MaeYscuMJCiRmlgwHZuKHQSm4n39zj+fX5GjAObjjc4=;
 b=g5UnQh6YJsy8b/GOYiaa9SQhKl5pfC8xDvXucBjOH9doLYeKt9Gc9/9qROEMxk7PBsxWJL
 Zd1lmmL9/J+LckIeJabA5jiYbbgs+Oip4VRDQ1ql9AmStt2MUpgJLjkXx7tZDbDesMKrW7
 hz/7NCfFWWSQb+6HYfVb5o0mbwfSVXnudj7CrAgaq+e3PKf1XcncYUvo93NRejMuQtNK/R
 RvUznSfomC2yYi+4VqDW20GBjSX1EDZjiLRRCpe1spADEgbVPtDYilW6ii0loXFY7SN/U3
 j1lB79nPJvd2Af9R0wIvnHnPb/9wlbd7gCPoYmeMH+gbvnh8el9PhpUF7tjAxw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250703-b4-new-color-formats-v7-0-15fd8fd2e15c@bootlin.com>
References: <20250703-b4-new-color-formats-v7-0-15fd8fd2e15c@bootlin.com>
Subject: Re: [PATCH v7 0/8] drm/vkms: Add support for multiple plane
 formats
Message-Id: <175709533293.1275590.10117645940954604570.b4-ty@bootlin.com>
Date: Fri, 05 Sep 2025 20:02:12 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
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


On Thu, 03 Jul 2025 09:56:56 +0200, Louis Chauvet wrote:
> @maíra: For the patch 6/8 I just removed the comment about yuv input
> size, is it good for you?
> 
> This series introduce a macro to generate a function to read simple
> formats. It avoid duplication of the same logic for similar formats.
> 
> In addition, it also introduce multiple "easy" formats (rgb888 variants)
> and also 16 bits yuv support (P01* formats).
> 
> [...]

Applied, thanks!

[1/8] drm/vkms: Create helpers macro to avoid code duplication in format callbacks
      commit: 544f161a88af0370ced87783246418aed63b619c
[2/8] drm/vkms: Add support for ARGB8888 formats
      commit: 985769b8b5c42666be91f5e60aeb93365c934b88
[3/8] drm/vkms: Add support for ARGB16161616 formats
      commit: bac5c590d42ce8a930950da716b7537e60153196
[4/8] drm/vkms: Add support for RGB565 formats
      commit: 39d80cee4207d937daf58179ae3c572bcf541f8a
[5/8] drm/vkms: Add support for RGB888 formats
      commit: 50c58f4f0562504256477ad153463d86500aa337
[6/8] drm/vkms: Change YUV helpers to support u16 inputs for conversion
      commit: 7766ae8de472be3e0167cf3652e6ae8d74ef0221
[7/8] drm/vkms: Create helper macro for YUV formats
      commit: 9e6600e9d3683cdf0196fde7439dba4c50946906
[8/8] drm/vkms: Add P01* formats
      commit: 9cd6b43a0f7fc0dfb779c73f4aeb4d3fe8820698

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

