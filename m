Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F85BAC62D
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 12:01:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7722010E54B;
	Tue, 30 Sep 2025 10:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mHynn5kC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C34510E55E
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 10:01:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 62B406046D;
 Tue, 30 Sep 2025 10:01:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0039C4CEF7;
 Tue, 30 Sep 2025 10:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759226461;
 bh=GOUfO1dCK/iE0xHQiO3vE+fUV6cDrDXNClGxmyxUo+c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mHynn5kC8oPoDpnKl2NtNj5hx+l+haQFcISW+FjaTCjuuTNLa/2JnH4t5I+IdrmBE
 bvKTQGkoI6tFMwcKyxxU4XPLlwYO8z3/ogt3SUr9i1PscmwWnpKMaJVqks7Rtnx9Ua
 PcrDWEiLHfFPvM/S0gpXN3Mt6rZj5GRskomFr60z/YZcyaagk5jVkn+ww8xF/RerSa
 1JAo3KUG3tXAl9H/1ZsVG1t9nWdPpgX50eUrMHI4Ywt2zoHFsWnk4WqLq+au8iqEKt
 Qnh/tMMAfZ32+zAR3822CUDQssLxGOnj81rEDj66OazICkbO4ZsfZLmu/EfhjPYJlk
 KGYjmzLZ8gQXw==
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
Subject: Re: (subset) [PATCH 18/29] drm/tidss: Convert to drm logging
Date: Tue, 30 Sep 2025 12:00:47 +0200
Message-ID: <175922644628.1134117.4851349246950865623.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250902-drm-state-readout-v1-18-14ad5315da3f@kernel.org>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <20250902-drm-state-readout-v1-18-14ad5315da3f@kernel.org>
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

On Tue, 02 Sep 2025 10:32:46 +0200, Maxime Ripard wrote:
> DRM drivers should prefer the drm logging functions to the dev logging
> ones when possible. Let's convert the existing dev_* logs to their drm
> counterparts.
> 
> 

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
