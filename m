Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C27A6997F3E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 10:18:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDACC10E894;
	Thu, 10 Oct 2024 08:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jtzO/oUr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FEB310E894
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 08:18:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2F0495C2743;
 Thu, 10 Oct 2024 08:18:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B0D2C4CEC5;
 Thu, 10 Oct 2024 08:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728548298;
 bh=AVattL+Jk3iSC5PSLuDU03CTMio8BerpFM7lRB9AtYY=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=jtzO/oUrbPtPSnL//FZnH0DGE8a7bGnlrI5r/6BnsviZyEYdBA8oMwXZDbjOZA4dP
 mpsZXGdxoomFDgMGS0N9QtTbOD2HZLZPU1tgx0cQg8nSgo7meRNCCSwqh5N6cB9KBt
 6DhlkCLcfxCLSP/g8SH+hV/VSyVKgXdnCoBqFuAtrUHdAdWb2ZLr91q+gT5Mm1xHDl
 P05zqRFma5nUfxuMnBO3LVPRSTVa0AX7TQHcjerOK/1865Ew3QhMQCE3flkcr3LDp+
 nScxH7BQ1+ZPYiI+BjRyxAB0nPotqlga0fsUz+8rC8LNBqE0teKBK25UF9xn3j8Rqp
 eyIBcFSNw3jNg==
Message-ID: <c9380ad4bffc044e014b3a9b276b474a@kernel.org>
Date: Thu, 10 Oct 2024 08:18:15 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v9 1/3] drm/bridge: synopsys: Add DW HDMI QP TX
 Controller support library
In-Reply-To: <20241010-b4-rk3588-bridge-upstream-v9-1-68c47dde0410@collabora.com>
References: <20241010-b4-rk3588-bridge-upstream-v9-1-68c47dde0410@collabora.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, "Alexandre
 ARNOUD" <aarnoud@me.com>, "Algea Cao" <algea.cao@rock-chips.com>, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Andy Yan" <andy.yan@rock-chips.com>, "Conor
 Dooley" <conor+dt@kernel.org>, "David Airlie" <airlied@gmail.com>,
 =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Luis de Arquer" <ldearquer@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Mark Yao" <markyao0591@gmail.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Rob Herring" <robh@kernel.org>, "Robert Foss" <rfoss@kernel.org>,
 "Sandy Huang" <hjc@rock-chips.com>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Simona Vetter" <simona.vetter@ffwll.ch>,
 "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
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

On Thu, 10 Oct 2024 01:40:49 +0300, Cristian Ciocaltea wrote:
> The Synopsys DesignWare HDMI 2.1 Quad-Pixel (QP) TX Controller IP
> supports the following features, among others:
> 
> * Fixed Rate Link (FRL)
> * Display Stream Compression (DSC)
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
