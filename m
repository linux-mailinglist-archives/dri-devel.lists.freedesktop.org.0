Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D27ABB54C
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 08:43:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC9810E15C;
	Mon, 19 May 2025 06:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eFJWYJ3a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B7410E15C
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 06:43:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6CC064A703;
 Mon, 19 May 2025 06:43:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7388C4CEE4;
 Mon, 19 May 2025 06:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747636990;
 bh=Yx1POljrotCIOHaWzbGr8GsvbOuA+Q2oSlphVN9dFyM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eFJWYJ3aD0LD42aTLgS7rWRD6M3842RTrYNQvix8F2UsS0QWl5IMdSeYVXCNs41u7
 haTgRlRewO1qVE5KwSPzIHR1LRkLvxHTW4qQWEVp712/7mzeQ9TTE6aqtt+OMuvSCx
 hzl7NHYnmHLhyrps/FKyMlJNiJJ4NSYDUc96uyV7zL3ka/mqPMtCWuPldHBXutYk/l
 HzO8HCo3tDDUGNp01ejXhGAaoCrs5Er9BNSDI0SNcRa51adNwEBn/22MygGjLg2fYn
 WFL+0J7Qw4Yc3XH7mOyE3Pa1IW1eSvler4r92MeeYCEN98/bnvMuCA1nQozsr2nqzB
 /1mu+qfOfhl6w==
Date: Mon, 19 May 2025 08:43:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "paul-pl.chen" <paul-pl.chen@mediatek.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 chunkuang.hu@kernel.org, angelogioacchino.delregno@collabora.com,
 matthias.bgg@gmail.com, 
 p.zabel@pengutronix.de, jason-jh.lin@mediatek.com, nancy.lin@mediatek.com, 
 singo.chang@mediatek.com, xiandong.wang@mediatek.com, sirius.wang@mediatek.com,
 sunny.shen@mediatek.com, fshao@chromium.org, treapking@chromium.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 04/17] dt-bindings: display: mediatek: add OUTPROC
 yaml for MT8196
Message-ID: <20250519-dark-warm-squid-4bdae2@kuoka>
References: <20250515093454.1729720-1-paul-pl.chen@mediatek.com>
 <20250515093454.1729720-5-paul-pl.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250515093454.1729720-5-paul-pl.chen@mediatek.com>
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

On Thu, May 15, 2025 at 05:34:16PM GMT, paul-pl.chen wrote:
> From: Paul-pl Chen <paul-pl.chen@mediatek.com>
> 
> Add mediate,outproc.yaml to support OUTPROC for MT8196.
> MediaTek display overlap output processor, namely OVL_OUTPROC
> or OUTPROC,handles the post-stage of pixel processing in the
> overlapping procedure.
> 
> Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>

This was not here before. What is happening with this patchset? Why some
random SoBs were added?

Nothing like that was explained in commit msg.


> Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
> ---
>  .../display/mediatek/mediatek,outproc.yaml    | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,outproc.yaml
> 

...

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        outproc0: outproc@32970000 {

Drop unused label

Best regards,
Krzysztof

