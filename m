Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E076D15D3
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 05:07:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6061E10E302;
	Fri, 31 Mar 2023 03:07:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8893010E302;
 Fri, 31 Mar 2023 03:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680232047; x=1711768047;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1CKR/bJlbCg1GjHuxceiR/Xoel3424mJjM4OToWBZzk=;
 b=QtOMpBeU+rQ1vwaZBCPanHdEAZbipqVtah36jLAFrY4JSR0WAgfv15vc
 OK1KeNVMi9dEbBEvaTN5iJh5k0MbiOZIY9iaxNDGwX88YwlCShvzUmWIL
 1FO4UYqEICl7eJRh0KgLfCAc8L6B5gV730kY6yh89VOwq175b4iauR0EH
 Jgw+zPlCZ9P2pPGLWcdiJe8XI2yp8jlA2VCsfXVeIpvceNqD7NR7dDZp4
 ubOzJjhALPU7b0SRREg5QeYHTEZaJ1N1OPLQXNxLZJhNmawYN+15prUJn
 2tbkHcfammLeNdaQZ5wJ8dK4oyRweclSKLxLIxLmUjjONRsTsjFCTzIWU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="325300454"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; d="scan'208";a="325300454"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 20:07:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="662276288"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; d="scan'208";a="662276288"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP; 30 Mar 2023 20:07:26 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 30 Mar 2023 20:07:26 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 30 Mar 2023 20:07:25 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 30 Mar 2023 20:07:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k8lQac3HrZo4ug9XsI6ePOUWtRTYJcLuqUQ0Uhj42MlGr0j6wvcUhJPMNaplIdfwRsQ1uUX7U6HuFVS1Pt5yxfsK41tQQgtkUtxg1CDLSbbP2dZBxfzNR3vpyzGTlW8X0CwVVCy5XraXI3k7FSCfukvWx60KUpdvhg0RflL1l0VOdRSPLJe7A+qXOw+wQYV1aKaus0BaH3venw8zzSEGV/Bg5J1HP2/QYnXB4yDFCrWziNchOuqzTZYeR+CYgWh+arxfx9hrV/hpRDz6uYZ0XgwBGlf5B+6iwK+yfJMiK4QwXGKecoy58v7qRJG6zCqsrLPqJy7dXaK3NmbMf3eQfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xobhv6dmC4MgNlxh5UmrASkebr40Wypb2N3zORwuxDc=;
 b=fEvIsnNJBVwi94cLGw4s2eI1QeGspojxEGsRCUOg784f8tsktld0zjIeETWDc7NKx10VhowMsT3+WeniHUsZzzOYzf7GsW7OUB2jW9xKlHfZju/TSf7DqTfMkVs1zeE9Uk+lSEdyPti1iApdCF/gJyepjWCVLP0Asq+9wOgBk4mSmALuMPTMAba7XZAx1QfzG+U5aIAlBRJlYjfhnaoINXwZlJ5xVzanRY5CoQHxX8xNFFRaCrZ0FBbXcq5hLbVOQMph59vlCnbxLhZQsqqpajt0J2l18zX0jKxFTPz+MvKHL8ZrL/rnyKoC893au026AWhVB32wTRdc2p2w1ouoSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 by IA0PR11MB8303.namprd11.prod.outlook.com (2603:10b6:208:487::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Fri, 31 Mar
 2023 03:07:21 +0000
Received: from SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::c5b2:6996:5aee:91db]) by SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::c5b2:6996:5aee:91db%5]) with mapi id 15.20.6222.033; Fri, 31 Mar 2023
 03:07:21 +0000
Date: Thu, 30 Mar 2023 20:07:16 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Zhao Liu <zhao1.liu@linux.intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Matthew Auld
 <matthew.auld@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Chris Wilson
 <chris@chris-wilson.co.uk>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 5/9] drm/i915: Use kmap_local_page() in
 gem/selftests/i915_gem_coherency.c
Message-ID: <64264e64af269_375f7e2948f@iweiny-mobl.notmuch>
References: <20230329073220.3982460-1-zhao1.liu@linux.intel.com>
 <20230329073220.3982460-6-zhao1.liu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230329073220.3982460-6-zhao1.liu@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0240.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::35) To SA1PR11MB6733.namprd11.prod.outlook.com
 (2603:10b6:806:25c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6733:EE_|IA0PR11MB8303:EE_
X-MS-Office365-Filtering-Correlation-Id: 95898138-89f1-4400-7358-08db31950b62
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ACiQHRyAlDtnSak+Bbw/7xg5HAvA3EhefOPf1xu1yVA4uIH4XS9ZfmL7MfbJzUQ3gVxooY0ui092j1HNcTktETTc5XB7vuKLZ4HBZ6mA+fehodguvtfHTYPQ4jq8S6gRo3SlYAZvjwhDOT6qs7KKyFVtGPt2yr2bkS3WWh7NNzm8hmTguAli1x3B6wAEDgo8gbLpoj6sz1e4YXK1VVsO9/DlRA7FpLPHdhCKQeRrH1YeXb2F9Oso6wSS2e+dAuDVHQpipTuPVHAzNivOsjJ1r4WwdCWeDufS96QURnIGvLZ+HMqaT/uvLdY+lkAkRPRt5eT2okoVa/Ln1ZkoWwaCyE31nYaKR1ZH5tiD1bvnVqSSr9RiFfLNTD1cYBx/0if4WSf1CwmhyYstCmgMjrTWkrEu35gh8HOD1YTQsFgg2SYupcTsCU3RH8sKZTH2rY9/Q1QsyS1I3jF4r4WTW42k0ZGr5eijqwk8K5bnwjX8peKaFue844d0MvvsoxkXbjfoBDc8h0yoXLlKLbRKfel5EmdNpr31Ur0iO7BXbHNmjH8aPQKLqq3yF20meqUdzTSKlUHW7t+5IkWn5dLXb/EkxZCXFumOIyTUX/36CUeJwDY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(346002)(136003)(396003)(366004)(451199021)(921005)(26005)(6666004)(66476007)(82960400001)(966005)(6486002)(38100700002)(5660300002)(9686003)(186003)(8936002)(44832011)(2906002)(6506007)(86362001)(316002)(54906003)(110136005)(41300700001)(7416002)(478600001)(8676002)(4326008)(6512007)(66946007)(66556008)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lDl0M1m1FSm+fMTFzBcgHiS9zvYbJ0ByXTidA5I0Lvp/a0VyAwwe7Npj51ez?=
 =?us-ascii?Q?fAFWEAg14HlawrdOtBtDxZQeFAvZpsfXk3SMXqjDbcG3Xco5pVPczGKOuIC+?=
 =?us-ascii?Q?aT0RIhsa3kyg8baFgEnKClx6+cW7alSq34ehZ5prvqlNAZNuFuvmQHM5lKpf?=
 =?us-ascii?Q?xkeZlSq6nWxXFrqVpTN2gxDFy7eaM9MogG1EcZU/pXmuN4ejsPDka5ZMOZBA?=
 =?us-ascii?Q?lHNlJA1/KlPAom6JE4SYIuVCkCd0waJBYyMfxL/7fkLGF+jBdtNNrrhLy7RC?=
 =?us-ascii?Q?JZxEOBrwJe+xiRjKLKED3DGuL/MTtNmr/9vOnrMAnMM5ZS8MUvvJy/RJp+fq?=
 =?us-ascii?Q?kdVOo5PtANfF22I4TiD6cloTeib3MVeNqjJs69xpIfoHX0gUNMN+XleuN9dI?=
 =?us-ascii?Q?b+F+zc9lA1mMYwRKeTLK2boljQpwEAfHCuXTRyHtScUBrEijwdOUFFSmC0SJ?=
 =?us-ascii?Q?x0Ynk90Mj9bPOMR1AjSxFXsU30SAN0H9Ud1BOLXFzvQp06x2SQjhF1LWIKEG?=
 =?us-ascii?Q?qnlnJaYf9AVhOo8VxrqCMVYJC951gAmhLjdlrJrLQ3xiojyaSWqw421x5nzV?=
 =?us-ascii?Q?dx+EcXs3FH39IjtUQRxe8/YHkmjpdW1fK6cAMRVw0j6kZCg7yTzJLILAHXaH?=
 =?us-ascii?Q?U+6lig6yW80rgUW7mL0grP3ToKu3Vs4Jkg6oMGwlgmsbLAUel5UxmnSC3/76?=
 =?us-ascii?Q?jKn8h4KE9d4Hv8dwLuZVx8Wtrph2IqEDaMKGGIrZ3sbLy7nEu9p2vDgRRQ6T?=
 =?us-ascii?Q?7H37W3pxIGjoPmk1Xuu0jQZXfH+uBoEHE4oESJ/sJTCbR2M3415ztWO9Sd6O?=
 =?us-ascii?Q?BeVboGZHU3WJ7NsOje4X9QcHjNHi3wGsn8UGe+uK3aZPe4OMIbvmz2CUmDlk?=
 =?us-ascii?Q?4hvuSx2r78xB8HVJIDWt9rnBi7lQ8qi4QVbugULT0l3sXa9v0rYquiV+QY1V?=
 =?us-ascii?Q?l6GQswVO0ION1ZTqV2hvrZJGIa2/uPW/G+6VAULD6pPCKQGw+iqih8BjFI2u?=
 =?us-ascii?Q?tXdmaI5jFr/yYcirquOFPjg5s0cuDZNHTmWgQjuEKXf/N2sXdY0cdEopeKpR?=
 =?us-ascii?Q?fFTezVY0Du4Gv7HvhZcqGbRXkHGRete9IrW4afK0f6mL2XUA+IBoQ2k5SWbc?=
 =?us-ascii?Q?CRw1mhEngX5VHTHLhpBRv+GAMh48Znja1x4AEDE0K+QE4vF34l/yaK+LJVe3?=
 =?us-ascii?Q?1Vo0YiBHVxJhJR8xuAksyv9iLIkYpul0ys8Qi+MI1m3tFH1CPDzymq6+SCOy?=
 =?us-ascii?Q?i8GESiVn6c+zHad38yBjA+FHiUIak+Gh5qiQRGi9nrSAjXRktbOEdVa9AGjG?=
 =?us-ascii?Q?IibenujZqk5WAZMLFZvvUqMbNHOobGTo/eGzGKqVDENkGUg4tpH9IQt8aSaI?=
 =?us-ascii?Q?ofrjML+V2OUcnLqgUrBMBJXH5XRnlK8RikEynH7I+KTLBxYhx2Dpy/5Ktyx6?=
 =?us-ascii?Q?W75c8nrtoArp1hLwBy/yG2FYkkU2BfdTTyWyiKFc9w5ElWKw7WQw6zSwaPTL?=
 =?us-ascii?Q?WzlCE84Grg5vLQjFnV0f0GTv/ePYLbxgQJYYEhlDBSlduQ0xfIcZpTttPpF0?=
 =?us-ascii?Q?Z3RqR7PTGhJMIkn06T6YX9wCwSnmOQXo9vE3FaSU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 95898138-89f1-4400-7358-08db31950b62
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 03:07:21.5891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3EnY8701u30lcv8V+GcjP9lFH67jYkoWVjGQ7wOTtyVeeAi51GkzG9zXT8nrm/tHzCGL1iE5U91ydQXfh3i5PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8303
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
Cc: "Fabio M . De Francesco" <fmdefrancesco@gmail.com>,
 Ira Weiny <ira.weiny@intel.com>, Zhao Liu <zhao1.liu@intel.com>,
 Zhenyu Wang <zhenyu.z.wang@intel.com>, Dave Hansen <dave.hansen@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Zhao Liu wrote:
> From: Zhao Liu <zhao1.liu@intel.com>
> 
> The use of kmap_atomic() is being deprecated in favor of
> kmap_local_page()[1], and this patch converts the call from
> kmap_atomic() to kmap_local_page().
> 
> The main difference between atomic and local mappings is that local
> mappings doesn't disable page faults or preemption (the preemption is
> disabled for !PREEMPT_RT case, otherwise it only disables migration)..
> 
> With kmap_local_page(), we can avoid the often unwanted side effect of
> unnecessary page faults or preemption disables.
> 
> In drm/i915/gem/selftests/i915_gem_coherency.c, functions cpu_set()
> and cpu_get() mainly uses mapping to flush cache and assign the value.
> There're 2 reasons why cpu_set() and cpu_get() don't need to disable
> pagefaults and preemption for mapping:
> 
> 1. The flush operation is safe. cpu_set() and cpu_get() call
> drm_clflush_virt_range() to use CLFLUSHOPT or WBINVD to flush. Since
> CLFLUSHOPT is global on x86 and WBINVD is called on each cpu in
> drm_clflush_virt_range(), the flush operation is global.
> 
> 2. Any context switch caused by preemption or page faults (page fault
> may cause sleep) doesn't affect the validity of local mapping.
> 
> Therefore, cpu_set() and cpu_get() are functions where the use of
> kmap_local_page() in place of kmap_atomic() is correctly suited.
> 
> Convert the calls of kmap_atomic() / kunmap_atomic() to
> kmap_local_page() / kunmap_local().
> 
> [1]: https://lore.kernel.org/all/20220813220034.806698-1-ira.weiny@intel.com
> 
> v2:
> * Dropped hot plug related description since it has nothing to do with
>   kmap_local_page().
> * No code change since v1, and added description of the motivation of
>   using kmap_local_page().
> 
> Suggested-by: Dave Hansen <dave.hansen@intel.com>
> Suggested-by: Ira Weiny <ira.weiny@intel.com>

Reviewed-by: Ira Weiny <ira.weiny@intel.com>
