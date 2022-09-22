Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D475E669E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 17:16:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB69110EC00;
	Thu, 22 Sep 2022 15:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 569DC10EC00
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 15:16:14 +0000 (UTC)
Received: from [192.168.1.101] (95.49.29.188.neoplus.adsl.tpnet.pl
 [95.49.29.188])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 9E8ED1F690;
 Thu, 22 Sep 2022 17:16:11 +0200 (CEST)
Message-ID: <e9d55a49-e3c6-a6b2-43e1-8e643dc49d58@somainline.org>
Date: Thu, 22 Sep 2022 17:16:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 1/2] dt-bindings: display/panel: Add Sony Tama TD4353
 JDI display panel
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20220922135902.129760-1-konrad.dybcio@somainline.org>
 <02f44228-866a-f096-1e90-dfbd31660491@linaro.org>
From: Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <02f44228-866a-f096-1e90-dfbd31660491@linaro.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 jamipkettunen@somainline.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, martin.botka@somainline.org,
 dri-devel@lists.freedesktop.org, angelogioacchino.delregno@somainline.org,
 marijn.suijten@somainline.org, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 22.09.2022 17:11, Krzysztof Kozlowski wrote:
> On 22/09/2022 15:58, Konrad Dybcio wrote:
>> Add bindings for the display panel used on some Sony Xperia XZ2 and XZ2
>> Compact smartphones.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> 
> Thank you for your patch. There is something to discuss/improve.
> 
>> +
>> +  reg: true
>> +
>> +  backlight: true
>> +
>> +  vddio-supply:
>> +    description: VDDIO 1.8V supply
>> +
>> +  vsp-supply:
>> +    description: Positive 5.5V supply
>> +
>> +  vsn-supply:
>> +    description: Negative 5.5V supply
>> +
>> +  preset-gpios:
> 
> How about bringing them closer to common GPIOs:
> panel-reset-gpios
> ?
> 
>> +    description: Display panel reset pin
>> +
>> +  treset-gpios:
> 
> touch-reset-gpios
> 
I can do that. I will however wait with resending in case somebody has comments
on the .c driver.

Konrad
> 
> Best regards,
> Krzysztof
> 
