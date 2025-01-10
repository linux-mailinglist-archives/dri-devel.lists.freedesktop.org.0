Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E9AA09294
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 14:54:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D5D410F0DE;
	Fri, 10 Jan 2025 13:54:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jrEHq1aY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD48010F0CA
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 13:54:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6AB9DA41F1A;
 Fri, 10 Jan 2025 13:52:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE1BC4CEE0;
 Fri, 10 Jan 2025 13:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736517259;
 bh=NBTIZIQ0O8n49LLcohw3ZpYmgZsM/wfukba/u1zNx2g=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=jrEHq1aYppMBXRT4k44Tx7XWe+sLU2aKhaiDX/HF1l+MTSrATFzayIePg7vLaDIT3
 yW8Uu/cBxhuUynb7dl+6VsE9ZXzQ+6EQaKeuB3Bsn6NeSh3+1xXoOLgw+EBQSTT3N0
 vNRQ+xiCX503ypXSFQTOVbtnE9e/9Aw/6vbkCObxtORB5VHXfAa5tAKwuE2ts+x6lI
 fsQ3/L+Mj6v9QsRhjNprjqhdwKYe2WidYwaYjvQv/RXmhVEV/3kTdfUn91Anf/JJ7C
 +huh9DYFOVdbk7VDJMJbXthDr1RanUSjT9xC4nr1SF97g4f57hDPgU0gKgSkU0AIbc
 gmH3/3UDj2W4g==
Date: Fri, 10 Jan 2025 07:54:18 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: p.zabel@pengutronix.de, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 linux-arm-kernel@lists.infradead.org, xiandong.wang@mediatek.com, 
 linux-mediatek@lists.infradead.org, singo.chang@mediatek.com, 
 chunkuang.hu@kernel.org, sirius.wang@mediatek.com, matthias.bgg@gmail.com, 
 treapking@chromium.org, angelogioacchino.delregno@collabora.com, 
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org, sunny.shen@mediatek.com, 
 jason-jh.lin@mediatek.com, nancy.lin@mediatek.com, 
 dri-devel@lists.freedesktop.org, fshao@chromium.org, conor+dt@kernel.org, 
 devicetree@vger.kernel.org
To: "paul-pl.chen" <paul-pl.chen@mediatek.com>
In-Reply-To: <20250110123835.2719824-6-paul-pl.chen@mediatek.com>
References: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
 <20250110123835.2719824-6-paul-pl.chen@mediatek.com>
Message-Id: <173651725426.2671695.7661340219497308695.robh@kernel.org>
Subject: Re: [PATCH 04/12] dt-bindings: display: mediatek: add BLENDER yaml
 for MT8196
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


On Fri, 10 Jan 2025 20:34:00 +0800, paul-pl.chen wrote:
> From: "Paul-pl.Chen" <paul-pl.chen@mediatek.com>
> 
> Add mediatek,blender.yaml to support BLENDER for MT8196.
> 
> Signed-off-by: Paul-pl.Chen <paul-pl.chen@mediatek.com>
> ---
> The header used in examples:
> #include <dt-bindings/clock/mt8196-clk.h>
> is not upstreamed yet.
> It will be sent by related owner soon.
> ---
>  .../display/mediatek/mediatek,blender.yaml    | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,blender.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250110123835.2719824-6-paul-pl.chen@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

