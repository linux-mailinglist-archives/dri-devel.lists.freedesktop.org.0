Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F40694241B
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 03:16:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B5E10E230;
	Wed, 31 Jul 2024 01:16:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y8h8/B2D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1755810E050;
 Wed, 31 Jul 2024 01:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722388588; x=1753924588;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RfvN5KAeGRLGBDRS48mEogmzoaaZP4lpZKtFUbQ5RQA=;
 b=Y8h8/B2DY55ZmDD1v65wZ04C96f35vj69emTn2/iEh/ENJWtT5/2LHOo
 KD3pR4yyAQ2tfH+9tEMDYYy28v2ygvbXrzsILIIuIH6wR1ctfhNOeskla
 R7xyUDMM3nksqUO4OoqvZxzVEcNLSaxGNG5gODnqK6HjjZG8LJ2xoaE8K
 KC95f4QuT0mizGRhQLnSla735EDnFFsadwhCEWLQcjwiwRya2qcevqf9O
 NYxvL3GHQwkorCk+D+4jDzJOfhkc+PMR8h9BQBGOyYcEIVyeNJ/AIKErw
 ceB4VsWhDyj22B6JSOvEVy4r+eGZGyhEdR93m3ShjbCuEZNne+1MIrH/e w==;
X-CSE-ConnectionGUID: SUoAU2IGS1aHViY5DDzv2g==
X-CSE-MsgGUID: QDPD2YM0RlmDV/E8CUNZEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="30868672"
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; d="scan'208";a="30868672"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 18:16:28 -0700
X-CSE-ConnectionGUID: q3Ovl/kdR8ybXVNg4fjj4A==
X-CSE-MsgGUID: DUZjfFy5T6iUrFDpVgsc5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; d="scan'208";a="85162003"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jul 2024 18:16:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 30 Jul 2024 18:16:26 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 30 Jul 2024 18:16:25 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 30 Jul 2024 18:16:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bSVt/ejWgj/n4rRwkZfszZgJuXY3xEgnkJ9E0igxlmJlxMlnHywB/CrFSkhkU2fJGSF/H3M199a5wjGQkNTw+8uGYMLCNNs5xG34ymQm/e1dO8Px39TFAEs79uihjtYiivrnE/EpOPKlWjB9t0Ny1m+tuztFIfoFZIzB3M5m0oDI/+0eCzlvJasNG38rUx8MM/b3VhDaUe9Xl+6UJIHB5jUMu/DLaKZb9fN0VFFRqhbxdyz+1X2LO/B+YTbizIaZQFkE31Ks27NZq1xFtJRDdrEssDw38wmUIJb1fC6v6gxpusJWoPr6pYNp32U/zqPyX9Pz+5MV8cf6zXXc/9G4AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eiSyG6HEttXJay/9CF56S3mtUF1Gy/qg9WdK4DTFU/s=;
 b=n04nMRIjqM6e7OIkHDTGsdDjoJ0BxX4NyqTxPBvBShNRuIo7cgi9CFXywoyC0A0/25W4SaZYHEbtnDkajQVp+asjZ3aRw0rYZkGb/auc1YhSw8q/A9UKfXG2L+YFcWgfCBwy1rKBjuXfJ8HwkpgXQiAVUHjdhEwGLR/7/KPjqdtoDxZJNJGy2ypUGF2nm+0TPWOmWvT7evLauzso6mHU6PrqRRDOANtRmV32IOfypz2mq3jNo3eEA9nE+M3PAcmSSfaiGCYstG87z6EGl4DdXVgQCdnaWg1nDhwLFcjVHQ9pA4HIp2b/erd8gIaoHmFEV/Om9sRUDPVrCaLWyUybDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4950.namprd11.prod.outlook.com (2603:10b6:510:33::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Wed, 31 Jul
 2024 01:16:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 01:16:23 +0000
Date: Wed, 31 Jul 2024 01:15:30 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tejun Heo <tj@kernel.org>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <jiangshanlai@gmail.com>,
 <christian.koenig@amd.com>, <ltuikov89@gmail.com>, <daniel@ffwll.ch>
Subject: Re: [PATCH v2 3/5] workqueue: Add interface for user-defined
 workqueue lockdep map
Message-ID: <ZqmQMl2yurl1mqL1@DUT025-TGLU.fm.intel.com>
References: <20240731003119.2422940-1-matthew.brost@intel.com>
 <20240731003119.2422940-4-matthew.brost@intel.com>
 <ZqmG_c2tjKNAJWfh@slm.duckdns.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZqmG_c2tjKNAJWfh@slm.duckdns.org>
X-ClientProxiedBy: BYAPR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4950:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a0178a5-5f4d-4e48-5621-08dcb0fe6448
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zXWP+Q6fTGUKlLtfKUXnxAelz068ImPppst9g1wjeMjQ7FbE2+yqgBcfDLlu?=
 =?us-ascii?Q?XQaRVVfCvqKTKJCUmtoXGkQtNzvRmNWd96FkrHEVVmadDWrdu9Rn+5JOljSE?=
 =?us-ascii?Q?buahMkRKks0lAxEsOyWsMw+EFblJYHc2r/QuU3tmuSzIgjy9a736jOlttjMf?=
 =?us-ascii?Q?71gAS0qftuzNyjFJ0Gx0vcaVZxr1jQhjzdpXbCn9PT+ox8jyAilJ8iXY9Y2R?=
 =?us-ascii?Q?Q9EH1AnBurGfL7ETZq4Xy4g/h0FKVPyt3LUorfRCSqo+LI6jDOaeKHiYXvof?=
 =?us-ascii?Q?+vnwES9jCnxnFRbtdOJ63xg/DPvYNHAPLbSlPzWZNzrP6sRniC/5vbIQ8tBd?=
 =?us-ascii?Q?vdxSjxFIFNjw72OWK7e7pIDy8CgfSaUIstqffvnDyb1c+8ytL50AfMKHnFgv?=
 =?us-ascii?Q?zGpSEz+knJfiHKE4Y43O3QCBUGETvsan2f4To/iMKSy21/CRrUB4zDxJnIEu?=
 =?us-ascii?Q?hS5R3KMQh1zMCJaRwvPdkCdHzEdiE316OUJHGkaBb/55UZfpL9CgIgPkhxZu?=
 =?us-ascii?Q?caUUHONoHCC5Nyv0RJ8tmu4rdWLEo1m2W8xkQF8fSzChzspTL1l+dRSIuYAe?=
 =?us-ascii?Q?kHajNJoU2/yWsmrdfPREdFB61NyGXL3QxOazIkBzLnkQD45gQnLkSCJ7ekcZ?=
 =?us-ascii?Q?qAW6IllAwQMzjLu50zXZ5YlfpXdCPBuMa2WUO7Qb365WDBVZ6PXr/h3wdLhA?=
 =?us-ascii?Q?BJXvqW3Jr45Z230BvC4yqsTWauHH2DWjaJc+BiXER0QCD5SkG9tI6pnJhaSw?=
 =?us-ascii?Q?nGJIBstjmVzttxjDn2j46rTv9hn0zthLcP9H2f7xxQlZmAsg2OEacrAH4Tn8?=
 =?us-ascii?Q?FKgX7mQvEUQW+0I4IrRdbLJ2ZIZjNTWZmdCG/fq2Jz88BTmtkVqSCOCc2nZe?=
 =?us-ascii?Q?utiu253FJtDMi/b6z1EJbSXqw6jaWHz6juHNJfHe9eKjnSinfNZFEjfBw5uj?=
 =?us-ascii?Q?ObscVkutH8CbRqGy9wvpWGTnbKlk7BiQo47I3v3IDzfKnmR1WbylfqVRq4dy?=
 =?us-ascii?Q?RRVLcR3RL7MDBMPB8HTwLs7rgOnIpCG3ffQQTh47hY9HFjSi/s3GrH9/LfML?=
 =?us-ascii?Q?VYqjnnIuQ9xD332yw6TPV9aZuKPDRs0Xo2MS4m51QFHnNS7TK+B7+dUaO0jx?=
 =?us-ascii?Q?c2IDxpQBZuRFYXg5oyr1Zc7dd//yTTXFQ4RKrjCnvE5Imc4BZ+ThgorE8xNJ?=
 =?us-ascii?Q?DjmK+HpeaLdHW4QuHpDTXMplgyX2wTciulreyi9gRu2KpY832x8bJtztAOG7?=
 =?us-ascii?Q?pOb0LNPNmfYLSoSj0zEnNC111c/xHP7hgolujjWuIZaHGyLiF9bqyS4bNIKz?=
 =?us-ascii?Q?GbteQsFQ3H7OW30HBIe0K7uaic+OrDNcwOlkpt2DlMxIbQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8qMv5B1akYjOk4AzfvhEQ35/+4e5tUxGBE4CWFq1bIns3JnQAMo1cI0Z1TAL?=
 =?us-ascii?Q?wkhW7GYGT6Iy42k9xl5qK1x/ZKsBnm0NJG8YhbB63wZv8JrJ6oK93cwVyVzz?=
 =?us-ascii?Q?GmIfwg7lFGEqRKdzCBwBSqqS3viaC3pyHP7U7ImVeFEFnNqwpCPzbZlz6Xl2?=
 =?us-ascii?Q?xJ7inOxLHADgDKY5qyhCg/a0TG1+fHInkv9Ti0BobY/ax6B5LB8y/VCi/9aO?=
 =?us-ascii?Q?1jJTyeCp1HLMGpBCnUw8qR2mT2G6RGndkWtVII2jDYgr7b3dn5mXiZ8FKuFH?=
 =?us-ascii?Q?3sudKsFrd8sIcigT1MweJDoRo7chQfOFhV7kMl5am5qQpjU/H6/9yHURb4+M?=
 =?us-ascii?Q?moE+a+uajm/fr1EK+kJ4M05Lmh/pFScu0H+DBcyH5aXtmtVn6Kh7hIwnl47Q?=
 =?us-ascii?Q?71/r+1hhk2OmgJlFsEj0bLovmAT1MhFMZCThMYGwARkloZNvY2dR+YECqVT/?=
 =?us-ascii?Q?NDglbvNm8QwQjp8qw4RyJNLDMkPD0iIUAjwUrCbYsZyUNNEsrZog9+9Yp0tE?=
 =?us-ascii?Q?YKleUJ5FLyWk/dAoHQLgKy5xcTgEsfEzJDO+R8e209/5iwUN42507hnN+NQa?=
 =?us-ascii?Q?loIeWwzJKDtRbrMyh17cqr6YI7bjQ+DhWDGaRHZCuxHauKBI3oe7k6vjAWKZ?=
 =?us-ascii?Q?/bl/A28TXkWmxRVosdfVuKn4JsF21ADGrQdEwwssnVWXzjfR01g8AgZdy38d?=
 =?us-ascii?Q?N/oIkuJpB0RxSKoPs+XG6SabNiWhn6L1s0cSV8wbZizrzhkwwo/9FXbQoNu7?=
 =?us-ascii?Q?pLGtV00gdFaU32RZ5ScRY/uzQr9vKx/018auxv+qtF7Y0JnveCbxh/4VYquC?=
 =?us-ascii?Q?tudeBa2RaQ/918dZq1iRHnmbIpBfqItLvgsiaTzEzu9mL/vqsVx2bFvScVD0?=
 =?us-ascii?Q?zeM/m08gVhOJ53EjODlcSBEdJcTlmEoi50JTGbderI6CPFzMAgm60RW3f6Qy?=
 =?us-ascii?Q?Mf+z0FjBmiszlHMkD3x3szwXFCeDCk1g+qa9HPO7SYIbmYKZVnZAT9UDAqns?=
 =?us-ascii?Q?+z8B2npdRr2MjZ1RfnvN7e8cRFzpgK4mV5GkAVlpfWj4zuhmbAlt6N8AI3Nt?=
 =?us-ascii?Q?QncPQ1b/KDevK51XByDwT2/PlUis6xnSbIToDm51QlJMqhoJVJu7xaNn349R?=
 =?us-ascii?Q?pWMh8tRG4D5s+wz+uZdI5TYX+1fbq8dHQ688uuGH/JaonWy/qY477iqQTNlq?=
 =?us-ascii?Q?hgUiGQXFtPHCBdLyua8+xYLu78shXYlMvmZEgx13f67XZ5DUmhosck1hAaP8?=
 =?us-ascii?Q?y/DCHGb6pxn6uhtKwfaTC9MKWQWIKYquwsutIjotGEFEA3vGXgSJe8E0dxOt?=
 =?us-ascii?Q?EDcqMPWAC/Kx5q6Y6RnVSGLOr1iCQFm5oZdqPAUPZJCMFd13n1rV8UhyTO5R?=
 =?us-ascii?Q?5HSzTH+VVHSkanW9EH/lpt7y6eMlU48F7tQjFCFUNAvmrk3HGLtxb4NBHIof?=
 =?us-ascii?Q?FLy+eRJahnW95hoaHKHrrg6qbp/8Lyu+WSITclRFmKW3fIdT69tr7ADqdyun?=
 =?us-ascii?Q?Pa4ZSqcYzqxilNA38rs1xt4yQwsx4GI0ANpMz9dCKDZBhRuhK8fV2I/W+Um+?=
 =?us-ascii?Q?RzXCBQkIlLL9Y0j7Qc4SGicS/69fKWnKKhv0H6hmq327OxyNvIwIZP22DC5+?=
 =?us-ascii?Q?eQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a0178a5-5f4d-4e48-5621-08dcb0fe6448
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 01:16:23.1400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NQaXm9KgGkCBbBzVN7UMoTurvWheqAWk/fhRoLwAff+NRLvRHD9RGAmTAzusYy+LgBWGmLZ9SUKYO0i6NLjDjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4950
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

On Tue, Jul 30, 2024 at 02:36:13PM -1000, Tejun Heo wrote:
> Hello,
> 
> On Tue, Jul 30, 2024 at 05:31:17PM -0700, Matthew Brost wrote:
> > +#define alloc_ordered_workqueue_lockdep_map(fmt, flags, lockdep_map, args...)	\
> > +	alloc_workqueue_lockdep_map(fmt, WQ_UNBOUND | __WQ_ORDERED | (flags), 1, lockdep_map, ##args)
> > +#endif
> 
> alloc_ordered_workqueue() is a macro too but would you mind making this an
> inline function?
> 

Not at all.

> > @@ -4795,11 +4795,17 @@ static void wq_init_lockdep(struct workqueue_struct *wq)
> >  
> >  static void wq_unregister_lockdep(struct workqueue_struct *wq)
> >  {
> > +	if (wq->flags & __WQ_USER_OWNED_LOCKDEP)
> > +		return;
> 
> Do you still need the flag? Can't you test wq->lockdep_map !=
> &wq->__lockdep_map instead?
>

Ah, yes. That is better. Will change.

Matt
 
> Thanks.
> 
> -- 
> tejun
