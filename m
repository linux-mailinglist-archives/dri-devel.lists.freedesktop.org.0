Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D98B09D76
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 10:12:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 388F010E91C;
	Fri, 18 Jul 2025 08:12:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UCWKQrxw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51BE310E91C
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 08:12:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1796C5C667F;
 Fri, 18 Jul 2025 08:12:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A87FC4CEED;
 Fri, 18 Jul 2025 08:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752826366;
 bh=nPyCE4EJ89fmwm9m6eHxfXIrYOe/RLqv1W0KQKVxAu0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UCWKQrxw4hIODjx81BJaPQA1xlN9NoK/jrwxR0cWdL8KNYM8LvVSrFrn33nkd6z6F
 yj7aPIuc0tbkZ+I91hx+UPI1sg+lArTAf4dxbhvCaMdOwUciDadpm5IazwRPXtbXVh
 ujM4oMGWxrzFa88FYYol01kUuVnL32p8DXs8dIktVYtxiM+5UWRay6CVKfDSW8tXiQ
 WaRICnboRxwj/j5jxN7Ij+p5IHtu4Dz4ltalgTPV4dTzztudxnEG05IBUbSuH+s0d3
 aePvPs1xX8y3JHI1Pf4mJlvhkZi1Fw6msIumCYut5LKIpzMGk3cEmjOOuU8ZQBLGGb
 66Zdz9jt6mORQ==
Date: Fri, 18 Jul 2025 10:12:44 +0200
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
Subject: Re: [PATCH v2 5/5] arm64: dts: rockchip: rk3399-evb-ind: Add support
 for DisplayPort
Message-ID: <20250718-serious-earwig-of-current-18fad5@kuoka>
References: <20250718062619.99-1-kernel@airkyi.com>
 <20250718062619.99-6-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250718062619.99-6-kernel@airkyi.com>
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

On Fri, Jul 18, 2025 at 02:26:19PM +0800, Chaoyi Chen wrote:
> +&i2c4 {
> +	i2c-scl-rising-time-ns = <475>;
> +	i2c-scl-falling-time-ns = <26>;
> +	status = "okay";
> +
> +	usbc0: typec-portc@22 {
> +		compatible = "fcs,fusb302";

Look at your binding - it said you don't have fcs,fusb302 - but directly
port plugged to the PHY...

Plus this looks like the switch. I don't think you really addressed
previous comments. Please give it a time.

Best regards,
Krzysztof

