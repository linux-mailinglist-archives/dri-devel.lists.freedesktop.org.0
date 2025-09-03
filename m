Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0F1B42A49
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 21:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC16910E921;
	Wed,  3 Sep 2025 19:52:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="YwOZ+rlM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3055A10E206
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 19:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1756929162;
 bh=xfQ1osEND/adCgoCa/Hw96I9E3HfyCuqMHFBC6Nm9so=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=YwOZ+rlMx3z3JPOd5ujeK9FPCcK4Fo9BggEEieTK14S1oy5PlJcuw92i/FhQsAm0S
 4GL53AtFknTfuHcl0vfhe//+1rdDMRzBwzDtMn0uGu9syDu1rLRezFRQgBgFl95utR
 LWElPCjTxWJM10JSPL78T6XUZNAgIowdxQP/GeoB6+UOnS2EutrFrnhe+SJ7B49ZcV
 3Zjz/GIiYkRAM1vl1neEeLODILGS7Azr0ZuODmXTOXxninpX14XgqcpLJE9JPgJJeD
 e7uPrauGbpNnR+qV+JPLkQXdeXxKE2sconu/0xc5an0sPFRUDtzuCGKs44K2FMggip
 fDrLmZW0kvR7g==
Received: from [192.168.1.90] (unknown [82.79.138.60])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 75B8017E0DC8;
 Wed,  3 Sep 2025 21:52:41 +0200 (CEST)
Message-ID: <e030bed8-58d5-4a19-b81c-45193cb900d8@collabora.com>
Date: Wed, 3 Sep 2025 22:52:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] Add HDMI CEC support to Rockchip RK3588/RK3576 SoCs
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Algea Cao <algea.cao@rock-chips.com>,
 Derek Foreman <derek.foreman@collabora.com>,
 Daniel Stone <daniels@collabora.com>
References: <20250903-rk3588-hdmi-cec-v4-0-fa25163c4b08@collabora.com>
Content-Language: en-US
In-Reply-To: <20250903-rk3588-hdmi-cec-v4-0-fa25163c4b08@collabora.com>
Content-Type: text/plain; charset=UTF-8
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

Hello Heiko,

On 9/3/25 9:50 PM, Cristian Ciocaltea wrote:
> The first patch in the series implements the CEC capability of the
> Synopsys DesignWare HDMI QP TX controller found in RK3588 & RK3576 Socs.
> This is based on the downstream code, but rewritten on top of the CEC
> helpers added recently to the DRM HDMI connector framework.
> 
> The second patch is needed for RK3576 in order to fixup the timer base
> setup according to the actual reference clock rate, which differs
> slightly from RK3588.
> 
> The following three patches setup platform data with the new information
> expected by the HDMI QP transmitter library, while improving the error
> handling in the probe path.
> 
> Please note the CEC helpers were affected by a resource deallocation
> issue which could crash the kernel and freeze the system under certain
> test conditions.  This has been already fixed in v6.17-rc1 via commit
> 19920ab98e17 ("drm/display: hdmi-cec-helper: Fix adapter
> unregistration").
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> Changes in v4:
> - Fixed the bisect-related issues reported by Daniel by implementing
>   the following operations in dw_hdmi_qp_bind():
>   * Disable CEC support when the related IRQ is not available
>   * Set ref_clk_rate to vendor default in case it was not provided by
>     the platform driver
>   * In both scenarios, also print a warning message to highlight the
>     need for fixing the platform driver
> - Simplified dw_hdmi_qp_cec_init() a bit
>   * Removed the now obsolete cec->irq validation test
>   * Removed the superfluous error checking and logging around
>     devm_request_threaded_irq() call (it already handles all that)
> - Collected R-b tags from Daniel
> - Rebased series onto next-20250903

I forgot to mention that luckily there are no conflicts with the patches
introducing the hw-specific bitfield operations in next-20250903, which this
revision is based on.

I verified the series still applies cleanly onto drm-misc-next, while commit
ad24f6e10a5f ("drm/rockchip: dw_hdmi_qp: switch to FIELD_PREP_WM16 macro")
responsible for the macro conversion can be further cherry-picked without
issues on top of all that.  The resulting file content of
drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c is identical to what's
expected after applying this patch set onto next-20250903.

Regards,
Cristian
