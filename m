Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C25A5B7539
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 17:36:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D058810E778;
	Tue, 13 Sep 2022 15:36:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04olkn2050.outbound.protection.outlook.com [40.92.47.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39FDE10E359
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 15:36:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJ+NJHq88EAHkshWfX3B6O3N+eoeUhChN5ui6+QBeDDDhetHO2WuHN2acgFlBWy8NEBvsckdFVwYxWtNNBJWaX/L3p7axEhUKuqqdOZmzu9T9NN3FT9NFRpPPWRAC6zI/B/7j3kxnpTeSleKWZlteyBA8GkpCmulyCBMEGyU7q2SOeqH2Fv20RhrjthWH1Pp9Sk9JZuYXBtFrn2YKyjnVlZt5+h6c94VqsGTpWZKr8ZHQULjzSUXhrdWGp1wjQQrZ5D2B7TNrTJGAdz9aYKn5u3vrT5ayCN9kNn5xOeCyU6sQViEZcRUnUpX+BFcefL6J1VTClVlvLXjFRiJ2UfHpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Js7myUPvRcZ1+Z48Uk9GuGhWDACK5u//60VJkSNz8aY=;
 b=U3GhuhnzPJHAG1u1PsCwxT4XcVU+TEyJR1F1cie6BlLFuSInw84bquLn8a26pdOaXtrPcEnuUzXk6wBV7UXp2EZqGx8fthvxd/SZCuZIgbePMh5hom0K4In9sTAugI0Lt5mRQ7+pdmtVbxUFlo5ALCj/Gg5jp/Gr4dtCAg7+LaiSZl8A8kHB2XXOv5X0UfPAXif2uN0CJAEo7dtutcpiRL9eRvr8wVsr30oyKvkJ4x4pz6l+phSn/j8yjjG0ceWxOGpw84IiECgGLMrMsV0pnXxhTQHT3kYxg4oF4XeQET5uSEy2+Yq1fkiYINk5F4h0RCUfV7o8FwoCisvuiAGTZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Js7myUPvRcZ1+Z48Uk9GuGhWDACK5u//60VJkSNz8aY=;
 b=WZoKcwFOW6lBOoLdEs9z9jndHle3qkRZhoNFGIzG5a+D7yIx2vMTl/EddvwS2AA4SvN7dCiPYgDjsiDKjLigy+ZdJHn+8hrebw5npcMT7RXh3JhsNFvTbaW9o+1i/YRetXuyjQ7+jX2AxcIb6cMbuKm/agscK3YMvI4NPjq/1R8nd3MPs9NOGHGSjLBqesylqhyT2nMhJoJ4HhQSa7RdHymNZacFAQ8Z18Qnnyd5GewLJEs6uLwUL15dqdO2zaAo9xYpNFDC5iInWVjQLIvrhBz+4axm4PDJ5fWk9gtyKrwBGqd2gHz056IVgpVr7huLTD8TVyGgJiET/dzC4yOXuw==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by CH2PR06MB6597.namprd06.prod.outlook.com (2603:10b6:610:5e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Tue, 13 Sep
 2022 15:36:30 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::433a:1493:6a39:ee43]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::433a:1493:6a39:ee43%5]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 15:36:30 +0000
Date: Tue, 13 Sep 2022 10:36:17 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: Re: [PATCH] drm/rockchip: vop2: Fix Null Pointer Dereference on
 Multiple VPs
Message-ID: <SN6PR06MB5342A5EDB34BAD4099ABDE8DA5479@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20220912180242.499-1-macroalpha82@gmail.com>
 <d8a86990-6d9f-9ca0-326a-e5706f924516@wolfvision.net>
 <3A581416-C8A0-4121-B3D5-DFA29B4768A8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3A581416-C8A0-4121-B3D5-DFA29B4768A8@gmail.com>
X-TMN: [LuYrNmdHBQ28B92BPqUi5WzpzXEk6y38]
X-ClientProxiedBy: DM6PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:5:40::30) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20220913153617.GA10926@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|CH2PR06MB6597:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e0f749d-3250-43ca-99e5-08da959dba6b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F7xrbpSnWWbQpSkPYvN8gHoCAvZ7Mq5XWE4hHT5txt29h05oW+AvJEKmyFRl91vtgpitNHGzbANJTRHNdoFPCmkq5erPnymhzac9bSYQ0ZEa7MLzTxqckhmqE5ART4DnQTJ1KFQKgHNBIMTAqeupCb1EhLoyR3b7A8FBk80dQ07SEvAkvUhr+Xy3qhl2kjBBDhuEY9qK7QYwDVsDloXgxzEWH6+YgsVI806vNtG5Rq4unAxamBPdoKZ/uaFLCBFFktCfyFoC7PMcvnGUh1aBAVhbYz0igr/VYmil220nGk7eLsUA6GDG/jsK5DDJaV3WQBxa6BxyvdrVBWUSP7dowthMEP+VGsoZAeuV5Mve0M8cCLT+PSsVnvM+oQvfUqA7Teaco0+q3w7HZvzyCUf52A67TC7pWalBLZfs1IXqbVqpwHp33S/XoFwTLIGx7vA8Nz7HdHtCJT7y2YqvGv43iNghYAYs8U5vtKFyc7iynjSYN6Q6AHZX1gPd3Ye+BWldSxdjc8fbe8xrCwpiK4gB/B9URXveCXMa8vErpMxxRwUQl5XVuuWkUk1aApSss5UPKzhe5u91VINpzDNl+7LZQoFS3N3s/Mul3rouHpNczAktROCIMe+mB4kur5g4VVfb5VGcPJZCNYRI4BEvJCWmQHfFbIQ7Hud8LCrTL2fAOss=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUlTWEhEd21QTVFYZkVEMWc0RkxNNkhtLzdzY2NDdmhyVXFqbHBSa3Z5NGhn?=
 =?utf-8?B?YmZ6UHdhUGdSeE1Ga05ra3pJUnNUZk02akhnbUlVWnJySmt6MjhCWEFTZEtp?=
 =?utf-8?B?cC9MdEdsZTJzZWFQM2JYM0FRcS9rSE0wZWx5TXRpWTc0aTZuYWhpSlh2UnlF?=
 =?utf-8?B?QTBpZ3B4MXBNVloxak54SmZwbzlZRHdneis3bkI3NU5NY1ZGaHV0MCtRYWpK?=
 =?utf-8?B?SERtWkJENjMxd2o0NHpmVWRUY3dpamtyMGkrVWJFd1VsQnpJREhUK3NKRjlS?=
 =?utf-8?B?bHQzMklUd3A2M3pkY1RqVHdxNTd5NlNEWkI3cGVUSy9rc1MrQVFDNFZrZHlp?=
 =?utf-8?B?cWM5UVRodkVkaExNRVl5a3RlQzBvOE9oNXZGaFF4bVMwUmRtcXJ0VXJtVXdw?=
 =?utf-8?B?aVdBOU96K21DQmptcnFkODYwcEZmVnUzQWc4Q3MreWJvQ1g2TjJWMzh4L014?=
 =?utf-8?B?K2NOWTJSSTF3TzYwa1hwQUdLcHdVWm1IanZ4cU52S1VGajh0NHNCVUJCQWRp?=
 =?utf-8?B?MFh1bDJpanI0UFFYQVRnbEdEemJoOFJmUzBqbXY1eVZNRGMxMVZaT0xkYmNj?=
 =?utf-8?B?clVONGo5MzIrOHVoUnJHWUxzb1FBUFlGbXJIekNzYXZpWW1VMWZjcGVmb0lN?=
 =?utf-8?B?MDA3TGd5RDcrSFNBT2oyOWFMZHFiN0tIZHdocGd2cmRnbXlOeVppQitUWFdJ?=
 =?utf-8?B?Z1Y5MUFSUXpmOEd6WFpHTGZrVERkOWNOdUx0YWZiV1dxZVJ6cWg4L0Nsa1Bj?=
 =?utf-8?B?bVp0UHYzRERJVzNNc1lzZ0pYRmNad3FISzNDT1lwZDBwZ2o0TXpXMEtXa283?=
 =?utf-8?B?NGFtdnNibmVhTnY4M1piYXN6SExPUDhoT1ZPRkIyYVhjamEwSGhOY0NYdkd4?=
 =?utf-8?B?S2FJSFMzVjZQR2wyVVBueUpyYlZmcGRVOVlLdmZ2WFlhaTBkcUJsdDNYR1pQ?=
 =?utf-8?B?SUdXOTB4QXh5K25FRVcwWHNGV05xQW5rSUhPYkE5R0licUI5QWhZcnFpN3NP?=
 =?utf-8?B?azBtUEN6ZFkzQnZEOWp1TkRFRitJVWU2anBBcS80TEZxTkg5anN0QlFHbzFN?=
 =?utf-8?B?YzRCYVBRWHBVNkxkYWJjMFViSTVVK1RoK1p0TXZoQ3lWc2RqSUp3ZVZPbnZF?=
 =?utf-8?B?SlBpS3BrYzltUlo0RHlCbW5sVlZQaGo5VzRoWDNTR2IzY0JDN3M0MUUzVzZG?=
 =?utf-8?B?ZDB3MDM3QlY2dWNWSmdRczF1bkZWdE1DOVhnSG1xUENMUEQ0U0VENVlvbWJo?=
 =?utf-8?B?Yjk5OU82UTJ2N3Y2NFdGQlE5c21hQmpLNjFZM01sdlVsNTQ5SHhnclp1bk0v?=
 =?utf-8?B?UFZlRlRMZnZMQXFaSGNpZVcreWozd1hxSXhEYStlMGVxTEtPNU9Ga1VZTzNo?=
 =?utf-8?B?VitIYm52OTVNY3FBUHZvRHo0bnp2QTlKUW1FZXR0Z0l1c3FGMFpwTCtVWHVR?=
 =?utf-8?B?NmR6dmg0UzVvbi9MelBqWTlXMnovUXlBZm5DQUpEMXRCR2JRVUZTbXFtZzY0?=
 =?utf-8?B?Q05WMG1Cd2FVSmV2QWdLU05XQXloanQyRnlnbnYyZlhWWmQxcFV4d3BlZnkx?=
 =?utf-8?B?cEZPOFltL3FNVXpFZ1V6d2s0WXQ5bE02eTZGRWNZaEhKMnUrL09xSS9mQ3NE?=
 =?utf-8?B?MEd3QkpnR0RqaFBRaldmZFcxMm1DK2FnWkZwTnk4MzY4czE2bFRTbkN0eWwz?=
 =?utf-8?B?TmphQlhpUXlNbmljNno5ZFVldW1TRUNkcVU4RVZmWDV5OHpCUTFsRkh3PT0=?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e0f749d-3250-43ca-99e5-08da959dba6b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 15:36:30.1989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR06MB6597
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
Cc: David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Sascha Hauer <sha@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 13, 2022 at 11:10:16AM +0200, Piotr Oniszczuk wrote:
> 
> 
> > Wiadomość napisana przez Michael Riesch <michael.riesch@wolfvision.net> w dniu 13.09.2022, o godz. 08:55:
> > 
> > Hi,
> > 
> > On 9/12/22 20:02, Chris Morgan wrote:
> >> From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > Cc: Sascha -> any thoughts on this one?
> > 
> > Best regards,
> > Michael
> > 
> >> If I use more than one VP to output on an RK3566 based device I
> >> receive the following error (and then everything freezes):
> >> 
> >> [    0.838375] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000250
> >> [    0.839191] Mem abort info:
> >> [    0.839442]   ESR = 0x0000000096000005
> >> [    0.839785]   EC = 0x25: DABT (current EL), IL = 32 bits
> >> [    0.840256]   SET = 0, FnV = 0
> >> [    0.840530]   EA = 0, S1PTW = 0
> >> [    0.840821]   FSC = 0x05: level 1 translation fault
> >> [    0.841254] Data abort info:
> >> [    0.841512]   ISV = 0, ISS = 0x00000005
> >> [    0.841864]   CM = 0, WnR = 0
> >> [    0.842130] [0000000000000250] user address but active_mm is swapper
> >> [    0.842704] Internal error: Oops: 96000005 [#1] SMP
> >> [    0.843139] Modules linked in:
> >> [    0.843420] CPU: 0 PID: 37 Comm: kworker/u8:1 Not tainted 6.0.0-rc5+ #40
> >> [    0.844013] Hardware name: RG503 (DT)
> >> [    0.844343] Workqueue: events_unbound deferred_probe_work_func
> >> [    0.844871] pstate: 80000009 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> >> [    0.845487] pc : __drm_crtc_init_with_planes+0x48/0x2e4
> >> [    0.845956] lr : drm_crtc_init_with_planes+0x68/0x94
> >> [    0.846399] sp : ffffffc00a7a3710
> >> [    0.846695] x29: ffffffc00a7a3710 x28: ffffff8000fb4080 x27: ffffffc00a7a37a0
> >> [    0.847332] x26: ffffffc0097d01c7 x25: ffffff8000fb44d8 x24: ffffffc0097d01c7
> >> [    0.847967] x23: ffffffc009311870 x22: 0000000000000000 x21: 0000000000000008
> >> [    0.848603] x20: ffffff80010d0800 x19: ffffff8000fb44e8 x18: 0000000000000000
> >> [    0.849237] x17: 08000000000000d1 x16: 0800000000000091 x15: 08000000000000c1
> >> [    0.849874] x14: 0000000000000000 x13: 3432564e3631564e x12: 3231564e36314742
> >> [    0.850509] x11: 3631475234324742 x10: 000000000000002d x9 : ffffffc008682004
> >> [    0.851144] x8 : 00000000006f7475 x7 : 00000000fffffff0 x6 : ffffffc00a7a37a0
> >> [    0.851778] x5 : ffffffc0097d01c7 x4 : ffffffc009311870 x3 : 0000000000000000
> >> [    0.852412] x2 : 0000000000000008 x1 : ffffff8000fb44e8 x0 : ffffff80010d0800
> >> [    0.853048] Call trace:
> >> [    0.853270]  __drm_crtc_init_with_planes+0x48/0x2e4
> >> [    0.853706]  drm_crtc_init_with_planes+0x68/0x94
> >> [    0.854118]  vop2_bind+0x89c/0x920
> >> [    0.854429]  component_bind_all+0x18c/0x290
> >> [    0.854805]  rockchip_drm_bind+0xe4/0x1f0
> >> [    0.855166]  try_to_bring_up_aggregate_device+0x9c/0x290
> >> [    0.855639]  __component_add+0x110/0x168
> >> [    0.855991]  component_add+0x1c/0x28
> >> [    0.856312]  dw_mipi_dsi_rockchip_host_attach+0x98/0x10c
> >> [    0.856785]  dw_mipi_dsi_host_attach+0xbc/0xd0
> >> [    0.857184]  mipi_dsi_attach+0x30/0x44
> >> [    0.857521]  devm_mipi_dsi_attach+0x2c/0x70
> >> [    0.857896]  ams495qa01_probe+0x2d4/0x33c
> >> [    0.858257]  spi_probe+0x8c/0xb8
> >> [    0.858550]  really_probe+0x1e0/0x3b8
> >> [    0.858881]  __driver_probe_device+0x16c/0x184
> >> [    0.859278]  driver_probe_device+0x4c/0xfc
> >> [    0.859646]  __device_attach_driver+0xf0/0x170
> >> [    0.860043]  bus_for_each_drv+0xa4/0xcc
> >> [    0.860389]  __device_attach+0xfc/0x1a8
> >> [    0.860733]  device_initial_probe+0x1c/0x28
> >> [    0.861108]  bus_probe_device+0x38/0x9c
> >> [    0.861452]  deferred_probe_work_func+0xdc/0xf0
> >> [    0.861855]  process_one_work+0x1b0/0x260
> >> [    0.862217]  process_scheduled_works+0x4c/0x50
> >> [    0.862614]  worker_thread+0x1f0/0x26c
> >> [    0.862949]  kthread+0xc4/0xd4
> >> [    0.863227]  ret_from_fork+0x10/0x20
> >> [    0.863553] Code: aa0503fa f9002bfb aa0603fb b40000a2 (b9424840)
> >> [    0.864095] ---[ end trace 0000000000000000 ]---
> >> 
> >> A cursory reading of the datasheet suggests it's possible to have
> >> simultaneous output to 2 distinct outputs. On page 13 it states:
> >> 
> >> Support two simultaneous displays(same source) in the following interfaces:
> >> - MIPI_DSI_TX
> >> - LVDS
> >> - HDMI
> >> - eDP
> >> 
> >> In order to achieve this though, I need to output to VP0 and VP1 (or
> >> any 2 distinct VPs really). This is so I can have the ref clock set
> >> to 24MHz for the HDMI and the pixel clock of the DSI panel (for the
> >> example above it's 33.5MHz).  Currently, only by removing this code
> >> block is such a thing possible, though I'm not sure if long-term
> >> there should only be 1 CRTC for the rk3566 (and 2 CRTCs for 3568)
> >> along with a max of 2 encoders for rk3566 (and 3 encoders for 3568).
> >> 
> >> Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
> >> 
> >> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> >> ---
> >> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 14 --------------
> >> 1 file changed, 14 deletions(-)
> >> 
> >> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> >> index e4631f515ba4..f18d7f6f9f86 100644
> >> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> >> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> >> @@ -2289,20 +2289,6 @@ static int vop2_create_crtc(struct vop2 *vop2)
> >> 		struct vop2_win *win = &vop2->win[i];
> >> 		u32 possible_crtcs;
> >> 
> >> -		if (vop2->data->soc_id == 3566) {
> >> -			/*
> >> -			 * On RK3566 these windows don't have an independent
> >> -			 * framebuffer. They share the framebuffer with smart0,
> >> -			 * esmart0 and cluster0 respectively.
> >> -			 */
> >> -			switch (win->data->phys_id) {
> >> -			case ROCKCHIP_VOP2_SMART1:
> >> -			case ROCKCHIP_VOP2_ESMART1:
> >> -			case ROCKCHIP_VOP2_CLUSTER1:
> >> -				continue;
> >> -			}
> >> -		}
> >> -
> >> 		if (win->type == DRM_PLANE_TYPE_PRIMARY) {
> >> 			vp = find_vp_without_primary(vop2);
> >> 			if (vp) {
> > 
> > _______________________________________________
> > Linux-rockchip mailing list
> > Linux-rockchip@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-rockchip
> 
> 
> Chris, Michael,
> 
> IIRC this is fix for issue reported by me here: https://lore.kernel.org/linux-arm-kernel/20220405090509.GP4012@pengutronix.de/t/#mf29d19089fefcd27995a93c886f65132b6c75c7c <https://lore.kernel.org/linux-arm-kernel/20220405090509.GP4012@pengutronix.de/t/#mf29d19089fefcd27995a93c886f65132b6c75c7c>

I think this actually clarifies a bit of what I'm seeing. Specifically
I see nothing sometimes when I try to do a kmscube on my DSI panel.
Order of video ports matters, as if the DSI is VP0 and the HDMI is VP1
I see the output on the screen, but if HDMI is VP0 and DSI is VP1 I
see nothing on the screen.

As to the null pointer exception, some previous tracing suggested it
was occuring because a 2nd crtc would attempt to be registered with
planes when the plane was null. Basically with 1 primary plane we
would only ever assign it to the first video port. However, we'd try
to run drm_crtc_init_with_planes on the second video port later with
no plane and it would throw the above null pointer dereference error.

I'm wondering (talking out loud mostly because I honestly am not
very familiar with DRM) if in this case we should have 1 CRTC per
primary plane instead of 1 CRTC per video port?

Thank you, sorry for all the trouble this is causing.

> 
