Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E883139C7E1
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jun 2021 13:15:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E311F6E4F4;
	Sat,  5 Jun 2021 11:15:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9838A6E4F4
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jun 2021 11:15:02 +0000 (UTC)
Received: from [192.168.1.101] (83.6.168.161.neoplus.adsl.tpnet.pl
 [83.6.168.161])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 7191E3E913;
 Sat,  5 Jun 2021 13:15:00 +0200 (CEST)
Subject: Re: [PATCH 1/2] dt-bindings: Add SONY Synaptics JDI panel
To: Rob Herring <robh@kernel.org>
References: <20210525113105.52990-1-konrad.dybcio@somainline.org>
 <20210604201841.GA3834184@robh.at.kernel.org>
From: Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <f68df9d6-7d17-12d0-5d4f-686482b9185e@somainline.org>
Date: Sat, 5 Jun 2021 13:14:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210604201841.GA3834184@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jamipkettunen@somainline.org, Thierry Reding <thierry.reding@gmail.com>,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 angelogioacchino.delregno@somainline.org, marijn.suijten@somainline.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


>> +
>> +maintainers:
>> +  - Konrad Dybcio <konrad.dybcio@somainline.org>
>> +
>> +description: |+
> Do you need the formatting? If not, drop '|+'.

I'm not sure whether I do, so I guess dropping it is fine.


>> +  This panel seems to only be found in SONY Xperia
>> +  X, X Performance, X Compact, XZ and XZs
>> +  smartphones and we have no straightforward way of
>> +  actually getting the correct model number,
>> +  as no schematics are released publicly.
> Odd choice of line break length. 80 char please.

Right.


>> +
>> +  preset-gpio:
>> +    description: panel reset pin
> What's reset-gpios then?

reset-gpios is an overlook on my side :)


>> +
>> +  pvddio-gpio:
>> +    description: panel vddio pin
>> +
>> +  treset-gpio:
>> +    description: touch reset pin
> Use '-gpios'
>
> And need to define how many (maxItems: 1).

Right.



>> +    #include <dt-bindings/gpio/gpio.h>
>> +
>> +    dsi {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +            panel: panel@0 {
>> +                    reg = <0>;
>> +
>> +                    pvddio-gpio = <&tlmm 51 GPIO_ACTIVE_HIGH>;
>> +                    preset-gpio = <&tlmm 8 GPIO_ACTIVE_HIGH>;
>> +                    treset-gpio = <&tlmm 89 GPIO_ACTIVE_HIGH>;
>> +
>> +                    vddio-supply = <&pm8994_s4>;
>> +                    avdd-supply = <&pm8994_l2>;
>> +                    tvdd-supply = <&panel_tvdd>;
>> +
>> +                    backlight = <&pmi8994_wled>;
>> +
>> +                    port {
>> +                      panel_in: endpoint {
>> +                        remote-endpoint = <&dsi0_out>;
>> +                      };
> Consistent indentation please. 4 spaces is good.

Another mistake, ack.


I'll send a v2 shortly.


Konrad

