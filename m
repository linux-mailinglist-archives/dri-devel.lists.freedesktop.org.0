Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B27776C8515
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 19:31:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 297D210E542;
	Fri, 24 Mar 2023 18:31:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E441510E542;
 Fri, 24 Mar 2023 18:31:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 5A0ECCE24B7;
 Fri, 24 Mar 2023 18:31:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 891BDC433D2;
 Fri, 24 Mar 2023 18:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679682692;
 bh=Ej48M9ebls1K+wSIOxZxq4m6TqD3wHLtMGX0qjHoWrg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ddlTt0I2BOcRqGKH1iIYeIo/m8otzIVM8Nt/b+TjlYhMbZSNAcl+QEv1y9HDoCWCm
 5WPGpb5pcO8GZ+3FwJ2UV9AwdFoQVPYNq2Udd2Knd7CpPKP29fDVeUaykBDlI1dGDs
 OSkJ6BehLImkO1EempzZwjKrsrcw7SBkziessgIhCruBIEldmynmkUoC69Nvw/x0Qs
 aAQvEuDCRJbNbxlM0IH4p5LHZ1VFBJNOclz5CFi5YWI0ExvW4DHoxSQLzoFNUP0SNV
 KANnn8hatcpkQw2hQKht0tz8+FNDeI6bXRC7/OAyBFvjt/NDzoqSo+lfmUD7x282ny
 FQpGVjUHJ8j2A==
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Andy Gross <agross@kernel.org>
Subject: Re: (subset) [PATCH v2 0/4] arm64: qcom: sm8450: bindings check
 cleanup
Date: Fri, 24 Mar 2023 11:34:32 -0700
Message-Id: <167968287205.2233401.16927276389264304370.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v2-0-0ca1bea1a843@linaro.org>
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v2-0-0ca1bea1a843@linaro.org>
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

On Fri, 24 Mar 2023 10:28:45 +0100, Neil Armstrong wrote:
> A few fixes to pass the DT bindings check successfully
> for sm8450 qrd & hdk DTs.
> 
> The following are still needed to pass all the checks:
> - https://lore.kernel.org/r/20230308082424.140224-3-manivannan.sadhasivam@linaro.org
> - https://lore.kernel.org/r/20230130-topic-sm8450-upstream-pmic-glink-v5-5-552f3b721f9e@linaro.org
> - https://lore.kernel.org/all/20230308075648.134119-1-manivannan.sadhasivam@linaro.org/
> - https://lore.kernel.org/r/20230306112129.3687744-1-dmitry.baryshkov@linaro.org
> - https://lore.kernel.org/all/20221209-dt-binding-ufs-v3-0-499dff23a03c@fairphone.com/
> - https://lore.kernel.org/all/20221118071849.25506-2-srinivas.kandagatla@linaro.org/
> 
> [...]

Applied, thanks!

[3/4] arm64: dts: qcom: sm8450: remove invalid power-domain-names in pcie nodes
      commit: c98a56395e7854f7975dd8539d0563e0ac7d060e
[4/4] arm64: dts: qcom: sm8450: fix pcie1 gpios properties name
      commit: e57430d2483506f046e39bf8c61159dde88aede2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
