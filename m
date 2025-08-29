Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E3DB3C117
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 18:43:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21E010E0EC;
	Fri, 29 Aug 2025 16:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bvzz0ywH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D0810E0EC
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 16:43:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EE85B4471C;
 Fri, 29 Aug 2025 16:43:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B549BC4CEF0;
 Fri, 29 Aug 2025 16:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756485819;
 bh=c0OpyhbwKGzoqoPeJ+6gUDfB+znvvuZBNFg59SRe7jY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bvzz0ywHODiK0/q0IGVTcKa4gSJ1QDoKSIMfD/+w0xqyKkEFY7ysGGEDebMucU/d4
 BpBLs9e5s+7M0aWs8Zxfk4Vg7Lm5rvWw4rLxOKMjOaf8KyDtmkdwO32BG37p1OD4XG
 Gr8asWWln/1glpuKqMhwCdy6IIF/bUTbaeD1xHGvEH40GuyWQTLco923T/L1Q+hqS4
 cYZUwYbZ5BH+s+tUyVe/terrJrYLLBqhzG/OZ559vmJ81OP3wbWzJpWyfbaVr6moU3
 bO10fm+cnpv+UyuCDpbODm6S6iDKGmZnBTn83m7vqRlQSYtcelOjUuhcXc4Yg8e/27
 HRyG8mqwftLhw==
Date: Fri, 29 Aug 2025 11:43:38 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Harikrishna Shenoy <h-shenoy@ti.com>
Cc: simona@ffwll.ch, conor+dt@kernel.org, airlied@gmail.com,
 linus.walleij@linaro.org, krzk+dt@kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 devicetree@vger.kernel.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: Re: [PATCH v2] dt-bindings: display: dsi-controller: add bridge to
 patternProperties
Message-ID: <175648581753.993520.17855768020170284866.robh@kernel.org>
References: <20250827112539.4001513-1-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827112539.4001513-1-h-shenoy@ti.com>
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


On Wed, 27 Aug 2025 16:55:39 +0530, Harikrishna Shenoy wrote:
> Extend the DSI controller schema to allow bridge child nodes.
> This makes it possible to describe external bridge devices directly
> connected as DSI peripherals.
> 
> Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
> ---
> Changelog v1 --> v2:
> - Updated patternProperties regex.
> - Improved commit message.
> 
>  Documentation/devicetree/bindings/display/dsi-controller.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!

