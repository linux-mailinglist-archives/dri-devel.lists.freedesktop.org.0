Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 091496E256E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 16:18:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D101C10E078;
	Fri, 14 Apr 2023 14:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D6110E078
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 14:17:58 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33EEHlxi092711;
 Fri, 14 Apr 2023 09:17:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1681481867;
 bh=0xJWWmhVT0Y8R8sE6W9HoThWfwH6miZcXks0nWWEUaU=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=XqDrpcKR6XXiYMge3vlQFJyuwjiPY9ghwi0NfLIE3IX6eMzbNENz3q8/b+Lqf5M2J
 Tf/NDSHkKHWs3g12D1ggysaZBiE/CP9eXviT1Chm6hm0Ckms6O2N0ieXjiE/FUOdsk
 Qw9oZyMsqrVmUMSJ/wmUI3w8lOY57eGBzP/HmDGc=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33EEHl7J100935
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 14 Apr 2023 09:17:47 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 14
 Apr 2023 09:17:46 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 14 Apr 2023 09:17:46 -0500
Received: from [10.250.32.8] (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33EEHk1T029808;
 Fri, 14 Apr 2023 09:17:46 -0500
Message-ID: <5be1c313-9e1e-3bac-46f3-ee172d1afb45@ti.com>
Date: Fri, 14 Apr 2023 09:17:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] misc: sram: Add dma-heap-export reserved SRAM area type
To: Christian Gmeiner <christian.gmeiner@gmail.com>
References: <20200424222740.16259-1-afd@ti.com>
 <CAL_Jsq+4mf6QHX27knoHTXA4vnsC3swuvAH7zK1DpyaV-p_qbw@mail.gmail.com>
 <f46c097a-b2a6-6368-a8a4-e30995a54d17@ti.com>
 <CAH9NwWeZnDEkundm98=KL6xB9bVO3nOkk48xMF-eQnztP4DD4g@mail.gmail.com>
 <99f1da4f-810e-986d-388a-af136ade745e@ti.com>
 <CAH9NwWcafkmcZd=5WN_hoJmfkwUJJrewaPnSmCK-izrC3hwKnA@mail.gmail.com>
 <CAH9NwWfkWTXMVOY-7USgYJnBtUOYd8=TFVcPxiTgVd9AJAQH=Q@mail.gmail.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <CAH9NwWfkWTXMVOY-7USgYJnBtUOYd8=TFVcPxiTgVd9AJAQH=Q@mail.gmail.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
 Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/14/23 12:44 AM, Christian Gmeiner wrote:
> Hi Andrew
> 
> Am Di., 4. Apr. 2023 um 17:02 Uhr schrieb Christian Gmeiner
> <christian.gmeiner@gmail.com>:
>>
>>>> Hi Andrew
>>>>
>>>>>
>>>>>
>>>>> Okay, will split for v2.
>>>>>
>>>>>
>>>>
>>>> Was there a follow-up v2 of this patchset? AFAICT this series did not
>>>> make it into the mainline kernel.
>>>> Do you have any plans to work on it? If not I would like to help out
>>>> as we have a use case where we want to
>>>> use a dma-buf sram exporter.
>>>>
>>>>
>>>
>>> Sure, I've been keeping it alive in our evil vendor tree, but if
>>> there is interest upstream now I'll post a v2 and CC you.
>>
>> That would be great!
>>
> 
> Did you find time to prepare a v2? If not, can you point me to the
> evil vendor tree?
> 
> 

I did find some time and CC'd you on v2, the patch's subject was slightly
renamed, so maybe your emailer missed it?

https://patchwork.kernel.org/project/linux-media/patch/20230403192433.26648-1-afd@ti.com/

Our evil vendor trees are here either way:

https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/

Andrew
