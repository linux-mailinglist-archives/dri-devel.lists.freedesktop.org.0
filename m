Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A6190E67E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 11:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B3A389D60;
	Wed, 19 Jun 2024 09:05:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jTXn6bH1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3215189D60
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 09:05:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5E5DF617DA;
 Wed, 19 Jun 2024 09:05:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5C2EC2BBFC;
 Wed, 19 Jun 2024 09:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718787938;
 bh=8MU08C6btNBdAUA6mmuRBDNnim8Od7tDLnTL8LAVCV4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jTXn6bH14ScjxxkW71yJ2Ojw2B7PA/c1CDwlHpm9g2iNY7Id4l1DSoaow7AHoV+Hf
 ZuhUq1d943YoPyrB2PjXtsmgdUWQiC6Rd4uhKfws/cTu7oG1Pt1Jngc6Rr7jpmCF/V
 5aaYba91r7KXOeUmD85ZeW6edtZIqQV9U86utYyYGoribE5O3VNoLFjFlQpTZZI8ZP
 FlkISBb6G6h4/tL9iW3hhQfVEapKFEkHV1HbbLs3ZgH0LupamcNr1VvUFW/MyEjRMO
 QmzeAfrMQFDEjFjaBBZbvRU9NTea5EtZ5Qk7ijNjM0qDCdfN1UhoW/aDYy32/ew4km
 wEriedwMdKguA==
From: Maxime Ripard <mripard@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Marc Gonzalez <mgonzalez@freebox.fr>
Cc: dri-devel@lists.freedesktop.org, Arnaud Vrac <avrac@freebox.fr>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240618-devm-simple-bridge-v1-1-c7ed8a09fcc5@freebox.fr>
References: <20240618-devm-simple-bridge-v1-1-c7ed8a09fcc5@freebox.fr>
Subject: Re: (subset) [PATCH] drm: bridge: simple-bridge: use
 devm_drm_bridge_add in probe
Message-Id: <171878793528.3410855.6572470582227223253.b4-ty@kernel.org>
Date: Wed, 19 Jun 2024 11:05:35 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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

On Tue, 18 Jun 2024 18:19:59 +0200, Marc Gonzalez wrote:
> simple_bridge_probe() calls drm_bridge_add()
> Thus, drm_bridge_remove() must be called in the remove() callback.
> 
> If we call devm_drm_bridge_add() instead, then drm_bridge_remove()
> will be called automatically at device release, and the remove()
> callback is no longer required.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime

