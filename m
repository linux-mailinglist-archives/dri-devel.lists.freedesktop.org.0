Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2601DBAC630
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 12:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 903B010E54C;
	Tue, 30 Sep 2025 10:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oGgZ//X0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A194810E54B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 10:01:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 876E245779;
 Tue, 30 Sep 2025 10:01:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A04FC4CEF0;
 Tue, 30 Sep 2025 10:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759226470;
 bh=y05Kz2gaTyYjB9whqH52OCf8XRzeXuk3uaiIvAlC1+E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oGgZ//X0JaFXfSHw2fnz0fIWtNfOu64jPTwQ5wkp0zhLLH/etqILUXyFh+rlacsEL
 p+6xGOTdZEu0dnrTBDCpucfPWu/ya+gm4JSblyBipfHWwLHQAWWEeF2+rmuQwonPlT
 GzH8q6qKib7Jyhg73bL6+IF7CMeIJ4vvUSZ4hw8a/O8gV0C6z9aAtcRUXHIzfCn5+N
 rnoc7ZGgK5ET1mGiUDuDQONaFziH2ODa0uYw3bp5cCX7ytVzBbE7G6YgQ/44dU0Ofz
 j3bkHMqOvvNrmpAHmTEjDR9WLQ3LSbOv8FqI7GTEsLh3dM1rleJr2qzTM+UHhaLqyp
 UIH20r01WoeAw==
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
Subject: Re: (subset) [PATCH 21/29] drm/tidss: crtc: Implement destroy_state
Date: Tue, 30 Sep 2025 12:00:50 +0200
Message-ID: <175922644629.1134117.16089467685149980976.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250902-drm-state-readout-v1-21-14ad5315da3f@kernel.org>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <20250902-drm-state-readout-v1-21-14ad5315da3f@kernel.org>
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

On Tue, 02 Sep 2025 10:32:49 +0200, Maxime Ripard wrote:
> The tidss crtc driver implements its own state, with its own
> implementation of reset and duplicate_state, but uses the default
> destroy_state helper.
> 
> This somewhat works for now because the drm_crtc_state field in
> tidss_crtc_state is the first field so the offset is 0, but it's pretty
> fragile and it should really have its own destroy_state implementation.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
