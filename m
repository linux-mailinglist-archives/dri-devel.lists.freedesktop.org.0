Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB0C2ADC77
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 17:53:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7037689105;
	Tue, 10 Nov 2020 16:53:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B02989105
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 16:53:16 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AAGr15W108557;
 Tue, 10 Nov 2020 10:53:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1605027181;
 bh=8u4oKxeTgqtAZew3HCblnfmbiLoszkn5hzZ2L4oaGe0=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=NnhWxmUfCIP6ZPiXRST7jzGP9FPMXhO+6VxemWjZRt56+u0jMnTgwOibILhvlIwC6
 HPwCov/VILcKyV4wPI7h71j9A6Uo7cid/WI1SvMY6l6S9EwsyEfeXsTaiki5taZ5ta
 /sQzk9+Z10FmizdixDPo7OKOv7+6nOHxsCEZYFPc=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AAGr1oO006869
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 10 Nov 2020 10:53:01 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 10
 Nov 2020 10:53:01 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 10 Nov 2020 10:53:01 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AAGqwaY036623;
 Tue, 10 Nov 2020 10:52:59 -0600
Subject: Re: [PATCH v3 00/56] Convert DSI code to use drm_mipi_dsi and
 drm_panel
To: "H. Nikolaus Schaller" <hns@goldelico.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <61C04176-4654-4D2D-A55B-31FBB6D2E5AA@goldelico.com>
 <fcbc8488-5861-8e51-0f86-1ed6498083f7@ti.com>
 <579243AA-014A-411B-9014-F5846C9B8137@goldelico.com>
 <ab33baff-dd8c-2ee0-6f89-35aa4df7b9cf@ti.com>
 <837EA533-9946-43B3-B058-69060EC43981@goldelico.com>
 <08589e51-f5e6-2743-57ec-8ac509f97ff0@ti.com>
 <1f1afce4-c822-0fbf-1ce3-dda0064b65c6@ti.com>
 <67786545-23D2-444F-85B8-7A030070B317@goldelico.com>
 <a20f2b88-bfe6-0ab4-a19b-ba5316db6c4f@ti.com>
 <17F5238B-1CC3-4764-B744-C57D9CE4EB42@goldelico.com>
 <db0b9694-4d04-18ba-fdf0-093b5914bbf0@ti.com>
 <6A9407FC-69F7-4E30-B4A3-FFB2E91CAE3B@goldelico.com>
 <1cf563e5-2dc0-1802-86e3-3e24150f0651@ti.com>
 <BBC7824A-A689-4144-969C-32608A202A75@goldelico.com>
 <7f820fd2-820b-bfdd-a43b-174ad6b09868@ti.com>
 <0AF59BFD-89F2-46D3-9EB6-F47FBB52B183@goldelico.com>
 <AEAA7281-7B82-47A6-A0BA-EF08C56824A8@goldelico.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <917fe1c6-4009-7788-f815-fcc1fc2ba7df@ti.com>
Date: Tue, 10 Nov 2020 18:52:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <AEAA7281-7B82-47A6-A0BA-EF08C56824A8@goldelico.com>
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
Cc: Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Tony Lindgren <tony@atomide.com>, Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/11/2020 18:49, H. Nikolaus Schaller wrote:
> 
>> Am 10.11.2020 um 14:49 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
>>
>> Hi Tomi,
>>
>>> Am 09.11.2020 um 12:33 schrieb Tomi Valkeinen <tomi.valkeinen@ti.com>:
>>>
>>> On 09/11/2020 13:09, H. Nikolaus Schaller wrote:
>>>
>>>>>> I see.
>>>>>> Anyways there is missing some simple thing which makes the driver not prepared/enabled.
>>>>>> Or is this related to VC?
>>>>>
>>>>> No, that's not related to the VC.
>>>>
>>>> Ok, then it is worth searching for that independently. Any idea/hint what could be missing?
>>>
>>> Well, if I had to guess, I would go for either 1) some registration or such is missing from the
>>> panel driver, or 2) some config value is invalid, which makes the DRM framework or the DSI driver
>>> fail before calling prepare or enable.
>>
>> I did now some tests based on v5.10-rc3 by adding mre and more printk() and dump_stack().
>> And I did blacklist the panel driver so that I could boot and after modprobing it manually
>> I could trigger a re-probe by inserting some USB memory stick.
>>
>> With this procedure I could trace the problem down to this call sequence:
>>
>> 	dsi_probe()
>>          ...
>> 	  w677l_probe()
>>            drm_panel_add()   -- after this, of_drm_find_panel() is successful
>>          ...
>> 	  component_add()
>> 	    try_to_bring_up_master()
>> 	      master->ops->bind(master->dev)
>>
>> This call to bind() does not return and likely the probing thread is then blocked and
>> holds some locks which manifests itself in that the system isn't running stable any
>> more (e.g. heartbeat LEDs are sometimes stuck although console still works).
>>
>> dbg_info() in try_to_bring_up_master() prints:
>>
>> [  102.199362] omapdss_dss 58000000.dss: trying to bring up master
>>
>> So I am not sure if this is a panel driver issue at all or the DSI patch set is not
>> running stable on OMAP5.
>>
>> Is a good next step to trace dss_bind() in drivers/gpu/drm/omapdrm//dss/dss.c?
> 
> There is indeed one kernel worker running at 100% CPU load.
> 
> top:
> 
>   PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND                                                                   
>  3196 root      20   0       0      0      0 R  100.0  0.0   2:58.76 kworker/0:8+events                                                        
> 
> More analysis shows that it hangs in drm_client_modeset_probe() in the loop
> 
> 	for (i = 0; i < connector_count; i++)
> 		total_modes_count += connectors[i]->funcs->fill_modes(connectors[i], width, height);
> 
> Most likely not in the loop because that looks sane, but connectors[i]->funcs->fill_modes().
> 
> So I have to find out what function connectors[i]->funcs->fill_modes is...
> 
> BTW: connector_count = 2.

I guess you have the same issue. It goes to dsi_bridge_mode_valid, then __dsi_calc_config, and stays
there finding good clocks.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
