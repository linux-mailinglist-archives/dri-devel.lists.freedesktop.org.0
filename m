Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1469BCD4A92
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 04:51:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 749C510E4F1;
	Mon, 22 Dec 2025 03:51:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ByEwSWJC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE8B310E4F0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 03:51:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C2B1C60127;
 Mon, 22 Dec 2025 03:51:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49B80C113D0;
 Mon, 22 Dec 2025 03:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766375471;
 bh=bmZtYfujMFG4w/cR+R5ItWw4bZeevnK8Lo5r2PAD8ys=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=ByEwSWJCLdRrdAp6Sq/q2e9XkscSVPpC2fZlFw5EUGMSpfWcZ3VSPAwBHXiSb0L5M
 89a3DqsLXrKohyzANQx1Lr62g6fLwMSRbn1c03iQu9pUYNim+88xyHmAlPjBEDJ7d/
 WIW3Ppkp5N7yq9gVVw1vj5kezF7+dpUnpo8oXZAbrug/1a9sBDVbuGkem5QC5AFIch
 AWgW1e5XN6jV7wog/DjsWXCFXYyo8KesHY7i1YeQOsvXt306TzyEhS2rcoEevV+J30
 vglNciEiqSQx8BeAnyBtYG8s8vBts8jGFFV4CdxHoVT5O+kyi48hPm/ik79fqGkOy3
 MarP4YHGoLz5w==
Date: Sun, 21 Dec 2025 21:51:10 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov <lumag@kernel.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Martin Botka <martin.botka@somainline.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Simona Vetter <simona.vetter@ffwll.ch>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Sam Ravnborg <sam@ravnborg.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
In-Reply-To: <20251222-drm-panels-sony-v2-10-82a87465d163@somainline.org>
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
 <20251222-drm-panels-sony-v2-10-82a87465d163@somainline.org>
Message-Id: <176637546768.2070916.15396482062955238978.robh@kernel.org>
Subject: Re: [PATCH v2 10/11] dt-bindings: display: panel: Describe Samsung
 ANA6707 DDIC
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


On Mon, 22 Dec 2025 00:32:16 +0100, Marijn Suijten wrote:
> The ANA6707 Display-Driver-IC is paired with the amb650yl01 panel in the
> Sony Xperia 1 III, Sony Xperia 1 IV and Sony Xperia V smartphones.  It
> uses Display Stream Compression 1.1 and requires dual DSI interfaces to
> satisfy the bandwidth requirements to run at 1644x3840 at 120Hz.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  .../bindings/display/panel/samsung,ana6707.yaml    | 91 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 96 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/samsung,sofef01-m.example.dtb: panel@0 (samsung,sofef01-m-amb609tc01): 'vci-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/panel/samsung,sofef01-m.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/samsung,ana6707.example.dtb: panel@0 (samsung,ana6707-amb650yl01): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/panel/samsung,ana6707.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/samsung,ana6707.example.dtb: panel@0 (samsung,ana6707-amb650yl01): 'port' is a required property
	from schema $id: http://devicetree.org/schemas/display/panel/samsung,ana6707.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20251222-drm-panels-sony-v2-10-82a87465d163@somainline.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

