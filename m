Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E3370739B
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 23:12:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC13410E497;
	Wed, 17 May 2023 21:12:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E179D10E495;
 Wed, 17 May 2023 21:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684357969; x=1715893969;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=f+Il4ksHsOFZnXBssNkWNNRWcUO7NnHuT30Ka41sX9A=;
 b=Td5yP1Z7Vh1iJpGAadgGEDSp2XGgACFTltSR9tfssVFQagl8JLMZ2Ot+
 3E/PU2Q5y9fCFvpLXVfkpG4sdGEdy/EvEWB7Jkc1NA2jDZoETMmQoXnqT
 EWJlrSVUu3AoISDs+S5WcrZ4z2JuZBHZpykHO0MEUIc8VZfLW+qVqAcQ0
 vvV3Mj4mqIMrhQslje2/T48sNM4EqjNRF5i+ar00txsu+PAv9GPmvwgBG
 hB/lRNHv+RR+XSHqBAoaiHCM08Sf5xIJrbKi1JhCE3lBHI1jD7sj5WlxU
 HPmpq9SP+TYjrL7GOq47eujXtaS4ZBFcoKxLzHjS7c9DcppqTmiZiSyBf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="417539697"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; d="scan'208";a="417539697"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 14:12:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="704953362"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; d="scan'208";a="704953362"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 17 May 2023 14:12:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 17 May 2023 14:12:48 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 17 May 2023 14:12:48 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 17 May 2023 14:12:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cUi/bA6D7DxLRTuKFQJDEImTE/hPZeLgWLYpSjUEN0GMMJpgXsWhcnPSvG+va4HI/0W3mW+h6icfthG7fVw4HgB5QNpaojhqaFUwBSgeR2TrmM1FThQv+eLWeTwAsa516SymX6o/MIXCF5l8N5OvaVxAzBSbbbu7zAVgsHW5ptQYZPKK0Et+lxmcVzDsmcxhxvv38S9pnz9JCgYa9Lr346qU7fp1VhY+hakhjmoDIwQ935icjeD+oa63Nu3EccWdoq7ntMXGVCyBocwVBNyu0umTO5Ks76SwMLdaIFwpVrump63zX1Hk0wlB0YaiVfk4Lks7USGs9jlTeAaQAao3Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RRgDVCfyWsoeel+GOEsmRq+YJDlO7as376GmTiAZLrs=;
 b=Qj8NdED4yEEeLgsjwUHrJHsS+bfvNohgaw53X/KH4p/1XPzvSjZ3olaNGJWBzSWRgWV/N/w3C7dzbk7muMt4r7SNoDSHFVVbpCWkkxab/P0ZMwd4j7h71Pxbwi7CRl60yWhDGMjlPuvCEVYlO/lufL/eV17iJksi86PzQ8ThPKV39ATzFc6e52nJPQUq6CN3NVh0FFAV7bNnAHuCZ+Lz3EqCGNP502JtN+Al8MZNgv7mykNQwZlDzv4/RWa7I53qlbtpRquOwlkpeQju/v+LGG/RI7hNOuTl99sVcroRSzFh8H+5j2M6XxOzQE4PSpMSBA2Mx4tWmh+jNxdcgJG3YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 PH7PR11MB6546.namprd11.prod.outlook.com (2603:10b6:510:212::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Wed, 17 May
 2023 21:12:45 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0%3]) with mapi id 15.20.6387.033; Wed, 17 May 2023
 21:12:45 +0000
Message-ID: <b7ce82ad-0395-32b3-7fe1-9e0a97dd5d23@intel.com>
Date: Wed, 17 May 2023 14:12:42 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [Intel-gfx] [PATCH v2 2/8] drm/i915/uc: perma-pin firmwares
To: John Harrison <john.c.harrison@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230428185810.4127234-1-daniele.ceraolospurio@intel.com>
 <20230428185810.4127234-3-daniele.ceraolospurio@intel.com>
 <064b5612-c8f6-3310-1323-31886090b39c@intel.com>
Content-Language: en-US
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <064b5612-c8f6-3310-1323-31886090b39c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::25) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|PH7PR11MB6546:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bfbc53a-6ac3-48d3-700a-08db571b75b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7gy3r7PpCkftL3pgeaRXetPK31bvQ9obx7yuRuPvtC5YjIx37NDM4Wsu/QFoNPOEEGsWx8UpsCBlJA7kfd0X5OMHmIgHkE3YlOZ5NZeDFS6vpwrdX7t79n2vMggkB9MdPde3giBug86DBNqUKOdZDA7x03CYFQXt1FLRgSqESrsYo7BqhOzhG79TLgH26bCTuZhB/NJjBKeHVDezQSgJlPaZww4XTUD1kmVC3o0c7W8WBSoob0PLDog7fyor1lpcGPi4mf9Q0UtA6deBr/njmxvBXCwv6IAEEG6J6NOrf5PmEauEM/1SZeH5CagZvtyDqgEt3TZGYlt6YtLgB23iZnyGLtz/Er8RIhL2UQiG7FnorEkV9pWQbpt3xAcTqQCIq25+6wWmZ3+sdqvlzQDn874ysLXZ9ZGEYx3Mf9+CIMcWOdmVnEQW+4Nr7tsazGXGoMNJDiKdkMY0DDMERQv8Z813/ax/tvvYx0MtxHszIu+La/fPVO/u/KTWMiwynmuMB5GnDHjo4ffuwywKOWzwdKEb6l0KY9aK+AADM5b5M/cQuGA6JgJM3YoJYgWZgnYOxg2mzjUao9ENsiKBYjNUg0lbJd80M4WCBF6ZMPP20yjDkN0ORX7ZlUuhKyCWlI63ko9QrlvyoHNhklzg4FuGbQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(366004)(396003)(136003)(39860400002)(451199021)(53546011)(478600001)(186003)(6506007)(6512007)(26005)(86362001)(6666004)(4326008)(83380400001)(82960400001)(450100002)(31686004)(66556008)(2616005)(6486002)(66476007)(66946007)(5660300002)(41300700001)(316002)(8936002)(8676002)(30864003)(38100700002)(2906002)(31696002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVE1WWVjNWg3ME45Rm04N01TcDZxRHVrdGxwalRPZnNHL2FzN3hDMUJTbzFp?=
 =?utf-8?B?ZEpGTEFqL3h4VDNCRG9GQmhhbUxuVGRrcTlVRnYvanBuQllaWTBJd3JpK1NU?=
 =?utf-8?B?VzdJUnc2UUNFNkpWR3NLc2NIRU13ZTFRaXI2bDlLK0tXeVgzN1NROHZlUGF6?=
 =?utf-8?B?NlN3VHpQOG9EeGw1V3Q5ZjA1L0FBT0d0aGV3YWtRTFptWWFoOGdCNGJvSGpJ?=
 =?utf-8?B?dVJGNXByQlgzY2NNWXJzVE9WdHZSZG45djM5a1lzU1YwZWxENmNzcWZSZm4x?=
 =?utf-8?B?eDluSHFsTk85SXM0b0pVSDh5YnJaSVJnUGdsQWsyaUwrY0JoS2lueVp1bjZa?=
 =?utf-8?B?enBLL2lTM2ljQjVhWE55a21hSmNhd0xOS0hNK0ZBeGdmb1luRVREWjlrNDYz?=
 =?utf-8?B?VXBjTEhtY2w0UXVOU0t0QzlubVNzQzJDZ0E5TUpydDVXZXRXeDREL1N4YUdm?=
 =?utf-8?B?UnRNazlQTCtwazVZUjFjcmVTL25zSHlyTXg0MTdkZWZZalA2TEh3WFRBK3V2?=
 =?utf-8?B?ZjVhdzVsblpEditMTzNsVktHZFZ2VVN1djdVcWRERXpNQkxrMzdlUHJ0bllm?=
 =?utf-8?B?Tmw4OFJpdk44VUNJcUVMbW96T2kvQXpFZ3U1UWUwRkdsYTcxOWJ2Rlh3VWhH?=
 =?utf-8?B?SmpQQlR1TTlDMUJ4NFBrdEh6a0NONE5zdGNReWs4Nm1TS21HVXRrd3A1YzQy?=
 =?utf-8?B?bUpHc1dtd2dOQXVURG9waXdYaEdZSEx5dnhrSlR5VWVtMnliU2VWZDl5RUgr?=
 =?utf-8?B?QnJrT1lJSng1c3BidEttaUdrVmxLK0tyMXI5aktScldPSEc1a2lubVhYSlpr?=
 =?utf-8?B?dkxrbTZkcWplK3hPeEMvRzBuMUZEcEd1ZjRjWG9uQytzd3VJaEx0aXBzZTdV?=
 =?utf-8?B?TUlkWUduK0JzUGRKTlg3NzFzRm5wZnlxZ0FEd3BxZlEvQzNmV0dWRkhqYVpT?=
 =?utf-8?B?OVlxVFl1bVIzWVVidDkzUkthNlBJeU5YcmdWRGc0ZDFlUjBjSXZ4Mm1Ga1Z2?=
 =?utf-8?B?Mnh4Sm5mTmp1RVpuekplQ01HTEUrdVpiWllCdzc3SE1wS0JuTE0remlqMytN?=
 =?utf-8?B?clQ3TVdSRGM4UjVZOWZOUTFnSisyMmQvWmI1bU9kazF2ODdOTXUyeDM5Yi9E?=
 =?utf-8?B?K3ZtMXdhVnhzVDVONUtZdzF1RGw0WTNJMy83OE9GU2xRSEk5bVhSYWVreW9y?=
 =?utf-8?B?cUhURCs1a0pyUnkyeklIS016RlJGc2gyRk9WR3V6blJWeEUrRThHTkk4QmZ6?=
 =?utf-8?B?TDRDNkRtZ0JUbHhPN0M0Z2dyOTlXRkh2dHNOU2RraVZWLzBLZTYrRDg3TDUv?=
 =?utf-8?B?c1N4V0hRSmpoOTVMZE9mOGYxYWpNQVNNWVhGK0dxRWpDY1BXQnFlZmZPbzlE?=
 =?utf-8?B?SmZJS2tzdUFXUkJtdk5qd2QyQXpBRjZUUHB4Z1d3cHJpVkJOMjZGd1J1cSs4?=
 =?utf-8?B?QnA2N3N1TmdJTER5RUh6OG1WTmxJYUErZDVLR09VUGhXTUJoWlluRTVVWFJO?=
 =?utf-8?B?NUNIMENhSE9zYnFrakpFSTcrWVJablNOemxpWlZFT3NRZnZ3Rko1STZuZ3l1?=
 =?utf-8?B?dkR0azU4cFR3T2FCTUJqZXM0ZzlkMUFQN3pkcWtXZWFPdFIwZE9mSHZ3Q1V6?=
 =?utf-8?B?Yk9FOGdISVBqczBsTmFuT2xaeU9vc0E4UTR1MldUV2p1YWVvNm5ObjdNYWk5?=
 =?utf-8?B?OWExWVYyRXdnQzM3TDZtYXIwYTR3bExGYTdzWlp4UlhMTWhNa0R3WnkwWGpt?=
 =?utf-8?B?eUROaHVvd1Bpem5yTndjOTZxajNDMkR1K0t6UkJEV1lrVUI5d0pCT2FZQVcx?=
 =?utf-8?B?YUc4NEtHb0kvZ1ZBSlViVUpxRE95cjVHVlZ2YVdVdUQ2cGpjcHlnb3VUOTVy?=
 =?utf-8?B?eWhOQ1pRbSt5VTNIT3N3eStaajByY2RMSlIrSS9ZSTdrZ2VNZUFBVzh4OVRJ?=
 =?utf-8?B?TzVWV2puMTFPNDNadzRFSGg0SERyLzZST2FVekxaTktwWnpUa1JYNEczajJV?=
 =?utf-8?B?a2VKTStCWUZ5cmdoVXpoQ0RjYlRPUU5RMHdhZVRObXBWTlgzWHVKa052eHRK?=
 =?utf-8?B?eDBSKzJCUlYrejBOM1dCZUdQMWIxSzhLV1hqbXovem5BYWVMZGd2dGRLSFBY?=
 =?utf-8?B?VXl2ZGlGUHJRY1dGTXcxTmNScWU2V3JEWGJWMGVoRWhnNHVhdHRKLy80bWVZ?=
 =?utf-8?B?ZUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bfbc53a-6ac3-48d3-700a-08db571b75b3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 21:12:45.5533 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lyAARIoZu0HJRmWtDLZNfciD4p0nWApu+to12UC1p2H1rXRSWvQW+LSOudiMnm/lUGiyNoPQgBiP+FQzLbwuTDa4XvY9TY/8gRx/JGO+Ons=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6546
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
Cc: dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/17/2023 1:59 PM, John Harrison wrote:
> On 4/28/2023 11:58, Daniele Ceraolo Spurio wrote:
>> Now that each FW has its own reserved area, we can keep them always
>> pinned and skip the pin/unpin dance on reset. This will make things
>> easier for the 2-step HuC authentication, which requires the FW to be
>> pinned in GGTT after the xfer is completed.
>> Given that we use dummy vmas for the pinning, we do need to explicitly
>> re-pin on resume because the automated helper won't cover us.
>>
>> Signed-off-by: Daniele Ceraolo Spurio<daniele.ceraolospurio@intel.com>
>> Cc: Alan Previn<alan.previn.teres.alexis@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_ggtt.c      |  3 ++
>>   drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c |  7 ++++-
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.c    |  2 +-
>>   drivers/gpu/drm/i915/gt/uc/intel_huc.c    |  2 +-
>>   drivers/gpu/drm/i915/gt/uc/intel_uc.c     |  8 +++++
>>   drivers/gpu/drm/i915/gt/uc/intel_uc.h     |  2 ++
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c  | 36 ++++++++++++++++++-----
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h  |  5 +++-
>>   8 files changed, 53 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c 
>> b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> index 20915edc8bd9..ab71ed11de79 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> @@ -1322,6 +1322,9 @@ void i915_ggtt_resume(struct i915_ggtt *ggtt)
>>           ggtt->vm.scratch_range(&ggtt->vm, ggtt->error_capture.start,
>>                          ggtt->error_capture.size);
>>   +    list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
>> +        intel_uc_resume_mappings(&gt->uc);
>> +
>>       ggtt->invalidate(ggtt);
>>         if (flush)
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
>> index 64bff01026e8..af542e3cb3e9 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
>> @@ -80,7 +80,12 @@ void intel_gsc_uc_init_early(struct intel_gsc_uc 
>> *gsc)
>>   {
>>       struct intel_gt *gt = gsc_uc_to_gt(gsc);
>>   -    intel_uc_fw_init_early(&gsc->fw, INTEL_UC_FW_TYPE_GSC);
>> +    /*
>> +     * GSC FW needs to be copied to a dedicated memory allocations for
>> +     * loading (see gsc->local), so we don't need to GGTT map the FW 
>> image
>> +     * itself into GGTT.
>> +     */
>> +    intel_uc_fw_init_early(&gsc->fw, INTEL_UC_FW_TYPE_GSC, false);
>>       INIT_WORK(&gsc->work, gsc_work);
>>         /* we can arrive here from i915_driver_early_probe for primary
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> index c9f20385f6a0..2eb891b270ae 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> @@ -164,7 +164,7 @@ void intel_guc_init_early(struct intel_guc *guc)
>>       struct intel_gt *gt = guc_to_gt(guc);
>>       struct drm_i915_private *i915 = gt->i915;
>>   -    intel_uc_fw_init_early(&guc->fw, INTEL_UC_FW_TYPE_GUC);
>> +    intel_uc_fw_init_early(&guc->fw, INTEL_UC_FW_TYPE_GUC, true);
>>       intel_guc_ct_init_early(&guc->ct);
>>       intel_guc_log_init_early(&guc->log);
>>       intel_guc_submission_init_early(guc);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> index aefdaa62da99..9721761373fb 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> @@ -276,7 +276,7 @@ void intel_huc_init_early(struct intel_huc *huc)
>>       struct drm_i915_private *i915 = huc_to_gt(huc)->i915;
>>       struct intel_gt *gt = huc_to_gt(huc);
>>   -    intel_uc_fw_init_early(&huc->fw, INTEL_UC_FW_TYPE_HUC);
>> +    intel_uc_fw_init_early(&huc->fw, INTEL_UC_FW_TYPE_HUC, true);
>>         /*
>>        * we always init the fence as already completed, even if HuC 
>> is not
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> index 996168312340..b6adfda3761e 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> @@ -697,6 +697,12 @@ void intel_uc_suspend(struct intel_uc *uc)
>>       }
>>   }
>>   +static void __uc_resume_mappings(struct intel_uc *uc)
>> +{
>> +    intel_uc_fw_resume_mapping(&uc->guc.fw);
>> +    intel_uc_fw_resume_mapping(&uc->huc.fw);
>> +}
>> +
>>   static int __uc_resume(struct intel_uc *uc, bool enable_communication)
>>   {
>>       struct intel_guc *guc = &uc->guc;
>> @@ -764,4 +770,6 @@ static const struct intel_uc_ops uc_ops_on = {
>>         .init_hw = __uc_init_hw,
>>       .fini_hw = __uc_fini_hw,
>> +
>> +    .resume_mappings = __uc_resume_mappings,
>>   };
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.h 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
>> index 5d0f1bcc381e..c2783e6e752b 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
>> @@ -24,6 +24,7 @@ struct intel_uc_ops {
>>       void (*fini)(struct intel_uc *uc);
>>       int (*init_hw)(struct intel_uc *uc);
>>       void (*fini_hw)(struct intel_uc *uc);
>> +    void (*resume_mappings)(struct intel_uc *uc);
>>   };
>>     struct intel_uc {
>> @@ -113,6 +114,7 @@ intel_uc_ops_function(init, init, int, 0);
>>   intel_uc_ops_function(fini, fini, void, );
>>   intel_uc_ops_function(init_hw, init_hw, int, 0);
>>   intel_uc_ops_function(fini_hw, fini_hw, void, );
>> +intel_uc_ops_function(resume_mappings, resume_mappings, void, );
>>   #undef intel_uc_ops_function
>>     #endif
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> index 6b71b9febd74..03f0b258aea7 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> @@ -422,12 +422,14 @@ static void __uc_fw_user_override(struct 
>> drm_i915_private *i915, struct intel_uc
>>    * intel_uc_fw_init_early - initialize the uC object and select the 
>> firmware
>>    * @uc_fw: uC firmware
>>    * @type: type of uC
>> + * @needs_ggtt_mapping: whether the FW needs to be GGTT mapped for 
>> loading
>>    *
>>    * Initialize the state of our uC object and relevant tracking and 
>> select the
>>    * firmware to fetch and load.
>>    */
>>   void intel_uc_fw_init_early(struct intel_uc_fw *uc_fw,
>> -                enum intel_uc_fw_type type)
>> +                enum intel_uc_fw_type type,
>> +                bool needs_ggtt_mapping)
>>   {
>>       struct drm_i915_private *i915 = ____uc_fw_to_gt(uc_fw, 
>> type)->i915;
>>   @@ -440,6 +442,7 @@ void intel_uc_fw_init_early(struct intel_uc_fw 
>> *uc_fw,
>>       GEM_BUG_ON(uc_fw->file_selected.path);
>>         uc_fw->type = type;
>> +    uc_fw->needs_ggtt_mapping = needs_ggtt_mapping;
>>         if (HAS_GT_UC(i915)) {
>>           __uc_fw_auto_select(i915, uc_fw);
>> @@ -699,7 +702,7 @@ static int try_firmware_load(struct intel_uc_fw 
>> *uc_fw, const struct firmware **
>>       if (err)
>>           return err;
>>   -    if ((*fw)->size > INTEL_UC_RSVD_GGTT_PER_FW) {
>> +    if (uc_fw->needs_ggtt_mapping && (*fw)->size > 
>> INTEL_UC_RSVD_GGTT_PER_FW) {
>>           gt_err(gt, "%s firmware %s: size (%zuKB) exceeds max 
>> supported size (%uKB)\n",
>>                  intel_uc_fw_type_repr(uc_fw->type), 
>> uc_fw->file_selected.path,
>>                  (*fw)->size / SZ_1K, INTEL_UC_RSVD_GGTT_PER_FW / 
>> SZ_1K);
>> @@ -880,6 +883,9 @@ static void uc_fw_bind_ggtt(struct intel_uc_fw 
>> *uc_fw)
>>       struct i915_vma_resource *dummy = &uc_fw->dummy;
>>       u32 pte_flags = 0;
>>   +    if (!uc_fw->needs_ggtt_mapping)
>> +        return;
>> +
>>       dummy->start = uc_fw_ggtt_offset(uc_fw);
>>       dummy->node_size = obj->base.size;
>>       dummy->bi.pages = obj->mm.pages;
>> @@ -901,11 +907,13 @@ static void uc_fw_bind_ggtt(struct intel_uc_fw 
>> *uc_fw)
>>     static void uc_fw_unbind_ggtt(struct intel_uc_fw *uc_fw)
>>   {
>> -    struct drm_i915_gem_object *obj = uc_fw->obj;
>>       struct i915_ggtt *ggtt = __uc_fw_to_gt(uc_fw)->ggtt;
>> -    u64 start = uc_fw_ggtt_offset(uc_fw);
>> +    struct i915_vma_resource *dummy = &uc_fw->dummy;
> I'm confused as to why this was using uc_fw->obj previously? Why was 
> it not originally using dummy? And why if that was correct before, why 
> is not correct now?

Both are correct, because the values inside of dummy are initialized 
based on uc_fw->obj and uc_fw_ggtt_offset(). Since now we're 
perma-pinning the binary, I wanted to move to a vma-centric approach for 
the functions, which also makes it easier to check if the vma has 
actually been pinned (via the dummy->node_size check below) in the 
fini/unbind path; this check was not required before because the vma was 
immediately unpinned after load and therefore we didn't need to check it 
in the fini path.

Also, the "dummy" name is probably not valid anymore; it was used 
because the vma structure was not allocated via the normal functions and 
not kept around, but now that it is it's probably better to rename it to 
just vma_res or something like that.

Daniele

>
>> +
>> +    if (!dummy->node_size)
>> +        return;
>>   -    ggtt->vm.clear_range(&ggtt->vm, start, obj->base.size);
>> +    ggtt->vm.clear_range(&ggtt->vm, dummy->start, dummy->node_size);
>>   }
>>     static int uc_fw_xfer(struct intel_uc_fw *uc_fw, u32 dst_offset, 
>> u32 dma_flags)
>> @@ -922,7 +930,7 @@ static int uc_fw_xfer(struct intel_uc_fw *uc_fw, 
>> u32 dst_offset, u32 dma_flags)
>>       intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
>>         /* Set the source address for the uCode */
>> -    offset = uc_fw_ggtt_offset(uc_fw);
>> +    offset = uc_fw->dummy.start;
> Same question here.
>
> John.
>
>>       GEM_BUG_ON(upper_32_bits(offset) & 0xFFFF0000);
>>       intel_uncore_write_fw(uncore, DMA_ADDR_0_LOW, 
>> lower_32_bits(offset));
>>       intel_uncore_write_fw(uncore, DMA_ADDR_0_HIGH, 
>> upper_32_bits(offset));
>> @@ -996,9 +1004,7 @@ int intel_uc_fw_upload(struct intel_uc_fw 
>> *uc_fw, u32 dst_offset, u32 dma_flags)
>>           return -ENOEXEC;
>>         /* Call custom loader */
>> -    uc_fw_bind_ggtt(uc_fw);
>>       err = uc_fw_xfer(uc_fw, dst_offset, dma_flags);
>> -    uc_fw_unbind_ggtt(uc_fw);
>>       if (err)
>>           goto fail;
>>   @@ -1102,6 +1108,8 @@ int intel_uc_fw_init(struct intel_uc_fw *uc_fw)
>>           goto out_unpin;
>>       }
>>   +    uc_fw_bind_ggtt(uc_fw);
>> +
>>       return 0;
>>     out_unpin:
>> @@ -1112,6 +1120,7 @@ int intel_uc_fw_init(struct intel_uc_fw *uc_fw)
>>     void intel_uc_fw_fini(struct intel_uc_fw *uc_fw)
>>   {
>> +    uc_fw_unbind_ggtt(uc_fw);
>>       uc_fw_rsa_data_destroy(uc_fw);
>>         if (i915_gem_object_has_pinned_pages(uc_fw->obj))
>> @@ -1120,6 +1129,17 @@ void intel_uc_fw_fini(struct intel_uc_fw *uc_fw)
>>       intel_uc_fw_change_status(uc_fw, INTEL_UC_FIRMWARE_AVAILABLE);
>>   }
>>   +void intel_uc_fw_resume_mapping(struct intel_uc_fw *uc_fw)
>> +{
>> +    if (!intel_uc_fw_is_available(uc_fw))
>> +        return;
>> +
>> +    if (!i915_gem_object_has_pinned_pages(uc_fw->obj))
>> +        return;
>> +
>> +    uc_fw_bind_ggtt(uc_fw);
>> +}
>> +
>>   /**
>>    * intel_uc_fw_cleanup_fetch - cleanup uC firmware
>>    * @uc_fw: uC firmware
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>> index 6ba00e6b3975..26a9d6e0dc00 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>> @@ -105,6 +105,7 @@ struct intel_uc_fw {
>>        * threaded as it done during driver load (inherently single 
>> threaded)
>>        * or during a GT reset (mutex guarantees single threaded).
>>        */
>> +    bool needs_ggtt_mapping;
>>       struct i915_vma_resource dummy;
>>       struct i915_vma *rsa_data;
>>   @@ -282,12 +283,14 @@ static inline u32 
>> intel_uc_fw_get_upload_size(struct intel_uc_fw *uc_fw)
>>   }
>>     void intel_uc_fw_init_early(struct intel_uc_fw *uc_fw,
>> -                enum intel_uc_fw_type type);
>> +                enum intel_uc_fw_type type,
>> +                bool needs_ggtt_mapping);
>>   int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw);
>>   void intel_uc_fw_cleanup_fetch(struct intel_uc_fw *uc_fw);
>>   int intel_uc_fw_upload(struct intel_uc_fw *uc_fw, u32 offset, u32 
>> dma_flags);
>>   int intel_uc_fw_init(struct intel_uc_fw *uc_fw);
>>   void intel_uc_fw_fini(struct intel_uc_fw *uc_fw);
>> +void intel_uc_fw_resume_mapping(struct intel_uc_fw *uc_fw);
>>   size_t intel_uc_fw_copy_rsa(struct intel_uc_fw *uc_fw, void *dst, 
>> u32 max_len);
>>   int intel_uc_fw_mark_load_failed(struct intel_uc_fw *uc_fw, int err);
>>   void intel_uc_fw_dump(const struct intel_uc_fw *uc_fw, struct 
>> drm_printer *p);
>

