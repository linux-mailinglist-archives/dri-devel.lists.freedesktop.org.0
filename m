Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66743B3B3A0
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 08:48:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7792E10E11A;
	Fri, 29 Aug 2025 06:48:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UYKrrjM9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2BBF10E11A
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 06:48:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C1E4C60051;
 Fri, 29 Aug 2025 06:48:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7D00C4CEF0;
 Fri, 29 Aug 2025 06:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756450123;
 bh=J0rKrdxOhHWwS+mtwdjmhTwdm1+u+noFAQcTkYElpqs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UYKrrjM92oN1VUFRgvdGGp9Hu4bdSz74SMy/6aaX+JLVjwIjJG/EWB9yKZQhT+epD
 rejPLq+1EPDIEPj9rPyYcq8uQBKHiKNuMXkgEY51lBcF7pQ0mpOdQP9gI/Ip5miQYX
 5Yn2YQuyrHu3HousmJeHdXt5/BwZf2jd/Y90WeTO48FJWFB/lGj6oFKU7qqyhbUWS2
 vk4THj86pu0EvVDvOijBv6JjxM+QcNsbh8XTLm+ZXX9kFS82d1Mx4WtXwQWLYAQ3Fd
 MyYvEhh5PtNnRkoHuFxXph3MLihdStZDNWZt0hFaMdW1XmPKsuUXrQAhCuaZu7ovUz
 d4W4OMzG3ZRtA==
Date: Fri, 29 Aug 2025 08:48:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Chen <paul-pl.chen@mediatek.com>
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
Subject: Re: [PATCH v4 03/19] dt-bindings: display: mediatek: add EXDMA yaml
 for MT8196
Message-ID: <20250829-industrious-economic-jacamar-ce264d@kuoka>
References: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
 <20250828080855.3502514-4-paul-pl.chen@mediatek.com>
 <20250829-solemn-herring-of-conversion-ec5b1a@kuoka>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250829-solemn-herring-of-conversion-ec5b1a@kuoka>
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

On Fri, Aug 29, 2025 at 08:35:23AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Aug 28, 2025 at 04:06:58PM +0800, Paul Chen wrote:
> > From: Paul-pl Chen <paul-pl.chen@mediatek.com>
> > 
> > Add mediatek,exdma.yaml to support EXDMA for MT8196.
> > The MediaTek display overlap extended DMA engine, namely
> > OVL_EXDMA or EXDMA, primarily functions as a DMA engine
> > for reading data from DRAM with various DRAM footprints
> > and data formats.
> > 
> > Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
> > ---
> >  .../bindings/dma/mediatek,exdma.yaml          | 68 +++++++++++++++++++
> 
> 
> Your changelog says NOTHING changed here and this fails tests, so does it
> mean you received that warnings before but you keep sending same broken
> code?
> 
> Last two weeks of contributions from mediatek are absolutely terrible.
> Very poor code, basic in-house reviews not done, basic testing not done.
> 
> I talked about this at OSSE 25 with some friends and got reasons why
> your setup is broken. Well, it's on you.
> 
> I was already raising this with Mediatek, but we are now back to square
> one.
> 
> NAK, because this patch WAS NEVER tested.


And now I found you got EXACTLY the same error at v3, so you just never
tested and ignored OUR test reports.

This is unfortunately an example how you waste reviewers' time.

Best regards,
Krzysztof

