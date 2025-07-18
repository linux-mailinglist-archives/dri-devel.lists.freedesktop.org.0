Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C297B09D67
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 10:11:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2BEE10E921;
	Fri, 18 Jul 2025 08:10:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qhKKMwFU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6466D10E921
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 08:10:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2861D41A4C;
 Fri, 18 Jul 2025 08:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 719E1C4CEEB;
 Fri, 18 Jul 2025 08:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752826212;
 bh=pYKJJ2hQUpdG2dVQ13Xx5f+NtvuXuDTByPwbcBUy+ao=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qhKKMwFU7zuaBUi4JjVCyKOTLven1T/f3a8B6gZ+ti4Ac0/5uaHiXKYRdjUuz5R8q
 FVep+nERjFceG9fK8v6gAZYFXdfix9YEmlIlfo1+3Sk9Ivro9aDG/boJh6UbFBr+mV
 f01GQ8YGzYPvh7ZP2c6mx+CzPlqCrRq1m3fmBV5qzHoMoJY3scMszEhYD2RQzzK+NE
 xeitHBg5OWV5ZXrYnEGIkqZlvxHBL9CQoNJp9fvaozaZN4zW1tdNynssq9DUuIGXn8
 oxDiTm1Id5woKqn8v1cT1OLl45daF+yZXV5Bz1goNQyl1rJvNHV/MJY6gRmAhhKRzV
 yhsxyywjg6bFg==
Date: Fri, 18 Jul 2025 10:10:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>, 
 Andy Yan <andy.yan@rock-chips.com>, Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Amit Sunil Dhamne <amitsd@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, Dragan Simic <dsimic@manjaro.org>, 
 Johan Jonker <jbx6244@gmail.com>, Diederik de Haas <didi.debian@cknow.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/5] dt-bindings: phy: rockchip: rk3399-typec-phy:
 Support mode-switch
Message-ID: <20250718-psychedelic-panda-of-defiance-ef6aac@kuoka>
References: <20250718062619.99-1-kernel@airkyi.com>
 <20250718062619.99-2-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250718062619.99-2-kernel@airkyi.com>
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

On Fri, Jul 18, 2025 at 02:26:15PM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> The RK3399 has two USB/DP combo PHY. With the help of external Type-C
> controller, the PHY can switch altmode between USB and DP.
> 
> Their connection diagram is shown below:
> 
> external Type-C Chip0 ---> USB/DP PHY0 ---+
>                                           | <----> CDN-DP controller
> external Type-C Chip1 ---> USB/DP PHY1 ---+

It looks like your "external" controller is not described. Look at your
port property - "Connection to USB Type-C connector". Lack of proper
hardware description leads you to claim that the PHY is the mode switch.
I have doubts on that.

You already received the comments that you need to come with rationale
why making PHY a USB switch is correct. I don't see the arguments for
that.

Best regards,
Krzysztof

