Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7392E8A1335
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 13:39:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9C710EF60;
	Thu, 11 Apr 2024 11:39:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="b0n7KVm5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F221710EF60
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 11:39:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6898061D33;
 Thu, 11 Apr 2024 11:39:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B308C43390;
 Thu, 11 Apr 2024 11:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712835586;
 bh=7EFwvVMuQn70XRVguNSGzqoYr22N/NAtZcQsB+LnsEg=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=b0n7KVm5wYeNXeZ+XnzXB1T2YmToafnWpN+T+r3+hpqq+Oj00V6TKtelpkSyu+xj5
 b9VTXuRx29AZ6yNygBfIiVIGu1ZH1tRO6MKMNzl7vm1nyNofF7R6a+Cv0DbGGs12Kj
 b4A1+kHJ2MCWrFtjFhT0K4tUVgekgi4QnuOHotZAmq4zCcgGjdxbFsxTcd57+g71su
 VDThpy8LKz64KHkpZgG6LkF3jScn2grHEZCBT6MBzgBtRJALvSOU8xs269bb+C9Ivs
 RqYmTVB4xUk3LKnZ0SKXrXBUOj3cxyFGBZIHI9wUYsJfSBpitIDOotCyI9mI26yM9F
 M/VdILKn+BeQg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240327174714.519577-1-krzysztof.kozlowski@linaro.org>
References: <20240327174714.519577-1-krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH] video: backlight: otm3225a: drop driver owner
 assignment
Message-Id: <171283558431.2316283.17972686274458544587.b4-ty@kernel.org>
Date: Thu, 11 Apr 2024 12:39:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4
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

On Wed, 27 Mar 2024 18:47:14 +0100, Krzysztof Kozlowski wrote:
> Core in spi_register_driver() already sets the .owner, so driver
> does not need to.
> 
> 

Applied, thanks!

[1/1] video: backlight: otm3225a: drop driver owner assignment
      commit: 9db7677e33b646a7fd60d35cbd4ab99886057a85

--
Lee Jones [李琼斯]

