Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C562BB32D01
	for <lists+dri-devel@lfdr.de>; Sun, 24 Aug 2025 04:56:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9469510E1F0;
	Sun, 24 Aug 2025 02:56:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gfJi0PPK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 082E810E1F0;
 Sun, 24 Aug 2025 02:56:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A5FDC5C4BF8;
 Sun, 24 Aug 2025 02:56:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D835AC116D0;
 Sun, 24 Aug 2025 02:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756004164;
 bh=paoZxNbHfmn7LVGrZn+AtT4NxafaDjndYSvZBGdyEj0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gfJi0PPKNjw+SMGiyjp2TYgiGqcyOp14pvsbTtWGlvlZrukyBjhPilzdIWJz0C4T9
 QlGLI+N/0u2wdC6vcAvrtBhylUGDlapBVIJjRaAg8Rp9ic1v00TF23jRoZH26ILdcV
 tWlBdQ6xQeF7XBz98N2tB4oukEaiK79J2PhkOvUWuB54WiRo7hgW+kLrMoxt/YUVuy
 m/M2HoS0t0wmg/51BBYr9ZbZK9WLqiAYqm/3ZTg4tyPxKOgsg5PWwO8PbwRxFHD+BN
 VpfDbXfts3WB3szrrqS+IoR+WVGT4xDOOh3p1IbslIdoI3o69cyTLEKL43aUje63AW
 rUIAUOT5W69Mw==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 0/4] dt-bindings: display/msm: describe MDSS unit
 on SC8180X platform
Date: Sat, 23 Aug 2025 21:55:36 -0500
Message-ID: <175600415267.952266.17728057778251475125.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704-mdss-schema-v1-0-e978e4e73e14@oss.qualcomm.com>
References: <20250704-mdss-schema-v1-0-e978e4e73e14@oss.qualcomm.com>
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


On Fri, 04 Jul 2025 19:31:52 +0300, Dmitry Baryshkov wrote:
> SC8180X is one of the last platforms which do not have DT schema for the
> display devices. Add DT schema for Mobile Display SubSystem (MDSS) and
> Display Processing Unit (DPU) and add SC8180X-compatible to the DSI
> controller schema.
> 
> While we are at it, also update DT file for SC8180X to follow best
> current practices for MDSS devicex description.
> 
> [...]

Applied, thanks!

[4/4] arm64: dts: qcom: sc8180x: modernize MDSS device definition
      commit: 340e57306a4aeaaa64f294553caa25453cc4c48d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
