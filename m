Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 499FB4BD6CF
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 08:31:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D433F10F930;
	Mon, 21 Feb 2022 07:31:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D00F510F92F
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 07:31:53 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id o24so25435435wro.3
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Feb 2022 23:31:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5//PYWEwFxOsjGcmy5LlfToRPGdJHDlgUauWSglKfRI=;
 b=ISl3+ehqjGexFww/qfbLltOu7ru93VDpWCQNxJM1v1P+TI/i2TrOtRC8e8V2yfsoqw
 NX/DVovXvpLOHLhrGXz4GVOuJTmo6A7z6MsvSywD2/7+zC/J/IP6UUY2WuHQNiip1hIJ
 EG2dmlOvk0U0jzHQqiddAjQMwGPfF27IaXxDq41sn9fmadITwgkMn0AavaW0Dxqz16U2
 Tl5ZTU5mzsCIDu0Fp388To22XAhsA361QLoo1csECjcUHsN1dEsg7Fj2GJu2VH1kUG9O
 5LBSPa2tBH5mma+30LXqw1LFvRj1sv9tKjqLlPm+4Y1goiFPfAQ8xdvXleUNWKfmCKsI
 pHLw==
X-Gm-Message-State: AOAM533/c+fJESOLEprG01uiticbVTm+XYkc1m3i59erJe7Uh+v1Xzdg
 /Lv318LaWK3abImsViCavE0=
X-Google-Smtp-Source: ABdhPJwMx6zuA308tUc3Zgv1aFGCt3rBmCALjr+NQUR4RsadvQELLTVYSUCFakdAOiwouuAKhexLBQ==
X-Received: by 2002:adf:908e:0:b0:1e7:bea7:3486 with SMTP id
 i14-20020adf908e000000b001e7bea73486mr14360071wri.401.1645428712059; 
 Sun, 20 Feb 2022 23:31:52 -0800 (PST)
Received: from [192.168.0.120] (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108]) by smtp.googlemail.com with ESMTPSA id
 z5-20020a05600c0a0500b0037bb8df81a2sm7619393wmp.13.2022.02.20.23.31.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Feb 2022 23:31:51 -0800 (PST)
Message-ID: <fd34eb5e-4947-1c47-8375-1e84bcedffb8@kernel.org>
Date: Mon, 21 Feb 2022 08:31:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v10 2/4] Documentation/dt: Add descriptions for loongson
 display controller
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Sui Jingfeng <15330273260@189.cn>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Roland Scheidegger <sroland@vmware.com>, Zack Rusin <zackr@vmware.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Sam Ravnborg <sam@ravnborg.org>, "David S . Miller" <davem@davemloft.net>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ilia Mirkin <imirkin@alum.mit.edu>, Qing Zhang <zhangqing@loongson.cn>,
 suijingfeng <suijingfeng@loongson.cn>
References: <20220220145554.117854-1-15330273260@189.cn>
 <20220220145554.117854-3-15330273260@189.cn>
 <4dd5949f-2699-b83b-0fbf-c1b7beb0fa9a@flygoat.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <4dd5949f-2699-b83b-0fbf-c1b7beb0fa9a@flygoat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/02/2022 19:22, Jiaxun Yang wrote:
> 
> 
> 在 2022/2/20 14:55, Sui Jingfeng 写道:
>> From: suijingfeng <suijingfeng@loongson.cn>
>>
>> Add DT documentation for loongson display controller found in LS2K1000,
>> LS2K0500 and LS7A1000.
>>
>> v2: DT binding docs and includes should be a separate patch,
>>      fix a warnning because of that.
>>
>> v3: split dt-bindings from other changes into a separate patch.
>>
>> v4: fix warnings and errors when running make dt_binding_check
>>
>> Reported-by: Rob Herring <robh@kernel.org>
>> Reported-by: Krzysztof Kozlowski <krzk@kernel.org>
>> Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
>> Signed-off-by: Sui Jingfeng <15330273260@189.cn>
>> ---
>>   .../loongson/loongson,display-controller.yaml | 122 ++++++++++++++++++
>>   1 file changed, 122 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml b/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
>> new file mode 100644
>> index 000000000000..ee1a59b91943
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
>> @@ -0,0 +1,122 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/loongson/loongson,display-controller.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Loongson LS7A1000/LS2K1000/LS2K0500 Display Controller Device Tree Bindings
>> +
>> +maintainers:
>> +  - Sui Jingfeng <suijingfeng@loongson.cn>
>> +
>> +description: |+
>> +
>> +  Loongson display controllers are simple which require scanout buffers
>> +  to be physically contiguous. LS2K1000/LS2K0500 is a SOC, only system
>> +  memory is available. LS7A1000/LS7A2000 is bridge chip which is equipped
>> +  with a dedicated video ram which is 64MB or more.
>> +
>> +  For LS7A1000, there are 4 dedicated GPIOs whose control register is
>> +  located at the DC register space. They are used to emulate two way i2c,
>> +  One for DVO0, another for DVO1.
>> +
>> +  LS2K1000 and LS2K0500 SoC grab i2c adapter from other module, either
>> +  general purpose GPIO emulated i2c or hardware i2c in the SoC.
>> +
>> +  LSDC has two display pipes, each way has a DVO interface which provide
>> +  RGB888 signals, vertical & horizontal synchronisations, data enable and
>> +  the pixel clock. LSDC has two CRTC, each CRTC is able to scanout from
>> +  1920x1080 resolution at 60Hz. Each CRTC has two FB address registers.
>> +
>> +  LSDC's display pipeline have several components as below description,
>> +
>> +  The display controller in LS7A1000:
>> +    ___________________                                     _________
>> +    |            -------|                                   |         |
>> +    |  CRTC0 --> | DVO0 ----> Encoder0 ---> Connector0 ---> | Monitor |
>> +    |  _   _     -------|        ^             ^            |_________|
>> +    | | | | |    -------|        |             |
>> +    | |_| |_|    | i2c0 <--------+-------------+
>> +    |            -------|
>> +    |   DC IN LS7A1000  |
>> +    |  _   _     -------|
>> +    | | | | |    | i2c1 <--------+-------------+
>> +    | |_| |_|    -------|        |             |             _________
>> +    |            -------|        |             |            |         |
>> +    |  CRTC1 --> | DVO1 ----> Encoder1 ---> Connector1 ---> |  Panel  |
>> +    |            -------|                                   |_________|
>> +    |___________________|
>> +
>> +  Simple usage of LS7A1000 with LS3A4000 CPU:
>> +
>> +    +------+            +-----------------------------------+
>> +    | DDR4 |            |  +-------------------+            |
>> +    +------+            |  | PCIe Root complex |   LS7A1000 |
>> +       || MC0           |  +--++---------++----+            |
>> +  +----------+  HT 3.0  |     ||         ||                 |
>> +  | LS3A4000 |<-------->| +---++---+  +--++--+    +---------+   +------+
>> +  |   CPU    |<-------->| | GC1000 |  | LSDC |<-->| DDR3 MC |<->| VRAM |
>> +  +----------+          | +--------+  +-+--+-+    +---------+   +------+
>> +       || MC1           +---------------|--|----------------+
>> +    +------+                            |  |
>> +    | DDR4 |          +-------+   DVO0  |  |  DVO1   +------+
>> +    +------+   VGA <--|ADV7125|<--------+  +-------->|TFP410|--> DVI/HDMI
>> +                      +-------+                      +------+
>> +
>> +  The display controller in LS2K1000/LS2K0500:
>> +     ___________________                                     _________
>> +    |            -------|                                   |         |
>> +    |  CRTC0 --> | DVO0 ----> Encoder0 ---> Connector0 ---> | Monitor |
>> +    |  _   _     -------|        ^              ^           |_________|
>> +    | | | | |           |        |              |
>> +    | |_| |_|           |     +------+          |
>> +    |                   <---->| i2c0 |<---------+
>> +    |   DC IN LS2K1000  |     +------+
>> +    |  _   _            |     +------+
>> +    | | | | |           <---->| i2c1 |----------+
>> +    | |_| |_|           |     +------+          |            _________
>> +    |            -------|        |              |           |         |
>> +    |  CRTC1 --> | DVO1 ----> Encoder1 ---> Connector1 ---> |  Panel  |
>> +    |            -------|                                   |_________|
>> +    |___________________|
>> +
>> +properties:
>> +  $nodename:
>> +    pattern: "^display-controller@[0-9a-f],[0-9a-f]$"
>> +
>> +  compatible:
>> +    enum:
>> +      - loongson,ls7a1000-dc
>> +      - loongson,ls2k1000-dc
>> +      - loongson,ls2k0500-dc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +
>> +additionalProperties: false
> Given that it is possible to have output subnodes I guess 
> additionalProperties
> should be allowed?

subnodes should be instead listed. Either with strict name (if these are
e.g. ports) or with some more or less relaxed pattern.


Best regards,
Krzysztof
