Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D11A9A2B4
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 08:57:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525B310E730;
	Thu, 24 Apr 2025 06:57:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kSnIxFI1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5938010E730
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 06:57:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4EF5BA4467C;
 Thu, 24 Apr 2025 06:51:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BC9CC4CEE3;
 Thu, 24 Apr 2025 06:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745477824;
 bh=zPnLokL9Enz6v0drdyRj8ySVfYvqIPvXAh+2WZuW1zc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kSnIxFI1GokV4V+fVsJxeGyERS251Gwh6yUmDRa5Ougu/R0xkaB0lMiwcyIAGt0OA
 /s5RDb5WGAcsouwzDoe5hdBVb2xf5O2NlM6HF9xEHKeJs1Wei2IH2bgr8qvgwVXQ0L
 pkkUgy0EH/FZbqo1VlO4uPWXsGaHxvqJEzD5qWEAHFnFygMcxsA0SKBosSwZOZOoUu
 IqbMlBOa9aqIslVymBzcqpzevDepPN8QQk+0s/cmEXi0v8sPcbAsxBZnoIm+cA9A9l
 8Kxzk5N9/ZenwLSN4Q1sWSeN1W23eiVrVVEh5NaO4zzyr7F7IrRJJVGEGt/7w/ezzW
 eedfsGbE8EQOA==
Date: Thu, 24 Apr 2025 08:57:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 dianders@google.com, hsinyi@google.com, angelogioacchino.delregno@collabora.com,
 matthias.bgg@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, 
 knoxchiou@google.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v11 1/2] dt-bindings: arm: mediatek: Add MT8186 Ponyta
 Chromebook
Message-ID: <20250424-echidna-of-unreal-youth-9ac5b1@kuoka>
References: <20250424010850.994288-1-cengjianeng@huaqin.corp-partner.google.com>
 <20250424010850.994288-2-cengjianeng@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250424010850.994288-2-cengjianeng@huaqin.corp-partner.google.com>
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

On Thu, Apr 24, 2025 at 09:08:49AM GMT, Jianeng Ceng wrote:
> Ponyta is a custom label Chromebook based on MT8186. It is a
> self-developed project of Huaqin and has no fixed OEM.
> 
> Signed-off-by: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

<form letter>
This is an automated instruction, just in case, because many review tags
are being ignored. If you know the process, you can skip it (please do
not feel offended by me posting it here - no bad intentions intended).
If you do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
</form letter>

Best regards,
Krzysztof

