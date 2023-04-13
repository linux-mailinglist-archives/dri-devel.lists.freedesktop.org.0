Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5696E0959
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 10:52:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4242E10EA80;
	Thu, 13 Apr 2023 08:52:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED4010EA80
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 08:52:36 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 he11-20020a05600c540b00b003ef6d684102so5890934wmb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 01:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681375955; x=1683967955;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qbpMYUm2CE6fjv2A+zaOllAKnd6lk3Qd3AHGhhmkm+E=;
 b=HnpySm5xmwPhooXdE/eWdYCyuS800PJRr0sF9uWCs073RxT9dO6p7iMXu6ILDLZ7zP
 4d4E221WENcpoKtiiIM9zeUYH0DMw1AXa9WdXmx1n6w0fMixp23F1HBhkcDvvReyYbU/
 QqfE2is2eHEHTcj0GysdXh7IaVfzLC4YVq8MjWSK0kg+tpCW3udF4NcPpz8NT9EazIsS
 cD/Our85/CIKOO0lTgVqfVuRLzMAh8dkjo27ia6/HLhm0yIOPdIMtNp2Lubo+x9xQ2gX
 eHO8Nz2s2R9eiM5qT2XBr+/lEdFPn3cCbKNE1i6m2dQtOb/wNmorAts0OIgKoKQqBuTu
 qR8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681375955; x=1683967955;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qbpMYUm2CE6fjv2A+zaOllAKnd6lk3Qd3AHGhhmkm+E=;
 b=B4cAGhNIf3UOI4nORbvK55RqXGmuqmn3ozpU4jtIZuaLSoDNGpiSBLqMOSuizqSTQE
 o8iDIn7RIHXEOdrHo0moJDHdr39dgbjPlzrlNTT9lptx2/we8xRhtvBZ+CVST5OTcwDa
 fMhUVJ+mQaSvRM9yhufOPzoa3msreTta2wxuthNe+9iHZINDENEi/cj1zouGsCoasekW
 1/GyY9JqNmhwiFogV+d5hzip3C3hVCOeyp9sH6UHuA91/gkJC3vs1VxP24Q94Ri1S2sz
 alrZVmklbchy4VzIj1WVEd0+rEx8rizidLNbfwK0XAdHjdBB+orQYm44Pnl8uqHrtg7j
 1REg==
X-Gm-Message-State: AAQBX9d+hxf+wsG8jUBQ9D7RrbFhqXrksG4EM3op++daWMIDqyliJSuB
 +r8XyHAYZh+BZy01lon/cY8=
X-Google-Smtp-Source: AKy350bo2b5a9kvtAxKtfQWiGoPW5i8VySTNTjPFcwiTp3qfQEaU8P/r5OLKZVyAxMZ2gR/rW3SeaA==
X-Received: by 2002:a1c:7701:0:b0:3ee:3d2d:841a with SMTP id
 t1-20020a1c7701000000b003ee3d2d841amr929838wmi.24.1681375954444; 
 Thu, 13 Apr 2023 01:52:34 -0700 (PDT)
Received: from [192.168.0.32] ([37.222.243.26])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c1d0700b003ee443bf0c7sm4870877wms.16.2023.04.13.01.52.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Apr 2023 01:52:32 -0700 (PDT)
Message-ID: <5c0bc1f2-5917-ab84-8b0b-f2adc48f8be7@gmail.com>
Date: Thu, 13 Apr 2023 10:52:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 01/27] dt-bindings: pwm: Add compatible for MediaTek MT6795
Content-Language: en-US
To: Rob Herring <robh@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-2-angelogioacchino.delregno@collabora.com>
 <168133318912.3190428.16120880490622098945.robh@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <168133318912.3190428.16120880490622098945.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: chunkuang.hu@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
 phone-devel@vger.kernel.org, xinlei.lee@mediatek.com, kishon@kernel.org,
 kernel@collabora.com, jassisinghbrar@gmail.com, u.kleine-koenig@pengutronix.de,
 linux-pwm@vger.kernel.org, jitao.shi@mediatek.com, houlong.wei@mediatek.com,
 chunfeng.yun@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/04/2023 23:03, Rob Herring wrote:
> 
> On Wed, 12 Apr 2023 13:27:13 +0200, AngeloGioacchino Del Regno wrote:
>> Add a compatible string for MediaTek Helio X10 MT6795's display PWM
>> block: this is the same as MT8173.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
> 
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
> 

These are not new warnings. I think we should address them in a different patch. 
In my opinion it shouldn't block this patch. In the end it only add as 
compatible here.

Regards,
Matthias

> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
> 
> Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230412112739.160376-2-angelogioacchino.delregno@collabora.com
> 
> 
> pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	arch/arm64/boot/dts/mediatek/mt8183-evb.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb
> 	arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb
> 
> pwm@1400a000: compatible: 'oneOf' conditional failed, one must be fixed:
> 	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dtb
> 	arch/arm/boot/dts/mt7623n-rfb-emmc.dtb
> 
> pwm@1401e000: compatible: 'oneOf' conditional failed, one must be fixed:
> 	arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
> 	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb
> 	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb
> 	arch/arm64/boot/dts/mediatek/mt8173-evb.dtb
> 
> pwm@1401f000: compatible: 'oneOf' conditional failed, one must be fixed:
> 	arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
> 	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb
> 	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb
> 	arch/arm64/boot/dts/mediatek/mt8173-evb.dtb
> 
