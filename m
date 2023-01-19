Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1AC672EC2
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 03:17:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2429C10E053;
	Thu, 19 Jan 2023 02:17:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E8410E053;
 Thu, 19 Jan 2023 02:17:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6F44C61AA0;
 Thu, 19 Jan 2023 02:17:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EB59C4339E;
 Thu, 19 Jan 2023 02:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674094623;
 bh=qfp2ZX7D6n+PcY6wypfWJ12w2hBmcOnALcPvzZR0X/E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZYOhMk2KIOyv+e8RrmmOlN3eG6Oept//073MIJxE3iuGfMXKNIdA/u92fdSu78lWF
 1Y+5waRBecoaiafcuLR6f0JWCu9XoCn4mLk1iSId/VcGd5s5QrMLDjGT4S8/ngUhvp
 vhu8TcVR3/20RmAMFlPG7cpXgTNp4+tQoJvlPHRCZ769lGpkLjzruQ3IvLizr0/jN4
 42n6XrPxSpmvgUfO86yaczAVkSF7ylxQgHG6YvdpCEvltm8rk15ioQh3ohAVwSeDj3
 6vJ1MQTnv5QyJzEUbC+i9YW5Fhf6tUxktpcHTUmIhkyrdMuD9gBV3Jdx7Aga+Ei170
 YyIZo4Z1keD5w==
From: Bjorn Andersson <andersson@kernel.org>
To: dmitry.baryshkov@linaro.org, Andy Gross <agross@kernel.org>,
 konrad.dybcio@linaro.org, quic_abhinavk@quicinc.com,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, sean@poorly.run,
 robdclark@gmail.com
Subject: Re: (subset) [PATCH 0/6] dt-bindings: display/msm: rename mdss and
 mdp nodes
Date: Wed, 18 Jan 2023 20:16:52 -0600
Message-Id: <167409461442.3017003.17675083884610037348.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230109051402.317577-1-dmitry.baryshkov@linaro.org>
References: <20230109051402.317577-1-dmitry.baryshkov@linaro.org>
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

On Mon, 9 Jan 2023 07:13:56 +0200, Dmitry Baryshkov wrote:
> Finish the process of renaming display-related nodes on Qualcomm
> systems. Fix it in the schema that MDSS (Mobile Display SubSystem)
> devices are named `display-subsystem' and both MDP (Mobile Display
> Processor) and DPU (Display Processor Unit) nodes are named
> `display-controller'.
> 
> Dmitry Baryshkov (6):
>   dt-bindings: display/msm: rename mdss nodes to display-sybsystem
>   dt-bindings: display/msm: rename mdp nodes to display-controller
>   arm64: dts: qcom: rename mdss nodes to display-subsystem
>   ARM: dts: qcom-msm8974: rename mdss node to display-subsystem
>   arm64: dts: qcom: rename mdp nodes to display-controller
>   ARM: dts: qcom: rename mdp nodes to display-controller
> 
> [...]

Applied, thanks!

[4/6] ARM: dts: qcom-msm8974: rename mdss node to display-subsystem
      commit: 19230930286005d7c733a5cb0ed8ebce9cad4423
[6/6] ARM: dts: qcom: rename mdp nodes to display-controller
      commit: 858b0d4b04ead05cdfec094a1e4b18865f28cedc

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
