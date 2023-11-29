Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E98E57FD3B2
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 11:13:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8638610E46B;
	Wed, 29 Nov 2023 10:13:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A693B10E45B
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 10:13:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 217F761583;
 Wed, 29 Nov 2023 10:13:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B439C433C8;
 Wed, 29 Nov 2023 10:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701252779;
 bh=q2xGuBe/5ZtaWEz1wA9oSCyNuPYE42N2DoH03gk6/gY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=YqtqYUD/JfGojXzIQTyJ9lhWdfjyhz/SJhgTJtf5/iozoBXPaaQPr6POy6Glgm1Hu
 5Z80l54woH7ByXaEvj6HeaMjpVOXsY4Hk2ckq7iRJrLEAeMkl3cDoz3T9j8uCBTx17
 1wnQh0pX9ncdfY9Fk1PSZvdMExv9w7YnivwHOaDJUecZJBpEr935Qi4NVPHOzG66Xm
 LhHVPqP5iqOO3R47smHvySOT/GhxsgfWP0RJeRJAhHUg5a5UNk0se/iLdVBHmcCI5g
 jCqS6yxF655mutzF6FkVl+lpxlV+t168rIeyYTsoipdGCUN6tUDclND9yGuZ5SLLns
 Dyw5HN3+CRwpg==
From: Robert Foss <rfoss@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Xin Ji <xji@analogixsemi.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Maxime Ripard <mripard@kernel.org>
In-Reply-To: <20231120091038.284825-1-xji@analogixsemi.com>
References: <20231120091038.284825-1-xji@analogixsemi.com>
Subject: Re: [PATCH 1/2] Revert "drm/bridge: Add 200ms delay to wait FW HPD
 status stable"
Message-Id: <170125277615.1206640.720870356698186996.b4-ty@kernel.org>
Date: Wed, 29 Nov 2023 11:12:56 +0100
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
Cc: qwen@analogixsemi.com, bliang@analogixsemi.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hsinyi@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 20 Nov 2023 17:10:36 +0800, Xin Ji wrote:
> This reverts commit 330140d7319fcc4ec68bd924ea212e476bf12275
> 
> 200ms delay will cause panel display image later than backlight
> turn on, revert this patch.
> 
> 

Applied, thanks!

[1/2] Revert "drm/bridge: Add 200ms delay to wait FW HPD status stable"
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=af3145aa142c
[2/2] drm/bridge: anx7625: Fix Set HPD irq detect window to 2ms
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=e3af7053de3f



Rob

