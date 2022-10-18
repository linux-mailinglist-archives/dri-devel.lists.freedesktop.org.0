Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D27786021A8
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 05:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17DA210E73D;
	Tue, 18 Oct 2022 03:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 960A210E73D;
 Tue, 18 Oct 2022 03:06:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EFD7A61369;
 Tue, 18 Oct 2022 03:06:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D990C43143;
 Tue, 18 Oct 2022 03:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666062389;
 bh=Hfd9BIUtESFczsoFDl8f6ULWns+IQqKn5CHgXX7RyWk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=j0B0zfNmIrRExnUHPCdO+e7tRqm+HHe30oPWZtCXqOAtdl4Pj6mpADlzivNvjbjpZ
 n7/I3bbbHgN2XBkYTToqcD5kAA5aUmf/pgdH/vtbusFLAjRQbGaPSxoWYGbaEl8QcA
 FAxt84zTgxi3A1vpPu0p6f0qEdk4rLBe216cCnJJDYnw94WB4tGxm9/B5johfSdmtQ
 S8j0hV2buZYydK46ScZ+v9m9CNZUCVheSZzApzGA7IapQ0dGDcKsO7Lehv/4j8SIif
 H7tg5nv+n2oCGukikIuxUB2kIRqGZPXTDWIREljtY9uD91XsiChHzQX9mpR6tqRLu9
 yeIo7R7SCg8qQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 robh+dt@kernel.org, agross@kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Clark <robdclark@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: (subset) [PATCH 0/9] arm: dts: qcom: rename DSI PHY nodes
Date: Mon, 17 Oct 2022 22:05:10 -0500
Message-Id: <166606235857.3553294.1408675874980992171.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
References: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 24 Sep 2022 12:00:59 +0300, Dmitry Baryshkov wrote:
> Historically DSI PHY device tree nodes used the dsi-phy@ names. Replace
> them with generic phy@ names.
> 
> Dmitry Baryshkov (9):
>   ARM: dts: qcom-apq8064: change DSI PHY node name to generic one
>   ARM: dts: qcom-msm8974: change DSI PHY node name to generic one
>   arm64: dts: qcom: msm8916: change DSI PHY node name to generic one
>   arm64: dts: qcom: msm8996: change DSI PHY node name to generic one
>   arm64: dts: qcom: sc7180: change DSI PHY node name to generic one
>   arm64: dts: qcom: sdm630: change DSI PHY node name to generic one
>   arm64: dts: qcom: sdm660: change DSI PHY node name to generic one
>   arm64: dts: qcom: sdm845: change DSI PHY node name to generic one
>   arm64: dts: qcom: sm8250: change DSI PHY node name to generic one
> 
> [...]

Applied, thanks!

[1/9] ARM: dts: qcom-apq8064: change DSI PHY node name to generic one
      commit: cf6cea98662dc9ecf7707076b10499785870ff23
[2/9] ARM: dts: qcom-msm8974: change DSI PHY node name to generic one
      commit: 798e65cdd910a59a34de365ff9e00c186fb568b4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
