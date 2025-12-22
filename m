Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C06BECD4A88
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 04:51:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C82010E4F0;
	Mon, 22 Dec 2025 03:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aygTOXkt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4494E10E4EF
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 03:51:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1AB68442EE;
 Mon, 22 Dec 2025 03:51:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9189C2BC86;
 Mon, 22 Dec 2025 03:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766375470;
 bh=nBw4PryBF6Gkq2ZTd+pa+4krsc8cXuhOR+oVgs3t3nQ=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=aygTOXktrIzznVoXoMNBvAg3QKFh5l+Hh6nAr5udJIcDly4x4hAcJInuwpLBVooFr
 gR/BQD3k8YX+FLjljPDmd3pRWQd8rw6Thcmzs7VrMTTDlr8+LeZd6/WUCNlZ8bCuBW
 RnAbv/A3SQxg1dbcENo42hfMuYDx3kRkr7kIY0GegdgfTv0JAvwrcbeFtK6X4rCV8M
 pLMWGSM7EDSrZzGKRrg/3aHIEAJU11QCB/inWfMaWHcczeX1GUkBwJm6ciYD9DbksX
 EjdZQoYvDnu+dBzZjZIDDIq6Xn57CI/18B5dw1yafhwq6mGIhAZviA+FpXzK/C9tvp
 hyhE15gS8GRMQ==
Date: Sun, 21 Dec 2025 21:51:09 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, devicetree@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, David Airlie <airlied@gmail.com>, 
 Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
 Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Martin Botka <martin.botka@somainline.org>, Sam Ravnborg <sam@ravnborg.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
In-Reply-To: <20251222-drm-panels-sony-v2-8-82a87465d163@somainline.org>
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
 <20251222-drm-panels-sony-v2-8-82a87465d163@somainline.org>
Message-Id: <176637546656.2070861.2818143516982857920.robh@kernel.org>
Subject: Re: [PATCH v2 08/11] dt-bindings: display: panel: Describe Samsung
 SOUXP00-A DDIC
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


On Mon, 22 Dec 2025 00:32:14 +0100, Marijn Suijten wrote:
> Document the Samsung SOUXP00-A Display-Driver-IC and 11644x3840@60Hz
> 6.5" DSI command-mode panels found in the Sony Xperia 1 with amb650wh01
> panel and Sony Xperia 1 II with amb650wh07 panel. It requires Display
> Stream Compression 1.1.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  .../bindings/display/panel/samsung,souxp00-a.yaml  | 79 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 84 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/samsung,sofef01-m.example.dtb: panel@0 (samsung,sofef01-m-amb609tc01): 'vci-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/panel/samsung,sofef01-m.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20251222-drm-panels-sony-v2-8-82a87465d163@somainline.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

