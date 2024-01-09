Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34ABC828D77
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 20:33:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 765F710E4D7;
	Tue,  9 Jan 2024 19:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3940D10E4D7
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 19:33:34 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 409JX9Hh038984;
 Tue, 9 Jan 2024 13:33:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1704828789;
 bh=BdEDKS8hhvM51dkV/2LyiEX6b3nmCoOluAwncBQuyoM=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=Yay6++kiwuufQCT4frGk2sl7wablzPORTN7i2S+J3fmg0/Nxwgh7CrGJ0bUF656Wx
 Fig3Fauo/KMWEoApgn17VlxZKD2A9zm2pOAfT9fZkR1ev5p7aMesoQ/vnCV2GrhNwj
 V6+kNI+zu+Lw7GnLX5qR82snObxy6VlciAlX0dS0=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 409JX9ke102629
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 9 Jan 2024 13:33:09 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 9
 Jan 2024 13:33:08 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 9 Jan 2024 13:33:08 -0600
Received: from [10.249.40.136] ([10.249.40.136])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 409JX7V1125021;
 Tue, 9 Jan 2024 13:33:07 -0600
Message-ID: <61b0c6c7-e5ad-4cbf-a020-230d96d43d3e@ti.com>
Date: Tue, 9 Jan 2024 13:33:07 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] dt-bindings: gpu: Rename img,powervr to
 img,powervr-rogue
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Frank Binns
 <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 "H . Nikolaus Schaller" <hns@goldelico.com>,
 Adam Ford <aford173@gmail.com>, Ivaylo
 Dimitrov <ivo.g.dimitrov.75@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, Tony Lindgren
 <tony@atomide.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Paul Cercueil
 <paul@crapouillou.net>
References: <20240109171950.31010-1-afd@ti.com>
 <20240109171950.31010-2-afd@ti.com>
 <11e3afae-76a7-4ebb-82ac-3dca040710dc@linaro.org>
 <d0c242ef-bb8f-49d9-bbb0-7922db2c322a@ti.com>
 <d584255f-87ee-48a7-869d-e2a0b40a52b4@linaro.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <d584255f-87ee-48a7-869d-e2a0b40a52b4@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/9/24 1:17 PM, Krzysztof Kozlowski wrote:
> On 09/01/2024 20:04, Andrew Davis wrote:
>> On 1/9/24 12:59 PM, Krzysztof Kozlowski wrote:
>>> On 09/01/2024 18:19, Andrew Davis wrote:
>>>> This binding will be used for GPUs starting from Series6 (Rogue)
>>>> and later. A different binding document will describe Series5.
>>>> With that the name "img,powervr" is too generic, rename to
>>>> "img,powervr-rogue" to avoid confusion.
>>>>
>>>> Suggested-by: Maxime Ripard <mripard@kernel.org>
>>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>>>> Reviewed-by: Frank Binns <frank.binns@imgtec.com>
>>>> ---
>>>
>>> Why do you send new version while we still talk about previous?
>>>
>>> Please implement feedback from v1 (and this is v2, so next is v3) or
>>> keep discussing.
>>>
>>
>> I agreed with everything you said in the last round (RFC v2) and
>> made all requested changes. Did I miss something in this version?
> 
> The recommendation is that naming of the file matches generic compatible
> and your file has only one generic compatible. Therefore I don't
> understand why you claimed there are multiple compatibles.
> 

I said "There are (or will be) multiple compatible strings", the rest
are on the way. So I didn't want to make this file less generic when
other bindings are almost ready.

Frank, can you help here, I'm assuming you have "img,img-bxs" and
"img,img-8xe" bindings staged for upstreaming somewhere; you'll be
putting those in this same file, right?

Thanks,
Andrew

> Best regards,
> Krzysztof
> 
