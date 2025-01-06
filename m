Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3944A02170
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 10:06:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9983D10E5E2;
	Mon,  6 Jan 2025 09:06:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MHLTA4rp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E824410E5E2
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 09:06:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AFCA55C5793;
 Mon,  6 Jan 2025 09:05:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD50C4CED2;
 Mon,  6 Jan 2025 09:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736154396;
 bh=zfJxYFu7LQfB03pjnodK58BJnpTHn4k8cqBauaYabDc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=MHLTA4rpG+yozxXY4GqE/PMbWw+ebqCni6syfFc0wgMa6QvSa4amCFH/v7ccrhYM7
 n0UgV6lbuNWph9WaLovmrimb6S+CHqdf1FcYT4DEnrP+op/+IZaRs2uY5DZxPVvwDq
 846x6stceEluJ87A3bvivygkFXani118OmDPU2pwLJdj5RWH7US8R7d16XqyrtpmT8
 cu7jw76wWK2TeVjrD1tq970Q8nMVE4jlcnFLnEmVqrdefGNZT3ycPTU9eNaA/jdgsL
 YVNMrNVGYgOvX/oXnw9gTUww9g/Oz1QNGfH0hlj2IBp3LNn6I0E8hfxs+liWvQwB6J
 NEOTHJyavrDTg==
From: Maxime Ripard <mripard@kernel.org>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250104-hdmi-state-display-mode-v1-1-3c06d36e726f@linaro.org>
References: <20250104-hdmi-state-display-mode-v1-1-3c06d36e726f@linaro.org>
Subject: Re: [PATCH] drm/display: hdmi-state-helper: add drm_display_mode
 declaration
Message-Id: <173615439409.361091.4171400364447727242.b4-ty@kernel.org>
Date: Mon, 06 Jan 2025 10:06:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Sat, 04 Jan 2025 09:58:28 +0200, Dmitry Baryshkov wrote:
> Add forward-declaration for the struct drm_display_mode, missed in the
> commit 47368ab437fd ("drm/display: hdmi: add generic mode_valid helper")
> 
> 

Applied to misc/kernel.git (drm-misc-next-fixes).

Thanks!
Maxime

