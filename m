Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4B1827A85
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 23:14:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD54110E316;
	Mon,  8 Jan 2024 22:14:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6240510E306;
 Mon,  8 Jan 2024 22:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704752041; x=1736288041;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WYeqG5p07EzyrV5F4OT6rdpJH/jow6QBD5bJru/z3PM=;
 b=m4NBRT43QNQC/6P4kEUL8VwnNtCUQNGO/cPoEX1QoBf2y913K90eHHc/
 fFjVTPcAim7NnImwgx1kie9B0/0W+mS4hgdkAK1lUo1nA6e6CbKNvzvtK
 OAhmDihisj95OTgMnIauSuf2RG4eiJd+JO087pA23j3SfyiHkPdF3f1UP
 fqdrpJh2S933IAwhiwbz4Ii2/Wc7d3BIIBKJz8Llmq4t99fGeCWOVD88a
 wAoQ4GBaYm37aqq1F4VhaT8RiM4VeL62OATr37bdUEDIStwaKMnT1Rcva
 cB+ZDk0NSN/kUyTdl4lTHLQtZeUI40RWqSOyGuabd8oV6OQqlWDwhbKWS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5366352"
X-IronPort-AV: E=Sophos;i="6.04,181,1695711600"; 
   d="scan'208";a="5366352"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2024 14:14:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,181,1695711600"; d="scan'208";a="23327786"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jan 2024 14:14:00 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Jan 2024 14:13:59 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 8 Jan 2024 14:13:59 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 8 Jan 2024 14:13:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h0QyI3+WnMTOEMEj6/f9N0WgZkQBMfa4JrvnWl3gBxnP/ll6X92c/MCDxbG1W8t375fDWPyh9hUwEmb8y7MkimFTS6dPMU/j8rmT31IupEn7n2KIGWGc6epjPSgKvYy7Lco2WyjFWIyoWaEMlPCRpZyQogBrJNCpvm756Be34VBKqCjibdBNMzYCMFAAC1iG/uHW3dZgo/78JeQtbYXnlbELfGqJuRnwo8n1Xa+QK/zO+2WjYKtfJxKSdeiH0tjHcDDU8Ra000tJK9rmkzTH8ZmbGXIU/8iOUkYFF7E5OzZUiyotzFXhvunbjCms4AgLCoqJdRjvOMnIf+eGKpgh1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ry3mHoHcxDHzXcGueySs64TTl7dbMjnmD0AiSSk8Wl8=;
 b=Su2yR0AL4LRhxecXgCBE5MlJ7T3DCkhHMYSsdmlrusl0vWU1k1Qa5HIM0+oHxX7tN4pKkGqRXzEuGd5o2lp/aTZYpkt80XKJ/Cq6kyKU+BIrPYIr08p+qgZ0/DNZqynZM2rpEZTZYxmYHzKGNNZ5OOJb/eCpY0R4OOA+NuZ9Azje1mmH4IOeZl6HcpOQ1pSDjnpokgvUxIbosBrR4ZxX/gndhTXmiMdcoDeGo5nMsQF96rMyxKRK+H6g5DIx79vdc+O159i7eBN5mlrLQRB3p/GXc9OJsd3jzDOkM6S+zbQ8atDjAeaOxva+eunAutnBv9s+RyDnVhw22UCZ959E+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB7482.namprd11.prod.outlook.com (2603:10b6:8:14a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Mon, 8 Jan
 2024 22:13:56 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 22:13:56 +0000
Date: Mon, 8 Jan 2024 17:13:51 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] nightly.conf: Add the xe repo to drm-tip
Message-ID: <ZZxzn1zdye92n5C-@intel.com>
References: <20231222113640.14038-1-thomas.hellstrom@linux.intel.com>
 <ZYsb09nsERQFDCQl@intel.com>
 <9541c844440e8b0fc5686e19850a04c7a55745ba.camel@linux.intel.com>
 <ktdr7l23leikip3hsmbxr2iirmz5zat7wck2ib6lbijl3uybtu@4iqn3adhfzyv>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ktdr7l23leikip3hsmbxr2iirmz5zat7wck2ib6lbijl3uybtu@4iqn3adhfzyv>
X-ClientProxiedBy: SJ0PR05CA0157.namprd05.prod.outlook.com
 (2603:10b6:a03:339::12) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB7482:EE_
X-MS-Office365-Filtering-Correlation-Id: f9a28cf7-3bf8-4cd5-78d6-08dc10971b37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NqRkKXN14UXxX5LDgOvTIVEyx+cdlWGa7NtYQpSj/p/gxH6MLvotqmRzr2ua0Rvg67plLXag2veaME/R52zPLwgac5OeNCi1v+lGSQjPauIia/hmqPg1/kGRQZimToV7HFzLnE94EGilgpZoyjas4YwT3c9zBUorq4FtpWlT2O1LnRKWSNeIHFzTj5qIRL68phLKgzfM5tBw9kF6EkH94uSaTMPizvmQ5AfELksCbjaC/egPZSfl9MjpW5rYIWcWac2dMDAj8Lrc8/soq5MfuE77H/evXL920yU4bb2hgAJFCxkh2NUWDVg06D3wfWfkldpeFzP+Sft7VNXktz9gZ5BnksqXCa01YpvI4R7/AfLGyu8/FVBTvBBsqTITBCXn061P5ZCAexUgrXKzNMCHK98EC+CQwdBXTcQ9zBUb+D0UpL3IuKwhQxJwNdxJffzjTs4wjucytzn7zVLTSRfCwAzgUXzIDiYqcOB35y00seKpyRC9DqHJZPg0rkuLFUdieOPzh53TT6wZwkNGAo5bdV0p6s6ob/FFYjGEVtP2aFs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(376002)(136003)(396003)(39860400002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(2616005)(8936002)(8676002)(6506007)(6512007)(83380400001)(26005)(66574015)(41300700001)(6486002)(86362001)(4326008)(6862004)(316002)(37006003)(2906002)(4001150100001)(5660300002)(44832011)(66946007)(36756003)(6636002)(66476007)(66556008)(6666004)(966005)(478600001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?15A52YyWBB9R5KvYq0yz+uBVysAXNsn7dy8DesgyOZv0hWeBtkiOy3OlJH?=
 =?iso-8859-1?Q?l7dZw8ZOox8AkL6rsxkDtnK/6Oy4wv2KnCbdOlNcexXEFnLS3NlWGeEFn3?=
 =?iso-8859-1?Q?tlcy0AR6GFI75AzGGAh31BQdukW/cojvxSWVfTgqJWRqxbprBK+YP0m8Mq?=
 =?iso-8859-1?Q?7HjmtJ2P3Xpb9c60fiHKjqHkZTRf+HKDykkxTJ8iiZc7Wb28tLRupEYDuj?=
 =?iso-8859-1?Q?4HrLjMysyoHCQiWoaaTC4JUtvEweQ5/wfTbbBN0b3ceL9F32Wdrgag+tze?=
 =?iso-8859-1?Q?VSkEz4FLEwYcQ15BB1llWMrtUxP/R2Bu9uJWWXQ9g/COxKyqZa2cMZgck+?=
 =?iso-8859-1?Q?iOjz4Ls4AqZQ+g03w62Cj5/f9z5Uev9iwveGOgxOXR7NCRaMzkl6d07vAx?=
 =?iso-8859-1?Q?1E8hfTe8T9HOa5PQzX4PPs5Mk9s5dRYGaCnNJJVydannl918dJA3kH85qR?=
 =?iso-8859-1?Q?Zxe1BtPVrrQOQK35oiA+V5lu5u6bduE1x1Ihw6kZjzdsp3lkPuJi78TY/Q?=
 =?iso-8859-1?Q?dEqqpTG4Bxjdld3xkaHV+LIOnEmZCns4YysWa/MEHZ4gdR8T2pfUKEhbO/?=
 =?iso-8859-1?Q?NlKUWguKqHEfatpWHJN/5WZf825hEwDi8P6tc1tc+m7X5SJC9JF6bjh8wq?=
 =?iso-8859-1?Q?HzTxh9D4E92UXr/efA5khcJpvFaegGprSWD3AOwvUdMm0FtZb3wOFamNAf?=
 =?iso-8859-1?Q?h6d79PMxntNz2Y9EPgTKQwS70Cjg8QNDCk2srGrmRL/KJAQQRiOg0E2Q2v?=
 =?iso-8859-1?Q?VBPEfvcA6gw04/Hkd++ESgZlWki9Us6FgnzQmDnAcoJeb8XzS2qiJS7g11?=
 =?iso-8859-1?Q?DP6gKRzyDdKNzSw9TnJZMLJ7yYgT8uvPcZpPxAzE1Rp4BSQU6eziAiDbVt?=
 =?iso-8859-1?Q?7koA3XQ3qYDcObEml/jP/PsZb31KjI5jeJMoBsidt3pxO2NWkLMP0kjL4B?=
 =?iso-8859-1?Q?H0sWHQJEDA99+tZeIsuP6T66dYmYg7tUD+RPx7io4FezL8YmoZxS1s29h/?=
 =?iso-8859-1?Q?XMinmrsLMvyRIAIgXT0jImQguvAEaLKmuP0N8IAMa4xGunPlxz9IoDvzdN?=
 =?iso-8859-1?Q?k1XH6A/DaSk4vgHjNSE4i+/ujoPQpV5TELX3MaDWNdehmcYPzOC/8/MONU?=
 =?iso-8859-1?Q?ap1cILSCH2XbQbEuVuO0pEnnkG+8WWZ9Yo2w3+dK3Yx4u18ZANiBudKska?=
 =?iso-8859-1?Q?CHZJDCDbk+0JiXxuPnn9yEM3gv/TeKc9BG7cnvWyiEDMeakGQiw4wP8nS1?=
 =?iso-8859-1?Q?f7gYI08oaINW7hAxKhxDpR337tezw8alx6l/yO0CDsQoVN8ydaQbXDJPJb?=
 =?iso-8859-1?Q?glrnd6Ma1zVaCu4gQNkLtmOXS2YtfBa45K2F+n/ZZZ3KBvlfDzDlYg9Sfw?=
 =?iso-8859-1?Q?fUFHQneySt/2A7yP2o8kSKvRkkR6irbuRFx7YNLRW7XNKHiC/WIIpO+Te7?=
 =?iso-8859-1?Q?f1U/tvruNO+eaMxneswq2IuPQ6qw/c+2e1DKv4FkeK1IR04TDSYip1nype?=
 =?iso-8859-1?Q?EvtQZ+VP4zwOlNc8OdmvJt3QX413OOy1Pq+o/jQViXlHLEQTs7UUC3FiDk?=
 =?iso-8859-1?Q?/27pfGZDS+L2CHtKjwGxryrJv/zVZEsl6C5Mj6ihbI2Y4ioNdnXUqWq9VD?=
 =?iso-8859-1?Q?gjdXwJtAxN7FRxnPHaRHmtxn2bJEZKzhnd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9a28cf7-3bf8-4cd5-78d6-08dc10971b37
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2024 22:13:56.4529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hslHsYfFoJBpnlMHTY+DQ/lHx6ba3cRvPJcLTHYxlkMtaEb435BFSZUCKLnd1/XkCXfdvp6ocEz9M0D6d0rZ8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7482
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 dim-tools@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 03, 2024 at 11:59:16PM -0600, Lucas De Marchi wrote:
> On Wed, Jan 03, 2024 at 02:50:57PM +0100, Thomas Hellström wrote:
> > On Tue, 2023-12-26 at 13:30 -0500, Rodrigo Vivi wrote:
> > > On Fri, Dec 22, 2023 at 12:36:39PM +0100, Thomas Hellström wrote:
> > > > Add the xe repo to drm-tip and the dim tools.
> > > > For now use the sha1 of the first drm-xe-next pull request for drm-
> > > > tip,
> > > > since that branch tip is currently adapted for our CI testing.
> > > >
> > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > Cc: Oded Gabbay <ogabbay@kernel.org>
> > > > Cc: daniel.vetter@ffwll.ch
> > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > Cc: dim-tools@lists.freedesktop.org
> > > > Cc: dri-devel@lists.freedesktop.org
> > > > Cc: intel-gfx@lists.freedesktop.org
> > > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > ---
> > > >  nightly.conf | 7 +++++++
> > > >  1 file changed, 7 insertions(+)
> > > >
> > > > diff --git a/nightly.conf b/nightly.conf
> > > > index 24126b61b797..accd3ff2cc39 100644
> > > > --- a/nightly.conf
> > > > +++ b/nightly.conf
> > > > @@ -24,6 +24,10 @@ git://anongit.freedesktop.org/drm-tip
> > > >  https://anongit.freedesktop.org/git/drm/drm-tip
> > > >  https://anongit.freedesktop.org/git/drm/drm-tip.git
> > > >  "
> > > > +drm_tip_repos[drm-xe]="
> > > > +ssh://git@gitlab.freedesktop.org/drm/xe/kernel.git
> > > > +https://gitlab.freedesktop.org/drm/xe/kernel.git
> > > > +"
> > > >  drm_tip_repos[drm-intel]="
> > > >  ssh://git.freedesktop.org/git/drm/drm-intel
> > > >  ssh://git.freedesktop.org/git/drm-intel
> > > > @@ -65,14 +69,17 @@ drm_tip_config=(
> > > >  	"drm			drm-fixes"
> > > >  	"drm-misc		drm-misc-fixes"
> > > >  	"drm-intel		drm-intel-fixes"
> > > > +	"drm-xe			drm-xe-fixes"
> > > >  
> > > >  	"drm			drm-next"
> > > >  	"drm-misc		drm-misc-next-fixes"
> > > >  	"drm-intel		drm-intel-next-fixes"
> > > > +	"drm-xe			drm-xe-next-fixes"
> > > >  
> > > >  	"drm-misc		drm-misc-next"
> > > >  	"drm-intel		drm-intel-next"
> > > >  	"drm-intel		drm-intel-gt-next"
> > > > +	"drm-xe			drm-xe-next b6e1b7081768"
> > > 
> > > yeap, up to this commit nothing else should change, but
> > > then we will need an extra rebase of the rest on top of drm/drm-next.
> > > 
> > > But then we need to decide where these following patches will live:
> > > 880277f31cc69 drm/xe/guc: define LNL FW
> > > 2cfc5ae1b8267 drm/xe/guc: define PVC FW
> > > 52383b58eb8cf mei/hdcp: Also enable for XE
> > > bea27d7369855 mei: gsc: add support for auxiliary device created by
> > > Xe driver
> > > fcb3410197f05 fault-inject: Include linux/types.h by default.
> > > 8ebd9cd71f8ac drm/xe: Add PVC's PCI device IDs
> > > 
> > > 
> > > Will it be the topic/core-for-CI?
> > > or topic/xe-extras?
> > > or what?
> > 
> > This sounds to me like topic/core-for-CI? Or is there any drawback with
> > that?
> 
> I think some of them are not really a "for CI". It's more like the
> workflow we are adopting e.g. with guc/huc, not sending it to linux-firmware
> until we are confident on what version we will start officially
> supporting.

yeap, I kind of agree here, but at the same time it is our way to run
our CI with the firmware blobs that we need while not final, and also
this was already used for i915's MTL firmware.

> 
> This one can't go to topic/core-for-CI neither:
> 	fcb3410197f05 fault-inject: Include linux/types.h by default.
> 
> what it would do would be that we would not see the build error anymore,
> but everyone else would (and it's not a CI-only configuration).
> Unless it's merged to another branch, we shouldn't merge it.

yeap. it is sad that we were ignored there. let's just drop this then.
our driver is workarounding this bug anyway already.


> 
> "52383b58eb8cf mei/hdcp: Also enable for XE" could be material for
> topic/core-for-CI and  "8ebd9cd71f8ac drm/xe: Add PVC's PCI device IDs"
> could either be on that branch or another xe-specific one.

yeap. For the MEI we probably need to ping Greg on the original
submission and ask his ack so we can put that in the final drm-xe-next
for good and not even include in a topic branch.

for the PVC IDs, the topic branch could be okay as well. But if we
end up with an exclusive branch for xe, then it is better there.

> 
> > 
> > > 
> > > Anyway, for the inclusion like this, after our CI is ready:
> > 
> > Could we merge this patch already at this point, considering it will,
> > at least for now, only update drm-tip with our fixes?
> 
> ack
> 
> Lucas De Marchi
> 
> > 
> > Thanks,
> > 
> > /Thomas
> > 
> > 
> > > 
> > > Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > 
> > > >  
> > > >  	"drm-intel		topic/core-for-CI"
> > > >  	"drm-misc		topic/i915-ttm"
> > > > --
> > > > 2.42.0
> > > >
> > 
