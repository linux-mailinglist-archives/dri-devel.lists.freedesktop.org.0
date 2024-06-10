Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C355902400
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 16:24:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC5510E4AF;
	Mon, 10 Jun 2024 14:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hcp2+aYy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D11AC10E493
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 14:24:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9D126CE0E99;
 Mon, 10 Jun 2024 14:24:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5DFBC2BBFC;
 Mon, 10 Jun 2024 14:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718029465;
 bh=EmoanyqzkLzeidl0Hqh1se88HluGsRulk6FgLKMEwqk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=hcp2+aYyuuJgY2YGR9KAK5y3K2XZUR1/C8IokDAMqKA3+8kiHQ9gJkQELhmi1Qpt1
 nWvsnEU+LXZ+zOmjCuYgEcsrlDbRxv1Gvqp0oMrDSSOfgsD9DOoI+Ngcvm8bjJo5xZ
 9cK9cV5Q98FfhcBIsDxxA6MNvd7i1Fsf+GmdZwWLdz95ViY39s4Y4Q3LmnDzg8L+j4
 EFz3wO7h6qs1iZAtHFfzVnr3qihoolhX1iy+/3Dnfb4zZkJnDexvSHC9Oc0s6R4x19
 kAPuJjlZPHTVZkGrm/fWByhT/qkyYj31bzYi9c3SINh3tGGApfBQzwzEjwN8hitIB+
 e7Aizm3Bs5YUQ==
From: Robert Foss <rfoss@kernel.org>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 kernel@dh-electronics.com, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Lucas Stach <l.stach@pengutronix.de>
In-Reply-To: <20240531203333.277476-1-marex@denx.de>
References: <20240531203333.277476-1-marex@denx.de>
Subject: Re: [PATCH] drm/bridge: tc358767: Check if fully initialized before
 signalling HPD event via IRQ
Message-Id: <171802946262.459488.13972429951209606683.b4-ty@kernel.org>
Date: Mon, 10 Jun 2024 16:24:22 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
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

On Fri, 31 May 2024 22:33:12 +0200, Marek Vasut wrote:
> Make sure the connector is fully initialized before signalling any
> HPD events via drm_kms_helper_hotplug_event(), otherwise this may
> lead to NULL pointer dereference.
> 
> 

Applied, thanks!

[1/1] drm/bridge: tc358767: Check if fully initialized before signalling HPD event via IRQ
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=162e48cb1d84



Rob

