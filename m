Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40079C843C6
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 10:31:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9395210E397;
	Tue, 25 Nov 2025 09:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lVFwqhoG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6923910E397;
 Tue, 25 Nov 2025 09:31:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 30B154016D;
 Tue, 25 Nov 2025 09:31:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D4AEC4CEF1;
 Tue, 25 Nov 2025 09:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764063105;
 bh=MZAN5MusJR8MW2VtWuKYEncrkiYUQ8s8U0XJPZLuuWc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lVFwqhoG328pUOqsbYeq1VrAiETx99D54Mcgq/GABAKleR3H+25gInKKGBLzXrkHh
 1Jc+e1sSVPbsKOHWEWzfqHMU69K4XHx3H5dRSRWPtn9lu3DI39K3c2MUjPkytwPauu
 UJRnzwEGnKl2T0h1MZD0lj0192I7frTlvzkLJHveL1t4O+2sU0iHhRg3Wqd1/DIu3G
 NNSsENQ2UrANXdX7R+xS1cvs8oOU8x0lsOEhpmipvAafUl2P/YE0T3fIk+VeKuXNWz
 8PafN333EGwUjJjtHu899vtMzvY62RxNpR7fQEMU6lhHZW915r0HJYbSEIUpoZzwmM
 fFEAwdZGtbzZQ==
Date: Tue, 25 Nov 2025 10:31:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 robdclark@gmail.com, dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run, 
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, 
 krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, 
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com
Subject: Re: [PATCH v3 1/5] dt-bindings: display: msm-dsi-phy-7nm: document
 the QCS8300 DSI PHY
Message-ID: <20251125-mauve-tamarin-of-education-c94bfb@kuoka>
References: <20251125013302.3835909-1-quic_amakhija@quicinc.com>
 <20251125013302.3835909-2-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251125013302.3835909-2-quic_amakhija@quicinc.com>
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

On Tue, Nov 25, 2025 at 07:02:58AM +0530, Ayushi Makhija wrote:
> Document the DSI PHY on the QCS8300 Platform.

Explain the hardware, so your diff would be justified. Instead of
stating obvious or copying the subject, say something useful. Why this
is compatible with different platforms?

Best regards,
Krzysztof

