Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 319BDC074F6
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 18:29:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B5410EB10;
	Fri, 24 Oct 2025 16:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="jHQS4b41";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE9D410EB10
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 16:29:23 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 13435262B0;
 Fri, 24 Oct 2025 18:29:22 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PBhwxP4_ZR-I; Fri, 24 Oct 2025 18:29:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1761323360; bh=wPs5/G9qvhmja22JtkvQzQBRoNu9QbWYMhGKzjxOyMc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=jHQS4b415h+DZoeMxiOFTRbJn29qL39r9XMPoyrVhNiAYepGWm1KRNQX+QCOHFfFP
 9ur2de32W2NeGX5qXeZDGRojNHDdFLtT2vCwuL7MmspkOH94UcAp8Zzj9/5uVFWJyh
 zeXlIpmRuzqi+g5S24R7BcKLrN7kg7lGmLtAvR8FCJU/WfALVmI8epF6FOdU4MBPCz
 wfvIHLk6EA+d9GOOjWOam4xvq5c+6EzVxles3SkNUZbcwI5CJdtiPJH+UVYuSe2NeY
 l9F41YwLVsUrFngrVk4SOA7DjXJRhxTNBJ3amzFWIBeCKY0N6f7TFVqmqd0izeYbGQ
 S30tZYKkE9vzw==
MIME-Version: 1.0
Date: Fri, 24 Oct 2025 16:29:19 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RESEND v5 0/2] Support for Synaptics TDDI series panels
In-Reply-To: <20251009-panel-synaptics-tddi-v5-0-59390997644e@disroot.org>
References: <20251009-panel-synaptics-tddi-v5-0-59390997644e@disroot.org>
Message-ID: <f1297515c0c5e05aa7784131f557443d@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
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

Hi,

I've been trying to get this driver accepted. If panel maintainers have
haven't looked into it yet, this is a gentle reminder.

Thank you.

On 2025-10-09 16:22, Kaustabh Chakraborty wrote:
> Synaptics' Touch and Display Driver Integration (TDDI) technology [1]
> employs a single chip for both touchscreen and display capabilities.
> Such designs reportedly help reducing costs and power consumption.
> 
> Although the touchscreens, which are powered by Synaptics'
> Register-Mapped Interface 4 (RMI4) touch protocol via I2C or SPI have
> driver support in the kernel, the MIPI DSI display panels don't.
> 
> This series introduces a rudimentary driver for controlling said display
> panels, which supports TD4101 and TD4300 panels.
> 
> [1] https://www.synaptics.com/technology/display-integration
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
> Changes in v5:
> - added missing Reviewed-by tag from Krzysztof in [v3 1/2]
> - Link to v4: https://lore.kernel.org/r/20250819-panel-synaptics-tddi-v4-0-448f466d16a6@disroot.org
> 
> Changes in v4:
> - utilized drm_connector_helper_get_modes_fixed() (dmitry.baryshkov)
> - constified backlight properties (dmitry.baryshkov)
> - Link to v3: https://lore.kernel.org/r/20250720-panel-synaptics-tddi-v3-0-43a5957f4b24@disroot.org
> 
> Changes in v3:
> - fixed various dt_binding_check errors (robh's bot)
> - adjusted commit description of [v2 1/2] (robh)
> - utilized devm_drm_panel_alloc() and devm_regulator_bulk_get_const()
> - Link to v2: https://lore.kernel.org/r/20250625-panel-synaptics-tddi-v2-0-7a62ab1d13c7@disroot.org
> 
> Changes in v2:
> - fixed various dt_binding_check errors (conor)
> - did s/tddi_update_brightness/tddi_update_status
> - added check for panel enable in tddi_update_status()
> - used backlight_get_brightness() in appropriate places
> - Link to v1: https://lore.kernel.org/r/20250612-panel-synaptics-tddi-v1-0-dfb8a425f76c@disroot.org
> 
> ---
> Kaustabh Chakraborty (2):
>       dt-bindings: display: panel: document Synaptics TDDI panel
>       drm: panel: add support for Synaptics TDDI series DSI panels
> 
>  .../display/panel/synaptics,td4300-panel.yaml      |  89 +++++++
>  drivers/gpu/drm/panel/Kconfig                      |  11 +
>  drivers/gpu/drm/panel/Makefile                     |   1 +
>  drivers/gpu/drm/panel/panel-synaptics-tddi.c       | 276 +++++++++++++++++++++
>  4 files changed, 377 insertions(+)
> ---
> base-commit: 5303936d609e09665deda94eaedf26a0e5c3a087
> change-id: 20250523-panel-synaptics-tddi-0b0b3f07f814
> 
> Best regards,
> -- 
> Kaustabh Chakraborty <kauschluss@disroot.org>
