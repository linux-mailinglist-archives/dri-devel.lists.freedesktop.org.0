Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1755F68B04D
	for <lists+dri-devel@lfdr.de>; Sun,  5 Feb 2023 15:32:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4409710E18C;
	Sun,  5 Feb 2023 14:32:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A10610E18C
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Feb 2023 14:32:10 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 315EVmHq001124;
 Sun, 5 Feb 2023 08:31:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1675607508;
 bh=YZuVF63MW2U2mNEZ5pPQ0LVoy/puMzmMfHN/t2Px0oI=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=mlehZzBcbBYF4y/UmxPvMJu6jMEBD2ZVWGXgEJ2oHXhwAcL7CQD//hoQWcbvoqIaP
 QNLNMN4mSzQ8Xxs9GprAWgjif/4mQF9ErYmbgIURVXoh31+ZtOh8wAR2L36HhWoLZQ
 VhkUt/FHGdsERU1gYNpjr4HhgQ0T4K9Sx8806FJo=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 315EVmxN013296
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sun, 5 Feb 2023 08:31:48 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Sun, 5
 Feb 2023 08:31:48 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Sun, 5 Feb 2023 08:31:48 -0600
Received: from [10.250.235.106] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 315EVhgh016739;
 Sun, 5 Feb 2023 08:31:44 -0600
Message-ID: <1662a593-8a5d-9214-8a3e-ef2699a35265@ti.com>
Date: Sun, 5 Feb 2023 20:01:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v7 3/6] drm/tidss: Add support for AM625 DSS
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Jyri Sarha <jyri.sarha@iki.fi>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230125113529.13952-1-a-bhatia1@ti.com>
 <20230125113529.13952-4-a-bhatia1@ti.com>
 <ab6f52bb-a3f5-afda-c037-f009153a0bb6@ideasonboard.com>
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <ab6f52bb-a3f5-afda-c037-f009153a0bb6@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>,
 Rahul T R <r-ravikumar@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 03-Feb-23 21:03, Tomi Valkeinen wrote:
> On 25/01/2023 13:35, Aradhya Bhatia wrote:
>> Add support for the DSS controller on TI's new AM625 SoC in the tidss
>> driver.
>>
>> The first video port (VP0) in am625-dss can output OLDI signals through
>> 2 OLDI TXes. A 3rd output port has been added with "DISPC_PORT_OLDI" bus
>> type.
> 
> Not a big thing here as you add support for a new SoC, but the ordering
> of the patches is not optimal. Here you add the AM625 DSS support, but
> then you continue actually adding the DSS support (well, mainly OLDI) in
> the following patches.
> 
> I think patch 6 could be before this patch. Parts of patch 4 could also
> be before this patch. The AM65X renames from patch 5 could be before
> this patch.

I can move whole of Patch 6 and even of Patch 4 before this one. I have
mentioned 'AM625-DSS' in a couple comments which I can make generic,
and the rest everything is SoC-agnostic.

I haven't tried this, but my concern is if we break patch 5 into 2
separate patches,

i. AM65X rename plus SoC based switch case, and
ii. Addition of AM625 SoC case

then I might have to overwrite some changes implemented during (i) in
(ii). I don't suppose that would be okay, would it?

Also, is it important to keep the compatible-addition patches of
DT-binding and driver next to each other in the series? Or should
the DT-binding patches should be the first ones? Just curious! =)

> 
> I'm mainly thinking of a case where someone uses AM625 and is bisecting
> a problem. What happens if his board uses OLDI, and he happens to hit
> one of these patches during bisect? If the display just stays black, but
> otherwise everything works fine, then no problem. But if it crashes or
> starts spamming sync losts or such or gives errors, it's not so nice.
> 
You are right! This certainly makes sense.


Regards
Aradhya
