Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF832672ECC
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 03:17:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD1110E891;
	Thu, 19 Jan 2023 02:17:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC10C10E88E;
 Thu, 19 Jan 2023 02:17:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6096B61A60;
 Thu, 19 Jan 2023 02:17:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5110C4339C;
 Thu, 19 Jan 2023 02:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674094625;
 bh=NwUQ5xIBukv5i4en356Co6TtUVTv9Rud5u+DKgS83BA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BYeLXohnxymuYwOxjwxo9/bqLkxrJB/xzz/zBxJ1ZUwW+mJFtDVOLHa+yswA5enp/
 NP2dikuGtml1yhzDs3T+OniZHGxO8G/sjmCHwF0iXGYrplSqUBGYMJHuBp1rPVs7ih
 vwHo1qYeZTQwYBe2/+5qRLwnuL3Ru1WqramG+azYsHr4+rbnpOLqH29ZkMcu5IVqCX
 +B7MY2DMl4eqVDfCWxKlb3X1wlXKqQpt66auHoxwckwAc28j/SHl163iFEc66PnPBe
 SzsvZYMRFvIR9L+cYjEIB+8qfT5KpAIIE5IykxYwWNFBll1DZB1Bo9oaFPUCEDKBwT
 Y0fymVdxslKHA==
From: Bjorn Andersson <andersson@kernel.org>
To: dmitry.baryshkov@linaro.org, Andy Gross <agross@kernel.org>,
 konrad.dybcio@linaro.org, quic_abhinavk@quicinc.com,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, sean@poorly.run,
 robdclark@gmail.com
Subject: Re: (subset) [PATCH v5 0/4] dt-bindings: display/msm: convert MDP5
 schema to YAML format
Date: Wed, 18 Jan 2023 20:16:54 -0600
Message-Id: <167409461442.3017003.4468887487098275908.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230109050152.316606-1-dmitry.baryshkov@linaro.org>
References: <20230109050152.316606-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 9 Jan 2023 07:01:48 +0200, Dmitry Baryshkov wrote:
> This patch concludes the conversion of display/msm schema from txt files
> to YAML format.
> 
> The per-SoC compat (new addition) is required to ease migrating platform
> support between mdp5 and dpu drivers.
> 
> Changes since v4:
> - Adjust qcom,mdss.yaml to follow the addition of per-SoC compatibles
> 
> [...]

Applied, thanks!

[3/4] ARM: dts: qcom-msm8974: add SoC specific compat string to mdp5 node
      commit: 11691dab82e135c9a13cda49234ff3e76bba48d3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
