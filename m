Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5369658FAA
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 18:24:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C5510E402;
	Thu, 29 Dec 2022 17:23:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E4C10E402;
 Thu, 29 Dec 2022 17:23:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9BBB3B819FC;
 Thu, 29 Dec 2022 17:23:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09391C433D2;
 Thu, 29 Dec 2022 17:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672334623;
 bh=5fT/RTDsMIRCI7vqqQas00P1ECkoWfUHN3WO6EWD7qo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YeA1yV48zylkU+UoL14P7pvGkQ+qMuG0tUSbp2zY7Dq8WKyGvHhi2rbDc1Bf+FXJj
 Z69YGzkcyjYttgVYY2aYdC+q2sU6kK58UkVS0/Q5Nsp9mSXn0A6ZC/vCEgKex+EnOV
 ftjpmjms3nLXZW7v+HEmGV/X0835bGSFH65GuuxZVnWLdj5PIc2HrL3bVdwt26DEM9
 0bdapkaJlSEX3yUJtUM1UQvhl1oedeC2tYaMeiQK909uu/72tzJz98vz28cU6iCAI7
 wAVID/hf2NLU8zvoSIOjnhGmzkyUAZodfIcKxXBJIjTuRQZkdxqa4gaVKjtVTsmcbA
 J9Pvl19VZfVGg==
From: Bjorn Andersson <andersson@kernel.org>
To: freedreno@lists.freedesktop.org, bryan.odonoghue@linaro.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v6 00/18] mdss-dsi-ctrl binding and dts fixes
Date: Thu, 29 Dec 2022 11:23:22 -0600
Message-Id: <167233461766.1099840.17628700245792986354.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
References: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
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
Cc: dianders@chromium.org, krzysztof.kozlowski+dt@linaro.org, sean@poorly.run,
 dri-devel@lists.freedesktop.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, robh+dt@kernel.org, swboyd@chromium.org,
 agross@kernel.org, david@ixit.cz, dmitry.baryshkov@linaro.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 23 Dec 2022 02:10:07 +0000, Bryan O'Donoghue wrote:
> V6:
> - Squashes a number of patches per Krzysztof's comments on bisectability
> - Adds in Acked-by Rob and Krzysztof
> 
> V5:
> - Adds compat strings to bindings/display/msm/qcom,SoC-mdss.yaml - Dmitry
> - Re-orders simple fixes to the start of the series to allow backports - Dmitry
> - VDDA and drop of node-names - Krzysztof
> - Deprecates qcom,dsi-ctrl-6g-qcm2290 - Krzysztof, Dmitry
> - Expands set of updated files to include new msm8953 - bod
> - Converts to agreed compat string qcom,SoC-dsi-ctrl hence
>   -              - qcom,mdss-dsi-ctrl-msm8996
>   +              - qcom,msm8996-dsi-ctrl
> - Adds RB where indicated for the compat strings.
> V4:
> - Moves the update of the example from patch #5 to patch #4
> 
> [...]

Applied, thanks!

[10/18] arm64: dts: qcom: msm8916: Add compat qcom,msm8916-dsi-ctrl
        commit: cd8cecc723671016a28f88ab13ee31642cb9e391
[11/18] arm64: dts: qcom: msm8953: Add compat qcom,msm8953-dsi-ctrl
        commit: 634ecbc6b17ac2beea4d64f84df629520306e8cc
[12/18] arm64: dts: qcom: msm8996: Add compat qcom,msm8996-dsi-ctrl
        commit: 5ebe4191286add92e8560915aaeb803578407f12
[13/18] arm64: dts: qcom: sc7180: Add compat qcom,sc7180-dsi-ctrl
        commit: a45d0641d110e81826710aa92711e1c2eedecb43
[14/18] arm64: dts: qcom: sc7280: Add compat qcom,sc7280-dsi-ctrl
        commit: 5b5e4ac378e5d2b1f881c8a6ea0ae827201ee07d
[15/18] arm64: dts: qcom: sdm630: Add compat qcom,sdm660-dsi-ctrl
        commit: 197d28d46315353cfc91d8519b8b561ab08a02cc
[16/18] arm64: dts: qcom: sdm660: Add compat qcom,sdm660-dsi-ctrl
        commit: 3381020a778c559c95e31af6d868ad059fbd65e8
[17/18] arm64: dts: qcom: sdm845: Add compat qcom,sdm845-dsi-ctrl
        commit: a1a685c312f5bcc6fbf35b647d3bc5cfc6f70c7d
[18/18] arm64: dts: qcom: sm8250: Add compat qcom,sm8250-dsi-ctrl
        commit: ff114e399e746e07df56bad1b4aaf540f37d579d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
