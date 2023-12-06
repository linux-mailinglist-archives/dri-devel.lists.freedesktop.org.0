Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD88A806B05
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 10:47:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11ECE10E6CD;
	Wed,  6 Dec 2023 09:47:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com
 [61.152.239.71])
 by gabe.freedesktop.org (Postfix) with ESMTP id 32BFE10E6D5
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 09:47:04 +0000 (UTC)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
 by fd01.gateway.ufhost.com (Postfix) with ESMTP id 2DE3B80C5;
 Wed,  6 Dec 2023 17:47:02 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 6 Dec
 2023 17:47:02 +0800
Received: from [192.168.125.88] (183.27.97.199) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 6 Dec
 2023 17:47:00 +0800
Message-ID: <2d48e460-e46e-431f-bd7b-e34ebe73a40c@starfivetech.com>
Date: Wed, 6 Dec 2023 17:43:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: display: panel: raspberrypi: Add
 compatible property for waveshare 7inch touchscreen panel
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
References: <20231124104451.44271-1-shengyang.chen@starfivetech.com>
 <20231124104451.44271-2-shengyang.chen@starfivetech.com>
 <20231124-lesser-sinister-7f9cd7b80e35@spud>
From: Shengyang Chen <shengyang.chen@starfivetech.com>
In-Reply-To: <20231124-lesser-sinister-7f9cd7b80e35@spud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [183.27.97.199]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
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
Cc: dri-devel@lists.freedesktop.org, eric@anholt.net, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 quic_jesszhan@quicinc.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 mripard@kernel.org, robh+dt@kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 keith.zhao@starfivetech.com, linux-kernel@vger.kernel.org,
 jack.zhu@starfivetech.com, tzimmermann@suse.de,
 changhuang.liang@starfivetech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Conor

On 2023/11/24 20:31, Conor Dooley wrote:
> On Fri, Nov 24, 2023 at 06:44:50PM +0800, Shengyang Chen wrote:
>> The waveshare 7inch touchscreen panel is a kind of raspberrypi pi
>> panel
> 
> Can you be more specific about what "is a kind of rpi panel" means?
> Are they using identical chips as controllers or something like that?
> 

Wareshare panel has same i2c slave address and registers address with 
the original raspberry pi panel. They both use Atmel firmware and they
got same reg id. It can be operated by using the driver of raspberry pi driver
after some change of the code. So I suppose it may be a kind of raspberry pi panel 
and discribe it in this way. It's my own judgement. Sorry about that.
Maybe just like Dave said, It cloned the behaviour of the raspberri pi panel.
I will change the discribtion in next version to not make other confused.

By the way, we will try Stefan's method before next version. 
The method we used in this patch may be abandoned if Stefan's method is verified in our platform.
At that time yaml may also be changed to fit new method.


>> and it can be drived by panel-raspberrypi-touchscreen.c.
>> Add compatible property for it.
>> 
>> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
>> Signed-off-by: Shengyang Chen <shengyang.chen@starfivetech.com>
>> ---
>>  .../bindings/display/panel/raspberrypi,7inch-touchscreen.yaml | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>> 
>> diff --git a/Documentation/devicetree/bindings/display/panel/raspberrypi,7inch-touchscreen.yaml b/Documentation/devicetree/bindings/display/panel/raspberrypi,7inch-touchscreen.yaml
>> index 22a083f7bc8e..e4e6cb4d4e5b 100644
>> --- a/Documentation/devicetree/bindings/display/panel/raspberrypi,7inch-touchscreen.yaml
>> +++ b/Documentation/devicetree/bindings/display/panel/raspberrypi,7inch-touchscreen.yaml
>> @@ -22,7 +22,9 @@ description: |+
>>  
>>  properties:
>>    compatible:
>> -    const: raspberrypi,7inch-touchscreen-panel
>> +    enum:
>> +      - raspberrypi,7inch-touchscreen-panel
>> +      - waveshare,7inch-touchscreen-panel
>>  
>>    reg:
>>      const: 0x45
>> -- 
>> 2.17.1
>> 


thanks.

Best Regards,
Shengyang

