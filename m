Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8969A2E88A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 11:04:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044E010E141;
	Mon, 10 Feb 2025 10:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HadQvcNy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A967E10E141
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 10:04:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 817095C4922;
 Mon, 10 Feb 2025 10:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 378B1C4CED1;
 Mon, 10 Feb 2025 10:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739181872;
 bh=7L2ha/YngK5jMueC7mLCC2P45ZJ5Oa8CNhph4EuCsSQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HadQvcNyiQEIpvzP3QIYWdrOT4ClSpOay4MttGI3cYGp1ebeBhcOa0DDJKg6s8HoF
 jZZSB9vjhe6AsdiCODgld+unX+vNka5AtWMmdfxMPgxl7iZ8LL6LO7RjVUHMdb77yO
 PzdHJFtbj5Ob4p9LeZHVpFjGhYgFpuuBwYaUwit/owGKHjAImUCa9X7UE+00irIuaJ
 YOX5zj3qacz5vE3shms4d2Vo7dJHPv/eMNd8/wN5HZFtR8O50y9hJCvkR5sMl6f7AR
 eLai+TAWMGLswIpUkt7KRPy98nAhg8T4xKllMQiJOeXCaaHMn6kFy0BpxqW82zwB+w
 rW1sEIV4YF/VQ==
Date: Mon, 10 Feb 2025 11:04:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, krzk+dt@kernel.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 
 derek.foreman@collabora.com, detlev.casanova@collabora.com,
 daniel@fooishbar.org, robh@kernel.org, sebastian.reichel@collabora.com, 
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v13 12/13] dt-bindings: display: vop2: Add rk3576 support
Message-ID: <20250210-crimson-weasel-of-diversity-ece7c5@krzk-bin>
References: <20250206064457.11396-1-andyshrk@163.com>
 <20250206064607.11495-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250206064607.11495-1-andyshrk@163.com>
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

On Thu, Feb 06, 2025 at 02:46:03PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Add vop found on rk3576, the main difference between rk3576 and the
> previous vop is that each VP has its own interrupt line.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

