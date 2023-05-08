Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB00F6FA16C
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 09:48:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 684D310E136;
	Mon,  8 May 2023 07:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D6110E136
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 07:48:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 292F760F04;
 Mon,  8 May 2023 07:48:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9BBEC433D2;
 Mon,  8 May 2023 07:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683532121;
 bh=G9HdM1QJziMzpOUvCuJGpW3lxswdvThqfd4Irkdvc78=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SFLrL35w0Msv/Ut1ZxVUaSrWlMrdhAImX35jJa+vNdjFsaccU4K/Tmt46yGGcK/ab
 ShGUwgzPb0DXnrbmb7y+amP1uv5G7AULBvvpwkxkCI8F/TrVO4X4k20OUy7LQhW354
 VQpewPMkAJfEPC2bALgNFB95LK7BWdgiYlJlZMw70TcptzYNU6cjXZ08Hv2+wil21O
 sidC919sGP4/xfCnp+E8wq+yejJrbmLzoCSv8Fv6Ym+qsqV0c+COSzCe4/6DDVgAN6
 SxgSWWuqvXXfvXnWitxgoPYDeztdtBvZsyFeoeZX5IbsFy458+BM+3hXZi1UEKlP5S
 A2B38BMSM4HgQ==
Date: Mon, 8 May 2023 13:18:37 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] phy: mediatek: fix returning garbage
Message-ID: <ZFipVfhLVyye/eud@matsya>
References: <20230414122253.3171524-1-trix@redhat.com>
 <ZFTMPWp8LhwA9uHz@matsya>
 <db9c3190-28d8-199f-f4f0-a12524d0451e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db9c3190-28d8-199f-f4f0-a12524d0451e@gmail.com>
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
Cc: kishon@kernel.org, chunkuang.hu@kernel.org, granquet@baylibre.com,
 Tom Rix <trix@redhat.com>, llvm@lists.linux.dev, ndesaulniers@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nathan@kernel.org, linux-phy@lists.infradead.org,
 linux-mediatek@lists.infradead.org, chunfeng.yun@mediatek.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05-05-23, 17:37, Matthias Brugger wrote:
> 
> 
> On 05/05/2023 11:28, Vinod Koul wrote:
> > On 14-04-23, 08:22, Tom Rix wrote:
> > > clang reports
> > > drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable
> > >    'ret' is uninitialized when used here [-Werror,-Wuninitialized]
> > >          if (ret)
> > >              ^~~
> > > ret should have been set by the preceding call to mtk_hdmi_pll_set_hw.
> > 
> > I have applied "phy: mediatek: hdmi: mt8195: fix uninitialized variable
> > usage in pll_calc"
> 
> Thanks Vinod, that was on my list for today as well. I was a bit puzzled
> because you took the patch that added it, but I wasn't sure if you would
> take the fix. How do you want to handle things like this in the future?

Fixes should be sent as Fixes patch

-- 
~Vinod
