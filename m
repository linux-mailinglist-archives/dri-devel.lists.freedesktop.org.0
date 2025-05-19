Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FB2ABB77A
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 10:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5811A10E227;
	Mon, 19 May 2025 08:40:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X4YIcMTb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F8A410E227
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 08:40:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7667F40BDE;
 Mon, 19 May 2025 08:40:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 046C1C4CEED;
 Mon, 19 May 2025 08:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747644041;
 bh=rPOc4Bft5rRhKxCkLHq9mBdyIs9V3hmodAMn3Tb++2c=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=X4YIcMTbloLlAe/KN7RJ7bnGvjuYxZm6DylStXWQkYmxiCAvjIsb1Qn6wo1y1Bp42
 ZBQ7Y3wbFc2ABpU9JfIyTZIE4DFWpBdqvD/gkCAKuTOWf/CZzTI5WMxhlfZc/0TfdZ
 ldewday9tTzVelEHBwePLvRpLhF3vFnKjLA9obphGjDMQPkn3rG63GplhH9PLvqrGx
 dVH9zusCDejRfWrOvvPdbUL36Nh2X4gI6xuO5Jxq9R9qsuABHV5kSuP2uG1YAhZVx2
 7kwts8uLlsrYPW/pVGmO4JwF9MIONq23bvVYazWv/JAT/lKAVDmZAhgd35kL2DHqVv
 D5t3QJynVp5Dw==
Message-ID: <b80e4b6d963e65584661f38fcb0a1781@kernel.org>
Date: Mon, 19 May 2025 08:40:38 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v4 21/23] drm/tests: hdmi: Add max TMDS rate fallback
 tests for YUV420 mode
In-Reply-To: <20250425-hdmi-conn-yuv-v4-21-5e55e2aaa3fa@collabora.com>
References: <20250425-hdmi-conn-yuv-v4-21-5e55e2aaa3fa@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 "Dmitry Baryshkov" <lumag@kernel.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
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

On Fri, 25 Apr 2025 13:27:12 +0300, Cristian Ciocaltea wrote:
> Provide tests to verify drm_atomic_helper_connector_hdmi_check() helper
> fallback behavior when using YUV420 output format.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
