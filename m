Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B88A6685B1
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 22:43:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0203610E1D0;
	Thu, 12 Jan 2023 21:43:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E9BB10E1D0;
 Thu, 12 Jan 2023 21:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673559785; x=1705095785;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qW6tZrTnrprKEYGcFe9Q/FvTmp8dW3PQyESQc/pozEE=;
 b=M5dtGy9edfUWocnzmf3uyhzfWeMSugnhNNDXPwmCOa25v+4DZXTTtORH
 ye6Z0Gkeu+Z9Wc3Z8R++qoJVtzUkwddsolw4tevW0Wd8JZI3GbsYGmDQA
 g0RrEMPTn7GJqCs/7Olb1QIHPms7gX/1GjQ+KGeSOKgyWA9m1yZHMPaWJ
 L+JXvQn9Crt7eZwRt5zJiVBBjcM7BHN4ZtguYnArgWgZ+yCH4VJjIYO4S
 MwrukzRLbTrlFhV7hEbJXVXNeXEfg9zsV4Y8b+j4C4/Ma8Jls2i1+fVzf
 ZpLOr9taTzurFjdux/7fUG198kl4wnGjqHF277LHHZ5ZA7ndwkhQ/SSaK A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="303532066"
X-IronPort-AV: E=Sophos;i="5.97,212,1669104000"; d="scan'208";a="303532066"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 13:42:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="800385065"
X-IronPort-AV: E=Sophos;i="5.97,212,1669104000"; d="scan'208";a="800385065"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 12 Jan 2023 13:42:57 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 12 Jan 2023 13:42:57 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 12 Jan 2023 13:42:56 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 12 Jan 2023 13:42:56 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 12 Jan 2023 13:42:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gO1KVUPswH9xEVvX1m2NoN7Pq/pwFZg91yYDgDNOou8KhdNQZZF1Hy4HKKPAieClJSdhN3AMYSwKY7WpYvuz24bs2fZmYOllXBuOP3TZXuAv9JOzx5VmlSsCKNH7saVTZ277hNUMA+0yXikwSwSdZmH5pi9UlScuBvGRznF3i8hm26pxn3fBPLpWlN8YZ4sn93bI+xi71hn5i0w6V9YyOKW9ZAp3eWYVkrgyqQ34x268hERkV4wiCZOO1vPcrLYyCnm0YG/lEOgBPdI0H5ig+cpphVkvK6MtrwFGLdKO9oMnpJg9wNghJIc2DFzyR5phZL0E8kVKwDgi3S7uBZEvqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+I0LbzQVTAqlc4XxKbKgS1XznXTq1blQpQfSgdaUsL8=;
 b=kfMv0+NamBeKdVMb1t2WExEiZzc4jvB3i85TUog1MPHGA9Gqcnkx5oG9B1vxcwBFCO61D7R8EG/GdIZrEiBiukwHmj5gEDpnrptwwXUogRadb0AKafMnoh3go6/wQFE+k2sv/2z+n3rOwSHUNvxKmCLT2hYb8PS4LhFqUaHQh+9cpyaIv9zgxSpTY+iLYGqzMTj/57A6iNG+fwfay8D7CwkFFC6w1JMahRQKQn1Scr1tUB5dprMqQ1Xe6fwUwjOCfmdPUqf1LfxVEVrpdJJhEd5FNpWwDXOWHjLSlWEhfO8o8A1ShJDFcYAAFOdf/4MPtoFwea5GHbW/yamght34jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA0PR11MB4669.namprd11.prod.outlook.com (2603:10b6:806:99::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 12 Jan
 2023 21:42:48 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::593:877e:dd33:5b7a]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::593:877e:dd33:5b7a%5]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 21:42:48 +0000
Date: Thu, 12 Jan 2023 14:42:43 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/4] drm/i915/gt: Remove platform comments
 from workarounds
Message-ID: <20230112214243.45exhnkfwsikxddj@ldmartin-desk2>
References: <20221222082557.1364711-1-lucas.demarchi@intel.com>
 <20221222082557.1364711-2-lucas.demarchi@intel.com>
 <2cfeee8a-7b7e-c203-37b4-f7a502123a5a@linux.intel.com>
 <20221222155535.gmih2rurxlo2xuo5@ldmartin-desk2.lan>
 <4c8ffcd3-259e-f651-6f32-296896d8b4b7@linux.intel.com>
 <20221223182807.tfyrx2yrjbv4flx7@ldmartin-desk2.lan>
 <2641f51d-8b79-0d47-90f5-b60e9f6edf33@linux.intel.com>
 <Y7XUvMUDYEHwX17+@mdroper-desk1.amr.corp.intel.com>
 <3a5eefc2-aad7-f22e-e54e-6f9af00edb48@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3a5eefc2-aad7-f22e-e54e-6f9af00edb48@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0084.namprd05.prod.outlook.com
 (2603:10b6:a03:332::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA0PR11MB4669:EE_
X-MS-Office365-Filtering-Correlation-Id: a561fa1c-2905-4201-801b-08daf4e5f2a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LRHpvx3ptM22IXk5xZkZSn2qoILL+tWDg8LwDfuaJWE+YQLTaxSDGbv3P/f043vImVeAZSj9s5NEY4Ulxl5FuLyuTe0WFbIPaJalvqQIKe4b1YxWymWkDMSosSvLp0lAykt+sNdloXUdyM/SqrUuJKATerWRKadfLfJEORJYZ9KmMJ/2c0SjsyMKwvhaUgxIX0qNJnsliuIK8WZ/rqUyJNUw5j0Rf58hxaP68rFkgbhAUPxWTlkTAcYHN0O0wfZmrv0261XmsAaQXq6TkBxGPQ4xEGaicgnREtvHL3Bsh1t5/+N6n2kspks8Zw0D4Y7xiJPYYxBoksdO1S3qbdoFg9CYwrkrEy6K0Nf/q3EQTjfychKc8Df3LRLAI6Q+YscnoFTPxQ2g2Z+qvk5Rb3KgsonLb9rRUMhptSQitdazj1q20O4AnRa2O3pVxINDgS7HYL7YV1QhXugl8xHbD9Pn36n1Ab1cNFSOqu7kAAXQDmsdxSeObJrVTBdAZpk05qXzOxX0b3Tj+qN/sVXW+mPK6nL0XIBQ+dzj4y2foOHJsZmPu5HtfB0qJ/9YrSZCsPt/ZaW3iDGDh1Hgu39uqTl6t2Dc4BZadLe6ZXlOJPf4Kft4sd0Pu212OJyUTOjPMGXlyY7bx/0qG04XbSCgls3+xA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(376002)(396003)(346002)(136003)(39860400002)(366004)(451199015)(33716001)(82960400001)(83380400001)(38100700002)(86362001)(66556008)(6916009)(66946007)(41300700001)(4326008)(8676002)(316002)(66476007)(8936002)(2906002)(186003)(6512007)(1076003)(9686003)(66899015)(6486002)(26005)(5660300002)(478600001)(66574015)(6506007)(6666004)(30864003)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?u9DPzUH1Q9eUPo/fVF/9ZUj7wz0xLfy3jn8atPowz4MFoPaPEfEGkGPLub?=
 =?iso-8859-1?Q?JmR8Ps2cKFcfV5nvOr5XxkjWaipZNzZg2BRO3DEuzBYKN+RSOAtnLzr8ai?=
 =?iso-8859-1?Q?pqE08CH8ixIPqZxj6EkEMdwdfZLBycEkOsJCdasI53PmDbm1fH+HOCjVMo?=
 =?iso-8859-1?Q?WgeoaQbVNlD89DDwX1Wx8MZ6sj9mtDerC9ceO6GKkpojI6ILYsu4YmBXTt?=
 =?iso-8859-1?Q?SvuDLXAjI/zT5xvM1SBq2gnjp682PZ90UbppXFkUWO0HjW/nQHSKOiru/l?=
 =?iso-8859-1?Q?AfV3EL7hHu1zg7GbzO8SoPVK39T98eoa5mfIj4bexCuVWnU9Z8xkMtfXZv?=
 =?iso-8859-1?Q?sCPxW/jeu4Oww4hEJyKOiRqthHkkNXra41ZOppG5YVIGQCNioTdKtTlgJq?=
 =?iso-8859-1?Q?1x+qHuwJJleoXVCgGziPRImj3vHo10aXErabusUASjNYwuzQdiEZsdmxWT?=
 =?iso-8859-1?Q?cR4QXLxU6Fk9BeNLJZiYsn7jiNBCHxq9KJ21CPafmxnA0gjwP9rfHBYr7A?=
 =?iso-8859-1?Q?RcjLQkWgr0mwnDmBaSfhYGagE/9Z1jwvm3SRpHpxrpb9ceEUVtYfEmEH0k?=
 =?iso-8859-1?Q?fmNkzGq7Qu2O7wZqeqoY08CzdNGl0Z6d2LWJqxBaL2uT5otMzvJ5KKPUif?=
 =?iso-8859-1?Q?7Ki/0lOF/qL6JtLjAq5nclaqdooqlT3Q9/iHXnbY9g8H8vtIIb/6IFozzO?=
 =?iso-8859-1?Q?ON/M5bUnums2ixU4KpItouDxM0wbxHkAkQUb6tSVqpPDsbwMiqj0EA1dgb?=
 =?iso-8859-1?Q?5+CJ2ScCOPiyANsHMe/abOTtx4llIoPWd3Wh/Kh4MtcqWEOyie5KxnaUb2?=
 =?iso-8859-1?Q?ws0UHTxOEQPR2nl8s6Jr/wk9UMVsHlnusVSueCv6m7iufNGdylmuZZekZq?=
 =?iso-8859-1?Q?xzPgRLcJRlceTiaROYHZK4YHMqe6pCQrPV4jKDY5o0K03X3KL7FNIBFNpE?=
 =?iso-8859-1?Q?ECZeaXPwHSFUWDZ0NlCk61QgV55nm7CwsY0XxzuNQz3jPRO31UjX6KkFWj?=
 =?iso-8859-1?Q?7WNR6VMltaTH9z923Cu4CTZZ+lDLtZrEElZIgDqBNdLfSB4ZYwsK9a6edD?=
 =?iso-8859-1?Q?lvsuEloUq4ZLuT5qpKTcJtTkuF410rCIbvJqm9MBdpY2baK5W0U6o2sW+1?=
 =?iso-8859-1?Q?cgKbLueZErPbQzg/msoxuWm/uf0Xr0QNQhQh8rIfJSf7RPgTTLX9a0NDUs?=
 =?iso-8859-1?Q?KZWzCXrxHWqIkTaUjalNP3NrjM1kJOwMcgj86PXZotBWBaUGnNU3kb8i5a?=
 =?iso-8859-1?Q?KQIMQxCmr/s0YoB9LTxmw3vQD2MHmFwMjhWDZVbrEOq1h5I0HH5htqZCWm?=
 =?iso-8859-1?Q?AsbyKVGs0yvcZJMxC+Ho6qtB9XdIyg+SSkjNP29vQO4POH6zURYXJu/N+m?=
 =?iso-8859-1?Q?xnKha9ju31F6ejsz5zTSU2fYbhVkNnrL0BRCb55qetVx5Feorvufe0tRfJ?=
 =?iso-8859-1?Q?U/q6AOkzBWcgmgA/Bqmh/8sv6py+okB9boGZLBu4qBRfQ/7iIWpfD4GiLC?=
 =?iso-8859-1?Q?Od555JXUViihnV5d7QJyskum8azj905c3fx6ZngEiYiOQf8lUrBssnQ9CS?=
 =?iso-8859-1?Q?KYDxiPQxx8N23OZZDsAFo5MJDs/JyxYbR+tl5I+bjBWc5F+I1bZenRXGxQ?=
 =?iso-8859-1?Q?jb0bkfUz9c3Wyt7bSvPaGyo56HnLQyAdbM/w5j+z+dKewA1oWPnoPnmg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a561fa1c-2905-4201-801b-08daf4e5f2a6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 21:42:48.4064 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7IFL808VOPppurPAh3xPtk0PG33WTAlxowb1eWyT4vG2vv5aAhtmoBGaWse2Bbqe509Zsasi42zaEXbjmrlf4ec6gQYO0hnoEqxGX58+/3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4669
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 05, 2023 at 01:35:52PM +0000, Tvrtko Ursulin wrote:
>
>Okay to sum it up below with some final notes..
>
>On 04/01/2023 19:34, Matt Roper wrote:
>>On Wed, Jan 04, 2023 at 09:58:13AM +0000, Tvrtko Ursulin wrote:
>>>
>>>On 23/12/2022 18:28, Lucas De Marchi wrote:
>>>>On Fri, Dec 23, 2022 at 09:02:35AM +0000, Tvrtko Ursulin wrote:
>>>>>
>>>>>On 22/12/2022 15:55, Lucas De Marchi wrote:
>>>>>>On Thu, Dec 22, 2022 at 10:27:00AM +0000, Tvrtko Ursulin wrote:
>>>>>>>
>>>>>>>On 22/12/2022 08:25, Lucas De Marchi wrote:
>>>>>>>>The comments are redundant to the checks being done to apply the
>>>>>>>>workarounds and very often get outdated as workarounds need to be
>>>>>>>>extended to new platforms or steppings.  Remove them altogether with
>>>>>>>>the following matches (platforms extracted from intel_workarounds.c):
>>>>>>>>
>>>>>>>>     find drivers/gpu/drm/i915/gt/ -name '*.c' | xargs sed -i -E \
>>>>>>>>'s/(Wa.*):(bdw|chv|bxt|glk|skl|kbl|cfl|cfl|whl|cml|aml|chv|cl|bw|ctg|elk|ilk|snb|dg|pvc|g4x|ilk|gen|glk|kbl|cml|glk|kbl|cml|hsw|icl|ehl|ivb|hsw|ivb|vlv|kbl|pvc|rkl|dg|adl|skl|skl|bxt|blk|cfl|cnl|glk|snb|tgl|vlv|xehpsdv).*/\1/'
>>>>>>>>     find drivers/gpu/drm/i915/gt/ -name '*.c' | xargs sed -i -E \
>>>>>>>>'s/(Wa.*):(bdw|chv|bxt|glk|skl|kbl|cfl|cfl|whl|cml|aml|chv|cl|bw|ctg|elk|ilk|snb|dg|pvc|g4x|ilk|gen|glk|kbl|cml|glk|kbl|cml|hsw|icl|ehl|ivb|hsw|ivb|vlv|kbl|pvc|rkl|dg|adl|skl|skl|bxt|blk|cfl|cnl|glk|snb|tgl|vlv|xehpsdv).*\*\//\1
>>>>>>>>
>>>>>>>>Same things was executed in the gem directory, omitted
>>>>>>>>here for brevity.
>>>>>>>
>>>>>>>>There were a few false positives that included the workaround
>>>>>>>>description. Those were manually patched.
>>>>>>>
>>>>>>>sed -E 's/(Wa[a-zA-Z0-9_]+)[:,]([a-zA-Z0-9,-_\+\[]{2,})/\1/'
>>>>>>
>>>>>>then there are false negatives. We have Was in the form
>>>>>>"Wa_xxx:tgl,dg2, mtl". False positives we can fixup, false negatives
>>>>>>we simply don't see. After running that in gt/:
>>>>>>
>>>>>>$ git grep ": mtl" -- drivers/gpu/drm/i915/
>>>>>>drivers/gpu/drm/i915/gt/intel_gt_pm.c:  /* Wa_14017073508: mtl */
>>>>>>drivers/gpu/drm/i915/gt/intel_gt_pm.c:  /* Wa_14017073508: mtl */
>>>>>>drivers/gpu/drm/i915/gt/intel_gt_pm.c:  /* Wa_14017073508: mtl */
>>>>>>drivers/gpu/drm/i915/gt/intel_gt_pm.c:  /* Wa_14017073508: mtl */
>>>>>>drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c:       * Wa_14017073508: mtl
>>>>>>drivers/gpu/drm/i915/i915_reg.h:/* Wa_14017210380: mtl */
>>>>>>
>>>>>>I was going with the platform names to avoid the false
>>>>>>negatives and because I was entertaining the idea of only doing this for
>>>>>>latest platforms where we do have the "Wa_[[:number:]]" form
>>>>>>
>>>>>>>
>>>>>>>Maybe..
>>>>>>>
>>>>>>>Matt recently said he has this worked planned, but more
>>>>>>>importantly - I gather then that the WA lookup tool
>>>>>>>definitely does not output these strings?
>>>>>>
>>>>>>Whatever it does it's true only at the time it's called. It
>>>>>>simply tells what
>>>>>>are the platforms and steppings the Wa applies to. We can change the
>>>>>>output to whatever we want, but that is not the point.
>>>>>>Those comments get stale and bring no real value as they match 1:1
>>>>>>what the code is supposed to be doing. Several times a patch has to
>>>>>>update just that comment to "extend a workaround" to a next platform.
>>>>>>This is not always done, so we get a comment that doesn't match what is
>>>>>>supposed to be there.
>>>>>
>>>>>Tl;dr; version - lets park this until January and discuss once
>>>>>everyone is back.
>>>>
>>>>I'll leave my comment here since I will be out until mid January.
>>>>
>>>>>
>>>>>Longer version. I've been trying to get us talking about this a
>>>>>couple times before and I'd really like to close with an explicit
>>>>>consensus, discussion points addressed instead of skipped and just
>>>>>moving ahead with patches.
>>>>>
>>>>>References:
>>>>>  3fcf71b9-337f-6186-7b00-27cbfd116743@linux.intel.com
>>>>>  Y5j0b/bykbitCa4Q@mdroper-desk1.amr.corp.intel.com
>>>>>
>>>>>So point I wanted to discuss is whether these comments are truly
>>>>>useless or maybe they can help during review. If the tool can
>>>>>actually output them then I am leaning towards that they can be.
>>>>
>>>>I consider "can the tool output xyz?" asking the wrong question.
>>>>"The tool", which is our own small python script querying a database can
>>>>output anything like that if we want to. The database has information of
>>>>what are the platforms/steppings for each the WA is known to be applied
>>>>*today*. And that can change and do change often, particularly for early
>>>>steppings and recent platforms.
>>>>
>>>>>Thought is, when a patch comes for review adding a new platform,
>>>>>stepping, whatever, to an existing if condition, if it contains the
>>>>>comments reviewer can more easily spot a hyphotetical logic
>>>>>inversion error or similar. It is also trivial to check that both
>>>>>condition and comment have been updated. (So lets not be rash and
>>>>>remove something maybe useful just because it can go stale *only if*
>>>>>reviewers are not giving sufficient attention that changes are made
>>>>>in tandem.)
>>>>
>>>>I can argue to the other side too. We don't have comments in the kernel
>>>>like
>>>>
>>>>      /* Add 1 to i */
>>>>      i += 1;
>>>>
>>>>This is exactly what these comments are doing. And they are misleading
>>>
>>>I'll file this under "Reductio ad absurdum", kind of. :)

which actually proves my point?

>>>
>>>>and may introduce bugs rather than helping reviewing:
>>>>
>>>>      Wa_12345:tgl[a0,c0)
>>>>      if (IS_TGL_GRAPHICS_STEP(STEP_A0, STEP_B0)
>>>>
>>>>One might read the comment, skipping over the condition and thinking
>>>>"ok, we already extended this WA to B* steppings, which doesn't match
>>>>the code.
>>>
>>>That would be reviewer error to assume B0 is the last B stepping, without
>>>actually checking. Equally as reviewer error would be to assume any WA
>>>adding patch is adding the correct conditions, again, without actually
>>>checking. Which leads me to ...
>>>
>>>>> From a slightly different angle - do we expect anyone reviewing
>>>>>workaround patches will cross-check against the tool? Would it be
>>>>>simpler and more efficient that they could just cross-check against
>>>>>the comment output from the tool and put into the patch by the
>>>>>author?
>>
>>I think this is the source of the confusion; the comment lines in i915
>>are not something the 'wa' tool outputs directly; the comments are
>>written manually by the developer at the same time the code is written;
>>the wa tool is just a quick python script I wrote one day to dump
>>database information from the command line and avoid needing to fire up
>>a web browser and click through a series of slow website links.  Also,
>>since the wa tool queries internal databases, it spits out a bunch of
>>Intel-internal terminology that doesn't match the terminology used in
>>i915 code, and it also includes a bunch of garbage data that needs to be
>>filtered out (duplicated records, mangled/incomplete records, etc.).
>>Exactly how things are expressed (platform name like "DG2" or IP name
>>like "Xe_HPG" also varies from platform to platform according to how the
>>hardware guys decided to categorize things).
>
>Right, I was going with what AFAIR Lucas wrote earlier in the thread, 
>to paraprhase "tool can be made to output anything we want". Maybe 
>wasn't confusion but misleading would be more obvious. :)

I stand by what I said.... the tool is just something that queries a
database and spits data in a better format. It can print anything you
want. If someone wants to print the exact code and comment to be added
in i915, it could be turned into that with a fair amount of look up
tables to translate platform names/steppings/etc, adapt to terminology
changes as they come, etc. The fact that would make someone's life miserable
and they would probably quit their job is implicit here. Next time I will be
explicit about "possible" vs having a good ROI.


>>Since the code and the comments are both something written by hand by
>>the developer, there's no reason to believe the comments will be more
>>accurate than the code.  They'll likely be far less accurate since they
>>can't be tested like the code is, and because the existing codebase is
>>wildly inconsistent with how we even format/represent them.
>>
>>>>
>>>>see above. Someone cross-checking the comment is cross-checking the
>>>>wrong thing. As I said, it happens more on early enabling of a platform.
>>>
>>>... my point which seems to have been missed by both, well question really,
>>>do you expect every reviewer to cross-check against the WA database when
>>>reviewing WA changes? I don't see that was answered.
>>>
>>>I guarantee that it won't happen and people will rubber stamp. So my
>>>argument was that we could make it both easier for reviewers *and* decrease
>>>the likelyhood of misses, if we kept platforms designators in comments.
>>
>>Yes, reviewers are absolutely supposed to be checking the stepping
>>bounds of every workarounds change they review.  That's one of the most
>>important parts of reviewing a workaround and it should be very quick
>>and easy to do.  If people are giving rubber stamps without doing that,
>>then they're not really doing a full review.  But I'm also not aware of
>>any cases where we're getting rubber stamps; most of the non-comment
>>review misses we have seem to either come from misunderstanding the
>>semantics of platforms (especially cases like DG2 where different
>>G10/G11/G12 variants have different stepping schemes) or technical
>>misunderstanding of the implementation details (register reset
>>characteristics, masked vs non-masked registers, context membership,
>>etc.).
>>
>>>
>>>Yeah it is much easier to rip them out that to find and fix the ones which
>>>went out of sync but that shouldn't be high on the list of criteria.
>>>
>>>Argument that it is easy to overlook during review that comments and code do
>>>not match I don't think holds. That describes a very sloppy review. And if
>>>review is assumed to be that sloppy, do you really trust review to check
>>>against the WA database?
>>
>>It's the same reason people who write prose can't find their own
>>spelling/grammer mistakes.  The mistakes are "obvious," but since their
>>brain already knows what it's "supposed" to say, they just can't see the
>>error themselves.  Once you've reviewed the code, it just gets really
>>hard to see where the comment doesn't align, especially for the
>>workarounds that apply to a bunch of platforms.
>
>To be pedantic here - that's a writer's handicap - shouldn't be 
>reviewers. But anyway, carrying on.

it's also a reviewer's handicap. At some point, as illustrated by the
example below, the comment is harder to review than the code itself and
the reviewer is already biased by their review of the code itself.

>
>>For example, if I'm reviewing a patch that adds:
>>
>>     /* Wa_12345:tgl,dg1[a0],rkl,adls,dg2_g10,dg2_g12[a0..c0) */
>>     if (IS_TIGERLAKE(i915) || IS_DG1(i915) || IS_ROCKETLAKE(i915) ||
>>         IS_ALDERLAKE_P(i915) || IS_DG2_G10(i915) ||
>>         IS_DG2_GRAPHICS_STEP(i915, G12, STEP_A0, STEP_C0))
>>
>>I'm always looking at the code first and comparing that to the
>>workaround database.  If I then review the comment second, I'm much less
>>likely to catch the subtle errors (there are two of them in this example
>>where the code and comment don't match!) because I mentally already know
>>what the bounds are "supposed" to be and the comment all just kind of
>>blends together.
>>
>>>
>>>So my argument is that it is trivial for reviewers to spot comments and code
>>>do not match. Trivial and fast. And it's trivial (I hope) for the WA tool to
>>>output the right format for pasting in comments.
>>
>>Given how much terminology mismatch there is between the internal
>>database and how we refer to things in i915 code, it's not trivial.
>>It's also not super easy to even figure out which platforms to include
>>in the list.  The workaround database is going to include platforms for
>>which there is no i915 support (e.g., LKF) stuff like CNL (support
>>already removed from i915), and future/potential platforms we can't talk
>>about yet, etc.  Finally, when there are duplicated/conflicting records
>>(because the people inputting the information are just human too), it
>>takes a bit of human intelligence to read between the lines and figure
>>out what the reality is supposed to be.
>>
>>Sure, these problems could probably all be solved with enough effort,
>>but given how often the internal formatting and behavior of the database
>>itself changes, it would be painful to keep it always working properly.
>>
>>>
>>>Those are the points I would like to have explicitly discounted before
>>>proceeding. Maybe to be even clearer the workflow would be like this:
>>>
>>>Patch author:
>>>
>>>1. Runs the WA tool for a WA number. Tool outputs text.
>>>2. Pastes text verbatim in the comment.
>>
>>This one isn't correct today (and as noted above, not terribly easy to
>>accomplish).  It's
>>
>>    2.  Developer manually writes code comment based on interpreting wa's
>>        output.
>
>Given everything above lets say we concluded it is too costly to make 
>the tool output the exact format wanted by i915 and we decide to 
>proceed removing the platform designations. Two final questions.

agreed

>
>Question 1)
>
>Is everyone okay to remove from _all_, including old legacy platforms? 
>ROI vs churn considerations? And yes it wouldn't be ideal either to 
>have separate rules with some cutover point like Gen8 maybe.

maybe we could land first a patch changing all the Wa_<number> ones and
later if we find the lack of consistency is bad we extend to all of
them?

>Question 2)
>
>For Xe you still intend to have it a manual process and not have the 
>tool output the macro section which could be directly pasted in the 
>code? Would ROI of extending the tool be any better with the 
>data-driven design like there?

I don't have any plans yet in that regard as the source for all the
workarounds in xe actually came from i915, not from the database.
We may play with the tool in future to output something close to the
macros.

Lucas De Marchi

>
>Regards,
>
>Tvrtko
>
>>
>>
m,                                                                                                                                                                 >>Matt
>>
>>>3. Adjusts code to match.
>>>
>>>Reviewer:
>>>
>>>1. Verifies both code and comment were changed.
>>>2. Verifies code matches the comment.
>>>
>>>If the counter proposal is, patch author:
>>>
>>>1. Runs the WA tool for a WA number. Tool outputs text.
>>>2. Adjusts code to match.
>>>
>>>Reviewer:
>>>
>>>1. Runs the WA tool. Tool outputs text.
>>>2. Checks patch matchs the WA tool output.
>>>
>>>I will accept it but I strongly believe skipping of step 2 will happen and
>>>it will be impossible to know. Rubber stamping with the options of
>>>comments+code at least leaves a trace of comment and code being out of sync.
>>>
>>>>>And point here to stress out is that accidental logic errors (missed
>>>>>workarounds) can be super expensive to debug in the field. Sometimes
>>>>>it can literally take _months_ for sporadic and hard to reproduce
>>>>>issues to get debugged, handed over between the teams, etc. So any
>>>>>way in which we can influence the likelyhood of that happening is
>>>>>something to weigh carefully.
>>>>
>>>>yes, that's why I want to remove the comments: from my experience they
>>>>are more a source of bugs rather than helping.
>>>>
>>>>>Secondary but also important - if i915 is end of line then an extra
>>>>>why we want to rip out this for ancient platforms. Is the
>>>>>cost/benefit positive there?
>>>>
>>>>yep, here I agree and was my argument about using the platform names
>>>>rather than a more "catch all" regex. I think doing this only for tgl+
>>>>platforms or even dg2+ would be ok.
>>>
>>>Okay this is something to have as a 2nd option indeed. DG2 is out of force
>>>probe so maybe try with MTL. Although different rules for different
>>>platforms I don't know if will work in practice. Could be justt too
>>>complicated to be practical.
>>>
>>>>>As a side note, and going back to the question of what the tool can
>>>>>output. Long time ago I had an idea where we could improve all this
>>>>>by making it completely data-driven. Have the WA database inspecting
>>>>>tool output a table which could be directly pasted into code and
>>>>>interpreted by i915.
>>>>>
>>>>>For reference look at intel_workarounds_table.h in
>>>>>https://patchwork.freedesktop.org/patch/399377/?series=83580&rev=3
>>>>>and see what you thing. That was just a sketch of the idea, not
>>>>>complete, and yes, i915 end of life point makes it moot.
>>>>
>>>>now that xe is announced I can talk about this part... this was more
>>>>or less what I implemented in xe: it's a table with
>>>>"register + condition + action". There are the most common condition
>>>>checks builtin + a function hook for the more advanced ones. During
>>>>binding the driver walks the table and coalesces the entries creating
>>>>a per-register value that can be used at the proper times, depending if
>>>>they are gt, engine, context workarounds.
>>>
>>>Cool, I support that high level approach.
>>>
>>>Regards,
>>>
>>>Tvrtko
>>
