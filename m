Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD85A55FA8
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 05:56:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0979210EAB6;
	Fri,  7 Mar 2025 04:56:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JZwN7fCw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5376E10EAB0;
 Fri,  7 Mar 2025 04:56:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C821BA4542F;
 Fri,  7 Mar 2025 04:50:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8380CC4CEE2;
 Fri,  7 Mar 2025 04:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741323368;
 bh=/FTvvO/mtnQkcgcKCJW0J9mjF0skEwBxbmqqFY+cVNA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JZwN7fCwz5L/P/DNiQHydvcpKWVS+HeafEzi8JklRXunsJEvT0NSmskXhAMaNdhjA
 o2lZ/QZwveT+MUikfpU9U90gcRvy09M4NZa74GeMyHGZWak56oytQ4CCwaOhqR97tY
 JDw+iPDMAoerXn19vGrnst22qBVBGieAT0tKzmF8vViSTx6yextxlYZt3cVw3tiZpZ
 Sb9vOyDfDn2AoY8WGTJJZ01iotuWIJoF8R1SHmNBJxu5AiHg7JpszlLCu3jjnJXbYp
 7oZml8KhgxvIaMua4T13QC8AxQ7CNQEC7lkksqTqGNuorB3c9CHHEAGMmwxtRus+MT
 ZjtZ4N9PCVpdQ==
From: Dmitry Baryshkov <lumag@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH v5 0/8] drm/msm/dpu: rework debugfs interface of
 dpu_core_perf
Date: Fri,  7 Mar 2025 06:55:48 +0200
Message-Id: <174132327773.1133698.11593954673620366457.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250209-dpu-perf-rework-v5-0-87e936cf3004@linaro.org>
References: <20250209-dpu-perf-rework-v5-0-87e936cf3004@linaro.org>
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


On Sun, 09 Feb 2025 05:21:10 +0200, Dmitry Baryshkov wrote:
> Bring back a set of patches extracted from [1] per Abhinav's suggestion.
> 
> Rework debugging overrides for the bandwidth and clock settings. Instead
> of specifying the 'mode' and some values, allow one to set the affected
> value directly.
> 
> [1] https://patchwork.freedesktop.org/series/119552/#rev2
> 
> [...]

Applied, thanks!

[1/8] drm/msm/dpu: extract bandwidth aggregation function
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b9aedd32a817
[2/8] drm/msm/dpu: remove duplicate code calculating sum of bandwidths
      https://gitlab.freedesktop.org/lumag/msm/-/commit/795aef6f3653
[3/8] drm/msm/dpu: change ib values to u32
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c54b61102f46
[4/8] drm/msm/dpu: make fix_core_ab_vote consistent with fix_core_ib_vote
      https://gitlab.freedesktop.org/lumag/msm/-/commit/879a7f8c8c2d
[5/8] drm/msm/dpu: also use KBps for bw_ctl output
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f6c782ea7de5
[6/8] drm/msm/dpu: rename average bandwidth-related debugfs files
      https://gitlab.freedesktop.org/lumag/msm/-/commit/40fc01273f07
[7/8] drm/msm/dpu: drop core_clk_rate overrides from _dpu_core_perf_calc_crtc
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e7e2495595e0
[8/8] drm/msm/dpu: handle perf mode in _dpu_core_perf_crtc_update_bus()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6d3175a72cc0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
