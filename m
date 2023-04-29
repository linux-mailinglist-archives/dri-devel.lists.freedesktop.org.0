Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4066F21F9
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 03:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6459B10EE3E;
	Sat, 29 Apr 2023 01:21:25 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB24710EE31;
 Sat, 29 Apr 2023 01:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682731282; x=1714267282;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BXiNJrTMKsawmVPVWEOEtOsvZYbECTXVnAIVw9lmOEk=;
 b=C5L7WSBvdZD7UC9JvtmqL+7ayM+bp2aL3VQYH+FCxbEa8H5ytxxacAPY
 /VF+8w2wGxFE2IT+DfWPj09DF+0cuTtMgTsgjFZKQwdmdixWqtTp5TTDd
 k9PZe2+fypoMHAzyA+SLGHUcFeErhOINlCUu9aKF2DYTax8xPUhWXesmb
 PGl+FajGAIOy2ZQeKWSN/YwM5C1Kcnz5Jn76VSBBc8/k8D86CMXU2A856
 jMeFWGQq3+AQBS+3LGyXVX29Ej3A8Jb1TqTcwmcrVSOrpnlJaE2STmcPc
 MjClS6RJKL+qJNCl1xlVNWFCkqLAPWCfxhRv8x+5VpXRVgkG1fk5lhS1L w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="349922998"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; d="scan'208";a="349922998"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 18:21:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="645345797"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; d="scan'208";a="645345797"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 28 Apr 2023 18:21:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 28 Apr 2023 18:21:21 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 28 Apr 2023 18:21:21 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 28 Apr 2023 18:21:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AaBbU8DTViP+/FcnRTL0Lpht6qaqeo8tjjzE0YNAXX+LK1pSgitlgHv8Uhh16BCp1nMoH+bQIbo5T+uG4Z0Itl9YqvfkoW4Sg8UxIQhCwhKd9ifKyRlBW6EwrejTXQX5t44YVmfyqyeYT4ZUEbEHEJXb5TiYRzMbKDpwZKuRomnVvBsC435Gs/r7ke08UW/1Edgy2UvB827QXmhe6ch5Iste/aGReXhcsE9HIh++5WA1uUMR312qK+sAjuJSVJ1GJz2gCT3n/U13hngKt5i2sg500xZQELnFbW10v05vv43MXQ2/lrs87J2W7Lwmd/E+NtvUiq0Fjk3I3mNiO89J4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MFwHVFPemE2wcR4TwGZ3MOL7uRWUoWRXFE2SYN19Gdw=;
 b=Msl6vKo9+eUZE2jYXqgshcrdyNhPFJ5DLGaJBF01vDQ2laC2VrHX06MG+myIpHni14i2O5Lg0231PBBhuRgK2qbbE9iHs3kYRf7RIWU6UZ+Z9/uGdZg13i+Os2rS1Ob4G5s6lbLrXzOKIBoMbM89u52cZZ/qJUBTNFSpiTZV/TVTISPINi1g6qDvkwsRYzikflWTEB0BPV2VnSfePvm+222FM2qb8PIK2GZRMtMkdFLxWJJ4zVhrJm/GVxiavAc7diSGbOOR3IcmPGEpsBB+Bf1VcrJUTjCrCA2WaWm/uoFSzATD5qTObb4zueppy7ey7ifcOEUjgLOMU1w4Z11zLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SN7PR11MB6924.namprd11.prod.outlook.com (2603:10b6:806:2ab::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.33; Sat, 29 Apr 2023 01:21:18 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0%7]) with mapi id 15.20.6340.023; Sat, 29 Apr 2023
 01:21:18 +0000
Message-ID: <ff0335b6-2c93-2aa5-8a02-1537af0d0103@intel.com>
Date: Fri, 28 Apr 2023 18:21:15 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH 4/6] drm/i915/uc: Enhancements to firmware
 table validation
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230421011525.3282664-1-John.C.Harrison@Intel.com>
 <20230421011525.3282664-5-John.C.Harrison@Intel.com>
 <7716eaf2-41e8-9b28-3b87-70b5ff2962a3@intel.com>
 <8540acf3-82bc-629c-1bb2-24ee377e851d@intel.com>
 <579dc07f-70d5-c444-17eb-89a5d4a38261@intel.com>
 <c60473ea-2131-7312-5942-890244c5c9d4@intel.com>
 <ecd44241-4b57-3da7-886d-9bd747eb3dbb@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <ecd44241-4b57-3da7-886d-9bd747eb3dbb@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::17) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|SN7PR11MB6924:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fecb1ed-a9d6-4b3d-2d8d-08db48500831
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /dBuyNuUsvksKMrv+08qFNv8UX2TKuup8QoZN3G7dqRtlSoDoTxVvNRgQ5q8XBjKZ2CSVjFu9YsfMzZpvWLt5Hm26XxnTMdUe0Wtauktpd5TBAQGktjT/zBwEBMRd6MbOdd+sPYzyPUUsxh480+sF+OPCgoUOJAzFTxpTzvcBcZHDAoleBIxGr6WFoHy4vBywMVTXVyCF+Ep66H3tgcUcBnMnhiRq+Y6xdbAWVZwQPmTIuVkJwnVMU6To/jfqRxwwnlExr2R2ucHdSJBQmiIDmsFQGLTgL8WFOojaGM3t1u2izghzQ1imCW694zi3n/Z1QJn/fm7m97xVoNJFi7mtq+O5Gg4jxzIyarIdz6ihjDemTDlpsiGY9QX0O1aIEAHl1O/QJ3jNMJYsz3EK7aOCmnkRMbpdE01Vszymh3StpcrNV1HrDdUQ9IMv62oK0EympqOWrShXq4DzLO+jH0grCYgJt3lt0GYIZ33tMqoQxKwhrIs05I835Nj13MjIB7XB6pPvN4/H15bejI5ELzeYEPasvFZZ3y72YvS/kwUJQmEZ0BRaynzGxGtEjSY9LwomNahdRPwybrXPpAvz5iLRUy0DGCpR0njsptGHy0CMjtshFlB960CZAFYu78VDcHXGMxkFl+wANnLkYdxf2PnWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(396003)(366004)(136003)(376002)(451199021)(82960400001)(83380400001)(5660300002)(8676002)(316002)(2616005)(38100700002)(2906002)(41300700001)(66946007)(66556008)(31686004)(4326008)(66476007)(6666004)(30864003)(450100002)(8936002)(478600001)(86362001)(36756003)(6486002)(6506007)(26005)(186003)(53546011)(6512007)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1pzcmM5SFUyZ3cyRVpMUExYazNlUWVYODh2WklKaHFwS0UvWnd4Z0xQQWdP?=
 =?utf-8?B?N3ltdThCbU5mclN2L0NxbU50YjNyQTRyNmNlTHRYTldNdzR4Z01xUXA4eXRl?=
 =?utf-8?B?N0lXS1NDMUlLYmtsM3lsTlpQNDE3d1podUVDZHdyR29xbXorY0JUVEswYVhT?=
 =?utf-8?B?dER6SWlUcWE2RUlBbllSSWVISXZoYTJxWGRFeXloTEc5ejNFTGhiZXhVRC85?=
 =?utf-8?B?YVMyREo0NFZRYWNqdEV4M2xCaHNOTExTV21Zd0V2RlkvdWdPaEkvUm9WVzEv?=
 =?utf-8?B?b2JPamp2d1dmNTMrR0x5aUFSUldyaXdDUTZkNE83Mmw5NUdtVVFUMDhSRkZ6?=
 =?utf-8?B?TG5ZcTFORFBiZVQwdGNONUowUlNFY1dNbE96QUhyQ2I5eWp6M3FLQ3dDR3do?=
 =?utf-8?B?TVUydkhOblQ0emU1M0VpRGVIeUphbzdPd3grSHpVUVNIR0lLTkpVSUxDenlF?=
 =?utf-8?B?QmJmWVJkOEpiWmhMc3pKY2tFTXdHUGxqb0RmOXlSN2x3ZTd0OWNNcERDdlBo?=
 =?utf-8?B?NzloYUhpTExtVkQ1YXFXNlo0K3JwYm1yZE45a2hMZ2JWdFBDVElEcTFqRzdw?=
 =?utf-8?B?NUZacHFoRjB2aGpYT0ppUEpNYTAwRWttNTdacFlxWGlPSkNLRDFhbEE3TEVi?=
 =?utf-8?B?Sk15NHBEWXgrOUIyUWRzb1F0UElLRy9UM0s1TGdWd3B3clBaRWYrK1ZCYWwr?=
 =?utf-8?B?V01tNTBTVVZJU0h1c1FKUWZuaHNtNmZ3aGY1dXZqVUFvRWJXN2lKQVFVcHdM?=
 =?utf-8?B?cit1OEE4dUZnb2Z1VDl4SkM0N01YNGhUM3Z5TVlkbnVJMW9TcVFMVlNhWHFT?=
 =?utf-8?B?L2I2aE94aVRrbHg3cnlvWmkzV0hkTXJFUDdkZllhRVBqTVJ5bXUyLy9WOFV3?=
 =?utf-8?B?VGU2UlJpbDk2ZTlZcXU5T0xSWlF3SEp0cUczZVVSYUZwWE5tcGZ4K3IxU2Fp?=
 =?utf-8?B?cmhJbkNPcGVqK1hVaEpUOTRna01nS3BZcWQyZXg4SGRra29RR2VVVVRlM3lo?=
 =?utf-8?B?R2xkVkNJeDBXc09VSzhXVE9ZR2VQRTlpRGRoRU9nR2NxM3h1SmYwNzVmSDZ5?=
 =?utf-8?B?MzVPNzc1Zks2NVJaTGZyK2E4QTRrRlNzY013eWJucnl0ZjdldUhVTG1RSzYx?=
 =?utf-8?B?eFhQdVpyajNERGNsWW5NQ0VyWW9QcGY0QVNRSGc5ajBJbzhsUEEzU1BsZU9T?=
 =?utf-8?B?UHpvdmlZUkhyK0lkM1lzNFJFR0l6TStGTmhvSlFrM2dyM3l0RVRwSktvUE5B?=
 =?utf-8?B?ekovL0c1S05tNXlhOVFheGN6UHEwZHBZdXlWT0RnUGc2bE1yMDA5OVREUTdy?=
 =?utf-8?B?SFUrelBTRnp3MlUrclpXOVFVeHhIWUdjWERodHFUb1ZVa01UdmtnVlJoRENy?=
 =?utf-8?B?NGpnT0E4VC96dWFsS0VpRW9lSXl5STdHa001eUtCakVmL3RVaEI4SVdkbzFE?=
 =?utf-8?B?eEJnTHR2cjJVbkJHeEYrY09Lc0hZYmphMFpRekZWR3UwczZ5WVJZMDlMTEgx?=
 =?utf-8?B?V1g3WStQa2hkRTJYVGU2NkE4Y25HVWVTcGExMk85MlpEdjM4MHFmd0Rudlh1?=
 =?utf-8?B?OTBjUEZGOGpTdGREblI2T2JvcmEzRHl0RU1mcm5ONCtqeDZvUk1OWno4N0kw?=
 =?utf-8?B?aFNzelBWbDVPUHNsZHJOOHJRWWtPT0c1Uk5IdkZBbmNIWnZIY1YvRzJzZG8r?=
 =?utf-8?B?cy9Zd0JwR3EwOXE4OXl3MHdmT3orMlJCRnNocG5sYkpOUWJEbEx4V0RNRU94?=
 =?utf-8?B?T0hib3Ivcml0eUFxNENNUlVWbm9aVmd0c2hoN0JwVm8rZFNvUTJLazhzZlpo?=
 =?utf-8?B?RHpjMUxTeHIvTWtZM2J2SHE2Y3o1UGNaUER2NmdyWitNdjBjTFZtY1JRSUpC?=
 =?utf-8?B?ZHNBejFkaUo3NFZOeWRHNFJNMy9NcXZya1VYT1R5elpJUHFmTXdzTjM1L1Vr?=
 =?utf-8?B?aTh2NGJ5OVRKSXBtV0pwQ0dxY2RxUjdvaFRSVVh5ZjhXNzFBS3F5WTJsNS8z?=
 =?utf-8?B?WFEydmJaQ2tqU3prMWNRcEprN2RYNlVwckZtM3RKN0p0RkY1VkhCRTBoQUh6?=
 =?utf-8?B?bHF4RWptcHFrSFM4YzdKZ1ZsUElJYTFoNGxPR01PNW55WHlUU2tMbkh3OXFr?=
 =?utf-8?B?VWEvalhqZ0h5c252SFAzK0tWQWVVSlVFdFJ5dGhKSHNGQzhvVzZGM1JoQXJS?=
 =?utf-8?Q?hftIXHOxDK5OgyeZe6RxN5U=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fecb1ed-a9d6-4b3d-2d8d-08db48500831
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2023 01:21:17.7276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UwrerkSx3iZoP5zwJ1z5dsrPXehdK1Hd4wKueAlpEt7JKLqXrbA/GNPj8t8NG5rIf+71QVUJvpFmv9Fx2TaPfBnrsmky3V19AjO87yKifBE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6924
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/28/2023 5:32 PM, John Harrison wrote:
> On 4/28/2023 17:30, John Harrison wrote:
>> On 4/28/2023 17:26, Ceraolo Spurio, Daniele wrote:
>>> On 4/28/2023 5:16 PM, John Harrison wrote:
>>>> On 4/28/2023 17:04, Ceraolo Spurio, Daniele wrote:
>>>>> On 4/20/2023 6:15 PM, John.C.Harrison@Intel.com wrote:
>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>
>>>>>> The validation of the firmware table was being done inside the code
>>>>>> for scanning the table for the next available firmware blob. 
>>>>>> Which is
>>>>>> unnecessary. So pull it out into a separate function that is only
>>>>>> called once per blob type at init time.
>>>>>>
>>>>>> Also, drop the CONFIG_SELFTEST requirement and make errors terminal.
>>>>>> It was mentioned that potential issues with backports would not be
>>>>>> caught by regular pre-merge CI as that only occurs on tip not stable
>>>>>> branches. Making the validation unconditional and failing driver 
>>>>>> load
>>>>>> on detecting of a problem ensures that such backports will also be
>>>>>> validated correctly.
>>>>>>
>>>>>> v2: Change to unconditionally fail module load on a validation error
>>>>>> (review feedback/discussion with Daniele).
>>>>>>
>>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>>> ---
>>>>>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 157 
>>>>>> +++++++++++++----------
>>>>>>   1 file changed, 92 insertions(+), 65 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c 
>>>>>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>>>>> index c9cd9bb47577f..eb52e8db9ae0b 100644
>>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>>>>> @@ -233,20 +233,22 @@ struct fw_blobs_by_type {
>>>>>>       u32 count;
>>>>>>   };
>>>>>>   +static const struct uc_fw_platform_requirement blobs_guc[] = {
>>>>>> +    INTEL_GUC_FIRMWARE_DEFS(MAKE_FW_LIST, GUC_FW_BLOB, 
>>>>>> GUC_FW_BLOB_MMP)
>>>>>> +};
>>>>>> +
>>>>>> +static const struct uc_fw_platform_requirement blobs_huc[] = {
>>>>>> +    INTEL_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB, 
>>>>>> HUC_FW_BLOB_MMP, HUC_FW_BLOB_GSC)
>>>>>> +};
>>>>>> +
>>>>>> +static const struct fw_blobs_by_type 
>>>>>> blobs_all[INTEL_UC_FW_NUM_TYPES] = {
>>>>>> +    [INTEL_UC_FW_TYPE_GUC] = { blobs_guc, ARRAY_SIZE(blobs_guc) },
>>>>>> +    [INTEL_UC_FW_TYPE_HUC] = { blobs_huc, ARRAY_SIZE(blobs_huc) },
>>>>>> +};
>>>>>> +
>>>>>>   static void
>>>>>>   __uc_fw_auto_select(struct drm_i915_private *i915, struct 
>>>>>> intel_uc_fw *uc_fw)
>>>>>>   {
>>>>>> -    static const struct uc_fw_platform_requirement blobs_guc[] = {
>>>>>> -        INTEL_GUC_FIRMWARE_DEFS(MAKE_FW_LIST, GUC_FW_BLOB, 
>>>>>> GUC_FW_BLOB_MMP)
>>>>>> -    };
>>>>>> -    static const struct uc_fw_platform_requirement blobs_huc[] = {
>>>>>> -        INTEL_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB, 
>>>>>> HUC_FW_BLOB_MMP, HUC_FW_BLOB_GSC)
>>>>>> -    };
>>>>>> -    static const struct fw_blobs_by_type 
>>>>>> blobs_all[INTEL_UC_FW_NUM_TYPES] = {
>>>>>> -        [INTEL_UC_FW_TYPE_GUC] = { blobs_guc, 
>>>>>> ARRAY_SIZE(blobs_guc) },
>>>>>> -        [INTEL_UC_FW_TYPE_HUC] = { blobs_huc, 
>>>>>> ARRAY_SIZE(blobs_huc) },
>>>>>> -    };
>>>>>> -    static bool verified[INTEL_UC_FW_NUM_TYPES];
>>>>>>       const struct uc_fw_platform_requirement *fw_blobs;
>>>>>>       enum intel_platform p = INTEL_INFO(i915)->platform;
>>>>>>       u32 fw_count;
>>>>>> @@ -286,6 +288,11 @@ __uc_fw_auto_select(struct drm_i915_private 
>>>>>> *i915, struct intel_uc_fw *uc_fw)
>>>>>>               continue;
>>>>>>             if (uc_fw->file_selected.path) {
>>>>>> +            /*
>>>>>> +             * Continuing an earlier search after a found blob 
>>>>>> failed to load.
>>>>>> +             * Once the previously chosen path has been found, 
>>>>>> clear it out
>>>>>> +             * and let the search continue from there.
>>>>>> +             */
>>>>>>               if (uc_fw->file_selected.path == blob->path)
>>>>>>                   uc_fw->file_selected.path = NULL;
>>>>>>   @@ -306,76 +313,91 @@ __uc_fw_auto_select(struct 
>>>>>> drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>>>>>>           /* Failed to find a match for the last attempt?! */
>>>>>>           uc_fw->file_selected.path = NULL;
>>>>>>       }
>>>>>> +}
>>>>>>   -    /* make sure the list is ordered as expected */
>>>>>> -    if (IS_ENABLED(CONFIG_DRM_I915_SELFTEST) && 
>>>>>> !verified[uc_fw->type]) {
>>>>>> -        verified[uc_fw->type] = true;
>>>>>> +static bool validate_fw_table_type(struct drm_i915_private 
>>>>>> *i915, enum intel_uc_fw_type type)
>>>>>> +{
>>>>>> +    const struct uc_fw_platform_requirement *fw_blobs;
>>>>>> +    u32 fw_count;
>>>>>> +    int i;
>>>>>>   -        for (i = 1; i < fw_count; i++) {
>>>>>> -            /* Next platform is good: */
>>>>>> -            if (fw_blobs[i].p < fw_blobs[i - 1].p)
>>>>>> -                continue;
>>>>>> +    if (type >= ARRAY_SIZE(blobs_all)) {
>>>>>> +        drm_err(&i915->drm, "No blob array for %s\n", 
>>>>>> intel_uc_fw_type_repr(type));
>>>>>> +        return false;
>>>>>> +    }
>>>>>>   -            /* Next platform revision is good: */
>>>>>> -            if (fw_blobs[i].p == fw_blobs[i - 1].p &&
>>>>>> -                fw_blobs[i].rev < fw_blobs[i - 1].rev)
>>>>>> -                continue;
>>>>>> +    fw_blobs = blobs_all[type].blobs;
>>>>>> +    fw_count = blobs_all[type].count;
>>>>>>   -            /* Platform/revision must be in order: */
>>>>>> -            if (fw_blobs[i].p != fw_blobs[i - 1].p ||
>>>>>> -                fw_blobs[i].rev != fw_blobs[i - 1].rev)
>>>>>> -                goto bad;
>>>>>> +    if (!fw_count)
>>>>>> +        return true;
>>>>>>   -            /* Next major version is good: */
>>>>>> -            if (fw_blobs[i].blob.major < fw_blobs[i - 
>>>>>> 1].blob.major)
>>>>>> -                continue;
>>>>>> +    /* make sure the list is ordered as expected */
>>>>>> +    for (i = 1; i < fw_count; i++) {
>>>>>> +        /* Next platform is good: */
>>>>>> +        if (fw_blobs[i].p < fw_blobs[i - 1].p)
>>>>>> +            continue;
>>>>>>   -            /* New must be before legacy: */
>>>>>> -            if (!fw_blobs[i].blob.legacy && fw_blobs[i - 
>>>>>> 1].blob.legacy)
>>>>>> -                goto bad;
>>>>>> +        /* Next platform revision is good: */
>>>>>> +        if (fw_blobs[i].p == fw_blobs[i - 1].p &&
>>>>>> +            fw_blobs[i].rev < fw_blobs[i - 1].rev)
>>>>>> +            continue;
>>>>>>   -            /* New to legacy also means 0.0 to X.Y (HuC), or 
>>>>>> X.0 to X.Y (GuC) */
>>>>>> -            if (fw_blobs[i].blob.legacy && !fw_blobs[i - 
>>>>>> 1].blob.legacy) {
>>>>>> -                if (!fw_blobs[i - 1].blob.major)
>>>>>> -                    continue;
>>>>>> +        /* Platform/revision must be in order: */
>>>>>> +        if (fw_blobs[i].p != fw_blobs[i - 1].p ||
>>>>>> +            fw_blobs[i].rev != fw_blobs[i - 1].rev)
>>>>>> +            goto bad;
>>>>>>   -                if (fw_blobs[i].blob.major == fw_blobs[i - 
>>>>>> 1].blob.major)
>>>>>> -                    continue;
>>>>>> -            }
>>>>>> +        /* Next major version is good: */
>>>>>> +        if (fw_blobs[i].blob.major < fw_blobs[i - 1].blob.major)
>>>>>> +            continue;
>>>>>>   -            /* Major versions must be in order: */
>>>>>> -            if (fw_blobs[i].blob.major != fw_blobs[i - 
>>>>>> 1].blob.major)
>>>>>> -                goto bad;
>>>>>> +        /* New must be before legacy: */
>>>>>> +        if (!fw_blobs[i].blob.legacy && fw_blobs[i - 
>>>>>> 1].blob.legacy)
>>>>>> +            goto bad;
>>>>>>   -            /* Next minor version is good: */
>>>>>> -            if (fw_blobs[i].blob.minor < fw_blobs[i - 
>>>>>> 1].blob.minor)
>>>>>> +        /* New to legacy also means 0.0 to X.Y (HuC), or X.0 to 
>>>>>> X.Y (GuC) */
>>>>>> +        if (fw_blobs[i].blob.legacy && !fw_blobs[i - 
>>>>>> 1].blob.legacy) {
>>>>>> +            if (!fw_blobs[i - 1].blob.major)
>>>>>>                   continue;
>>>>>>   -            /* Minor versions must be in order: */
>>>>>> -            if (fw_blobs[i].blob.minor != fw_blobs[i - 
>>>>>> 1].blob.minor)
>>>>>> -                goto bad;
>>>>>> -
>>>>>> -            /* Patch versions must be in order: */
>>>>>> -            if (fw_blobs[i].blob.patch <= fw_blobs[i - 
>>>>>> 1].blob.patch)
>>>>>> +            if (fw_blobs[i].blob.major == fw_blobs[i - 
>>>>>> 1].blob.major)
>>>>>>                   continue;
>>>>>> +        }
>>>>>> +
>>>>>> +        /* Major versions must be in order: */
>>>>>> +        if (fw_blobs[i].blob.major != fw_blobs[i - 1].blob.major)
>>>>>> +            goto bad;
>>>>>> +
>>>>>> +        /* Next minor version is good: */
>>>>>> +        if (fw_blobs[i].blob.minor < fw_blobs[i - 1].blob.minor)
>>>>>> +            continue;
>>>>>> +
>>>>>> +        /* Minor versions must be in order: */
>>>>>> +        if (fw_blobs[i].blob.minor != fw_blobs[i - 1].blob.minor)
>>>>>> +            goto bad;
>>>>>> +
>>>>>> +        /* Patch versions must be in order: */
>>>>>> +        if (fw_blobs[i].blob.patch <= fw_blobs[i - 1].blob.patch)
>>>>>> +            continue;
>>>>>>     bad:
>>>>>> -            drm_err(&i915->drm, "Invalid %s blob order: %s r%u 
>>>>>> %s%d.%d.%d comes before %s r%u %s%d.%d.%d\n",
>>>>>> -                intel_uc_fw_type_repr(uc_fw->type),
>>>>>> -                intel_platform_name(fw_blobs[i - 1].p), 
>>>>>> fw_blobs[i - 1].rev,
>>>>>> -                fw_blobs[i - 1].blob.legacy ? "L" : "v",
>>>>>> -                fw_blobs[i - 1].blob.major,
>>>>>> -                fw_blobs[i - 1].blob.minor,
>>>>>> -                fw_blobs[i - 1].blob.patch,
>>>>>> -                intel_platform_name(fw_blobs[i].p), 
>>>>>> fw_blobs[i].rev,
>>>>>> -                fw_blobs[i].blob.legacy ? "L" : "v",
>>>>>> -                fw_blobs[i].blob.major,
>>>>>> -                fw_blobs[i].blob.minor,
>>>>>> -                fw_blobs[i].blob.patch);
>>>>>> -
>>>>>> -            uc_fw->file_selected.path = NULL;
>>>>>> -        }
>>>>>> +        drm_err(&i915->drm, "Invalid %s blob order: %s r%u 
>>>>>> %s%d.%d.%d comes before %s r%u %s%d.%d.%d\n",
>>>>>> +            intel_uc_fw_type_repr(type),
>>>>>> +            intel_platform_name(fw_blobs[i - 1].p), fw_blobs[i - 
>>>>>> 1].rev,
>>>>>> +            fw_blobs[i - 1].blob.legacy ? "L" : "v",
>>>>>> +            fw_blobs[i - 1].blob.major,
>>>>>> +            fw_blobs[i - 1].blob.minor,
>>>>>> +            fw_blobs[i - 1].blob.patch,
>>>>>> +            intel_platform_name(fw_blobs[i].p), fw_blobs[i].rev,
>>>>>> +            fw_blobs[i].blob.legacy ? "L" : "v",
>>>>>> +            fw_blobs[i].blob.major,
>>>>>> +            fw_blobs[i].blob.minor,
>>>>>> +            fw_blobs[i].blob.patch);
>>>>>> +        return false;
>>>>>>       }
>>>>>> +
>>>>>> +    return true;
>>>>>>   }
>>>>>>     static const char *__override_guc_firmware_path(struct 
>>>>>> drm_i915_private *i915)
>>>>>> @@ -443,6 +465,11 @@ void intel_uc_fw_init_early(struct 
>>>>>> intel_uc_fw *uc_fw,
>>>>>>       uc_fw->type = type;
>>>>>>         if (HAS_GT_UC(i915)) {
>>>>>> +        if (!validate_fw_table_type(i915, type)) {
>>>>>> +            intel_uc_fw_change_status(uc_fw, 
>>>>>> INTEL_UC_FIRMWARE_ERROR);
>>>>>
>>>>> In our hierarchy of firmware statuses, INTEL_UC_FIRMWARE_ERROR 
>>>>> includes the fact that the fw has been selected, which in turns 
>>>>> implies that file_selected.path is valid. this means that even 
>>>>> with enable_guc=0 the wants/uses_guc macro might end up returning 
>>>>> true, which is not something we want.
>>>>>
>>>>> Daniele
>>>> Suggestions for a better plan? Add an another status enum? Nothing 
>>>> earlier in the sequence seems appropriate. And the init_early stack 
>>>> does not support returning error codes.
>>>
>>> I think the question here is: what are you expecting to happen in 
>>> case of error and on what platforms? let's say we have an invalid 
>>> table entry for ADLP, would the expectation be that all GuC 
>>> platforms won't boot, or just ADLP? And is that only if we have 
>>> enable_guc set to a positive value, or even if enable_guc=0?
>> The intention is to totally break driver load on any table error.
>>
>> The reason being that someone is back porting a firmware update to 
>> ADL-P but breaks DG2 in the process. However, the are only intending 
>> to change ADL-P and so don't test on DG2. They therefore don't 
>> realise that the driver is now broken for someone else. Whereas, if 
>> we make any table error a fatal load failure irrespective of tested 
>> platform, enable_guc or other module params, etc. then it is 
>> guaranteed to be caught no matter what platform they test on.
>>
> Well, I guess if you are testing on a platform that does'nt use 
> GuC/HuC at all (or have enalble_guc=0) then none of this code would 
> even run? But then, if you are patching the firmware loading code then 
> it is reasonable to expect a test run on at least one firmware enabled 
> platform.

I was thinking we could add a new status code, but things then might 
become complicated because both the submission mode (GuC vs execlists) 
and the FW fetching are tied to the "wants" flag, so I'm not sure how 
easy it would be to keep one but skip the other. An alternative option 
could be to set the path to a known "invalid" value and fail the fetch 
if we get that path (or just fail the fetch if path is NULL and/or 
status is error).

Daniele

>
> John.
>
>> John.
>>
>>>
>>> Daniele
>>>
>>>>
>>>> John.
>>>>
>>>>
>>>>>
>>>>>> +            return;
>>>>>> +        }
>>>>>> +
>>>>>>           __uc_fw_auto_select(i915, uc_fw);
>>>>>>           __uc_fw_user_override(i915, uc_fw);
>>>>>>       }
>>>>>
>>>>
>>>
>>
>

