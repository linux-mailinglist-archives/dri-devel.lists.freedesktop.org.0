Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6123C72C2BE
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 13:23:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 602C410E03E;
	Mon, 12 Jun 2023 11:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D18710E03E
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 11:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686569023; x=1718105023;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=v6WIYfBmviVtb79NEHKQ6F5KFUBdjoanxCP9WnvG5zw=;
 b=PwBXVmlb1UppoC5txzKpA7I24pKEsnGUHIQ+TL9Z5bgvLDnuzpIVwjSz
 ATB8FWBLgv63CsEQKCvvA61955NAL460FbNJvMIX1qneGB1ra1kyO3/Gb
 J4CzCkrJVFh9DTkfZct4Q/MGCvLqsX6U70RB+H9zCwDGRIbRxXQquz7A+
 n8Lr+divOrj6OV9iYqL7AP7RDE53e0GZe/Tzdq1qyvNBOjJ8IUqaNastc
 oTLF9L2leBAcmH5ROTGFEAJqdkuJodD30tkZB10+ENrsXNIZTX57v03Ze
 DcLYZcJEjaYq7tnIWvlrokpYqpdQHNxa/nbQcH3HVNZWPGP3hWPCKdYjr w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="356896029"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="356896029"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 04:23:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="776326104"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="776326104"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 12 Jun 2023 04:22:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 12 Jun 2023 04:22:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 12 Jun 2023 04:22:46 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 12 Jun 2023 04:22:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cW5+Zda7EDgKDerlqEkam2SBzPesDOa2WOOKlEx4RhU2UWAEOY2WHQ+p0DD62o00Dc9bGnc+4YU1JXJp703wXQEAOPZxbs71jFvTAqtzaauO9oLNSpTZhdu7PkaIg9TKN0F251YJUwYiaN7UM2vNqCEEO2W+RK2IA3W9DF2P4oSPh0Xgma6RCatfjeXmEIQ1Db9WD5bnBygzQkcx/FTiHUV3MpzMcpE/TtI6L+ikg+mXneOGM+jKp+n0fQJ97NzKuFLCvq4cJ8ypzIeQeZGQf4eSK+8yydSHNo9A4TKiQPTAxV46OS6rdOJCIhIoivbZmukaAd54twU8Xn0cVEgNQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fTviW1HxUfjAOlqP6oeHPQs6RD0Pe6YvWtwW00YhPiI=;
 b=mfM/antflh5aLaFRhHSG3WKVsBHoqPMBleMnLhoFrBAbQ9/feoZZ7qXiEKkbxH0UGsOcWf/I+ubFgTIo6wGZZ0ruH7nFiEDwOVQzmr0Uc3/R2G5FQh7v8zFlzsFbP6OKPSJDO3uBD5r/M0rGKNAJl4ReLOTfqBrg9QMq1TETNnjvAvUBptnYxOCmwl0S5K8O9IBK/SI1O4SRNKtPRIjMYedbi5zicedqO3Ur75x1NKYVB+wrAgDiCwpWDzgAWK+Czq+nD5KnyJXY9kEVv5n4o8jKAvyxrZqEdk+crEZlLn42rqodUrHBZGkLznl6Vbe+BZlBz2WtcAKkkPwhz82Cmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by DS0PR11MB8183.namprd11.prod.outlook.com (2603:10b6:8:161::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.39; Mon, 12 Jun
 2023 11:22:44 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::74d2:5fa6:b6e5:7c63]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::74d2:5fa6:b6e5:7c63%6]) with mapi id 15.20.6455.037; Mon, 12 Jun 2023
 11:22:43 +0000
Message-ID: <b08037ef-156c-0f5d-1fde-e2c55d7655fb@intel.com>
Date: Mon, 12 Jun 2023 13:22:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH 3/3] drm/ttm/tests: Add tests for ttm_pool
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <cover.1686563485.git.karolina.stolarek@intel.com>
 <042feb7cc902f7fd78daf131a691d4afc14d3d8c.1686563485.git.karolina.stolarek@intel.com>
Content-Language: en-US
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <042feb7cc902f7fd78daf131a691d4afc14d3d8c.1686563485.git.karolina.stolarek@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::14) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|DS0PR11MB8183:EE_
X-MS-Office365-Filtering-Correlation-Id: ab8c0c28-a7f7-4ef7-c94c-08db6b3756f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3yxXa1omnSJcFUcEAyEivZj/2J5Yy0HsoGessaA6oes9AVBxtiiG98C55nAAcMnTWq3GaOXNlCZbu8fOyJCSH8KNPcu56sN+ih5EQYXM6zdU2x9xltT+lAeM0NfbZDpPLlonjJGJv3XCQ/KHN/x4AAOEeEPEXP3leA7GPYRFRSDN68RTmM5S/Wdb8cGJHL2iDnjHgpY5VLhnj+kqfpv55c0O3YV4jIVtvTSNPXxbsmRk/5cKlLeyunqh3wmcUP1oAhKWV3ZMqFNZXrEwsnvFNalp6Dv7KEf2NHLXcdUEQzG7zrpwc4aXgOficqG4wcrrJOAhNDjw4w97nuC49/9rMLHsJG8+EXScCCIlK9XCy7hHaV8bQqLF0grXMwTVrX9Yohs7als5yamhaVxqfFSu00rcGdeIf/MAQlUhpMO0ZR06H32RIzWYccqt3LThEG3FLV297E2fNQ7Z9FEmbxTc9q/xZXKnb66Diw6E/Ks23Dnuzehww1L1iDfh7TWHK4Lki6uXOD1bA4d9sxGIAG5X2kuDL8C28LzQFrMhSSM53edarreNLcrw4eIERiW7DtN1o3AHX+kZcVSJQJi++tTWZXpWDr/3IJTYO4Ugw5oVOewQPOs63VIsbWnV6Q2fodbBnKn2gVeeCrjU9CyD/o/pXA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(396003)(136003)(366004)(346002)(451199021)(30864003)(2906002)(478600001)(5660300002)(41300700001)(44832011)(54906003)(316002)(8676002)(8936002)(66476007)(4326008)(66556008)(6486002)(6916009)(31686004)(36916002)(66946007)(6666004)(2616005)(6506007)(26005)(6512007)(53546011)(186003)(82960400001)(83380400001)(36756003)(38100700002)(86362001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVY0RUQ2TFpFOTdyTFRvVDFieHpvbDU4dVZ3aUdpMzkyNGYrejAxSjhuNzhP?=
 =?utf-8?B?V0lXVEdoWjRVMlZzUzlNaWlua3BqdnRFNDh0N2h4UkpXQVR5NmhReXQxc2Ev?=
 =?utf-8?B?aWhkclF1bHRaa2E5cGYwb2dhVWg3eXVzekw4d3h0TUNwZko4STIrUE9ERTlt?=
 =?utf-8?B?Q2NXL0U2VWNqdDBqeDdUWWhIL1NLL0ZEU3Z6SUltaWFUUnRFNkYySkk1THhE?=
 =?utf-8?B?V01ITEFHNWJic2RPbHlxMTA5dmZucmNrdkk3ckhDTkJOVkxuTFFJZithVDQz?=
 =?utf-8?B?amc3NktTTVp2Rkw5SXBBbU9YbW5kVmhRMXcwaHpaT25RTlV4VXMyRjBJQ3BR?=
 =?utf-8?B?aGExcWh2bFBHaUxGeDA0VDl4bjREUnBvUmxVdUNtNjZzSXJGWU14WEcyQVlj?=
 =?utf-8?B?aDRRc2tzOHVEeGdnK0tYN1UrRzVBWjA4N3ViUmVGS1dMV2IwTGI0SCtYb3Bp?=
 =?utf-8?B?ZFdWS0RqL3dLOTkxY3NPZk1LMFIxcm42Rmt4WklHeGI1K1Z4UWZ6MjIxWEk1?=
 =?utf-8?B?YU01enA1ZFhaMUMxMlMxSE95VS9JTXJRV012YjFyRW5lT25wakZVay9vOXc1?=
 =?utf-8?B?dlVqalBVNUlJdGdrbDA1QmZvSnpyYjMyVFQyRFlORFl1cDA4U0REMk4zOWly?=
 =?utf-8?B?WTRrM1ZMSERSa0tTTDlzUi9aZ1RJQ0hiK3JDbG41bUVJVVZTWERKK2VjcUJN?=
 =?utf-8?B?bGJrTExKMFFFNGdvekF3VXVZK3lMTEJoNWhqSW9WcURNdnlOME1FVXRDSnI1?=
 =?utf-8?B?emp6amh0NnNET09SQ1ZMSFJsdUJKYURLbkppQnczclVjQnBCczZPdXd6Sk9P?=
 =?utf-8?B?OS8vK09IY0JveHA4Y2J3dWZ1VDZ5SW4wNmNNQkpMVU44MVMra3ppL002djY2?=
 =?utf-8?B?cHZoczF1cnBPcjQrMWovdWczRzBNeWp2Qmczc1FVbGJpeDhkMHR0UHJUY29w?=
 =?utf-8?B?R0JNaExOYXh6UGYyQUpHenEvUGs1ekVlRy9US0NwZm5iN3dhV3AzYVlvWFFV?=
 =?utf-8?B?b1p3bzFHeWV0ZmhIaFJPNmF6dS9vMytYdE11aFBDZU12VWtQV0o3aEVzSWpx?=
 =?utf-8?B?ZFVYdml5VWdrOWoyOTdhSGR5SERXamlIL3libEpRaVYwSkQ1RlM2YnNRR2pn?=
 =?utf-8?B?ZlhRQ2syZEFmNlBaOWVjcGtya2Q2SUpOWktncEwxVXR6Yk1uTDUvQXExQ2Fm?=
 =?utf-8?B?bW1EcTQwM1R2ckNzOSswVXFTbmdhUDVVeDVBMEowQW1rdjZxc3RWR2kxNFNZ?=
 =?utf-8?B?cUJHR2pGc2t1WUFOZFJKNHAycTlJdkkyM1Z4RU02VHB4NktjbEM2Zll3aG9n?=
 =?utf-8?B?MFg1TlI3M2ZyQzI1dnJxSVE5WlNXMitSU1hicHZIQ3czNHpWbGdsRlVyY2dV?=
 =?utf-8?B?bWwrSjBEQnI2VXFmVG9BRWxnNDR3UlBjWWZoUVZYU3B3OVZIZmErQ0trUzlE?=
 =?utf-8?B?MDArMEZ3Mndhc09FQWdmRFFFZzVNSDhIV2Z0UWg3N0JxS1dSS1FJZUJMbTVl?=
 =?utf-8?B?RkJVc1hIUWxhWk51aVVlaHd1VzlPckNxTmZsR2JSbEhqZVZEWFlleHRqUXpt?=
 =?utf-8?B?cE5STFlnb2xCbTVrTFlOblRNc0pCVW5VM3hjbUpZN1VlNmt2Mms1OWZ0aEEy?=
 =?utf-8?B?ZEdyVTBsNEYzQXZhM2E5QWRCY01ZUmNNano2QWN6VVRseW5MRXBBVlp5V1dK?=
 =?utf-8?B?OVZWZ1p4QVFCYUk1a0Nma05VNjNxdHh5Rlh2NmNMcXd1TnpEMStuVytmQXlC?=
 =?utf-8?B?SXlsZkVJdkdOcU1wMGF5SnZQY3hhY21TZnVxSEl6blJxRzB6REwxRU94Ty9P?=
 =?utf-8?B?L09wc0k3Q1kyS29pb0dWc25VaGNab3pLcDNObFh0bnIzVFVzaHJNOEZZOXY2?=
 =?utf-8?B?c2NvUUlUMUVSaVA1L3EySDdKMStCRXJaVlhHTFJXMHI4NVNVcUx4YldHV0xx?=
 =?utf-8?B?QUc2RTZtaUhkei9rODZPWlB0ZGxxZU5TMExLMXJrSE8rNWUrTzhjWVRmRVc2?=
 =?utf-8?B?TXROY3QzZUNHdlE3Vmo3ZUtEY2t0ajhZMjA3OHFvSVltSTlVaFdNWksvZGlV?=
 =?utf-8?B?UWIxR0d6MUc2TkY5V3RhSVRHeHBiRFRIMXdlNVFRVDNSUHNxL1V4MkI4ZTNJ?=
 =?utf-8?B?eTZQS2FnSXY0a2Z4QWlUa3Z5Rm0vcE5wZHdtM1RDRTZyUDlaVThLM3pqajht?=
 =?utf-8?B?d3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab8c0c28-a7f7-4ef7-c94c-08db6b3756f4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 11:22:43.2279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tX0swUWIuvO+daJPtHWjnjSNKhPwszNOYYMBd5GR/pAc3gCzlO2swd+3bVeKd1GlGjjjVn1vk91ezYUQJTDLtWZdlNnEe1Yy3q6kJSeBgY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8183
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Shuah Khan <shuah@kernel.org>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

I have a question about how ttm_pool_alloc should handle a request for 
order > MAX_ORDER. Could you take a look at my comment below? Thanks a lot.

On 12.06.2023 12:55, Karolina Stolarek wrote:
> Add KUnit tests that exercise page allocation using page pools
> and freeing pages, either by returning them to the pool or
> freeing them. Add a basic test for ttm_pool cleanup. Introduce
> helpers to create a dummy ttm_buffer_object.
> 
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> ---
>   drivers/gpu/drm/ttm/tests/Makefile            |   1 +
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  27 ++
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   5 +
>   drivers/gpu/drm/ttm/tests/ttm_pool_test.c     | 401 ++++++++++++++++++
>   4 files changed, 434 insertions(+)
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_pool_test.c
> 
> diff --git a/drivers/gpu/drm/ttm/tests/Makefile b/drivers/gpu/drm/ttm/tests/Makefile
> index 7917805f37af..ec87c4fc1ad5 100644
> --- a/drivers/gpu/drm/ttm/tests/Makefile
> +++ b/drivers/gpu/drm/ttm/tests/Makefile
> @@ -2,4 +2,5 @@
>   
>   obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += \
>           ttm_device_test.o \
> +        ttm_pool_test.o \
>           ttm_kunit_helpers.o
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> index d848c2372db9..f1b5df61e0bf 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> @@ -24,6 +24,33 @@ int ttm_kunit_helper_alloc_device(struct kunit *test,
>   	return err;
>   }
>   
> +struct ttm_buffer_object *ttm_kunit_helper_ttm_bo_init(struct kunit *test,
> +						       size_t size)
> +{
> +	struct ttm_test_devices_priv *priv = test->priv;
> +	struct drm_gem_object *gem_obj;
> +	struct ttm_buffer_object *bo;
> +
> +	gem_obj = kunit_kzalloc(test, sizeof(*gem_obj), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, gem_obj);
> +
> +	drm_gem_private_object_init(priv->drm, gem_obj, size);
> +
> +	bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, bo);
> +
> +	bo->sg = NULL;
> +	bo->base = *gem_obj;
> +
> +	return bo;
> +}
> +
> +void ttm_kunit_helper_ttm_bo_fini(struct ttm_buffer_object *bo)
> +{
> +	drm_gem_object_release(&bo->base);
> +	ttm_bo_put(bo);
> +}
> +
>   int ttm_test_devices_init(struct kunit *test)
>   {
>   	struct ttm_test_devices_priv *priv;
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> index 69fb03b9c4d2..abb8279f18c7 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> @@ -7,6 +7,7 @@
>   
>   #include <drm/drm_drv.h>
>   #include <drm/ttm/ttm_device.h>
> +#include <drm/ttm/ttm_bo.h>
>   
>   #include <drm/drm_kunit_helpers.h>
>   #include <kunit/test.h>
> @@ -23,6 +24,10 @@ int ttm_kunit_helper_alloc_device(struct kunit *test,
>   				  bool use_dma_alloc,
>   				  bool use_dma32);
>   
> +struct ttm_buffer_object *ttm_kunit_helper_ttm_bo_init(struct kunit *test,
> +						       size_t size);
> +void ttm_kunit_helper_ttm_bo_fini(struct ttm_buffer_object *bo);
> +
>   int ttm_test_devices_init(struct kunit *test);
>   void ttm_test_devices_fini(struct kunit *test);
>   
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
> new file mode 100644
> index 000000000000..c95d3df023f3
> --- /dev/null
> +++ b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
> @@ -0,0 +1,401 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +#include <linux/mm.h>
> +
> +#include <drm/ttm/ttm_tt.h>
> +#include <drm/ttm/ttm_pool.h>
> +
> +#include <ttm_kunit_helpers.h>
> +
> +struct ttm_pool_test_case {
> +	const char *description;
> +	unsigned int order;
> +	bool use_dma_alloc;
> +};
> +
> +static struct ttm_operation_ctx simple_ctx = {
> +	.interruptible = true,
> +	.no_wait_gpu = false,
> +};
> +
> +static struct ttm_tt *mock_ttm_tt_init(struct kunit *test,
> +				       uint32_t page_flags,
> +				       enum ttm_caching caching,
> +				       size_t size)
> +{
> +	struct ttm_tt *tt;
> +	struct ttm_buffer_object *bo;
> +	int err;
> +
> +	bo = ttm_kunit_helper_ttm_bo_init(test, size);
> +	KUNIT_ASSERT_NOT_NULL(test, bo);
> +
> +	tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, tt);
> +
> +	err = ttm_tt_init(tt, bo, page_flags, caching, 0);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +
> +	/* We don't need this BO later, release it */
> +	ttm_kunit_helper_ttm_bo_fini(bo);
> +
> +	return tt;
> +}
> +
> +static struct ttm_pool *ttm_pool_pre_populated(struct kunit *test,
> +					       size_t size,
> +					       enum ttm_caching caching)
> +{
> +	struct ttm_test_devices_priv *priv = test->priv;
> +	struct ttm_pool *pool;
> +	struct ttm_tt *tt;
> +	int err;
> +	unsigned long order = __fls(size / PAGE_SIZE);
> +
> +	tt = mock_ttm_tt_init(test, order, caching, size);
> +	KUNIT_ASSERT_NOT_NULL(test, tt);
> +
> +	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, pool);
> +
> +	ttm_pool_init(pool, priv->dev, true, false);
> +
> +	err = ttm_pool_alloc(pool, tt, &simple_ctx);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +
> +	ttm_pool_free(pool, tt);
> +	ttm_tt_fini(tt);
> +
> +	return pool;
> +}
> +
> +static const struct ttm_pool_test_case ttm_pool_basic_cases[] = {
> +	{
> +		.description = "One page",
> +		.order = 0,
> +	},
> +	{
> +		.description = "More than one page",
> +		.order = 2,
> +	},
> +	{
> +		.description = "Above the allocation limit",
> +		.order = MAX_ORDER + 1,
> +	},
> +	{
> +		.description = "One page, with coherent DMA mappings enabled",
> +		.order = 0,
> +		.use_dma_alloc = true,
> +	},
> +	{
> +		.description = "Above the allocation limit, with coherent DMA mappings enabled",
> +		.order = MAX_ORDER + 1,
> +		.use_dma_alloc = true,
> +	},
> +};
> +
> +static void ttm_pool_alloc_case_desc(const struct ttm_pool_test_case *t,
> +				     char *desc)
> +{
> +	strscpy(desc, t->description, KUNIT_PARAM_DESC_SIZE);
> +}
> +
> +KUNIT_ARRAY_PARAM(ttm_pool_alloc_basic, ttm_pool_basic_cases,
> +		  ttm_pool_alloc_case_desc);
> +
> +static void ttm_pool_alloc_basic(struct kunit *test)
> +{
> +	struct ttm_test_devices_priv *priv = test->priv;
> +	const struct ttm_pool_test_case *params = test->param_value;
> +	struct ttm_tt *tt;
> +	struct ttm_pool *pool;
> +	struct page *fst_page, *last_page;
> +	int err;
> +	enum ttm_caching caching = ttm_uncached;
> +	unsigned int expected_num_pages = 1 << params->order;
> +	size_t size = expected_num_pages * PAGE_SIZE;
> +
> +	tt = mock_ttm_tt_init(test, 0, caching, size);
> +	KUNIT_ASSERT_NOT_NULL(test, tt);
> +
> +	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, pool);
> +
> +	ttm_pool_init(pool, priv->dev, params->use_dma_alloc, false);
> +
> +	err = ttm_pool_alloc(pool, tt, &simple_ctx);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +	KUNIT_ASSERT_EQ(test, tt->num_pages, expected_num_pages);
> +
> +	fst_page = tt->pages[0];
> +	last_page = tt->pages[tt->num_pages - 1];
> +
> +	if (params->order <= MAX_ORDER) {
> +		if (params->use_dma_alloc) {
> +			KUNIT_ASSERT_NOT_NULL(test, (void *)fst_page->private);
> +			KUNIT_ASSERT_NOT_NULL(test, (void *)last_page->private);
> +		} else {
> +			KUNIT_ASSERT_EQ(test, fst_page->private, params->order);

For order = 2 case, I expected the private payload for the last page to 
be equal 2, but it was 0. Is my test setup wrong, or am I 
misunderstanding something?

> +		}
> +	} else {
> +		if (params->use_dma_alloc) {
> +			KUNIT_ASSERT_NOT_NULL(test, (void *)fst_page->private);
> +			KUNIT_ASSERT_NULL(test, (void *)last_page->private);

It makes sense that we don't DMA alloc here, but I wonder if we should 
at least warn that there are pages with no dma addresses. We asked for 
coherent mappings and that condition couldn't be satisfied. Maybe this 
is expected, just wanted to double-check.

All the best,
Karolina

> +		} else {
> +			/*
> +			 * We expect to alloc one big block, followed by
> +			 * order 0 blocks
> +			 */
> +			KUNIT_ASSERT_EQ(test, fst_page->private,
> +					min_t(unsigned int, MAX_ORDER,
> +					      params->order));
> +			KUNIT_ASSERT_EQ(test, last_page->private, 0);
> +		}
> +	}
> +
> +	ttm_pool_free(pool, tt);
> +	ttm_tt_fini(tt);
> +	ttm_pool_fini(pool);
> +}
> +
> +static void ttm_pool_alloc_basic_dma_addr(struct kunit *test)
> +{
> +	struct ttm_test_devices_priv *priv = test->priv;
> +	const struct ttm_pool_test_case *params = test->param_value;
> +	struct ttm_tt *tt;
> +	struct ttm_pool *pool;
> +	struct ttm_buffer_object *bo;
> +	dma_addr_t dma1, dma2;
> +	int err;
> +	enum ttm_caching caching = ttm_uncached;
> +	unsigned int expected_num_pages = 1 << params->order;
> +	size_t size = expected_num_pages * PAGE_SIZE;
> +
> +	tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, tt);
> +
> +	bo = ttm_kunit_helper_ttm_bo_init(test, size);
> +	KUNIT_ASSERT_NOT_NULL(test, bo);
> +
> +	err = ttm_sg_tt_init(tt, bo, 0, caching);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +
> +	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, pool);
> +
> +	ttm_pool_init(pool, priv->dev, true, false);
> +
> +	err = ttm_pool_alloc(pool, tt, &simple_ctx);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +	KUNIT_ASSERT_EQ(test, tt->num_pages, expected_num_pages);
> +
> +	dma1 = tt->dma_address[0];
> +	dma2 = tt->dma_address[tt->num_pages - 1];
> +
> +	KUNIT_ASSERT_NOT_NULL(test, (void *)dma1);
> +	KUNIT_ASSERT_NOT_NULL(test, (void *)dma2);
> +
> +	ttm_pool_free(pool, tt);
> +	ttm_tt_fini(tt);
> +	ttm_pool_fini(pool);
> +}
> +
> +static void ttm_pool_alloc_order_caching_match(struct kunit *test)
> +{
> +	struct ttm_tt *tt;
> +	struct ttm_pool *pool;
> +	struct ttm_pool_type *pt;
> +	enum ttm_caching caching = ttm_uncached;
> +	unsigned int order = 0;
> +	size_t size = PAGE_SIZE;
> +	int err;
> +
> +	pool = ttm_pool_pre_populated(test, size, caching);
> +
> +	pt = &pool->caching[caching].orders[order];
> +	KUNIT_ASSERT_FALSE(test, list_empty(&pt->pages));
> +
> +	tt = mock_ttm_tt_init(test, 0, caching, size);
> +	KUNIT_ASSERT_NOT_NULL(test, tt);
> +
> +	err = ttm_pool_alloc(pool, tt, &simple_ctx);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +
> +	KUNIT_ASSERT_TRUE(test, list_empty(&pt->pages));
> +
> +	ttm_pool_free(pool, tt);
> +	ttm_tt_fini(tt);
> +	ttm_pool_fini(pool);
> +}
> +
> +static void ttm_pool_alloc_caching_mismatch(struct kunit *test)
> +{
> +	struct ttm_tt *tt;
> +	struct ttm_pool *pool;
> +	struct ttm_pool_type *pt_pool, *pt_tt;
> +	int err;
> +	enum ttm_caching tt_caching = ttm_uncached;
> +	enum ttm_caching pool_caching = ttm_cached;
> +	size_t size = PAGE_SIZE;
> +	unsigned int order = 0;
> +
> +	pool = ttm_pool_pre_populated(test, size, pool_caching);
> +
> +	pt_pool = &pool->caching[pool_caching].orders[order];
> +	pt_tt = &pool->caching[tt_caching].orders[order];
> +
> +	tt = mock_ttm_tt_init(test, 0, tt_caching, size);
> +	KUNIT_ASSERT_NOT_NULL(test, tt);
> +
> +	KUNIT_ASSERT_FALSE(test, list_empty(&pt_pool->pages));
> +	KUNIT_ASSERT_TRUE(test, list_empty(&pt_tt->pages));
> +
> +	err = ttm_pool_alloc(pool, tt, &simple_ctx);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +
> +	ttm_pool_free(pool, tt);
> +	ttm_tt_fini(tt);
> +
> +	KUNIT_ASSERT_FALSE(test, list_empty(&pt_pool->pages));
> +	KUNIT_ASSERT_FALSE(test, list_empty(&pt_tt->pages));
> +
> +	ttm_pool_fini(pool);
> +}
> +
> +static void ttm_pool_alloc_order_mismatch(struct kunit *test)
> +{
> +	struct ttm_tt *tt;
> +	struct ttm_pool *pool;
> +	struct ttm_pool_type *pt_pool, *pt_tt;
> +	int err;
> +	enum ttm_caching caching = ttm_uncached;
> +	unsigned int order = 2;
> +	size_t fst_size = (1 << order) * PAGE_SIZE;
> +	size_t snd_size = PAGE_SIZE;
> +
> +	pool = ttm_pool_pre_populated(test, fst_size, caching);
> +
> +	pt_pool = &pool->caching[caching].orders[order];
> +	pt_tt = &pool->caching[caching].orders[0];
> +
> +	tt = mock_ttm_tt_init(test, 0, caching, snd_size);
> +	KUNIT_ASSERT_NOT_NULL(test, tt);
> +
> +	KUNIT_ASSERT_FALSE(test, list_empty(&pt_pool->pages));
> +	KUNIT_ASSERT_TRUE(test, list_empty(&pt_tt->pages));
> +
> +	err = ttm_pool_alloc(pool, tt, &simple_ctx);
> +	KUNIT_ASSERT_EQ(test, err, 0);
> +
> +	ttm_pool_free(pool, tt);
> +	ttm_tt_fini(tt);
> +
> +	KUNIT_ASSERT_FALSE(test, list_empty(&pt_pool->pages));
> +	KUNIT_ASSERT_FALSE(test, list_empty(&pt_tt->pages));
> +
> +	ttm_pool_fini(pool);
> +}
> +
> +static void ttm_pool_free_dma_alloc(struct kunit *test)
> +{
> +	struct ttm_test_devices_priv *priv = test->priv;
> +	struct ttm_tt *tt;
> +	struct ttm_pool *pool;
> +	struct ttm_pool_type *pt;
> +	enum ttm_caching caching = ttm_uncached;
> +	unsigned int order = 2;
> +	size_t size = (1 << order) * PAGE_SIZE;
> +
> +	tt = mock_ttm_tt_init(test, 0, caching, size);
> +	KUNIT_ASSERT_NOT_NULL(test, tt);
> +
> +	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, pool);
> +
> +	ttm_pool_init(pool, priv->dev, true, false);
> +	ttm_pool_alloc(pool, tt, &simple_ctx);
> +
> +	pt = &pool->caching[caching].orders[order];
> +	KUNIT_ASSERT_TRUE(test, list_empty(&pt->pages));
> +
> +	ttm_pool_free(pool, tt);
> +	ttm_tt_fini(tt);
> +
> +	KUNIT_ASSERT_FALSE(test, list_empty(&pt->pages));
> +
> +	ttm_pool_fini(pool);
> +}
> +
> +static void ttm_pool_free_no_dma_alloc(struct kunit *test)
> +{
> +	struct ttm_test_devices_priv *priv = test->priv;
> +	struct ttm_tt *tt;
> +	struct ttm_pool *pool;
> +	struct ttm_pool_type *pt;
> +	enum ttm_caching caching = ttm_uncached;
> +	unsigned int order = 2;
> +	size_t size = (1 << order) * PAGE_SIZE;
> +
> +	tt = mock_ttm_tt_init(test, 0, caching, size);
> +	KUNIT_ASSERT_NOT_NULL(test, tt);
> +
> +	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, pool);
> +
> +	ttm_pool_init(pool, priv->dev, false, false);
> +	ttm_pool_alloc(pool, tt, &simple_ctx);
> +
> +	pt = &pool->caching[caching].orders[order];
> +	KUNIT_ASSERT_TRUE(test, list_is_singular(&pt->pages));
> +
> +	ttm_pool_free(pool, tt);
> +	ttm_tt_fini(tt);
> +
> +	KUNIT_ASSERT_TRUE(test, list_is_singular(&pt->pages));
> +
> +	ttm_pool_fini(pool);
> +}
> +
> +static void ttm_pool_fini_basic(struct kunit *test)
> +{
> +	struct ttm_pool *pool;
> +	struct ttm_pool_type *pt;
> +	enum ttm_caching caching = ttm_uncached;
> +	unsigned int order = 0;
> +	size_t size = PAGE_SIZE;
> +
> +	pool = ttm_pool_pre_populated(test, size, caching);
> +	pt = &pool->caching[caching].orders[order];
> +
> +	KUNIT_ASSERT_FALSE(test, list_empty(&pt->pages));
> +
> +	ttm_pool_fini(pool);
> +
> +	KUNIT_ASSERT_TRUE(test, list_empty(&pt->pages));
> +}
> +
> +static struct kunit_case ttm_pool_test_cases[] = {
> +	KUNIT_CASE_PARAM(ttm_pool_alloc_basic, ttm_pool_alloc_basic_gen_params),
> +	KUNIT_CASE_PARAM(ttm_pool_alloc_basic_dma_addr,
> +			 ttm_pool_alloc_basic_gen_params),
> +	KUNIT_CASE(ttm_pool_alloc_order_caching_match),
> +	KUNIT_CASE(ttm_pool_alloc_caching_mismatch),
> +	KUNIT_CASE(ttm_pool_alloc_order_mismatch),
> +	KUNIT_CASE(ttm_pool_free_dma_alloc),
> +	KUNIT_CASE(ttm_pool_free_no_dma_alloc),
> +	KUNIT_CASE(ttm_pool_fini_basic),
> +	{}
> +};
> +
> +static struct kunit_suite ttm_pool_test_suite = {
> +	.name = "ttm_pool",
> +	.init = ttm_test_devices_init,
> +	.exit = ttm_test_devices_fini,
> +	.test_cases = ttm_pool_test_cases,
> +};
> +
> +kunit_test_suites(&ttm_pool_test_suite);
> +
> +MODULE_LICENSE("GPL");
