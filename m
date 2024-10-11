Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 853AE99ACCE
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 21:38:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7626210E0AB;
	Fri, 11 Oct 2024 19:38:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rocketmail.com header.i=@rocketmail.com header.b="p/acxGKB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic312-26.consmr.mail.ir2.yahoo.com
 (sonic312-26.consmr.mail.ir2.yahoo.com [77.238.178.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7A410E0AB
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 19:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rocketmail.com; s=s2048;
 t=1728675490; bh=QHU4ALk3cTM5qiCcrJHDaLD0EAmeKUjtEkJMuDli6Zw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To;
 b=p/acxGKBQTPH2QpSv9zYQTCr1lf/G/gZqwUy/uv5IGMiOb2mkV40LSUvkWpX3/SWwoadZvZzlkpSd8kX1XURLzQpLAtDUNMJSoRraDLK9g7fQmYbXOD7O10OPhVrn/EYcPOqg2BGikciADtwdM4/z70m57zy/5WC03+yAqV//yZVVvYrcPAO/TDOoAChA5EqCvdYjL7OD2iTb+U8LdivDwahmVYAyhM+3U4it/3DH3zKcRc0FZAa3ch4XL+JFQvCLgmSR/sxn+ruH0GoMxOI/1WISQMLNcqNukiu7HL9gu1MSxADU2KsH27gY9XXGMLGf1+jWqZE6SxyE4exNKYUzw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1728675490; bh=LkLpuM0mI2FQr8vHuYRDzk4GeuP/tcWNVMGHOdHqbnD=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=ZiANrrkDdi6NUJ1B6ypO1XGYQbJy/Y8Lyuo8TImkHHd8ZWIQs0saPTCaoKgLEFtoYNqFUH4/tz1JyE4saQKVTlUhJrRVBE3f+GARdE6XKYtnz+oUNRzq4P6EDFp3x709pb8daOuU4QE0c+xLhTojKmb/IbAZgxVgy0oNobjEjbTGTiTXNmNqHmZnOMpMcfa5fPwIA2zzATE9nKExOjG4SBw9xTH86HwcMtFE61FsmizxLpcotU2A70rU6yv+wkk4R9FhaKJp4xqy35UA2KHIAzVw/TK4/eds4n56emCOv0jliQ4jtSJZs+FuKFdhpOnsK46ayJ92Z8YrEcsRcVqpxQ==
X-YMail-OSG: jAjLiloVM1mS9fp457dg_f885bMLaN2gZIHC2hZivi0_.6aFaauMCeRBEUB9A60
 8O20OMM6dttqEFUdbjTZobqBQQIwJwSDeXWCj9B2_I35ptEXj45CuQ5hmpBsm4sKvIr10LLzAV1b
 mVqMo82LaW0Pn9sTv5jmB3MsNXREPkuTkI9sZcqhwASVXSqfIDJcS2KUx9sobx1ej7rM0Oe1suM7
 rtYZaavLDftmcoBkSF1W3sAjy2MqxyMM3fRGvKRty9whL6PNgx9poDcRXCUndFMs7vqkAgossV3f
 cWAm85em9LY.GjFV_cjCg_J3TWYvs1Tibtmnr59GErAtqe7Jc4o0JrBkQIgxOA.0mL.mr5P8LFMv
 hXqz7jDirV4xJVu0u5umXxkEEL2GEeSEt3aQmyX60HyLS_2.j9lK11VE_CTuxpUQ0qLo1OMnIVdd
 EzqJhVbDIcBDoIFXMtcZtxJ7hAK5lWrwxFX1vgxsnOBdWqkYAbS5_B1RK854hD_Otj5aMPvlIsB9
 LbywxoQGZy1wLJw1TLenrSl2F0IYKtVTCTRp7UT3ML7hNIxOpfw13HAUWeMoOnDe8aXJeNdN6.ks
 OdlTAl5nFdaNRuVvkIWdoiYeN0b3sp0v6Wy9Fl4iSHCYIlQ71CYe1b5Ghv8B2q1LOWkBp8wtfkih
 8paZ8KdCW_l9MvzCw6UHcxkRj47nmDZI87XIKP3XISDJavLEyEe2oxb2MswQ3BjaDVYq0ihd6mmR
 faTq1Ve0lEa138twmxCO7pHz9uu28R9JlnXzkGso6h59_oQOchlcmMDRkkHdCPPDw.qRDH89MvDg
 PMGYfZ6gW5zIxTayCgspSDuJ7Ii.Zr1qTrScbx7H7wFV4nL7UerTxjaBhhzh9PN1EQM44kdTvnY_
 p9QpSX4IdigizttSxrS3zmwKbIZRYBk5yTOrimgse4dqP9PwqGrnIVDWFaGXxRxWbS246w98Hg6h
 mEGx.x63ftuctcmEClkZPPkzaam.C4wRm76808FKDcwTeNEuKnlePoc9ppyhELx84ANynw4pUqAW
 .fNhSYnTaqxXuNUMwwqKPDyOZLC7xiVa7ICkvM7BHK3ysuH3OQIPGikQt_KMfo0dWzFvUuA7PrEu
 SgTTy45o_T1um4XG0PKumP_dS._r6lRqjk3umdn3vX8_ahlYfYGReDt.LvfxIBfU_y7uQLTItsey
 5vODdB2WnkcxfkB45rrC6bDbRb.cD42z9tyY2PU.76MwRiAyPnPddrjqELgGtmk3Mxo1n25_LVqH
 Rp7jUUbymEmMpIErKW5Y6lE0gsKIFsD.yz_rrowOMjsgH8ePXECkWEFG0xTlYaCypo053e8lvhki
 siTi9OWX83ycPIxpVoG8TKMZWx2CG8_lrOIC0k1qyiRcmLaiMfaI8epotN9IsK4g36zolpEdCCRW
 7stykNjpjvpMw0dhcWHITIpaIIQzbsLLWWa_u9KKdMfS516AweRKYeEQoccOrhSM5GnGPG1Eg6sf
 J6jcFIy4OsW1uqMIPjeFjvg190LgfNDBGy4JeNdtnfKguzRlsZxQJIm7jdTEQfGfLJphZqlxIVPn
 9cO2jTevsMVDeNjUuK5Rgej6ZadjObvNIrkxoU1oMqFBCim5zknefkj399Dw6qj.oC8zxn8VMT0M
 Bj_n1b569GZigt.AXLkNxbIqF3EtCyUNzM2elcOPGvQdgYADsdIOb5epuwyi4fnNkUnFeB9Xwjtx
 bsq0c2XkvZQf4KubrWsTRswtLvpjxmdFgv2CdV7cGZ0SRpX7.VB5oifCPMoxpvfaU8zdCAqF1CwW
 8C0RfJsthCrZh0p9DKiM5aFkSY5FOmG0nV7UcSHg7uS.uTzpGTR3tiyOVpMIyI0npR1CUDW1J0_F
 eZc9W7t_y4GTRUuF6Fj6ZdRQaqW2gAxr4aTeKKYegcK7sUdtxuB6jFpSiN0pwisp_77MvM0MUShH
 2DxB2dFbnEDlkZ7.iJ1JIm9z_273W.lDqnAn09zcFoGPUWvK.JvcgQu0Kw2UXBw43F29f0WvQZpF
 sUGq2lKsU8cuGbd_f_ZnkXAs84n_ounnLo0U831iq8wJP4i2QZFDz4L8GuO1_cFNCNh4kDRLBpxl
 9UYBlxXVIXJIzOz4EWikWFDAkQYwF.n.D13mntYpIg.V5OhR90ILMEo.tj2NWtnm07bNhnib20Mw
 EWCg6NGgrBaLPAYLoUmk0rICRW1KZ2esW7ZtlnDJdTPvI9h2AxncXn1O4ZlyInq1e5FltjXwhN6t
 g_aRBmHuWVRf3PzXjhiumCTmkWw2Gt6sK7FiA6M0oOMPF9LiOXDm53uRf98CL.8NdXvHrxiTIqwA
 fhmhw9LbDDvdEneNsli2gNG3IRe089XTuL6Z5nD_KHvjynlEDr3mWFw--
X-Sonic-MF: <jahau@rocketmail.com>
X-Sonic-ID: 7a86045a-0f5a-4289-9ff9-b5e3813d05d4
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.ir2.yahoo.com with HTTP; Fri, 11 Oct 2024 19:38:10 +0000
Received: by hermes--production-ir2-6664f499fc-6rh2p (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID bf19aae88d6458a459d6c2da51db105c; 
 Fri, 11 Oct 2024 19:38:06 +0000 (UTC)
Message-ID: <50eda01a-2948-49e9-9b1f-eb38367d238b@rocketmail.com>
Date: Fri, 11 Oct 2024 21:38:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: display: panel: Add Samsung
 S6E88A0-AMS427AP24 bindings
To: Rob Herring <robh@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Andrzej Hajda <a.hajda@samsung.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <cover.1728582727.git.jahau@rocketmail.com>
 <3d754a2ee538d4c99ab71340706297d54b767c35.1728582727.git.jahau@rocketmail.com>
 <20241011142709.GA2289410-robh@kernel.org>
Content-Language: de-DE, en-US
From: Jakob Hauser <jahau@rocketmail.com>
In-Reply-To: <20241011142709.GA2289410-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.22806
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On 11.10.24 16:27, Rob Herring wrote:
> On Thu, Oct 10, 2024 at 08:31:48PM +0200, Jakob Hauser wrote:
>> Add bindings for Samsung AMS427AP24 panel with S6E88A0 controller.
>>
>> Signed-off-by: Jakob Hauser <jahau@rocketmail.com>
>> ---
>> Patch is based on https://gitlab.freedesktop.org/drm/misc/kernel.git
>> current branch drm-misc-next.
>> ---
>>   .../panel/samsung,s6e88a0-ams427ap24.yaml     | 68 +++++++++++++++++++
>>   1 file changed, 68 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams427ap24.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams427ap24.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams427ap24.yaml
>> new file mode 100644
>> index 000000000000..7010d3bbd07f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams427ap24.yaml
>> @@ -0,0 +1,68 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/panel/samsung,s6e88a0-ams427ap24.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Samsung AMS427AP24 panel with S6E88A0 controller
>> +
>> +maintainers:
>> +  - Jakob Hauser <jahau@rocketmail.com>
>> +
>> +allOf:
>> +  - $ref: panel-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: samsung,s6e88a0-ams427ap24
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  port: true
>> +  reset-gpios: true
>> +
>> +  vdd3-supply:
>> +    description: core voltage supply
>> +
>> +  vci-supply:
>> +    description: voltage supply for analog circuits
>> +
>> +  flip-horizontal:
>> +    description: boolean to flip image horizontally
>> +    type: boolean
> 
> This is already used in another panel. Please move it to
> panel-common.yaml.
> 

I'll add a patch in v2 to move "flip-horizontal" and along with it also 
"flip-vertical" to "panel-common.yaml". File "samsung,s6e8aa0.yaml" 
needs to be changed accordingly.

@ Thierry, Laurent & Andrzej: CC'ing you as you're listed as maintainers 
of the affected files.

>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - port
>> +  - reset-gpios
>> +  - vdd3-supply
>> +  - vci-supply
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +
>> +    dsi {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            panel@0 {
>> +                    compatible = "samsung,s6e88a0-ams427ap24";
>> +                    reg = <0>;
>> +
>> +                    vdd3-supply = <&pm8916_l17>;
>> +                    vci-supply = <&pm8916_l6>;
>> +                    reset-gpios = <&tlmm 25 GPIO_ACTIVE_LOW>;
>> +                    flip-horizontal;
>> +
>> +                    port {
>> +                            panel_in: endpoint {
>> +                                    remote-endpoint = <&mdss_dsi0_out>;
>> +                            };
>> +                    };
>> +            };
>> +    };
>> -- 
>> 2.39.5
>>

Kind regards,
Jakob
