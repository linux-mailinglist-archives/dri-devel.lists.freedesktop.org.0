Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 330C0159490
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 17:13:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A566E4E8;
	Tue, 11 Feb 2020 16:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C2A6E4E8
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 16:13:44 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01BGDYsa130008;
 Tue, 11 Feb 2020 10:13:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1581437614;
 bh=+YQn6d++LnKsoiX4gIm/QgTgNjhIwQZrZR2DxKRa0/g=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=ifPYaYNneQzRaXjQmGShH9PVUTt2Ee9pN/wZkrsyi29QPdmQYdDp1sYAv0p4EbwCn
 I7yLgo2zqMsdQZqEKtQgONdQ8daBPI/donjzM4JzC7o/WKEdZqwg5YT+n3A2Dz8Niy
 BQ2Ag3WAIyD1TpBWEHYpDAqKNsYkEebcl2+mDDds=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01BGDY7w005133;
 Tue, 11 Feb 2020 10:13:34 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 11
 Feb 2020 10:13:34 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 11 Feb 2020 10:13:34 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01BGDV39125254;
 Tue, 11 Feb 2020 10:13:32 -0600
Subject: Re: [PATCH 2/3] ARM: dts: am437x-gp/epos-evm: drop unused panel
 timings
To: Tony Lindgren <tony@atomide.com>, Merlijn Wajer <merlijn@wizzup.org>
References: <20191114093950.4101-3-tomi.valkeinen@ti.com>
 <20191202130459.GH4929@pendragon.ideasonboard.com>
 <20191211165331.GC43123@atomide.com>
 <45dae8f7-2f5e-6948-5a05-dc8a09ace1fa@ti.com>
 <20191212203550.GB4892@pendragon.ideasonboard.com>
 <add3d8af-6977-68e6-fb77-2fa748c4714a@ti.com>
 <b39e52f1-3e73-5f26-6206-0956cf482631@ti.com>
 <20200211110712.GB28355@pendragon.ideasonboard.com>
 <3b4d10c6-7cb2-af53-3a39-31eef441bfdd@ti.com>
 <98da360f-880b-af56-b285-4d9b39f8a342@wizzup.org>
 <20200211160524.GE64767@atomide.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <87b1111e-af06-1e2a-8baa-c3f9a15f1874@ti.com>
Date: Tue, 11 Feb 2020 18:13:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200211160524.GE64767@atomide.com>
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
Cc: devicetree@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Jyri Sarha <jsarha@ti.com>, dri-devel@lists.freedesktop.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/02/2020 18:05, Tony Lindgren wrote:
> * Merlijn Wajer <merlijn@wizzup.org> [200211 12:54]:
>> Hi,
>>
>> On 11/02/2020 12:08, Tomi Valkeinen wrote:
>>> On 11/02/2020 13:07, Laurent Pinchart wrote:
>>>
>>>>> Hopefully soon (in five years? =) we can say that omapdrm supports all
>>>>> the boards, and we can deprecate omapfb.
>>>>
>>>> I'd love to send a patch to remove omapfb, but I'll let you do the
>>>> honours :-)
>>>
>>> Not before we add DSI support to omapdrm...
> 
> Hmm do your mean RFBI? The DSI support we already have :)

Oh, I didn't even remember RFBI... But it is not supported in omapfb either, so it's not blocking 
removal of omapfb.

We are still missing DSI command mode support, and moving it to the common DRM model.

>> This is probably known, but for devices that would like use PowerVR SGX,
>> there sometimes is only userspace available that works with omap(l)fb,
>> and not with DRM. The Nokia N900 is such an example.
>>
>> There might be a newer release of (closed) userspace coming for the
>> aging device(s), but as it stands, I don't think it's possible to do 3D
>> with PowerVR SGX on omapdrm currently.
>>
>> But I might be wrong...
> 
> Yes SGX is a bottleneck currently for omap3 users. And I think
> RFBI is blocking n8x0 from moving to omapdrm and finally leaving
> drivers/video/fbdev/omap2 behind.
> 
> With those blockers fixed, I'd also be happy to just get rid of
> drivers/video/fbdev/omap2 as there should be no reason to
> keep using it.

I don't know what to do about SGX, but if someone sends patches to omapdrm to allow using SGX, I'll 
review =).

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
