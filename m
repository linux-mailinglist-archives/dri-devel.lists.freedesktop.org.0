Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21032BAC628
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 12:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A5810E54A;
	Tue, 30 Sep 2025 10:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ee+fgcGg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98EF610E29C
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 10:01:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5F05945506;
 Tue, 30 Sep 2025 10:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBC6BC4CEF0;
 Tue, 30 Sep 2025 10:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759226464;
 bh=ISIrSqaNDbfd3r0u3Hqm2C5e4s07Bqky03AjaymtYuA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ee+fgcGgzhxJYAPi5iv/fe/sRQX4f8vuof9s4V9o6U2urEMRhN4/kJVpvKOournsw
 VPbnNfQ8mHNJVarxGzHP3aFEf9ROIONFn+9FLgMRfUHxoARluaskP0pUpOKeLLvh0K
 DpjKjBd7kkUEUdlZf4k3RzjbhLSx4Xvg9+ftu3CA9o+B3hyxHgxbCSMPuBmb7EzFM4
 dbywbmuTYDIOcaxBXNN7JL2SlgyPm1HZR1kIMoufyQDR1dXLvMp3Z38ZRpJnxk+QwY
 Q4nrbnMrkXpVRRL/y9wvTwL+zzoE4NfCtNQ0v4cYiGAbYoOnHWjrL2cIU0mKKVGjKq
 Fgg/sLDu+oB3w==
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
Subject: Re: (subset) [PATCH 19/29] drm/tidss: Remove ftrace-like logs
Date: Tue, 30 Sep 2025 12:00:48 +0200
Message-ID: <175922644628.1134117.18223999280547569910.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250902-drm-state-readout-v1-19-14ad5315da3f@kernel.org>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <20250902-drm-state-readout-v1-19-14ad5315da3f@kernel.org>
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

On Tue, 02 Sep 2025 10:32:47 +0200, Maxime Ripard wrote:
> These logs don't really log any information and create checkpatch
> warnings. Remove them.
> 
> 

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
