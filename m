Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC872AFD7D1
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 22:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A991210E013;
	Tue,  8 Jul 2025 20:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TXZXtSc8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C5C10E013
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 20:04:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5889F6112E;
 Tue,  8 Jul 2025 20:04:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C74CCC4CEF5;
 Tue,  8 Jul 2025 20:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752005078;
 bh=WN1ciI/LBieroqRWpekh0sk9z4c32M5Jn2j2cKXXWbY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TXZXtSc8A4M1kGlmmHXWb8WChesdfRf/CIbbhEXgPJTuajjcvw3s9028JCk25xnxq
 TYBOSLzvLwMcs//T9t2W31twuSOwleBbh4pUthoRYKRGu0PcSTlx6S+JHYT8tjmoly
 sor3zkrlM50x2wIGRByPFSb4sBGvWTOIo6AmyRUpM1vbBd43Htwi12+OuQx8MlVBpQ
 g4BrGONzUhh8OX7AJtkMI9A2b9S1BM7mXzq+Ni3gjTdNgN3NZEooxXVlLAxSDHCK+c
 z5CTPG6h+9ccQ6MiZTos1Pclvqzk4RUsVjYZcIavkOaDUfAIWkPuLYg/88hESurgjS
 OCPtOGqgiVfSQ==
Date: Tue, 8 Jul 2025 15:04:36 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: andy.yan@rock-chips.com, quic_jesszhan@quicinc.com, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, hjc@rock-chips.com,
 mripard@kernel.org, tzimmermann@suse.de, devicetree@vger.kernel.org,
 neil.armstrong@linaro.org, nicolas.frattaroli@collabora.com,
 linux-arm-kernel@lists.infradead.org, andyshrk@163.com,
 dri-devel@lists.freedesktop.org, conor+dt@kernel.org,
 maarten.lankhorst@linux.intel.com, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 04/13] dt-bindings: vendor-prefixes: Add prefix for
 Shenzhen Bestar Electronic
Message-ID: <175200507614.878155.13962765298111291094.robh@kernel.org>
References: <20250707164906.1445288-1-heiko@sntech.de>
 <20250707164906.1445288-5-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707164906.1445288-5-heiko@sntech.de>
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


On Mon, 07 Jul 2025 18:48:57 +0200, Heiko Stuebner wrote:
> Add the prefix for Bestar, named in full both on Panelook.com and their
> display datasheets as
>   Shenzhen Bestar Electronic Technology Co., Ltd.
> which produces at least DSI displays and maybe more.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

