Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5289287C7
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 13:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 415FF10EAE7;
	Fri,  5 Jul 2024 11:21:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="J6g3jB8C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8680B10EAE7
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 11:21:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B0E6762BC8;
 Fri,  5 Jul 2024 11:21:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C646C116B1;
 Fri,  5 Jul 2024 11:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720178496;
 bh=bVClftXDHHpDPh0VgbjtXlcSOUs7zeo/ymJqBBRouoc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J6g3jB8CUu7UxGCAqoWW/gvFt7VmQEPVZYQzf2FVR2hY129dP5U+Po2e/lWHfN0XF
 GHH3Yy68eXYmugU8S5zjKHu32g16uaJRx2rpQsN7VYNGAPfXUSe0ekT6lshFGx71Zq
 wCa/tR1dPW5fGJYR/DJxjBUX2sXlMJlcLwCq6J/t6h+A4cIR+oGlWRywucvSnb9iRl
 hnCvA2IEc14+a7Housgm65fLGy82zhe3qEB3m7CaMZx2TPjU5sZIfftHyXKDpPFOYH
 TGiA14doF1vKxQqBBvXWBmlDGRI4Xc2l8QRaBxpAuYDQtHdgJpm8NuyDkl152y4Kqx
 D88dZhJrc7g6Q==
From: Maxime Ripard <mripard@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 1/4] drm/sti: dvo: drop driver owner assignment
Date: Fri,  5 Jul 2024 13:21:31 +0200
Message-ID: <172017848787.1096462.10024102415561558148.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240330203831.87003-1-krzysztof.kozlowski@linaro.org>
References: <20240330203831.87003-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Sat, 30 Mar 2024 21:38:28 +0100, Krzysztof Kozlowski wrote:
> Core in platform_driver_register() already sets the .owner, so driver
> does not need to.  Whatever is set here will be anyway overwritten by
> main driver calling platform_driver_register().
> 
> 

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
