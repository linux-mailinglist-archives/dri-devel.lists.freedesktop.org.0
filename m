Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0165F6C8505
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 19:31:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E84CF10EC32;
	Fri, 24 Mar 2023 18:31:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A5410EC4F;
 Fri, 24 Mar 2023 18:31:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B32EF62C3B;
 Fri, 24 Mar 2023 18:31:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4606C433A1;
 Fri, 24 Mar 2023 18:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679682694;
 bh=+7BSN+9BvmOvAAo9V2NpbKi/q8UqqQhIUVAYwcGE2aE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qiY0wjIyffj2xeDoCudnICqvCwDQvs+K0dUznZ9uiAV2MYjy/Du8zKNmkHm5jmO2D
 epazi3J1ULnMQSAJiIWWDVk0RDNPWrTkcrDR4F+gIGA1FqKC4GZ/SjhStWXALRIY/g
 MeUKW5pYAmAyYPDmPKylxXrp/KVzKxtsKOCQGvb9T+15r2Q3/lQ84mfVdE7fJbKu5g
 crykpuswce2vCRBN+8+ohruR/QcGrSpFVCsrfl9aoHjLC9j0hZQj5gcbtEXS+1s2/D
 rR6JgWEwNkzQiRyCr08hZAkNaU2+UZxVNueYgFTwURlwhPVi09Jn05nvIo564aYrZ6
 gqXFv8653X9Ww==
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Andy Gross <agross@kernel.org>
Subject: Re: (subset) [PATCH v6 0/5] arm64: dts: qcom: add DP Controller to
 SM8350 & SM8450 DTS
Date: Fri, 24 Mar 2023 11:34:33 -0700
Message-Id: <167968287204.2233401.6225559348974279493.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v6-0-d78313cbc41d@linaro.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v6-0-d78313cbc41d@linaro.org>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 17 Mar 2023 16:06:31 +0100, Neil Armstrong wrote:
> Switch the QMP PHY to the newly documented USB3/DP Combo PHY
> bindings at [1] and add the DP controller nodes.
> 
> The DP output is shared with the USB3 SuperSpeed lanes and is
> usually connected to an USB-C port which Altmode is controlled
> by the PMIC Glink infrastructure in discution at [1] & [2].
> 
> [...]

Applied, thanks!

[2/5] arm64: dts: qcom: sm8350: switch to combo usb3/dp phy
      commit: 2458a305e80ef736ae03e6ca0bcae4c3f6923163
[3/5] arm64: dts: qcom: sm8350: add dp controller
      commit: a2802008af93b70165a80624082c695d89f51eb2
[4/5] arm64: dts: qcom: sm8450: switch to usb3/dp combo phy
      commit: d3054cec1e9ea475e53280724db62b62e25669d7
[5/5] arm64: dts: qcom: sm8450: add dp controller
      commit: bdd2f4ce5e762d5aede6c30ae161e377536dae1c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
