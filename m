Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF68AD93AB
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 19:19:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E747610E05F;
	Fri, 13 Jun 2025 17:18:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="p0B1pUFu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E958510E05F
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 17:18:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B19A743D47;
 Fri, 13 Jun 2025 17:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1749835132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=95Ug4EknnTlQj4V97Fk/YV2fqDZIIaIXbYksG4euUZE=;
 b=p0B1pUFunakm5g+liFy6dA1/a6AsFBXKKneb7GD6BCe/p5noMpejmOhNNvoP80PW782NlP
 NKwTVT8Ttvd4J3bMwPcOoGP9aNNMI8SA0rqksEXeqTqT+fOaFIoSbhJbJaoJ2MTHKOmGMg
 7sF7LtExqWtoE8jLS7ZPuPQND8FIAhQUsyn0zzzt56w3YCOm30IbCGiLFzJRRg+wtJa+jh
 DtOf3cnX3gHGl4gtknAzj2ettrmTH+Dikp94QI+V84BM1WsfHGgvkg8RHLtnr1ODw/zs4c
 fTL6b1CfhY+dsbN2kM4lo03/aLHLONU9WdF0p3+1SKntMLKbxt4ENwuA+o63tg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>, 
 Arthur Grillo <arthurgrillo@riseup.net>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
In-Reply-To: <20250611205704.334527-1-mcanal@igalia.com>
References: <20250611205704.334527-1-mcanal@igalia.com>
Subject: Re: [PATCH] drm/vkms: Compile all tests with
 CONFIG_DRM_VKMS_KUNIT_TEST
Message-Id: <174983513138.20693.9825408380443789589.b4-ty@bootlin.com>
Date: Fri, 13 Jun 2025 19:18:51 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtkeertdertdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkefgtedvvdfgueejveevffelheffueduhfdvtdetgfdvueekuedvgfduueeffedtnecukfhppedvtddtudemkeeiudemgedugedtmegtkeeitdemhegstgeimeelkeelkeemugefgedvmeegfehftdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemgedugedtmegtkeeitdemhegstgeimeelkeelkeemugefgedvmeegfehftddphhgvlhhopehlohhuihhsqdhptgdrlhgrnhdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeelpdhrtghpthhtohephhgrmhhohhgrmhhmvggurdhsrgesghhmrghilhdrtghomhdprhgtphhtthhopehkvghrnhgvlhdquggvvhesihhgrghlihgrrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehjohhsvgdrvgigp
 hhoshhithhokeelsehgmhgrihhlrdgtohhmpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopegrrhhthhhurhhgrhhilhhlohesrhhishgvuhhprdhnvghtpdhrtghpthhtohepmhgvlhhishhsrgdrshhrfiesghhmrghilhdrtghomhdprhgtphhtthhopehmtggrnhgrlhesihhgrghlihgrrdgtohhm
X-GND-Sasl: louis.chauvet@bootlin.com
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


On Wed, 11 Jun 2025 17:56:49 -0300, Maíra Canal wrote:
> The Kconfig option `CONFIG_DRM_VKMS_KUNIT_TESTS` does not exist. However,
> the VKMS format tests use such an option for compilation, meaning that
> they are not compiled at all.
> 
> Use the Kconfig option `CONFIG_DRM_VKMS_KUNIT_TEST` to compile all VKMS
> KUnit tests.
> 
> [...]

Applied, thanks!

[1/1] drm/vkms: Compile all tests with CONFIG_DRM_VKMS_KUNIT_TEST
      commit: 60ba94338047bb5410a3626ced3380afe9285ed8

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

