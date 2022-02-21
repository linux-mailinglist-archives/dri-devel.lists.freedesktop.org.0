Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC544BD8E3
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 11:01:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D143710F378;
	Mon, 21 Feb 2022 10:01:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE34D10F2A9
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 10:01:53 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id d3so10410736wrf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 02:01:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YZ+si3odyYtBfKCwmZtlljyYoUebhhvf4uslsh/s+F4=;
 b=d8cTQr1kPqH5MIr5D3dAqmCZtc37/RleZA6NK1HFBkhZrEoJmQ1Tyf9CYpJvvYJzj9
 8GJ/Aof2iwQlsvS0D5uhtpZmPHygGNARW7qokCKqJFabObNEFv7ZpCHH9EVhHTMZlK1B
 0VsHc6eutuN5lFCt7hkLtfzCr+B4pMRYgNxvp3DA0n6Wclg5AYC+QtYQHvNs0tDuKjDF
 BCaXw483rjeQAjEmjdsNfCUvrjdB5XIqRtuBK4M1tyqacy35QFmGX0aZqxOAxdYa8FNG
 Zv2aR4sseOzR9Zx9ZhsY2bWsgu4zoDAEBU/CceJbxAjfKHVqd4fLJzaPI8BCLoBaOFgk
 3/5g==
X-Gm-Message-State: AOAM532UZIrq89bO1dDfnIXFmwq3PR94MyXLV+8KdbXPxMf2cu2mlN0l
 vKEPve9xFp12A8RmVwkJH4s=
X-Google-Smtp-Source: ABdhPJxiSwRwEHfd8Q+eqMRaMd1mC5EXxdtAwlKOfu4jlIozdrPKqmXsyZiymQ3sUemzBc2KSw7yWQ==
X-Received: by 2002:adf:fb8e:0:b0:1e3:241b:218c with SMTP id
 a14-20020adffb8e000000b001e3241b218cmr15194533wrr.359.1645437712057; 
 Mon, 21 Feb 2022 02:01:52 -0800 (PST)
Received: from [192.168.0.120] (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.googlemail.com with ESMTPSA id q76sm7668095wme.1.2022.02.21.02.01.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 02:01:51 -0800 (PST)
Message-ID: <acf6d02d-0e17-b84a-5bd8-9f5165f73915@kernel.org>
Date: Mon, 21 Feb 2022 11:01:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v10 1/4] MIPS: Loongson64: dts: update the display
 controller device node
Content-Language: en-US
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 Sui Jingfeng <15330273260@189.cn>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
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
 suijingfeng <suijingfeng@loongson.cn>
References: <20220220145554.117854-1-15330273260@189.cn>
 <20220220145554.117854-2-15330273260@189.cn>
 <08abcb14-f1f6-8be5-6309-cd16e0578c05@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <08abcb14-f1f6-8be5-6309-cd16e0578c05@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/02/2022 10:19, Sergei Shtylyov wrote:
> On 2/20/22 5:55 PM, Sui Jingfeng wrote:
> 
>> From: suijingfeng <suijingfeng@loongson.cn>
>>
>> The display controller is a pci device, its PCI vendor id is 0x0014
>> its PCI device id is 0x7a06.
>>
>> 1) In order to let the driver to know which chip the DC is contained
>>    in, the compatible string of the display controller is updated
>>    according to the chip's name.
>>
>> 2) Add display controller device node for ls2k1000 SoC
>>
>> Reported-by: Krzysztof Kozlowski <krzk@kernel.org>
>> Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
>> Signed-off-by: Sui Jingfeng <15330273260@189.cn>
>> ---
>>  arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi | 8 ++++++++
>>  arch/mips/boot/dts/loongson/ls7a-pch.dtsi          | 7 ++-----
>>  2 files changed, 10 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
>> index 768cf2abcea3..af9cda540f9e 100644
>> --- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
>> +++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
>> @@ -209,6 +209,14 @@ gpu@5,0 {
>>  				interrupt-parent = <&liointc0>;
>>  			};
>>  
>> +			lsdc: display-controller@6,0 {
> 
>    Shouldn't the node name just be "display", according to the section 2.2.2
> of the DT spec?

lcd-controller, led-controller. As I understood from the bindings, this
is not physical device displaying something (like a panel) but rather a
device controlling such panel. Therefore display-controller feels
appropriate.


Best regards,
Krzysztof
