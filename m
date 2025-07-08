Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D63AFCA91
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 14:40:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B82EC10E639;
	Tue,  8 Jul 2025 12:40:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="J8/viqs2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A2910E63D;
 Tue,  8 Jul 2025 12:40:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 575CB6148E;
 Tue,  8 Jul 2025 12:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D82F9C4CEED;
 Tue,  8 Jul 2025 12:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751978413;
 bh=AtLFdAeVACJNl2ke3aWgXmohwufWhuQO0Od69sJQtwE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J8/viqs2t+fnwxNyMUVBOrwddW9CBf3GI5noe8EWgn7uaX5Mr+SmmZYterIA4MZQa
 UY3K8lizVuaAdp9eF5665g9mZKHovDY8n18LhDurLifW5GAwneXFgIscrN61hh7Zr1
 tX9T2q6uF5d1RYl4+IAyLs1ihbDafUL7kemVXzGYHtvztkQ9ZW6LnphjsihVYfsWjh
 rNE6WdOIJSROEcTP2vszbrZWZtqj9hOT+xTCVMNz1j+n6e02mWHAWiOryWlRNTvUpF
 DA5a8YNX7dJSGFZ1vdz9ydOas7aH40Xbj/3OpBTlmP08OP45ZsmAQk2to9PfzSQXeP
 V08ikd/+3nO8g==
Date: Tue, 8 Jul 2025 07:40:11 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, devicetree@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maxime Ripard <mripard@kernel.org>, freedreno@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/3] dt-bindings: display/msm/gpu: describe clocks for
 each Adreno GPU type
Message-ID: <175197841127.384639.1538751354808329630.robh@kernel.org>
References: <20250628-rework-msm-gpu-schema-v1-0-89f818c51b6a@oss.qualcomm.com>
 <20250628-rework-msm-gpu-schema-v1-3-89f818c51b6a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250628-rework-msm-gpu-schema-v1-3-89f818c51b6a@oss.qualcomm.com>
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


On Sat, 28 Jun 2025 06:02:37 +0300, Dmitry Baryshkov wrote:
> Rather than having a single list with all possible clocks for A3xx-A5xx
> define individual Adreno GPU types and corresponding clock lists.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/gpu.yaml       | 220 ++++++++++++++++++---
>  1 file changed, 194 insertions(+), 26 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

