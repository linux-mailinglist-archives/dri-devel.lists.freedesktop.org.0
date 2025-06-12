Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3EDAD6661
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 06:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA1210E434;
	Thu, 12 Jun 2025 04:01:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="W2439T40";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B7410E106;
 Thu, 12 Jun 2025 04:01:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E00A0629ED;
 Thu, 12 Jun 2025 04:01:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00F25C4CEF0;
 Thu, 12 Jun 2025 04:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749700866;
 bh=tWoYJleyJqwjf76qvFtP0cOBOfcKNn3pStGHLxNPSeA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=W2439T40qrp/Z1JkyLMrBu8Qdrmo3KMfQHUlPiCB+myhX/nUXS9OpXENiPkSk5Xr8
 M7RIY5ypEJ8imM1/kORVE2Roc0lHWbD062XsKqGPr0edNDNRV1V2x4oDqigOBrU5XK
 01WFbcx79KYd3pPIEPDVptLzhWkUPDvnkcqEmEvPYpdzHlQWEx58HXh4c9+gSNnaXV
 mxgO210y2R1o4JnAZx4Wl4JSuRqeJ1AHNqZeDJ48Sm7jM1RmE/NA7uM49uRwEBG6hq
 3cnSSgA7dATWXAWs3aYbKfskH08fJccweeimoBuaHeUruCH7/QVaDd3tqfE1iRI6TV
 02gk7mZCGH2Mg==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, robh@kernel.org, robh+dt@kernel.org,
 krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com, Rob Clark <robin.clark@oss.qualcomm.com>
Subject: Re: [PATCH v8 RESEND 0/2] Add DSI display support for SA8775P target
Date: Wed, 11 Jun 2025 23:00:46 -0500
Message-ID: <174970084187.547582.69937628185004387.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250604071851.1438612-1-quic_amakhija@quicinc.com>
References: <20250604071851.1438612-1-quic_amakhija@quicinc.com>
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


On Wed, 04 Jun 2025 12:48:49 +0530, Ayushi Makhija wrote:
> This series enables the support for DSI to DP bridge ports
> (labled as DSI0 and DSI1) of the Qualcomm's SA8775P Ride platform.
> 
> SA8775P SoC has DSI controller v2.5.1 and DSI PHY v4.2.
> The Ride platform is having ANX7625 DSI to DP bridge chip from Analogix.
> 

Applied, thanks!

[1/2] arm64: dts: qcom: sa8775p: add Display Serial Interface device nodes
      commit: 73db32b01c9f89daf84613cc9c62ce5fe93745aa
[2/2] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI to DP bridge nodes
      commit: ec04e5b4a1887d7c5d29f4efae4e54576c407605

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
