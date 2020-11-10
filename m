Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAD72AEA9D
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 08:56:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F146E02B;
	Wed, 11 Nov 2020 07:56:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8499D89020
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 16:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1605026983;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=rpvmMnXMwFUPKavJxDHRuP2XHaoAjAtNZVR646ZT25s=;
 b=BtGt6T163d05OJDZlqMMvZEkqa45ng8sit/BqxoarMhs7ijKSRIe6W5vcVCEVnZfna
 OdybR4CBz58RowVDeJE36w5KGE6/O/rqq8dNWA+sCxLGJnih8C7/kXcUxrv+Y/3RyMJS
 7z2QC0tDhNMrPCZnM+26zmpwgGy44e97khUUw6MzmwFXw3jDi7nv1vSkYnU8m5sFZvFA
 QaFroFHlZSQKCYvCiGqx4k2hfvKSxbYr4AnqYvFxfy+1g4YJqXkqlXV+1uP+Ez5ytOTt
 osHuMcue+z7C0Y0hkfjUeZFXxb8w5M9jFAwEPqGBx3USUE7t9kzovgDw5IcKNzibRE3p
 Xz9A==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDVCUXAYLEg=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.3.4 DYNA|AUTH)
 with ESMTPSA id N02faawAAGnY2Sl
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Tue, 10 Nov 2020 17:49:34 +0100 (CET)
Subject: Re: [PATCH v3 00/56] Convert DSI code to use drm_mipi_dsi and
 drm_panel
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <0AF59BFD-89F2-46D3-9EB6-F47FBB52B183@goldelico.com>
Date: Tue, 10 Nov 2020 17:49:33 +0100
Message-Id: <AEAA7281-7B82-47A6-A0BA-EF08C56824A8@goldelico.com>
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
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Wed, 11 Nov 2020 07:54:43 +0000
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


> Am 10.11.2020 um 14:49 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
> 
> Hi Tomi,
> 
>> Am 09.11.2020 um 12:33 schrieb Tomi Valkeinen <tomi.valkeinen@ti.com>:
>> 
>> On 09/11/2020 13:09, H. Nikolaus Schaller wrote:
>> 
>>>>> I see.
>>>>> Anyways there is missing some simple thing which makes the driver not prepared/enabled.
>>>>> Or is this related to VC?
>>>> 
>>>> No, that's not related to the VC.
>>> 
>>> Ok, then it is worth searching for that independently. Any idea/hint what could be missing?
>> 
>> Well, if I had to guess, I would go for either 1) some registration or such is missing from the
>> panel driver, or 2) some config value is invalid, which makes the DRM framework or the DSI driver
>> fail before calling prepare or enable.
> 
> I did now some tests based on v5.10-rc3 by adding mre and more printk() and dump_stack().
> And I did blacklist the panel driver so that I could boot and after modprobing it manually
> I could trigger a re-probe by inserting some USB memory stick.
> 
> With this procedure I could trace the problem down to this call sequence:
> 
> 	dsi_probe()
>          ...
> 	  w677l_probe()
>            drm_panel_add()   -- after this, of_drm_find_panel() is successful
>          ...
> 	  component_add()
> 	    try_to_bring_up_master()
> 	      master->ops->bind(master->dev)
> 
> This call to bind() does not return and likely the probing thread is then blocked and
> holds some locks which manifests itself in that the system isn't running stable any
> more (e.g. heartbeat LEDs are sometimes stuck although console still works).
> 
> dbg_info() in try_to_bring_up_master() prints:
> 
> [  102.199362] omapdss_dss 58000000.dss: trying to bring up master
> 
> So I am not sure if this is a panel driver issue at all or the DSI patch set is not
> running stable on OMAP5.
> 
> Is a good next step to trace dss_bind() in drivers/gpu/drm/omapdrm//dss/dss.c?

There is indeed one kernel worker running at 100% CPU load.

top:

  PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND                                                                   
 3196 root      20   0       0      0      0 R  100.0  0.0   2:58.76 kworker/0:8+events                                                        

More analysis shows that it hangs in drm_client_modeset_probe() in the loop

	for (i = 0; i < connector_count; i++)
		total_modes_count += connectors[i]->funcs->fill_modes(connectors[i], width, height);

Most likely not in the loop because that looks sane, but connectors[i]->funcs->fill_modes().

So I have to find out what function connectors[i]->funcs->fill_modes is...

BTW: connector_count = 2.

BR and thanks,
Nikolaus


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
