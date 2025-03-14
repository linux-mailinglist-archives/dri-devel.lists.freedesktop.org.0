Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9025A612BA
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 14:33:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5864310E9EF;
	Fri, 14 Mar 2025 13:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="V7xhDzVO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA8B810E9EF
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 13:33:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 660375C4380;
 Fri, 14 Mar 2025 13:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88F46C4CEE3;
 Fri, 14 Mar 2025 13:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741959226;
 bh=loodNzrUi1U1/aKWFeUcg7+3ZF6ne7Dvoyl2XSrp6i4=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=V7xhDzVOqhy8xuG6nppZU7U3mCPKnBa5vHNF6X/Adc/djde5FnmcCnviMX8nv/Pam
 K/MR2imbb6+qixX1FQ1K6a/H/NClX6AadNd7aO48BRkFDSsIKzZvym0+gG1yjsoeoF
 6Qc3xAllcjFi3sKgX0s7sA+2wY7bbFF/D7inxrRTTb8qYFp4R1WuNZPFgO2cpgdYbV
 w72C1U7ploBr5IRT2NuBJKFYSFbj+dVPzOln6H5vJCvaQgLpnns2IGr+SQkqanFu4C
 ftbsMq+F/WC+QEHMXelKuwJgJxm8kxC72PRHfLcOTi9mNuNIsU/XeowotzJsV3TARv
 GPo9FQ5/pr87A==
Message-ID: <25f45ec5103eebdee9883a60f0af5fb6@kernel.org>
Date: Fri, 14 Mar 2025 13:33:44 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "David Turner" <david.turner@raspberrypi.com>
Subject: Re: [PATCH v3 2/2] drm/vc4: hdmi: Add jack detection to HDMI audio
 driver
In-Reply-To: <20250312-vc4_hotplug-v3-2-d75878677de8@raspberrypi.com>
References: <20250312-vc4_hotplug-v3-2-d75878677de8@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Stefan
 Wahren" <wahrenst@gmx.net>, "Thomas Zimmermann" <tzimmermann@suse.de>
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

On Wed, 12 Mar 2025 15:40:56 +0000, David Turner wrote:
> Add ALSA jack detection to the vc4-hdmi audio driver so userspace knows
> when to add/remove HDMI audio devices.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> Signed-off-by: David Turner <david.turner@raspberrypi.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
