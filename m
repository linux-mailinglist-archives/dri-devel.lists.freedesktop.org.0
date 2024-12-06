Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3D49E7838
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 19:39:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F98110E411;
	Fri,  6 Dec 2024 18:39:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="EcMczxz2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB4710E411
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 18:39:49 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B6Idjog1949541
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Dec 2024 12:39:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1733510385;
 bh=dTxstxwtZZjiL+W0oo1v3ahXJldC9uxz1kLLTe2v0ZU=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=EcMczxz2plswRL0HNJIBWo94BJ8+Oxe43knjJr3bwdDEwsOvAPNCX8IatLy+179Vg
 g/KCa7ueqLctvYSPFGR+RCBczmUXiWZZMlLU5e7HfA0tZ4tclw8HWDupvoqRAiIEVD
 Mna/nzjv1N5Y30vcV9f4VVeB+2g8WQ+Fp+QuyzhE=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B6Idjqp124311
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 6 Dec 2024 12:39:45 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 6
 Dec 2024 12:39:44 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 6 Dec 2024 12:39:44 -0600
Received: from [10.249.42.149] ([10.249.42.149])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B6Idiam023815;
 Fri, 6 Dec 2024 12:39:44 -0600
Message-ID: <ced9e317-06bc-4490-a4f2-576433222853@ti.com>
Date: Fri, 6 Dec 2024 12:39:44 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: backlight: Convert LP8860 into YAML
 format adding LP886x
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>, "conor@kernel.org"
 <conor@kernel.org>
CC: "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "dmurphy@ti.com"
 <dmurphy@ti.com>, "lee@kernel.org" <lee@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "robh@kernel.org" <robh@kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "danielt@kernel.org" <danielt@kernel.org>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "pavel@ucw.cz"
 <pavel@ucw.cz>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>
References: <20241206170717.1090206-1-alexander.sverdlin@siemens.com>
 <20241206170717.1090206-2-alexander.sverdlin@siemens.com>
 <20241206-brim-talcum-f5e8c504c572@spud>
 <129a3e14-9c87-47c2-b4ed-49bbcf12ae7e@ti.com>
 <1b8648f10248a949508240785f5a99ed7c2c2037.camel@siemens.com>
 <fa2c0961-771d-4a71-8dea-b7a3cdea6ced@ti.com>
 <42cb7136b20d53cbafaeb12e90ab1647644c0d20.camel@siemens.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <42cb7136b20d53cbafaeb12e90ab1647644c0d20.camel@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

On 12/6/24 12:20 PM, Sverdlin, Alexander wrote:
> Hi Andrew,
> 
> On Fri, 2024-12-06 at 12:02 -0600, Andrew Davis wrote:
>> On 12/6/24 11:46 AM, Sverdlin, Alexander wrote:
>>> Hi Andrew,
>>>
>>> On Fri, 2024-12-06 at 11:43 -0600, Andrew Davis wrote:
>>>>> Are you sure this is a correct thing to do? The lp8860-q1 product link
>>>>> cites it as being a 4-channel device. Even if the kernel only ever
>>>>> supports it as a single-channel device, the binding should reflect what
>>>>> it is capable of doing.
>>>>>
>>>>
>>>> Agree, the driver today just checks the first child node, but it could
>>>> be extended for all 4 supported LED channels, and we shouldn't have
>>>> to change the binding for that new support.
>>>
>>> but the channels are (in my understanding) for power-balancing only, there
>>> are no separate controls for them. What do I miss?
>>>
>>
>> I'm not very familiar with this part either, but looking at the datasheet
>> I see:
>>
>>> Supports Display Mode (Global Dimming) and
>>> Cluster Mode (Independent Dimming)
>>
>>> In Cluster mode LED strings have independent control but fewer features enabled than in Display Mode.
> 
> thanks for looking into this!
> 
>> And one channel controlling the others is only in this "Display Mode",
>> but the currents to the others can be independently controlled in a
>> different mode (seems these modes have less features which is probably
>> why the driver doesn't make use of that today).
> 
> You are right! This seems to be the feature of the legacy lp8860.
> Shall I then leave its binding alone and re-submit new YAML binding as-is
> for the newer LP8864/LP8866 family? Seems that they don't have the cluster mode
> any more.
> 

Well the txt to yaml binding conversion looks good other than the
patternProperties for multiple LEDs part. But if you don't plan on
reusing the binding then you don't need it as part of this series.
(still good to send it by itself since you already did the work)

A new binding doc for these new parts might be the way to go then.

Andrew
