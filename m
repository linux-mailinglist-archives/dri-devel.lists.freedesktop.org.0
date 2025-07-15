Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55168B05411
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 10:06:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD45310E54D;
	Tue, 15 Jul 2025 08:06:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sqsVcERw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C29D10E54D
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 08:06:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6E28043A4D;
 Tue, 15 Jul 2025 08:06:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9A0BC4CEF5;
 Tue, 15 Jul 2025 08:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752566764;
 bh=cfdWdUaJGHBSxvMNf4+GHY7FQh+o9KAWC4PmhNHItSQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sqsVcERw7ZCCz0bxFem1T+GneGBvPUPpfMFxqQTOWHIHaTBBYqbsOPY3owCPix1ml
 /IXqf97zYSPyT9d8LPbFq5JIidmPu5/FNtgFR8cFgWA0PHLgeOIWE59hJ8j8n0fjPV
 bhUSznMiKWnt7AsQ0OhaJMy6h20y9KHbMJwTld/S5bj7YZfcnqJ1ZDn6uFEpV37LKz
 mF3/4XRkpxh86OjeT8lM6jH8ZSWII4CeUHzBcSW9SJGXxM3WBtlJ0F8kzdqXSM1P+f
 SpEdOFNPfNZKQ0QsCpbwXkvrru6Gz++Nc0MPsn5q8/UrzoEGniJQnjlntXEopdLymu
 haBKtV7bDFksQ==
Date: Tue, 15 Jul 2025 10:06:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Yao <richard@scandent.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Akshay Athalye <akshay@scandent.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Andre Przywara <andre.przywara@arm.com>, 
 Junhao Xie <bigfoot@classfun.cn>, Caleb James DeLisle <cjd@cjdns.fr>, 
 Kever Yang <kever.yang@rock-chips.com>, Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add Tianxianwei name
Message-ID: <20250715-prehistoric-chicken-of-genius-5c66b9@krzk-bin>
References: <20250714221804.25691-1-richard@scandent.com>
 <20250714221804.25691-2-richard@scandent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250714221804.25691-2-richard@scandent.com>
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

On Mon, Jul 14, 2025 at 06:17:59PM -0400, Richard Yao wrote:
> Tianxianwei is a company based in Shenzhen, China, making LCD screens.
> 
> Add their name to the list of vendors.
> 
> Signed-off-by: Richard Yao <richard@scandent.com>

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

