Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6767ADD59
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 18:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20AAC10E2AF;
	Mon, 25 Sep 2023 16:44:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A0910E2B6
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 16:44:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 62B72B80DE9;
 Mon, 25 Sep 2023 16:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2D5BC433C8;
 Mon, 25 Sep 2023 16:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695660257;
 bh=OSniNe/SEUwj5JtrJjV3mo40KgZweC+EN5DVdS+32V8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tx2vsX3+bmbaJmQavOlsuRE97YZs+Tfad0mvFjzqoghAnsr99IgCTELCcGsFXK/tF
 5SE21DNJRy/kCAsDACFgx5S5YPFRSvwdvNRNtSPv0drdZxHy4/z8B+wcJThmOYDwvq
 4rpGU+KzSew2sBj8H99H3HB+rQc2ivg1u6rthJ5IVb1gXPPkWvjIICH/G3Dax1HDCq
 7FXAcBWCH/dTXk7+tAUHt4m3Kck/EuSkhoDjFapTm4y+m3KqzuypPEIL84djKjXKyw
 zd9nVFjM/sJFifaVSxjPYfA2Ttw4b77Lv4H/60eUCIWEk3/s7qu2EmtRUwxTZOqOpa
 4U7CojDULiHwg==
Received: (nullmailer pid 1490675 invoked by uid 1000);
 Mon, 25 Sep 2023 16:44:15 -0000
Date: Mon, 25 Sep 2023 11:44:15 -0500
From: Rob Herring <robh@kernel.org>
To: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: Re: [v1 1/2] ASoC: dt-bindings: mediatek,mt8188-mt6359: add RT5682S
 support
Message-ID: <169566025430.1490621.9358539140957587506.robh@kernel.org>
References: <20230925083847.1496-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <20230925083847.1496-2-xiazhengqiao@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925083847.1496-2-xiazhengqiao@huaqin.corp-partner.google.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 dri-devel@lists.freedesktop.org, perex@perex.cz, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 25 Sep 2023 16:38:46 +0800, xiazhengqiao wrote:
> Add compatible string "mediatek,mt8188-rt5682" to support new board
> with rt5682s codec.
> ---
>  .../devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml        | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

