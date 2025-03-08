Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE88CA578A5
	for <lists+dri-devel@lfdr.de>; Sat,  8 Mar 2025 06:43:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2822B10E208;
	Sat,  8 Mar 2025 05:43:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qdOF2JqA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C5E10E208;
 Sat,  8 Mar 2025 05:43:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 60C265C479B;
 Sat,  8 Mar 2025 05:41:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA39FC4CEE0;
 Sat,  8 Mar 2025 05:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741412608;
 bh=ovZlCRfpGxU3/hjuo4CLsJ1CEQZkEYIY+jKDnqT6rSY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qdOF2JqAGlZ3avu+8eSjQmrorNfh5LAh3694+nIPDuUdNdmAcEqD3CtUUBz9ZS4P0
 UaC/bPe/yBJnZKSgohUjBrYuMApX9swb/yhBsOe5IbcqFRchtfdpXWht+22aBGzCGB
 z/m9vNlNDbIiCwoKoqTqUawawmXjxgihNbJQ0e8+f7tgvA+jpmk2yv6IX/bRo5BgQ+
 oGgCHvmFDsComwPcm2g/bNYH1CmZXIhnpl2VZzEDOnRJhITbgfRVeJGuJwP9PYhshr
 yXzXLQsPyBV83WIbKfJlKeiEZa/KATUISQeN4GfrEGCP3WlRka1i/0En57/Fb1W1Tl
 EiHTT3ntKrR4Q==
From: Dmitry Baryshkov <lumag@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Clark <robdclark@chromium.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v3 00/21] drm/msm: Add support for SM8750
Date: Sat,  8 Mar 2025 07:43:13 +0200
Message-Id: <174141256285.1924437.13836613214296970424.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
References: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
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


On Fri, 21 Feb 2025 16:24:10 +0100, Krzysztof Kozlowski wrote:
> Dependency / Rabased on top of
> ==============================
> https://lore.kernel.org/all/20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org/
> 
> Merging
> =======
> DSI pieces here might not be ready - I got modetest writeback working,
> but DSI panel on MTP8750 still shows darkness.  Therefore we discussed
> that DPU/catalog things could be applied first.
> 
> [...]

Applied, thanks!

[01/21] dt-bindings: display/msm: dsi-controller-main: Combine if:then: entries
        https://gitlab.freedesktop.org/lumag/msm/-/commit/0edf7b1f3190
[02/21] dt-bindings: display/msm: dsi-controller-main: Add missing minItems
        https://gitlab.freedesktop.org/lumag/msm/-/commit/83ee6d2ec52f

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
