Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FC6658588
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 19:14:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8069410E3E5;
	Wed, 28 Dec 2022 18:13:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740B510E3CE;
 Wed, 28 Dec 2022 18:13:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D3BD3B818B7;
 Wed, 28 Dec 2022 18:13:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D8ECC433EF;
 Wed, 28 Dec 2022 18:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672251227;
 bh=vAo070a0jAGDolutvmQrHXsrQbuhIo5yLBOr+7FrUrE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FfCU35iOXm/SFi6xQxJJLluqgrtQ/caDiJjrWGtMi4dLgwkcxnPVkLbJ5aR+kufPl
 PY2G/Gh56qofZlNZrxKouiqChtdnm8oZDCwlLwa+Z3qY3LHWuzUZUwo/y47fcUesEA
 xxXtbV1RC+NVl5ePrxEL2tNULPUaEu96ntnXQ2ARBMaLiGh3yZzcSPrhwSSMJATZ0B
 qOLUu7t+9HmrqJqJZZHqZsidyUyZoCmf2yHW7fTfrfR573QSP4g7msvA8Dxg4O5sRt
 tZKSe8js7QKupd9uyiZvl6w2rMZyBegkGD7YpWjJ3mcufRYJ7hIYTJeScNHr/smPnr
 3aoruT2u1Iaog==
From: Bjorn Andersson <andersson@kernel.org>
To: dmitry.baryshkov@linaro.org, quic_abhinavk@quicinc.com,
 robdclark@gmail.com, robh+dt@kernel.org, konrad.dybcio@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, sean@poorly.run, agross@kernel.org
Subject: Re: [PATCH v4 0/5] arm64: dts: qcom: sm8450-hdk: enable HDMI output
Date: Wed, 28 Dec 2022 12:13:41 -0600
Message-Id: <167225121528.949655.5387408578769393815.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221207012803.114959-1-dmitry.baryshkov@linaro.org>
References: <20221207012803.114959-1-dmitry.baryshkov@linaro.org>
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

On Wed, 7 Dec 2022 03:27:58 +0200, Dmitry Baryshkov wrote:
> Add device tree nodes for MDSS, DPU and DSI devices on Qualcomm SM8450
> platform. Enable these devices and add the HDMI bridge configuration on
> SM8450 HDK.
> 
> Changes since v3:
> - Renamed mdss node to display-subsystem@ (Krzysztof)
> - Dropped empty line from the patch4 (Krzysztof)
> - Renamed HDMI connector endpoint to hdmi_connector_out
> 
> [...]

Applied, thanks!

[1/5] arm64: dts: qcom: sm8450: add RPMH_REGULATOR_LEVEL_LOW_SVS_D1
      commit: a5ac24ba17590866cf1ff8fe44cd2738c003d52f
[2/5] arm64: dts: qcom: sm8450: add display hardware devices
      commit: a6dd1206e45a43d7e6c46435437307b051471b69
[3/5] arm64: dts: qcom: sm8450-hdk: enable display hardware
      commit: 928a7b4269634369b152342a37b2809d18774726
[4/5] arm64: dts: qcom: sm8450-hdk: Add LT9611uxc HDMI bridge
      commit: 0cbe8e1953e083f8435bdb5548c3ba59acfcb97e
[5/5] arm64: dts: qcom: sm8450-hdk: Enable HDMI Display
      commit: 0f48b65f716b4fa806fa864ea7f750113f4bd7c9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
