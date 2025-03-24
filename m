Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18148A6E3FB
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 21:12:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7757110E11E;
	Mon, 24 Mar 2025 20:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PYFvWya/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFDED10E11E
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 20:12:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 50BD26157F;
 Mon, 24 Mar 2025 20:11:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2D6CC4CEDD;
 Mon, 24 Mar 2025 20:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742847121;
 bh=xsQnoIiAqK8rI1rdROJkhsNVkB1X7Nz0OtSOwQ8bwkM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PYFvWya/u5/qIFUJ9Yb+9dQDnyAsPIzex6IAmLQV7kmXL+yJp0cJpppeqPQXbeNDb
 aJu/5rvpVqMbJHuOpQFl0bHM/hqbs1ddbezd8pCkRf55cdK5WROwuNH/1scwhraUiX
 JiMoApDuCWOC2VphRshq9/7DnlSfh3OQR4A3mhHzy/lkvHstUGJjjnxb+GuqZkk/59
 fjHvqA9KlN2GwrJFpXoXQsSJa7nXdZxXvNaVPMuNBWMm7QKkj6yNnLbXrP32w42su4
 mXsK6k32o74PytqV4GzTisL8do8sT3PCml2nGVJnHV3DS25vBTxWEjVgcIrM08rgdn
 69CeJfE5L3gZg==
Date: Mon, 24 Mar 2025 15:12:00 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>, krzk+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 conor+dt@kernel.org, hjc@rock-chips.com,
 linux-kernel@vger.kernel.org, heiko@sntech.de,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: display: rockchip,inno-hdmi: Fix ref
 clk Document of RK3036 compatible
Message-ID: <174284712018.797576.18315585486040060273.robh@kernel.org>
References: <20250324103332.159682-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324103332.159682-1-andyshrk@163.com>
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


On Mon, 24 Mar 2025 18:33:27 +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The RK3036 HDMI DDC bus requires it's PHY's reference clock to be enabled
> first before normal DDC communication can be carried out.
> 
> Therefore, both RK3036 and RK3128 HDMI require two identical clocks.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 
>  .../bindings/display/rockchip/rockchip,inno-hdmi.yaml | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

