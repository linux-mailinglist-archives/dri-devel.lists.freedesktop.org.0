Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1335B35C6
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 12:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5927010EC66;
	Fri,  9 Sep 2022 10:59:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA5B10EC66;
 Fri,  9 Sep 2022 10:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662721153; x=1694257153;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uBhjg8LEdgBN8llwfFdYC8fGar6Sy/uESE+Ikg/lZKo=;
 b=XG7iZxiJXadU2B+m001Pdmu30LXXnJllkRg1jtF2BPPJaec+I/9zzTVd
 9gvVsYyd9aRKvIDjuZgr8z+HjufhvzTQXhWajhFijrWg8MoqaxSGQtfJA
 GQ2tPsXER3KxoUcj2YZXdtWb+6laAj+M8pUmjUTv36yY7rgKHzimK7wqH
 b99FWBuvFInEeFwufcx6o7vrRbCda9lXMNc1aKnKPzgFRfXP+LBa5wBWQ
 oY0VQ2JGtJJm0s8OAR3GoEORbiaHaRaMCxxuWj0I7lou1X7L7KZg9d4Xx
 s4qP21aa8ndfmUNq7CXcW/MYQ8PN8mIFiPRjNoy0JcTQW2p0xIR94/+V2 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="361405899"
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="361405899"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 03:59:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="645495977"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 09 Sep 2022 03:59:12 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 9 Sep 2022 03:59:12 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 9 Sep 2022 03:59:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 9 Sep 2022 03:59:11 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 9 Sep 2022 03:59:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CjsjDFLGDTJsGIxPAGlug7BTHXwef5/y6rETJhTOZWIIb2oK3U5FlG05np1Hi02vH3fVPMG0gS9uPI2VOe8dlq2uOK3xe6L4D3RSs9RBiTiKNvpHIh3sCYfwWspEe49UOUFh1olnozqjDD4122vFSDN1baO+YsHyfQim9oX0gYTH7ykDE6IVzyNczQnC4I4Pg78OlrnyY79KwQ8Ltt3KxmBLCT1tWXQD9IKjLXzrGbYPhgN7WVQwoK+HCzeLUF5bedVRCq0WwdkLpP7gWSS+D9YLOFr5N6HPaQTsD6CtaLb9VEyPYOezdpoDL5fmbq15zVOrvk8pmQxeWI+Kbcp4Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QnfBIbGirgN8p0xWnp5ANWLik4m7y3CldtMEFrcdemA=;
 b=G3CXVwhBBBkZxTZtRvHQiQfvEyFSKeKgPDBvO7IkB2vvf+8yC+6MzNaEvo8GU3/rXcY7y221wdaQjGsOx6mr5zfWOR5USs/P4aXI4O4ehzaHdaIVmHxurF77NAP7/nfxrOAvPoK0cWqdCijdc1KpLA1HhJxzleIr18A3FfrelpV9jrNSI0E90i+yyFWaJh6l3uPPad5hK42fSk4vAU1QWor+pW+VZIH0aD3zxX/aro/caC+Q85IbetKP9RzVjhxHqg8d8STFdMimuTjbVWELMl2oKrUKO3O+QRQ3oIUV8ndc/FjIQIRmHl0auPbBlWpauZ1iPd4bM4GbNnDbA9ySCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7)
 by SJ0PR11MB6720.namprd11.prod.outlook.com (2603:10b6:a03:479::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.16; Fri, 9 Sep
 2022 10:59:09 +0000
Received: from CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::54de:6030:7501:b7ae]) by CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::54de:6030:7501:b7ae%6]) with mapi id 15.20.5612.014; Fri, 9 Sep 2022
 10:59:09 +0000
Message-ID: <5814cf7f-00ec-06d4-089a-41b173eed8b7@intel.com>
Date: Fri, 9 Sep 2022 19:58:45 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v9 2/8] util_macros: Add exact_type macro to catch type
 mis-match while compiling
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>
References: <20220824084514.2261614-1-gwan-gyeong.mun@intel.com>
 <20220824084514.2261614-3-gwan-gyeong.mun@intel.com>
 <202208250953.A71FEE45E@keescook>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <202208250953.A71FEE45E@keescook>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0244.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::9) To CH0PR11MB5409.namprd11.prod.outlook.com
 (2603:10b6:610:d0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5409:EE_|SJ0PR11MB6720:EE_
X-MS-Office365-Filtering-Correlation-Id: ae66d155-38b6-4ef0-183a-08da92525203
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6jYfvwB/+Bg32hgrdscZ6Sfhixkfc0uxkefpGX6YVNNGh0btUM8ATR2cWVIB3JdnrHSmWXxynD4HuV0k0nwNJOHNtujmZSE8WLoRJEZ/kJByocLWN9EbVGdSMPs8zV0QEjqIkXSMfoTNtODcnLKgOuViLVTGtzUyIu9NskF6Mi129aisJOUcy0kHnfYDT0hf6sGfbllyc2P6exRGXpbaAxCsCgOQtQ7uCWQUCAjekJt6g5UQ1wTST0TdcyxtIPgukLXqMeclfUztYHJ44BJwNTl4VSjvBc56cFSDmWPPh4wpIetIKMwzXZDZFtLCfXHUJjgky61g2C+Cu5oVbuKwEmEQHIo8Aqu68rPLLus6ADDfQxGFtMzrj/eCVaoYy0WBqe2QDgYbKgj5o2X7OLa+ftDKR7bMztezpik8CdmQctRd6jTG7JXi/5kwuAa+w6aN/2CEtx41TC783VmLnAg8rF2NQysfzsBQnn3YQQ+XSLLd1svFsg/LFrGNk1O/QT4ZIrzL1Aj26fUr2XfhD7bZcl/FYiSmtJ481NN9Q5oAO9xtRU2CcdmKtmAqxXoObcgFaX1p4O6pCD1jsjSoCwwc9N5wXYwRNsRYnT3N1RINgPb+GEMNOrz64qRRdRfkDce4yLxi5Cxxw+zGcJN2C6lmO6WXDxgJhu9FbfOPhI/QfdyHami2z3xnD0H4LnjuuaM5spC14oOBbBy2EifVsgECu8gtVS0uuqDFzrw3hySFbeaLfuWvPRvPS4Rv8EMXJqv9FYn7wiBUdqvSVtSIAfg3FLKtZtwh6JxdnZjzhQBR4xs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(346002)(39860400002)(376002)(366004)(136003)(66946007)(66476007)(6486002)(66556008)(31686004)(7416002)(31696002)(86362001)(4326008)(2616005)(8936002)(5660300002)(6916009)(316002)(8676002)(2906002)(36756003)(41300700001)(6512007)(26005)(53546011)(478600001)(6666004)(6506007)(82960400001)(186003)(38100700002)(66574015)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzZOVVNCMEp3SEtsUHFBRFpGOEE2OUdaTXJsdXRLSEROb1E0WldQRXM5V0VH?=
 =?utf-8?B?OTRzZU5Nc0JMM2ZLWlBDbGdEZXRiNTRRTjhkM3F3WXJqYXJtRnVYV0hxZU5X?=
 =?utf-8?B?TlJJZnNKRy9oTUx6N2xpRUk5Y3JMc0IxS3pFMVNVbS8ybmhYNUFuL1pqY0NJ?=
 =?utf-8?B?UkRBNDNtNEdMYjV4RHErR1pIN29lOGg4cW5Jb29QM3VCaVNrejFteDJPaDR0?=
 =?utf-8?B?bmlQeG9pd1c0V3NWQzRGUFVJUmdCZURaVHY5bHdnNytvMm1IT0tuN3lJd0Ey?=
 =?utf-8?B?N094d2Jia1JSeGFZRTQvV1NRM1o5Q1RTRklvMHI0RkEyZ2t3QVg5aEJkcHV4?=
 =?utf-8?B?NW9JRWxJaVN1TG96TVIyYjlUQlowbmRGTDdReHRsQUhqbThqSEFuWTF3UnJx?=
 =?utf-8?B?QUozTXRqeGVQNGdzMlQ3TGJubGhVS1VKTHZlUE1JSEp2RnVSWCtYVUZrc2c2?=
 =?utf-8?B?K28xNCtBcnFWR2RFNmg2clNOUWdFNVRMTURZb3EyWDE0anl1Y3ZYTkd4Qk9j?=
 =?utf-8?B?OEtUT0d1Y0lvdEgrZ3VLaitnUzdKL05rSnFTY1RPUkRSR0lScis1ZUpYV1hD?=
 =?utf-8?B?M2wvOVAvOGFQZVZ4NjFYRkhMTXRTZi92bGpRek5vNGdZTVlwSVFyZnhuNTNL?=
 =?utf-8?B?dEZxNzFqeGlZQ0U4RHhqUW1UKy9ML21DVmhMbjQ1TlVwaEhQRGJaSWM3TjY3?=
 =?utf-8?B?VTQ1eC9PNEUyRkpDTFZ1R21ZYWFtM1dQYkFYbUx6TXFnUjVVTjJVRThFYTVL?=
 =?utf-8?B?eDFPVnhqMDlIRE03OFNiWmkxUm8yeFU0VEdzUmZ1WktEc1RNbGhuVDdnZHpO?=
 =?utf-8?B?ekhLN2krbVlWQmNFVXFjZ04vNTZMK1hnaGJhOXduWEpPbUx5d2pyT3h5WStV?=
 =?utf-8?B?Z1hzYWlkNTNJUVNKMU9xTDRCcjRycEg5aHFhdlFmblJ4cEMraTRQQUpLY21l?=
 =?utf-8?B?S29yOVp5WDcxVlh2WVU3WVQ4SVhhQk14eUt2NHcvVnMrWDhZYXBISWZCYXcr?=
 =?utf-8?B?eTBQZm03elZ0cWhLcXBKWGhYMzFRWnBCV2pQaUlWVlcybStzV3djREIzb0pi?=
 =?utf-8?B?ellnTDVXWVhaRGJST0xzSHZPd2xaVFpjcWFjUElkaHRMeTBYd1lnY3B0K1Uy?=
 =?utf-8?B?cHFvUXhab016bFk5MkhsUE01TVl2TE4xa29tQ3pWb0dRRlFsdFdZYjVYOEY0?=
 =?utf-8?B?TW03cE1YeEJGSUFoLzVyZGc5VUpsckNmRWc4L3pVSkIwamlObUp5WXhoM092?=
 =?utf-8?B?UjJ5V0lFUkxucnFVdldEQmcrYTlCdG1MSVNTNkw5a09hbDg3UG9vTGhqNkQ0?=
 =?utf-8?B?OFdDczdUeGFqbDUwSG5OZHNsUkhhOEFyWFdsUlFpQjljYlk1VFcvT1FnUE9Q?=
 =?utf-8?B?eDFXVEV1OVBCSzEwNERTQ05EbnZmZEZOa1o0OTFuM2t5MzlydEVpeWtUUm1t?=
 =?utf-8?B?RjNTNnlXUWUwQjZPYlZGdCt3T3BzdElnTkIyUTc4RktWZ3pyVGN3dWJBOFVr?=
 =?utf-8?B?bUFDcHl2K3A3b1hGdnNDNXRYL0g2emhtbWVTdG5RSGova1pKenJtOERkdG01?=
 =?utf-8?B?YnNMSXNXdjZBUjd4WVlqS1ZLcXFKaEpyYmpvcGNLWDIyM29sV2N4bTJUTTBT?=
 =?utf-8?B?WHpoODY5ak5WTEh5TlNRbk1hb1dEU2JWcjJ5a0xCczNodng1QmJkK3MyaEJh?=
 =?utf-8?B?OGpuQlVTVTI1MG5vNnRvcjdNTDQwVzA0MHplODFEU3p0SmJIemxrVUZwSlg5?=
 =?utf-8?B?WnIzZHV2aGxmeTZydGtUYzRhcWhNeU5VOXpSL2tSenE2WXBiSGVFRkduODNa?=
 =?utf-8?B?b3cwZ2Z5QkUzZXhVRWQyeE83RDJTS1FzQ3Q1aEpnUWFxM2tjUHh0enhwTnFR?=
 =?utf-8?B?cjRmekR6OElIWmZpRmVqMkY1L0x1OFlmaHpkNTk2STNjM1NkdndHaXZoRSsx?=
 =?utf-8?B?eUJETkVIcVlWNTlnUHdtTmR3bDU2S3JOeGdIS0hTL0VvSDhrN1QvUE5MYWlU?=
 =?utf-8?B?ZkxBQk8zOEZUclNZeThPb3lpT2xKdElYQS9NNUJBNnhJM0RMZTd4UVh4K3BF?=
 =?utf-8?B?NEdxajZBUlpibDhsQ29xZUhPK1VUa0tFN2EvYzQzOG1QQ3N3V0dXWS9VRzFS?=
 =?utf-8?B?OWpua2hkckdQV1JFYm8rVEIxanQwSmNyR3ZaTCszUjJIbUZJQkFPa044SzRn?=
 =?utf-8?B?dFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae66d155-38b6-4ef0-183a-08da92525203
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 10:59:08.9753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s9U/uwCWcDrqYAC9mJTj0VNgNm2aG7i0rZed0eMjbZD+yAkD46FeB3U8Qrp2YViYUPAq1cLfHhjG4wzIG4e0e3lvgvLbOdYKD+t8SLlACeM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6720
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
 andi.shyti@linux.intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk, airlied@linux.ie,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 intel-gfx-trybot@lists.freedesktop.org, mchehab@kernel.org,
 nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/26/22 2:19 AM, Kees Cook wrote:
> On Wed, Aug 24, 2022 at 05:45:08PM +0900, Gwan-gyeong Mun wrote:
>> It adds exact_type and exactly_pgoff_t macro to catch type mis-match while
>> compiling. The existing typecheck() macro outputs build warnings, but the
>> newly added exact_type() macro uses the BUILD_BUG_ON() macro to generate
>> a build break when the types are different and can be used to detect
>> explicit build errors.
>>
>> v6: Move macro addition location so that it can be used by other than drm
>>      subsystem (Jani, Mauro, Andi)
>>
>> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>> ---
>>   include/linux/util_macros.h | 25 +++++++++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>
>> diff --git a/include/linux/util_macros.h b/include/linux/util_macros.h
>> index 72299f261b25..b6624b275257 100644
>> --- a/include/linux/util_macros.h
>> +++ b/include/linux/util_macros.h
>> @@ -2,6 +2,9 @@
>>   #ifndef _LINUX_HELPER_MACROS_H_
>>   #define _LINUX_HELPER_MACROS_H_
>>   
>> +#include <linux/types.h>
>> +#include <linux/bug.h>
>> +
>>   #define __find_closest(x, a, as, op)					\
>>   ({									\
>>   	typeof(as) __fc_i, __fc_as = (as) - 1;				\
>> @@ -38,4 +41,26 @@
>>    */
>>   #define find_closest_descending(x, a, as) __find_closest(x, a, as, >=)
>>   
>> +/**
>> + * exact_type - break compile if source type and destination value's type are
>> + * not the same
>> + * @T: Source type
>> + * @n: Destination value
>> + *
>> + * It is a helper macro for a poor man's -Wconversion: only allow variables of
>> + * an exact type. It determines whether the source type and destination value's
>> + * type are the same while compiling, and it breaks compile if two types are
>> + * not the same
>> + */
>> +#define exact_type(T, n) \
>> +	BUILD_BUG_ON(!__builtin_constant_p(n) && !__builtin_types_compatible_p(T, typeof(n)))
> 
> Maybe use __same_type() here instead of open-coded
> __builtin_types_compatible_p()? Also, IIUC, currently coding style
> advise is to use _Static_assert when possible over BUILD_BUG_ON for
> error message readability.
> 
> This macro has a trap-door for literals, yes?
> i.e.  exact_type(pgoff_t, 5) will pass?
> 
yes, I will update in detail comments about trap-door that may occur 
when using constant value.

> I also note that this is very close to the really common (and open-coded)
> test scattered around the kernel already (BUILD_BUG_ON(__same_type(a,
> b))), so I think it's good to get a macro defined for it, though I'm not
> sure about the trap door test. Regardless, I'd like to bikeshed the name
> a bit; I think this should be named something a bit more clear about
> what happens on failure. Perhaps: assert_type()? Or to capture the
> trapdoor idea, assert_typable()?
> 
> #define assert_type(t1, t2)	_Static_assert(__same_type(t1, t2))
> #define assert_typable(t, n)	_Static_assert(__builtin_constant_p(n) ||
> 					       __same_type(t, typeof(n))

The form of the assert_type() / assert_typable() macros you suggested 
looks better to me, so I will add these macros to the header where 
__same_type() is defined and will send a new version of the patch.

many thanks
> 
>> +
>> +/**
>> + * exactly_pgoff_t - helper to check if the type of a value is pgoff_t
>> + * @n: value to compare pgoff_t type
>> + *
>> + * It breaks compile if the argument value's type is not pgoff_t type.
>> + */
>> +#define exactly_pgoff_t(n) exact_type(pgoff_t, n)
> 
> Why specialize this? Just use assert_typable(pgoff_t, n) in the other
> patches? It's almost the same amount to write. :)
> 
