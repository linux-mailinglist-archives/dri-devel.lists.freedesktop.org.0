Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E147A1CCAA
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 17:33:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A18C10E091;
	Sun, 26 Jan 2025 16:33:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="LwhHDw74";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 315 seconds by postgrey-1.36 at gabe;
 Sun, 26 Jan 2025 16:33:44 UTC
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED0AC10E091
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 16:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1737908907;
 bh=YMNOtfXRHqQdVvk11GYm4yQXjj+3NcjgEEgDiKYLnYA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LwhHDw7463BsJ47z8j496K0QJxJsX+5T3NyWQxZCHRk7uNGsV8IpIbBAZHpz57ypq
 +GUVQfdyzhLNiB+SlzN+NkTbeZ4cGzBMlaJGfdYpwUZlea+knAtRGJeXetXzWF2BGH
 zAgRWcS7z3LTKGzlzMBXnylAXjFLtjO0ITy2QV9o=
Date: Sun, 26 Jan 2025 17:28:27 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 "Dustin L . Howett" <dustin@howett.net>,
 Mario Limonciello <mario.limonciello@amd.com>, 
 Harry Wentland <harry.wentland@amd.com>, airlied@gmail.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 corbet@lwn.net, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 6.12 02/31] drm: Add panel backlight quirks
Message-ID: <93a9e956-9572-410e-947c-36aeba4965bf@t-8ch.de>
References: <20250126145448.930220-1-sashal@kernel.org>
 <20250126145448.930220-2-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250126145448.930220-2-sashal@kernel.org>
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

Hi Sasha,

On 2025-01-26 09:54:18-0500, Sasha Levin wrote:
> From: Thomas Weißschuh <linux@weissschuh.net>
> 
> [ Upstream commit 22e5c7ae12145af13785e3ff138395d5b1a22116 ]
> 
> Panels using a PWM-controlled backlight source do not have a standard
> way to communicate their valid PWM ranges.
> On x86 the ranges are read from ACPI through driver-specific tables.
> The built-in ranges are not necessarily correct, or may grow stale if an
> older device can be retrofitted with newer panels.
> 
> Add a quirk infrastructure with which the minimum valid backlight value
> can be maintained as part of the kernel.

This series [0] has been applied to the 6.12 and 6.13 stable trees.
However it is introducing new functionality and not fixing any bug.
Furthermore, for 6.12 the patch for drm/amd/display enabling the new
functionality was not even applied, making all of it dead code.

[0] https://lore.kernel.org/lkml/20241111-amdgpu-min-backlight-quirk-v7-0-f662851fda69@weissschuh.net/

	Patches:
	drm: Add panel backlight quirks
	drm/amd/display: Add support for minimum backlight quirk
	drm: panel-backlight-quirks: Add Framework 13 matte panel
	drm: panel-backlight-quirks: Add Framework 13 glossy and 2.8k panels


Regards,
Thomas
