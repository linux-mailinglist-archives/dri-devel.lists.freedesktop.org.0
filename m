Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE556AFD504
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 19:16:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C9310E1A9;
	Tue,  8 Jul 2025 17:16:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vDfJHdtR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA4F10E1A9;
 Tue,  8 Jul 2025 17:16:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2A5BA5C57C8;
 Tue,  8 Jul 2025 17:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D8B7C4CEED;
 Tue,  8 Jul 2025 17:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751995006;
 bh=8JCM007Su614dbs0l57eUxf4MWAtqpo3iFUjAkEXeAQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vDfJHdtRTlcgaUIFBLrdCi1UWjZWnGedZeU5C7IhRs0DTnUrd43Jb4WcnU3ZVH2XR
 maXi/ZbFcpUUa1U36gKTtdWhSMQ9mXgQhWrnrrsyjNr/SGyW9Ol6iI9qYAAHlwtX5p
 2M5/YD6MYvhd/TtyVkUAtsKtbTo/tx+m26kPiAnhd4senIUj4vT/Zpxg2NA2vKv1Xm
 +3pTopEo669j9v4NV+3G1AtFLut/nYOYojVW3wZZwPpz0M4F1qc6uPMImCdjCqDhwJ
 Uv/8nT4jdDruw9aEk7MkFE49Y2FsR97NSDw3ufc3RIYol+W11/7UfAvmCjFxU6mBG5
 6agGSBMQYKTCg==
Date: Tue, 8 Jul 2025 12:16:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH 1/4] dt-bindings: display/msm: dsi-controller-main: add
 SC8180X
Message-ID: <175199500495.649724.17681226218267809608.robh@kernel.org>
References: <20250704-mdss-schema-v1-0-e978e4e73e14@oss.qualcomm.com>
 <20250704-mdss-schema-v1-1-e978e4e73e14@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-mdss-schema-v1-1-e978e4e73e14@oss.qualcomm.com>
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


On Fri, 04 Jul 2025 19:31:53 +0300, Dmitry Baryshkov wrote:
> Describe the SC8180X-specific compatible for the DSI controller persent
> on the SoC. While the current DT for SC8180X doesn't use this
> compatible, all other platforms were updated to have one. This change
> makes SC8180X follow the lead.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

