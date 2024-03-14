Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C1D87BCF8
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 13:47:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AFDB10E30B;
	Thu, 14 Mar 2024 12:47:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TKCb0yvc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3354810E30B
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 12:47:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 49FA26162F;
 Thu, 14 Mar 2024 12:46:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A28FFC433F1;
 Thu, 14 Mar 2024 12:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710420419;
 bh=a6XdrlNXWJCDQ9vES9Lv21vpHPHERaLALNK2+jasek8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=TKCb0yvc6tLGPIdHhsnKxkZBV0TX/bM35rhw/U6anavuT8o8JZ0Ykl/BetlldDbD+
 GWYb8JZEBq7O1+76rYpkHpkt+TBRbM9ZwNYAQ3ipQzFIAi0Aj2i78s9QOpbijSMEgg
 EFqz6NHm+Sf2/+sBJVTFlivGcaORcGgm+AXB9vGXmXsu44IKg62eF4yVsZTXwKhgWn
 nVkad8DptuxkrgBfzpv6jn1EKHg3+jGUuEfx2ZwlBeh6gwuL4oLpjsVzNhggD5GJqv
 mkkgiWcgjLx11HBdXcsstDNYq+nPrzhiz244F6V1jRCczKHhr8TX0jJWKQ61oBd31x
 tVzE1usPHdf6Q==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Naresh Kamboju <naresh.kamboju@linaro.org>, 
 kernel test robot <lkp@intel.com>
In-Reply-To: <20240304091225.366325-1-mripard@kernel.org>
References: <20240304091225.366325-1-mripard@kernel.org>
Subject: Re: [PATCH] drm/sun4i: hdmi: Fix u64 div on 32bit arch
Message-Id: <171042041607.45853.8498801585033498161.b4-ty@kernel.org>
Date: Thu, 14 Mar 2024 13:46:56 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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

On Mon, 04 Mar 2024 10:12:25 +0100, Maxime Ripard wrote:
> Commit 358e76fd613a ("drm/sun4i: hdmi: Consolidate atomic_check and
> mode_valid") changed the clock rate from an unsigned long to an unsigned
> long long resulting in a a 64-bit division that might not be supported
> on all platforms.
> 
> The resulted in compilation being broken at least for m68k, xtensa and
> some arm configurations, at least.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next-fixes).

Thanks!
Maxime

