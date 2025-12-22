Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61315CD4A85
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 04:51:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6922210E4EF;
	Mon, 22 Dec 2025 03:51:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YhAXZAHn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F60B10E4EF
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 03:51:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 013AA43C7F;
 Mon, 22 Dec 2025 03:51:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF00DC4CEF1;
 Mon, 22 Dec 2025 03:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766375468;
 bh=MEeM6tsBj/3OM0kMlSaegn17vrVHhDO+vGFmkDp5jfI=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=YhAXZAHn59YGF3vYDo9h4YGMPJPZb4FhTZtscifBLXf8G+eQUcp/djn3ybWpHEI8x
 bN0LrzOM8HMviDlrA31rg8cgWZiCysgmXWgGUkPmuyZfksEnqoJhWqjn1MsjG5of6a
 BcQo90YfbTnqDvE5SdwLiL0o6yc4iFd4rY6L+EQ7OCVR0fFI8StYaSMYqvWtg2XQ4Y
 8TLJncqEwGZTJADQxeXpLd8fb4U3M8QJK90Wr3puK1hcTcarvYiRh8T0qM0aYc+7/V
 mXpSrQfNWX073cpXsKPAf+oayxf1Rz3tEbfOuiJpvbmC7XTGTgdAGP3nORPG9Rk5xL
 6nxUQQ6E20/cA==
Date: Sun, 21 Dec 2025 21:51:07 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jami Kettunen <jami.kettunen@somainline.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Andy Gross <agross@kernel.org>, 
 devicetree@vger.kernel.org, Jessica Zhang <jesszhan0024@gmail.com>, 
 linux-arm-msm@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 dri-devel@lists.freedesktop.org, Martin Botka <martin.botka@somainline.org>, 
 Conor Dooley <conor+dt@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
In-Reply-To: <20251222-drm-panels-sony-v2-6-82a87465d163@somainline.org>
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
 <20251222-drm-panels-sony-v2-6-82a87465d163@somainline.org>
Message-Id: <176637546557.2070819.6982338294442639019.robh@kernel.org>
Subject: Re: [PATCH v2 06/11] dt-bindings: display: panel: Describe Samsung
 SOFEF03-M DDIC
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


On Mon, 22 Dec 2025 00:32:12 +0100, Marijn Suijten wrote:
> Document the Samsung SOFEF03-M Display-Driver-IC and 1080x2520@120Hz DSI
> command-mode panels found in the Sony Xperia 5 II and Sony Xperia 5 III.
> It requires Display Stream Compression 1.1 which allows the panels to be
> driven at 120Hz, even though a 60Hz mode is available too.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  .../bindings/display/panel/samsung,sofef03-m.yaml  | 79 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 84 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/samsung,sofef01-m.example.dtb: panel@0 (samsung,sofef01-m-amb609tc01): 'vci-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/panel/samsung,sofef01-m.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20251222-drm-panels-sony-v2-6-82a87465d163@somainline.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

