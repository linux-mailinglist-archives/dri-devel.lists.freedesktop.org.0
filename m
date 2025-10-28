Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3102C15486
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 15:57:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53CB10E0C2;
	Tue, 28 Oct 2025 14:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="VUmkSaoK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6E210E0C2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 14:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761663424;
 bh=pRY4+GGhGf/5nLNZrRYoTRzXWCb0qRy5AHjVl+G2awk=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=VUmkSaoKTS+yPKGuGBcHWonNmB2/Ng+5wsj2Anc+azB5ShC5mZQOL/6/TF73VN2Po
 vKvHn1Jdx3EIMnm+NgAKueYwBaYSbvg+Z4K5yAVq0E8zbXHxzgi7GjJXOhTV88wqiw
 bFoshICpvlhba+h6cRZKSdBC2AnpVZm5LsXP3FyCDs0R9MdnXMo+fiEp3A5kSjK8Nu
 K/WBIKc4F4A07dZtENez/rMgd8tj5Go7tD8nr4Ho2PfTg80yQbkiJno/we/Z0X+4Yx
 QXhAKVBuyphmdyyiAZA78AWxYIlsgiOHW05+MufYz5POsFyiW0AlG/8pH8uZ6Kgie6
 +NXOdd6K4u7Bg==
Received: from [192.168.1.90] (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 04CD317E139C;
 Tue, 28 Oct 2025 15:57:03 +0100 (CET)
Message-ID: <63003a7e-8d3d-433a-8a44-54fe8740bc3a@collabora.com>
Date: Tue, 28 Oct 2025 16:57:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] Add HDMI CEC support to Rockchip RK3588/RK3576 SoCs
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Algea Cao <algea.cao@rock-chips.com>,
 Derek Foreman <derek.foreman@collabora.com>,
 Daniel Stone <daniels@collabora.com>, Aishwarya.TCV@arm.com
References: <20250903-rk3588-hdmi-cec-v4-0-fa25163c4b08@collabora.com>
 <6f3f126d-72c1-48cb-a9c8-8d354af2a3d5@sirena.org.uk>
 <410fa913-e86b-4ffd-9d79-ce804f0271ff@collabora.com>
Content-Language: en-US
In-Reply-To: <410fa913-e86b-4ffd-9d79-ce804f0271ff@collabora.com>
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

On 10/28/25 2:42 PM, Cristian Ciocaltea wrote:
> Hi Mark,
> 
> On 10/28/25 2:38 PM, Mark Brown wrote:
>> On Wed, Sep 03, 2025 at 09:50:58PM +0300, Cristian Ciocaltea wrote:
>>> The first patch in the series implements the CEC capability of the
>>> Synopsys DesignWare HDMI QP TX controller found in RK3588 & RK3576 Socs.
>>> This is based on the downstream code, but rewritten on top of the CEC
>>> helpers added recently to the DRM HDMI connector framework.
>>
>> For the past couple of weeks we've been seeing various instability with
>> the graphics drivers on the Rock 5B in -next, the most common system is
>> that we get faults in code that looks suspiciously relevant to this
>> series:
>>
>> <6>[   17.353368] rockchip-drm display-subsystem: bound fdd90000.vop (ops vop2_component_ops [rockchipdrm])
>> <6>[   17.355237] dwhdmiqp-rockchip fde80000.hdmi: registered DesignWare HDMI QP I2C bus driver
>> / # <1>[   17.357803] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000098
>>
>> ...
>>
>> <4>[   17.372390] Hardware name: Radxa ROCK 5B (DT)
>>
>> ...
>>
>> <4>[   17.382082] Call trace:
>> <4>[   17.382317]  drm_bridge_connector_hdmi_cec_init+0x8/0x38 [drm_display_helper] (P)
>> <4>[   17.383003]  drm_bridge_connector_init+0x658/0x678 [drm_display_helper]
>> <4>[   17.383612]  dw_hdmi_qp_rockchip_bind+0x35c/0x4d8 [rockchipdrm]
>> <4>[   17.384159]  component_bind_all+0x118/0x248
>> <4>[   17.384550]  rockchip_drm_bind+0xb4/0x20c [rockchipdrm]
>> <4>[   17.385034]  try_to_bring_up_aggregate_device+0x164/0x1d0
>> <4>[   17.385528]  component_master_add_with_match+0xc4/0x104
>> <4>[   17.386008]  rockchip_drm_platform_probe+0x1f8/0x31c [rockchipdrm]
>>
>> (from today's -next, 
>>
>> Unfortunately we haven't managed to point at a specific commit, it looks
>> like this might be triggered by multiple serieses interacting with each
>> other.  I'm not sure what other information might be useful here?
> 
> Thanks for reporting, I will investigate.

This seems to have been already addressed:

https://lore.kernel.org/all/20251017-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v2-0-667abf6d47c0@bootlin.com/
> Regards,
> Cristian

