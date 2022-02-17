Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8011F4B9E4F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 12:07:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D628610E94B;
	Thu, 17 Feb 2022 11:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.102])
 by gabe.freedesktop.org (Postfix) with ESMTP id A29C210E94B
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 11:07:44 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:56322.1846661901
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id C11C3100139;
 Thu, 17 Feb 2022 19:07:42 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-b7fbf7d79-9vctg with ESMTP id
 5afda76d27df4881bf43c5741b4b3b34 for krzk@kernel.org; 
 Thu, 17 Feb 2022 19:07:43 CST
X-Transaction-ID: 5afda76d27df4881bf43c5741b4b3b34
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <e635074c-8bff-564b-f9a2-38255ba45625@189.cn>
Date: Thu, 17 Feb 2022 19:07:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v8 2/3] MIPS: Loongson64: dts: update the display
 controller device node
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Roland Scheidegger <sroland@vmware.com>, Zack Rusin <zackr@vmware.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Sam Ravnborg <sam@ravnborg.org>, "David S . Miller" <davem@davemloft.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ilia Mirkin <imirkin@alum.mit.edu>, Qing Zhang <zhangqing@loongson.cn>,
 Li Yi <liyi@loongson.cn>, suijingfeng <suijingfeng@loongson.cn>
References: <20220216181712.1493400-1-15330273260@189.cn>
 <20220216181712.1493400-3-15330273260@189.cn>
 <687aad50-6e37-dab9-71a0-4df89abbd9d4@kernel.org>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <687aad50-6e37-dab9-71a0-4df89abbd9d4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 2022/2/17 16:42, Krzysztof Kozlowski wrote:
>>   .../boot/dts/loongson/loongson64-2k1000.dtsi  |   8 ++
>>   arch/mips/boot/dts/loongson/ls7a-pch.dtsi     |   7 +-
>>   4 files changed, 140 insertions(+), 5 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
>>   create mode 100644 Documentation/devicetree/bindings/display/loongson/loongson-drm.txt
>>
>> diff --git a/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml b/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
>> new file mode 100644
>> index 000000000000..64d8364b50ab
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
>> @@ -0,0 +1,114 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id:http://devicetree.org/schemas/display/pci0014,7a06.yaml#
> The file name looks different than ID. Does this pass `make
> dt_binding_check` validation?
>
  I run make dt_binding_check, it say 'dt-doc-validate' not found!

Ensure dtschema python package is installed and in your PATH.
Current PATH is:
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
make[1]: *** [Documentation/devicetree/bindings/Makefile:12: 
check_dtschema_version] Error 1

make: *** [Makefile:1398: dt_binding_check] Error 2


