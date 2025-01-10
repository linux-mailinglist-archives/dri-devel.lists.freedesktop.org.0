Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA63A09295
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 14:54:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D9DA10F0E2;
	Fri, 10 Jan 2025 13:54:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KWqV6/vE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026B610F0DE
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 13:54:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B8F9AA41FF0;
 Fri, 10 Jan 2025 13:52:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D91C3C4CEE0;
 Fri, 10 Jan 2025 13:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736517261;
 bh=c33XsyMYg3lCZo4jpADv7ET+BOVPEFjhz4yMn/jPl1A=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=KWqV6/vE7KQCJgNFRcquCgrCjHRe/7On429TF1/YwgJ8uyH8LgGnzoxu9h2hPB+np
 eV/ArpXirzOXk2MpJjQ5k2WU4XMN2dCN1XuMVoBPAKP83DlDEDkR2NThlO8HSZDfVW
 gA5KluAc59Ylpw0SuzcNDGBrYLBFUSQgkS0qaYo1N/3f+8+p2K0uIW4KkrNMi2w/oy
 xW2oqZPse7R8vvCQYlX3fQDuPhwc4OH0wc0+4cIe13QQwrz7xXQwh7alaDcRZLcsUR
 2eEEyMV/pjQr7ARpnoAagABg7tVVjjDWNP1H9LlIK8PpZRx/wKuoR4S0PLhydXrnA3
 DEVsj+JcmLydw==
Date: Fri, 10 Jan 2025 07:54:19 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: matthias.bgg@gmail.com, nancy.lin@mediatek.com, 
 devicetree@vger.kernel.org, singo.chang@mediatek.com, conor+dt@kernel.org, 
 sirius.wang@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com, 
 krzk+dt@kernel.org, sunny.shen@mediatek.com, chunkuang.hu@kernel.org, 
 linux-mediatek@lists.infradead.org, fshao@chromium.org, 
 angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com, 
 xiandong.wang@mediatek.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, treapking@chromium.org, 
 p.zabel@pengutronix.de, linux-arm-kernel@lists.infradead.org
To: "paul-pl.chen" <paul-pl.chen@mediatek.com>
In-Reply-To: <20250110123835.2719824-7-paul-pl.chen@mediatek.com>
References: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
 <20250110123835.2719824-7-paul-pl.chen@mediatek.com>
Message-Id: <173651725647.2671771.14303040035335565076.robh@kernel.org>
Subject: Re: [PATCH 05/12] dt-bindings: display: mediatek: add OUTPROC yaml
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


On Fri, 10 Jan 2025 20:34:01 +0800, paul-pl.chen wrote:
> From: "Paul-pl.Chen" <paul-pl.chen@mediatek.com>
> 
> Add mediate,outproc.yaml to support OUTPROC for MT8196.
> 
> Signed-off-by: Paul-pl.Chen <paul-pl.chen@mediatek.com>
> ---
> The header used in examples:
> #include <dt-bindings/clock/mt8196-clk.h>
> is not upstreamed yet.
> 
> It will be sent by related owner soon.
> ---
>  .../display/mediatek/mediatek,outproc.yaml    | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,outproc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250110123835.2719824-7-paul-pl.chen@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

