Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E22A3CD86
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 00:29:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE1C89907;
	Wed, 19 Feb 2025 23:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="H+wcL5cT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E236089907;
 Wed, 19 Feb 2025 23:29:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2CC4B61147;
 Wed, 19 Feb 2025 23:21:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D2CC4CED1;
 Wed, 19 Feb 2025 23:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740007297;
 bh=LMS1nLB7BGuN+tfhQGVp3lwyass1VSu3itpL87r5DTw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H+wcL5cTtkCr1j28mNbUZQWDmq/2yXOcPj+MU8854KsvoAX9B12+Y/YyoNxEu89z0
 yGV1NAG0SY2ER3PwFHcl7JVa5vBfPQe7u0fhX9tS9eARAI+vYJ0UMm9qk+g34kkotm
 VRwPohu93V4gK6SQs7QEKH6J3J1p3JoYcYJ0WOavM2PvVuZ+44dkeVB4f0DcIZTBS0
 JaQDaDkX+9ybbgoOkGA16b6LFbENUnt8YgzYpelU9qQ5QWc2umiVDmRbUbW2caiAVT
 NzIJm0ldEsOpxJg0zMiW4Jrz7GvZZJ4MnlUmpUpUDwd4WwlUx7RSi/vB0jUlZthYtC
 Sm59WZb54NGjQ==
Date: Wed, 19 Feb 2025 17:21:36 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sean Paul <sean@poorly.run>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v2 04/16] dt-bindings: display/msm: dsi-controller-main:
 Add SM8750
Message-ID: <174000729541.3163430.2531640843485250752.robh@kernel.org>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-4-d201dcdda6a4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-b4-sm8750-display-v2-4-d201dcdda6a4@linaro.org>
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


On Mon, 17 Feb 2025 17:41:25 +0100, Krzysztof Kozlowski wrote:
> Add DSI controller for Qualcomm SM8750 SoC which is quite different from
> previous (SM8650) generation.
> 
> It does not allow the display clock controller clocks like "byte" and
> "pixel" to be reparented to DSI PHY PLLs while the DSI PHY PLL is not
> configured (not prepared, rate not set).  Therefore
> assigned-clock-parents are not working here and driver is responsible
> for reparenting clocks with proper procedure.  These clocks are now
> inputs to the DSI controller device.
> 
> Except that SM8750 DSI comes with several differences, new blocks and
> changes in registers, making it incompatible with SM8650.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/display/msm/dsi-controller-main.yaml  | 54 ++++++++++++++++++++--
>  1 file changed, 49 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

