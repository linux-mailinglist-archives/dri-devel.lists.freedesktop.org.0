Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDD1263F43
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 10:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF6F589E5B;
	Thu, 10 Sep 2020 08:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40064.outbound.protection.outlook.com [40.107.4.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 226B989E5B
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 08:04:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HSpwfXqJfXIBOxVQSnEbnk1LXxaMGKJM9qbCDCJTm4UW13nsXpL1iSWXMUQaPdWeYQzR+2CJ/pk4YK0dM6O2qBqvvRL8shNRjLgrOxJu9UqvdECXX6cS/aMBCC61Jx3EVl7roVhMnITg+WSQh0uRT7a2yM9rgwyPigA89aqSMe5qkUXDmKOVdtZxbFi2unkVvaUGYMei2r4Wiv9LmxxMcwvwB4H5W9FjXTKItog098VVWum9CVnocGMloxtXCq56fcXunLVghPo2AUm6qNOhMAYmRylTQQw7OLWP9Pa46AbnOvU0Q8mHgY2FoPVKRf+gKAuXZIOP3dOTzQeFTgsKWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c8V9uW12QgCwujYMIQWSe8BCf/HXcFoedE8kBEhfGtA=;
 b=OCbs8Ja8yykZlkUClbAoFZchH69RtSoZnwnHqlC5Xwk13ISU0jfsBxVhPEKEvUa3GVf2UaOUy4WaZgtyi6kFkfwY86VZX++tjk9RnRZgpaMJuGAHVIHbYYdEMDsVKUQla2UXLM9WKzQ+UDMnY90kj7nYpb0CLEwg92MfsLyDGdbkKpWE7cUETdpICEry8+lePMUduykRqypO7IxpLJkEFP4y/THNP1U5yiDt4/eVvfKkkbJTcnb7Mwd6zIVZqR04ta3Ft5xiEd8ZDxWFm/3e9X3naEaV3izqTvcLShF3ultlBKO6eiM0lq4AoNG7Ai7IMA6nJeuFC4K56SqyrEWCzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c8V9uW12QgCwujYMIQWSe8BCf/HXcFoedE8kBEhfGtA=;
 b=em4ro2GSVkX/kiX8yovih9R7o6F9CBZI9gdzMi+nkyXygsq1eK6SygUV+FTHLEgTSHFeAzLniK5Uu65X0nOLRjkNTfz1UAc5wkWpAnlTb4ZXRVbWwyFnf2zrhwM7kLfqXYYWHloGwQMs+JL+7YZB2Ruu6hmT1s9FbcWsBvyr8LU=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VE1PR04MB6607.eurprd04.prod.outlook.com
 (2603:10a6:803:121::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Thu, 10 Sep
 2020 08:04:37 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::5d66:84a7:26de:67c3]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::5d66:84a7:26de:67c3%6]) with mapi id 15.20.3370.016; Thu, 10 Sep 2020
 08:04:37 +0000
Date: Thu, 10 Sep 2020 11:04:32 +0300
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v9 0/5] Add support for iMX8MQ Display Controller Subsystem
Message-ID: <20200910080432.26dleo5wxybsacvl@fsr-ub1864-141>
References: <20200731081836.3048-1-laurentiu.palcu@oss.nxp.com>
 <20200828083620.6m5yhcv7rg5tckzh@fsr-ub1864-141>
 <e882838158cb9e81440c8cdeb25d80bf3310e8a8.camel@pengutronix.de>
 <20200831112445.t4xfz33avdyx5w6p@fsr-ub1864-141>
 <f46d44f38008d214951994a340814570c182cc15.camel@pengutronix.de>
 <CAKMK7uG7s1j+k0WPq8H4OcTD0jP2_LpTy0SBw0RtP-ij1OS7Mw@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAKMK7uG7s1j+k0WPq8H4OcTD0jP2_LpTy0SBw0RtP-ij1OS7Mw@mail.gmail.com>
User-Agent: NeoMutt/20171215
X-ClientProxiedBy: AM0PR06CA0134.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::39) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141 (83.217.231.2) by
 AM0PR06CA0134.eurprd06.prod.outlook.com (2603:10a6:208:ab::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16 via Frontend Transport; Thu, 10 Sep 2020 08:04:35 +0000
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ed35e88d-57ae-4a3f-d084-08d85560291f
X-MS-TrafficTypeDiagnostic: VE1PR04MB6607:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB6607A9572C9EFAB40213882ABE270@VE1PR04MB6607.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TPhEeELiLoqUZym90Ze2EJEyXnES38fcNLkvznbeD4tZdHzdyEB/9SuPdsS5M8ZXaoXNHYxIdA9uFrBvf2FMWUwfJ/xuEBimsz22tnojhFs3B8xlMU2wwwX+mA4zaenwlLsHAx3hQ6emFrp55bCYLwTrikANsdwzKUdUz9hshDMFBomvpS7Zt5YWc2vhg4o8aI+ZeciFGiKuwu143Lf7Jx4ogPLIrMbppNOfA33DYSC0jXgg6ie5Zl3FHujKpcpcL9L8RD5GBZU+y6wfH4eNtPXmDNTC0J0aWT3T7i5kjZNWgMRBFCTSolwK8u4HEU6NLI+f0+SrHiIFp3hpqq+RYQN/NwPqDV3zjvChtVtMBGJiQ48VIBBSSc4xgP6H5sOSLIqbuYGPoQUNEUQldryRK7HWrrfbpCNDcoL4/ZtC1dWqMnVVdxh2DpqOI1Y8HsH/ErGebEFaPE3stXMX+boO5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(366004)(39860400002)(136003)(376002)(44832011)(6666004)(6496006)(26005)(8676002)(83080400001)(478600001)(956004)(30864003)(186003)(7416002)(4326008)(966005)(16526019)(8936002)(2906002)(316002)(53546011)(55016002)(86362001)(83380400001)(54906003)(66946007)(6916009)(66556008)(66476007)(33716001)(1076003)(5660300002)(52116002)(9686003)(32563001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: XSJWZuPEjBgzjq94L6FWOPIbgHW8JWkDrzQa3JGUcIxnleCTDmXAaZeNX7yth3LZIAJxpMrVZRzOwpvUnGZYKElN6SJZJLwgdYzBrmHqP7lzDKtu77Rye/4AfdkWT3SILlBCvlH13svb0gvAv3CQkpO8HrIXxLlGwulgO3n+v3QvsahYFqf3MfKOrObftHMv/ZaaQS5S9fi45IFpjONc3F+L3nOudB0hZw4DDwMgpNWq9wOEH6bdCnRVRt1T915g7jo+VPI2KZqEtRz7gV0CBoQrgqRl2imUEZryZ1esAi5jwCUNuiYmO4JIjcofY3Zf2Ths9Hg/lxq8C5YXXGoMAPataGpia/vuJkMImD0fNmP2s1bF3GLGcl1wTt9SghWo5zlmrMAXfoFQMAu592q69D16l3u2yGl2bLk+sXDJJrp1/HOagukFL8kshct7OsglHfzQ6lqsB2RjVxQrM1jz6UHKGK8JEsYj0HFuIXFVWWPOl6iiDQe0fzemgIeeUI7ISln6WYabmkO4m+MVgDM3m9oHGL6iyAhazcQvnvTJU6nWGo96pTfcpdni9wo3XtvvscVa8x2d9rNnuT7+jILyG6XfrNlbdS6uANhOpTOfPD9CpD5K3U6FchI1mhCbh0B6uXeWjVZAszBB8pnjregXQg==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed35e88d-57ae-4a3f-d084-08d85560291f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2020 08:04:37.3254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QBhvzbcYrQEJMzwDzVKEj5mxkXWbxd/IXjggvvcFJfxHU9FOqdpN6G7g16+cEUeGQQV4qpZsgZb/bg8abrpUfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6607
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Laurentiu Palcu <laurentiu.palcu@nxp.com>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>, lukas@mntmn.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Thu, Sep 10, 2020 at 08:47:34AM +0200, Daniel Vetter wrote:
> On Wed, Sep 9, 2020 at 5:03 PM Lucas Stach <l.stach@pengutronix.de> wrote:
> >
> > Hi Laurentiu,
> >
> > On Mo, 2020-08-31 at 14:24 +0300, Laurentiu Palcu wrote:
> > > Hi Lucas, Sam,
> > >
> > > On Mon, Aug 31, 2020 at 12:37:23PM +0200, Lucas Stach wrote:
> > > > Hi Laurentiu,
> > > >
> > > > On Fr, 2020-08-28 at 11:36 +0300, Laurentiu Palcu wrote:
> > > > > Hi Lucas,
> > > > >
> > > > > I was wondering about the plans to merge this series. Since not many
> > > > > people can test it properly due to lack of DCSS support in the upstream
> > > > > NWL driver (which I heard it's coming soon) and a completely nonexistent
> > > > > HDP driver, are we going to take a leap of faith and merge it as is? Or
> > > > > should we wait?
> > > >
> > > > I think even if the bridges aren't ready yet, the driver is in a good
> > > > enough shape to merge it. There's no point in letting it accumulate
> > > > bitrot while waiting for the bridges to land. Also I guess it will make
> > > > bridge driver development a lot easier when the DCSS driver is in-tree.
> > >
> > > OK, fair enough.
> > >
> > > > > As to who is going to do the actual merge, I know we had a brief
> > > > > discussion about it some time ago and I was supposed to apply for
> > > > > drm-misc rights, however it feels a little awkward to merge my own
> > > > > code... :) Though, I might not even qualify for drm-misc rights anyway,
> > > > > considering I haven't been very active in this area... :/
> > > >
> > > > Please consider applying for drm-misc merge rights. Even if you don't
> > > > do the initial merge I think it will come in handy in the long run.
> > >
> > > OK, I'll apply for drm-misc rights. Sam also encouraged me to do this in
> > > a previous email. Since this series will be followed by a bunch of other
> > > patches, enabling support for video planes, among other things, I guess
> > > I'll need the rights anyway.
> > >
> > > > > On that note, I will probably need help with the merging, provided it's
> > > > > still happenning. Will you be able to help me out with this?
> > > >
> > > > Sure, I'm having some time available this week. I'll give this v9
> > > > another spin on my boards and will do the merge after that.
> > >
> > > Thanks Lucas. As a matter of fact, after Sam's email, I was preparing a
> > > v10 after rebasing to latest drm-next. However, no conflicts were encountered
> > > and the v9 series applied cleanly. Let me know if you encounter any
> > > issues and I can resend it.
> >
> > I've tested this together with a hacked up eDP bridge driver stack on
> > my boards. The testing hasn't been really in-depth, but things seem to
> > work fine. I have now pushed the whole series into drm-misc-next.
> 
> Something doesn't compile too well
> 
> ERROR: modpost: "__aeabi_ldivmod"
> [drivers/gpu/drm/imx/dcss/imx-dcss.ko] undefined!
> ERROR: modpost: "__aeabi_uldivmod"
> [drivers/gpu/drm/imx/dcss/imx-dcss.ko] undefined!

Oops... :/ I guess we need an ARM64 dependency in Kconfig. No
32bit NXP SoC uses this particular display controller. So, that should
fix the compilation issue on 32bit.

I'll send a fix shortly.

Thanks,
laurentiu

> 
> Cheers, Daniel
> >
> > Regards,
> > Lucas
> >
> > > Thanks,
> > > Laurentiu
> > >
> > > > Regards,
> > > > Lucas
> > > >
> > > > > Thanks,
> > > > > laurentiu
> > > > >
> > > > > On Fri, Jul 31, 2020 at 11:18:28AM +0300, Laurentiu Palcu wrote:
> > > > > > From: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> > > > > >
> > > > > > Hi,
> > > > > >
> > > > > > This patchset adds initial DCSS support for iMX8MQ chip. Initial support
> > > > > > includes only graphics plane support (no video planes), no HDR10 capabilities,
> > > > > > no graphics decompression (only linear, tiled and super-tiled buffers allowed).
> > > > > >
> > > > > > Support for the rest of the features will be added incrementally, in subsequent
> > > > > > patches.
> > > > > >
> > > > > > The patchset was tested with both HDP driver (in the downstream tree) and the upstream
> > > > > > MIPI-DSI driver (with a couple of patches on top, to make it work correctly with DCSS).
> > > > > >
> > > > > > Thanks,
> > > > > > Laurentiu
> > > > > >
> > > > > > Changes in v9:
> > > > > >  * Fixed a compilation issue found by Guido in his setup: 'select
> > > > > >    VIDEOMODE_HELPERS' was missing from Kconfig;
> > > > > >  * Use imx8mq-clock.h in the bindings file so one can understand what
> > > > > >    those clock values mean;
> > > > > >  * no other changes done. Couldn't address the hang Guido reported as
> > > > > >    it's not happening in my setup. However, in my tree, there are some
> > > > > >    extra NWL and ADV patches applied on top of upstream ones... Also,
> > > > > >    removing them and testing only with upstream, even if there's no
> > > > > >    image out, does not produce a hang... :/
> > > > > >
> > > > > > Changes in v8:
> > > > > >  * Removed 'select RESET_CONTROLLER" from Kconfig as Philipp pointed
> > > > > >    out. SRC is not used in DCSS driver;
> > > > > >  * Nothing else changed;
> > > > > >
> > > > > > Changes in v7:
> > > > > >  * Added a patch to initialize the connector using the drm_bridge_connector
> > > > > >    API as Sam suggested. Tested it using NWL_DSI and ADV7535 with
> > > > > >    Guido's patch [1] applied and one fix for ADV [2]. Also, some extra
> > > > > >    patches for ADV and NWL were needed, from our downstream tree, which
> > > > > >    will be upstreamed soon by their author;
> > > > > >  * Rest of the patches are untouched;
> > > > > >
> > > > > > [1] https://lists.freedesktop.org/archives/dri-devel/2020-July/273025.html
> > > > > > [2] https://lists.freedesktop.org/archives/dri-devel/2020-July/273132.html
> > > > > >
> > > > > > Changes in v6:
> > > > > >  * Addressed Rob's comment and added "additionalProperties: false" at
> > > > > >    the end of the bindings' properties. However, this change surfaced
> > > > > >    an issue with the assigned-clock* properties not being documented in
> > > > > >    the properties section. Added the descriptions and the bindings patch
> > > > > >    will need another review;
> > > > > >  * Added an entry for DCSS driver in the MAINTAINERS file;
> > > > > >  * Removed the component framework patch altogether;
> > > > > >
> > > > > > Changes in v5:
> > > > > >  * Rebased to latest;
> > > > > >  * Took out component framework support and made it a separate patch so
> > > > > >    that people can still test with HDP driver, which makes use of it.
> > > > > >    But the idea is to get rid of it once HDP driver's next versions
> > > > > >    will remove component framework as well;
> > > > > >  * Slight improvement to modesetting: avoid cutting off the pixel clock
> > > > > >    if the new mode and the old one are equal. Also, in this case, is
> > > > > >    not necessary to wait for DTG to shut off. This would allow to switch
> > > > > >    from 8b RGB to 12b YUV422, for example, with no interruptions (at least
> > > > > >    from DCSS point of view);
> > > > > >  * Do not fire off CTXLD when going to suspend, unless it still has
> > > > > >    entries that need to be committed to DCSS;
> > > > > >  * Addressed Rob's comments on bindings;
> > > > > >
> > > > > > Changes in v4:
> > > > > >  * Addressed Lucas and Philipp's comments:
> > > > > >    * Added DRM_KMS_CMA_HELPER dependency in Kconfig;
> > > > > >    * Removed usage of devm_ functions since I'm already doing all the
> > > > > >      clean-up in the submodules_deinit();
> > > > > >    * Moved the drm_crtc_arm_vblank_event() in dcss_crtc_atomic_flush();
> > > > > >    * Removed en_completion variable from dcss_crtc since this was
> > > > > >      introduced mainly to avoid vblank timeout warnings which were fixed
> > > > > >      by arming the vblank event in flush() instead of begin();
> > > > > >    * Removed clks_on and irq_enabled flags since all the calls to
> > > > > >      enabling/disabling clocks and interrupts were balanced;
> > > > > >    * Removed the custom atomic_commit callback and used the DRM core
> > > > > >      helper and, in the process, got rid of a workqueue that wasn't
> > > > > >      necessary anymore;
> > > > > >    * Fixed some minor DT binding issues flagged by Philipp;
> > > > > >    * Some other minor changes suggested by Lucas;
> > > > > >  * Removed YUV formats from the supported formats as these cannot work
> > > > > >    without the HDR10 module CSCs and LUTs. Will add them back when I
> > > > > >    will add support for video planes;
> > > > > >
> > > > > > Changes in v3:
> > > > > >  * rebased to latest linux-next and made it compile as drmP.h was
> > > > > >    removed;
> > > > > >  * removed the patch adding the VIDEO2_PLL clock. It's already applied;
> > > > > >  * removed an unnecessary 50ms sleep in the dcss_dtg_sync_set();
> > > > > >  * fixed a a spurious hang reported by Lukas Hartmann and encountered
> > > > > >    by me several times;
> > > > > >  * mask DPR and DTG interrupts by default, as they may come enabled from
> > > > > >    U-boot;
> > > > > >
> > > > > > Changes in v2:
> > > > > >  * Removed '0x' in node's unit-address both in DT and yaml;
> > > > > >  * Made the address region size lowercase, to be consistent;
> > > > > >  * Removed some left-over references to P010;
> > > > > >  * Added a Kconfig dependency of DRM && ARCH_MXC. This will also silence compilation
> > > > > >    issues reported by kbuild for other architectures;
> > > > > >
> > > > > >
> > > > > > Laurentiu Palcu (5):
> > > > > >   drm/imx: compile imx directory by default
> > > > > >   drm/imx: Add initial support for DCSS on iMX8MQ
> > > > > >   drm/imx/dcss: use drm_bridge_connector API
> > > > > >   MAINTAINERS: Add entry for i.MX 8MQ DCSS driver
> > > > > >   dt-bindings: display: imx: add bindings for DCSS
> > > > > >
> > > > > >  .../bindings/display/imx/nxp,imx8mq-dcss.yaml | 108 +++
> > > > > >  MAINTAINERS                                   |   8 +
> > > > > >  drivers/gpu/drm/Makefile                      |   2 +-
> > > > > >  drivers/gpu/drm/imx/Kconfig                   |   2 +
> > > > > >  drivers/gpu/drm/imx/Makefile                  |   1 +
> > > > > >  drivers/gpu/drm/imx/dcss/Kconfig              |   9 +
> > > > > >  drivers/gpu/drm/imx/dcss/Makefile             |   6 +
> > > > > >  drivers/gpu/drm/imx/dcss/dcss-blkctl.c        |  70 ++
> > > > > >  drivers/gpu/drm/imx/dcss/dcss-crtc.c          | 219 +++++
> > > > > >  drivers/gpu/drm/imx/dcss/dcss-ctxld.c         | 424 +++++++++
> > > > > >  drivers/gpu/drm/imx/dcss/dcss-dev.c           | 325 +++++++
> > > > > >  drivers/gpu/drm/imx/dcss/dcss-dev.h           | 177 ++++
> > > > > >  drivers/gpu/drm/imx/dcss/dcss-dpr.c           | 562 ++++++++++++
> > > > > >  drivers/gpu/drm/imx/dcss/dcss-drv.c           | 138 +++
> > > > > >  drivers/gpu/drm/imx/dcss/dcss-dtg.c           | 409 +++++++++
> > > > > >  drivers/gpu/drm/imx/dcss/dcss-kms.c           | 198 +++++
> > > > > >  drivers/gpu/drm/imx/dcss/dcss-kms.h           |  44 +
> > > > > >  drivers/gpu/drm/imx/dcss/dcss-plane.c         | 405 +++++++++
> > > > > >  drivers/gpu/drm/imx/dcss/dcss-scaler.c        | 826 ++++++++++++++++++
> > > > > >  drivers/gpu/drm/imx/dcss/dcss-ss.c            | 180 ++++
> > > > > >  20 files changed, 4112 insertions(+), 1 deletion(-)
> > > > > >  create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
> > > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/Kconfig
> > > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/Makefile
> > > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-blkctl.c
> > > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-crtc.c
> > > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-ctxld.c
> > > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dev.c
> > > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dev.h
> > > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dpr.c
> > > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-drv.c
> > > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dtg.c
> > > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-kms.c
> > > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-kms.h
> > > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-plane.c
> > > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-scaler.c
> > > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-ss.c
> > > > > >
> > > > > > --
> > > > > > 2.23.0
> > > > > >
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
> 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
