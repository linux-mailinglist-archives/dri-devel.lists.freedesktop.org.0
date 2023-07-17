Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8D1756A31
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 19:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9DC010E28A;
	Mon, 17 Jul 2023 17:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA2110E28F;
 Mon, 17 Jul 2023 17:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689614699; x=1721150699;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hlcvIfeJ/vhLRc7TcDB7RhsG2jZzSDJh1vnGLLrTfgk=;
 b=gaCgfb86J5mAN1+Su8lxBHS+K9eIflkmgXRLhNj+0qd13oZhBXH0LKb2
 jovctj5TaXoTLZs90y/k4HO30K8WfphMSI/tkdhNuV8+sX1ImRBOKqSqN
 hweduf/JrIwRrOx7T6+aRUhDinMH0KB5Gj/+jw4kyrKPgQs5f0apvqcKw
 elw7eITJp6QR0wwFbbnA6rJ2jG/2cSfjeHKgwgRFKjxl85MWgpVD+cquC
 qLo3Uxdk5xFuHo9J22fssKKwEg1pVkQGBNHtN99tXnpdaFX7qfcQam1/5
 uZzGHMrXDer20chG/cl+tkd9d8Rmfx9eOXuDy2qUYzr1AivbhsvPGVUL+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="396819984"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="396819984"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 10:24:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="717311374"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="717311374"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 17 Jul 2023 10:24:58 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 17 Jul 2023 10:24:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 17 Jul 2023 10:24:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 17 Jul 2023 10:24:57 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 17 Jul 2023 10:24:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DsyfZZnlxMZ9SUFNypPTYrNryxB7c0gGpuFXMLap4aU7yRlk9EUTwVt6DNWkwTL/oDkJrH4j4wr6iE3JZResVwOrY6MXS2++c1FCqKV+zkJxGKNtFRh6Mi5hzCAYGLi7zhxmVpaTtUHrawr5bBjiUkiunQEnFuZx6dXI5QT87IqaR5gUTy7HrGBEfjamflF7VmaJPMqIN8x0iq9cZXDHY50Z1sqSX0lhkGUEZ+BCqTa9v6XbJFPY5iMlHCU7c0IhXlIC/BIosuOrIlzGwY6wFZwBtvpvMjraKkxdpt/yjBZiRplzKsbiVaR/AVVrzA/jNHkIBWpv9C6HEm3wd0LFig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZ+cEPEYDmTWfYkbyDXHM1XWXvZ77ELno/fRy5nAbA4=;
 b=FmqrE1iLax/ETcCtDaudQYFXva5nFUgu4WqZ3thJrWIfhSzRwCk283GEu914Fb5dBQyA5I2Y7ERT3w+SygVJ6MeDABdQx8YrOxSsaqJQV507/jV/K6BcD2AXSIpN8hHJLySoY71Bnd1VDwem78AmOsBaJGNY6e5tPBchGJqw2LnyZvTA7VMpwGxa09YW++3z67ZSHFHCKYqqaiDrlHBKIhdEDGNkBVamOOYbX8RdccWg7Nytp6apszDMrPxpXHOBAaQKQ+u2TGfvmZk6Lq3HtZQ/NGj9CPvSt/ZdwfNP+SZoWzbGaEpiTc5qA2FGvRgiZSkLzUhTRRMvV6WrmFUm/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL1PR11MB5335.namprd11.prod.outlook.com (2603:10b6:208:31b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Mon, 17 Jul
 2023 17:24:55 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 17:24:55 +0000
Date: Mon, 17 Jul 2023 13:24:50 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Welty, Brian" <brian.welty@intel.com>
Subject: Re: [Intel-xe] ttm_bo and multiple backing store segments
Message-ID: <ZLV5YmlKu1+obT8L@intel.com>
References: <c886cd42-2a78-fe3e-405b-e531d54449fb@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c886cd42-2a78-fe3e-405b-e531d54449fb@intel.com>
X-ClientProxiedBy: SJ0PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::12) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL1PR11MB5335:EE_
X-MS-Office365-Filtering-Correlation-Id: eddd5685-342a-4ea3-8e6a-08db86eabca0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6KLHif+QRaTsaGbQgOcWRSg8bW9YSuqIB7hWTTqkElldZUu1DoFnajz0wkbGKvuHAje4xNAaABLE2oGo6z54QeSljT00yqV9a0UPIvPCHFLVtyvdw2x/j4hvabhgIIX6NIxVptGS7Dc606qIkZ4+phMMrJn9gVecBc023WDiPY+fS4niseOQlw8b0hJ00EaTt+k9LrTiTEkL8oeO/KxRwjHbxdWNkvcICpIUcpB2UpoDY7raEzhbW9Dx2dcx1KRKIrBSBHlvKYDouIKOUB7GGjSay2jlOGeeCUjsAJknBCvfar5LDc8A9G4eMbY77sL6oevIOd6CbGdzG0Xn15lhZvwFlpsuGdMGavbfzT95CYow3QiYsJJm1hktvxueflQgWTniHUCPuCAVHCqskHU0EgIgrpufHzNF+8dwwUmrcN15Mtt6CzFIpFn2FoNSE0DRLM4mVWyTVBM5+fcJ4oFoIfHWdMsxr0y2rg6dutPVqzRfej6yHP6qyDz4Zo6z/a1j3XVkgiLE869Dp0UKz3ET4RcrFNVoAdFW5spiznIbtafj1b/QrxjdWZHf4YyUqVijoozX6AOCJxZ6KR8gLrpXKnbQX3d/S7LasDJgGObqTCc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(39860400002)(396003)(136003)(366004)(451199021)(478600001)(6486002)(54906003)(37006003)(6666004)(2616005)(83380400001)(86362001)(36756003)(2906002)(26005)(186003)(6506007)(6512007)(38100700002)(316002)(82960400001)(66556008)(44832011)(66476007)(6636002)(66946007)(4326008)(41300700001)(8936002)(8676002)(5660300002)(6862004)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5cR7ZKfuG/zTz+vHfX8Sj1wutMieXcrmEbPVnyPw3fCv1VAijHiv6g9OFOha?=
 =?us-ascii?Q?2DcNwb5CXYEfn7gS3keiaT/K7ty/a3HV7wnBrZW4dCWl905oxlkwsNeaqGgz?=
 =?us-ascii?Q?wrBhXtTE6qJ2ojoHGZxGJB3Oqy82343ZdqjjEtmXlUklqOTeqGSKHQSzS64B?=
 =?us-ascii?Q?6iTdNsJx0wDPjBBuVMMUBEra3YMqVhkO/HAqvIbkCxgnSBMEJVGcak9qftZM?=
 =?us-ascii?Q?qbZ9VVNZTkLbLGOK5yTTtYjOF7ynDC6mltxa7Vq3giHe/5gXsabByYvn6aGy?=
 =?us-ascii?Q?ZOjmlQWWpP6I/dW1zmbAqcgbANBMXbNW6DMdwlO4Tor+KFp93RQBIm035Xn8?=
 =?us-ascii?Q?BUESqU1+qR0J+WBgWZk/vTWk5qfAB0Ktx9NmRapESzvDPTVLw0yhwfbSv3d6?=
 =?us-ascii?Q?bjVMl9IJ8LUYKgYQtZOErHRfbiOCNUa155/EnV2v3MlRdhnNrSeJgDAQWKu4?=
 =?us-ascii?Q?D8cdrfi8AGdVZuZS+BCalzx1qCZiuDwz4Y27pSzfO66rEuyCT7qBJNx27g2e?=
 =?us-ascii?Q?t4LB5tJCjSnuNxkQgHMCJxHXNa3EUWABp3pa3OgPj+5U7cim8OGQ/Q4Lv6Y7?=
 =?us-ascii?Q?pV3izP/2yTPjLMfG7ChzNfYtGO/aQWxn1tEmAagZuXChTj8OpeguhcKRF3fg?=
 =?us-ascii?Q?/eSiipLdvKD9kesTBa3hyNMocgdfOYfccswufiEBJSgC48K8EtcpjctnHIfz?=
 =?us-ascii?Q?+uBTdTQi0Z8S1OlKi0h5xz7sQr7sSnObljdWyOrPetnCrgED7GYzC4TH5gvM?=
 =?us-ascii?Q?8x09vGWn0yqeCysbSFwdBwUHdsqSsBALOgHCmp22NBNSmoAXhvlCmpJLTitO?=
 =?us-ascii?Q?TBmtPbAPNxFfEbEySqMz9q/ZhjyVFcuJBMKlcBvhePKLnAOG5zJM+M2w1BH4?=
 =?us-ascii?Q?VXRRRMohV2adktYOo5l4mmM1mR7XR4s21l2SuHLQQ2BeCaxEBWDj42tSCFDB?=
 =?us-ascii?Q?LOOkRHahcb6itDhmgjKiK+THoT+89salCUAHF6/93oHvtaSqK1gv3yIyLO0M?=
 =?us-ascii?Q?hQIHcMacHK4kWHEA7nMWR6T/6FHf48/x07T6dnC8IzrsqivRmhmszv3MXkt+?=
 =?us-ascii?Q?4TjHUyFt0A2RT6U6TEQTQBsqWKFw26LIlvl3MX05IPWCAMv8VLuLB0z0RNFN?=
 =?us-ascii?Q?rFEVaQQI1ZNCSF7F7H7jWCmdMnxOBGlFEIJIUqqZtgcoyNWMu1ilMLstJSep?=
 =?us-ascii?Q?/t720fjL5BLTqHMsd/Zi4EXthjMovDzIOuulpIuIKaNI4nN2bk48AOiQMsg3?=
 =?us-ascii?Q?6yM32SMUFrtl5fpED1wGZfoNPejogpaDMpJlr3bz6sGf72uczIHguuiTn8Ck?=
 =?us-ascii?Q?WymF/NG+0uN/xszpSKwmjNgmPqaniB2+90HAodZxPGr2LejggISzGiXcXPLo?=
 =?us-ascii?Q?IoUDdiFWg/YfaoMSBFhRrdgkxwuTZhCWkxAnFVtD528IdIkrwnoIJZkZEr9u?=
 =?us-ascii?Q?xdkSN+1e2pKGMCBzpBrGDsQw71DN08OI68UJTd6tw/ykYz9fINm8RCgSPVTc?=
 =?us-ascii?Q?ErJGcCRAIHWZ2hW56svA+ofoxxpTzTCNjSA81vPJe957hq6vnIP25WlQid54?=
 =?us-ascii?Q?h+PXUhKQcnPATWgbtfOzSidIe9jWC8nUyMwF3krN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eddd5685-342a-4ea3-8e6a-08db86eabca0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 17:24:55.5749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m2GmdlG3ouzXGlsHi5sA/jR60/iNLIzBJ/YGPwjPuoDOC+kdRSeCmsTxJSbsXk9uuudPSlURWsUIOhpqwr1B2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5335
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 29, 2023 at 02:10:58PM -0700, Welty, Brian wrote:
> 
> Hi Christian / Thomas,
> 
> Wanted to ask if you have explored or thought about adding support in TTM
> such that a ttm_bo could have more than one underlying backing store segment
> (that is, to have a tree of ttm_resources)?
> We are considering to support such BOs for Intel Xe driver.

They are indeed the best one to give an opinion here.
I just have some dummy questions and comments below.

> 
> Some of the benefits:
>  * devices with page fault support can fault (and migrate) backing store
>    at finer granularity than the entire BO

what advantage does this bring? to each workload?
is it a performance on huge bo?

>  * BOs can support having multiple backing store segments, which can be
>    in different memory domains/regions

what locking challenges would this bring?
is this more targeting gpu + cpu? or only for our multi-tile platforms?
and what's the advantage this is bringing to real use cases?
(probably the svm/hmm question below answers my questions, but...)

>  * BO eviction could operate on smaller granularity than entire BO

I believe all the previous doubts apply to this item as well...

> 
> Or is the thinking that workloads should use SVM/HMM instead of GEM_CREATE
> if they want above benefits?
> 
> Is this something you are open to seeing an RFC series that starts perhaps
> with just extending ttm_bo_validate() to see how this might shape up?

Imho the RFC always help... a piece of code to see the idea usually draws
more attention from devs than ask in text mode. But more text explaining
the reasons behind are also helpful even with the RFC.

Thanks,
Rodrigo.

> 
> -Brian
