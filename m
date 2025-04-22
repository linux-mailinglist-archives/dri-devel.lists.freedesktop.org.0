Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6833BA96D0F
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 15:38:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C6310E1DB;
	Tue, 22 Apr 2025 13:38:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="H2du47yr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A2A10E1DB;
 Tue, 22 Apr 2025 13:38:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 888EA5C077F;
 Tue, 22 Apr 2025 13:36:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15A7EC4CEE9;
 Tue, 22 Apr 2025 13:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745329131;
 bh=CkhGofHYVtZe5hwWpqyifYoxIzURV+H5yr2M2EHIPvQ=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=H2du47yr54JJf2eJXq1fEyDIO61CAboibIcuOQ7VcI+rIdG2W1wJgmQrhvBmEaGKs
 hmIhFHGC4C07bWoPtdDTwxQ1BxF5j+3vwVBOmai2Eh/bRpeD3Ms/d8/YvJiniutJR6
 G3sB9QpbxaidBuAO8Or2Oe5SpWZ9/DyionsQfwL7+GY1pt138NaGRoh6m3qtAgDZwO
 Tx0odcrYGghj1dofU4kYtKvA1qENMWaLrhXqbC2I7HbHEAqcGvoH0U5Z6I+14j07n5
 EeZGKZdtB+OYr4H6DDgvVn8hK6MfMAwYZpfJD6lC+OVlTPB5rIgrQ/0TXUKVUpGas3
 GWGodsm8oA0rQ==
Date: Tue, 22 Apr 2025 08:38:49 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Daniil Titov <daniilt971@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, iommu@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, 
 Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, 
 Sireesh Kodali <sireeshkodali@protonmail.com>, linux-clk@vger.kernel.org, 
 Thomas Zimmermann <tzimmermann@suse.de>, Joerg Roedel <joro@8bytes.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, David Airlie <airlied@gmail.com>, 
 Srinivas Kandagatla <srini@kernel.org>, Lee Jones <lee@kernel.org>, 
 linux@mainlining.org, phone-devel@vger.kernel.org, 
 Robin Murphy <robin.murphy@arm.com>, Stephan Gerhold <stephan@gerhold.net>, 
 linux-arm-msm@vger.kernel.org, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Adam Skladowski <a_skl39@protonmail.com>, Sean Paul <sean@poorly.run>, 
 freedreno@lists.freedesktop.org, Simona Vetter <simona@ffwll.ch>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Dang Huynh <danct12@riseup.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 devicetree@vger.kernel.org
To: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
In-Reply-To: <20250421-msm8937-v5-0-bf9879ef14d9@mainlining.org>
References: <20250421-msm8937-v5-0-bf9879ef14d9@mainlining.org>
Message-Id: <174532908923.1111892.11576927834327283251.robh@kernel.org>
Subject: Re: [PATCH v5 0/5] Initial support of MSM8937 and Xiaomi Redmi 3S
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


On Mon, 21 Apr 2025 22:18:22 +0200, Barnabás Czémán wrote:
> This patch series add initial support for MSM8937 SoC
> and Xiaomi Redmi 3S (land).
> 
> The series is extending the MSM8917 gcc and pinctrl drivers
> because they are sibling SoCs.
> MSM8937 have 4 more A53 cores and have one more dsi port then
> MSM8917.
> It implements little-big architecture and uses Adreno 505.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
> Changes in v5:
> - msm8937:
>   - Remove wrongly defined idle-states.
>   - Fix thermal zones.
>   - Use the header with DSI phy clock IDs.
>   - Fix the nodes order.
>   - Fix the pinctrls style.
>   - Follow gcc header changes.
> - msm8937-xiaomi-land:
>   - Remove headphone switch and speaker amplifier bindings.
>   - Unify status property style.
> - gcc bindings:
>   - Expand MSM8953 gcc schema with MSM8937.
>   - Add MSM8937 prefix for MSM8937 specific clocks.
> - gcc:
>   - Follow the bindings changes.
> - Drop alwayson clock documentation it will be handled in another
>   patchset.
> - Link to v4: https://lore.kernel.org/r/20250315-msm8937-v4-0-1f132e870a49@mainlining.org
> 
> Changes in v4:
> - Add missing rpmcc include for qcom,gcc-msm8937 dtbinding exmaple.
> - msm8937: add missing space after s9-p1@230
> - msm8937-xiaomi-land: replace LED_FUNCTION_INDICATOR to LED_FUNCTION_STATUS
> - Remove applied patches
> - Link to v3: https://lore.kernel.org/r/20250224-msm8937-v3-0-dad7c182cccb@mainlining.org
> 
> Changes in v3:
> - Fix qcom,gcc-msm8937 dtbinding example
> - Link to v2: https://lore.kernel.org/r/20250223-msm8937-v2-0-b99722363ed3@mainlining.org
> 
> Changes in v2:
> - drop applied patches
> - drop gcc schema commits infavor of a new schema for gcc-msm8937
> - document always on clock for adreno 505/506/510
> - msm8937:
>   - set cache size
>   - rename cpu labels
>   - fix style issues addressed by review
> - msm8937-xiaom-land:
>   - remove unused serial0 alias
>   - remove regulator-always-on from pm8937_l6
>   - add blue indicator led for aw2013
> - Link to v1: https://lore.kernel.org/r/20250211-msm8937-v1-0-7d27ed67f708@mainlining.org
> 
> ---
> Barnabás Czémán (3):
>       dt-bindings: clock: qcom: Add MSM8937 Global Clock Controller
>       dt-bindings: arm: qcom: Add Xiaomi Redmi 3S
>       arm64: dts: qcom: Add Xiaomi Redmi 3S
> 
> Dang Huynh (1):
>       arm64: dts: qcom: Add initial support for MSM8937
> 
> Daniil Titov (1):
>       clk: qcom: gcc: Add support for Global Clock controller found on MSM8937
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml    |    7 +
>  .../bindings/clock/qcom,gcc-msm8953.yaml           |   11 +-
>  arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>  arch/arm64/boot/dts/qcom/msm8937-xiaomi-land.dts   |  381 ++++
>  arch/arm64/boot/dts/qcom/msm8937.dtsi              | 2069 ++++++++++++++++++++
>  drivers/clk/qcom/Kconfig                           |    6 +-
>  drivers/clk/qcom/gcc-msm8917.c                     |  617 +++++-
>  include/dt-bindings/clock/qcom,gcc-msm8917.h       |   19 +
>  8 files changed, 3101 insertions(+), 10 deletions(-)
> ---
> base-commit: 5b37f7bfff3b1582c34be8fb23968b226db71ebd
> change-id: 20250210-msm8937-228ef0dc3ec9
> 
> Best regards,
> --
> Barnabás Czémán <barnabas.czeman@mainlining.org>
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
 Base: using specified base-commit 5b37f7bfff3b1582c34be8fb23968b226db71ebd

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250421-msm8937-v5-0-bf9879ef14d9@mainlining.org:

arch/arm64/boot/dts/qcom/msm8937-xiaomi-land.dtb: gpu@1c00000 (qcom,adreno-505.0): clock-names:5: 'alwayson' is not one of ['core', 'iface', 'mem', 'mem_iface', 'alt_mem_iface', 'gfx3d', 'rbbmtimer', 'rbcpr']
	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml#





