Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB4E71043F
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 06:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5801A10E08E;
	Thu, 25 May 2023 04:51:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A36410E08E;
 Thu, 25 May 2023 04:51:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7CBAA60E95;
 Thu, 25 May 2023 04:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3087C433A0;
 Thu, 25 May 2023 04:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684990266;
 bh=NC5k/dortCaTYYIlrCvaSs13p3N1PuUUuNBljB2ZWuU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=s3jr1i2YaPyOPc2Qk20qUMPVA9udUiXDduKblAQYXeFn+eRNVqM5fy7apWUpUYMZW
 UpKSghHkTVFt65vudox8c7fj3KYsecDYpSqkOni5JK6ifYIWH3GkS9XTu8iicdy3Dj
 c1GKr+Ee3XyiXja146geg34iDl4eVsyvTt2wWs+koIu77qWxnxlm0XJ6XTBQc0OtcK
 bSfLbLbwMa+s8xLuhVlGEeu5A+MCil2GnZ9N0BdmaeksnB0G2FNaO7UJesf4OHV7++
 ZMlU7tEP0KY/II650aWrAMRXQkBij5jpjY4Adl6LzYXWWIoSzjc3STXdclGNfCyRMK
 3/swa8B26rAvw==
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Rob Clark <robdclark@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Subject: Re: [PATCH] arm64: dts: qcom: enable dual ("bonded") DSI mode for
 DB845c
Date: Wed, 24 May 2023 21:53:46 -0700
Message-Id: <168499048179.3998961.8259109964158005747.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504160430.4014206-1-dmitry.baryshkov@linaro.org>
References: <20230504160430.4014206-1-dmitry.baryshkov@linaro.org>
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
Cc: Amit Pundir <amit.pundir@linaro.org>, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 4 May 2023 19:04:30 +0300, Dmitry Baryshkov wrote:
> Now as both lt9611 and drm/msm drivers were updated to handle the 4k
> modes over DSI, enable "bonded" DSI mode on DB845c. This way the board
> utilizes both DSI links and thus can support 4k on the HDMI output.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: enable dual ("bonded") DSI mode for DB845c
      commit: 8721e18ca6960f3c5a6a7f58245d9ab084ad09dd

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
