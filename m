Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88952B32CFE
	for <lists+dri-devel@lfdr.de>; Sun, 24 Aug 2025 04:56:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE4410E0FC;
	Sun, 24 Aug 2025 02:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LnR50E6Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651F910E0D2;
 Sun, 24 Aug 2025 02:56:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8B077402BB;
 Sun, 24 Aug 2025 02:56:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63AD6C4CEE7;
 Sun, 24 Aug 2025 02:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756004160;
 bh=+OE4zk2QOOZCHgX82O6BSFFjtdDPcgXJ/GXAHDpLonY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LnR50E6QfsaE6+wSpYXZysqcrTN9KQ+uP78ptO2NQxUXzvuVhewgxe/RoHsPCj1Sp
 0TPHDcTpz+Gi5fIOUZFS2d6U04pj2K7nG62H+y3MZ3Do3cxXUFcFUfCa0dCY+JxyPQ
 pEc569a7+UMwpbFtugTZ3Avhot3Yq1IOAq3PLMe6ztbrUbodgT1sT9dFiEnawpcw0X
 zKsTHT8dNv8kZfBwhvNf18xNaDnEs4qFV7ZGrq1QMtY/NKv6aT0hIWDSpCAaATdEnW
 e7Zc+yEHilL1pDTvx8Gnble7gd712hzuqq5IZ33VC/WcogO5syktkLFKpCnRJyiDVy
 3QVTZ+mKw9CYg==
From: Bjorn Andersson <andersson@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/4] Support for Adreno X1-45 GPU
Date: Sat, 23 Aug 2025 21:55:33 -0500
Message-ID: <175600415279.952266.17398839743993518772.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623-x1p-adreno-v4-0-d2575c839cbb@oss.qualcomm.com>
References: <20250623-x1p-adreno-v4-0-d2575c839cbb@oss.qualcomm.com>
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


On Mon, 23 Jun 2025 19:42:05 +0530, Akhil P Oommen wrote:
> Add support for X1-45 GPU found in X1P41200 chipset (8 cpu core
> version). X1-45 is a smaller version of X1-85 with lower core count and
> smaller memories. From UMD perspective, this is similar to "FD735"
> present in Mesa.
> 
> Tested Glmark & Vkmark on Debian Gnome desktop.
> 
> [...]

Applied, thanks!

[2/4] arm64: defconfig: Enable X1P42100 GPUCC driver
      commit: cf0ed173d27a2a832642aa441eb28a4dca53fd19

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
