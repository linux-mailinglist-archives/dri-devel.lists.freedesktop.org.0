Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5C2B9782C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 22:40:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0CC110E094;
	Tue, 23 Sep 2025 20:40:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="mdkHlAIj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F2A510E094
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 20:40:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 91F1F4E40CB9;
 Tue, 23 Sep 2025 20:40:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4D87260690;
 Tue, 23 Sep 2025 20:40:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8B5E8102F18CD; 
 Tue, 23 Sep 2025 22:39:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1758660015; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=qeyUwc/beOs4EzAIFpBkfpET30cy18dsLsFqrVOyb6s=;
 b=mdkHlAIj2Gkm6+cx0OP7HbjeimBPfrpI0jEeBWvda719ObioAUGUentg+v0Inwa200ckRo
 niILT7wj3Ys/14+wjf+9t+LfjFnucbGVM26hkomz+aOhcfPc0jm1wtxbidjHn3ArsaNGL0
 xSYmtWu/u3CbgzKnFvEGNxxhZjwaueLRLlh0tr4T0ZMT/fcuGHjljm/M9VuzTN0VrMwN6J
 uiSEkOZPISB8Xl+q33HPZzhh7Ab9DS+RUEiHIY9sg33tMoub6Z9168RC4t3GwVjlaC1oQE
 of1HdqOUM9jIsbHLOPoP2alwxTrtNXQQLfrI0+gAeAjK9s8GD7EFoGceqhENAw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <lumag@kernel.org>
In-Reply-To: <20250915-drm-bridge-debugfs-removed-v9-0-6e5c0aff5de9@bootlin.com>
References: <20250915-drm-bridge-debugfs-removed-v9-0-6e5c0aff5de9@bootlin.com>
Subject: Re: [PATCH v9 0/3] drm/bridge: debugfs: show refcount and list
 removed bridges
Message-Id: <175865999985.903984.7339834418819121005.b4-ty@bootlin.com>
Date: Tue, 23 Sep 2025 22:39:59 +0200
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


On Mon, 15 Sep 2025 12:12:45 +0200, Luca Ceresoli wrote:
> This series shows removed bridges to the global <debugfs>/dri/bridges file.
> Removed bridges are bridges after drm_bridges_remove() but before they are
> eventually freed on the last drm_bridge_put().
> 
> This is part of the work towards removal of bridges from a still existing
> DRM pipeline without use-after-free. The grand plan was discussed in [1].
> Here's the work breakdown (➜ marks the current series):
> 
> [...]

Applied, thanks!

[1/3] drm/bridge: add list of removed refcounted bridges
      commit: 17805a15d1751f5d6bb06f924f9bed216feb8db7
[2/3] drm/debugfs: show lingering bridges
      commit: 27312a8f24419b5fe544e30f75d692492790304c
[3/3] drm/bridge: adapt drm_bridge_add/remove() docs, mention the lingering list
      commit: 90315cd293f321ada7bbd43a59636716e102d68a

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

