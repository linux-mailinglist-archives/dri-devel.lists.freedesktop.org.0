Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6199A3BECE
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 13:53:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C5410E7E8;
	Wed, 19 Feb 2025 12:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HtiLZmhK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8797910E7DE;
 Wed, 19 Feb 2025 12:53:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2C78A5C3A70;
 Wed, 19 Feb 2025 12:53:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DF33C4CED1;
 Wed, 19 Feb 2025 12:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739969632;
 bh=o1vrbknKIaZg3v8eM8Gd3qfJuaEPRIedyoiJKVEUJBI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HtiLZmhKlr528J6r/FF0G8RYi7LKgIXhNe9vWG3+/5yZiJACZa7vf2F0zNPCtnky/
 C+ffLJ6OJAEElfxHvdsPNdJNUE0Cn6DNb35GsYQAZb2lFPmCEc4IZtpP7H4h/lhlCO
 5A/wrWjLRGcYFqrpwFxX1GtUw6FxsGCVg4fkUAyRAmsOy/jySNBAyIBjbqfHitN72W
 QD6NsoADotjMkUcgnmnlyCLgSZj//4BvoZVrBMmjBbbfhpZHI1L5n3p7LcAy3gAAgM
 drfauWiSI5bgzU28CA67TuzObyJXoDMFrfk1x8eGxGx7wBf0QuCxnPjIR/+KdpDdo2
 xa/gai+p4dHgw==
Date: Wed, 19 Feb 2025 13:53:47 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: webgeek1234@gmail.com
Cc: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/nouveau/pmu: Fix gp10b firmware guard
Message-ID: <Z7XUW6-wT-CXUMgT@polis>
References: <20250218-nouveau-gm10b-guard-v2-1-a4de71500d48@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218-nouveau-gm10b-guard-v2-1-a4de71500d48@gmail.com>
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

On Tue, Feb 18, 2025 at 03:28:03AM -0600, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> Most kernel configs enable multiple Tegra SoC generations, causing this
> typo to go unnoticed. But in the case where a kernel config is strictly
> for Tegra186, this is a problem.
> 
> Fixes: 989863d7cbe5 ("drm/nouveau/pmu: select implementation based on available firmware")
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>

Applied to drm-misc-fixes, thanks!
