Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE7D78F317
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 21:08:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82C910E6BE;
	Thu, 31 Aug 2023 19:08:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B09F10E6BE;
 Thu, 31 Aug 2023 19:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693508921; x=1725044921;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=C/Brhx3FFm2ll7k2P4Yp6uNgxn+DmDAY/HxIjDN+5z4=;
 b=LWnSEoWh38AXh2MZF7zxz18ig5NNyrJqGhiGGO+tJLhhsv5KB5F7qXZp
 hOkz15i/i055jeWqXWrvx3DTNJcImy5mfXwKwgE/QuaH5jvCNYrMZz/ao
 SRNKfsIpGoPjBGFRPoRWaoMUgEolaGGE//NxtJOJUScr9gSFKNvfmJYxI
 Wp2B/FHEEe2XlHZkaa7luVwKiwLGFTidcvC7toep0F0X4Rxvpuyscxf1f
 03nBLVWILR8jSnGSqXcy8gtAJnvd9SWi2KcquC2DQUCZ5tQEhI2iknKQz
 LI1JDnzntFB1KT128J65szF/u6lzOkftOC8oOX+wPuujq8TJPELcNhVmm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="356352172"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="356352172"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 12:08:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="716462370"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="716462370"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Aug 2023 12:08:39 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 12:08:39 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 31 Aug 2023 12:08:39 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 31 Aug 2023 12:08:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xas/ZiLpL9dWXhT+GdyxdtyR7lPbtdZbS4mypVMCVRSpiUUvjzUn+Dd+BkeJ2jad8497ioY3fJfQ9E9DWBHhKI7jegzP2RoG08vM2IAFgfR7Au8yYH6STDiXAP81l5d4wnvFE+lGB1/HEQj4kURlB4lMdZnvxjyMyzU4hK4XdtG+QOHp/V5DnRkBUT9FOO3V5HLYpL8BEXd4nxdeYMyFcvbCYXSE0bveam/fleSa8t6KMn1o4am6BQOlhZMRIzgUvm2zZj5fxmpr1Ssdzk8oMfM2u/Be2TKQIHHTWAdhfVXokLDG1+KiA9bx+UBmkBMOIaEwgBqJ/GBiJQBgIWoCgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xWOGaPu69gKUiJ9wI/JCFQw9i8O8kQBxN05JFly49oo=;
 b=bXFbD+YBlJva2TCxog5h34MSSKq/AM19KM2daHfx1GUMoOwB4QzHDdSioMgRmLVyt0khzI+PyMPftpiCy8piEgnQtfky+tmJWqjhXepqM0GMOJbLgb9RrBi/c9bRoob/y4eIXFZKTn4lJhGw++uMmQ/Hj64KZLZaCllNiBngfBJKYxfyy5zCiJZpoWIvcitfHbSi+SGidG8ZpXimcV4dvqaeoDzPgxrI5B+WSLWFDAm5iKrfTnMXXuxJPsMW2xt05qo/UVA/t2IzmSw1UOq3gckOoWOFv0T2UR3n/wicMZF1nSQwWcDEy8WB6pwdpLtig3AWv8LvMO4A/y6zT1X75Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB7068.namprd11.prod.outlook.com (2603:10b6:806:29b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.37; Thu, 31 Aug
 2023 19:08:36 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.020; Thu, 31 Aug 2023
 19:08:36 +0000
Date: Thu, 31 Aug 2023 15:08:31 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, Danilo Krummrich <dakr@redhat.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexdeucher@gmail.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 1/4] drm/doc/rfc: No STAGING out of drivers/staging.
Message-ID: <ZPDlLw0L10aLHJ2x@intel.com>
References: <20230829163005.54067-1-rodrigo.vivi@intel.com>
 <ZPBPy9K/Mx820Z3q@phenom.ffwll.local>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZPBPy9K/Mx820Z3q@phenom.ffwll.local>
X-ClientProxiedBy: SJ0PR05CA0072.namprd05.prod.outlook.com
 (2603:10b6:a03:332::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB7068:EE_
X-MS-Office365-Filtering-Correlation-Id: ff56cb77-e702-4669-d705-08dbaa55ad83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pg2Gaa2Q6rJ3dg4WB8c+kfi2A8VLYKFWRwsYtu576/Hf5wkZiGnMgB2ySRLBPEhgEO8+c3oc0jCUB2DEzxipYCoNIBb9P7bYd5Jrsp8Xox2pQ4z5W0z9/BN1dcS/yOynuo0N09tmzY5XfKOfvNxrTEa3fy467CYDrybFmVjLwB1LZaAKLMEjCwgHh/4to6uH4rlr98+AooiPkVu3J22XMQvf8PffWx1pVkf0zf9qHfyfepNEy+EuQvqkfoso17bFhRMpNwOfBzaC2oZnEqqMF+W8/HBhQlkxDtzkx25/dF02CxKtrnOIhBPFFUYT29jbqrSIx7r3yjL2SyCT78L5Z6cJDM1YNTqH0gSkYjr++5q65dnD5J9HCnMBAaKpGpf15y9vxjfJbJdqRFZbURTTZcy1g5dTxgK0V4c3pMjNJ24SeU+SB80C6QZCt8w97XuCWUhKZ/EKXZOgVlPg1LamMykq13Rsa4KFC+ZptYaLc5LhUH9f9jZmt6/X59/dHlSpwnAiFALiTSGLhjsQmn0rNSlH6v4waNgxPHm4n7y9yGWWaKEFHRqxPaOASsuNZbjCP+HJKqAlcAhkuXtZKwQZEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(366004)(396003)(376002)(346002)(451199024)(186009)(1800799009)(38100700002)(110136005)(66556008)(66476007)(66946007)(6512007)(966005)(6666004)(82960400001)(316002)(83380400001)(86362001)(6506007)(6486002)(2616005)(2906002)(41300700001)(478600001)(36756003)(4326008)(8676002)(8936002)(44832011)(26005)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkJrQkdJdnlma2lHRVZESnJwZlIzcWlpQTNYNytNMDJxaTRkZVBCWEE5SEFU?=
 =?utf-8?B?SlFicjNJS0dtbWttYXExc2IzSExuRTVNTlZXT2ZwTm5RYnRBcHZWK0hPMVNS?=
 =?utf-8?B?ZFgvRlZKaUFBbHZjTjBud0oyNmgvbFQ2bnlwVkE0ZkRvdGcwVCtVWVZqWTBv?=
 =?utf-8?B?WXRyVjk1ckFBR3YyK3JSZHFmU2haTmtvR2g0WG4zVGFqbm5ZUVRpbE9iVmZi?=
 =?utf-8?B?c0UyMEdGZW1aS3UxbXFCVDV3RmFLOGwvN0dkY2ttNmJzMm4wQ0FDZVdkRnEw?=
 =?utf-8?B?TGF0dnFSK1FiVTVTQnpyQkZlYmhZR0drRHZTQTQrdUxBTFd6ZE1YOXNoVWRN?=
 =?utf-8?B?SFltRkhVcUh1cVhFRGM3UDV6Y0lsM2hXcDhPTzdIMVVUTm1XenZ5bHZQUjB4?=
 =?utf-8?B?aG1aWkl3VTJkMGp3em9ZNUpOVVdheFdNL1VFK3Bmb056WElkZHMzT1Q5REVC?=
 =?utf-8?B?UnRGb1h6YW96MFdTUnNVN1dSdWY0VHYyVXkxYzJnUDlZYnJieDNET0JNU1Jw?=
 =?utf-8?B?cmRuZFlnZGovN3l2YzhxRFlhQWg0bm50MkovQm9FVmlEMmxkc0FtVXBnT3JB?=
 =?utf-8?B?b3UzRUdwaGdsT1ExRExVUjZNMHFYK2ROVG9vRE5FbnhGRWFqaFJtcWhCQzBK?=
 =?utf-8?B?NEtGTzJ3WWI2NFl3ZE1Genl6UEVXNjA2dWlFUmRncUt2VHVIU1RuU01ZNjNi?=
 =?utf-8?B?eitqQTNqbDJQOS9xQjJsY01ZN3c1TWN5V0xuRCs1cUFLTDY5cWZudUFLUkt6?=
 =?utf-8?B?TlVDUGxMWGxPYXZxT2N6cFFNYnZzVzk0eE83OWExL1IraXFEK2dVRThURFMv?=
 =?utf-8?B?RjYzTGtPd2E0YzQ4SkJpOFdPY2RvbERwWStWNVhNV0k4L3dpSnZWZVdVaTR2?=
 =?utf-8?B?cFRna3JNSDZCaGdmT2FVRFFLNmpES05BRmx1NVh2Q2hqdzZCWTlXUDgramdX?=
 =?utf-8?B?SFU3anlhV2Q2dTlVZVlRWERwWWY1TmtEc2wyRzREcTkvSnMrOWkzTFg1N21n?=
 =?utf-8?B?Y0pBY3U4ZkFRWmh3aXA4UzhCSlg2R1lEL0VuVFJxQWNnWDIxOWRKb3hVb2p5?=
 =?utf-8?B?ZGJLeXJLZDlNMzQ1R2tDdTJSSGF1eVdmai8vMXp6amJOYU5UTHRNUndFMjYw?=
 =?utf-8?B?RG9zUVQ0ODUxbGh3SGxQUjA2ZUowS0IwcEtnQ0JWbXlXYUtIRlMxQ3VqNUtE?=
 =?utf-8?B?T1YwU1dWU1dWejBjSFBTOWo2YlZ4U2lGZG9DT1dRUE1yWDZiR1B3VUt5TnFm?=
 =?utf-8?B?dCtBN1EwOWY0OWxKclpxbGNBU29ROHdxUjFLTERnU1hsSFZvNEpwTUdWelor?=
 =?utf-8?B?MkhybGJwTjRHVXlGOHZuZmtkczdlQ2xiMWdRd24ySnl1Y2FXMGFxU3ZTV3Vo?=
 =?utf-8?B?Uml1d1dTNXQ0SEVOdWI0K2JuajdGMFpLaGgvSmp3MTJpMlBYRCtlcDBHYzFn?=
 =?utf-8?B?U3V1UHBQYzZNMHlKNVMxaGxqeENKRnNqOGg5WVg4aGpkYlMyeG5iQTZpcEF4?=
 =?utf-8?B?N3BLWU8rbDEyeWRvSW92T3hreXJ1NkRGVk5pU1BCVEhKVm1BUGZuZFBZbC93?=
 =?utf-8?B?bWFoQUVMMFRONnlNVjEwREo3alNqYzRyWW5pNk4wNStya240SnNaTi9xbWVR?=
 =?utf-8?B?WTB6SmVRMjdjV2JGZUpnR1ZDRWNUdUh6ZjFhenh1U3JIQUlwUGxXSXZUZS96?=
 =?utf-8?B?VzZBSTQrVHhTVlBUSnJKa2hzdkFzU285bUZCbmREYUQ2cWxBNVBWdS9oVks1?=
 =?utf-8?B?YnJKdmxRdzdTK1RESkxvcEkvYW1TT1BBL0Jwbi9ab202bDN1MDZkdWtpemQ1?=
 =?utf-8?B?bXNQWExIT0JSZkw2VW1mN3I1aURuc1dwT3hPMElkQUpPVDZLOW5jbzdtL083?=
 =?utf-8?B?OVB3NXdOZU9wMWtuZDljODNsUmR3aU9Lb0RmRmtZdHVwalJlTmdycmUwTGor?=
 =?utf-8?B?bTJpN0wwWGUxb1NqM0oyOE43YlZjSDR3TU5hQkdpS1g1SGtWQTJuUVhSbUlL?=
 =?utf-8?B?QnNkQzJNVTRaQXVnTXkrMU9HVEVMM2FHUEJ5MDVpQmJSK1pMdlk0cmoxS3ZZ?=
 =?utf-8?B?TXVYRDB4dm1sZE5mRS9HTFFUcWtLbUVkK2ZYSXVWUjVpYndIRlNJUEdqYncx?=
 =?utf-8?B?anorTzErWnl2cTZPWXBOY1d2by9KRnhIaXJpVzZ0M0F3M0IwcGNidVpyMjRy?=
 =?utf-8?B?RFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff56cb77-e702-4669-d705-08dbaa55ad83
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 19:08:36.7921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oRCWEMf40axkIJd2eWCZXRyImZMzKIkOwYalfFMOEBVAZLiE2ylZztPfXhXib6pecHiUTTiKMSKBG7AfRlIVtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7068
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
Cc: daniel.vetter@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 31, 2023 at 10:31:07AM +0200, Daniel Vetter wrote:
> On Tue, Aug 29, 2023 at 12:30:01PM -0400, Rodrigo Vivi wrote:
> > Also the uapi should be reviewed and scrutinized before xe
> > is accepted upstream and we shouldn't cause regression.
> > 
> > Link: https://lore.kernel.org/all/20230630100059.122881-1-thomas.hellstrom@linux.intel.com
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> On the series:
> 
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Thank you

> 
> But also, I really don't want to be the gatekeeper for "is xe ready for
> merging",

It makes sense. I'm also cc'ing the folks you mentioned here so they
are aware on why I would be pinging them asking for acks on the follow-up
patches.

Also I'd like to mention that we have already addressed almost all of the
critical items found by Oded, and we will soon open gitlab issues for
the items he agreed that will be nice to have.

Another front of getting Xe really ready is the uAPI review. We have
identified the items that we need to change before we are ready for our
first pull-request:
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues?label_name=Fix-for-upstream

now back to this xe.rst updates:

> so at least for the last two patches I think an ack from Danilo
> that there's indeed a rough consensus/plan is much more important than my
> own. The first two don't need that, because there was no "build dri-devel
> consensus" aspect to those.

Agreed.

> 
> And for the sched side I guess an ack from Christian or maybe some of the
> other in-flight drivers (Lina or Boris?), with maybe an ack from Danilo
> for the long running compute stuff (or whoever cares about that, I don't
> think amd is working on extracting the amdkfd trickery, but maybe they
> need the sched support when they add real compute to the render driver
> too) is again much more important than me dropping an ack from the
> sidelines.

Yeap, that long-running patch is out of this series for now. Let's first
get these ones in so we start to mark little by little what is completed.

On that long-running one, I have chatted with Alex and the goal for the
amd compute is to really use the userspace queue for any kind of compute
and long-running.

And the only thing that I could spot on their code that could be similar
is the their eviction_fences vs our preempt_fences. But I don't see much
value on having another layer for that instead of using the dma_fences
directly.

But as I told, let's first get these 4 updates in and next I will send
only the long-running one cc'ing all the mentioned folks so we can agree
on a consensus around the long-running.

Thanks,
Rodrigo

> 
> Cheers, Sima
> 
> > ---
> >  Documentation/gpu/rfc/xe.rst | 6 ------
> >  1 file changed, 6 deletions(-)
> > 
> > diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
> > index 2516fe141db6..3d2181bf3dad 100644
> > --- a/Documentation/gpu/rfc/xe.rst
> > +++ b/Documentation/gpu/rfc/xe.rst
> > @@ -67,12 +67,6 @@ platforms.
> >  
> >  When the time comes for Xe, the protection will be lifted on Xe and kept in i915.
> >  
> > -Xe driver will be protected with both STAGING Kconfig and force_probe. Changes in
> > -the uAPI are expected while the driver is behind these protections. STAGING will
> > -be removed when the driver uAPI gets to a mature state where we can guarantee the
> > -‘no regression’ rule. Then force_probe will be lifted only for future platforms
> > -that will be productized with Xe driver, but not with i915.
> > -
> >  Xe – Pre-Merge Goals
> >  ====================
> >  
> > -- 
> > 2.41.0
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
