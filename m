Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2211CB131C1
	for <lists+dri-devel@lfdr.de>; Sun, 27 Jul 2025 22:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EACE410E31D;
	Sun, 27 Jul 2025 20:27:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jq5JtLZE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A54B10E09C
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 20:27:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2206F44124;
 Sun, 27 Jul 2025 20:27:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFCCEC4CEEF;
 Sun, 27 Jul 2025 20:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753648065;
 bh=dRmKTiw1fab4d1US1qUGI0FYfA7qFL9ZBkYLrxz0Ggc=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=jq5JtLZEZpLoCNWFTg+zyA6D89n/H1dyZw3w1qZbULqPLAxOSoJemrH0NHFYWcYR8
 m2PbU+k6BVHaas8uwmq2yiUr1lLcSH67hMd2QB2PFFn8YgjzrDmXAGZBxo/0YCGUOj
 nS8IC4yAr/u3V6dujSb4H4od8rJgzO280UBhct+GDvjLbSdqxjV0zNDkKYCJyhx3m+
 19IknIcUtPOw0HhHcmRMArA3z/062HBkg43Py2FvAX83n1O9flKfEs2MSD7i0J2NKH
 UoUrlfO/20L7950bYyElqd5459B7duUsjhjAODcWxHFWMSvSvjQMio/UsFRKL8LHy4
 Bvnv50yD5h4LQ==
Date: Sun, 27 Jul 2025 15:27:44 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, CK Hu <ck.hu@mediatek.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, dri-devel@lists.freedesktop.org, 
 David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org, 
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
To: Jay Liu <jay.liu@mediatek.com>
In-Reply-To: <20250727071609.26037-8-jay.liu@mediatek.com>
References: <20250727071609.26037-1-jay.liu@mediatek.com>
 <20250727071609.26037-8-jay.liu@mediatek.com>
Message-Id: <175364805939.3229.16063506192573561035.robh@kernel.org>
Subject: Re: [PATCH v2 7/7] dt-bindings: display: mediatek: gamma: Add
 support for MT8196
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


On Sun, 27 Jul 2025 15:15:57 +0800, Jay Liu wrote:
> Add a compatible string for the GAMMA IP found in the MT8196 SoC.
> Each GAMMA IP of this SoC is fully compatible with the ones found
> in MT8195.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Jay Liu <jay.liu@mediatek.com>
> Signed-off-by: 20220315152503 created <jay.liu@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml     | 1 +
>  1 file changed, 1 insertion(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250727071609.26037-8-jay.liu@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

