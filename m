Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DD711E3A0
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 13:33:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E946E02B;
	Fri, 13 Dec 2019 12:33:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E96E26E02B
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 12:33:47 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBDCXOQJ050037;
 Fri, 13 Dec 2019 06:33:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1576240404;
 bh=kMkbjET+QrAsmFNseBerdM5MMsQ1B5BpEEYyXYTBjTg=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=qKtEzxPGp0D1cBFmxFRBzseKuJP5UAS9wh3rK7b46v3ZSxSQ8Mem2pChZJnCeam96
 pSURWaCFMI+PlDvVXEzSv7MdWcNjs3xOuTB+PF+Vg/KapZYrs/Dqu5W3r+9cZVP08l
 Qi5934tMg6UCV+HBkqtcXPoZWT8GjXx/OPIo9nRM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBDCXOlR055977
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 13 Dec 2019 06:33:24 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 13
 Dec 2019 06:33:22 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 13 Dec 2019 06:33:22 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBDCXK6C002889;
 Fri, 13 Dec 2019 06:33:20 -0600
Subject: Re: [PATCH 1/4] ARM: dts: am437x-gp-evm: add HDMI support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20191125131100.9839-1-tomi.valkeinen@ti.com>
 <20191212172104.GY35479@atomide.com> <20191212173110.GA35479@atomide.com>
 <d09526b2-8435-bef2-0489-0c3c8173d451@ti.com>
 <20191213104204.GB4860@pendragon.ideasonboard.com>
 <2f5cfca4-d36d-da2d-59ba-b76669daeded@ti.com>
 <20191213114207.GC4860@pendragon.ideasonboard.com>
 <36d8dde1-1a76-5a5f-2a41-8bc52dfcf2fa@ti.com>
 <20191213122845.GD4860@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <3900f4b3-4604-cb64-ebdd-ae168ef1d2fb@ti.com>
Date: Fri, 13 Dec 2019 14:33:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191213122845.GD4860@pendragon.ideasonboard.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Tony Lindgren <tony@atomide.com>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, linux-omap@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/12/2019 14:28, Laurent Pinchart wrote:

>> So... In the DT file, we would have multiple endpoints in the same output port in DSS, one going to
>> the panel, one to the SiI9022? omapdrm could then create two encoders, one abstracting the DPI
>> output and the connection to the panel, one abstracting the DPI output and SiI9022?
> 
> That's the idea, yes.
> 
>> And then someone would need to handle the GPIO, and set it based on the output used. These kind of
>> gpios are always difficult, as they don't belong anywhere =).
> 
> https://lore.kernel.org/lkml/20191211061911.238393-5-hsinyi@chromium.org/
> 
> Still, the infrastructure in omapdrm would need quite a bit of work.
> We're just about to get a helper layer for linear pipelines merged, and
> we already need to go one step further :-)

Alright, sounds like this will be doable in the future. So let's drop this and the epos HDMI patches 
for now.

This does sound like quite a bit of work, as you say, so I have no idea when we can get there (on 
the omapdrm side). In the minimum we should first get the big omapdrm rework done, in order to avoid 
nasty conflicts.

Thanks for educating me =).

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
