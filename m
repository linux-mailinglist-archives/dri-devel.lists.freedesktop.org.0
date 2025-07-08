Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E5FAFD7D5
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 22:04:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E957410E1B7;
	Tue,  8 Jul 2025 20:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tNSjpre9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8063D10E1B7
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 20:04:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9951D5C63F0;
 Tue,  8 Jul 2025 20:04:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C11CC4CEED;
 Tue,  8 Jul 2025 20:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752005095;
 bh=UAxdp1DGkpWzNRjNigWBfUd83bXcPNzljSWxeW6F6ys=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tNSjpre9hQm11qlU7fwO/m5yuK6s++nUu913KGSodJ1VVbBXIqeDLnEui01mJtsLw
 rpEL7rAhofOjBlC2nqbcCvhI7CEpbr09N/gy9P8T/h9b2qyXVLc++06Ao7a5lv2yoY
 BVyJN9oN4tUu9wegJuCgyEqaxWaGjka3IiYOVh0kwM9BO0f/3ezO4lVPK4tg/luqyb
 ZN+UBhGPaLnWpDAfWKTDr8qH33FTfMtUwcx8zRB7UE0CdqWhmguyr04jIRB4bUhItN
 FJseQLrpgyIyHW1aPKEvTIbsHFg6W05WkaFkxbRlFVK79+vS2KB6SQSkNy0xeFUMgN
 si8FA1sqFv9/Q==
Date: Tue, 8 Jul 2025 15:04:53 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, neil.armstrong@linaro.org,
 mripard@kernel.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, hjc@rock-chips.com,
 quic_jesszhan@quicinc.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 nicolas.frattaroli@collabora.com, andyshrk@163.com,
 andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 conor+dt@kernel.org, krzk+dt@kernel.org
Subject: Re: [PATCH 05/13] dt-bindings: display: ili9881c: Add Bestar
 BSD1218-A101KL68 LCD panel
Message-ID: <175200509348.879110.17260989179996281641.robh@kernel.org>
References: <20250707164906.1445288-1-heiko@sntech.de>
 <20250707164906.1445288-6-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707164906.1445288-6-heiko@sntech.de>
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


On Mon, 07 Jul 2025 18:48:58 +0200, Heiko Stuebner wrote:
> Document the compatible value for Bestar BSD1218-A101KL68 LCD panels
> that are based around the ili9881c controller.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  .../devicetree/bindings/display/panel/ilitek,ili9881c.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

