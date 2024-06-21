Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEF6911A60
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 07:29:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F6510E0A4;
	Fri, 21 Jun 2024 05:29:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="D+ZkkU3G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0AB110E086;
 Fri, 21 Jun 2024 05:29:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CE44F623EF;
 Fri, 21 Jun 2024 05:29:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A986C4AF08;
 Fri, 21 Jun 2024 05:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718947762;
 bh=ngUYofA4miFCa8feNw/DYHUDVbMkg19F6VlgbGgdVuw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=D+ZkkU3Gf0VS90UE4S0jfWEK3rm4/hvTpc17Boqxbmia6kKg7+Jkw6lVhvAL5uXuR
 2WY53qHdb2sdWRaDDLAlfGYdWmzseEHT1wzlXmD3OugLEZKar3uHQ8XXl+yX7SJQuW
 eanRlr/4AE5r1SIIdrnLSWiGrnylBUukb28oB99boR1dfdFZlc55T3T6aUhEPRisFd
 M5EusB/rshgGcGXbOdQm2o6lTN7CzNHvELjrr6NBXfmQ3vZS0ay3oo5E0KdLmtWeZZ
 fvtqRItBfc3fgcgV+xi1ICTtI/d1gF1/pFEAqbNahhqeujQNuhQ3gIg5RFPd/C+bG6
 uAE01NDDmfilw==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: (subset) [PATCH v2 0/7] Add SMEM-based speedbin matching
Date: Fri, 21 Jun 2024 00:29:16 -0500
Message-ID: <171894775431.6672.9137172396176465614.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240605-topic-smem_speedbin-v2-0-8989d7e3d176@linaro.org>
References: <20240605-topic-smem_speedbin-v2-0-8989d7e3d176@linaro.org>
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


On Wed, 05 Jun 2024 22:10:13 +0200, Konrad Dybcio wrote:
> Newer (SM8550+) SoCs don't seem to have a nice speedbin fuse anymore,
> but instead rely on a set of combinations of "feature code" (FC) and
> "product code" (PC) identifiers to match the bins. This series adds
> support for that.
> 
> I suppose a qcom/for-soc immutable branch would be in order if we want
> to land this in the upcoming cycle.
> 
> [...]

Applied, thanks!

[1/7] soc: qcom: Move some socinfo defines to the header
      commit: 9267997fa7aa0b597e8b32cb3fdfe91be1d35a83
[2/7] soc: qcom: smem: Add a feature code getter
      commit: 81bbb2b891174da9301fc0d4fe9622bd4cb6a995

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
