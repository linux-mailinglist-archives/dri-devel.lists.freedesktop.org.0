Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 189D786751F
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 13:37:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A6010E725;
	Mon, 26 Feb 2024 12:37:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Rrtf6cWf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E41D10E725
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 12:37:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D3BB1CE1255;
 Mon, 26 Feb 2024 12:37:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A191FC433C7;
 Mon, 26 Feb 2024 12:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708951023;
 bh=C9wDLH2L3ZzqzgRX457oLJnRJRQz7/LALjQE5a3K4N8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Rrtf6cWf0gKZwmDtVigfxSVNlfgBRuVal4w4nvByIQESKz+WMdcIlBSViAfZdIqW2
 FdE9URDCVVVfW4ozRxKMv3Fx9aHGHNj6dC39O9cuOXt1qU2rZs/GN+lampxwrDWiY4
 Znx8yFayk2N4fDzbRIvTPCuQ4dqkzGl9wudKKuhBVcsejnJvNeFbYolV1aj14M8yzV
 e1yB1DbWOyHS8+pev3avHpK2zg1UOLhRkNyGLD6yWyX8VlHWDCdSKqaeVvVmhBtJMs
 XS+1MPgEi4ep2/YErAtqW3OCUfXAnglQmfVNgp7c1C/fiEVtn/4V1LcFwfHxjOzCEf
 X59kC5MuTioLw==
From: Robert Foss <rfoss@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>,
 Javier Martinez Canillas <javierm@redhat.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
In-Reply-To: <20240223150333.1401582-1-thierry.reding@gmail.com>
References: <20240223150333.1401582-1-thierry.reding@gmail.com>
Subject: Re: [PATCH v2] drm/tegra: Remove existing framebuffer only if we
 support display
Message-Id: <170895102136.3360807.8311118581236515605.b4-ty@kernel.org>
Date: Mon, 26 Feb 2024 13:37:01 +0100
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

On Fri, 23 Feb 2024 16:03:33 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Tegra DRM doesn't support display on Tegra234 and later, so make sure
> not to remove any existing framebuffers in that case.
> 
> v2: - add comments explaining how this situation can come about
>     - clear DRIVER_MODESET and DRIVER_ATOMIC feature bits
> 
> [...]

Applied, thanks!

[1/1] drm/tegra: Remove existing framebuffer only if we support display
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=86bf8cfda6d2



Rob

