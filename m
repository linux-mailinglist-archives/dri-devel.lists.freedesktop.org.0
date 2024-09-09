Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3FD970DD8
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 08:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB5D10E2CC;
	Mon,  9 Sep 2024 06:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jXdHQo7a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14D4710E2CC
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 06:26:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BE9A5A42640;
 Mon,  9 Sep 2024 06:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 376B8C4CEC5;
 Mon,  9 Sep 2024 06:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725863159;
 bh=h3R7Wc/y9Jn11tIYXxPq8te7w+gEIXkmjBYE8s+68bw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jXdHQo7aaRCa7iGfXH3EpKVNmKcJNH4tYZIvubFW6Ml/al36ieCbrs7mmlcGykROA
 sCaEJ8mY758FdLDffPfCEVS1Tqo9B9tfporEFRKcL/Jxz6guHEGuWYCm8xy+vDPp4c
 VK1Fz5RGE4p/xGnrYc4bvDv/kJ0+9alXs9RQ+9kNXKpXFO71mtFUbJEdp+ec8kij+P
 DipaaDfMgVgbMbRYcd86WpnWpnZi9JoORiAY1SCi3Yh6mu0IQZ5hmohhjBmkYBLdzX
 gXmPwz3Pl53HlI1WyE49rymwxPU51yOk1+bm4KfRv17/B6rkBD3wu5nUJ26ma+VBV1
 Azn4imotPlsag==
Date: Mon, 9 Sep 2024 08:25:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Cc: hsinyi@chromium.org, angelogioacchino.delregno@collabora.com, 
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 hsinyi@google.com, knoxchiou@google.com, krzk+dt@kernel.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, robh@kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: mediatek: Add MT8186 Ponyta
 Chromebook
Message-ID: <lp7rhdmz5khuu7cpw7cg2oilkgfcip3fu2gr4r2f6vkk3cbg3e@iyqhqhn26pw4>
References: <CAJMQK-imYrDTuycVzQxkfbkZuHehE8uwc+qS2w=UDShETsBvEw@mail.gmail.com>
 <20240909023148.1677936-1-cengjianeng@huaqin.corp-partner.google.com>
 <20240909023148.1677936-2-cengjianeng@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240909023148.1677936-2-cengjianeng@huaqin.corp-partner.google.com>
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

On Mon, Sep 09, 2024 at 10:31:47AM +0800, Jianeng Ceng wrote:
> Ponyta is a custom label Chromebook based on MT8186. It is a
> self-developed project of Huaqin and has no fixed OEM.
> 
> Signed-off-by: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
> ---

Do not attach (thread) your patchsets to some other threads (unrelated
or older versions). This buries them deep in the mailbox and might
interfere with applying entire sets.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

