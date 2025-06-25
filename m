Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 477B0AE89D1
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 18:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B2B10E774;
	Wed, 25 Jun 2025 16:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="d9yfKpap";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA2D10E774
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 16:31:11 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 59E4A25F2D;
 Wed, 25 Jun 2025 18:31:07 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f0ZxtAlbNKEs; Wed, 25 Jun 2025 18:31:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1750869065; bh=9Plc2mchfJSLLakuGSpwC2tchWlUiNQeTbycwDZpd8E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=d9yfKpapXHHKxp9kOOEdSBp99N7NOoXyzrVmdArp9eCp9tmRg/WXJtJPjxEDCae/D
 9X780PdaSIChVe50RXfdlyhXnMDaHb2ruJFveI11XxLUIudrW23DeGji5dNWmN9Hv4
 Rzvz49xwIr562B4WPHV5ZiDXNhk6tZBZiiGImpgD5NnthDqKfuFftgX44+fRs6wT/c
 LVtpkoKrreWEhV/MCZG7JE89DfxvQrMy8opuPhv4XtTst6vIKesHtIdlAk0pOKEMzm
 W08mInmZ3MCu4NhYBDgF6n25hW9+Tg9lPzEchpxaoJW6dMPTPfSq12A/kuU+U7gNYA
 lAkuH8pWqG58g==
MIME-Version: 1.0
Date: Wed, 25 Jun 2025 16:31:04 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Rob Herring <robh@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: document Synaptics
 TDDI panel driver
In-Reply-To: <20250625150804.GA1201460-robh@kernel.org>
References: <20250625-panel-synaptics-tddi-v2-0-7a62ab1d13c7@disroot.org>
 <20250625-panel-synaptics-tddi-v2-1-7a62ab1d13c7@disroot.org>
 <20250625150804.GA1201460-robh@kernel.org>
Message-ID: <3d08062eb822e2fdcc1498bc1d34075f@disroot.org>
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

On 2025-06-25 15:08, Rob Herring wrote:
> On Wed, Jun 25, 2025 at 03:38:44PM +0530, Kaustabh Chakraborty wrote:
>> Document the driver for Synaptics TDDI (Touch/Display Integration) 
>> panels.
> 
> We document the h/w, not 'the driver'.
> 
>> Along with the MIPI-DSI panel, these devices also have an in-built LED
>> backlight device and a touchscreen, all packed together in a single 
>> chip.
>> Also, add compatibles for supported panels - TD4101 and TD4300.
>> 
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>>  .../display/panel/synaptics,td4300-panel.yaml      | 89 
>> ++++++++++++++++++++++
>>  1 file changed, 89 insertions(+)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/display/panel/synaptics,td4300-panel.yaml 
>> b/Documentation/devicetree/bindings/display/panel/synaptics,td4300-panel.yaml
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..10ac24afdfbc43ca6913bf8a343413eed81f12ff
>> --- /dev/null
>> +++ 
>> b/Documentation/devicetree/bindings/display/panel/synaptics,td4300-panel.yaml
>> @@ -0,0 +1,89 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: 
>> http://devicetree.org/schemas/display/panel/synaptics,td4300-panel.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Synaptics TDDI Display Panel Controller
>> +
>> +maintainers:
>> +  - Kaustabh Chakraborty <kauschluss@disroot.org>
>> +
>> +allOf:
>> +  - $ref: panel-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - syna,td4101-panel
>> +      - syna,td4300-panel
> 
> Can a TD4101 be anything other than a panel (controller)? If not, then
> '-panel' is redundant.
> 

TDDI devices are display panels and touchscreens in one chip. So I guess
it's better to explicitly define that its a panel driver.

(Touchscreens are driven by RMI4)

>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  vio-supply:
>> +    description: core I/O voltage supply
>> +
>> +  vsn-supply:
>> +    description: negative voltage supply for analog circuits
>> +
>> +  vsp-supply:
>> +    description: positive voltage supply for analog circuits
>> +
>> +  backlight-gpios:
>> +    maxItems: 1
>> +    description: backlight enable GPIO
>> +
>> +  reset-gpios: true
>> +  width-mm: true
>> +  height-mm: true
>> +  panel-timing: true
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - width-mm
>> +  - height-mm
>> +  - panel-timing
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +
>> +    dsi {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        panel@0 {
>> +            compatible = "synaptics,td4300-panel";
>> +            reg = <0>;
>> +
>> +            vio-supply = <&panel_vio_reg>;
>> +            vsn-supply = <&panel_vsn_reg>;
>> +            vsp-supply = <&panel_vsp_reg>;
>> +
>> +            backlight-gpios = <&gpd3 5 GPIO_ACTIVE_LOW>;
>> +            reset-gpios = <&gpd3 4 GPIO_ACTIVE_LOW>;
>> +
>> +            width-mm = <68>;
>> +            height-mm = <121>;
>> +
>> +            panel-timing {
>> +                clock-frequency = <144389520>;
>> +
>> +                hactive = <1080>;
>> +                hsync-len = <4>;
>> +                hfront-porch = <120>;
>> +                hback-porch = <32>;
>> +
>> +                vactive = <1920>;
>> +                vsync-len = <2>;
>> +                vfront-porch = <21>;
>> +                vback-porch = <4>;
>> +            };
>> +        };
>> +    };
>> +
>> +...
>> 
>> --
>> 2.49.0
>> 
