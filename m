Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D48A76FFE6C
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 03:31:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C7F10E605;
	Fri, 12 May 2023 01:31:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F3F910E605;
 Fri, 12 May 2023 01:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683855104; x=1715391104;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4OJh3x8jAFXfpr9qsJMczy46//uV3/JCNoYn7W1BRC0=;
 b=CVwY0QuDpuwJSfTlzojZiyGejpnJvqupGL9v1asL3Zkvwp7bQuyO3BCK
 VzLc+poTkvUhlyJlEMjvD68QAcPqKG8BSu6AEHtEQWY8gZX+NlwTJqnaV
 rRJ/3U7c3KROn4cyGM2uK/A2SVH0ExuSd+xEVes75Hf55dW2xFphkeLQH
 8uac2zupu5tNBCNFoLeN0FiFVqaRYavoF0yh8NSD5mmdhclrW9RVBE7mk
 MQHMJ25i4aiyGf/ymb28sBi1WVglsQBMjbNGSbvujOxHRZNuNtPpjwcvM
 vm/mUh5uGXJlHAelp3FwcaYKZVb2/RXVJsztYK/Wk7yQ2uFRh9K35GfWs g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="416300721"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="416300721"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 18:31:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="677477076"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="677477076"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 11 May 2023 18:31:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 18:31:41 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 11 May 2023 18:31:41 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 11 May 2023 18:31:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=atuRSuxvpQRvhzVdLpErm9QaLQMKN6JBEraRYAGKKt2gNOO7INq7MaL4I4zVxo6JdPct3L7kQS3mP3BvDJ4H+hSvctjq6ZDV+gWd3l4vtH/fl20pIpf7qwFZqd66xuEHzmpCnbGHIj1zr9viuarH+K1n738G1+mdNVLLxHuP5VqKHowYV7m+WnqiWNNQrv0qLMRdCXgR2hvaUaARzUdrrRXkCWCiBbWCZzEirGa+BeIWiSspnKCOUPfgkeJmJgUC+M9e6WWuWrN6A2qEj9lCwCBg/J3UHseVg7oTUka0YrTqzT+BhNFnTlePJbU0ewyodo3d25sb2CCz/NmIhb2AKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vRAJAbZEVRghu4UQjJ/vZV3ByOvUiNeQSltJBr4ADy0=;
 b=LZuPbcs20yK/maKFv3+zThLWo3cKkhYu/9ozVfvP+F3kI4JvBOai+BmZpBuHY5q+tfmxI7uVchWNoeBWp3u1lpMSGX3Pz8NIir5IzSN1vdYpvYNE1yegwQvYkpDGLHdCQ3bwSHlAeeSyqSVZX7El4e6jBvSL2rMTakASPzPDO8rfsrwehqp9/dZCIwLWCj2I2DuSAxo92kMlKAG3N+Db71h4cxrHK1YpWa4UDY2dddA79r4ZstA8yLSx9eR/cAHyoE/ROn2hbOYBN7D+3avs331LMj6SCEtBcrIaAnLKX3AUlGX2NsmyMnDSppE05c2kW45T791wHQO51vV85/V7vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7753.namprd11.prod.outlook.com (2603:10b6:208:421::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.36; Fri, 12 May
 2023 01:31:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6387.022; Fri, 12 May 2023
 01:31:38 +0000
Date: Fri, 12 May 2023 01:31:20 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Properly remove the vma from the
 vm::notifer::rebind_list when destroyed
Message-ID: <ZF2W6A1qHheFeWef@DUT025-TGLU.fm.intel.com>
References: <20230510141932.413348-1-thomas.hellstrom@linux.intel.com>
 <20230510141932.413348-3-thomas.hellstrom@linux.intel.com>
 <ZF0BoLJBupaVg+t4@DUT025-TGLU.fm.intel.com>
 <503087d4-694d-fe7e-17a0-ee5a5ec80011@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <503087d4-694d-fe7e-17a0-ee5a5ec80011@linux.intel.com>
X-ClientProxiedBy: BYAPR07CA0030.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::43) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7753:EE_
X-MS-Office365-Filtering-Correlation-Id: 10b32193-1da0-43e1-af44-08db5288a17b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2CdjOXufMdKsQRu1S7i+TjpLX4++z3naExo+GxlcXE9AuW3JBT8NMSNk1fF0YzYtY5at15D4tNaSq9Ye3taXWjt7okO32XGvtlLiX+5yWETiZh6gi6clU/2ac6J1mQXJb8Tn30jscPohwSmZkqufyS23RzLNyXqQwENX2JWKtnu/U3iP7y+oPdkjhDlrW2GqU8Sut+S7+YCY7UiKRrwwb94jruvEfj65aURSAtZQ6NX0Z4GXIivpoWBNaZDFoBaPw1rGZxCCJD62lZ8U+8qGb4nkYsFNLZeoNPjv8FuJ1sTpCAaKAuGUFpsqbIuKdm4pECCKlafFYZFsh0/BJihOURWKjoYYl9+Nq/I6VLSZG/dJvJFurZPnwE+/Eo7vlmrEpRijxZtv0vyt/b4qG0LmYWNqsD3NPrQuW0cEZEUBSbgCGiapiC3t4kuYn1P4qshxGZfm4TMB8rluE5Qxa00ZD898DB609MQua6Idj3zgt4L1haki7fjZLz4k9glMWCQxvmbWkmdxBCrx10RnEnyjXNNMc1hx/vLwgDLnd6brnXCXRUwkLBiuUA2FWCY9fXmS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(136003)(376002)(366004)(396003)(451199021)(186003)(478600001)(86362001)(6486002)(38100700002)(6666004)(8676002)(5660300002)(44832011)(82960400001)(8936002)(66476007)(66556008)(66946007)(316002)(41300700001)(4326008)(6512007)(6506007)(53546011)(6916009)(26005)(2906002)(66574015)(83380400001)(66899021);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?NA4RGEiNwyqDxUJ8wkG93yQLhLpOPu7mn8QK0v8GR8UnoIOxQ06rzqLkk3?=
 =?iso-8859-1?Q?oEYDTyf8Lyz+k2pfh77ENnKMKSIzuCfz+ehBJVup80rmww06kwfDx7IcRc?=
 =?iso-8859-1?Q?r/cls6e9UKx0Gjp/gbPFmfNR++aSjMQq33dGUckiRNJj78Mz5QqEp8Ewqr?=
 =?iso-8859-1?Q?wlf/aqLAihU+jdWgQ8mtkF72uIlflvnLSnGB6F0krV26Fs0uYMtJuzaHrh?=
 =?iso-8859-1?Q?JChUhHUq+4uoRuiV0Uyepfpyz01qTEQTfa2H2k7WAiOmr/HT9FasvvNqRc?=
 =?iso-8859-1?Q?rnL3dLigXYdJURawj5ZzSnD8ArpkJq+kneYc410D9X6lnjOxaff2k3lB3E?=
 =?iso-8859-1?Q?ss+sjeR4dkOt0/QnUJQ30C87cPGb5RvUsQBHOUDhPWjhYkOMYo1mVnZRdb?=
 =?iso-8859-1?Q?tDprelTzc8I4upXGfEw4ApUGY/MpGXUgj0zYYRlRh4xhb2UrWUR8jXeeSC?=
 =?iso-8859-1?Q?G4xQZWdOW/iNCkzEiqxFmBhAeTTXPHXX8TIm6Vqv6w25GeUTiuWbIrKPoQ?=
 =?iso-8859-1?Q?i3G/QxKhxfP3VYLuCjp/6/DwhGlYAKsU3EHYqdv3/DonfOZ8z1OEJZ33EM?=
 =?iso-8859-1?Q?5MVTWZrzgupweEVfy32KyQlA7veo5MYb1Ks+J2ZaPd3HQ1bRUqPFUQ5Y+B?=
 =?iso-8859-1?Q?Q/hkoXxPrN+oAZStZ4frqMvlwFjwzkJdoWZht9EsXSwjRyfjrQLAXO14W1?=
 =?iso-8859-1?Q?OvttBih8VOEl205gEqgTVhvIz5Pe1JhaAXInbGmlMzDw66rAOVaC0n3+iN?=
 =?iso-8859-1?Q?UlUgxwksjbWQCQBB+QJ3Maxcax0qO+HdgfiqRXlzmfJHCE+XN+ipGzPDYX?=
 =?iso-8859-1?Q?WdCq4Jie+w8ZRWd/Tw68hgtKqDvsQcQXD1yoYANnPyvBV7N6i1aFL2LzS9?=
 =?iso-8859-1?Q?V9nvpMudkzhmK3HfUYwwNOvvHLaJ5IwHDG4H4w0zYeX0BB0LUSupOPG9ev?=
 =?iso-8859-1?Q?1oeQ/Fo0HDVOzhYlomBAvGUwZmdb83BAn9JlczkP/bz6ngZz4WJtep23TX?=
 =?iso-8859-1?Q?Qq+N5EgROvJb4F4D1bL+fQ5aK9LWFJBop/voqrv6QhA32xHPojhsH7Zu+M?=
 =?iso-8859-1?Q?19JAh/ZBEZUt9+S/PCf/yQQQ4gmOPbYQ3bEeansHVsr2B84A3ckDwQsxNZ?=
 =?iso-8859-1?Q?urvbC3NRyyzGlRUPkuNI54HIscwZOEbNKUNhQlfvruOXjytabYCIRLjeTK?=
 =?iso-8859-1?Q?bl7w3UnwEtKKTlnaJj4xEhJ/53Sh4lZ4dp+6Q0dlI82QMgXhA2dtWyS7Wx?=
 =?iso-8859-1?Q?2hP66Fm4DjVYtnO422bIOLxyO8JJYRl9DewCdkviMJZX1UHV6Pobd3uHn+?=
 =?iso-8859-1?Q?1Fumor33Oh9DHLtHPzjpf58pSpwwVOjQL+qfqNFnjsOMk+31swKDhcNyWC?=
 =?iso-8859-1?Q?isMA4Z8QYwOrCaQNpqWnBSYgMoycn3fTqHAuSJ9EGyVRhnGYR3N4kIUMhc?=
 =?iso-8859-1?Q?0ZA4g32B1Chj7daOqQJqrfQ6OehZ9+woeD+SpE4cjrmBdMmjdwN05bWyOR?=
 =?iso-8859-1?Q?nkFqYdXQOAyCF6hHp6FK6DJ/lwQ6jgdCL6w3U+fKelKEPWNFxq+9WXPnZz?=
 =?iso-8859-1?Q?FocYjcxdM90gRakpM4xs7+ypHUaTyXbsOdHj1heuPCbLMdeHSmf4TZvq/+?=
 =?iso-8859-1?Q?W1R2hlKj8/cSedUKlnmTtB1pBzLMBByvSiWXUOHhhlWX7lmjACxTtvEg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10b32193-1da0-43e1-af44-08db5288a17b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 01:31:38.4216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hlEJgvXNwAoWZjKAARrQR07uG6VWYO6TOalqA7rAUFMyhpNzrmEKOaIcg7WFJBoXNkTjYe5ezorz3VCAK3R0gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7753
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
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 11, 2023 at 05:38:11PM +0200, Thomas Hellström wrote:
> 
> On 5/11/23 16:54, Matthew Brost wrote:
> > On Wed, May 10, 2023 at 04:19:32PM +0200, Thomas Hellström wrote:
> > > If a vma was destroyed with the bo evicted, it might happen that we forget
> > > to remove it from the notifer::rebind_list. Fix to make sure that really
> > > happens.
> > > 
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_vm.c | 9 +++++++++
> > >   1 file changed, 9 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index 5f93d78c2e58..f54b3b7566c9 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -978,6 +978,15 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
> > >   	} else {
> > >   		xe_bo_assert_held(vma->bo);
> > >   		list_del(&vma->bo_link);
> > > +		/*
> > > +		 * TODO: We can do an advisory check for list link empty here,
> > > +		 * if this lock becomes too costly. Nobody can re-add to the
> > > +		 * bo to the vm::notifier::rebind_list at this point since we
> > > +		 * have the bo lock.
> > > +		 */
> > IMO grab isn't a big deal, not sure this is worth such a lengthly comment.
> 
> Ok, I'll remove it.
> 
> 
> > 
> > > +		 spin_lock(&vm->notifier.list_lock);
> > > +		 list_del(&vma->notifier.rebind_link);
> > Can you safe call list_del on an empty list? I thought that call blows
> > up hence we have a bunch of if (!list_empty()) checks before calling
> > list_del all over the driver.
> 
> Good question. Looking at the implementation it definitely looks possible,
> and I have LIST_DEBUG turned on when testing, so I assume it would have
> blown up otherwise.
> 

It looks like 2 deletes will blow up but delete on a empty list is fine.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> /Thomas
> 
> 
> > 
> > Matt
> > 
> > > +		 spin_unlock(&vm->notifier.list_lock);
> > >   		if (!vma->bo->vm)
> > >   			vm_remove_extobj(vma);
> > >   	}
> > > -- 
> > > 2.39.2
> > > 
