Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB31F4B0E37
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 14:15:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D672A10E857;
	Thu, 10 Feb 2022 13:15:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C020E10E851
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 13:15:20 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id cn6so10836155edb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 05:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=IDFdLfJtlG9kbEXdQ+MVN7+prsgCVcqyHxP/Y3ykVls=;
 b=F8D9SmUjEPCEirAKI6VHBHib2i+fWwlv1wRVaJoxQQD9NzbzGzQYoIpDXMah0HpSYX
 hmvhSZUNjNxg30SnfCg++SAxqBSJ21w3S69bxTQsQitQdw7GQm0cYOcibxyRYTMptC95
 6LRh4lym49q5/2K6W+aCYK8Hzxxls+m0HnflKw7aAUABsGY3FSUmNo7Ej47wO5XBoeX4
 0Mgu/zveeDVFPy0jP9ZBL0ypXg8/GF/ys/fqT5deAEm/EyMz8sqIFXW5wXhFcJo4IkVy
 nKz9W5BVvjGuE/5Rl0oRqqgLakIZN3Naqlk+uHL+CJTisyxz+uGnlpUdLoHEliU1XBFK
 1+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IDFdLfJtlG9kbEXdQ+MVN7+prsgCVcqyHxP/Y3ykVls=;
 b=6MObZ0bsE507yc8bxCysOEdYddj6P4+5+rSdrBkj/teh2fd+xQWB7sYYYSes59v+tV
 MaC1wbNSniB9CnVtb0hPpBIeii5hAV3pJz83aedsPH8rnGzSyFYIgTZH8fpg3A8nzJHa
 1ql1jpBDRw6ANN1O3qPg1cjDvfLu5T9bIleMD9SNwbCDuJ2Q1HgzyR2/RInvvErCOGAl
 CatM1IDQNHBtJ21RJM/Qw5D6G7hO6LVaoHgC/ByRVmX9C36NFtLFEyQI90V6eIJ5v4+0
 qIOpw8+cHzD/EN5+YZHbglNz2nlFogyTje19D1yEYqYahATBKWmY7akMZugI9CpWLh3p
 rOqw==
X-Gm-Message-State: AOAM531MK39vpKd0GfhpYDuKO6s15LstokrMZpo1t1lQ/iaK1zC3QEZv
 1OaXxtcQtlLAmUnIcwOh680=
X-Google-Smtp-Source: ABdhPJzOMe5zGljbr+jECC1VrFrmXL0gmt9Ei+JTZ807FDeFFZDDLr8caxaTV4TkVYfkTnMd0jbfxQ==
X-Received: by 2002:a05:6402:2688:: with SMTP id
 w8mr8406868edd.393.1644498919204; 
 Thu, 10 Feb 2022 05:15:19 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 s8sm6949538ejb.59.2022.02.10.05.15.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 05:15:18 -0800 (PST)
Message-ID: <2fa2e53d-da1c-6957-33ed-f3e9806347cf@gmail.com>
Date: Thu, 10 Feb 2022 14:15:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 19/23] arm64: dts: rockchip: rk3568-evb: Enable VOP2
 and hdmi
Content-Language: en-US
To: Sascha Hauer <s.hauer@pengutronix.de>
References: <20220209095350.2104049-1-s.hauer@pengutronix.de>
 <20220209095350.2104049-20-s.hauer@pengutronix.de>
 <3492afbf-b9fc-d5f5-6f7a-2157442d8209@gmail.com>
 <20220210114746.GX18637@pengutronix.de>
From: Johan Jonker <jbx6244@gmail.com>
In-Reply-To: <20220210114746.GX18637@pengutronix.de>
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/10/22 12:47, Sascha Hauer wrote:
> On Thu, Feb 10, 2022 at 01:10:32AM +0100, Johan Jonker wrote:
>> Hi Sascha,
>>
>> Something with port and endpoint gives notifications.
>> Somehow with the conversion of rockchip,dw-hdmi.txt to YAML not all SoC
>> options were checked/covered (see rk3328 and rk3568).
>>
>> Allow multiple vop:
>> port or
>> port@0
>> 1x vop -> endpoint
>>
>> 2x vop -> endpoint@0
>>        -> endpoint@1
>>
>> Also allow for connector:
>> (not all existing DT have this yet)
>> port@1
>>       -> endpoint
>>
>> See also at graph.yaml
> 
> Ok, let me see if I get this right. The HDMI can either have one or two
> ports. It has one when the HDMI connector is not described in the device
> tree and two when it is. Also the first (or only) port can have one or
> two endpoints. It has one endpoint when the SoC has a single VOP and two
> endpoints when the SoC has two VOPs.
> 
> It's been a painful morning because my YAML knowledge is fairly limited,
> but here's what I came up with:
> 
>   ports:
>     $ref: /schemas/graph.yaml#/properties/ports
>     unevaluatedProperties: false
>     patternProperties:
>       "^port(@0)?$":
>         $ref: /schemas/graph.yaml#/properties/port
>         description: Input of the DWC HDMI TX
>         properties:
>           endpoint:
>             description: Connection to the VOP
>           endpoint@0:
>             description: Connection to the VOPB
>           endpoint@1:
>             description: Connection to the VOPL
>     properties:
>       port@1:
>         $ref: /schemas/graph.yaml#/properties/port
>         description: Output of the DWC HDMI TX
> 
> Does this look sane to you? With this a make dtbs_check on this binding
> doesn't generate warnings anymore, and even better it does generate
> warnings when I add some wrong nodes/properties to the dts files.

Hi,

Send a patch to rob+dt and he will let you know... ;)

Also could you test the ARM branch as well just for sure with:
ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make  dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml

Could you group your serie a bit:
dt-bindings
drm patches
dts changes

Johan

> 
>> ===
>>
>> dtc -I dtb -O dts rk3568-evb1-v10.dtb
>> <stdout>: Warning (avoid_unnecessary_addr_size):
>> /hdmi@fe0a0000/ports/port@1: unnecessary #address-cells/#size-cells
>> without "ranges" or child "reg" property
>> <stdout>: Warning (graph_child_address): /hdmi@fe0a0000/ports/port@0:
>> graph node has single child node 'endpoint@0',
>> #address-cells/#size-cells are not necessary
>> <stdout>: Warning (graph_child_address): /hdmi@fe0a0000/ports/port@1:
>> graph node has single child node 'endpoint', #address-cells/#size-cells
>> are not necessary
> 
> That's easy. I dropped the @0 suffix and reg property from the node.
> 
> Sascha
> 
