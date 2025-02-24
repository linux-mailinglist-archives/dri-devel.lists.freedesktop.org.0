Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1D0A42E35
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 21:45:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8B810E02D;
	Mon, 24 Feb 2025 20:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X4PuSmUd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A1F10E02D
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 20:45:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D0C945C6737;
 Mon, 24 Feb 2025 20:44:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D491C4CED6;
 Mon, 24 Feb 2025 20:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740429920;
 bh=QgksAgFLJVabfIFwX75z/Nx5a6DuAlpc5gJA1Ykv2Ec=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X4PuSmUd5e6xEQZv/m92TzrDuWVhYUGj5Z/fSbN9X3NjRGO4vd2/oE/ErwnO3/pCu
 wrW8DU37q0JZkRZ+kBVC5s1Fuji5ufLY5GKxKuyL+ENKJg96Ifn7uOcss5PyHj8VD7
 cEVG7FP+A8aqDBWBjORYcaYatL0k8S0az8QjfFaFF02iFbmoeU5I07+ToJjGd9uxzn
 LylpT+opFNf8oftDndf6VXgtMXk/7V9zOCTTvsICrYhZJNErObLlRWhd3Q8WUFpWOa
 rqy7+C7u718DposJaPRNyxvartvPH8K/PMoqZf74GKiTjutyzwnB0hhXrcfn6+PD7R
 EKun7ZzeFI+Ow==
Date: Mon, 24 Feb 2025 14:45:18 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: dri-devel@lists.freedesktop.org, Liu Ying <victor.liu@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 06/14] arm64: dts: imx8mp: Add pinctrl config definitions
Message-ID: <174042991798.4062591.16695660457830350664.robh@kernel.org>
References: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
 <20250224-initial_display-v1-6-5ccbbf613543@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224-initial_display-v1-6-5ccbbf613543@gocontroll.com>
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


On Mon, 24 Feb 2025 14:50:56 +0100, Maud Spierings wrote:
> Currently to configure each IOMUXC_SW_PAD_CTL_PAD the raw value of this
> register is written in the dts, these values are not obvious. Add defines
> which describe the fields of this register which can be or-ed together to
> produce readable settings.
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> 
> ---
> This patch has already been sent in a different group of patches: [1]
> It was requested there to submit it along with a user, this series also
> includes some users for it.
> 
> [1]: https://lore.kernel.org/all/20250218-pinctrl_defines-v2-2-c554cad0e1d2@gocontroll.com/
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h | 27 ++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

