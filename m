Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F0B251959
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 15:16:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2595A6E918;
	Tue, 25 Aug 2020 13:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D17089F4F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 13:16:46 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07PDGao5036885;
 Tue, 25 Aug 2020 08:16:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1598361396;
 bh=N96D9x+cfIc6e+cmK+tbORS+cMhXtDcJGJh2vSD1HVM=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=hwc0ZlwIAArDgY+jcQb7oQndBlwK8+IYrRiK4TSycH8VnKeNOsVNow6LvoRFbRZY+
 inPZL9g1LKHVfBuwYalVw5hEdsUAwxQ+UAquGhpCCvPZx7iztfLtirwOyUck8Wel9k
 SoWBQszbIi8TBfWQEE9/oVF9T9jwireqh0FLapik=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07PDGZ8S124249
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 25 Aug 2020 08:16:36 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 25
 Aug 2020 08:16:35 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 25 Aug 2020 08:16:35 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07PDGXLR033440;
 Tue, 25 Aug 2020 08:16:34 -0500
Subject: Re: [REGRESSION] omapdrm/N900 display broken
To: Aaro Koskinen <aaro.koskinen@iki.fi>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, ML dri-devel
 <dri-devel@lists.freedesktop.org>
References: <20200728181412.GA49617@darkstar.musicnaut.iki.fi>
 <660b2fe1-343d-b83e-11d2-5a5eb530b83f@ti.com>
 <448c1441-2cac-44ef-95ef-bb28b512297b@ti.com>
 <20200823162625.GC4313@darkstar.musicnaut.iki.fi>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <ac42f7f9-2ac2-246e-69c1-3d56cea7e59b@ti.com>
Date: Tue, 25 Aug 2020 16:16:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200823162625.GC4313@darkstar.musicnaut.iki.fi>
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
Cc: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On 23/08/2020 19:26, Aaro Koskinen wrote:
> Hi,
> 
> On Tue, Aug 04, 2020 at 03:39:37PM +0300, Tomi Valkeinen wrote:
>> On 04/08/2020 15:13, Tomi Valkeinen wrote:
> 
>>> Can you try to pinpoint a bit where the hang happens? Maybe add
>>> DRM/omapdrm debug prints, or perhaps sysrq works and it shows a lock
>>> that's in deadlock.
>>
>> Also, one data point would be to disable venc, e.g. set venc status to
>> "disabled" in dts.
> 
> Disabling venc makes no difference.
> 
> The hang happens in drm_fb_helper_initial_config(). I followed the
> "HANG DEBUGGING" tips in the function comment text and enabled
> fb.lockless_register_fb=1 to get more (serial) console output.
> 
> Now I get this:
> 
> [    6.514739] omapdss_dss 48050000.dss: supply vdda_video not found, using dummy regulator
> [    6.566375] DSS: OMAP DSS rev 2.0
> [    6.571807] omapdss_dss 48050000.dss: bound 48050400.dispc (ops dispc_component_ops)
> [    6.580749] omapdrm omapdrm.0: DMM not available, disable DMM support
> [    6.587982] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> [    6.626617] ------------[ cut here ]------------
> [    6.631774] WARNING: CPU: 0 PID: 18 at drivers/gpu/drm/drm_bridge.c:708 drm_atomic_helper_commit_modeset_enables+0x134/0x268
> [    6.643768] Modules linked in:
> [    6.647033] CPU: 0 PID: 18 Comm: kworker/0:1 Tainted: G     U            5.8.0-omap3-los_16068+-00004-g2e7d4a7efefd-dirty #2
> [    6.658966] Hardware name: Nokia RX-51 board
> [    6.663635] Workqueue: events deferred_probe_work_func
> [    6.669097] [<c010bf18>] (unwind_backtrace) from [<c010a0f4>] (show_stack+0x10/0x14)
> [    6.677429] [<c010a0f4>] (show_stack) from [<c0124f18>] (__warn+0xbc/0xd4)
> [    6.684844] [<c0124f18>] (__warn) from [<c0124f90>] (warn_slowpath_fmt+0x60/0xb8)
> [    6.692901] [<c0124f90>] (warn_slowpath_fmt) from [<c040c0e8>] (drm_atomic_helper_commit_modeset_enables+0x134/0x268)
> [    6.704254] [<c040c0e8>] (drm_atomic_helper_commit_modeset_enables) from [<c045442c>] (omap_atomic_commit_tail+0xb4/0xc0)
> [    6.715972] [<c045442c>] (omap_atomic_commit_tail) from [<c040d1b4>] (commit_tail+0x9c/0x1a8)
> [    6.725128] [<c040d1b4>] (commit_tail) from [<c040de70>] (drm_atomic_helper_commit+0x134/0x158)
> [    6.734466] [<c040de70>] (drm_atomic_helper_commit) from [<c043b204>] (drm_client_modeset_commit_atomic+0x16c/0x208)
> [    6.745727] [<c043b204>] (drm_client_modeset_commit_atomic) from [<c043b2f8>] (drm_client_modeset_commit_locked+0x58/0x184)
> [    6.757629] [<c043b2f8>] (drm_client_modeset_commit_locked) from [<c043b448>] (drm_client_modeset_commit+0x24/0x40)
> [    6.768798] [<c043b448>] (drm_client_modeset_commit) from [<c0412778>] (__drm_fb_helper_restore_fbdev_mode_unlocked+0xa0/0xc8)
> [    6.780975] [<c0412778>] (__drm_fb_helper_restore_fbdev_mode_unlocked) from [<c0412808>] (drm_fb_helper_set_par+0x38/0x64)
> [    6.792785] [<c0412808>] (drm_fb_helper_set_par) from [<c03a9b24>] (fbcon_init+0x3d4/0x568)
> [    6.801757] [<c03a9b24>] (fbcon_init) from [<c03eaab0>] (visual_init+0xb8/0xfc)
> [    6.809631] [<c03eaab0>] (visual_init) from [<c03ec070>] (do_bind_con_driver+0x1e0/0x3bc)
> [    6.818267] [<c03ec070>] (do_bind_con_driver) from [<c03ec59c>] (do_take_over_console+0x138/0x1d8)
> [    6.827880] [<c03ec59c>] (do_take_over_console) from [<c03a856c>] (do_fbcon_takeover+0x74/0xd4)
> [    6.837219] [<c03a856c>] (do_fbcon_takeover) from [<c03a22e0>] (register_framebuffer+0x204/0x2d8)
> [    6.846740] [<c03a22e0>] (register_framebuffer) from [<c0412228>] (__drm_fb_helper_initial_config_and_unlock+0x3a4/0x554)
> [    6.858459] [<c0412228>] (__drm_fb_helper_initial_config_and_unlock) from [<c045c230>] (omap_fbdev_init+0x84/0xbc)
> [    6.869537] [<c045c230>] (omap_fbdev_init) from [<c04549b8>] (pdev_probe+0x580/0x7d8)
> [    6.877807] [<c04549b8>] (pdev_probe) from [<c04669b4>] (platform_drv_probe+0x48/0x98)

Laurent, does this ring any bells? The WARN comes in drm_atomic_bridge_chain_enable() when
drm_atomic_get_old_bridge_state() returns null for (presumably) sdi bridge.

I'm not sure why the bridge state would not be there.

Aaro, you can probably debug easier if you disable CONFIG_FRAMEBUFFER_CONSOLE, or even
CONFIG_DRM_FBDEV_EMULATION.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
