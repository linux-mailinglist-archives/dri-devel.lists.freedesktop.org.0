Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3850F9AE9C7
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 17:06:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C20B10E959;
	Thu, 24 Oct 2024 15:06:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="G2B8GiT0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ADB810E959
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 15:06:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id F1A0FA45430;
 Thu, 24 Oct 2024 15:05:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4830FC4CEC7;
 Thu, 24 Oct 2024 15:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729782361;
 bh=Ih493C7FW7huTj70GvMdQCxCv0/8gBvIIgko/BVBESQ=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=G2B8GiT06sGhvAw8upxtM0+4xoxyH2VU5Fs2aV8Al5mf91nP+UD9BCyr8wxtcM8wq
 VCmJN7wdKuj8FdYcDhTFEDpfx1uK0I+897Y5r1LBrarAwoUlKOQB3lAFScFx7ZstWn
 xU2HUvAs/GrFlF1cSAweX7XZ59QcWpNVQfXYA4oXTgzef1RaSzz6mDI/hD52/ki9wj
 Xdi7WTeDIG39ORLQJRsHowGLTWUbFsECRnBcbU91mbvXGGVWvbHiRTKwaDpeYqYr6y
 wAgdjvcRVdhrByzczYohXrfkDIrIv/Yp6HRW+4LMMc3xc1gc8PJCyMYY9kS1Dfnox8
 qH0T0lJDW9jTw==
Message-ID: <35fc492aa7d6298eba531d08e9fccfa4@kernel.org>
Date: Thu, 24 Oct 2024 15:05:59 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 23/37] drm/vc4: drv: Add support for 2712 D-step
In-Reply-To: <20241023-drm-vc4-2712-support-v1-23-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-23-1cc2d5594907@raspberrypi.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, "Broadcom
 internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>, "Catalin
 Marinas" <catalin.marinas@arm.com>, "Conor Dooley" <conor+dt@kernel.org>,
 "David
 Airlie" <airlied@gmail.com>, "Florian Fainelli" <florian.fainelli@broadcom.com>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, 
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 "Michael Turquette" <mturquette@baylibre.com>, "Raspberry
 Pi Kernel Maintenance" <kernel-list@raspberrypi.com>,
 "Ray Jui" <rjui@broadcom.com>, "Rob
 Herring" <robh@kernel.org>, "Scott Branden" <sbranden@broadcom.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Stephen Boyd" <sboyd@kernel.org>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "Will Deacon" <will@kernel.org>
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

On Wed, 23 Oct 2024 17:50:20 +0100, Dave Stevenson wrote:
> Add in the compatible string and VC4_GEN_ enum for the D-step
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
