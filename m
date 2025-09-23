Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9851FB96447
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 16:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED7210E62D;
	Tue, 23 Sep 2025 14:31:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="Ce2sOG2J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CBE110E62D
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 14:31:41 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id EE06425DBC;
 Tue, 23 Sep 2025 16:31:39 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dCFc-A-Ltmn4; Tue, 23 Sep 2025 16:31:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1758637899; bh=UIE9q5knFnkbWEcoDAhbnZcYbrZ6c1wOHFYsGRe+8KY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=Ce2sOG2Jc2x6MDAuw/bJRIMXtvmfP23c1X+i+vjgjLEN/bNAgz2o7U4/z2Em5XHNB
 nDQOkVk2j8ey81idbXc+buqkLW9f3wI6jf2eKT6z8+wdt9LfMzLfdXCZlR0XPOai4c
 T2kp/AtwIaEjyUIbdXBQlWLm1d8j0LRQuCakS4eKfcZtbzzFmj8veg6YELLaq28MuW
 XgPAFVz3dQRm0o47IJ9VnT5056FAEuYVUulBRFeSTxipOftWblVAzBk7h+Qor6SGl2
 yHqoMO/GAsWHQu42uoWeK/1EJjaFFWVW87X3K53DhnmNYTzmYcmPhqtKry/7suRJo/
 N7LSX88stClLw==
MIME-Version: 1.0
Date: Tue, 23 Sep 2025 14:31:38 +0000
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
Subject: Re: [PATCH v5 0/2] Support for Synaptics TDDI series panels
In-Reply-To: <38e3a32db8402c1cbf3dc2fdf9f04ac3@disroot.org>
References: <20250820-panel-synaptics-tddi-v5-0-d4e3fd4987c6@disroot.org>
 <38e3a32db8402c1cbf3dc2fdf9f04ac3@disroot.org>
Message-ID: <a75c7a7aaac1d851d8943c5c20ac31ee@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
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

On 2025-09-10 16:25, Kaustabh Chakraborty wrote:

It's been over a month without any movements, so another bump.

> Hi,
> 
> Bumping to collect some reviews on this series. Thanks!
> 
> On 2025-08-20 14:24, Kaustabh Chakraborty wrote:
>> Synaptics' Touch and Display Driver Integration (TDDI) technology [1]
>> employs a single chip for both touchscreen and display capabilities.
>> Such designs reportedly help reducing costs and power consumption.
>> 
>> Although the touchscreens, which are powered by Synaptics'
>> Register-Mapped Interface 4 (RMI4) touch protocol via I2C or SPI have
>> driver support in the kernel, the MIPI DSI display panels don't.
>> 
>> This series introduces a rudimentary driver for controlling said 
>> display
>> panels, which supports TD4101 and TD4300 panels.
>> 
>> [1] https://www.synaptics.com/technology/display-integration
>> 
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>> Changes in v5:
>> - added missing Reviewed-by tag from Krzysztof in [v3 1/2]
>> - Link to v4: 
>> https://lore.kernel.org/r/20250819-panel-synaptics-tddi-v4-0-448f466d16a6@disroot.org
>> 
>> Changes in v4:
>> - utilized drm_connector_helper_get_modes_fixed() (dmitry.baryshkov)
>> - constified backlight properties (dmitry.baryshkov)
>> - Link to v3: 
>> https://lore.kernel.org/r/20250720-panel-synaptics-tddi-v3-0-43a5957f4b24@disroot.org
>> 
>> Changes in v3:
>> - fixed various dt_binding_check errors (robh's bot)
>> - adjusted commit description of [v2 1/2] (robh)
>> - utilized devm_drm_panel_alloc() and devm_regulator_bulk_get_const()
>> - Link to v2: 
>> https://lore.kernel.org/r/20250625-panel-synaptics-tddi-v2-0-7a62ab1d13c7@disroot.org
>> 
>> Changes in v2:
>> - fixed various dt_binding_check errors (conor)
>> - did s/tddi_update_brightness/tddi_update_status
>> - added check for panel enable in tddi_update_status()
>> - used backlight_get_brightness() in appropriate places
>> - Link to v1: 
>> https://lore.kernel.org/r/20250612-panel-synaptics-tddi-v1-0-dfb8a425f76c@disroot.org
>> 
>> ---
>> Kaustabh Chakraborty (2):
>>       dt-bindings: display: panel: document Synaptics TDDI panel
>>       drm: panel: add support for Synaptics TDDI series DSI panels
>> 
>>  .../display/panel/synaptics,td4300-panel.yaml      |  89 +++++++
>>  drivers/gpu/drm/panel/Kconfig                      |  11 +
>>  drivers/gpu/drm/panel/Makefile                     |   1 +
>>  drivers/gpu/drm/panel/panel-synaptics-tddi.c       | 276 
>> +++++++++++++++++++++
>>  4 files changed, 377 insertions(+)
>> ---
>> base-commit: 5303936d609e09665deda94eaedf26a0e5c3a087
>> change-id: 20250523-panel-synaptics-tddi-0b0b3f07f814
>> 
>> Best regards,
>> --
>> Kaustabh Chakraborty <kauschluss@disroot.org>
