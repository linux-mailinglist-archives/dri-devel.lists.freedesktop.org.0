Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 855C4ACAE0A
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 14:26:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE74210E50F;
	Mon,  2 Jun 2025 12:26:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RzquBAEz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9992E10E50D;
 Mon,  2 Jun 2025 12:26:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 31439A4FFFA;
 Mon,  2 Jun 2025 12:26:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65868C4CEEB;
 Mon,  2 Jun 2025 12:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748867209;
 bh=BU1DO3UgGine08a8FZzXzI0sAWgluBet8Brwqo+5w08=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=RzquBAEzALR5zIF3IKm4Qs2ubTUn05wHI7xuUHAN/u+mWYAIE1yp6xBw1M/RSbSkr
 GgNfjy3HtXmV+j2kioxdN9Iq/tau5qMXTP3Jskcl/cTBO9bpZ0cxKJWlsd29hhvhxV
 JvgjCOApRg8uxy/GP3OT6JH51Yf3+TjRSyR1CprWzqpY0nJiQ1Pg/zZPAJ1XlJxs+K
 zN9Sv6zNnEqF6keTL4HJvYMtD0FfQzCIwSoksoTBAq1VacWyAIHcGWzQVCNLP4WzhI
 zn8C+v/UiUhXuZBuUnr/6nAEHV2Hc61CLNrscwqAHZVpqqCPLowc6uYkjjZfMU6oO+
 VKUII/KLy9JKw==
Date: Mon, 02 Jun 2025 07:26:47 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, 
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Maxime Ripard <mripard@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Mahadevan <quic_mahap@quicinc.com>, Danila Tikhonov <danila@jiaxyga.com>, 
 David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 linux-kernel@vger.kernel.org, Yongxing Mou <quic_yongmou@quicinc.com>, 
 freedreno@lists.freedesktop.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com>
References: <20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com>
Message-Id: <174886710440.952745.7947404650778942462.robh@kernel.org>
Subject: Re: [PATCH v2 0/5] dt-bindings: msm/dp: add support for pixel
 clock to driver another stream
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, 30 May 2025 10:47:23 -0700, Jessica Zhang wrote:
> On some MSM chipsets, the display port controller is capable of supporting
> two streams. To drive the second stream, the pixel clock for the
> corresponding stream needs to be enabled. In order to add the bindings for
> the pixel clock for the second stream, fixup the documentation of some of
> the bindings to clarify exactly which stream they correspond to, then add
> the new bindings and make corresponding changes to the relevant device
> trees.
> 
> ---
> Changes in v2:
> - Rebased on top of next-20250523
> - Dropped merged maintainer patch
> - Remove assigned-clock-parents from sm7150-mdss.yaml
> - Added a patch to make the corresponding dts change to add pixel 1
>   stream
> - Squashed pixel 0 and pixel 1 stream binding patches (Krzysztof)
> - Drop assigned-clock-parents bindings for dp-controller (Krzysztof)
> - Updated dp-controller.yaml to include all chipsets that support stream
>   1 pixel clock (Krzysztof)
> - Added missing minItems and if statement (Krzysztof)
> 
> ---
> Abhinav Kumar (4):
>       dt-bindings: Fixup x1e80100 to add DP MST support
>       dt-bindings: clock: Add SC7280 DISPCC DP pixel 1 clock binding
>       dt-bindings: display/msm: drop assigned-clock-parents for dp controller
>       dt-bindings: display/msm: add stream 1 pixel clock binding
> 
> Jessica Zhang (1):
>       arm64: dts: qcom: Add pixel 1 stream for displayport
> 
>  .../bindings/display/msm/dp-controller.yaml        | 45 +++++++++++---
>  .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 10 +--
>  .../bindings/display/msm/qcom,sar2130p-mdss.yaml   | 11 ++--
>  .../bindings/display/msm/qcom,sc7180-mdss.yaml     |  1 -
>  .../bindings/display/msm/qcom,sc7280-mdss.yaml     | 11 ++--
>  .../bindings/display/msm/qcom,sm7150-mdss.yaml     |  2 -
>  .../bindings/display/msm/qcom,x1e80100-mdss.yaml   | 18 +++---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi              | 26 +++++---
>  arch/arm64/boot/dts/qcom/sc8180x.dtsi              | 20 ++++--
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 72 +++++++++++++++-------
>  arch/arm64/boot/dts/qcom/sm8150.dtsi               | 10 ++-
>  arch/arm64/boot/dts/qcom/sm8350.dtsi               | 10 ++-
>  arch/arm64/boot/dts/qcom/sm8450.dtsi               | 10 ++-
>  arch/arm64/boot/dts/qcom/sm8650.dtsi               | 10 ++-
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 31 +++++++---
>  include/dt-bindings/clock/qcom,dispcc-sc7280.h     |  2 +
>  16 files changed, 197 insertions(+), 92 deletions(-)
> ---
> base-commit: daf70030586cf0279a57b58a94c32cfe901df23d
> change-id: 20241202-dp_mst_bindings-7536ffc9ae2f
> 
> Best regards,
> --
> Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: base-commit daf70030586cf0279a57b58a94c32cfe901df23d not known, ignoring
 Base: attempting to guess base-commit...
 Base: tags/next-20250530 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/sm7125-xiaomi-curtana.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: displayport-controller@ae90000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: displayport-controller@ae98000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: displayport-controller@ae9a000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: displayport-controller@aea0000 (qcom,sc8280xp-edp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): aux-bus: False schema does not allow {'panel': {'compatible': ['edp-panel'], 'enable-gpios': [[71, 74, 0]], 'power-supply': [[258]], 'pinctrl-0': [[259]], 'pinctrl-names': ['default'], 'port': {'endpoint': {'remote-endpoint': [[260]], 'phandle': 257}}}}
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): '#sound-dai-cells' is a required property
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): clocks: [[236, 2], [236, 45], [236, 47], [236, 50], [236, 51]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: edp@aea0000 (qcom,sc7280-edp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: displayport-controller@ae90000 (qcom,sc7280-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: displayport-controller@ae90000 (qcom,sc7280-dp): clocks: [[3, 1], [3, 7], [3, 11], [3, 14], [3, 15]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: displayport-controller@220a0000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: displayport-controller@220a0000 (qcom,sc8280xp-dp): clocks: [[147, 5], [147, 47], [147, 49], [147, 52], [147, 53]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: edp@aea0000 (qcom,sc7280-edp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: displayport-controller@ae90000 (qcom,sc7280-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: displayport-controller@ae90000 (qcom,sc7280-dp): clocks: [[356, 1], [356, 7], [356, 11], [356, 14], [356, 15]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: edp@aea0000 (qcom,sc7280-edp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: displayport-controller@ae90000 (qcom,sc7280-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: displayport-controller@ae90000 (qcom,sc7280-dp): clocks: [[334, 1], [334, 7], [334, 11], [334, 14], [334, 15]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: displayport-controller@ae90000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: displayport-controller@ae98000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: displayport-controller@ae9a000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): aux-bus: False schema does not allow {'panel': {'compatible': ['edp-panel'], 'power-supply': [[276]], 'phandle': 597, 'port': {'endpoint': {'remote-endpoint': [[277]], 'phandle': 275}}}}
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): '#sound-dai-cells' is a required property
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): clocks: [[254, 2], [254, 45], [254, 47], [254, 50], [254, 51]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): clocks: [[227, 0], [227, 12], [227, 18], [227, 21], [227, 26]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: displayport-controller@ae90000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: displayport-controller@ae98000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: displayport-controller@ae9a000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: displayport-controller@ae90000 (qcom,sm8550-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: displayport-controller@ae90000 (qcom,sm8550-dp): clocks: [[189, 2], [189, 12], [189, 15], [189, 18], [189, 19]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): aux-bus: False schema does not allow {'panel': {'compatible': ['samsung,atna45dc02', 'samsung,atna33xc20'], 'enable-gpios': [[275, 4, 0]], 'power-supply': [[276]], 'pinctrl-0': [[277]], 'pinctrl-names': ['default'], 'port': {'endpoint': {'remote-endpoint': [[278]], 'phandle': 274}}}}
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): '#sound-dai-cells' is a required property
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): clocks: [[253, 2], [253, 45], [253, 47], [253, 50], [253, 51]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: displayport-controller@ae90000 (qcom,sm8550-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: displayport-controller@ae90000 (qcom,sm8550-dp): clocks: [[205, 2], [205, 12], [205, 15], [205, 18], [205, 19]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtb: edp@aea0000 (qcom,sc7280-edp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtb: displayport-controller@ae90000 (qcom,sc7280-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtb: displayport-controller@ae90000 (qcom,sc7280-dp): clocks: [[354, 1], [354, 7], [354, 11], [354, 14], [354, 15]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: displayport-controller@aea0000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: displayport-controller@aea0000 (qcom,sc8280xp-dp): clocks: [[149, 5], [149, 47], [149, 49], [149, 52], [149, 53]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: displayport-controller@220a0000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: displayport-controller@220a0000 (qcom,sc8280xp-dp): clocks: [[124, 5], [124, 47], [124, 49], [124, 52], [124, 53]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: displayport-controller@ae90000 (qcom,sm8550-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: displayport-controller@ae90000 (qcom,sm8550-dp): clocks: [[198, 2], [198, 12], [198, 15], [198, 18], [198, 19]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dtb: displayport-controller@ae90000 (qcom,sm8350-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: edp@aea0000 (qcom,sc7280-edp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: displayport-controller@ae90000 (qcom,sc7280-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: displayport-controller@ae90000 (qcom,sc7280-dp): clocks: [[311, 1], [311, 7], [311, 11], [311, 14], [311, 15]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: displayport-controller@ae90000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: displayport-controller@ae98000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: displayport-controller@ae9a000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): aux-bus: False schema does not allow {'panel': {'compatible': ['samsung,atna45af01', 'samsung,atna33xc20'], 'enable-gpios': [[268, 4, 0]], 'power-supply': [[269]], 'pinctrl-0': [[270]], 'pinctrl-names': ['default'], 'port': {'endpoint': {'remote-endpoint': [[271]], 'phandle': 267}}}}
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): '#sound-dai-cells' is a required property
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): clocks: [[246, 2], [246, 45], [246, 47], [246, 50], [246, 51]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): clocks: [[195, 0], [195, 12], [195, 18], [195, 21], [195, 26]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): clocks: [[208, 0], [208, 12], [208, 18], [208, 21], [208, 26]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: displayport-controller@ae90000 (qcom,sm8550-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: displayport-controller@ae90000 (qcom,sm8550-dp): clocks: [[192, 2], [192, 12], [192, 15], [192, 18], [192, 19]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): clocks: [[208, 0], [208, 12], [208, 18], [208, 21], [208, 26]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb: displayport-controller@ae90000 (qcom,sm8150-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: displayport-controller@ae90000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: displayport-controller@ae98000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: displayport-controller@ae9a000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): clocks: [[258, 2], [258, 45], [258, 47], [258, 50], [258, 51]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: edp@aea0000 (qcom,sc7280-edp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: displayport-controller@ae90000 (qcom,sc7280-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: displayport-controller@ae90000 (qcom,sc7280-dp): clocks: [[356, 1], [356, 7], [356, 11], [356, 14], [356, 15]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: displayport-controller@ae90000 (qcom,sc8180x-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: displayport-controller@ae98000 (qcom,sc8180x-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: displayport-controller@ae9a000 (qcom,sc8180x-edp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): clocks: [[199, 0], [199, 12], [199, 18], [199, 21], [199, 26]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-idp.dtb: edp@aea0000 (qcom,sc7280-edp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-idp.dtb: displayport-controller@ae90000 (qcom,sc7280-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-idp.dtb: displayport-controller@ae90000 (qcom,sc7280-dp): clocks: [[337, 1], [337, 7], [337, 11], [337, 14], [337, 15]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: edp@aea0000 (qcom,sc7280-edp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: displayport-controller@ae90000 (qcom,sc7280-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: displayport-controller@ae90000 (qcom,sc7280-dp): clocks: [[366, 1], [366, 7], [366, 11], [366, 14], [366, 15]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-idp2.dtb: edp@aea0000 (qcom,sc7280-edp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-idp2.dtb: displayport-controller@ae90000 (qcom,sc7280-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-idp2.dtb: displayport-controller@ae90000 (qcom,sc7280-dp): clocks: [[342, 1], [342, 7], [342, 11], [342, 14], [342, 15]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm8150-mtp.dtb: displayport-controller@ae90000 (qcom,sm8150-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: edp@aea0000 (qcom,sc7280-edp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: displayport-controller@ae90000 (qcom,sc7280-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: displayport-controller@ae90000 (qcom,sc7280-dp): clocks: [[361, 1], [361, 7], [361, 11], [361, 14], [361, 15]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dtb: displayport-controller@ae90000 (qcom,sm8350-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: displayport-controller@ae90000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: displayport-controller@ae98000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: displayport-controller@ae9a000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): aux-bus: False schema does not allow {'panel': {'compatible': ['edp-panel'], 'power-supply': [[272]], 'backlight': [[273]], 'port': {'endpoint': {'remote-endpoint': [[274]], 'phandle': 271}}}}
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): '#sound-dai-cells' is a required property
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): clocks: [[250, 2], [250, 45], [250, 47], [250, 50], [250, 51]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: displayport-controller@ae90000 (qcom,sar2130p-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: displayport-controller@ae90000 (qcom,sar2130p-dp): clocks: [[120, 2], [120, 12], [120, 15], [120, 18], [120, 19]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dtb: edp@aea0000 (qcom,sc7280-edp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dtb: displayport-controller@ae90000 (qcom,sc7280-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dtb: displayport-controller@ae90000 (qcom,sc7280-dp): clocks: [[359, 1], [359, 7], [359, 11], [359, 14], [359, 15]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: displayport-controller@af54000 (qcom,sm8650-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: displayport-controller@ae90000 (qcom,sm8450-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: displayport-controller@ae90000 (qcom,sm8350-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: edp@aea0000 (qcom,sc7280-edp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: displayport-controller@ae90000 (qcom,sc7280-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: displayport-controller@ae90000 (qcom,sc7280-dp): clocks: [[362, 1], [362, 7], [362, 11], [362, 14], [362, 15]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): clocks: [[2, 0], [2, 12], [2, 18], [2, 21], [2, 26]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: displayport-controller@ae90000 (qcom,sm8450-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: displayport-controller@ae90000 (qcom,sm6350-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: displayport-controller@ae90000 (qcom,sm6350-dp): clocks: [[141, 1], [141, 7], [141, 11], [141, 14], [141, 15]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): clocks: [[2, 0], [2, 12], [2, 18], [2, 21], [2, 26]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sa8155p-adp.dtb: displayport-controller@ae90000 (qcom,sm8150-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: displayport-controller@ae90000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: displayport-controller@ae98000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: displayport-controller@ae9a000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): aux-bus: False schema does not allow {'panel': {'compatible': ['edp-panel'], 'power-supply': [[268]], 'port': {'endpoint': {'remote-endpoint': [[269]], 'phandle': 267}}}}
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): '#sound-dai-cells' is a required property
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): clocks: [[246, 2], [246, 45], [246, 47], [246, 50], [246, 51]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: edp@aea0000 (qcom,sc7280-edp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: displayport-controller@ae90000 (qcom,sc7280-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: displayport-controller@ae90000 (qcom,sc7280-dp): clocks: [[359, 1], [359, 7], [359, 11], [359, 14], [359, 15]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: displayport-controller@ae90000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: displayport-controller@ae98000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: displayport-controller@ae9a000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): aux-bus: False schema does not allow {'panel': {'compatible': ['samsung,atna56ac03', 'samsung,atna33xc20'], 'enable-gpios': [[261, 4, 0]], 'power-supply': [[262]], 'pinctrl-0': [[263]], 'pinctrl-names': ['default'], 'port': {'endpoint': {'remote-endpoint': [[264]], 'phandle': 260}}}}
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): '#sound-dai-cells' is a required property
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): clocks: [[239, 2], [239, 45], [239, 47], [239, 50], [239, 51]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb: displayport-controller@ae90000 (qcom,sm8150-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm8150-hdk.dtb: displayport-controller@ae90000 (qcom,sm8150-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-lte.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: displayport-controller@ae90000 (qcom,sc8180x-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: displayport-controller@ae98000 (qcom,sc8180x-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: displayport-controller@ae90000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: displayport-controller@ae9a000 (qcom,sc8180x-edp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: displayport-controller@ae98000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: displayport-controller@ae9a000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): aux-bus: False schema does not allow {'panel': {'compatible': ['edp-panel'], 'power-supply': [[276]], 'backlight': [[277]], 'phandle': 603, 'port': {'endpoint': {'remote-endpoint': [[278]], 'phandle': 275}}}}
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): '#sound-dai-cells' is a required property
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): clocks: [[254, 2], [254, 45], [254, 47], [254, 50], [254, 51]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: displayport-controller@ae90000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: displayport-controller@ae98000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: displayport-controller@ae9a000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): aux-bus: False schema does not allow {'panel': {'compatible': ['edp-panel'], 'power-supply': [[272]], 'backlight': [[273]], 'port': {'endpoint': {'remote-endpoint': [[274]], 'phandle': 271}}}}
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): '#sound-dai-cells' is a required property
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): clocks: [[250, 2], [250, 45], [250, 47], [250, 50], [250, 51]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-idp.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r10.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: displayport-controller@ae90000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: displayport-controller@ae98000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: displayport-controller@ae9a000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): aux-bus: False schema does not allow {'panel': {'compatible': ['edp-panel'], 'backlight': [[266]], 'power-supply': [[267]], 'port': {'endpoint': {'remote-endpoint': [[268]], 'phandle': 265}}}}
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): '#sound-dai-cells' is a required property
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): clocks: [[244, 2], [244, 45], [244, 47], [244, 50], [244, 51]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: edp@aea0000 (qcom,sc7280-edp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: displayport-controller@ae90000 (qcom,sc7280-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: displayport-controller@ae90000 (qcom,sc7280-dp): clocks: [[354, 1], [354, 7], [354, 11], [354, 14], [354, 15]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb: edp@aea0000 (qcom,sc7280-edp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb: displayport-controller@ae90000 (qcom,sc7280-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb: displayport-controller@ae90000 (qcom,sc7280-dp): clocks: [[345, 1], [345, 7], [345, 11], [345, 14], [345, 15]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb: edp@aea0000 (qcom,sc7280-edp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb: displayport-controller@ae90000 (qcom,sc7280-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb: displayport-controller@ae90000 (qcom,sc7280-dp): clocks: [[352, 1], [352, 7], [352, 11], [352, 14], [352, 15]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: edp@aea0000 (qcom,sc7280-edp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: displayport-controller@ae90000 (qcom,sc7280-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: displayport-controller@ae90000 (qcom,sc7280-dp): clocks: [[327, 1], [327, 7], [327, 11], [327, 14], [327, 15]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: displayport-controller@ae90000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: displayport-controller@ae98000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: displayport-controller@ae9a000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): aux-bus: False schema does not allow {'panel': {'compatible': ['samsung,atna45af01', 'samsung,atna33xc20'], 'enable-gpios': [[278, 4, 0]], 'power-supply': [[279]], 'pinctrl-0': [[280]], 'pinctrl-names': ['default'], 'port': {'endpoint': {'remote-endpoint': [[281]], 'phandle': 277}}}}
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): '#sound-dai-cells' is a required property
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): clocks: [[256, 2], [256, 45], [256, 47], [256, 50], [256, 51]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: displayport-controller@aea0000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: displayport-controller@aea0000 (qcom,sc8280xp-dp): clocks: [[145, 5], [145, 47], [145, 49], [145, 52], [145, 53]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: displayport-controller@220a0000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: displayport-controller@220a0000 (qcom,sc8280xp-dp): clocks: [[121, 5], [121, 47], [121, 49], [121, 52], [121, 53]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: displayport-controller@ae90000 (qcom,sm8550-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: displayport-controller@ae90000 (qcom,sm8550-dp): clocks: [[214, 2], [214, 12], [214, 15], [214, 18], [214, 19]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: displayport-controller@ae90000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: displayport-controller@ae98000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: displayport-controller@ae9a000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): aux-bus: False schema does not allow {'panel': {'compatible': ['edp-panel'], 'backlight': [[266]], 'power-supply': [[267]], 'port': {'endpoint': {'remote-endpoint': [[268]], 'phandle': 265}}}}
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): '#sound-dai-cells' is a required property
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: displayport-controller@aea0000 (qcom,x1e80100-dp): clocks: [[244, 2], [244, 45], [244, 47], [244, 50], [244, 51]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: displayport-controller@af54000 (qcom,sm8650-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: displayport-controller@aea0000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: displayport-controller@aea0000 (qcom,sc8280xp-dp): clocks: [[169, 5], [169, 47], [169, 49], [169, 52], [169, 53]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: edp@aea0000 (qcom,sc7280-edp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: displayport-controller@ae90000 (qcom,sc7280-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: displayport-controller@ae90000 (qcom,sc7280-dp): clocks: [[337, 1], [337, 7], [337, 11], [337, 14], [337, 15]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: displayport-controller@220a0000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: displayport-controller@220a0000 (qcom,sc8280xp-dp): clocks: [[144, 5], [144, 47], [144, 49], [144, 52], [144, 53]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dtb: displayport-controller@ae90000 (qcom,sm6350-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dtb: displayport-controller@ae90000 (qcom,sm6350-dp): clocks: [[127, 1], [127, 7], [127, 11], [127, 14], [127, 15]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb: displayport-controller@ae90000 (qcom,sm8150-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): clocks: [[195, 0], [195, 12], [195, 18], [195, 21], [195, 26]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: displayport-controller@af54000 (qcom,sm8650-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: displayport-controller@aea0000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: displayport-controller@aea0000 (qcom,sc8280xp-dp): clocks: [[150, 5], [150, 47], [150, 49], [150, 52], [150, 53]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: displayport-controller@220a0000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: displayport-controller@220a0000 (qcom,sc8280xp-dp): clocks: [[128, 5], [128, 47], [128, 49], [128, 52], [128, 53]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: displayport-controller@aea0000 (qcom,sc8280xp-edp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: displayport-controller@220a0000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: displayport-controller@220a0000 (qcom,sc8280xp-dp): clocks: [[139, 5], [139, 47], [139, 49], [139, 52], [139, 53]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-kb.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb: edp@aea0000 (qcom,sc7280-edp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb: displayport-controller@ae90000 (qcom,sc7280-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb: displayport-controller@ae90000 (qcom,sc7280-dp): clocks: [[357, 1], [357, 7], [357, 11], [357, 14], [357, 15]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx214.dtb: displayport-controller@ae90000 (qcom,sm8350-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: displayport-controller@ae90000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: displayport-controller@ae98000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: displayport-controller@ae9a000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: displayport-controller@aea0000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: displayport-controller@aea0000 (qcom,sc8280xp-dp): clocks: [[141, 5], [141, 47], [141, 49], [141, 52], [141, 53]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: displayport-controller@22090000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: displayport-controller@22098000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: displayport-controller@2209a000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: displayport-controller@220a0000 (qcom,sc8280xp-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: displayport-controller@220a0000 (qcom,sc8280xp-dp): clocks: [[118, 5], [118, 47], [118, 49], [118, 52], [118, 53]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: displayport-controller@ae90000 (qcom,sm8550-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: displayport-controller@ae90000 (qcom,sm8550-dp): clocks: [[185, 2], [185, 12], [185, 15], [185, 18], [185, 19]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm8350-mtp.dtb: displayport-controller@ae90000 (qcom,sm8350-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb: edp@aea0000 (qcom,sc7280-edp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb: displayport-controller@ae90000 (qcom,sc7280-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb: displayport-controller@ae90000 (qcom,sc7280-dp): clocks: [[352, 1], [352, 7], [352, 11], [352, 14], [352, 15]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: displayport-controller@ae90000 (qcom,sm8450-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: displayport-controller@ae90000 (qcom,sm8450-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sm7125-xiaomi-joyeuse.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r10.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: displayport-controller@ae90000 (qcom,sc7180-dp): 'assigned-clock-parents' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#





