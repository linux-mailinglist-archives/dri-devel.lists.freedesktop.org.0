Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BDF68FE73
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 05:21:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0735810E1F0;
	Thu,  9 Feb 2023 04:21:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB93F10E1F0;
 Thu,  9 Feb 2023 04:21:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6E555B81FFD;
 Thu,  9 Feb 2023 04:21:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10239C433A4;
 Thu,  9 Feb 2023 04:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675916493;
 bh=4BCwhIYTUP4n4Ju6LjJ1nXxVbLUcHs6EEQNOTxDnQtU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jso6jYn770iijmJitbMXK+G2t6tVeft2Xljmm4DT7BqN2lQdVqMuu2mPT2UIP5Ytr
 on8a0gwxYdECRNTo03tcJ22Wd54JKFbrHi69vEya3N/9EO6xm5QDXwQQClWcGJ4+2G
 0RAqnHs1G4ENv9rfmQXhUGUPG3s8Z2Pfp1PDNq/oOEEKcvQDBvRVOVsEwdztVIRi/d
 Cy8Im9FSZPnk5vuH0nav6EoqccicUQ/apydDgCV8s54aCSMJv9qc4xjY2cbBH02lF/
 vOm74+n9yiuAvQlEfhB714fREv7AWl3ozflxBZfqMRReFpx5wb4mQAplkmBRS1V4/d
 9vmU9IxE1PHiA==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: (subset) [PATCH 0/6] drm/msm/hdmi: integrate msm8960 HDMI PHY
 with DT clocks infrastructure
Date: Wed,  8 Feb 2023 20:22:49 -0800
Message-Id: <167591660365.1230100.2084751703451374585.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230119132219.2479775-1-dmitry.baryshkov@linaro.org>
References: <20230119132219.2479775-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 19 Jan 2023 15:22:13 +0200, Dmitry Baryshkov wrote:
> Make msm8960's HDMI PHY accept clocks from DT and also register it as a
> DT clock provider.
> 
> Dmitry Baryshkov (6):
>   dt-bindings: phy: qcom,hdmi-phy-other: use pxo clock
>   dt-bindings: phy: qcom,hdmi-phy-other: mark it as clock provider
>   drm/msm/hdmi: switch hdmi_pll_8960 to use parent_data
>   drm/msm/hdmi: make hdmi_phy_8960 OF clk provider
>   ARM: dts: qcom: apq8064: add #clock-cells to the HDMI PHY node
>   ARM: dts: qcom: apq8064: use hdmi_phy for the MMCC's hdmipll clock
> 
> [...]

Applied, thanks!

[5/6] ARM: dts: qcom: apq8064: add #clock-cells to the HDMI PHY node
      commit: c9f678afe0bbdfb3748c1db5ac94d1c02a6eb64b
[6/6] ARM: dts: qcom: apq8064: use hdmi_phy for the MMCC's hdmipll clock
      commit: f1a359db6d9d198b84877e2340dd7c37809a4882

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
