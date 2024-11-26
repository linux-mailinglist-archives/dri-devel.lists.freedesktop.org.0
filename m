Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BB89DA44E
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 10:01:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF18810EA45;
	Wed, 27 Nov 2024 09:01:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="ZFYpHJTe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0376410E80B
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 10:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oldschoolsolutions.biz; s=s1-ionos; t=1732615388; x=1733220188;
 i=jens.glathe@oldschoolsolutions.biz;
 bh=UqgJ48Ha4CrAwJTSYwvED1Nl9FQ6CTIHGQ+zfspe6IA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=ZFYpHJTeVmiUWMNO63QGXvBqWzvbL+yRFXwGO/dzj2aAU4ZOuHg/DOPtYnMJohQi
 11BPkAd4Xgm5hrOvVCgGIH+y8Yiq6zbBjmalY8hAhjpMRzIMcXT9ic+T2Sry9oZ2J
 Cos2TOFSQwQtY4AX6qI24sALujX7HsfvqhVn2KFk0aGGlpRd759YXaQBdf4frH4GW
 J532fA2S+NoiRkZNC6zW2G2G1kebfb0uZ9ZLhfuksm7URj2n+pkZG15+qaN+1NMmg
 750r7SkyQMUYBHxYv5mzofbZlezSwvA3h/yeuDNDwbSYuocME9SVWN/jfs07vJOpH
 oMeUmunHfJ40vjSQRA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.128] ([91.64.229.215]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MsI0K-1ta9Je12z4-012Kg7; Tue, 26 Nov 2024 11:03:08 +0100
Message-ID: <1fb0ffd8-1e11-4d9e-a935-29ea4e30c8fd@oldschoolsolutions.biz>
Date: Tue, 26 Nov 2024 11:03:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: arm: qcom: Add HP Omnibook X 14
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kalle Valo <kvalo@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20241124-hp-omnibook-x14-v1-0-e4262f0254fa@oldschoolsolutions.biz>
 <20241124-hp-omnibook-x14-v1-1-e4262f0254fa@oldschoolsolutions.biz>
 <dgilzuguxfvzqndp4rjm4hlhejgporfvollk4sqwquk34g4pka@dinzg2kfk4x2>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <dgilzuguxfvzqndp4rjm4hlhejgporfvollk4sqwquk34g4pka@dinzg2kfk4x2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:p95dLl39HAqGZyMZQe3at5sITGCOt38D4bkBO1HRwGKLBRasN+l
 miro5BoYdM1w3n66ThYdEwzBMMV/X5cVGMQKSKjAqCvl56jp526rZjoffmPRBm4oKlfZZiX
 PNHMfTivmIFPnk9f04D8kBEWxdJpB/FSrtFMXo/bDSwFIlWohIaVIBiK2/uoEWcLJR7eZiO
 OQeUjc1mXLQOcuIsjCfww==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:pRIZmmqolrU=;hI/eIL1WwJvTXkalpqND3TlMDP1
 gqqG2QsshkTSDqWGZe0a6NJrfMXGKzq9WHm657kLz53Ys92mm2JOFkCdP4MoNnZvASI9FA7RA
 klWOpkJ5AtuhyFDL3H4YN5hqg1ltPIEmOWqqd/KbhztiKwr9Vuq6onAcNYHAAe2kwIH15vvjV
 hF1pRO0Zcw+6628ddWR4Yp2hVS9eVK1M60X+BVl0dbINjsd0lMCxkLjUYW8jI5x0miJdw33WQ
 3Jy8z8xp1Q3EZbatqU14roUUai6CwF1e/hLxEElPbS9xw0qiLl4YYnbWLP1E+P+5Cu1i0adLb
 ZCyrkCmGoAySBZtW5LGqMNp9JvboCw8ZcxD5jHPj1MZ76jLBuxLk6BgPA0xDdwx2CPdDsk8Z3
 Tl9nk7HxUU0THr1m4rbdGMwXy7N9T7LjgX6gjq32dUnXDHKxmnfIJWTat8s0H7XNht0kSlsqX
 Httow8a8xOjV6XG860cFF1mV+VKI/IMSS1Ky2vqGHdZCCLyLUcG/HHTXfypmAv4bS2NOmgXg/
 xe45z3rsaImV0t6qVFDzfVOXdo0H83IQFbfNRyyIQeqyFyrnOUvBQk/kKYIvnetkdvczJQJvP
 yyqwJ/fKpEoaI0XFp7T5OQVczTt6sjj3GxzYJJOk5XKT0j9Shsisa6EnKiQSBTYxh5d7c/joC
 PBS1Rv18hBvgTLjbew5yxpOgHpRc+uLcUWn0JL3MR4wRjQBvjHGghy76chTq69+TT+WnK9/4c
 y1c/81f0KV68g6Aw58/qdiNfD4Qt79u7s2oK++ULpVTr+W6zVYCAg6xH63dp7hwd5hbApApX5
 Z24fAab67bLjNo/1ptOPh84dReQJCC/ZIE8GRnaXQP/ffj200lRc4wRAUIU7t2V9+e
X-Mailman-Approved-At: Wed, 27 Nov 2024 09:01:48 +0000
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

On 26.11.24 08:34, Krzysztof Kozlowski wrote:

> On Sun, Nov 24, 2024 at 02:20:15PM +0100, Jens Glathe wrote:
>> Add compatible values for the HP Omnibook X Laptop 14-fe0750ng,
>> using "hp,omnibook-x14"
>>
>> The laptop is based on the Snapdragon X Elite (x1e80100) SoC.
>>
>> PDF link: https://www8.hp.com/h20195/V2/GetPDF.aspx/c08989140
>>
>> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>>   1 file changed, 1 insertion(+)
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Best regards,
> Krzysztof
>
Thanks!
