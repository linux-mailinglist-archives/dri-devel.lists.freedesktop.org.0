Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EF1723C84
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 11:06:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C18110E306;
	Tue,  6 Jun 2023 09:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5305010E306;
 Tue,  6 Jun 2023 09:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686042393; x=1717578393;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hZnU34ypu0E3ATAWG2vM8+sNr6iuyLGtk6Mcy6rzbJg=;
 b=Jxz9vcUBcGTuoi1xExpgpkv7BFdrUT37/3T/eEFQUMioMq7A/9juFtso
 9lekdKNMLsyMcJYkHlutvorVoAJOoDvBcKfOAlfFYRL289avefvtiyGag
 iY1k4m4gNf+angLPU6xsIkR4NRuQXZ/nCsH5sVOwEEql+zF1YO1MMDhDa
 GPr8jh9uJudvglBi8wu5SOXlQySahzUfo1xihRfUX4cUdq/bR/94P4QFS
 SjdZh14WExzZeJ+gpUDB5Co8mA+9MNZf0c/tLgFxXSbB/fTOaErUkzUSY
 EPP566c6DlfRF4j2elMGUur66WuklfS/B01UvQiit9S+p/dBxbt4m6Htj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="359927041"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; d="scan'208";a="359927041"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 02:06:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="686454159"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; d="scan'208";a="686454159"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 06 Jun 2023 02:06:27 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 02:06:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 02:06:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 02:06:26 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 02:06:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nRMtjjKAc6/LT/zouWjHooVz8ppiE0QVLGPQRt8l5BoQvIXCtcMmhvikprVVzKma4jFDTHZlNci14KebSLJn1DmQHMGcNsqwgB2dbG76hfQz9euk33ESPprq50a1j7S39ZeHdOqbI0Pq5xzYcwHXphdwP2uvW1Uf4wWxXARocHGoUWGhNj4XI2Z3shwwHqim7M8wB2U8WNtH7TGCPKvUQHQQSwiSU3C6kROa5e9t4vO0Xa/p0rqAuKv5+YOzXxvkHdi2Wm+zHq0ln+WvJXOL9bmOHSZrw9jUsLR5Y3B4evEgwC6VnE0ttqMZbeYvOWNnPoph1GRI/MesmCCgJRScqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q9gl1YMHERN4vAVnVbWxylkkuqYCppT+wUQ49r1VO6o=;
 b=d9LV3VrxMdbr0Srg2r/zdd2vlCuvBvCmBju58Vu4v0j9VoK7ES1dJ2zH5uQwcsufxCRopuWU6NEpjXPsmEDnIwG8kjB04lLWUHl+cxpY/H+dXgJB/nuhooz8Y4LVaz5YUSFFVFtp5goKIz6c29IAKDuonJYwtTmJU6VCosKM4k7obg3tee9PRfzmuuHL0i2W/sHeCiXfYJcE9GNkvqNcv+nYuCNr7iDckLkFxzqj9LN5FwOHKvvBDx45UDd2KCK1cWFg2Hy7m3oLmwNU+UDBj6Jb/ygZ3dZxDzF/qT4oEMFvISZft3R9k3m5mfZvAnJHL3ni9YT3Pibqt1/6GP+crg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2976.namprd11.prod.outlook.com (2603:10b6:805:d5::22)
 by PH7PR11MB7148.namprd11.prod.outlook.com (2603:10b6:510:1ef::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 09:06:24 +0000
Received: from SN6PR11MB2976.namprd11.prod.outlook.com
 ([fe80::889b:837a:6d66:6975]) by SN6PR11MB2976.namprd11.prod.outlook.com
 ([fe80::889b:837a:6d66:6975%4]) with mapi id 15.20.6455.027; Tue, 6 Jun 2023
 09:06:24 +0000
Message-ID: <9095b403-5330-84ac-be97-75f0ae88bead@intel.com>
Date: Tue, 6 Jun 2023 11:06:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] drm/i915: Fix a VMA UAF for multi-gt platform
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20230605201021.13928-1-nirmoy.das@intel.com>
 <ZH5FJAkm98WSonA/@ashyti-mobl2.lan>
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <ZH5FJAkm98WSonA/@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::6) To SN6PR11MB2976.namprd11.prod.outlook.com
 (2603:10b6:805:d5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2976:EE_|PH7PR11MB7148:EE_
X-MS-Office365-Filtering-Correlation-Id: c0d63033-84be-4176-9247-08db666d4d9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HgT3KIsstqb4yq/YPt2bjxKRO+fwkPdiTgybJ66T8D7VlKog4eYdY9L54gWTwY0QlrCxBegTqwpXIJ/EkXvVAtHEHor5BIbAsOpA6iXUoyqaX/QuaohgGAZ8gsiViM2eqX1+fNL3ETnGJsGU5pvxns+fQjVL1QI9o1rZLkkNYLOb08Zg4aKWdxhX7nCLShvro1MZiAJZqpRm7SE+eVyLSF2OF1KXQesUxk8h0O/GWe8azzba5vtwzqHvGuyNzH+ALRKfMoxnOijw4cbgTZ41caxvnkGtcUcQk0l7nWVSnTAUl3QmJP8ymszr3Dnb+JDyAlQwbJJ1JpwTJmGNxIWxKxRhfxmE/GztaUN1xOf4ak+olje2fPjZGMpsiCZ7+mdkuMVvU38rkzzl1feUFSAajyormL8Q/s1FoWedULcnnaLlgsOEFx6NFR4206dw8OwnaVzljKaTl4Bohoot6/qGuEuVdEeOGqcqxYLtJeSBYy2oDs+O/i0IfXWe/BNOCIgrFobt4a65UOOKeE5jG2jAUwiDH5Jxgh+ID5iCPi5X7r8a3h155VgAK28F7s3qTeXFF2O4xEYkaIDU7lUH5HTSD0BXJeD/0LB8JVDbKl1sac3wa7dF2P3ndTpPqJNjjhk4F848QgwZOUZBXG+BV1PrgA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2976.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(396003)(39860400002)(136003)(346002)(451199021)(66574015)(83380400001)(82960400001)(54906003)(478600001)(8676002)(8936002)(41300700001)(66476007)(66946007)(316002)(4326008)(66556008)(31696002)(38100700002)(6916009)(5660300002)(86362001)(6666004)(6486002)(36756003)(2906002)(44832011)(6512007)(53546011)(186003)(26005)(6506007)(31686004)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N09xRUxqQkRoWmVWQzJPOVpnMlorbUY5akh5R2RrZmVuTEQxcVFwS0F5WC9O?=
 =?utf-8?B?WTlCN0ZCYndOc1crcDdjZGtReWUxVjFKRlVwbmtRcVlXQ0dxanFkTU8yMmJp?=
 =?utf-8?B?SVhZNHpuTkkrNWgwNWF5U0VQTEdPTlkraW1OVUNQVjFpMyt1dHhLUlM2MmRH?=
 =?utf-8?B?SGFpeGNQcTcvNkN0RFArY05NMFRVUmx6OXlzWmtkR0xrVnhrdFFNZCtzcmZY?=
 =?utf-8?B?TjE0clZyelEzdmNEL2FQSUxwdXIxK0hJcHlJWTZSS1lJOEpyMjBRL0NHbmdY?=
 =?utf-8?B?Q2NKdUcyY1ZuZkhHMjlkd21tV0xEV3hUWXQ1dG41SmJicnArd0ZYNWd3WlRY?=
 =?utf-8?B?NWtoUkYzUDlUYXdFWnRIejZnTGdBQ3JRQVVtbGFGeEE5Q01uR0lNMVVUeGJz?=
 =?utf-8?B?eXc2djJCQW9uME0vSHpkSkdDcUhkeVQ4UVNaTk1DSlBWbWtTb0d5b25HVGNU?=
 =?utf-8?B?M003SXNUK3RKK1lCS3JaQ1B2S2dBZERBRFlOclpnaWtPYUlyUnlaRDMySDVK?=
 =?utf-8?B?cnZ4R3FtNWVuU2FCSUZuR3cxQUw1NmVqWWNPem9LU29EcTQzbzd3ekxUVWda?=
 =?utf-8?B?VWUxaHdpVndyUmtCQThTcTZ5QzlMMjNwTzMrSVp6VkFOZXpYTU5wTGROZlhl?=
 =?utf-8?B?eDVZYU1KRWJsNTZ3ai9Fb1pDVGdWc25yUWI1LzkxZjNHeUdJbXNlM2xJc0pU?=
 =?utf-8?B?elg5aEU5a1hMdlBycHdIR1Z4UnptQTJ5NFZnUVhNbWxmY1RVQWt4WXl1aVdH?=
 =?utf-8?B?US9KMnhNeE1PT1VScFIxMXBsUE5wL01NY0E2aW5YWjRIZ1lzOGF1NzVlWjBE?=
 =?utf-8?B?NllMSFlHSGlzOUpQZzRSeWRZTS9wdnBOYlpHMGZDYVFyQnp3VFI5bHI4QkxF?=
 =?utf-8?B?VHdNNERhUjIvQXdmV0xDV2RoVkI5Sk9VTVNPZU9lWFhXWkIwbVI1a2tnREtF?=
 =?utf-8?B?czRmZUc2NWhLSEJWelo1VVp5YW1kclMxTFVmYkRudWwwV0RUWEptMGJRRnpj?=
 =?utf-8?B?MVQ5ais3R2ptYW1zdDN0UER0Um1kYjRLOEVXdzRDT29BMTNncHQ1ZUh5dWRy?=
 =?utf-8?B?SGZPaklpMzZiOTA2TVlEc2kxbmVrWlMweUsrL1YwRHB2VUFJWWZSbHFkTllK?=
 =?utf-8?B?VWlRdzRCRUM2Ry8xUFo3SURDSThONndPQ1dmRFJ5ZlYrSnN0a1daUEtTbnh2?=
 =?utf-8?B?WWdTRGsrckJmcHNwNm9UVUQ2VE0vMlNuV2NIa0xjNGxYWDVDcE9BTTZOZzlP?=
 =?utf-8?B?NW9EaGJwdXcwM0hpWWFDblZEMlpyc0EvZ01kUERyOXo1SVlCQ0tsem02RVF1?=
 =?utf-8?B?MXBlNW1lVERjR2l6c0tOUW1NTFBUcFVvY0hUTnpYYVZmNFlxMHVuMktiYjhj?=
 =?utf-8?B?eUNRYTVyNGhzVVA5ei9lMjk5eXIxTWtMQjBMY3NWWUhkSmNPV1YzaVd6Z3Ro?=
 =?utf-8?B?ekcxWFh5QjRsZ21tRmUrY0k5ekNhN1ZKM29yalBPS2VTWENLaWg5OEFkY0Jj?=
 =?utf-8?B?SWs2Tk5jeFRuZjg4d0FVSjdKWTBNSms0SlVBOEIwM3I1cWI0MzV2RllzMUNq?=
 =?utf-8?B?MjZBemhhcGc4U2xNYzhkMVlVVCtBRXJKWnRYUEU3bE5vL0c2U1RIQVBTZjFh?=
 =?utf-8?B?cmppOXhxcTR1QnRud28zOTU4VjNBaGV2cENLUGJTQTFLd295WGVkUkdCa2kz?=
 =?utf-8?B?dWIrdVBCWkpveitRV1hBekpqdEplZjk0MEdBYkF1OUhaY2F2UDg3Z3Zmdno4?=
 =?utf-8?B?bUowTFMvcTNMNWN1SHZZYTRWQkM4eXkzcVFsMTlWeThzZVdKNlcvTzhESmd3?=
 =?utf-8?B?YkU2QkhoenBpUDVvdFZlSFhqQ0NXT0MwVVpPQjk3VTRFVTd1dnJ2Q0ZVQlBu?=
 =?utf-8?B?cVUvOG4zdUFMZ0F0eVBWL0UwaUlsd0tvQWYwd2RFNm0ycGE5UVZORlZEYlFW?=
 =?utf-8?B?UnV3ckMwbW90K3dlU1Uxemc3U3BCdkdacEUxSVpLQnhFRWl5aDI2bUtkWUY2?=
 =?utf-8?B?Y2JHVldYQ0wvQm1EZWRhWFIyZDZBQUo5UTNqbzk4dkJOQTRNM3NZZmFYNzV6?=
 =?utf-8?B?d2oyT2NLcTNRcDNaUXRMWVpCZEdEbFFUampHZnIrWTNJdjQrTXhCOERtUmxB?=
 =?utf-8?Q?X1qnJZQLM/nyL3+nHZvI9cqJ1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0d63033-84be-4176-9247-08db666d4d9c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2976.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 09:06:24.5313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3yFmebMZbG6hbpc9+xE9mvnxiHQE3gKfQnHQsDaaKLxWG/MKlkkwjcdxyldLDXOgw1cISFAtuyN9zsHSvfz82A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7148
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Chris
 Wilson <chris.p.wilson@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/5/2023 10:27 PM, Andi Shyti wrote:
> Hi Nirmoy,
>
> On Mon, Jun 05, 2023 at 10:10:21PM +0200, Nirmoy Das wrote:
>> Ensure correct handling of closed VMAs on multi-gt platforms to prevent
>> Use-After-Free. Currently, when GT0 goes idle, closed VMAs that are
>> exclusively added to GT0's closed_vma link (gt->closed_vma) and
>> subsequently freed by i915_vma_parked(), which assumes the entire GPU is
>> idle. However, on platforms with multiple GTs, such as MTL, GT1 may
>> remain active while GT0 is idle. This causes GT0 to mistakenly consider
>> the closed VMAs in its closed_vma list as unnecessary, potentially
>> leading to Use-After-Free issues if a job for GT1 attempts to access a
>> freed VMA.
>>
>> Although we do take a wakeref for GT0 but it happens later, after
>> evaluating VMAs. To mitigate this, it is necessary to hold a GT0 wakeref
>> early.
> hooray! this is great, Nirmoy! I will give it a shot.
>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Chris Wilson <chris.p.wilson@intel.com>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> index 5fb459ea4294..adcf8837dfe6 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> @@ -2692,6 +2692,7 @@ static int
>>   eb_select_engine(struct i915_execbuffer *eb)
>>   {
>>   	struct intel_context *ce, *child;
>> +	struct intel_gt *gt;
>>   	unsigned int idx;
>>   	int err;
>>   
>> @@ -2715,10 +2716,16 @@ eb_select_engine(struct i915_execbuffer *eb)
>>   		}
>>   	}
>>   	eb->num_batches = ce->parallel.number_children + 1;
>> +	gt = ce->engine->gt;
>>   
>>   	for_each_child(ce, child)
>>   		intel_context_get(child);
>>   	intel_gt_pm_get(ce->engine->gt);
>> +	/* Keep GT0 active on MTL so that i915_vma_parked() doesn't
>> +	 * free VMAs while execbuf ioctl is validating VMAs.
>> +	 */
>> +	if (gt != to_gt(gt->i915))
> you can use gt->info.id
>
>> +		intel_gt_pm_get(to_gt(ce->engine->gt->i915));
>>   
>>   	if (!test_bit(CONTEXT_ALLOC_BIT, &ce->flags)) {
>>   		err = intel_context_alloc_state(ce);
>> @@ -2757,6 +2764,9 @@ eb_select_engine(struct i915_execbuffer *eb)
>>   	return err;
>>   
>>   err:
>> +	if (ce->engine->gt != to_gt(ce->engine->gt->i915))
> 	if (gt->info.id)

Thanks, was wondering if there is a better way to detect that.


>
> gt is already ce->engine->gt
>
>> +		intel_gt_pm_get(to_gt(ce->engine->gt->i915));
>> +
>>   	intel_gt_pm_put(ce->engine->gt);
>>   	for_each_child(ce, child)
>>   		intel_context_put(child);
>> @@ -2770,6 +2780,8 @@ eb_put_engine(struct i915_execbuffer *eb)
>>   	struct intel_context *child;
>>   
>>   	i915_vm_put(eb->context->vm);
>> +	if (eb->gt != to_gt(eb->gt->i915))
>> +		intel_gt_pm_put(to_gt(eb->gt->i915));
> this wakeref going up and down is a bit ugly... Perhaps we can
> add some flag about the GT type in the info structure.


Chris pointed out that there is a patch[1] in internal branch which 
fixes a regression by moving the

intel_context_enter() before vma lookup. That should have same effect as 
this one.

But for now I didn't mange to make it work on drm-tip(causing some 
crash) yet.

[1] drm/i915/gem: Push wait-for-execbuf outside of ww_mutex

>   MTL is a
> weird multi-gt platform and, indeed, you can't shut down GT0
> without affecting GT1.
>
> For now it's OK, though, as to test it.

Looking forward to that. I did test it extensively and ChromeOS team as 
well.


Regards,

Nirmoy

>
> Andi
>
>>   	intel_gt_pm_put(eb->gt);
>>   	for_each_child(eb->context, child)
>>   		intel_context_put(child);
>> -- 
>> 2.39.0
