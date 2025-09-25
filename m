Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A60B9FDCA
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 16:12:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E7F10E962;
	Thu, 25 Sep 2025 14:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UU0T3pc0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449C310E95A
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 14:12:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 43FF5605D4;
 Thu, 25 Sep 2025 14:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDB9CC4CEF7;
 Thu, 25 Sep 2025 14:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758809554;
 bh=1vyxGwtjiGL2rnIKM6Bn8m6jVXq/TnHR8oRRcP/oPJk=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=UU0T3pc0FF2wFfPhEKXpDoO4w8nYaCrUtjVf70Pa44wSxk8fBHg56SaET3X4tOaBq
 PnOkMCB87iPNPQTC7OdoziohljObnYjhcirEUzoi2B7KJxGAxe5eL4UkekJIVw1h3b
 y5DnlDt5qw/CUxmTrbDvdReJVrNIGzwXeI98zwY+YkqSCvy0G/aZpq7tmFJZfIISU0
 taP8MTsn6JA3NPFpFEp5cD645iJ6VUYQo80pPgNxHEs5R8KCwnlxjgciwdTqEKB3II
 Lvl5FeXi8rAFWZp0rHj+RgHTeLGaAdm9pg4GHm7rCvTMbhEy8UEt78eryhcVRUUkDg
 15OBR0plyNQhw==
Date: Thu, 25 Sep 2025 09:12:34 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Casey Connolly <casey.connolly@linaro.org>, 
 Sam Ravnborg <sam@ravnborg.org>, Simona Vetter <simona@ffwll.ch>, 
 devicetree@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 David Airlie <airlied@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org
To: David Heidelberg <david@ixit.cz>
In-Reply-To: <20250925-s6e3fc2x01-v1-0-9293016768f7@ixit.cz>
References: <20250925-s6e3fc2x01-v1-0-9293016768f7@ixit.cz>
Message-Id: <175880949068.820285.11045140052982213642.robh@kernel.org>
Subject: Re: [PATCH 0/8] Add OnePlus 6T display (Samsung S6E3FC2X01 DDIC
 with AMS641RW panel)
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


On Thu, 25 Sep 2025 11:12:46 +0200, David Heidelberg wrote:
> This patchset enables display on the OnePlus 6T smartphone.
> 
> Minor adjust to the device-tree of OnePlus 6 had to be done
> to properly document reset GPIO used. Also same adjustments
> had been done to the sofef00 panel driver (used by OnePlus 6).
> 
> In the last step new DDIC driver is introduced together with AMS641RW
> panel sequences.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Casey Connolly (1):
>       arm64: dts: qcom: sdm845-oneplus: Describe panel vci and poc supplies
> 
> David Heidelberg (7):
>       dt-bindings: panel: Add Samsung S6E3FC2X01 DDIC with panel
>       dt-bindings: display: panel-simple-dsi: Remove Samsung S6E3FC2 compatible
>       arm64: dts: qcom: sdm845-oneplus-fajita: Reflect used panel in compatible
>       arm64: dts: qcom: sdm845-oneplus: Correct panel reset gpio polarity
>       arm64: dts: qcom: sdm845-oneplus: Document TE gpio
>       drm/panel: samsung-sofef00: Invert reset gpio polarity
>       drm/panel: Add Samsung S6E3FC2X01 DDIC with AMS641RW panel
> 
>  .../bindings/display/panel/panel-simple-dsi.yaml   |   2 -
>  .../bindings/display/panel/samsung,s6e3fc2x01.yaml |  77 ++++
>  MAINTAINERS                                        |   6 +
>  .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |  31 +-
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts |   2 +-
>  drivers/gpu/drm/panel/Kconfig                      |  13 +
>  drivers/gpu/drm/panel/Makefile                     |   1 +
>  drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c   | 404 +++++++++++++++++++++
>  drivers/gpu/drm/panel/panel-samsung-sofef00.c      |  10 +-
>  9 files changed, 536 insertions(+), 10 deletions(-)
> ---
> base-commit: ce7f1a983b074f6cf8609068088ca3182c569ee4
> change-id: 20250923-s6e3fc2x01-f9550b822fe5
> 
> Best regards,
> --
> David Heidelberg <david@ixit.cz>
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
 Base: using specified base-commit ce7f1a983b074f6cf8609068088ca3182c569ee4

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250925-s6e3fc2x01-v1-0-9293016768f7@ixit.cz:

arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: panel@0 (samsung,sofef00): 'poc-supply', 'te-gpios', 'vci-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-dsi.yaml#





