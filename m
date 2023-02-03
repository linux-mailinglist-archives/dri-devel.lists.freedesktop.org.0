Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E0B68A26A
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 20:03:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F4B810E17C;
	Fri,  3 Feb 2023 19:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A3DB10E88E
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 19:03:00 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id m2so17949555ejb.8
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Feb 2023 11:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=29jIzExya+RWfAW2Qbt80/MjJ8msw/RiyH3xynOp0go=;
 b=oMo2cuU46YEgGPpTn9tuc/nAV/JSYX82IVQ6fcR+rdup7Ro+7QIAvMc7u6RiSGRj8k
 lp9nfSG/RpNEUhNlVlr3aHuBI3aSguVow4NcnE/ewGe34lBGVWV/kqNWsJOy1OnK0t3L
 NZOTslwltVza66DDVjiccIrt9Mj1iqvf0MvFj5aktxMyYaVyCUNmLfbTYpETGvQoZZLl
 Zlo8M52dFVI2lLPRKKBBQ/2yVXzejK05Re6uVMSp9ZwTa2kwn4pNA69mS2AJNWjKeppQ
 bpYZT5kzF3xGiYl5fSPXLPZdkqxZ5TeagP+owJI5o0IjNhddaRbAOFg5AEXmSVoieJpR
 VfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=29jIzExya+RWfAW2Qbt80/MjJ8msw/RiyH3xynOp0go=;
 b=y/bCE1bm9dVqy4XKwgl4Kp35aERqSvQRbmS7LyoBt4b3euWOPWsf0PRvbjYZLlucxF
 ark4l4dQ9prrDawgAaK7f49MJSHr5xp/mo5UW9DO17O1FLeFxPRyC/UaslsCvEaPRqTh
 6HgFibr1e7dJ9aYcJUAyM6ZcEWXXtFxYj4mqmZTltkcM7JlnYTQv5gXeUY0/jXHSMlVw
 soT4/gdAR8CEYhTyNBpuFgEtYGo9nNZ2VDPhHWJGBB1DCoHjtkkldRXa8qrTzQWeTeSH
 8FKxrVGe4JBXa9OflnfLFGXc9WVL8j+tmaOAGVrDDRzSmCHbzC/he4jjFdMQObitKJAb
 +N5Q==
X-Gm-Message-State: AO0yUKX8gfZTdvL2jn43XCnetXmS0+BLnjXvHJwApCD07iFr6QLT/Dk7
 vR1T2882ys5f/rCcMeaHVTU=
X-Google-Smtp-Source: AK7set86/Odr/8QqbXvAfvz/JdLTn2GEOFrSEDN8hur+e37l2t1Wm16nqqBVtmjhNt40O7gBxDbSww==
X-Received: by 2002:a17:907:d68c:b0:88f:8ae1:8bca with SMTP id
 wf12-20020a170907d68c00b0088f8ae18bcamr6189194ejc.62.1675450979058; 
 Fri, 03 Feb 2023 11:02:59 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 f17-20020a170906049100b00871f66bf354sm1710990eja.204.2023.02.03.11.02.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 11:02:57 -0800 (PST)
Message-ID: <87f5097d-1cd0-e09f-e759-8592a9165ea6@gmail.com>
Date: Fri, 3 Feb 2023 20:02:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v6 01/17] dt-bindings: display: rockchip: convert
 rockchip-lvds.txt to YAML
To: Rob Herring <robh@kernel.org>
References: <67771143-fd83-383d-41b2-68e8707134e8@gmail.com>
 <20230203182119.GA615242-robh@kernel.org>
Content-Language: en-US
From: Johan Jonker <jbx6244@gmail.com>
In-Reply-To: <20230203182119.GA615242-robh@kernel.org>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Laurent.pinchart@ideasonboard.com, krzysztof.kozlowski+dt@linaro.org,
 linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com,
 jernej.skrabec@gmail.com, linux-rockchip@lists.infradead.org,
 alim.akhtar@samsung.com, devicetree@vger.kernel.org, jonas@kwiboo.se,
 linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, sw0312.kim@samsung.com,
 hjc@rock-chips.com, robert.foss@linaro.org, andrzej.hajda@intel.com,
 philippe.cornu@foss.st.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/3/23 19:21, Rob Herring wrote:
> On Thu, Dec 22, 2022 at 03:22:14PM +0100, Johan Jonker wrote:
>> Convert rockchip-lvds.txt to YAML.
>>
>> Changed:
>>   Add power-domains property.
>>   Requirements between PX30 and RK3288
>>
>> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>>
>> Changed V3:
>>   Filename matching compatible style
>>   Drop "Regulator phandle for "
>>   Specify properties and requirements per SoC
>>   Sort order and restyle
>>
>> Changed V2:
>>   Fix title
>> ---
>>  .../display/rockchip/rockchip,lvds.yaml       | 170 ++++++++++++++++++
>>  .../display/rockchip/rockchip-lvds.txt        |  92 ----------
>>  2 files changed, 170 insertions(+), 92 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,lvds.yaml
>>  delete mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt
> 

> What's the plan for these patches? Don't see them in linux-next still. 
> Do you want me to take patches 1-8?

Hi,

The display patches normally go through the DRM git.
Patch 2 must merge with grf.yaml.
Heiko has merged now 3 PHY related patches to grf.yaml first.

[PATCH v6 02/17] dt-bindings: soc: rockchip: grf: add rockchip,lvds.yaml

See current
https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/log/?h=for-next&qt=grep&q=jonker

Not sure what Heiko's plans are.
Patch 2 replaces  only a description text and some accolades removal, so not "too" important.

I urgent then you could merge without conflict:
1, 3-8

Patch 2 requires some adjusted now depending on the grf.yaml current next state.

Johan







> 
> Rob
