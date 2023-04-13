Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D166D6E1175
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 17:53:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9264010EB60;
	Thu, 13 Apr 2023 15:53:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0FE810EB60;
 Thu, 13 Apr 2023 15:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681401183; x=1712937183;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RfAjVu+TxXE4QgvMLNgCTuZM80XDfrx3Hv4j2VpY9s8=;
 b=aOXLjPkOC5PW/P/H0tJX69RL49cCLnMWqTfpX9adLkTy+5KvR74HMZ1L
 3SQnYJXyoKspMyIHzbBq5fjoKiUmNFvEE0p6+5Q5PbVahvUt1pG0OWDvT
 QPgjbXBV9Q71UlzS3bMz/75ag+Lt7Bpxn5QdMi0ocLyA9IjPebCONboBH
 wySMt7eCKmtHk4SLtaXUnQYzsQZYGT+Lbl6j3xP3IRcSBK1l0+IdLIJ7O
 YtY6/BAgNE4/U5nKIlHydRwWCinv+7v4Uilnw3VnvJ+TP+PlQkQAIXMpG
 4DTWjaL3hvJLnZZGj56TWOb5jACyG89fiWCAEbzXyhc225tzW1BRgwEZg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="323844733"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="323844733"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 08:52:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="863830148"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="863830148"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 13 Apr 2023 08:52:17 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 13 Apr 2023 08:52:16 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 13 Apr 2023 08:52:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 13 Apr 2023 08:52:16 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 13 Apr 2023 08:52:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ccxx/XKrBsB2BDcnUQN8RrXmRAqzwZOHVYmnANutlA909y367Xnf1dhTwGZItYk62ifRsFsadCtYwWpZUG3KK/Jp8IO4Nmi5qxovUWHSkHi2PMKNqHiODjc7hmaHSZqo5t7lkouMtvUXSBLhkbctsWBwyCM47G24eqKEOVTj6PdylsZ/7EEKdXQ52sSCJ4Vd/IfafT59o92y/da9GtV8BiKiUrqM5tcFAlpYQno1QqHm92yPBNNfb/SyAGdCNRYfdNB4eWuSd2L8/Ezf9xE+VKM8SdF/xMiaHndKcM3wg6bGSxQV+6MoGL9wJCxm862QuqnQOsQKpyQFMHX29Jxg3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qKmfnmBLQyw7rk37KyRE2z0v5iH8mXJlObudvT2FbyI=;
 b=MKAM3Sz2uXgjCYE+PAboPO8HUJ7rX4ZiNHei5aqrluI03NdUAkCFSlijBnxGhUzNP6KNH5Iyb/RuUZmlEKzprNjNFeGjBHoHXVLSVrpd0Ry8tfW1ZE71FV8nFJ+D1HcCcvnYECRVZCYhS8rX0AILntevdwx2P7PWWQMQdSXvrA1dLxYTBhyQHWF+3Gix4/ZEZ1kS5gfVj2w6tHjnFszvRThr5BH6HEer+q6/MsQwyvc9/0S95JjiVP7ZWTRnY8pFXUqKlwOnzMHBhZbN6HujKb9vG9CgG4GiciLhsF6D8REnSlH6j1MEGy1MPaRVqJT95NIgzaPusrZtqmYw0j9VOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ1PR11MB6276.namprd11.prod.outlook.com (2603:10b6:a03:455::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6277.38; Thu, 13 Apr 2023 15:52:14 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 15:52:14 +0000
Date: Thu, 13 Apr 2023 08:52:10 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: Make IRQ reset and postinstall
 multi-gt aware
Message-ID: <20230413155210.GH4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230413092006.931861-1-andi.shyti@linux.intel.com>
 <dc0042e0-8a4e-5c3d-922f-bd65402a154a@linux.intel.com>
 <ZDgKBUIV9nGcfQqF@ashyti-mobl2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZDgKBUIV9nGcfQqF@ashyti-mobl2.lan>
X-ClientProxiedBy: BYAPR07CA0017.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::30) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ1PR11MB6276:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dc0823e-160b-4ac0-f720-08db3c370c80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vZDjAVRMrbsjQ+EzEIBNyYFobRqtYeK7prnKoiE5DbpAZYvYZWyDgyTffrcbx6sRP0unV/XVkpJJcVzljfCRIkPLxGQnCzYIuErgePopusu4mQ1tyKLoQubfqcCU7w/Eeuo3ReBkk/DuRhKOcUxmKVgjElSrRxUJDJRbBLRrXIm8mWNrc1wr2l8B8lPGL5f3JYlM5BujzJBvw4Aqn4rKBRQHxwhBE+d8FuhAOqAm3lObdJDTrF9z+fmfyPAB49wibkW4ujpN0iS6TeNZPH/Mr4TraPCM0XLbwzNfMOrMaHkY7oeGZPAStnPxiN0Bz+clmAwG1dYpyfR/Zn9Frto+Rkuc4c3+sCjZv36dkMFFypnrUxN+HUbP6YvUxcOnad22ZlDKFxbC4wpHQapsAPQt6ip2ugpbqG+rk/RFsmSOatnuJ1Nd4YZxh2JTsYRqiObWQhasiSTBV/JM5bzf2X4pX6O2w2pwmDGBpg6D/Vvp6q8UKq7pD9f2n7vi2/ZB8YKKnVYVX7UoDQSTqUXiIzpSafPlXz+ekUh/G3SkEajzyKcv47c+TSGEFTp4HJmI7U5/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(366004)(396003)(39860400002)(136003)(451199021)(8936002)(38100700002)(2906002)(33656002)(4326008)(5660300002)(86362001)(82960400001)(66556008)(66946007)(6916009)(8676002)(66476007)(6486002)(83380400001)(54906003)(1076003)(6512007)(6506007)(53546011)(26005)(316002)(478600001)(186003)(41300700001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TCvF4CrAHqU6PNBSDa7pAS7LfCQ+djqJ8qTLGZBEVQ3q+bs+7cNdEWR3NvE1?=
 =?us-ascii?Q?jeJ6/oZ9tCHtIFe5tk4fVfKB1grDanzxTBjM4QjOF7sRI6Yfauf6U9xeHj9Q?=
 =?us-ascii?Q?7fBZh1iOsjAc1H1KUq8Sr10AkhkaCm08RSYCikLd6OKAEjeOjtV2EmYTc1Oh?=
 =?us-ascii?Q?UxsyGSqBTp0e4RQm8zYHwO4r5namyQgo8K8QeqN81+V6DdoydHOYH5Rd0y4W?=
 =?us-ascii?Q?dZn3EKGJtIOvSx2LuYLnQbO/i/v26gHNMeSny3rNOWh0mynDU7kOq6ck8mnt?=
 =?us-ascii?Q?gtLLl8kZ91c5ryjXa0ItDyQ1C/q3j6E93Flymog/3r9nJ/PAPiYd9YOLqxBY?=
 =?us-ascii?Q?oNOMabwJV1ICDoUJlHKLl/wyYWPas1MBgn2rtewxlSLj7WW2NW6z/PUsWHzD?=
 =?us-ascii?Q?F3PaGruTlmAQSMDRvKK1aOwkURRFKAdosZkMIfwuXAwgDMftgmRk+lVOCzNO?=
 =?us-ascii?Q?va1bl5pCUeCEr40JNlutAZaacOJmem3wJcRkcnakw5VMf0XvpEjgIpeVX0nc?=
 =?us-ascii?Q?c5VtLXiuaQc15TGWRoVu0WDN5UkYc1SKwpXHaPaTuxWpvsbru0tqMJtH8Vh5?=
 =?us-ascii?Q?19TaNhjRjTDdp0kt9H7YNcLe/YhcBF8q1MEAgpKlYy/6IPBOs12D5CdxUAsm?=
 =?us-ascii?Q?lLb6vS68QIKR+n3tRH6wU8QFW3vrrkjL4L6msR7kXzqozSYqVrqcBVfplOhb?=
 =?us-ascii?Q?0xal1G9yYQeQn/o0a7tnY3JwdBnpEDPF+ii013Vu2G3hN7h+LtZhp97+fePa?=
 =?us-ascii?Q?2TDQIzxiR2xGjmQ57vEcAEPBxLqDt88Qq6ZncJVrqDA49Ghnfiz7KeKySaSo?=
 =?us-ascii?Q?lczbhVl24QGJ+0QatZcFP/IkP5sN3EFLPaXwsSqEoh8L0842ey3G/GIZKjvP?=
 =?us-ascii?Q?5Ltgosk7L/doV5B9iBQXKxO0D8G4DtyplDsvLcG1UVDfu25HgNccsCrl5dfm?=
 =?us-ascii?Q?nkQg0PDCaRfrFcAj9JfTzY4rS4q/EjNou/DssUXDwMxpB3eDZyoqlwjN9DFq?=
 =?us-ascii?Q?InEtwiGciwIEjMxf9WVVXDCJjuiAsSbnJJ3A5/3JtdCFGwX8Kylhryh/6VRB?=
 =?us-ascii?Q?m4Sc1QYgSkOUl3j3306HN9EWYBg0spT5neYHsa5wsIcSANsXFIiUhaJaGL6D?=
 =?us-ascii?Q?awrBA+rDLoCMM0Gb6W8g48CRa2ZWBzJOZ51Eis05BaYDO5KJ9odpSTZ2dLj1?=
 =?us-ascii?Q?6zcZw8UC5mgCJbN7LdL1dp16/0DttskatSzi44P9DoEIqnPja+GcoMn2ipvw?=
 =?us-ascii?Q?n+qBj2/rjg6+UGuUIbyycG3jwuhXyP3B/yvEIkw5OdUA2/uGa5pIwmlVH6Ra?=
 =?us-ascii?Q?k7L35Uo7LnSjwBcDW2tbSkEjoyrl++6xwgd+7ubd6q1/wRt+PpA3c2tKUegm?=
 =?us-ascii?Q?G/CkJcS7/DmzMu83ie3GoYInCmjBJJYi9u/q0cI/QII4EDJcnHbk5+TsNNz8?=
 =?us-ascii?Q?/qZmTjraorhV3ggKFL9mwC43N81z+vd4ZWwJLUbL8XzMUHVY9B9RRv8Oqugg?=
 =?us-ascii?Q?+boHTk5x2P94kHdO9bcaQD5xPEWqRjCalO1KWtUQ6tV5a6eZB704GP9/rLtA?=
 =?us-ascii?Q?Ugl1rMlqWSYMv3X6ql6UnSmpMRu9kCMwFwb/hrQldzA8YvrwIYDmskc+p6rO?=
 =?us-ascii?Q?9A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dc0823e-160b-4ac0-f720-08db3c370c80
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 15:52:13.7314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jMR0q7/tBMujR+iZGyZOxWObWfG2sWyzE74S5i3ssdL+ks9Hx2xbNkgDC7qRZVWK0ujBNPETcdKOE2Wg9tobKx/lPrQUMEKn8awQudS01Y4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6276
X-OriginatorOrg: intel.com
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Paulo
 Zanoni <paulo.r.zanoni@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@kernel.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 13, 2023 at 03:56:21PM +0200, Andi Shyti wrote:
> Hi Tvrtko,
> 
> (I forgot to CC Daniele)
> 
> On Thu, Apr 13, 2023 at 11:41:28AM +0100, Tvrtko Ursulin wrote:
> > 
> > On 13/04/2023 10:20, Andi Shyti wrote:
> > > From: Paulo Zanoni <paulo.r.zanoni@intel.com>
> > > 
> > > In multitile systems IRQ need to be reset and enabled per GT.
> > > 
> > > Although in MTL the GUnit misc interrupts register set are
> > > available only in GT-0, we need to loop through all the GT's
> > > in order to initialize the media engine which lies on a different
> > > GT.
> > > 
> > > Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
> > > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > > ---
> > > Hi,
> > > 
> > > proposing again this patch, apparently GuC needs this patch to
> > > initialize the media GT.
> > 
> > What is the resolution for Matt's concern that this is wrong for MTL?
> 
> There are two explanations, one easy and one less easy.
> 
> The easy one: without this patch i915 doesn't boot on MTL!(*)
> 
> The second explanation is that in MTL the media engine has it's
> own set of misc irq's registers and those are on a different GT
> (Daniele pointed this out).

Assuming you're talking about MTL_GUC_MGUC_INTR_MASK, that's not true;
it's just a single sgunit register (0x1900e8) that has different
bitfields for the primary GuC and the media GuC.  So I still think we
should avoid looping over GTs; it's actually much simpler to handle
things in a single pass since we can just determine the single register
value once (all fields) and write it directly, instead of doing two
separate RMW updates to the same register to try to avoid clobbering
the other GuC's settings.

For pre-MTL platforms, it's the same register, except that the bitfield
now devoted to the media GuC was previously used for something else
(scatter/gather).


Matt

> 
> I sent this patch not to bypass any review, but to restart the
> discussion as this patch was just dropped.
> 
> Thanks,
> Andi
> 
> 
> (*)
> [drm] *ERROR* GT1: GUC: CT: No response for request 0x550a (fence 7)
> [drm] *ERROR* GT1: GUC: CT: Sending action 0x550a failed (-ETIMEDOUT) status=0X0
> [drm] *ERROR* GT1: GUC: Failed to enable usage stats: -ETIMEDOUT
> [drm] *ERROR* GT1: GuC initialization failed -ETIMEDOUT
> [drm] *ERROR* GT1: Enabling uc failed (-5)
> [drm] *ERROR* GT1: Failed to initialize GPU, declaring it wedged!

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
