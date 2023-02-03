Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C7B68A2D9
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 20:21:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCED610E8B0;
	Fri,  3 Feb 2023 19:21:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D6910E18F;
 Fri,  3 Feb 2023 19:21:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C3F2461FC7;
 Fri,  3 Feb 2023 19:21:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20F9EC433EF;
 Fri,  3 Feb 2023 19:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675452078;
 bh=a0GsiNBZfOuCuESojYNwJ1g3/tM+bS7UT/gPekmd0Q8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=crVgcvrIPGgF+lQkCFF5Sr+6Z9yj4qF40B4XrR0wMUv9thYcEcreaj2/wW4uqLnze
 RGV+331O3KN+nXb94w10VFjH8VhcBX/2TsqTPH6UbevtTxPCDDkcUkuwAjz4YFtp2e
 x6UjXMjmpezYlS8iFSKFqq3c69rkkeNpdw7a33H3GeZZWI9pR2mK8mHCl7RHeoyJXX
 Bir0bxvhMHotuW4uGb1go0LMUOkkbyyoUjKfYmoSizw26j12G7tNqlzNI8c8VCoIVF
 H7DYcdJqKWlatnCYZZBOC6IkBB5Bo9UjovU5fDDBJo/ffnUSAyAq/icDCvV78XLniA
 G9DHcjd3aqfWg==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>,
 Sean Paul <sean@poorly.run>, Rob Clark <robdclark@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: sm8350: use qcom,
 sm8350-dsi-ctrl compatibles
Date: Fri,  3 Feb 2023 13:21:14 -0600
Message-Id: <167545206738.231526.12336122899683141674.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230118032024.1715857-1-dmitry.baryshkov@linaro.org>
References: <20230118032024.1715857-1-dmitry.baryshkov@linaro.org>
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


On Wed, 18 Jan 2023 05:20:24 +0200, Dmitry Baryshkov wrote:
> Add the per-SoC (qcom,sm8350-dsi-ctrl) compatible strings to DSI nodes
> to follow the pending DSI bindings changes.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8350: use qcom,sm8350-dsi-ctrl compatibles
      commit: d7133d6d25fbc9374447e2ca4e23a04023824779

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
