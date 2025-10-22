Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE0ABFC213
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 15:27:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6BA910E781;
	Wed, 22 Oct 2025 13:27:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ed8aSUFY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A91F10E780;
 Wed, 22 Oct 2025 13:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761139653; x=1792675653;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QaGCTTwMC87Qqxx/PWfI7m+TzZiPqjea7ACC3vB9t28=;
 b=Ed8aSUFYdSu0WcLkhXzLFOfWrWJ+wd6mBMzUvAjnXcKgL17tg4A5jqSG
 cwUwrBPKZP8wgaCU1bydT7R1lhgmkXuydCn7n0qw06FltbRVR0dyUlduS
 F0pgHSSa5KIkxfea7njKlOGS/Ta5iwKiPxxcnAN6N7o23hkjdV4w3fXbu
 wnzF+TNKGPngoybaQEZc4cNqHiP/SFwuYDPu8+5BUDkjKCqGWLGask15G
 /59KnLneOdTeCW3fzhsF+23iTQ7E5oymxy5SmY8Ucu9YL+48yPxjsimnM
 O8pTBUuHtxtscIWRQfS/QPaTHVUkFFAtVFaqCSY372s6acq2KbI9Ko2lW Q==;
X-CSE-ConnectionGUID: 6/99h3wgSNeifAwFyV4VhA==
X-CSE-MsgGUID: O9SZteUAQxC1SfMllaiVaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63182406"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="63182406"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 06:27:27 -0700
X-CSE-ConnectionGUID: VQTBHs3KT3m9hTOqwHEScw==
X-CSE-MsgGUID: hjIB8GasReCugnQ9K2NI9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="189150631"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 06:27:27 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 06:27:26 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 06:27:26 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.56) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 06:27:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fy9h6vttiiseL5E2PhYxDtVgqOmmxyiHBOfqAL9PP4XPK7NKVI3yLnBHQG8XT31zpxAi4G9dHMb8s3l94LJnnNRHoU5aBMeQ0xawLPP4nySQYGrvpnoqwUD3fzWhjuy59BAoz7Nmdo6/YRiCIzmYMUETDqzc/+Qhhv0kcrTUfmhrBoYrj4T1DaUQEIz07fwsajXr6v9mQ7tI0MbxxHtJ5gdzHKx5mm9+6eCWEJitptd1+A3yDmcPY5U2i/+P/p3ZbbL0iIFhNPP3av/U2BvcErSCEfDL3VQOtL3cPVS2tG72sFKz5tX06lgbiv+/rVgxPjgY4EzVRJ/BqJZay7joXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5uPzlufGbxpaWvT7S14n6Fh7MXDxvO0OQQhuq3KZdh4=;
 b=kiItWEYx9tw7A9wjFe0qLRbg7QuwDf7bKImqCTheig6lJs4AUcWMgOXerR1Jne4Pey4QNv4RV0GibREYKzJx495foPfUtW4p6hZ6o7P7JcSOiCazkNXZawoZqXMfDz3u/+M63PLRIeFmIyJtiOQffVklCLupN4KwkyqxtI8lYit/icnmA2x70KHQ/f9spP5o0d9w2K4wT/7i6Yiy5jaOT2Aw67a+GvbIVoVXGG7qxF8/enkk0Q1kqxTqEUBFqa0z6Tp6kb/Tg6xXjytxCB/2KNvPtzGJjmtmWXA6dlU1mjRFwM8btxuAIcmpVMPSLE2LdNlABDg+gpXT2b0PE0UPrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SA2PR11MB4922.namprd11.prod.outlook.com (2603:10b6:806:111::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 13:27:23 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 13:27:23 +0000
Date: Wed, 22 Oct 2025 15:27:19 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
CC: Christoph Hellwig <hch@infradead.org>, Alex Williamson
 <alex.williamson@redhat.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>, Yishai Hadas <yishaih@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH v2 26/26] vfio/xe: Add vendor-specific vfio_pci driver
 for Intel graphics
Message-ID: <tqr7r55frkgvdn22rfycm55wni2dnihmhvzxft4xdrjg7laic5@drvc3trbxlrm>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
 <20251021224133.577765-27-michal.winiarski@intel.com>
 <aPiDwUn-D2_oyx2T@infradead.org>
 <ilv4dmjtei7llmoamwdjb3eb32rowzg6lwpjhdtilouoi6hyop@xnpkhbezzbcv>
 <aPib0tHn1yK9qx2x@infradead.org>
 <4e6ctwhyax2v65mgj3pud5z3vz75yputis6oufju45iptzaypq@zaxo42l23o2r>
 <20251022113355.GC21554@ziepe.ca>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251022113355.GC21554@ziepe.ca>
X-ClientProxiedBy: VI1P189CA0012.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::25) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SA2PR11MB4922:EE_
X-MS-Office365-Filtering-Correlation-Id: 40952824-eb41-4ed3-3318-08de116ebc06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V1ptQXh1NWdOQWNkN0UxOGY3VTVEZ0tuYVVuSU82eG04K2tVWVFxMjBGSjZM?=
 =?utf-8?B?ZEdnUjk0NGM1UmY0N01lajdseDd0TTN6RytpOUx1WjhPbmJUUWtuMUpTSVdH?=
 =?utf-8?B?aHNyNjU3SU4vK1F1MjRaenB4akFlT3hqWEJuT25rQWcvdzVaL3B1TVE0VDBS?=
 =?utf-8?B?T0RqMDJ1dXA5eVBDRFBGWmd2cGs3Mkx5ZTF3V3F0dDZHV0FsSlZ3cHRsa1V6?=
 =?utf-8?B?TUppY1hwcW9kS3RNVG1qMW02MWFWMWNRbk1oOXlEMnJpWExZR05WblhNWjNP?=
 =?utf-8?B?THlXcVRId3FVdURxZDAvb1NUOXdySERXb0l0R1R6U2lXUXBRTmpQaVNEaG5L?=
 =?utf-8?B?N1IrbXlLM3hFdjc3MnNNYjdnb1lTeUgwdW40T3JJZlEvVVZ2Q1l6a2M0cmdP?=
 =?utf-8?B?eEw0cGpqOENnc2h2dU1VaFd4a0FMSTFYalJOaHpmb2o3YlNyUUI4TzgxUkc1?=
 =?utf-8?B?VjM3dGowSnFJMUhHRnJUM0xNTUM5TXUwa1orWDdjTkVJd1dPUHMrS3l3TWht?=
 =?utf-8?B?bkVia0tBVjZMN0p1ZWJzVkZhYUdhQ1dKTkZRZWM0OFVlNDR4S3QrZ3EwMXYy?=
 =?utf-8?B?cWU5SUUvbnJXUjhNdWVSb0dwMXpGbG1zRjZYd3ZUcldMYTRLMHZtcXB2YTc2?=
 =?utf-8?B?eVJVSlF6ZEMrMUZ4OUNhM3NuUGdwdVU3akdFVmQvMWNiUWhZdExmOXdnRVdR?=
 =?utf-8?B?a3JDZXFmRmdjOGIzZmZ3Z1ZieVluZ2VkVmlDZ2lwMyszRU91SW5PWTJvM2Zl?=
 =?utf-8?B?VU8rR3ZSTGZNNTkzWi9FejZmYXhITzVINWN6Z000aGl2bCtQVWVOcktkbm1t?=
 =?utf-8?B?RUpjMzl4aFMyTm1kZ3BjRGlBNE9VUzFiVzIzK2lqWDFocERpTGd3MjAvVHlL?=
 =?utf-8?B?UEhodERzUEZRQ0lDR1NUdC9tKzdOaWh2VlVTWVh4RHkwQXFPYytzUUs0dlBN?=
 =?utf-8?B?bTFDQWZDU0M5ak1DZDh3WUtEcnVhcGE3M0Q2SCtUekl4UVBxWTIxMTBhT0ox?=
 =?utf-8?B?NkJJUHFDM1lGcFpLNEs3TFlmMlBMWUdUdnVEWWNvV1RJVTVtV00yRVdlakky?=
 =?utf-8?B?aWxMWmZ4LzB1VUhjZHBmdFV4ZWdVSGozQ1MvWVdsUWZzRjF4V2t4bC9yY3dG?=
 =?utf-8?B?emM4VldqMFJaWUtaZnVBbWRQd1prU0tER0l6aXVrbWRYakNiSjV3cnVVcTQz?=
 =?utf-8?B?REc0MG54VmhLclU2K3FIcDV6eGdhaTF0cVRiWUNpY3krSURJS3hFYlRHVjkw?=
 =?utf-8?B?Vk1EOE5jMnNEamM4d3hzZno3alp6WHRSYkNyT1B5b0E2ZGxXTUVoV1B2M0tM?=
 =?utf-8?B?UnE5UlZVNVhOSkpLR1BHZDVhV29DNzFpaExMVFpZS2FlSHFyRTNaUGFDeXo2?=
 =?utf-8?B?UzJxNU5pOXdNKzJLZy80UXhhVVlSU29lTnVTTUtIYzE4aVZlY2xWM3VRWTI5?=
 =?utf-8?B?Um40RmQ0VGttQVA2UFE1dGJJd1ViZ0wwd1MwSU1jK0VZOEg2Sm1uWUxYMmxQ?=
 =?utf-8?B?L2lwT0FxRVVlakhmVi9tbUVxVWxVblkvRHJpaGlJV0VQL3VnNWJkMUMyTGR3?=
 =?utf-8?B?cGQwT2N5UGZ4eUNibjBKUjlkWlVqMWhkSkczWkJCNlhyVG5zcmdNSnhQUEZB?=
 =?utf-8?B?bElYSHdzRDZFUkd4U1BDRnIzRDFnY2sxNnlqUkg0K0gzZFE5RW9hNEg2SUxG?=
 =?utf-8?B?eThsc1dHMFNPcWpwdEZlUFlwdWJ3WlVQMEw3c1RRM25FWk5xL3ZhSFc5YTBC?=
 =?utf-8?B?NGVjemdYY0l6eWx6eVhnU1FyYjVRV2tKVGFRTDRsdUNHTHFqdHVDT2FsSmJh?=
 =?utf-8?B?TUprQ1pHZUtmVkJTMGtidjNLTGk5VloyQ0JtR1RVR1BLS1pFdmdGeUdLTWUr?=
 =?utf-8?B?RGlFdmdPdjJRMFBpTS9xNEcxVFB2cVVNOXJCaWN4cXlENGdOQ3VuY3JBTkY2?=
 =?utf-8?Q?NCUZa/ObBXi4ULm6ihSI38PiH5b0GXm4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2RYK3ZESUNVQlRmak52YXFpQ1JqYSs0bTdGQW82aXpKcStQN2NVSVdNd1Fu?=
 =?utf-8?B?Qm5UWDJzeVJIMVhESTkvSDgvbVRsWFkrY3R1dm1JcnNCa09OTmllQUNiYzJ1?=
 =?utf-8?B?UTJ3cXdrUVFWN3hKSzNkbWhaNXZuK2xhRHdScWFOb1JidjdKYTBJb0lJWGZw?=
 =?utf-8?B?ajdmeGNWS0FPNWdBOEd2Y3o1OXZEM0h4dHpRWXRVOCtGYjdSUUcxbWROeXEw?=
 =?utf-8?B?TmR3RDhtcm12aEsyNWFkc0ZnUXd5U28raDNWL1FnRXRBUHBva2Q3L1d4TlF1?=
 =?utf-8?B?RE5abm5SYVdreTdOVmRtUkhFaUk2RDlBTmJtUThJZlY0MkRGd09Kc1h6UXFH?=
 =?utf-8?B?Q1Zkd2ZoekJZTkhrVmlEUEliTG91dk9Gc2lUZE8yTnU3ZjdaZW1XdTBabGF6?=
 =?utf-8?B?a01od09tcmhIWnQ2dzhPVDlIV202RFdWWkp5MUdhSTdKVUZWOWJQSTRwSU54?=
 =?utf-8?B?NFZHRkllZnJRUlc3L2ZCRGJQK3A0Ri9ETEsrTC9NUkVKZzVtSTRPQjZSUnQ1?=
 =?utf-8?B?amhQVHVvWGtvVDVZeUJWWWxhSi9uTEd3UVFIcmJWSnJoNmJXVGs1Wi8yOU1T?=
 =?utf-8?B?T2JST04xaUZ0K2t0ZWEvdndPWlNVLzhWQVR6eUMwQVhRQndPOEtPVVJqWGdH?=
 =?utf-8?B?L1pIQ1IvS281KzRJbDU3V3BaUE1peS9qa1lFaXRCeG5NTi9RN2xzaUFVQnFn?=
 =?utf-8?B?NDJkcW9LRWlRTmV4UkhzT1ByUi9vdzJpWWJ4azl5MStobjdGNEdPTDRSbGdK?=
 =?utf-8?B?Zlhxb1d6NGNieWxqa2hWSUhra2dUTWJiSE52OGZyZnNoVlRBZW1jSUs3UVhX?=
 =?utf-8?B?Q3ZyYU9IQk9yYkdSaWQ2bm9aZEpkalg2Zy9IVlZVelF1dHIvK05kblVDNE5T?=
 =?utf-8?B?c1FLT1NhTVZQQ2c5eWxXemVYMm9CVS9QU1g2RTdPNDYxMTVZUStlSE55NStV?=
 =?utf-8?B?VnUzMEptM3lwbWFVcXRuOGF4dFkyZzloVmlyVFBja1N0NVo1NFI4eVhiKzZM?=
 =?utf-8?B?VGxtb2dzNWt0Zm9sZ2llWEczRHZGKzZEQVRyVXluOHV5a1lwS0lRQ0ZYb09N?=
 =?utf-8?B?K0YrVit1RG5MdnB0QnJhUnhSdkxyUjZLUERwdWFDcExBZXFQbFRzMWF4aGdo?=
 =?utf-8?B?UWs0bUZTSFBuZWMvdHBNbS9HSWxvbjRKQk5relFwVWg4d0FHbjhkQzM4aGpy?=
 =?utf-8?B?SEd4eUpBWGEyNm9nZDI2V2FmMEhHa2N3ejNRazdjdUQzV2lkSVlhbE5rYjFE?=
 =?utf-8?B?bjdqeUNkendtd25nS3NRMXlyazcrdXVseU9JZTRPaDBhZHBYQWFOb3NCbDFt?=
 =?utf-8?B?WExQdlRsYndsOHhKckM2TXQ1cTBSYTRiRzRkV3k1N2hkNDh5ZElQcHZwMElw?=
 =?utf-8?B?Nno1cFJqTGdGdFFIcmoxcFBBWGNTaU5tclFnV0FPNk5FZFFwbndObW9XYjlY?=
 =?utf-8?B?eWZ1WVg5YVRwVEhoeGIyRW5lWS9sRUJJcFR5cEFTa3lIZGd6b2V6T1BoYkdC?=
 =?utf-8?B?cHhRUWNZN2ZFNFJ4U3ltZkxvTnc4TlQveFZiTGpOQUF2SDl1WVFGdEV3RVVT?=
 =?utf-8?B?VmhXdGdxaHF6RHBaMTJLOUJFNzc2QjNNcllpU0UrbDl5NFZHTWw5VDRLM0Rs?=
 =?utf-8?B?bTZZd3FnYzk3RUpYY0hma0ZmSXdXYWw2NXVIMWxKVHZ2SVc1VGRaME9xZVk5?=
 =?utf-8?B?cnczSlZ1czJORjA4cXl1R2htMkdMNklNRTk2ZXRHazRRUlFoQWZucGE2cWFL?=
 =?utf-8?B?WTlYR3NMcTJnaHhkbUlxSHhyYXV2TnhSajVLOWNmckljS09vNjQvUGx0V0N6?=
 =?utf-8?B?Q1pJRW9ZVVVJYlBjZzhRZk9RVnZiV2hiWWZydGNmamJkRC9tUGxNdUllRllz?=
 =?utf-8?B?MWpFQ3dLZDJyUnJ3ZlpwZytjQ3hUSkpTS0V5Q3pLY3BqYzhkVkw0R1hQSitB?=
 =?utf-8?B?RXFRQUxFckR6SFlTVE9CMW1CZHFTZXZBUko0dm03bnRua0pJem1qN0grdVUr?=
 =?utf-8?B?cUtPZTdGZFcxbDZ0dDYrWmJmVDlwUGVoVjBBM0IxNzFPUFhjbVAwQlFpajNt?=
 =?utf-8?B?aElKVVpVOXpGRWNJSVd6M21ocDBXYlJQRDJraXBibFR4M1prODFpMzJxREpX?=
 =?utf-8?B?NlFsalE4UFRHd1QrTkRIRllMS0hUNHVHTnMwak05M29SNkt1ZVJ0MEJRQmox?=
 =?utf-8?B?NEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40952824-eb41-4ed3-3318-08de116ebc06
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 13:27:23.6654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lGkLNevtbEVzZ1oXV7eSM2euC+Y10+LGib8/ByssTeMsljpR65mkUlgqptByGMTbJTmuGNl1soHCRTamR5jlsimcPTZSLNUSJppEW8fBvlM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4922
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

On Wed, Oct 22, 2025 at 08:33:55AM -0300, Jason Gunthorpe wrote:
> On Wed, Oct 22, 2025 at 11:12:05AM +0200, Michał Winiarski wrote:
> > On Wed, Oct 22, 2025 at 01:54:42AM -0700, Christoph Hellwig wrote:
> > > On Wed, Oct 22, 2025 at 10:52:34AM +0200, Michał Winiarski wrote:
> > > > On Wed, Oct 22, 2025 at 12:12:01AM -0700, Christoph Hellwig wrote:
> > > > > There is absolutely nothing vendor-specific here, it is a device variant
> > > > > driver.  In fact in Linux basically nothing is ever vendor specific,
> > > > > because vendor is not a concept that does matter in any practical sense
> > > > > except for tiny details like the vendor ID as one of the IDs to match
> > > > > on in device probing.
> > > > > 
> > > > > I have no idea why people keep trying to inject this term again and
> > > > > again.
> > > > 
> > > > Hi,
> > > > 
> > > > The reasoning was that in this case we're matching vendor ID + class
> > > > combination to match all Intel GPUs, and not just selected device ID,
> > > > but I get your point.
> > > 
> > > Which sounds like a really bad idea.  Is this going to work on i810
> > > devices?  Or the odd parts povervr based parts?
> > 
> > It's using .override_only = PCI_ID_F_VFIO_DRIVER_OVERRIDE, so it only
> > matters if the user was already planning to override the regular driver
> > with VFIO one (using driver_override sysfs).
> > So if it worked on i810 or other odd parts using regular vfio-pci, it
> > would work with xe-vfio-pci, as both are using the same underlying
> > functions provided by vfio-pci-core.
> 
> I also would rather see you list the actual working PCI IDs :|
> 
> Claiming all class devices for a vendor_id is something only DRM
> does..

We already have all of the device IDs in include/drm/intel/pciids.h
So it's just a matter of adding a helper that sets an override and
including it and using a subset of ID.

I'll do that instead of matching on class.

Thanks,
-Michał

> 
> Jason
