Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C13CD7D5C96
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 22:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB3D710E065;
	Tue, 24 Oct 2023 20:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04olkn2098.outbound.protection.outlook.com [40.92.46.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C243B10E065
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 20:47:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GGujnBWBtAl9td4ghMdigk2SixFQKmeMukPcw14ANkpgPoqFECsl9hJ9pi6IVh5eevaVPFRMAjSAexA6zKmDeTFEAOBOq3tQTA7L5cQG6Y3eWTrg6bdALCoF0mHdmlxhrU7NW/GWCKSuZMKEg94Es0sp5p9S2C0hJ9hT+wW4mVolAzJeHHuYB9VMoa9KOOTbpmLRnii0wiHCzI4DMTwoNfPFtxMFGWTxNmU2w6FyG5iSbNMSjNwR3bSwXonTaqrtw4SD/IIZIbLAKhCxHZUIwPvOdmo3aeqMa5GUlRjTS9jEUHAItDgnuE5ruS/cAI6AcR1uxjtIqAB5O9bFScF0jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g/CC8eZ10WUhdA2EXZhDI0IFzxIgJDZx2RVdgLZdIRw=;
 b=h1oyy09kxoayZ5PidPIA8qb2b/i1m9EgVSiR11RCoVPQVAB/ITPjZ39Asi029iweyKVAOqBp3ZXC6b6IP5crQfSwOiP15d13o2/PbI/NnCmxb/VBZMRfWxZFo9GXV3u4PgJT8hmg9a2Yt2g8WvPC3k32JSWtAj2w0rNYaEceg1aC0wY3GtqI5AGBZXPDxUibWZ8Foi20RsjnUVUotZ/qrCjlCBsqJRe9IULPdVwe8iRoNBsvu06zArVIy/C96O2IQFwuwTFXEJotCEjb8toVkVLVmLDa+j2Ych0RqnVhoZN+uS2Vp8R2M+YyYFgCdfn7KbfKore1iQTpSyYWqteqfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g/CC8eZ10WUhdA2EXZhDI0IFzxIgJDZx2RVdgLZdIRw=;
 b=F+VkOaZXSm+iaKV2UeahrPQjoHTBuXVSaKDEeZqqgqs3YRQ6Zj4Kafy0SCOQf0cIJswV9BKcjqmGka2Tyuf2CVRmkr2xpF28Q7MtWjD9ixuF9zTcQiZwDaMaYcVSwj3J2lrVMWT1dVHzHtlwsuTTCzCt9+OYRjsjJNf85Z6Pdlf1mFgR1QfbZi3EaPobO7f60hheAviTPNjn/wMu4BRDMXwnX5TrBu3HQAtAjEywbZ/40tipRiqn9ASfvWsjO/cUT+aedEL4CCI4Wg7g9kGHOdGxBz5Us1EA9HqXRosY3zDrfTFbZjBwAQjYBMJQfLVGUmXssoZfICQH6AhtntAlcQ==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by SA0PR06MB6761.namprd06.prod.outlook.com (2603:10b6:806:c0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Tue, 24 Oct
 2023 20:47:16 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::c40c:bbc8:b103:459c]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::c40c:bbc8:b103:459c%2]) with mapi id 15.20.6863.032; Tue, 24 Oct 2023
 20:47:15 +0000
Date: Tue, 24 Oct 2023 15:47:11 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: display: panel: Update NewVision
 NV3051D compatibles
Message-ID: <SN6PR06MB5342DB69A98959C9D5D275E9A5DFA@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20231018161848.346947-1-macroalpha82@gmail.com>
 <20231018161848.346947-2-macroalpha82@gmail.com>
 <e684983a-9399-4fd7-8fe5-41faeabbfab1@linaro.org>
 <SN6PR06MB534271680DB8A3A3F0A1A31CA5D4A@SN6PR06MB5342.namprd06.prod.outlook.com>
 <20231024182755.GA215478-robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231024182755.GA215478-robh@kernel.org>
X-TMN: [OFs7ACKd2LOOUegdBZd37n2gO+77QOKH]
X-ClientProxiedBy: SA1P222CA0162.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::13) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <ZTgtT5NLlQmqA2eP@wintermute.localhost.fail>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|SA0PR06MB6761:EE_
X-MS-Office365-Filtering-Correlation-Id: b20d3043-bbd8-471e-8db5-08dbd4d26786
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P23mG/nfm3vBMXmdjuAhx6w2gQB4/DWO2TGGrHh3hYb/qsZac99mkMtiZPsdGwvBC/Dvk9iLEnpv2dt33wAOMdm0ZfyVZPQCzTW5TsT0JB2ArlY00+7Les4cC/Q+hGRreMYskxAh85U1JylB/PKzvD+AsCpaqBuENwfM2Pooh6fVZUSe/awrK86yU6u7qROrCgzXyv+XffzfWIkaWqsBH46ub6lkv6NfoPuLL4LTe+tFBga/hScMek8U41W3VDnVoiwCk/7J07Zlw6fR+UUnnxVitjT3totc9NnzZZt3oEHAZhkeXYG9Vc6bnAgSXIE/+2GG+DHqu/0GIMi5Zo3PwaLXsGEiiEGhIf5SvH98AhsBtibq/FoOJy5usP0bPKUf2Y6gatwS4pGuj2LtMRrLFFo0r82+jF52XHRXeLV8KsHfHZc3QZrKsrYYANquIJIS0P7RTkGo6yaZWEAqwCgfAtYvdiaC68Fk5ZKZbuJyVZGng8dMRN6yiCokZfPoTxKNHXi9GouAe6GH4c3PVkhnZxAJA4mi2vri3erbfHxdcqQHbiqOAT4tDQmvnkAUeQvT
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pWJKjUzxXq8DND91cu/gF6BjjocBGv2s8cAZI43H5OA51OTNEDRMVujLdSiY?=
 =?us-ascii?Q?bePC8VtC3/LXM5iQ93J1F8cgxcYgyFMaLXPBnjn9cf6TgacpS4glumnVSt50?=
 =?us-ascii?Q?aX1bY6Xa8zJLHmarhxq0Al98ZqcqJiYWPskq074JIiu3ui3Ze41sOLBGS3tV?=
 =?us-ascii?Q?bcAq2/RUxVjMK9A8OS2PS4vLtK5em8KuFLHM8uxhgkU2lzkg7QfKckv1Dndb?=
 =?us-ascii?Q?7gF/i4fp8Vv8yxejPrOWiHB4kj6CwXMlduFodYc51HWmmGMd3BT+5nIF/HUd?=
 =?us-ascii?Q?q9fewT9Y58Fbx0RDw9Bjsx7Lrujd0DQMTFDWJOTIRF953ewEZKX80sJkd721?=
 =?us-ascii?Q?VTA8WFV9Lida4tWzY30haOACUV5zxSNrEc0OjdAcDg0ct2ybmpZfft2EpUjC?=
 =?us-ascii?Q?BrSxLQSqyVApM9W5fhyL7sFsCzUutnl989TTF4H423p8LxxX29VCcwDQSJMn?=
 =?us-ascii?Q?60fx8x56nvl1O/XEdIYTYqHsbDG2F1dpL7L6rFkpT9J8CscuwDhje42VWa+E?=
 =?us-ascii?Q?ZxvQb5AjXIDi3Y8GTVeumFP3WsCdLMdXArxU3ikORsDxd7XeHTVkgXq6ffp4?=
 =?us-ascii?Q?Js97kk+78pZxb4oNbbknPOVSo4QNlbHIxHi6m3/OC/7xgmVkBo06+yLl5+r/?=
 =?us-ascii?Q?QtALNyS1MLZjps4q9YlEdcnMKPPRGmas5+tvPDpT3pudujypXHbbQjcLsj2Q?=
 =?us-ascii?Q?xxGpvIK2glT93hXEcseaaR+GpMAyvD3e2Ync31vLaEOPvyiol+YCAbgKXEqQ?=
 =?us-ascii?Q?u/8trQjPco75FVJrrRVxFkdjy0088ykvgFvyT3C5IE/elDShosusVkug7c+/?=
 =?us-ascii?Q?8PX7pLBb93CD6QN+yGQho4RVK3ttuJXdPDgwA/06SMzwS1zfSxs15QYRM9+j?=
 =?us-ascii?Q?n1QZIFqLbdKYoMv8XAhI4M49wj3Iz0ff05arUJtcFmuq828x0+mYtyMJLw8o?=
 =?us-ascii?Q?u2lo3JkZGFLDuOalfdTGdKZWaXDaZ0OVuGgPSKxz5saBmayxEDMVywvA//Da?=
 =?us-ascii?Q?qHJnq7fj75WSxb745ApvgPBZquEIxv03ZBHlk1XBdJnHtH+MJOM12ciTjSw+?=
 =?us-ascii?Q?OC07LRgbPIczUW1p8YzsrsXlitBsGvnIrfjRzJN02dHdKQp2xPzxccH5S29E?=
 =?us-ascii?Q?59PcjaIa3lXZlH/PF7sbCYBgyJGoBYtePpOa9Y/naP5fjna2q+cDC7ysHTN8?=
 =?us-ascii?Q?Ty6uoPi3tvx/Uew1fSXWc6Nh83oEqhH6YLHs/XK6ux+M8H0u+A5B5ymyYZ8?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: b20d3043-bbd8-471e-8db5-08dbd4d26786
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 20:47:15.9294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR06MB6761
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, sboyd@kernel.org,
 sam@ravnborg.org, mturquette@baylibre.com, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>,
 linux-rockchip@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 24, 2023 at 01:27:55PM -0500, Rob Herring wrote:
> On Thu, Oct 19, 2023 at 09:50:38AM -0500, Chris Morgan wrote:
> > On Thu, Oct 19, 2023 at 11:22:19AM +0200, Krzysztof Kozlowski wrote:
> > > On 18/10/2023 18:18, Chris Morgan wrote:
> > > > From: Chris Morgan <macromorgan@hotmail.com>
> > > > 
> > > > Update the NewVision NV3051D compatible strings by adding a new panel,
> > > > the powkiddy,rk2023-panel, and removing another entry, the
> > > > anbernic,rg353v-panel. The rg353v-panel is exactly identical to the
> > > > rg353p-panel and is not currently in use by any existing device tree.
> > > > The rk2023-panel is similar to the rg353p-panel but has slightly
> > > > different timings.
> > > 
> > > This still does not explain me why do you want to remove old panel.
> > 
> > When I originally wrote the driver I only had one piece of hardware
> > and I set the compatible string in the driver as newvision,nv3051d.
> > Unfortunately since then I've found 2 more devices in use that are
> > *just* different enough to require the driver to do things a bit
> > differently. In the case of the anbernic,rg351v-panel I need to
> > enable a new DSI flag; in the case of the powkiddy,rk2023-panel I need
> > to decrease the vertical back porch and drop the higher frequency
> > timings.
> > 
> > The best way to accomplish this was to change the strategy from having
> > a single binding in the driver of newvision,nv3051d to a binding for
> > each distinct hardware where the differences apply. 
> 
> Exactly why the DT maintainers annoyingly ask for specific compatible 
> strings which may not be used immediately.

You're not wrong. Sorry for making this difficult. I should have done
it this way from the start.

> 
> > Note that I've
> > looked at querying the DSI panel ID, but for each device the value
> > is identical (so it can't be used to differentiate the hardware sadly).
> > So the driver now has 3 different compatible strings. I could in this
> > case add a 4th compatible string of anbernic,rg353v-panel but it would
> > be identical to anbernic,rg353p-panel. For the moment we are using
> > anbernic,rg353p-panel everywhere (including the rg353v), so it makes
> > sense to drop this unused value while we can, at least to me.
> 
> Your reasoning is the compatible string is unused, so remove it. 
> 
> If there's some reasoning about how the 2 panels are the same hardware 
> or the rg353v is never going to be used or show up at some point, then 
> that would be a reason to remove.

The compatible string of 353v-panel is unused, and the hardware is
identical to the 353p-panel (so only one string is necessary). Sorry
if that wasn't clear.

Panel 1 - The original anbernic,rg353p-panel which is also
anbernic,rg353v-panel.

Panel 2 - anbernic,rg351v-panel. This is almost identical to Panel 1
except it requires an additional flag.

Panel 3 - powkiddy,rk2023-panel. This is almost identical to Panel 1
except it requires a change to the VBP timing parameter and isn't
tolerant of speeds much higher than 60hz.

The issue I had is I originally wrote the driver checking for the
newvision,nv3051d compatible string which worked fine when there was
only 1 panel type. When I added support for the 351v-panel I *should*
have changed how the compatible string was handled, but instead I
simply added a check in the probe function to look for the secondary
string of "anbernic,rg351v-panel". When the 3rd panel type of
"powkiddy,rk2023-panel" was needed I took this time to correct the
driver and do it the right way by checking for the specific
compatibles.

Thank you, and sorry for the headaches this caused you.
Chris

> 
> You could also say the rg353v is just wrong because it should have a 
> fallback compatible to rg353p and rather than fix it, just remove it 
> for now since there are no known users of it.
> 
> Rob
