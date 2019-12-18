Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B24DB125C6B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 09:11:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3CC86EAC7;
	Thu, 19 Dec 2019 08:11:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C09D6E504
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 15:24:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id E696C291739
Subject: Re: [PATCH v21 1/2] Documentation: bridge: Add documentation for
 ps8640 DT properties
To: Maxime Ripard <maxime@cerno.tech>
References: <20191216135834.27775-1-enric.balletbo@collabora.com>
 <20191216135834.27775-2-enric.balletbo@collabora.com>
 <20191217142821.xitumpvfg52heb4t@gilmour.lan>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <da1f3c1b-30b5-7708-9527-7f210e817a31@collabora.com>
Date: Wed, 18 Dec 2019 16:24:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191217142821.xitumpvfg52heb4t@gilmour.lan>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 19 Dec 2019 08:11:13 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ulrich Hecht <uli@fpond.eu>,
 drinkcat@chromium.org, Jitao Shi <jitao.shi@mediatek.com>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

Thanks for your comment, just preparing another version.

On 17/12/19 15:28, Maxime Ripard wrote:
> On Mon, Dec 16, 2019 at 02:58:33PM +0100, Enric Balletbo i Serra wrote:
>> From: Jitao Shi <jitao.shi@mediatek.com>
>>
>> Add documentation for DT properties supported by
>> ps8640 DSI-eDP converter.
>>
>> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
>> Acked-by: Rob Herring <robh@kernel.org>
>> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
>> Signed-off-by: Ulrich Hecht <uli@fpond.eu>
>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>> ---
>>
>> Changes in v21: None
>> Changes in v19: None
>> Changes in v18: None
>> Changes in v17: None
>> Changes in v16: None
>> Changes in v15: None
>> Changes in v14: None
>> Changes in v13: None
>> Changes in v12: None
>> Changes in v11: None
>>
>>  .../bindings/display/bridge/ps8640.txt        | 44 +++++++++++++++++++
>>  1 file changed, 44 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ps8640.txt
>>
>> diff --git a/Documentation/devicetree/bindings/display/bridge/ps8640.txt b/Documentation/devicetree/bindings/display/bridge/ps8640.txt
>> new file mode 100644
>> index 000000000000..7b13f92f7359
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/bridge/ps8640.txt
>> @@ -0,0 +1,44 @@
>> +ps8640-bridge bindings
>> +
>> +Required properties:
>> +	- compatible: "parade,ps8640"
>> +	- reg: first page address of the bridge.
>> +	- sleep-gpios: OF device-tree gpio specification for PD pin.
>> +	- reset-gpios: OF device-tree gpio specification for reset pin.
>> +	- vdd12-supply: OF device-tree regulator specification for 1.2V power.
>> +	- vdd33-supply: OF device-tree regulator specification for 3.3V power.
>> +	- ports: The device node can contain video interface port nodes per
>> +		 the video-interfaces bind[1]. For port@0,set the reg = <0> as
>> +		 ps8640 dsi in and port@1,set the reg = <1> as ps8640 eDP out.
>> +
>> +Optional properties:
>> +	- mode-sel-gpios: OF device-tree gpio specification for mode-sel pin.
>> +[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
>> +
>> +Example:
>> +	edp-bridge@18 {
>> +		compatible = "parade,ps8640";
>> +		reg = <0x18>;
>> +		sleep-gpios = <&pio 116 GPIO_ACTIVE_LOW>;
>> +		reset-gpios = <&pio 115 GPIO_ACTIVE_LOW>;
>> +		mode-sel-gpios = <&pio 92 GPIO_ACTIVE_HIGH>;
>> +		vdd12-supply = <&ps8640_fixed_1v2>;
>> +		vdd33-supply = <&mt6397_vgp2_reg>;
>> +
>> +		ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			port@0 {
>> +				reg = <0>;
>> +				ps8640_in: endpoint {
>> +					remote-endpoint = <&dsi0_out>;
>> +				};
>> +			};
>> +			port@1 {
>> +				reg = <1>;
>> +				ps8640_out: endpoint {
>> +					remote-endpoint = <&panel_in>;
>> +				};
>> +			};
>> +		};
>> +	};
> 
> It's not really fair to ask this after the rough history of this
> patchset apparently, but bindings should be submitted in the YAML
> format now.
> 
> This wouldn't be nice to stop it from going in just because of this,
> so can you send a subsequent patch fixing this?
> 

I don't mind to use YAML format for next version, in fact, I think is the best.

Thanks,
 Enric


> Thanks!
> Maxime
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
