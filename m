Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0658289D0
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 17:15:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9113E10E0EC;
	Tue,  9 Jan 2024 16:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7427810E0EC
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 16:15:30 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 409GEqUp101353;
 Tue, 9 Jan 2024 10:14:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1704816892;
 bh=+s45SriCMFg4wyEvqkMYU7sO4P+s/YfoTTH1GytTXY0=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=DCu/0XjkGzbx4AhW4Q1Bb3nB8rlACZEnZAY0Bpm2ojwjiUTg/cetEuTlDffhw56Yi
 JHfZdc5IIQ5KXToNOXeS7i84Lh9OyN5sM8buQlmsnnC/JfTQnTg0SIHnUVI8RMvNlW
 o8UI9tzB5evh4h7HsKJ+3yV2TT+cZ+pbdjn9SWKs=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 409GEqtO030730
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 9 Jan 2024 10:14:52 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 9
 Jan 2024 10:14:52 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 9 Jan 2024 10:14:52 -0600
Received: from [10.249.40.136] ([10.249.40.136])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 409GEoPJ008319;
 Tue, 9 Jan 2024 10:14:50 -0600
Message-ID: <4cdd5c4a-f940-4635-837b-872ab776f5c4@ti.com>
Date: Tue, 9 Jan 2024 10:14:50 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 01/11] dt-bindings: gpu: Rename img,powervr to
 img,powervr-rogue
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Frank Binns
 <frank.binns@imgtec.com>, Donald Robson <donald.robson@imgtec.com>, Matt
 Coster <matt.coster@imgtec.com>,
 "H . Nikolaus Schaller" <hns@goldelico.com>,
 Adam Ford <aford173@gmail.com>, Ivaylo Dimitrov
 <ivo.g.dimitrov.75@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, Tony Lindgren
 <tony@atomide.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Paul Cercueil
 <paul@crapouillou.net>
References: <20240108183302.255055-1-afd@ti.com>
 <20240108183302.255055-2-afd@ti.com>
 <c99b898f-61d2-46a3-b639-b4de828dcab1@linaro.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <c99b898f-61d2-46a3-b639-b4de828dcab1@linaro.org>
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

On 1/9/24 5:28 AM, Krzysztof Kozlowski wrote:
> On 08/01/2024 19:32, Andrew Davis wrote:
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   .../bindings/gpu/{img,powervr.yaml => img,powervr-rogue.yaml} | 4 ++--
>>   MAINTAINERS                                                   | 2 +-
>>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> If you are renaming it, why not renaming to match compatible as we
> usually expect?
> 

There are (or will be) multiple compatible strings described in this
file, naming the file after just one would not fully convey the content
of the file. This generic style naming seems common already for bindings
with multiple compatibles.

Andrew

> Best regards,
> Krzysztof
> 
