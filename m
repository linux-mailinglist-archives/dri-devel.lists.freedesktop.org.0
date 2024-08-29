Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19846964AE5
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 18:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79EA310E722;
	Thu, 29 Aug 2024 16:01:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lsnsO3hL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2792810E722;
 Thu, 29 Aug 2024 16:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724947260; x=1756483260;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hECB7ph/NpWvFgZUZa0/R9vn++PTECM0q5f2P+54z0g=;
 b=lsnsO3hLbLo0pYJnF+mUu3knxCF3F6MQD8u3fbB0oPlAcMek03vI+Sgu
 bgbphbiJ5H+cRQ3rzBtVy1fGpNP7+48Jq/af+UQtpXjT/V+SDvt80NP8L
 d5rB8ViXxwd5XVnBOC7odlJxGyLI3aoSgYghCSHpxFq5JFf8RcdYLP7Su
 IW59RBkp7wiEd82Qx8vLBlCMBlP2nOhQNsO0YddRu7SiY/bZxi5gwh1zC
 tvcVX5iN+nuqcj9XMsL5fVKFLeNip+PFH2Egp3G1wCF+qi+ncgRjQ7iBa
 Bs0KNMfDlaljp37hPR+5CGX5XvnY0jYkSnvNBbUtZyy+avlKgAGeJi7/9 A==;
X-CSE-ConnectionGUID: 1fTIOBuORhG3ynIqcQahiA==
X-CSE-MsgGUID: SDJra6sgTr66Ejpfp05oeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23716191"
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="23716191"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 09:00:56 -0700
X-CSE-ConnectionGUID: sXP4XcamSFOmRgA/JEETRg==
X-CSE-MsgGUID: J+LvPGEoQ5C98Tamcc3Gag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="64335546"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Aug 2024 09:00:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 29 Aug 2024 09:00:51 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 29 Aug 2024 09:00:51 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 29 Aug 2024 09:00:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jKyJ2KKjJ6Vvqv+lPhKsJks4w0z39yaXX8o4JLyAMe2bDJUHi7ldKUSrhhwYMNXKW8JhxBkqNJ5BZehNk+kOvmFgB+0luOc3O5j/tFJOJVt1zJdaLAMn7Yq4GREl2ZuEZv3xsv6G7d31Aahwxij0lKMVjAmBS0qdymE2fEBKvTdoc09BWHIGUi8ESnjyguSji9vaqpBclSZWuIYoGbyyTQd63CujdV6YbGam9WnPjgsIP1Zo0ZkwNWS2W/FRdpsvjYQ+e9lGox3gYCxhHfpi7zS3ZgdHLITFFkQsqjxsRtiE3yAsB/1Li47vJak2IaCPVK16uvLB8ejYO/gTn05tRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2uw89Z4PKsJjc9PugcRSTw78BGsBVqe3szxHo49y+sw=;
 b=Ufh5t1oTSQqXEiItjQ6GvlG8bZx1yeC1ibMphxZha4DWWc+4seb9d5yjHIIAKrQO6MZl6FVWizFs0Qy6ix7oHUq62vJ9CTrdKDY3SNWbv/C8fvjezpbH/L7Lh2tRarDAj8eLmrYnnFGSQHeR6SbeAoWlDYWG5RYiI2eogG5E61KifUJtciGvj/3qIWCR/Mw5lGytHWzPmUxlOBOlyhgml9noEupb2CvzC9n/j81DZDyBYwRqE18jdhQcgHwjxlQgzMzOurNEbbgzTYqIA0GAaRb4+vfIezGdwUTcqGILleN5uu14TSaXqJCTOQNI39eJzAK9afBZvtA1O/rJ2/J+MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8364.namprd11.prod.outlook.com (2603:10b6:610:174::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 15:59:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Thu, 29 Aug 2024
 15:59:57 +0000
Date: Thu, 29 Aug 2024 15:58:30 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <christian.koenig@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <matthew.auld@intel.com>,
 <daniel@ffwll.ch>
Subject: Re: [RFC PATCH 04/28] mm/migrate: Add migrate_device_vma_range
Message-ID: <ZtCapoL2Dsn6JaIC@DUT025-TGLU.fm.intel.com>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-5-matthew.brost@intel.com>
 <ZtA5YVIpmzIUHWc_@phenom.ffwll.local>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZtA5YVIpmzIUHWc_@phenom.ffwll.local>
X-ClientProxiedBy: BYAPR06CA0070.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::47) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8364:EE_
X-MS-Office365-Filtering-Correlation-Id: c58bc37a-020b-4bc8-9a9c-08dcc843a12a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JnZYc6s8xAjXMTN9m5GCRIag4Q4LzowY95ESFT+1sA56leXojCMk3ZJcoHKc?=
 =?us-ascii?Q?qdVInmcIiNTJot+R1ua3pY910vFKFqpO33dEBAX1TTNepnVJFoD8MzTIXZ0y?=
 =?us-ascii?Q?r1oOuRuHgvgrWR66QwYkU50htnKKo/4rQs7k+lbSAgnEnNJZYKmMtfenD6XV?=
 =?us-ascii?Q?6Lar6rE42H1j2OsV6s94nfOtIVyOQQnya7IBiuYK2oJ2g4mgppjFSlDY47Jr?=
 =?us-ascii?Q?Vk+RLq7xYAlpDDe6ObaRyN8o841j4kCyQdFA4Wx7OyT8VgqJLrQ4Tdug0xLe?=
 =?us-ascii?Q?lyjnzliet+4qSZnAnvgl0C75HeU7/bk7FugAzOv+/OfBoqbGS/IvuGLovzKD?=
 =?us-ascii?Q?uo9Vm41UJfPmF5Mn789EGVnckaWsBp3RC8ApVC74/vJeeUFhz/6iwuU1SX+f?=
 =?us-ascii?Q?zQSpLW/L56tiwROKSMRbCGSq6JlTw2xXeOR+PBVAU3HwXPkWreiJIG2fgRTt?=
 =?us-ascii?Q?70n7h3FjhVHOTriuvXpuWbFPcguaRm/gXNRqem7aPwIeB8kx7WAbwiHLHYd8?=
 =?us-ascii?Q?m7uZY7wfHnlKOEUGmsc7Fec3SZL4yHBbKljyJzeoUN+cxYvZn8AQPc9V9YzG?=
 =?us-ascii?Q?xFnhnPr4TdwhAzV2OPbkgruB2gJhEIR/PUlhb924GuJFlL5ECn7yIXSwY8yl?=
 =?us-ascii?Q?pJ5Oc4OevQ5CUuEHeZ7kL8rUhyy2sPvFLuSWL1l3ebrcT7xzowJWOmpHOxth?=
 =?us-ascii?Q?1G4l73fX8snA/xYnEUiPiH//4pKTMeTK97RscvfoR6wVlRJ5QUtQPVihrvCm?=
 =?us-ascii?Q?k1zLqvOe7HwVSgFb3YyJ+auw0mGdLzblqNkzQEnVea7B13kGRNu32sRQP24B?=
 =?us-ascii?Q?LAA/H7zSy9puOx8IfO9bxVO/gvpi1JspBnHIRTle5ih5tmX/bQggQKKzC2GJ?=
 =?us-ascii?Q?excG64Zk9RcrdGopPFul13eS75aAuxGry9fLxOGznpiQr+OqT0xEx6TvljEb?=
 =?us-ascii?Q?5U99Um9vzaI46l42UFJ74M7l17tw7Qe2w09x8Em0SbJs0LtalFJXD/lavSim?=
 =?us-ascii?Q?h6++ul0wNMqapWW6iwM7I5d/sS3a7vFe78quM44fJ3NkyoFVFgdp99kPNMVE?=
 =?us-ascii?Q?xkh0Ytl3qRYGlz9w4o4y4V62oI8gmzsvwMLkm2KK6QmaHDgmwJdPuakm0Pln?=
 =?us-ascii?Q?rCAaXd1f58/ES/kUfowVym17wrC1Lv1UXWpylmbPvDjuHn5Ar9aJEuGqmlcn?=
 =?us-ascii?Q?WG5JDstWWd4ipJLquVDjLHou/C2t2lsGf8C3WfXXc05NS04bnL0t7fO6CAcb?=
 =?us-ascii?Q?Hg2V9fgPvd76W6znUZ0YZJIdxiLUC34+4GSMVqkAinbdR9THFe3wdaXDb9sq?=
 =?us-ascii?Q?Eac=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4BxPj83zlboiDgXJNilp59saaJnAx/D0OUp8IRJh65pwyL46hF/xtiU5qeyO?=
 =?us-ascii?Q?Rj3npKsB+KnWjYafgMuUIAWbi3L7ncJuAKBLetFnSK3PRk8Umxs0KnSbignl?=
 =?us-ascii?Q?hZfLfmV0Buh4tFStoN+gm6rDN+ez6FJkEwCY0zho1P9RqruCG5V0ZwMdDZFJ?=
 =?us-ascii?Q?Jpt7+Q3/IP5G9foH+CAcIBrocYOgTBRFRjX38GGtBrzqYxoJ8Ofst6fXmS+Z?=
 =?us-ascii?Q?pyS/ifJ/C3RPErlCcUWG+P7RhPYCu5yLPvlRv4bFkt3uC+Y1KS+H3OiQ2dOL?=
 =?us-ascii?Q?XqtGXAGfQjICx/x4sMykzvZiVSG41n3mYSGGb8aM9+PxRsq3LpYbYqmqXtxg?=
 =?us-ascii?Q?UduYAzvs7k9a/5XNXbFV9RZxp82A3y1k3vngV3gwM3+xE3Gr1NcFvGdYVfhM?=
 =?us-ascii?Q?plrVjwZDZcM0Je7qu0XJM19vrc6rAw94cnRhuJM60MFEqF/FLe+yE17PL40Q?=
 =?us-ascii?Q?rCbbifp8JNovlOWJ1xkqUZolvSqNm6GzjhBf0fa/KH2RPn1TyllfRABWjqOm?=
 =?us-ascii?Q?xHxTnhLwOsbpMKfXhS3A00yqHX03iyVJM56lZqbhITSyQs3tUr2JLrMYTSOX?=
 =?us-ascii?Q?adehrfRh1iaqTWaVS7clMtUhz0lGXkRlUwydoXswHVKJzHSe1Syllcaurzn6?=
 =?us-ascii?Q?0nAO+33Zo5eKsB0oosRAwqJNsa/e8/pSZ7NnXuU5M4dZz0NxAwLD3bkdeHWq?=
 =?us-ascii?Q?gHm+Y2tGkKI2eDxyAm1Tf976og3ygEgCVkWagMHo8tdCzK4/pnQVgAprPo8e?=
 =?us-ascii?Q?BPF9801faa647qNLSh6bQY/mR4BwdSrnwLnt3wnH7MnQMKRN2wrnWvhLqR+I?=
 =?us-ascii?Q?91Xx2qCQTPQd5vCeB3Aum3AWNKR+QcuOOOPdZqfBlXGZyLn0Wf9F4no09o2z?=
 =?us-ascii?Q?3k6tZwFKFxIEKkvW/NMG/z4Aa1u6yNZfAbolG54hq1NnI2Ye7Ni6T2j8Q1d8?=
 =?us-ascii?Q?As+f7aVPjk70g3mVMQI2Ow5htAOmp+qLQ+qGUbSVn2/ymSNKjONX8fMhhoZJ?=
 =?us-ascii?Q?yXphPVsrlDsJ0d+oAuT2ztfBOpTFKvt3mtiSrGCbfyfFnwUiD4glGOHv2aW7?=
 =?us-ascii?Q?TJ0MjOQtQPkMgURNZ/RrXeizP46Kwo5PmskaxiXx6RHIWRQDpvyyGEBBNcXv?=
 =?us-ascii?Q?5+U72cbR2dcYwjyZhjCoJGwVEbS+vW9uRHYMH63L2ioNrn2TgJ4so9kmOydX?=
 =?us-ascii?Q?T6cNvFYi9rxI9GH9wbTkrIv9dWFqBkBUuuv8lyxFhGS20B1qJLEFXLpmLGJK?=
 =?us-ascii?Q?1EJIruYJxo6uu01wW0FeCFggYkZZ4PCtq95ycJW7TMu3NVtsUVhxePlYEqYn?=
 =?us-ascii?Q?m4xZSjVrYEZUKLg2ThWW9FLZqQQuW3QXP3HzQv53pPSbWd/ImZ/9BfaX1qcs?=
 =?us-ascii?Q?Ir5U9KSljEmdVcPnR2pa35rPkIB5IjAo2bnoQTtT99cM5pRX/YJUepMdEQLQ?=
 =?us-ascii?Q?FZuh5FknlS1HH6OMB9yUm1TvtIR44rBWcdv4zieFqfC6fIPzisu+Kre6C8l+?=
 =?us-ascii?Q?DMR6rtn6n2Axf+xsfFeg/UYIqmDIyyZo/44RFqtf9lEN3sii5nxMb9RLeSPL?=
 =?us-ascii?Q?mQVpYGz9T1SE11PDGv7wwtxo4fK2+dMvpRmrl+kapsYd99FF9f/lkFNv3KVL?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c58bc37a-020b-4bc8-9a9c-08dcc843a12a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 15:59:57.3177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cLod3R/iFG9mG6zFpiGvpJA/oUV3OFU2hjzKmg4+o25eXr0/Hu4QA3wqpmUdmSQdxsN8izxCjA0nDxGEyJWMqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8364
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 29, 2024 at 11:03:29AM +0200, Daniel Vetter wrote:
> On Tue, Aug 27, 2024 at 07:48:37PM -0700, Matthew Brost wrote:
> > Add migrate_device_vma_range which prepares an array of pre-populated
> > device pages for migration and issues a MMU invalidation.
> > 
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  include/linux/migrate.h |  3 +++
> >  mm/migrate_device.c     | 53 +++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 56 insertions(+)
> > 
> > diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> > index 644be30b69c8..e8cce05bf9c2 100644
> > --- a/include/linux/migrate.h
> > +++ b/include/linux/migrate.h
> > @@ -226,6 +226,9 @@ void migrate_vma_pages(struct migrate_vma *migrate);
> >  void migrate_vma_finalize(struct migrate_vma *migrate);
> >  int migrate_device_range(unsigned long *src_pfns, unsigned long start,
> >  			unsigned long npages);
> > +int migrate_device_vma_range(struct mm_struct *mm, void *pgmap_owner,
> > +			     unsigned long *src_pfns, unsigned long npages,
> > +			     unsigned long start);
> >  void migrate_device_pages(unsigned long *src_pfns, unsigned long *dst_pfns,
> >  			unsigned long npages);
> >  void migrate_device_finalize(unsigned long *src_pfns,
> > diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> > index 6d66dc1c6ffa..e25f12a132e8 100644
> > --- a/mm/migrate_device.c
> > +++ b/mm/migrate_device.c
> > @@ -920,6 +920,59 @@ int migrate_device_range(unsigned long *src_pfns, unsigned long start,
> >  }
> >  EXPORT_SYMBOL(migrate_device_range);
> >  
> > +/**
> > + * migrate_device_vma_range() - migrate device private pfns to normal memory and
> > + * trigger MMU invalidation.
> > + * @mm: struct mm of device pages.
> > + * @src_pfns: pre-popluated array of source device private pfns to migrate.
> > + * @pgmap_owner: page group map owner of device pages.
> > + * @npages: number of pages to migrate.
> > + * @start: VMA start of device pages.
> > + *
> > + * Similar to migrate_device_range() but supports non-contiguous pre-popluated
> > + * array of device pages to migrate. Also triggers MMU invalidation. Useful in
> > + * device memory eviction paths where lock is held protecting the device pages
> > + * but where the mmap lock cannot be taken to due to a locking inversion (e.g.
> > + * DRM drivers). Since the mmap lock is not required to be held, the MMU
> > + * invalidation can race with with VMA start being repurposed, worst case this
> > + * would result in an unecessary invalidation.
> > + */
> > +int migrate_device_vma_range(struct mm_struct *mm, void *pgmap_owner,
> > +			     unsigned long *src_pfns, unsigned long npages,
> > +			     unsigned long start)
> > +{
> > +	struct mmu_notifier_range range;
> > +	unsigned long i;
> > +
> > +	mmu_notifier_range_init_owner(&range, MMU_NOTIFY_MIGRATE, 0,
> > +				      mm, start, start + npages * PAGE_SIZE,
> > +				      pgmap_owner);
> > +	mmu_notifier_invalidate_range_start(&range);
> 
> This isn't needed, try_to_migrate called from migrate_device_unmap already
> has a notifier, if there's actually any ptes to clear. If you need this
> one you've missed a pte clear notification somewhere, or there's some
> other bad bug somewhere.

Thanks for the tip, let me pull this out and confirm that we get a
notifier from try_to_migrate when this function is called. Agree if we
do get a notifier, this is not needed.

Matt 

> -Sima
> 
> > +
> > +	for (i = 0; i < npages; i++) {
> > +		struct page *page = pfn_to_page(src_pfns[i]);
> > +
> > +		if (!get_page_unless_zero(page)) {
> > +			src_pfns[i] = 0;
> > +			continue;
> > +		}
> > +
> > +		if (!trylock_page(page)) {
> > +			src_pfns[i] = 0;
> > +			put_page(page);
> > +			continue;
> > +		}
> > +
> > +		src_pfns[i] = migrate_pfn(src_pfns[i]) | MIGRATE_PFN_MIGRATE;
> > +	}
> > +
> > +	migrate_device_unmap(src_pfns, npages, NULL);
> > +	mmu_notifier_invalidate_range_end(&range);
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(migrate_device_vma_range);
> > +
> >  /*
> >   * Migrate a device coherent page back to normal memory. The caller should have
> >   * a reference on page which will be copied to the new page if migration is
> > -- 
> > 2.34.1
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
