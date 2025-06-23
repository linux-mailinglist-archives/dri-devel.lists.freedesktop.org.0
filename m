Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51141AE3813
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 10:14:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B63FA10E1C5;
	Mon, 23 Jun 2025 08:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YeCLmTkJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC6310E1C7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 08:14:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41C5B43424;
 Mon, 23 Jun 2025 08:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1750666485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zEkVeHe6fV8P3rJb5CgRudPEfC2hTGoF5KMLEQlsPbA=;
 b=YeCLmTkJ008L+TWFSC+F/JUG6ntqtAaKrgWOEqg3cAYdtnVr5hYxexOHJp0y+4ykW5NEDC
 44S9Aes2No7rqgB/IskaRWrvr99768ss7eqln69qp90+8Ga+ELyyDp7OpVF3QPmRn4O67V
 giVpvTOjiuxoPsJiviVcSQc0DfqnLgXtdP9GeKkVgXt8sgbzuH67IlH9oV1BuJv2rURYEl
 M0p5WmIHrcoXpO8ZuxfVVuNfTqghD/DHEWIUABj3+TAZEFDld6BxRFWXA1AJ9LZ1bbWWVI
 +vGNXHivPJKnok9bdEd2p9vIml+DF/ZV7UcsNfM4LbBBMij6eeD3sym9KiUGzQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Mark Yacoub <markyacoub@google.com>
In-Reply-To: <20250429-drm-fix-writeback-cleanup-v2-1-548ff3a4e284@bootlin.com>
References: <20250429-drm-fix-writeback-cleanup-v2-1-548ff3a4e284@bootlin.com>
Subject: Re: [PATCH v2] drm: writeback: Fix drm_writeback_connector_cleanup
 signature
Message-Id: <175066648416.11752.3954585801446289594.b4-ty@bootlin.com>
Date: Mon, 23 Jun 2025 10:14:44 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduieehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjeehieelvdekieegledutdeljedvhfelfeelffffiedttedvledttddttdfgleetnecukfhppedujeeirdduheelrddvtddurdehieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeeirdduheelrddvtddurdehiedphhgvlhhopefjohhsthdqtddtfedrlhgrnhdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepmhgrrghrt
 hgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrghrkhihrggtohhusgesghhoohhglhgvrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvg
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


On Tue, 29 Apr 2025 10:36:23 +0200, Louis Chauvet wrote:
> The drm_writeback_connector_cleanup have the signature:
> 
>      static void drm_writeback_connector_cleanup(
> 		struct drm_device *dev,
> 		struct drm_writeback_connector *wb_connector)
> 
> But it is stored and used as a drmres_release_t
> 
> [...]

Applied, thanks!

[1/1] drm: writeback: Fix drm_writeback_connector_cleanup signature
      commit: fb721b2c35b1829b8ecf62e3adb41cf30260316a

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

