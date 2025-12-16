Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C10CC0E08
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 05:27:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A43C110E06F;
	Tue, 16 Dec 2025 04:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XPtzu4Km";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF92310E06F
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 04:27:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2C31640125;
 Tue, 16 Dec 2025 04:27:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB510C4CEF1;
 Tue, 16 Dec 2025 04:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765859222;
 bh=MrTitMKqptuihX2NlWXSwG9vLpTcBZxq3XR3eaBqBDk=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=XPtzu4KmLPhac4N164hbXQSTeNdV7tj4OPq+Z4k6/Yo4/ky15wSt98inxnezUYX20
 kxy7UU6G4B5PHUmMjcwJ2Sm/61rMVYBZD98tXn4/CZu3yy7FEVwPGSU8jxKWPSFWPk
 8wTx1P3dDEv1V0NmJwqHIRCwlZQuuChJLw/Qng7KaW/8hYtq71VWvx9e23C2vBcvSz
 j/Xtz3OCHiK/U6/CLL3Hn940cfCNnVPAs/cmnriPIcFPgFYVW6XRxZyuRx0J9KaFC0
 xg6pEk4n+IWcDwlgKRfbjp28B4/+geV1utUEvJZGmWulZfhGTnSqof1ZGwCOUVKohl
 fzzlQzjA1cQbw==
Date: Mon, 15 Dec 2025 22:26:59 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Conor Dooley <conor+dt@kernel.org>, Kenneth Hung <kenneth.Hung@ite.com.tw>, 
 Pin-yen Lin <treapking@google.com>, Robert Foss <rfoss@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Hermes Wu <hermes.Wu@ite.com.tw>, 
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
To: Pet Weng <pet.weng@ite.com.tw>
In-Reply-To: <20251216-it61620-0714-v4-1-9d2fea7847ae@ite.com.tw>
References: <20251216-it61620-0714-v4-0-9d2fea7847ae@ite.com.tw>
 <20251216-it61620-0714-v4-1-9d2fea7847ae@ite.com.tw>
Message-Id: <176585921916.796400.11631028194091184487.robh@kernel.org>
Subject: Re: [PATCH v4 1/3] dt-binding: display: Add ITE IT61620 MIPI DSI
 to HDMI bridge
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


On Tue, 16 Dec 2025 10:51:49 +0800, Pet Weng wrote:
> This chip receives MIPI DSI input and outputs HDMI, and is commonly
> connected to SoCs via I2C and DSI.
> 
> Signed-off-by: Pet Weng <pet.weng@ite.com.tw>
> ---
>  .../bindings/display/bridge/ite,it61620.yaml       | 140 +++++++++++++++++++++
>  1 file changed, 140 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/bridge/ite,it61620.yaml: port@0: Missing additionalProperties/unevaluatedProperties constraint

/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/bridge/ite,it61620.yaml: endpoint: Missing additionalProperties/unevaluatedProperties constraint

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20251216-it61620-0714-v4-1-9d2fea7847ae@ite.com.tw

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

