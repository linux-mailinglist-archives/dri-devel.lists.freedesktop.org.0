Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AD2BAC621
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 12:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A39C10E557;
	Tue, 30 Sep 2025 10:00:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gRtqJTjY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F0A10E565
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 10:00:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4DFBB44FF6;
 Tue, 30 Sep 2025 10:00:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4D3FC4CEF7;
 Tue, 30 Sep 2025 10:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759226458;
 bh=XAMMYSM23s4Sr91qvcwkHuDHPtXh8HsK9x4B/pBQNpg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gRtqJTjYABiPmKSJb+M9LybHdvqyKz4VWsHjkwkgDyndzvHWnHMm2QEq86bnzlv23
 Wu8/TNhfVNdVpMX5RuCpNbx74c/0xY9GeixDoK1wqDdGcfTB5oRmd9u75g2FzA39Ln
 4XprkrtMzmaRv3gVrDyN6vGqBCdkWxz4ies5b05mEH/vv8GeoFvzyOT2Eihi8F/ocf
 BaKHXiM8HMM5Oia0DrD4ZJVhHqWIxKgAWz3IzJUSUERpFIZl+jRHll+cf/mUhhbKmO
 653nyeZnc1TAv5SpX8HxoKt/pGweQFZ2NJfaOga8d1pdjuzkqX8DzIurpQT0+eunIy
 AjsYEaWkBPX8A==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 11/29] drm/crtc: Drop no_vblank bit field
Date: Tue, 30 Sep 2025 12:00:46 +0200
Message-ID: <175922644628.1134117.18066652502091926762.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250902-drm-state-readout-v1-11-14ad5315da3f@kernel.org>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <20250902-drm-state-readout-v1-11-14ad5315da3f@kernel.org>
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

On Tue, 02 Sep 2025 10:32:39 +0200, Maxime Ripard wrote:
> The no_vblank field in drm_crtc_state is defined as a bit-field with a
> single bit.
> 
> This will create a syntax issue with the macros we'll introduce next,
> and most other booleans but the *_changed ones in drm_crtc_state do not
> use a bit field anyway.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
