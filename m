Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B6194B37E
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 01:15:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4B610E606;
	Wed,  7 Aug 2024 23:15:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ymwl7Jb0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BDF510E601;
 Wed,  7 Aug 2024 23:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723072521; x=1754608521;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OsSFmE3uSMlxlUKnTLO61qCkpn5617rjCYnYfFnKEwY=;
 b=Ymwl7Jb0I7SGyb0SVkhXlO1mjcseJHV7KMjYmt1iS9Ukgvn/C0RHGh9o
 2oGYoCMfl3ZLJFGU2fUH5neimahbD/sn1yluD5cfHaS0UxPvpvAdI0hao
 Um0Qn2zJFSQgng2AG+OShEie8AM//L7A9YC8yaE21u6bfK6KG6TuFoOXq
 CE7DzokSFPim94tKXrfkOAXtXaFRLRYkAFNqa8GD510p9j7hjFB5SZ7wH
 HRWhzOoUwMBKcN6veUmkoOZxvawWRdVkrytpdK4Ol5b5zZ4oXP1TZ/muc
 lUzaGn3A4GEktJLmlhrBRGwLlcaDGk2tcbGTYrYRkqZUoOcfe9uyjMv2w w==;
X-CSE-ConnectionGUID: ayQFt3UPT1uUc4vBbUZh6A==
X-CSE-MsgGUID: EAQoVaftTOmTD9rf3mtg3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="32564045"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="32564045"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 16:14:53 -0700
X-CSE-ConnectionGUID: lCamz8imStid7zqygtIctA==
X-CSE-MsgGUID: T+uQcmUtSDG/iD4Zl9vuAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="57582734"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 16:14:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 16:14:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 16:14:52 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 16:14:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lSfZ/THW0cWqsE3WGs8QVvjaFSse8SoJZNomVzkXLd+2YTkYkegYAoAJDuVfU/R/8NvYfNBqb6y1I5KutIq4U4RmzBlmOZpUmmDFf0puXvbfjQ5Gx1Jt6080w9BFAHxTGsoWBQckfY5fT7a+tMHavYvggRx764vGZRlOKxCGO31V3xPy5D0x4OxWpOjtf1xAcw4HkzfKyNjqZymY8X2Nuq9+PI/iKRuOu6ZphRFOCsueZVZ2l7G3SW553v1XqiwdNbbNucRPz/KuN47Wq8dHLLpf4sD+GnFfB0WQfDr9hNzIBffsakgOkfbTvPfJaxA+JH4wF3qMOCRFyWo879hm5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YfUTzXxcS0EZfGMCp9zS0pLq0oPPG/zSmPWWL8pMMYU=;
 b=lN0TZA5wWTECKQUmec93ObsWD8/1f/JzIloRm2J5mkMmpdIIQxcCx2wdVugr5S2sBa1P7jbwDBL1Bk1GxGMBPxgPsUJQiipvqHi6jarQhef+3Z+d4PifNEPem2ehaz/eqqc6W8yXsLH09oJCOWKBNXh/XvKaF3u5+qyMjMwhaLma0qPeEVF7zraA7GrhUKmd9j1l1yzpeit0fpDN1HKf5/M0xiAGKMkCvC+FgAtrojlI1yaBJOpJ0CgIR3M2HwHH6+F92ly+dzo92zPQXHOg5TFfA0bmAS6dK7fQfaeSIgs2zwA//jV4SiH8z00/fLdEPGm0neLAnsqD/iv8BV0ZFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB5171.namprd11.prod.outlook.com (2603:10b6:303:94::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Wed, 7 Aug
 2024 23:14:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 23:14:50 +0000
Date: Wed, 7 Aug 2024 23:13:31 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "Amaranath.Somalapuram@amd.com" <Amaranath.Somalapuram@amd.com>
Subject: Re: [PATCH v6 12/12] drm/xe: Increase the XE_PL_TT watermark
Message-ID: <ZrP/m+QTXBK6OKjp@DUT025-TGLU.fm.intel.com>
References: <20240703153813.182001-1-thomas.hellstrom@linux.intel.com>
 <20240703153813.182001-13-thomas.hellstrom@linux.intel.com>
 <a9973e37fc9c81046ce5f32a13f5e8eb50d90935.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a9973e37fc9c81046ce5f32a13f5e8eb50d90935.camel@intel.com>
X-ClientProxiedBy: BYAPR07CA0085.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB5171:EE_
X-MS-Office365-Filtering-Correlation-Id: 818b1c48-7599-4382-1b29-08dcb736bcb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Wlc+xlQCjBiIbj8jgtj3v58uT1R5LU+6XUbyRwPLUOb5pcw1/hqowUwhn/?=
 =?iso-8859-1?Q?UJiWXrBfleI8yQMcMw75LJEBZ6g4g323ZKgD1OHuCOnXO8/UTopR/MnRaE?=
 =?iso-8859-1?Q?P0LH9har4/fE30nxlgYL2nlp3NZSI4kKHWhGR4q65Potu2aNmj5XAXJ0Wb?=
 =?iso-8859-1?Q?8u+giQwHCKPWQD55SbnzJFJaDho8hCNVybKHdYZnu9tzeTAoR2DwIfQkD4?=
 =?iso-8859-1?Q?m1XnQipR/Vh4Sqis9+ukMc6/xHUkCA+96R8Y4u1HOs9Z6pSFS0vK+dNoqC?=
 =?iso-8859-1?Q?ObmNeu+Bc7REPSlzA3vr1G28a2Y0xKK089X/LSsrIyvz9iYxSswj4EUY+G?=
 =?iso-8859-1?Q?67wZNFQ9Ax/qdSjWTWhGZslPSjl0SW7QMA1rQ1u1qw1R0msETE+6IHmd79?=
 =?iso-8859-1?Q?RHJ1Sh/26coWZb4qKdaXCMQTN5tRYECmoj5Tzb4BiipDMD96VRs9hNgVrL?=
 =?iso-8859-1?Q?M7NdO/m2EDmPyYMMgiSPNG3gFRp6No8h/tvNME1Kaa6N/t5lNpH6MoTUsE?=
 =?iso-8859-1?Q?+CaI79mlcMy7Iw2O4vtWF6h5P2KRpTjBIskTynitomTv+ep+16bTQP8lPw?=
 =?iso-8859-1?Q?Kp7dhKPLBbFdgw7UDl3PUAc0YyjvbeakC0c5tBzNM6e5jgkYtrvA323PJ0?=
 =?iso-8859-1?Q?1OgaBTGs+d/oRuN+NmclCTe8Nvn4iTPcGMVmOw0VShTGaPDK/eSguThqRm?=
 =?iso-8859-1?Q?kvXzRQ/2JwcuvNkt1n8JMYyp9qoH9N+YV2MCy0SSIhsZDZLrePT5qAl01F?=
 =?iso-8859-1?Q?BFKn6izCzgY2XeWcxvR4cRcVHu9wJHGWRhs7wbJCDC7NzQ2JygkcmkaQuj?=
 =?iso-8859-1?Q?D3aCeadDwI/AWdUjDWll6QJj/GeQ5G24i0k4nJ+njn4D3wZ8ma58ygzVGz?=
 =?iso-8859-1?Q?QsM70xm0kD6sBHYPBJII9ZYtfQkqZNMX+sCZC6s3oI2JDoDNdOI+Oy4l3O?=
 =?iso-8859-1?Q?qjRhJfFOqg09C/EM/AFopwvMcY/+EYh2tGBiUoC6Nyur8kR+sI4jzjiurj?=
 =?iso-8859-1?Q?50T7OkUIQQJucBiHKfi/qHek8W1iFHUE7/+AdADXWkAPcHJ5ZevQ4EWvrX?=
 =?iso-8859-1?Q?fVsb51XLI40YS2MrhX0GjvrnoSNfUr+E4QajSbzYAsM/fPH8PseqkxfOqH?=
 =?iso-8859-1?Q?gs32b4rHaq0nvjE2mECQjZFskbzi8rzNHpz3g9TUizZdk+9VXTqvGSjgSC?=
 =?iso-8859-1?Q?HKRNxkXEHiASHyYNXy0bALnYUGheJaUiffuX+Wx68Hub8cfZ7W6owwXjjr?=
 =?iso-8859-1?Q?az4E1mDbQAYjbvMjqdLXOyGfHfPtnOcP6fNH/9YRbMd6Bi8Cav5LUSEiPz?=
 =?iso-8859-1?Q?JWUXnnOF7hAJjXdsvpjLsroCVp+2mYbWzjX6CiGoqySmhsCwdlRBRjP0SX?=
 =?iso-8859-1?Q?OfbJKJDqbXbNz3yzNcJqnCUIniNKdRlw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?OPSCIOvjsrq4hXxdwlXc1vRbRQ2IhH/kMpkkofQUd37G+odU4a6ZkNxv+d?=
 =?iso-8859-1?Q?P4JoNsD03b11YR4bIqet3bPQK5ESJfO8eBycQQYTSFbb8Lu9VHecy5SOpc?=
 =?iso-8859-1?Q?Hw0EMlS99qKJxglF019mDkFsh4haLGH8k7BvKAhTWsMIfWZ8O5h1/ONapq?=
 =?iso-8859-1?Q?NrnAUIIUFes6aMpUap5NMqcODXknUfoRKkeZwQ23bOwZaCyTfLRNsSPzG1?=
 =?iso-8859-1?Q?yftuuN/TbjC0kmG5dq1wBRmlU4mLJGbVuFxFdqASkqDssjw/bp67UAX1ng?=
 =?iso-8859-1?Q?DeG0XMejTVbrv4M3phl5hELdu1okQ54CGvVfjW2gVMWMT30upJBrjALhfS?=
 =?iso-8859-1?Q?5GcO/KiN3B8Q3pKwsoL9uuagLu9UmcyEd6eUt8jZb4lSzwc/p3nXAKZjoP?=
 =?iso-8859-1?Q?R+b6vgff+9t+XNFJnCmsdIgBZILNgIXQwEUAKmwM3EL4ykSKt+RKhrzQ3K?=
 =?iso-8859-1?Q?1pwTEukvQU2aUra3W7iVK62X+EfUQbmCFDHCoPD1yb8yhARx/eC4ERIH0T?=
 =?iso-8859-1?Q?NwL3mMAHiANHXdOTP5qvhrEWxNMuLhn8kXIN51YKDcVK5jsk0EHyI2Op34?=
 =?iso-8859-1?Q?QBnnizBvm9ds0XAlVpRcyUWi7DLR39H/Rx8VtK+otY738abu9gdrU+tuQ2?=
 =?iso-8859-1?Q?JV2IEYwl0x5Lcsk3SNrINiTVQIWlgrnD1jc4UQGOlcl1qTHXfCXnSkbK/Z?=
 =?iso-8859-1?Q?mUIAxCqe0Lu6iDfQhH0dxXihIx8Ayt3hrC33FwBnivJ9Yq+UX4uKpQa3Ko?=
 =?iso-8859-1?Q?NYSRrf4Ue8E7JkWHXpoXjG0fLhCR4LsXxtISNcihOfbwqP8HHpjocM3sS0?=
 =?iso-8859-1?Q?HaxX/cQgKePicZrmI8+E7uxPdkMUxopavmX7H9mTZMX2RhF1qMAP2foCco?=
 =?iso-8859-1?Q?tE/bTEsgYzi6HltKG8mz9sk9NARZD48Jc+roVx9Z08VxwOPGmEiVhqw5Eo?=
 =?iso-8859-1?Q?QRrt7gmXiRdprD5J1adoYr/TgS88kILBAp+O4Wi+TY5cGed8mhfzy2ioyx?=
 =?iso-8859-1?Q?j3oC7+z9Nh0CFpmT6D830JY1qWgPkpQGZP0UGPsMZ9kpUgXvaQFvkWn92G?=
 =?iso-8859-1?Q?M+TbN/tz92x1aEAMSwXeQuq8r0FB1b9n9jspAgh8OCyne9M/GNkkohOw0h?=
 =?iso-8859-1?Q?v/PS+z5pAiRJ29MMZzFtd8zHB3dbLHJ5sCbY1Ur3ifIiYejVK8QdYF2iT6?=
 =?iso-8859-1?Q?6MoouJ+lh65aHq7Y+mslzgIjnXRMIoSedoR+awshVc0DvmZzH6tFd16dES?=
 =?iso-8859-1?Q?GURCSQ1RKT5X0LkjHOx5skClbtWiweCXT8bgUts80dVvqL57s5UTA8nA9e?=
 =?iso-8859-1?Q?0+BKh2P8Rj6D4IxgTAt9zXmCctYo8llbExc7G2ojtJwu1wQLGn2APaUTij?=
 =?iso-8859-1?Q?cX3ZrJD6KNqXd4KzYvCgUrd5vfgwBxKCQXiKl8vIYOdVv93ckjiquxswP6?=
 =?iso-8859-1?Q?z6eclYo/t+Z1/PEMpKpAFelv4xn05OgKYivg1lRBWSvQtv2iDwWHPcNrSf?=
 =?iso-8859-1?Q?chirdiAEMSc6fDHFDLRahItKjYcP9xT4VOdw+Y5WfqpfypQJaP/It50yIH?=
 =?iso-8859-1?Q?c3MGNUbe7JvtJqFTemMVg1j85dkCbLI4xfJ4VE4yE1yXYVc3/lKk+zgj/I?=
 =?iso-8859-1?Q?5vfV7w/7L6bHd2CH0fNZX6BT3kA3W0PTWs8Cccu9eQ4j5UYS7tpDN4JQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 818b1c48-7599-4382-1b29-08dcb736bcb8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 23:14:50.3443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Na+NEN+keBa1e7zIhh8u4oHYZIepPEc7ObXnyPoMKEa5AL82Q5iG5sym9hFlutKe8FTQr5CvsCxdELuhaldYpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5171
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

On Mon, Aug 05, 2024 at 12:35:34PM -0600, Souza, Jose wrote:
> On Wed, 2024-07-03 at 17:38 +0200, Thomas Hellström wrote:
> > The XE_PL_TT watermark was set to 50% of system memory.
> > The idea behind that was unclear since the net effect is that
> > TT memory will be evicted to TTM_PL_SYSTEM memory if that
> > watermark is exceeded, requiring PPGTT rebinds and dma
> > remapping. But there is no similar watermark for TTM_PL_SYSTEM
> > memory.
> > 
> > The TTM functionality that tries to swap out system memory to
> > shmem objects if a 50% limit of total system memory is reached
> > is orthogonal to this, and with the shrinker added, it's no
> > longer in effect.
> > 
> > Replace the 50% TTM_PL_TT limit with a 100% limit, in effect
> > allowing all graphics memory to be bound to the device unless it
> > has been swapped out by the shrinker.
> 
> Sorry if I missed some patch changing it but I did not found in this series anything changing the 50% limit in ttm_global_init().
> When I debugged some Vulkan tests allocate a lot of memory, the reason that KMD was not allocating memory wash this ttm_global limit that is shared
> with all devices using TTM.
> 

I'm reviewing this series and starting make sense of all this.

Thomas please correct me if I'm wrong here...

The limit set in ttm_global_init is the watermark for the TTM pool where
if exceeded upon freeing a BO's pages the pages are actually freed
rather than just returning to the TTM pool cache. The global watermark
is reason why in issue #2438 it observed a bunch of memory is still
consumed when nothing is running or any BOs exist - pages are being
cached in the TTM pool. The global watermark doesn't actually limit the
amount system memory TTM can allocate. A shrinker also exists which can
free cached pages in the TTM pool if memory pressure exists or 'echo 3 >
/proc/sys/vm/drop_caches' is done.

The watermark changed in this patch, is the actual limit for the number
of pages we can allocate for BOs. With a shrinker hooked into BOs, we
now can freely allocate all of the system pages for BOs and if memory
pressure exists idle BOs pages are swapped to shmem via the shrinker and
restored upon next GPU use.

Matt

> > 
> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_ttm_sys_mgr.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> > index 9844a8edbfe1..d38b91872da3 100644
> > --- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> > +++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> > @@ -108,9 +108,8 @@ int xe_ttm_sys_mgr_init(struct xe_device *xe)
> >  	u64 gtt_size;
> >  
> >  	si_meminfo(&si);
> > +	/* Potentially restrict amount of TT memory here. */
> >  	gtt_size = (u64)si.totalram * si.mem_unit;
> > -	/* TTM limits allocation of all TTM devices by 50% of system memory */
> > -	gtt_size /= 2;
> >  
> >  	man->use_tt = true;
> >  	man->func = &xe_ttm_sys_mgr_func;
> 
