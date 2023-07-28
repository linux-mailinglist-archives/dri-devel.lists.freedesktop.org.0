Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED35076675D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 10:36:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1AE410E69B;
	Fri, 28 Jul 2023 08:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18CB010E69B
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 08:36:24 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1]) by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <j.zink@pengutronix.de>)
 id 1qPIxC-0000R9-1O; Fri, 28 Jul 2023 10:36:06 +0200
Message-ID: <06a726ec-5423-c2e9-5b98-4eb36607a16e@pengutronix.de>
Date: Fri, 28 Jul 2023 10:36:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/3] dt-bindings: display: simple: support non-default
 data-mapping
Content-Language: en-US, de-DE
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20230523-simplepanel_support_nondefault_datamapping-v2-0-87196f0d0b64@pengutronix.de>
 <20230523-simplepanel_support_nondefault_datamapping-v2-2-87196f0d0b64@pengutronix.de>
 <20230602153525.GB3343@pendragon.ideasonboard.com>
From: Johannes Zink <j.zink@pengutronix.de>
In-Reply-To: <20230602153525.GB3343@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: j.zink@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Dan Carpenter <error27@gmail.com>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 patchwork-jzi@pengutronix.de, kernel@pengutronix.de,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

thank you for your review.

On 6/2/23 17:35, Laurent Pinchart wrote:
> Hi Johannes,
> 
> Thank you for the patch.
> 
> On Tue, May 23, 2023 at 10:19:42AM +0200, Johannes Zink wrote:
>> Some Displays support more than just a single default lvds data mapping,
> 
> s/lvds/LVDS/

ack, gonna fix in V3

> 
>> which can be used to run displays on only 3 LVDS lanes in the jeida-18
>> data-mapping mode.
>>
>> Add an optional data-mapping property to allow overriding the default
>> data mapping. As it does not generally apply to any display and bus: use
> 
> s/bus:/bus,/

ack, gonna fix in V3

> 
>> it selectively on the innolux,g101ice-l01, which supports changing the
>> data mapping via a strapping pin.
>>
>> Signed-off-by: Johannes Zink <j.zink@pengutronix.de>
>> ---
>>
>> Changes:
>>
>> v1 -> v2: - worked in Rob's review findings (thanks for reviewing my
>>              work): use extracted common property instead of duplicating
>> 	    the property
>> 	  - refined commit message
>> 	  - add an example dts for automated checking
>> ---
>>   .../bindings/display/panel/panel-simple.yaml       | 26 +++++++++++++++++++++-
>>   1 file changed, 25 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
>> index ec50dd268314..698301c8c920 100644
>> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
>> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
>> @@ -21,9 +21,9 @@ description: |
>>   
>>   allOf:
>>     - $ref: panel-common.yaml#
>> +  - $ref: ../lvds-data-mapping.yaml#
>>   
>>   properties:
>> -
>>     compatible:
>>       enum:
>>       # compatible must be listed in alphabetical order, ordered by compatible.
>> @@ -353,6 +353,17 @@ properties:
>>     power-supply: true
>>     no-hpd: true
>>     hpd-gpios: true
>> +  data-mapping: true
> 
> As the property is optional, don't you need a default value ?

as the simple-bus implicitely assumes default data mappings for LVDS panels, I 
think this is not necessary. If the property is not used in a DT, the default 
data mapping is used.

Best regards
Johannes

> 
>> +
>> +if:
>> +  not:
>> +    properties:
>> +      compatible:
>> +        contains:
>> +          const: innolux,g101ice-l01
>> +then:
>> +  properties:
>> +    data-mapping: false
>>   
>>   additionalProperties: false
>>   
>> @@ -372,3 +383,16 @@ examples:
>>           };
>>         };
>>       };
>> +  - |
>> +    panel_lvds: panel-lvds {
>> +      compatible = "innolux,g101ice-l01";
>> +      power-supply = <&vcc_lcd_reg>;
>> +
>> +      data-mapping = "jeida-24";
>> +
>> +      port {
>> +        panel_in_lvds: endpoint {
>> +          remote-endpoint = <&ltdc_out_lvds>;
>> +        };
>> +      };
>> +    };
>>
> 

-- 
Pengutronix e.K.                | Johannes Zink                  |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |

