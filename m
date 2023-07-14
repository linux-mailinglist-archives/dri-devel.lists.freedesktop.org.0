Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 269FF75312C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 07:30:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EEC910E118;
	Fri, 14 Jul 2023 05:30:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB27910E118;
 Fri, 14 Jul 2023 05:30:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0A12D61BEC;
 Fri, 14 Jul 2023 05:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A629C433CA;
 Fri, 14 Jul 2023 05:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689312639;
 bh=Zmn4NeheusfOk3tm5PX2lZHGmvP/Ct+fKQyBjBgdVT8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b59UApgjxctYKqLTMw5dpvyKH+L+luO0L14Jbi+NwMAnkJgpd6urUBhq4yxT/V83w
 KqUjJYJTGLA24mwfrUiBjInhA9iVIn/jH5EIvevx8mya3tCARsE4evg63LaQDT519v
 eIqA5Pi7EWWV7oyntjgt1KLj/KUXI8aIYv6SyxoTMjpdT70mTrxRQYmE7MR8QUvWxF
 ShLRgWZPpUAEqsVboF1hgiUNUFajQ5V3nqGijMUc+YjjF0NW5vzqSR4iNPAD/XYW4i
 tYFbxl4MPeYyBry2qHOYHc1u1lgEwUeQDzW1BgvOJ/TKUM2xxxR7346geCQWaqFpl6
 v914/2rKxyIxQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: (subset) [PATCH v2 0/8] MDSS reg bus interconnect
Date: Thu, 13 Jul 2023 22:33:55 -0700
Message-ID: <168931284127.1538684.17964708755226748693.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230712121145.1994830-1-dmitry.baryshkov@linaro.org>
References: <20230712121145.1994830-1-dmitry.baryshkov@linaro.org>
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 12 Jul 2023 15:11:37 +0300, Dmitry Baryshkov wrote:
> Per agreement with Konrad, picked up this patch series.
> 
> Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
> another path that needs to be handled to ensure MDSS functions properly,
> namely the "reg bus", a.k.a the CPU-MDSS interconnect.
> 
> Gating that path may have a variety of effects. from none to otherwise
> inexplicable DSI timeouts.
> 
> [...]

Applied, thanks!

[8/8] arm64: dts: qcom: sm8450: provide MDSS cfg interconnect
      commit: 4e125191e6cb00d6c3f3a8e1b67fd242e639b3c3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
