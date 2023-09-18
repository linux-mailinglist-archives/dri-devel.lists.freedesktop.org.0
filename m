Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 299AE7A4A7A
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 15:04:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E86810E27E;
	Mon, 18 Sep 2023 13:04:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 550CC10E27E
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 13:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695042290; x=1726578290;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IBPSolL1RMd1ZFrRQ/VonPyAO1SFcL4JwS3vlTuvOmM=;
 b=cVY4GrVL2LRnl5haU8eunea+dZL7rrNTaQB2MoSSqfgZuFdppQCKFh3u
 wwhWiospMt0gPk7WDI9eya9cc3zT89go0hj2SsRVxgvyx6q99+HUdS/gW
 x1tskqh767QR4srAJ9P9ebELo48bmZvKu9GbgIBPSNcgs2btNgE8KuOhS
 znnSEEpwPcankBoYP4PAiP7TvTKPz93mHWIh4x+4kDdU5rjRbOaD/x+x8
 l/KOegFq2sGC6y7u8TbQk6XooiEWXuwKKtSM/34xKcE3Knpx0cszofWbW
 bcQ2kaEOOAJUOl4ly2GbIf++X5cPJYP8zeXJkU6YFXk03O7ET5XjUeIOe g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="410601787"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="410601787"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 06:04:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="775124497"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="775124497"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2023 06:04:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 18 Sep 2023 06:04:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 18 Sep 2023 06:04:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 18 Sep 2023 06:04:46 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 18 Sep 2023 06:04:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l6Lb23lD0/FEOHxAHBbjH+1g4K8K00UOmUUkl1CsUFQcNTdqEf7pondQCuYPAob+8ftN9cE0/4A95AuzxcXzxpvc9OkzYJ3mkOSvfcS4wAu86BniV9rvrp/JvlVWbtQ3SWKOalmz4U6XoRSBCBsHIeBBxSm+FGm4uD14WBzn0GDO0AYMEsQR1hoqMB15YkG4AvH/5h1Dwtkdf/vOFK+yt3nU7nPAlVOXdiwj3HCbFNNfARWEvP8baS3VA2pWrAhF7/pUw7jx1NnNGxKZ151t5V6U7YJV3kEEvvlUIKXPsBpSpTVTmfkagLXh+LAyZwD/ji3F6AHdF34Tpr/EyuVPHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RpPMj/yqFjWoSN+vR0dJR3KGqbPj0zq1KZ+tH9a0MGo=;
 b=a6B16G6eovyITi79hgdzZo/MXMZ+AGRZb16YeMup7p5IhNK6YuKLdEvs5x0xPh9M675s4qgmL60npt74lTwGuQcXEDNOcpdNl/2yOLWxpEYeBYCxz2JazBlkFu/buPwgInTskbd7FkHqevUt61LPQbyKBpyLa/dwPxK55L5qQQ3s/2l93T0hWTFQIB5SKeb6Wmk0GcZzoltvc0cTu89BD1bEqFbN/YCeYxiHWbSPhyzhMoZ0FPpyTgc33u8vMOIW0uwBela4/Oq44n0QXbk2lt3cqwFpPPW42/kLZmAdZ9IK3BNiAntP4RsPP+41gDztLRS1tFkF8pziZDKovfrWbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by MN0PR11MB6208.namprd11.prod.outlook.com (2603:10b6:208:3c4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Mon, 18 Sep
 2023 13:04:41 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::59cb:e244:fe8b:184d]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::59cb:e244:fe8b:184d%5]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 13:04:41 +0000
Message-ID: <ed77db8f-9469-c68d-3bf0-82cb33716dc3@intel.com>
Date: Mon, 18 Sep 2023 15:04:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/4] drm/ttm/tests: Add tests for ttm_resource and
 ttm_sys_man
Content-Language: en-US
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>
References: <cover.1694517411.git.karolina.stolarek@intel.com>
 <97d52e1c257f91c7d0ff53a764fe1e590c070691.1694517411.git.karolina.stolarek@intel.com>
 <c4e66bca-a8e8-da53-1a96-7dbdd8a6d5bf@amd.com>
 <b662f3ae-037d-ffee-9aae-6c51c5d4f587@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <b662f3ae-037d-ffee-9aae-6c51c5d4f587@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0235.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8c::10) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|MN0PR11MB6208:EE_
X-MS-Office365-Filtering-Correlation-Id: 1976501f-9654-445a-5a56-08dbb847d253
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oZSnJbi9S4tMLMOO+4Pva+CggnFgCN/PRdzM0FV//50Y9jRyO03xDKpOOml0Ukvn4tX3dpXTF+0X9KIGsKMCXMbS6+8MmgSnXmiU5D2lAE1+2VsYoUcmD8r9gAiIV5ZOGuvSTAPLJKnjbtwBmGiJAGB92RxuY+nNlvxiMT69BxWTF3VULXae8WVT16XIrClZA/z49ybyjqgOpVGDDlE+GhmDDdaExqyFbkRm9rwDIi2xNipHnqGgDGOA2aOV3TkELVvzNT1EyYM0hHsBiD4N0XeF6/GhL7EX0BZXRYfZ9QmCnwZwz194mFzW8C5RT5DQorGvBw53h1iNbd3B/xD6F5lFATlid01kWqtpU59Lr87r6AynYKJgy4O4w+v/Oq4htynNPWw8Cr/fecIAXC9UkznrWq4S+DseKMgqgT7difyhGfXh8gZOAtCUoZUvEUj5Y4LGbe9d6Fw35Lcb5VAnexhWaf8+StY9Aw24exERJUStyNoCuyT6OUe2OHV1bXokW0SKiS6V6CPRkEaWRnPqW77LomSXksVht28hxSQsVCjamZXdaCnWTY9V1tekhY4OyaQ0rcdGIQHTq2H2R9SrE1MUBUv0SPqPX5oY9wwB0BP/em0N4gjw36b5pDwd8aFU+w7+rvId1/8hZORSkn+k/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39860400002)(136003)(366004)(396003)(186009)(451199024)(1800799009)(2906002)(30864003)(83380400001)(38100700002)(36756003)(6512007)(53546011)(6506007)(6486002)(36916002)(86362001)(6666004)(2616005)(31696002)(478600001)(26005)(8936002)(8676002)(4326008)(41300700001)(66574015)(5660300002)(44832011)(31686004)(316002)(82960400001)(66556008)(66476007)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3pWblN6eHhLMlliSm82ZS8rVXVxKzA0VU1ZbXJMcExUbUx4VnNkSDk3empU?=
 =?utf-8?B?QVhWdWphYjRjS0xSclVSNHd2ZXJ0WDh0T0cvN0FlQzBHNmZnT1JKNXQrSVRr?=
 =?utf-8?B?dWNNUTkyc2x5bUpGeTBFQkFvci95Qm82RjVDcWllTXdiYXVEdXM1azZaRFVG?=
 =?utf-8?B?ZTFrcjQ4U3hlNXExY1F3K0NxSWQ0N3R0WkVibjRwN0MzdEZQeW5uVU42cEdm?=
 =?utf-8?B?YWVCYVFuRytUcDhXZkxjOTJCLzN1UE9yR0NJemNuRkNqMnlBNHJSK2JYTU54?=
 =?utf-8?B?RDRGZjZkelBqbmdnUkNPMUl0STVCVjRmNGxnUmdqWWFSY255eFdwMzB3Z3NU?=
 =?utf-8?B?TjN1ME05OWkrYXI0dno1UjB3a2xpSkpVaXgxTGRnNDJDcDFpTDBQdlg5TVpr?=
 =?utf-8?B?blEyYmd4a1UzWEhTSkpQaFltSFhwTWVnMHRVcjB3ZFY4NlhtQlBPUG5jaEhJ?=
 =?utf-8?B?VGU0SjRFRnlUQzd1SkU3Uk55QktQSGUrczZCK0JidWxUVE1mUktqUUNENFZ5?=
 =?utf-8?B?cGl3MEVEWDY4dU9XUXJPNERSZXFiZTFpSXpVSWRNS1BpOEorMHhoWERxQkFI?=
 =?utf-8?B?MUIrU2xTY0lpZjI1aXhqUDhwVVU3bUVGYnA3WGNndWxhT01FR3hxeXNaM255?=
 =?utf-8?B?WWp6WmRrYWZrY0wrMFBob1AzMTZJMFB1T21oZkozL3RLdTlpeTROSjBCemIr?=
 =?utf-8?B?OWRtVWk2RzBEalpHTkJoSUo2bkdyVlhLZ3VYaksxUE16TDRESThuQXN6eEJ0?=
 =?utf-8?B?MkxYa1Nzay9MaUVmMzFoN3V5cFF3QTRYeS94Y0I3THlIdkppbXM2Ti9oeGNH?=
 =?utf-8?B?MHBYZU5EUG9wOWNoQjEvMktnYm1BdU9LVGVuQ0txdm1SZjFndmUvQWxacm9W?=
 =?utf-8?B?TjRnVTIwbVlZd2t4QXFmMmVhVTFXWHA2d0YvTmQ2TExwWlhNNk5nVDRsRng4?=
 =?utf-8?B?Z3dFN2NCZHM0N21PQ3hjQVREZm4zbXY3VS8zOHQ1Qitjb1UxMWR4NXdaci9h?=
 =?utf-8?B?ZGF3OWpPQmdJVzRycWZMbDVZVGlRejg4WU1tSU1OQ2pPR0NRRzNwZ1M3T0Zr?=
 =?utf-8?B?M2ZNNlNGdkQ0ZHF6dzBKUlJRdUt3dUZ2aWdoVEZPLzlzRWdzcjlwUHM3aUJN?=
 =?utf-8?B?aFFIZjlTMTN2NVFtU3hGQzJXb21ESWQxdUdGVGhtQnA1aStlOUVUMEYzdUJa?=
 =?utf-8?B?Q1FGYytrVkFkckpRR2U1cWhsQkluOEtuYTVuM0hBNGk2MG5qaFpUMUE1RW9n?=
 =?utf-8?B?cU41cVZUM3F4cVRoNDlzOVVmcXBoU0M4RHZEYUVGNDNxWGEzdStLcGlLK1Ba?=
 =?utf-8?B?ZDlvSWZibEJaRStBcXpUZ0RYNFB0U2QraEFsUHVLa2hCT3grdFlPWklxNXJL?=
 =?utf-8?B?QjV6Y29qUjJ4Y1Bic1FPTlFrVi90VHhLcFVBaFU1U3p1STRZY2h4dytTbnFx?=
 =?utf-8?B?SFBwYWpNYlIzZkRkMXk3ZWlTbUdBSVZNZll4M3UyWVdwMkJzbTlNV2x2d3hO?=
 =?utf-8?B?ZlR6NDNjcUVwT2hiUWhqeFJCck1ZTWptWkp2cjFTeXVBQWx6OHJ2YTVLZmh1?=
 =?utf-8?B?K2JxKzh3eVVJdkI5Tm1kSDlpN0FBdXYzT0VsK0tLZkZCTGI5OEtDVTl1NTl0?=
 =?utf-8?B?dHBkNUlKM2NZUTlYQlJoNTBkMkUydlZReGNMMkI2eFkwVGpuRkVMZVNlT0FT?=
 =?utf-8?B?NmlINkxaVUk5bTVFeFY4a29RZzhyaXBTNVpaaWNObXZ6QzJtZFZyR0NMMHlW?=
 =?utf-8?B?dlpud2RYaFA3RTdyQ0ZuLzhJK1VabjlsanZwRGw2Z01xODNCVUo4dTRoQjNO?=
 =?utf-8?B?bCtTbFZxVWFUd09FQktINURhMjViSlhXMW9VMy8zWUdOdjNQUFNvaGh0Mjli?=
 =?utf-8?B?UE91RnNiRXpBUHJzNWxoUk13SWMyQmpNMnptNS8xOXdRbkprc0VJQkdRSFZz?=
 =?utf-8?B?cGQ5TjhaK0lxWWM4RzhpUTdNenBCV3FEUHRYR2ZjNTNGdHkyQUw2UWNVRmVB?=
 =?utf-8?B?SVc0UGFqYllVbU5WOFBUeld5OGVRSlBOREVtYUh0Ty9JUG1OSUU3aTB3SGtT?=
 =?utf-8?B?cVZwM0Y2bGJtOU90dGtIaTdVS3pvemd5UFNRQUtRQTlxSmh5ODJ4OXNOTmlr?=
 =?utf-8?B?VGg3aitpZmovMm03Vm15NktGcXM0dFdtQkVOeGxsOWtESTg1ejQ2eVV6d21q?=
 =?utf-8?B?SXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1976501f-9654-445a-5a56-08dbb847d253
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 13:04:41.5114 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N9zIW4beoFbmUc3a1JutX7k1+zlIjcaBOY+1oN//WfsCvb0sb7udSQXtmCjg8UGSC8P/WtECBptE+6ztnia4fd+KnIcxJMXyrAxZdFe7dsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6208
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18.09.2023 13:48, Karolina Stolarek wrote:
> On 12.09.2023 14:54, Christian König wrote:
>> Am 12.09.23 um 13:49 schrieb Karolina Stolarek:
>>> Test initialization of ttm_resource using different memory domains.
>>> Add tests for a system memory manager and functions that can be
>>> tested without a fully-featured resource manager. Update
>>> ttm_bo_kunit_init() to initialize BO's kref and reservation object.
>>> Export ttm_resource_alloc symbol for test purposes only.
>>>
>>> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
>>> ---
>>>   drivers/gpu/drm/ttm/tests/Makefile            |   1 +
>>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  23 ++
>>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   4 +
>>>   drivers/gpu/drm/ttm/tests/ttm_resource_test.c | 335 ++++++++++++++++++
>>>   drivers/gpu/drm/ttm/ttm_resource.c            |   3 +
>>>   5 files changed, 366 insertions(+)
>>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_resource_test.c
>>>
>>> diff --git a/drivers/gpu/drm/ttm/tests/Makefile 
>>> b/drivers/gpu/drm/ttm/tests/Makefile
>>> index ec87c4fc1ad5..c92fe2052ef6 100644
>>> --- a/drivers/gpu/drm/ttm/tests/Makefile
>>> +++ b/drivers/gpu/drm/ttm/tests/Makefile
>>> @@ -3,4 +3,5 @@
>>>   obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += \
>>>           ttm_device_test.o \
>>>           ttm_pool_test.o \
>>> +        ttm_resource_test.o \
>>>           ttm_kunit_helpers.o
>>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c 
>>> b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>>> index 81661d8827aa..eccc59b981f8 100644
>>> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>>> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>>> @@ -38,10 +38,33 @@ struct ttm_buffer_object 
>>> *ttm_bo_kunit_init(struct kunit *test,
>>>       bo->base = gem_obj;
>>>       bo->bdev = devs->ttm_dev;
>>> +    kref_init(&bo->kref);
>>> +
>>> +    dma_resv_init(&bo->base._resv);
>>> +    bo->base.resv = &bo->base._resv;
>>> +
>>
>> I'm really wondering if we shouldn't now initialize the GEM object 
>> properly?
>>
>> That would also initialize the reservation object if I remember 
>> correctly.
> 
> Do you mean by using drm_gem_object_init()?

I tried initializing bo.base with drm_gem_object_init() and it's looking 
good, but one check in that function makes testing of "Misaligned size" 
subtest of ttm_tt_init_basic impossible:

BUG_ON((size & (PAGE_SIZE - 1)) != 0);

I wanted to test if ttm_tt_init properly calculates the number of pages, 
but it looks like in the normal circuimstances it already gets a GEM 
object of a size that is page-aligned. Would you prefer to write this 
subtest as a separate test with a dummy misaligned GEM object, or to 
delete this subtest altogether?

Many thanks,
Karolina

> 
>>
>> The solution with EXPORT_SYMBOL_FOR_TESTS_ONLY looks really nice I 
>> think and apart from that I can't see anything obviously wrong either, 
>> but I only skimmed over the code.
> 
> I'm also glad with EXPORT_SYMBOL_FOR_TESTS_ONLY solution, it's much 
> better now. Right, you can take a closer look at the next version. I'll 
> try to get an actual GEM object here, if you think that's feasible.
> 
> All the best,
> Karolina
> 
>>
>> Regards,
>> Christian.
>>
>>>       return bo;
>>>   }
>>>   EXPORT_SYMBOL_GPL(ttm_bo_kunit_init);
>>> +struct ttm_place *ttm_place_kunit_init(struct kunit *test,
>>> +                       uint32_t mem_type, uint32_t flags,
>>> +                       size_t size)
>>> +{
>>> +    struct ttm_place *place;
>>> +
>>> +    place = kunit_kzalloc(test, sizeof(*place), GFP_KERNEL);
>>> +    KUNIT_ASSERT_NOT_NULL(test, place);
>>> +
>>> +    place->mem_type = mem_type;
>>> +    place->flags = flags;
>>> +    place->fpfn = size >> PAGE_SHIFT;
>>> +    place->lpfn = place->fpfn + (size >> PAGE_SHIFT);
>>> +
>>> +    return place;
>>> +}
>>> +EXPORT_SYMBOL_GPL(ttm_place_kunit_init);
>>> +
>>>   struct ttm_test_devices *ttm_test_devices_basic(struct kunit *test)
>>>   {
>>>       struct ttm_test_devices *devs;
>>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h 
>>> b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>>> index e261e3660d0b..f38140f93c05 100644
>>> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>>> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>>> @@ -8,6 +8,7 @@
>>>   #include <drm/drm_drv.h>
>>>   #include <drm/ttm/ttm_device.h>
>>>   #include <drm/ttm/ttm_bo.h>
>>> +#include <drm/ttm/ttm_placement.h>
>>>   #include <drm/drm_kunit_helpers.h>
>>>   #include <kunit/test.h>
>>> @@ -28,6 +29,9 @@ int ttm_device_kunit_init(struct ttm_test_devices 
>>> *priv,
>>>   struct ttm_buffer_object *ttm_bo_kunit_init(struct kunit *test,
>>>                           struct ttm_test_devices *devs,
>>>                           size_t size);
>>> +struct ttm_place *ttm_place_kunit_init(struct kunit *test,
>>> +                       uint32_t mem_type, uint32_t flags,
>>> +                       size_t size);
>>>   struct ttm_test_devices *ttm_test_devices_basic(struct kunit *test);
>>>   struct ttm_test_devices *ttm_test_devices_all(struct kunit *test);
>>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c 
>>> b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
>>> new file mode 100644
>>> index 000000000000..851cdc43dc37
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
>>> @@ -0,0 +1,335 @@
>>> +// SPDX-License-Identifier: GPL-2.0 AND MIT
>>> +/*
>>> + * Copyright © 2023 Intel Corporation
>>> + */
>>> +#include <drm/ttm/ttm_resource.h>
>>> +
>>> +#include "ttm_kunit_helpers.h"
>>> +
>>> +#define RES_SIZE        SZ_4K
>>> +#define TTM_PRIV_DUMMY_REG    (TTM_NUM_MEM_TYPES - 1)
>>> +
>>> +struct ttm_resource_test_case {
>>> +    const char *description;
>>> +    uint32_t mem_type;
>>> +    uint32_t flags;
>>> +};
>>> +
>>> +struct ttm_resource_test_priv {
>>> +    struct ttm_test_devices *devs;
>>> +    struct ttm_buffer_object *bo;
>>> +    struct ttm_place *place;
>>> +};
>>> +
>>> +static const struct ttm_resource_manager_func 
>>> ttm_resource_manager_mock_funcs = { };
>>> +
>>> +static int ttm_resource_test_init(struct kunit *test)
>>> +{
>>> +    struct ttm_resource_test_priv *priv;
>>> +
>>> +    priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
>>> +    KUNIT_ASSERT_NOT_NULL(test, priv);
>>> +
>>> +    priv->devs = ttm_test_devices_all(test);
>>> +    KUNIT_ASSERT_NOT_NULL(test, priv->devs);
>>> +
>>> +    test->priv = priv;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void ttm_resource_test_fini(struct kunit *test)
>>> +{
>>> +    struct ttm_resource_test_priv *priv = test->priv;
>>> +
>>> +    ttm_test_devices_put(test, priv->devs);
>>> +}
>>> +
>>> +static void ttm_init_test_mocks(struct kunit *test,
>>> +                struct ttm_resource_test_priv *priv,
>>> +                uint32_t mem_type, uint32_t flags)
>>> +{
>>> +    size_t size = RES_SIZE;
>>> +
>>> +    /* Make sure we have what we need for a good BO mock */
>>> +    KUNIT_ASSERT_NOT_NULL(test, priv->devs->ttm_dev);
>>> +
>>> +    priv->bo = ttm_bo_kunit_init(test, priv->devs, size);
>>> +    priv->place = ttm_place_kunit_init(test, mem_type, flags, size);
>>> +}
>>> +
>>> +static void ttm_init_test_manager(struct kunit *test,
>>> +                  struct ttm_resource_test_priv *priv,
>>> +                  uint32_t mem_type)
>>> +{
>>> +    struct ttm_device *ttm_dev = priv->devs->ttm_dev;
>>> +    struct ttm_resource_manager *man;
>>> +    size_t size = SZ_16K;
>>> +
>>> +    man = kunit_kzalloc(test, sizeof(*man), GFP_KERNEL);
>>> +    KUNIT_ASSERT_NOT_NULL(test, man);
>>> +
>>> +    man->use_tt = false;
>>> +    man->func = &ttm_resource_manager_mock_funcs;
>>> +
>>> +    ttm_resource_manager_init(man, ttm_dev, size);
>>> +    ttm_set_driver_manager(ttm_dev, mem_type, man);
>>> +    ttm_resource_manager_set_used(man, true);
>>> +}
>>> +
>>> +static const struct ttm_resource_test_case ttm_resource_cases[] = {
>>> +    {
>>> +        .description = "Init resource in TTM_PL_SYSTEM",
>>> +        .mem_type = TTM_PL_SYSTEM,
>>> +    },
>>> +    {
>>> +        .description = "Init resource in TTM_PL_VRAM",
>>> +        .mem_type = TTM_PL_VRAM,
>>> +    },
>>> +    {
>>> +        .description = "Init resource in a private placement",
>>> +        .mem_type = TTM_PRIV_DUMMY_REG,
>>> +    },
>>> +    {
>>> +        .description = "Init resource in TTM_PL_SYSTEM, set 
>>> placement flags",
>>> +        .mem_type = TTM_PL_SYSTEM,
>>> +        .flags = TTM_PL_FLAG_TOPDOWN,
>>> +    },
>>> +};
>>> +
>>> +static void ttm_resource_case_desc(const struct 
>>> ttm_resource_test_case *t, char *desc)
>>> +{
>>> +    strscpy(desc, t->description, KUNIT_PARAM_DESC_SIZE);
>>> +}
>>> +
>>> +KUNIT_ARRAY_PARAM(ttm_resource, ttm_resource_cases, 
>>> ttm_resource_case_desc);
>>> +
>>> +static void ttm_resource_init_basic(struct kunit *test)
>>> +{
>>> +    const struct ttm_resource_test_case *params = test->param_value;
>>> +    struct ttm_resource_test_priv *priv = test->priv;
>>> +    struct ttm_resource *res;
>>> +    struct ttm_buffer_object *bo;
>>> +    struct ttm_place *place;
>>> +    struct ttm_resource_manager *man;
>>> +    uint64_t expected_usage;
>>> +
>>> +    ttm_init_test_mocks(test, priv, params->mem_type, params->flags);
>>> +    bo = priv->bo;
>>> +    place = priv->place;
>>> +
>>> +    if (params->mem_type > TTM_PL_SYSTEM)
>>> +        ttm_init_test_manager(test, priv, params->mem_type);
>>> +
>>> +    res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
>>> +    KUNIT_ASSERT_NOT_NULL(test, res);
>>> +
>>> +    man = ttm_manager_type(priv->devs->ttm_dev, place->mem_type);
>>> +    expected_usage = man->usage + RES_SIZE;
>>> +
>>> +    KUNIT_ASSERT_TRUE(test, list_empty(&man->lru[bo->priority]));
>>> +
>>> +    ttm_resource_init(bo, place, res);
>>> +
>>> +    KUNIT_ASSERT_EQ(test, res->start, 0);
>>> +    KUNIT_ASSERT_EQ(test, res->size, RES_SIZE);
>>> +    KUNIT_ASSERT_EQ(test, res->mem_type, place->mem_type);
>>> +    KUNIT_ASSERT_EQ(test, res->placement, place->flags);
>>> +    KUNIT_ASSERT_PTR_EQ(test, res->bo, bo);
>>> +
>>> +    KUNIT_ASSERT_NULL(test, res->bus.addr);
>>> +    KUNIT_ASSERT_EQ(test, res->bus.offset, 0);
>>> +    KUNIT_ASSERT_FALSE(test, res->bus.is_iomem);
>>> +    KUNIT_ASSERT_EQ(test, res->bus.caching, ttm_cached);
>>> +    KUNIT_ASSERT_EQ(test, man->usage, expected_usage);
>>> +
>>> +    KUNIT_ASSERT_TRUE(test, list_is_singular(&man->lru[bo->priority]));
>>> +
>>> +    ttm_resource_fini(man, res);
>>> +}
>>> +
>>> +static void ttm_resource_init_pinned(struct kunit *test)
>>> +{
>>> +    struct ttm_resource_test_priv *priv = test->priv;
>>> +    struct ttm_resource *res;
>>> +    struct ttm_buffer_object *bo;
>>> +    struct ttm_place *place;
>>> +    struct ttm_resource_manager *man;
>>> +
>>> +    ttm_init_test_mocks(test, priv, TTM_PL_SYSTEM, 0);
>>> +    bo = priv->bo;
>>> +    place = priv->place;
>>> +
>>> +    man = ttm_manager_type(priv->devs->ttm_dev, place->mem_type);
>>> +
>>> +    res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
>>> +    KUNIT_ASSERT_NOT_NULL(test, res);
>>> +    KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev->pinned));
>>> +
>>> +    dma_resv_lock(bo->base.resv, NULL);
>>> +    ttm_bo_pin(bo);
>>> +    ttm_resource_init(bo, place, res);
>>> +    KUNIT_ASSERT_TRUE(test, list_is_singular(&bo->bdev->pinned));
>>> +
>>> +    ttm_bo_unpin(bo);
>>> +    ttm_resource_fini(man, res);
>>> +    dma_resv_unlock(bo->base.resv);
>>> +
>>> +    KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev->pinned));
>>> +}
>>> +
>>> +static void ttm_resource_fini_basic(struct kunit *test)
>>> +{
>>> +    struct ttm_resource_test_priv *priv = test->priv;
>>> +    struct ttm_resource *res;
>>> +    struct ttm_buffer_object *bo;
>>> +    struct ttm_place *place;
>>> +    struct ttm_resource_manager *man;
>>> +
>>> +    ttm_init_test_mocks(test, priv, TTM_PL_SYSTEM, 0);
>>> +    bo = priv->bo;
>>> +    place = priv->place;
>>> +
>>> +    man = ttm_manager_type(priv->devs->ttm_dev, place->mem_type);
>>> +
>>> +    res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
>>> +    KUNIT_ASSERT_NOT_NULL(test, res);
>>> +
>>> +    ttm_resource_init(bo, place, res);
>>> +    ttm_resource_fini(man, res);
>>> +
>>> +    KUNIT_ASSERT_TRUE(test, list_empty(&res->lru));
>>> +    KUNIT_ASSERT_EQ(test, man->usage, 0);
>>> +}
>>> +
>>> +static void ttm_resource_manager_init_basic(struct kunit *test)
>>> +{
>>> +    struct ttm_resource_test_priv *priv = test->priv;
>>> +    struct ttm_resource_manager *man;
>>> +    size_t size = SZ_16K;
>>> +
>>> +    man = kunit_kzalloc(test, sizeof(*man), GFP_KERNEL);
>>> +    KUNIT_ASSERT_NOT_NULL(test, man);
>>> +
>>> +    ttm_resource_manager_init(man, priv->devs->ttm_dev, size);
>>> +
>>> +    KUNIT_ASSERT_PTR_EQ(test, man->bdev, priv->devs->ttm_dev);
>>> +    KUNIT_ASSERT_EQ(test, man->size, size);
>>> +    KUNIT_ASSERT_EQ(test, man->usage, 0);
>>> +    KUNIT_ASSERT_NULL(test, man->move);
>>> +    KUNIT_ASSERT_NOT_NULL(test, &man->move_lock);
>>> +
>>> +    for (int i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
>>> +        KUNIT_ASSERT_TRUE(test, list_empty(&man->lru[i]));
>>> +}
>>> +
>>> +static void ttm_resource_manager_usage_basic(struct kunit *test)
>>> +{
>>> +    struct ttm_resource_test_priv *priv = test->priv;
>>> +    struct ttm_resource *res;
>>> +    struct ttm_buffer_object *bo;
>>> +    struct ttm_place *place;
>>> +    struct ttm_resource_manager *man;
>>> +    uint64_t actual_usage;
>>> +
>>> +    ttm_init_test_mocks(test, priv, TTM_PL_SYSTEM, 
>>> TTM_PL_FLAG_TOPDOWN);
>>> +    bo = priv->bo;
>>> +    place = priv->place;
>>> +
>>> +    res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
>>> +    KUNIT_ASSERT_NOT_NULL(test, res);
>>> +
>>> +    man = ttm_manager_type(priv->devs->ttm_dev, place->mem_type);
>>> +
>>> +    ttm_resource_init(bo, place, res);
>>> +    actual_usage = ttm_resource_manager_usage(man);
>>> +
>>> +    KUNIT_ASSERT_EQ(test, actual_usage, RES_SIZE);
>>> +
>>> +    ttm_resource_fini(man, res);
>>> +}
>>> +
>>> +static void ttm_resource_manager_set_used_basic(struct kunit *test)
>>> +{
>>> +    struct ttm_resource_test_priv *priv = test->priv;
>>> +    struct ttm_resource_manager *man;
>>> +
>>> +    man = ttm_manager_type(priv->devs->ttm_dev, TTM_PL_SYSTEM);
>>> +    KUNIT_ASSERT_TRUE(test, man->use_type);
>>> +
>>> +    ttm_resource_manager_set_used(man, false);
>>> +    KUNIT_ASSERT_FALSE(test, man->use_type);
>>> +}
>>> +
>>> +static void ttm_sys_man_alloc_basic(struct kunit *test)
>>> +{
>>> +    struct ttm_resource_test_priv *priv = test->priv;
>>> +    struct ttm_resource_manager *man;
>>> +    struct ttm_buffer_object *bo;
>>> +    struct ttm_place *place;
>>> +    struct ttm_resource *res;
>>> +    uint32_t mem_type = TTM_PL_SYSTEM;
>>> +    int ret;
>>> +
>>> +    ttm_init_test_mocks(test, priv, mem_type, 0);
>>> +    bo = priv->bo;
>>> +    place = priv->place;
>>> +
>>> +    man = ttm_manager_type(priv->devs->ttm_dev, mem_type);
>>> +    ret = man->func->alloc(man, bo, place, &res);
>>> +
>>> +    KUNIT_ASSERT_EQ(test, ret, 0);
>>> +    KUNIT_ASSERT_EQ(test, res->size, RES_SIZE);
>>> +    KUNIT_ASSERT_EQ(test, res->mem_type, mem_type);
>>> +    KUNIT_ASSERT_PTR_EQ(test, res->bo, bo);
>>> +
>>> +    ttm_resource_fini(man, res);
>>> +}
>>> +
>>> +static void ttm_sys_man_free_basic(struct kunit *test)
>>> +{
>>> +    struct ttm_resource_test_priv *priv = test->priv;
>>> +    struct ttm_resource_manager *man;
>>> +    struct ttm_buffer_object *bo;
>>> +    struct ttm_place *place;
>>> +    struct ttm_resource *res;
>>> +    uint32_t mem_type = TTM_PL_SYSTEM;
>>> +
>>> +    ttm_init_test_mocks(test, priv, mem_type, 0);
>>> +    bo = priv->bo;
>>> +    place = priv->place;
>>> +
>>> +    res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
>>> +    KUNIT_ASSERT_NOT_NULL(test, res);
>>> +
>>> +    ttm_resource_alloc(bo, place, &res);
>>> +
>>> +    man = ttm_manager_type(priv->devs->ttm_dev, mem_type);
>>> +    man->func->free(man, res);
>>> +
>>> +    KUNIT_ASSERT_TRUE(test, list_empty(&man->lru[bo->priority]));
>>> +    KUNIT_ASSERT_EQ(test, man->usage, 0);
>>> +}
>>> +
>>> +static struct kunit_case ttm_resource_test_cases[] = {
>>> +    KUNIT_CASE_PARAM(ttm_resource_init_basic, ttm_resource_gen_params),
>>> +    KUNIT_CASE(ttm_resource_init_pinned),
>>> +    KUNIT_CASE(ttm_resource_fini_basic),
>>> +    KUNIT_CASE(ttm_resource_manager_init_basic),
>>> +    KUNIT_CASE(ttm_resource_manager_usage_basic),
>>> +    KUNIT_CASE(ttm_resource_manager_set_used_basic),
>>> +    KUNIT_CASE(ttm_sys_man_alloc_basic),
>>> +    KUNIT_CASE(ttm_sys_man_free_basic),
>>> +    {}
>>> +};
>>> +
>>> +static struct kunit_suite ttm_resource_test_suite = {
>>> +    .name = "ttm_resource",
>>> +    .init = ttm_resource_test_init,
>>> +    .exit = ttm_resource_test_fini,
>>> +    .test_cases = ttm_resource_test_cases,
>>> +};
>>> +
>>> +kunit_test_suites(&ttm_resource_test_suite);
>>> +
>>> +MODULE_LICENSE("GPL");
>>> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c 
>>> b/drivers/gpu/drm/ttm/ttm_resource.c
>>> index 46ff9c75bb12..02b96d23fdb9 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_resource.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
>>> @@ -30,6 +30,8 @@
>>>   #include <drm/ttm/ttm_placement.h>
>>>   #include <drm/ttm/ttm_resource.h>
>>> +#include <drm/drm_util.h>
>>> +
>>>   /**
>>>    * ttm_lru_bulk_move_init - initialize a bulk move structure
>>>    * @bulk: the structure to init
>>> @@ -240,6 +242,7 @@ int ttm_resource_alloc(struct ttm_buffer_object *bo,
>>>       spin_unlock(&bo->bdev->lru_lock);
>>>       return 0;
>>>   }
>>> +EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_resource_alloc);
>>>   void ttm_resource_free(struct ttm_buffer_object *bo, struct 
>>> ttm_resource **res)
>>>   {
>>
