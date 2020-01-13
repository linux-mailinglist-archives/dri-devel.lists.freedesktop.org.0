Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9737139097
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 13:02:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E31C289FED;
	Mon, 13 Jan 2020 12:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69EC889FED
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 12:02:06 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00DC1x5L110807;
 Mon, 13 Jan 2020 06:01:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1578916919;
 bh=H2gDMp/Ne//Z1zeRNw2FyZRd1bmJxMtU/ICfn0o8bn8=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=YrwMozSeEbxwQYqZ6eHn1HJ3hd1lE3Yu+JqwShV2x7AxkYNy/lfmrsFa+3GZ5XHGY
 z3XwTeT/DjEawhQCRX5xHHSkxsGfEHKTyHVYVxndDTo0wDDr7LloI6vD7LgvPlYzYK
 R77R8LHCocu0S85+vVqV+2PGlRh++FMvx4pLxlJQ=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00DC1xwq104092
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 13 Jan 2020 06:01:59 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 13
 Jan 2020 06:01:58 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 13 Jan 2020 06:01:58 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00DC1uN6105432;
 Mon, 13 Jan 2020 06:01:57 -0600
Subject: Re: [PATCH 2/3] ARM: dts: am437x-gp/epos-evm: drop unused panel
 timings
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20191114093950.4101-1-tomi.valkeinen@ti.com>
 <20191114093950.4101-3-tomi.valkeinen@ti.com>
 <20191202130459.GH4929@pendragon.ideasonboard.com>
 <20191211165331.GC43123@atomide.com>
 <45dae8f7-2f5e-6948-5a05-dc8a09ace1fa@ti.com>
 <20191212203550.GB4892@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <add3d8af-6977-68e6-fb77-2fa748c4714a@ti.com>
Date: Mon, 13 Jan 2020 14:01:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191212203550.GB4892@pendragon.ideasonboard.com>
Content-Language: en-US
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
Cc: devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 Jyri Sarha <jsarha@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/12/2019 22:35, Laurent Pinchart wrote:
> Hi Tomi,
> 
> On Thu, Dec 12, 2019 at 11:37:51AM +0200, Tomi Valkeinen wrote:
>> On 11/12/2019 18:53, Tony Lindgren wrote:
>>> * Laurent Pinchart <laurent.pinchart@ideasonboard.com> [191202 13:05]:
>>>> Hi Tomi,
>>>>
>>>> Thank you for the patch.
>>>>
>>>> On Thu, Nov 14, 2019 at 11:39:49AM +0200, Tomi Valkeinen wrote:
>>>>> panel-simple now handled panel osd070t1718-19ts, and we no longer need
>>>>> the panel timings in the DT file. So remove them.
>>>>
>>>> Should you in that case drop the panel-dpi compatible string too, as the
>>>> panel-dpi bindings require panel timings in DT ?
>>>
>>> Yeah sounds like if panel-dpi is no longer usable for this device it
>>> should be dropped from the compatible list.
>>
>> Ok, I agree.
>>
>> Looking at the dts files, panel-dpi is used in a bunch of boards. But
>> we even have 3 dts files with panel-dpi, without the detailed panel
>> model in compatible...
>>
>> Fixing those will break the compatibility with old dtbs and new
>> kernel, unless we add timings-from-dt to a panel driver that handles
>> panel-dpi.
> 
> I know, and I don't have a perfect answer for this :-( I don't see a
> third option, it's either breaking DT backward compatibility or adding
> timings parsing to a panel driver (either a new panel-dpi driver or to
> panel-simple). What's your preferred option ?

Hmm, I just realized that changing these will break omapfb. It relies on panel-dpi and timings from 
DT...

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
