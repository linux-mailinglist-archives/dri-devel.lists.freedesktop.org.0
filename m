Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCD3B9327C
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 21:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9705B10E508;
	Mon, 22 Sep 2025 19:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TfFCwx/4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA93C10E508;
 Mon, 22 Sep 2025 19:57:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 76B0F4353E;
 Mon, 22 Sep 2025 19:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B255C4CEF0;
 Mon, 22 Sep 2025 19:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758571039;
 bh=ATU22+eW9PFL7VBw73VUAiKeeHjomxrpBheEOpZuqKI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TfFCwx/41/T+d747EWTvvLu2aZoute+nq5SSBDuu1Z5+wsdXJHVw5jDTw2A/Z4e80
 I0LXpr2oDOAIpU212nT/yGNimDke+sqOw6J71FLf5WcJOQlYX1Bo0xp/XsFdwVdFql
 kYwkJ0YToF7jjY0MHqBHiusRScdyC3HCNlGI7r9T3PoM5JuEYDOa5ERBKHiDd/y9OA
 PBDNaDN7NZxJ1uhUe9mVXNQgBxW9Vv6wzE1JDVEK6w8Kjrmdpz5VlrrinkxDCnrPvN
 nlfC0U+UOjs06oKrx/4oitsj6ApTafLlJkUt6bzNhmOxrfBx00Ji70geklaVlpiu10
 CodXdDEDHiv+g==
Date: Mon, 22 Sep 2025 14:57:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, li.liu@oss.qualcomm.com,
 fange.zhang@oss.qualcomm.com, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 yongxing.mou@oss.qualcomm.com, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v5 01/14] dt-bindings: phy: Add QMP USB3+DP PHY for QCS615
Message-ID: <175857103795.1112931.5315462738627006781.robh@kernel.org>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-1-eae6681f4002@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-add-displayport-support-for-qcs615-platform-v5-1-eae6681f4002@oss.qualcomm.com>
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


On Fri, 19 Sep 2025 22:24:18 +0800, Xiangxu Yin wrote:
> Add device tree binding documentation for the Qualcomm QMP USB3+DP PHY
> on QCS615 Platform. This PHY supports both USB3 and DP functionality
> over USB-C, with PHY mode switching capability. It does not support
> combo mode.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml   | 111 +++++++++++++++++++++
>  1 file changed, 111 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

