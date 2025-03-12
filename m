Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84206A5DCC8
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 13:37:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC65610E116;
	Wed, 12 Mar 2025 12:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dg3zgQDi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701E610E116
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 12:37:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B4A3E5C5A50;
 Wed, 12 Mar 2025 12:35:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4C7CC4CEE3;
 Wed, 12 Mar 2025 12:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741783039;
 bh=vvNzffstuwygGjee35zDwvBmfUgaXFHHwZ2Xz1A5mtY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dg3zgQDimqxkZGwQ+jX0wY/gkyMSZMYLM/f2OtJd2EkKo0LQ2Ol/Khgl5K5GaQgAZ
 84tP38YE4v8MWusDPAeOqRLDVOYcfUVh5ld8w+jBXYK39u3hLdyLTi3P9ajw/VWRuc
 WRu9xUHstvcJIDArziIPANizCLNsdM5h3ngqQ8zBo7nB1L6C392F+HxqcwCvKA9tI2
 /P7Pl9QLsxbPPy/NfW8yUdfeo37T5Tx2z+k+4ags1cW4mjRSaWQ8F8EoBuhY1axAp0
 o9BOJHPQ/lBBcXPU0fZLTMTpGntEuK5pR+Y1IZZRQQsFFu91Ip6fv3mDT1UGx+BOGw
 +83kRBHdPVxsQ==
Date: Wed, 12 Mar 2025 14:37:13 +0200
From: Dmitry Baryshkov <lumag@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, mripard@kernel.org, 
 cristian.ciocaltea@collabora.com, neil.armstrong@linaro.org,
 yubing.zhang@rock-chips.com, 
 krzk+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 
 robh@kernel.org, sebastian.reichel@collabora.com, 
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v2 3/7] drm/rockchip: Add RK3588 DPTX output support
Message-ID: <m2376n5bdptphdbyxxqvgeouspn7vslucprgzu25shoajzndy3@gfxh3b2poiic>
References: <20250312104214.525242-1-andyshrk@163.com>
 <20250312104214.525242-4-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312104214.525242-4-andyshrk@163.com>
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

On Wed, Mar 12, 2025 at 06:42:04PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Add driver extension for Synopsys DesignWare DPTX IP used
> on Rockchip RK3588 SoC.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> Changes in v2:
> - no include uapi path
> - switch to drmm_encoder_init

Acked-by: Dmitry Baryshkov <lumag@kernel.org>
> 
-- 
With best wishes
Dmitry
