Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2BE76C62E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 09:14:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F5D10E4C9;
	Wed,  2 Aug 2023 07:14:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B3410E153
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 21:29:25 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fe24b794e5so19634725e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 14:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690925363; x=1691530163;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dvrJDYhMh0ipsbPLtlBKb2BJs11MXVwQDoPuVVK7f6M=;
 b=kEgM6t5w0gCQ99Zb4xGrUZS/0V5cGqtyVWtNpJAJJakP73exH890uNC5PtuWpR4/6l
 Q4x6tZNiHP8N43YvRzLN+TpWGkFv0I1ByF7pr146qk6ws9Ih773A38HbpPGYfFoZMAsv
 DYKODbyrKsn8aauPjYrlT+Ycf2KBFRca+mhEHQbI2AO4cHBwVDvb0pCz3IQUTdgGKeZz
 CKk7wpICDKe1BvCsfSMt2Hjt7QeNLYaZNsumcHjp5RPeduKmvsEp2EeDdkGQG6YmycOI
 chmHwTlBLcDeuN0fbHp/8A9WtLx4r5y8gRJ+LSEaXk67yyCCR5faGlsbTv2DlV45TbUk
 aSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690925363; x=1691530163;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dvrJDYhMh0ipsbPLtlBKb2BJs11MXVwQDoPuVVK7f6M=;
 b=YD3+XVXio50KdJfRkTNyYVZLprYwK7n91ktJZnbjNdi7bi/klLBNK6hLr6py3mWoBp
 gkLV9fBAFMGaQ00BUx12GeeMG5yTDTjcwCWPoBsCHdLiNG8VYOEMG3tj8+Khl7J1quoX
 cPGNriK9emIApp8JrIjJbQhjoiUCLAZqtJlFSGpv7OWW5KiOqSbRSqX3+6zUFoUGF+z1
 cuAZaQtygH/lBq+vIrRRgxJ2vl+nodVa6d80OOiR+JVeKTahRWFj/HaEN8fwft2RO9Kh
 +o6+m2cfkCn33tH5kHyKBlyEgzPU8+YWJyYWp0n33L4h6x39xWhFj/CyBgWaKA+fzm9e
 7JEQ==
X-Gm-Message-State: ABy/qLbtE6PGDlgU5F5FOthSVfhL19tpYpB1yNBR+RMSQmkn8POvPne2
 J5LJ3zJAAmFGkPbfaUBlv4A=
X-Google-Smtp-Source: APBJJlFTwE67qCLWrvjvM7nS+hdpSjfdyeAfkDg+wdrDBPbNEjGvOKRgjysckZ0D0y+5wqUUwc/tIg==
X-Received: by 2002:adf:ef8b:0:b0:307:8c47:a266 with SMTP id
 d11-20020adfef8b000000b003078c47a266mr3095894wro.61.1690925363133; 
 Tue, 01 Aug 2023 14:29:23 -0700 (PDT)
Received: from ?IPV6:2a02:908:8b3:1840:e7fa:7d4d:a96f:4b43?
 ([2a02:908:8b3:1840:e7fa:7d4d:a96f:4b43])
 by smtp.gmail.com with ESMTPSA id
 z1-20020adfd0c1000000b0031424f4ef1dsm17257809wrh.19.2023.08.01.14.29.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Aug 2023 14:29:22 -0700 (PDT)
Message-ID: <310fda11-c74a-118a-9975-40e2cfd26465@gmail.com>
Date: Tue, 1 Aug 2023 23:29:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/2] ARM: tegra: transformers: add connector node
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>
References: <20230618085046.10081-1-clamor95@gmail.com>
 <20230618085046.10081-3-clamor95@gmail.com> <ZMKJE1G87-jWeg2_@orome>
 <5A2447D3-DB49-4788-AA05-182AF0F04ED2@gmail.com> <ZMKgW6eYpJVqeZJM@orome>
From: Maxim Schwalm <maxim.schwalm@gmail.com>
In-Reply-To: <ZMKgW6eYpJVqeZJM@orome>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 02 Aug 2023 07:14:07 +0000
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 27.07.23 18:50, Thierry Reding wrote:
> On Thu, Jul 27, 2023 at 07:26:28PM +0300, Svyatoslav Ryhel wrote:
>>
>>
>> 27 липня 2023 р. 18:11:15 GMT+03:00, Thierry Reding <thierry.reding@gmail.com> написав(-ла):
>>> On Sun, Jun 18, 2023 at 11:50:46AM +0300, Svyatoslav Ryhel wrote:
>>>> All ASUS Transformers have micro-HDMI connector directly available.
>>>> After Tegra HDMI got bridge/connector support, we should use connector
>>>> framework for proper HW description.
>>>>
>>>> Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo.com> # ASUS TF T30
>>>> Tested-by: Robert Eckelmann <longnoserob@gmail.com> # ASUS TF101 T20
>>>> Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # ASUS TF201 T30
>>>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>>>> ---
>>>>  arch/arm/boot/dts/tegra20-asus-tf101.dts      | 22 ++++++++++++++++---
>>>>  .../dts/tegra30-asus-transformer-common.dtsi  | 21 ++++++++++++++++--
>>>>  2 files changed, 38 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/arch/arm/boot/dts/tegra20-asus-tf101.dts b/arch/arm/boot/dts/tegra20-asus-tf101.dts
>>>> index c2a9c3fb5b33..97350f566539 100644
>>>> --- a/arch/arm/boot/dts/tegra20-asus-tf101.dts
>>>> +++ b/arch/arm/boot/dts/tegra20-asus-tf101.dts
>>>> @@ -82,9 +82,11 @@ hdmi@54280000 {
>>>>  			pll-supply = <&hdmi_pll_reg>;
>>>>  			hdmi-supply = <&vdd_hdmi_en>;
>>>>  
>>>> -			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
>>>> -			nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7)
>>>> -				GPIO_ACTIVE_HIGH>;
>>>> +			port@0 {
>>>> +				hdmi_out: endpoint {
>>>> +					remote-endpoint = <&connector_in>;
>>>> +				};
>>>> +			};
>>>
>>> Does this need a bindings change? nvidia,tegra20-hdmi currently doesn't
>>> support OF graphs, so this would probably fail to validate if we merge
>>> it without a corresponding DT bindings update.
>>
>> drm/tegra patch is backwards compatible and connector node is optional.
> 
> We still need to document the connector node, otherwise the DT
> validation will complain about port@0 being used here, won't it?

this change indeed causes several new warnings:

    /mnt/linux/.output/arch/arm/boot/dts/tegra20-asus-tf101.dtb: hdmi@54280000: 'port@0' does not match any of the regexes: 'pinctrl-[0-9]+'
            From schema: /mnt/linux/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml
    /mnt/linux/.output/arch/arm/boot/dts/tegra20-asus-tf101.dtb: hdmi@54280000: 'nvidia,ddc-i2c-bus' is a required property
            From schema: /mnt/linux/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml
    /mnt/linux/.output/arch/arm/boot/dts/tegra20-asus-tf101.dtb: hdmi@54280000: 'nvidia,hpd-gpio' is a required property
            From schema: /mnt/linux/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml

BTW, the parallel RGB port isn't properly documented in nvidia,tegra20-dc either.

Best regards,
Maxim
