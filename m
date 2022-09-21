Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAF55BFFA5
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 16:11:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7BA610E460;
	Wed, 21 Sep 2022 14:11:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AC1710E460;
 Wed, 21 Sep 2022 14:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663769481; x=1695305481;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ERDnux9HEKVRrrgjc1BBXjHYoqAWcYUBcAcgh/rebgw=;
 b=iHYN2T6WVbefw889ztVLKmTfNf1EOOQGGMc2W6xK0T1qkuPN45i3IiKi
 fxpPZBkppTUDvSIYK2aGb+K8Fid9SkOHyUYaHX9g8OeBIjMT0n58Kp2qm
 VQ9+v3ZsosWoLB01eTtUr4i0SDgtPB1rr5Jtip7kk3SEje6xHJHUlvAwK
 fgTrkXg7brirQwrLAHcnn6J3AfI1/WJqYBzFcpfNyaGpNQw9snDH1Unnl
 xbhW+VxntaDScZ3VITOYspB/ayQZyb6MbOJvJeo9YCCy5gULKOOvIgDTI
 43P56nZSbonP9JXCWeAC9YFOqmDvXcRwyymvWjIH0BOjkEudIXAfWWfS5 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="280383117"
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; d="scan'208";a="280383117"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 07:11:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; d="scan'208";a="650081829"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP; 21 Sep 2022 07:11:19 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 07:11:19 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 21 Sep 2022 07:11:19 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 21 Sep 2022 07:11:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U9NrvdjrbLHyKspKf8f87KC2ija5ixI7crxq26H7eivUwNMyfPGd96JwcfnuorCkno4VzgLNTQ3u+JwAA+pZOMSDwq74BS1uM5i5VbuUTKiNV40W5XYDu2YbfFOksNwyKFB9L2+/DGG+yKgmyw+aMWuJ6wvhPB3D+3dLxyR3SgW00v93Vvi+8H5MK0FflIfq5MLzEMPgn++nJECgTLe3eIGLAFbFlD+sWkdICmXjVcTFU+PXTZs5RyNqNrdZRY0gmBdkLvw13JXgN+hAxu4p05W5UI2UT71EpUpwiOfCH5lD/TRNEMg+CMUNqQe3HEWd/X2WgWjbB0FbLW5xU42udA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=17P0qPRAs5Pay9Bl2F+6h8Ccu0zvf0WccTjGYeygf7o=;
 b=JCliSJIuCDk+nnZscGsIZJw/C86G84YqbxovPXg5z86R8C/WOa9bgrneOmKgALvtj0+6fS802cF44DIdVzi1IOy1IYiT9McSSqamX4opEHvroM78H+91/R6QeLsWfzbGhDpWOuunhBRhXItknimImHp+U69TcNo/tsXsSpzjSDWBOF6wz2ndJBC76geOhmqwSz/A/z2RDSwY31mmr1/H4+RW9Ti8lWLz11ZO/TXwKhbPpGXrlDM4pPfcX2fp90b70U3Pjd5SgTEAG3gmfV8g1wbRBZHGNrfoC8vk5ovRimE9DW/LcHzu730JDieSCSkteQGr1EyvmJB3SN61gosAyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7)
 by PH0PR11MB4855.namprd11.prod.outlook.com (2603:10b6:510:41::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Wed, 21 Sep
 2022 14:11:12 +0000
Received: from CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::54de:6030:7501:b7ae]) by CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::54de:6030:7501:b7ae%7]) with mapi id 15.20.5632.021; Wed, 21 Sep 2022
 14:11:12 +0000
Message-ID: <247cf9b4-5027-5099-18e8-874df1375b74@intel.com>
Date: Wed, 21 Sep 2022 17:10:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v10 3/9] compiler_types.h: Add assert_type to catch type
 mis-match while compiling
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>
References: <20220909105913.752049-1-gwan-gyeong.mun@intel.com>
 <20220909105913.752049-4-gwan-gyeong.mun@intel.com>
 <202209130455.E7CF976A@keescook>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <202209130455.E7CF976A@keescook>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::15) To CH0PR11MB5409.namprd11.prod.outlook.com
 (2603:10b6:610:d0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5409:EE_|PH0PR11MB4855:EE_
X-MS-Office365-Filtering-Correlation-Id: c12f0e4b-90ce-4f68-9aeb-08da9bdb22ea
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bAhzGzK7FClVyJ0B2qcbLt1MkwiqfGwd1Ua0PqTBNOEceuinH0gtiqIp5O7q9wdDpUtLDH+yrmo8DKYeEd2cjJriHpfSILpRLuwBzJjpY/OTJYhWCWm+gLiF1AGiiYiOXdEfz2vAQssRkWap2pfH0NL7RYQ2C9SUa6I1IE0kk9TrZ6/MPxEp+RSU0B5dj8sBm5I56GU1V3Dr4NMmkIq/dbHIxn/wo1GCyWooCs/kWCkVUCbLDnpD1UUwJ8oPD33bCtCZASDzPbQAyDc6v7W0EcNGYht1fZHenKuXItVdoUnsrcoqx3BiTmtVSxMDf7DI145OZ51ijbwdpcs7+8ZSxUkGWA0yMqlszPjoTrjdcCnVF4CUbfuPY6rgzCMk3cUrSWOKQ9A3KnNvW5xrBYBskIqRmyB6LFX6GEoUuQKnkSVyy5hCwEJJqDD7+mIdPEFAQGGg9hVaKeLoWW6sMNfn/ZGiYm1UDIR7mUNCEm+5cTUsp3ha65LOUUnRYYaLwk7+NlWicD30688WAKZSVRKn4PydP2aII08qarpaEdWY+qZmWMKpiL5rOhlCycfZuWSVJd8RionV6bIQOLpdAHAEMa9IIgVESlHhw2GsDbHvCa8yCNjNH5U4QsJkNsPasObWSQBBbAoEtajWRa7WExmevzejA9c1hhxS2xKJBZyX8/p1V1zv+jXMLEnN+HD7Tv/WI50MTd3dVWddEQxINpBSdfyKQkBQzNUC6vs4joop4WxJ9sX/u3ttEJNiUiSyg0Giz/ivcz4yL4yW7saor5g0/9pNzhjpzpNnOi2Y5ytsutfcwsXD8fOtnbQmTyo0Cdhwz5FT97amEulXvQ4l2IwlyJ83lZgrAD+p0dStNnfAl+U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(39860400002)(366004)(376002)(136003)(346002)(451199015)(38100700002)(966005)(478600001)(6486002)(2906002)(6916009)(4326008)(8936002)(66946007)(66476007)(66556008)(8676002)(5660300002)(7416002)(316002)(2616005)(86362001)(36756003)(82960400001)(26005)(6512007)(41300700001)(6666004)(53546011)(6506007)(66574015)(83380400001)(186003)(31696002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clJOeFJPbmtkZ2dLbm5YQ0ZsMmZoQ3pEaHE2TmFNc05LbFNmSzg1bkdEclky?=
 =?utf-8?B?OXVtNk9Xek1LZGtMMWpLMW5FWGxjVStQQkZweE5BZG9Yd1JHQnVoVGZvcmp2?=
 =?utf-8?B?YUovdklZUHJjdnhoeXhGeEhBUTVwN2N1Y0RzZzdsd0tTc25qNjdhQktOM2Yw?=
 =?utf-8?B?Ny9BbXppblFmVEt1NnNkVkRnTzRpdVpYY05MamcvSzN3RXRJaUwrV2xZMHc0?=
 =?utf-8?B?S0tYbmVJdUYwbnFCWUJTaktIUWNRQnlUQ1dRZlk4emJEWGFyU3FSM2s5Yi9W?=
 =?utf-8?B?UW83azBBRVhzZk1qQWJEN21DT3JYc2tNMElHeHJGT0kzQjNFWmtnYkc4a3ZZ?=
 =?utf-8?B?SDFvalAvbmdLZTR6OUFMWDlZblpKbFVIMDJ0OUd3T1QyQlBHelQzM01lVkpY?=
 =?utf-8?B?cVZwc013VnVyYko0dzZLTnphbkV5Y0g3ZTU0dEc1Q29tMlVWSTFHTlYrbmJ0?=
 =?utf-8?B?WDhjcVRjVllaNGg2R2xrckpYdXNHQnBSTlJOZVNVVjJ0cG9YZVBVSkE5ZHJ1?=
 =?utf-8?B?ODV0UmdlenliUDlDbjBqRzNvNU5MMHBRTkxKUzk3aHRBSlB4MG1HV3diRFV3?=
 =?utf-8?B?VW1oZklSVVY3YURQU2lpT3Fham1kM3U4RHBPWFJzZm9YWlBZSUwxZUw2OWhY?=
 =?utf-8?B?dXV3b2hXcExIVXBPVkdJRHg4c1FnVDdBRm5NQzlZNFY5cGpuVXJBc1VVSnBk?=
 =?utf-8?B?MU0xTzc0OHpGcjBoWlFpNjY3eTQ4YjVISFoxR0lXOTU2eU84MkFkUnpSRTBk?=
 =?utf-8?B?QnhFa1lPTi9EWjZwOHRnd2llVjRqMXg2aW9mYjF3elhVblIxUkFOUGRmSEMr?=
 =?utf-8?B?QWRqTWoydEpLM1BCV1JrN29OeGxYUUovSGNaN0pNVXZwM2JmbWYrV0R2TFNh?=
 =?utf-8?B?VlUwSDNRZm8vUlVhaVFQSkt3ZGpDa3E1eVBJY205dmI2K3FPZDhKRFdlZzl1?=
 =?utf-8?B?STJzN3lKMFdUTStSWFRFTHN6Y29UUFBiR0pmZ1dxRG1qaHBWRzFmQTNDL3Ji?=
 =?utf-8?B?SVc0ZnVCcTFtZFJXc1BGVGtCUlBTMkFGc2tzMlFreGJ5b3M0djEyTXZYRVpT?=
 =?utf-8?B?TGI1eERHbk1jWjRkeENJYXA5S29mOWlHZTE2V3VYU3BHQTMvWWJVOHBZN2sw?=
 =?utf-8?B?VngzUmNtejNmRnVmUStLRGhQUWs1ZnB2azFNNlQxVmdZK1RKN2QrZTVQcjRa?=
 =?utf-8?B?VnQzZFhVcUtTTXpva3hOMnlsQWx5ZkpYSXlieHdOeGRHdzBmQ2F1QkNCUzRQ?=
 =?utf-8?B?ZXdNZFd5cjNDZXRQcTk1eU9FNkJRcS9aaDZGWHd4UVo2NlRQcnE4Q3ZvSVRu?=
 =?utf-8?B?L1ZpUTdDaHRWUktrZzdvY0pHSkdDOWkyaXVXQk1JbUxpSWF3MkltQTlNeENS?=
 =?utf-8?B?a09UbHM5a29HVUl5V2RQdXBUTWNjU0ZoTzZWWGRQOWU2L0llZHMvdG5qSHhO?=
 =?utf-8?B?SERSWlJSWnRMbVZVY0l5RHBQaDczOURiai9GcW96ZXRSYlVGVWVoWWRUc1BU?=
 =?utf-8?B?elIrTm9tRXllRG9pd2l3a1VTV1Rza1ZZcXI3ZE9YOWxhL3pYdnJmMTdzelpT?=
 =?utf-8?B?aHYzcEpObjNPa0FlN2tXL0I2eEw3OUJyMTNnZWhUSkRDSnhVUU4zZmx3NE9z?=
 =?utf-8?B?bmdMa2xOMTA1eXg3ZEhuTy9kbVZ5enZibWFYKzJDcmE0UzJ0TE5aeUZwZzBM?=
 =?utf-8?B?cU8xRHp1dkJwZk84YU5FWC9aLzQwODRnREk3eStDd1YzbXRBRlZFZGRWaCt2?=
 =?utf-8?B?cE5Ic1VDVmJwdlVpSktlMEFqU1Q1bWYrV0xwM2tWRTE3clhIZ3FqZ1NSQTJt?=
 =?utf-8?B?MHFOVXl0VTl2TTNUL2Q4V2M5anJleEY3bDVIcmY1LzRWYjBaMURoRWlBbkZL?=
 =?utf-8?B?Uld5UUtuVTd2aUJDRGxxZjBpV1krTXJzVHc0Mi9KM1pyUllrUGd1YjBKMEhL?=
 =?utf-8?B?TnFWN2Y4ZGVOY3RwWThqOTB1U2trOUVwYTF0dVppdmRleXBLckl6NVpsL0J2?=
 =?utf-8?B?dkgyeU11b09RSldJV3MwY1ZlbDVFanNLbkExVkthRlVqZ0wrV0dNTlFUaGEy?=
 =?utf-8?B?TFJGRkJkc0V3TXBEejRORzJZWU1QY282V1I5V2xNcTVuOEZqd1ZCZzQ1K2JJ?=
 =?utf-8?B?UUdUd2VXOUJ3NkFRK1c1NnZ5UVFiMjZVUi9YSzgya2pXM0gzeWlpRW1Rb0V6?=
 =?utf-8?B?dnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c12f0e4b-90ce-4f68-9aeb-08da9bdb22ea
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 14:11:12.1652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8+W55mM5Ln6BVWxJNdBGSGuTCwpdUs/srB/xkICs/G1DJ5KCX5ScwaF1lqlTlaBcntIHpV8SKy7sFBcOEbWSCdaU8Rr8Hv4FgJgyd32v2JY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4855
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
Cc: thomas.hellstrom@linux.intel.com, mauro.chehab@linux.intel.com,
 andi.shyti@linux.intel.com, jani.nikula@intel.com, ndesaulniers@google.com,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, andrzej.hajda@intel.com, dlatypov@google.com,
 matthew.auld@intel.com, airlied@redhat.com, mchehab@kernel.org,
 vitor@massaru.org, nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/13/22 3:01 PM, Kees Cook wrote:
> On Fri, Sep 09, 2022 at 07:59:07PM +0900, Gwan-gyeong Mun wrote:
>> It adds assert_type and assert_typable macros to catch type mis-match while
>> compiling. The existing typecheck() macro outputs build warnings, but the
>> newly added assert_type() macro uses the _Static_assert() keyword (which is
>> introduced in C11) to generate a build break when the types are different
>> and can be used to detect explicit build errors.
>> Unlike the assert_type() macro, assert_typable() macro allows a constant
>> value as the second argument.
>>
>> Suggested-by: Kees Cook <keescook@chromium.org>
>> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: Kees Cook <keescook@chromium.org>
>> ---
>>   include/linux/compiler_types.h | 39 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 39 insertions(+)
>>
>> diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
>> index 4f2a819fd60a..19cc125918bb 100644
>> --- a/include/linux/compiler_types.h
>> +++ b/include/linux/compiler_types.h
>> @@ -294,6 +294,45 @@ struct ftrace_likely_data {
>>   /* Are two types/vars the same type (ignoring qualifiers)? */
>>   #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
>>   
>> +/**
>> + * assert_type - break compile if the first argument's data type and the second
>> + *               argument's data type are not the same
>> + *
>> + * @t1: data type or variable
>> + * @t2: data type or variable
>> + *
>> + * The first and second arguments can be data types or variables or mixed (the
>> + * first argument is the data type and the second argument is variable or vice
>> + * versa). It determines whether the first argument's data type and the second
>> + * argument's data type are the same while compiling, and it breaks compile if
>> + * the two types are not the same.
>> + * See also assert_typable().
>> + */
>> +#define assert_type(t1, t2) _Static_assert(__same_type(t1, t2))
>> +
>> +/**
>> + * assert_typable - break compile if the first argument's data type and the
>> + *                  second argument's data type are not the same
>> + *
>> + * @t: data type or variable
>> + * @n: data type or variable or constant value
>> + *
>> + * The first and second arguments can be data types or variables or mixed (the
>> + * first argument is the data type and the second argument is variable or vice
>> + * versa). Unlike the assert_type() macro, this macro allows a constant value
>> + * as the second argument. And if the second argument is a constant value, it
>> + * always passes. And it doesn't mean that the types are explicitly the same.
>> + * When a constant value is used as the second argument, if you need an
>> + * overflow check when assigning a constant value to a variable of the type of
>> + * the first argument, you can use the overflows_type() macro. When a constant
> 
> I wonder if the overflows_type() check should happen in this test? It
> seems weird that assert_typable(u8, 1024) would pass...
> 
Yes, that's right. If a constant is used as an argument here, it seems 
necessary to check whether an overflow occurs when the constant value is 
assigned to the target type or target variable.

>> + * value is not used as a second argument, it determines whether the first
>> + * argument's data type and the second argument's data type are the same while
>> + * compiling, and it breaks compile if the two types are not the same.
>> + * See also assert_type() and overflows_type().
>> + */
>> +#define assert_typable(t, n) _Static_assert(__builtin_constant_p(n) ||	\
>> +					    __same_type(t, typeof(n)))
> 
> Totally untested -- I'm not sure if this gets the right semantics for
> constant expressoins, etc...
> 
> static_assert(__builtin_choose_expression(__builtin_constant_p(n), \
> 			overflows_type(n, typeof(t)), \
> 			__same_type(t, typeof(n))))
> 
> 
However, if we change the macro in the form below, the "error: 
expression in static assertion is not constant" error occurs due to the 
restriction [1][2] of _Static_assert() as you mentioned.
( overflows_type() internally uses the __builtin_add_overflow() builtin 
function [3], which returns a bool type.)

#define assert_same_typable(t, n) static_assert(			     \
		__builtin_choose_expr(__builtin_constant_p(n),		     \
				      overflows_type(n, typeof(t)) == false, \
				      __same_type(t, typeof(n))))

Can I have your opinion on the new addition of 
overflows_type_return_const_expr(), which returns a constant value at 
compile time to check whether an overflow occurs when assigning a 
constant value to an argument type?
If it is allowable to add the macro,   I would try to use the macro that 
returns "an integer constant expression" after checking for overflow 
between the constant value and the argument type at compile time with 
reference to implemented in the previous version. [4] or [5]

#define assert_same_typable(t, n) static_assert(				\
	__builtin_choose_expr(__builtin_constant_p(n),				\
			      overflows_type_return_const_expr(n,t) == 0,	\
			      __same_type(t, typeof(n))))


option (1): add is_unsigned_type() and overflows_type_return_const_expr()
#define is_unsigned_type(x)     (!is_signed_type(x))
#define overflows_type_return_const_expr(x, T) \
	(is_unsigned_type(x) ? \
		is_unsigned_type(T) ? \
			(sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T)) ? 1 : 0 \
			: (sizeof(x) >= sizeof(T) && (x) >> (BITS_PER_TYPE(T) - 1)) ? 1 : 0 \
	: is_unsigned_type(T) ? \
		((x) < 0) ? 1 : (sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T)) ? 1 
: 0 \
		: (sizeof(x) > sizeof(T)) ? \
			((x) < 0) ? (((x) * -1) >> BITS_PER_TYPE(T)) ? 1 : 0 \
				: ((x) >> BITS_PER_TYPE(T)) ? 1 : 0 \
			: 0)


or option (2): modify current __type_half_max(), type_max(), type_min() 
and add overflows_type_return_const_expr()

#define __type_half_max(x) (((typeof(x))1) << (BITS_PER_TYPE(x) - 1 - 
is_signed_type(x)))
#define type_max(x) ((typeof(x))((__type_half_max(x) - 1) + 
__type_half_max(x)))
#define type_min(x) ((typeof(x))((typeof(x))-type_max(x)-(typeof(x))1))
#define overflows_type_return_const_expr(x,T) (	\
	is_unsigned_type(x) ? \
		x > type_max(T) ? 1 : 0 \
	: is_unsigned_type(T) ? \
		x < 0 || x > type_max(T) ? 1 : 0 \
		: x < type_min(T) || x > type_max(T) ? 1 : 0 )

> Also, can you please add KUnit tests for these new helpers into
> lib/overflow_kunit.c?
> 
yes the kunit tests for assert_same_typable() and assert_same_type() 
will be added in the case of normal build in the form below so that the 
build of other test cases is not interrupted. [6]

And the added overflows_type() and check_assign() and 
check_assign_user_ptr() macros use the check_add_overflow() macro, and 
this macro is verified with another test case. Is it necessary to add it?
And if it's okay to add the overflows_type_return_const_expr() macro 
mentioned above, I'll add the macro in the new version and add a test case.

[1] https://en.cppreference.com/w/c/language/_Static_assert
_Static_assert ( expression , message )		(since C11)

[2] C11 standard (ISO/IEC 9899:2011):
6.7.10 Static assertions

Syntax
1 static_assert-declaration:
	_Static_assert ( constant-expression , string-literal ) ;

Constraints
2 The constant expression shall compare unequal to 0.

Semantics
3 The constant expression shall be an integer constant expression. If 
the value of the constant expression compares unequal to 0, the 
declaration has no effect. Otherwise, the constraint is violated and the 
implementation shall produce a diagnostic message that includes the text 
of the string literal, except that characters not in the basic source 
character set are not required to appear in the message.

[3] https://gcc.gnu.org/onlinedocs/gcc/Integer-Overflow-Builtins.html
    6.56 Built-in Functions to Perform Arithmetic with Overflow Checking
    Built-in Function: bool __builtin_add_overflow (type1 a, type2 b, 
type3 *res)

[4] https://patchwork.freedesktop.org/patch/494722/?series=104704&rev=6

[5] 
https://lore.kernel.org/all/52c09fde-f788-4c2b-efdc-d1783dbc0f6c@intel.com/

[6]

/* Arg is: type */
#define TEST_ASSERT_SAME_TYPE(t) do {	\
    typeof(t) __t1 = type_max(t);	\
    typeof(t) __t2 = type_min(t);	\
    assert_same_type(t, t);		\
    assert_same_type(t, __t1);		\
    assert_same_type(__t1, t);		\
    assert_same_type(__t1, __t2);	\
} while (0)

/* Arg is: type */
#define TEST_ASSERT_SAME_TYPABLE(t) do {	\
    typeof(t) __t1 = type_max(t);		\
    typeof(t) __t2 = type_min(t);		\
    assert_same_typable(t, __t1);		\
    assert_same_typable(t, type_max(t));		\
    assert_same_typable(t, type_min(t));		\
    assert_same_typable(__t1, type_max(t));	\
    assert_same_typable(__t1, type_min(t));	\
    assert_same_typable(__t1, __t2);		\
} while (0)


TEST_ASSERT_SAME_TYPE(u8);
TEST_ASSERT_SAME_TYPE(u16);
TEST_ASSERT_SAME_TYPE(u32);
TEST_ASSERT_SAME_TYPE(u64);
TEST_ASSERT_SAME_TYPE(s8);
TEST_ASSERT_SAME_TYPE(s16);
TEST_ASSERT_SAME_TYPE(s32);
TEST_ASSERT_SAME_TYPE(s64);
TEST_ASSERT_SAME_TYPABLE(u8);
TEST_ASSERT_SAME_TYPABLE(u16);
TEST_ASSERT_SAME_TYPABLE(u32);
TEST_ASSERT_SAME_TYPABLE(u64);
TEST_ASSERT_SAME_TYPABLE(s8);
TEST_ASSERT_SAME_TYPABLE(s16);
TEST_ASSERT_SAME_TYPABLE(s32);
TEST_ASSERT_SAME_TYPABLE(s64);

