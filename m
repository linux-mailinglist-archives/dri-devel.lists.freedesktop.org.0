Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4A76F21A7
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 02:32:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A9310EE23;
	Sat, 29 Apr 2023 00:32:43 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E62DD10EE1A;
 Sat, 29 Apr 2023 00:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682728361; x=1714264361;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zWFwR8RjtI5SXSPw0kYkgjZIEJbihEcIdMPIkCqvVXQ=;
 b=DJuKw4P2ezUHpdTJpvxjYVIljsc25Zaybe5G70boHNeEHzTo1yVCKb9E
 CqeJgS3s+/Vdjh8b1gW0GwAaKvdQo4cG4k5xCdQV1OeEOls4FcQW3aocI
 WSJbAG05ANRpOdlsK9h0mMVsUKuhty0uPR8SlF9t/qgRQOi2dysKSzuny
 g9XgVyX95/bVfVvDwkkfq+FlJeB60F6cN0y9pRxEgMuuGQE9GMl1A5Hoc
 YgY5ENqp8NCQQDe3Pc+MbobVsiYlNvVGxBA5UUEmr6aFpOOLzKeof9waH
 wDK+0Z+ld7CUCSEEBkyyo/lBJXiKZ8KfBUdpq9pK1cDV7u0fkmHLkzj6n Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="345338931"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; d="scan'208";a="345338931"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 17:32:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="1024824599"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; d="scan'208";a="1024824599"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 28 Apr 2023 17:32:40 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 28 Apr 2023 17:32:40 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 28 Apr 2023 17:32:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 28 Apr 2023 17:32:39 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 28 Apr 2023 17:32:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fQD4CAQBvgojOIiTzPEg4HFkeIhIty59UlTdwxaQPqTFsGjDYFAviCBAW8TxRLhEaFPPcfEsCSMVEtsKyLcN9FW5puR0UQfDWZYIzDKK2B2IV/hnZjeYNshzAH3ctZ/3afBkSt4AZopVQWECKYQ4bZlSs/ILHty4AUui+4E1arrulQBeMJ5a/+6HjfjeBv9CWrg39SgGNd5zJ3wnzF9Ue86dkhGcroPw6GDh8jqkjKBz/9Ie8tJYRnQI//ZFs16E7vjuTN1ewoVtHw43+1+/jEqvXJ+A8KCp2gttLyTCWA4iZWYG8DdSjr2oPDicj/Fpm6GefyXmbANmifDmClidhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LvvGOUSsiaydOpW7Z9Yzu3MixjzywshwBPLfk1NC1j0=;
 b=A1by9PHbtUFgsvILsMsR+kZvGfbKUF2wiw/6BJoWa5zfP+ALjcXQClHSw5C9tp1wo34DADTRINM9kxzLChXufRYv2DMDlwq5LvMoEwx99D9eup5sYukZAtBJ5dP46C4z/7DbSc5wCYzfkWquHac9Z5cGzyKlAZ07vHPGXkcgrZVk8/Xmb/Xfi6RP+AJuItg+e1qXuTP6S9uJUvJnAIgq6bSOg6AfU9pnxxKpkXR/XZ4imD3mNpLbpMXZGgcG27FkqPkID3S14526yPTOnW8aHm5li6Cz94HxhaudYNBh1APfxA+EgM80Qojlt0bOrCiBVkNtKwwLEF4C4tGqHFnz5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB3908.namprd11.prod.outlook.com (2603:10b6:405:7d::13)
 by PH0PR11MB4887.namprd11.prod.outlook.com (2603:10b6:510:30::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Sat, 29 Apr
 2023 00:32:35 +0000
Received: from BN6PR11MB3908.namprd11.prod.outlook.com
 ([fe80::7b09:91d7:6e26:5833]) by BN6PR11MB3908.namprd11.prod.outlook.com
 ([fe80::7b09:91d7:6e26:5833%2]) with mapi id 15.20.6340.025; Sat, 29 Apr 2023
 00:32:34 +0000
Message-ID: <ecd44241-4b57-3da7-886d-9bd747eb3dbb@intel.com>
Date: Fri, 28 Apr 2023 17:32:31 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.1
Subject: Re: [Intel-gfx] [PATCH 4/6] drm/i915/uc: Enhancements to firmware
 table validation
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230421011525.3282664-1-John.C.Harrison@Intel.com>
 <20230421011525.3282664-5-John.C.Harrison@Intel.com>
 <7716eaf2-41e8-9b28-3b87-70b5ff2962a3@intel.com>
 <8540acf3-82bc-629c-1bb2-24ee377e851d@intel.com>
 <579dc07f-70d5-c444-17eb-89a5d4a38261@intel.com>
 <c60473ea-2131-7312-5942-890244c5c9d4@intel.com>
In-Reply-To: <c60473ea-2131-7312-5942-890244c5c9d4@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::37) To BN6PR11MB3908.namprd11.prod.outlook.com
 (2603:10b6:405:7d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR11MB3908:EE_|PH0PR11MB4887:EE_
X-MS-Office365-Filtering-Correlation-Id: a4fe5cde-a38c-4567-3f64-08db48493a0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yXsFGxPbIKPUxmrP7jABAQLViV4jCdLoct8St8AtRFk8jpS0F2W77xGCTkCqn4nb9pRtPO8oKMvcVb8ohQbHC03R4MFO6kBvuSgi/vKuDfW+toQitMHd/SyoqkXWLim4nheBMLm7pqOlQNZq+HxC92ZH/zOHQLi7ZXCzwWyfd0QPplqOt2ecVnP6tGtaDDpcH9mFVyw7odoZZeh02Vu6nk993UVDr6fVC812R5scNwXjuL3wKYnAqzSx0WsZNXz405aDO2hCTUjIUQJtky7LD0nmyalrCm8SpasVoVp8L6coSGBMI11Qd8tg8zKJZog4YfbSdUdEuni3Pr9lokoCxYVxLZAwIOyIRNEIQvoPHMW3RlO6E0cy4jFcUGp4KYI7bzlTKQekdR/8kfVT2Oe3rYQxS9hsDvPXQjWbe0FnKH55sj9WBJNtQjqm9HEpI5BAKAcoQSRMYQ0CAVOv3d+RAEvVrRt+QN9S5Mlui5uTDNcAX2pR7pETzbThrR5WLdsoNRgQsXSmk7fbtE4ZfVuCY7RMbpZO/yafB+bcVBnlyHkzIvkB+0+mkwXiqsCZMg4gaTYRXmY/jLIRnEYmiTGJKqRRXml6qM20ZYz6RcL3wuJMlRgZrHZjcj9rs/I81eWWZr+yJU16ptyKYf76ieO7HQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB3908.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(396003)(376002)(136003)(39860400002)(451199021)(41300700001)(2616005)(26005)(6506007)(6512007)(53546011)(5660300002)(82960400001)(8936002)(31686004)(83380400001)(38100700002)(30864003)(2906002)(4326008)(316002)(66556008)(66946007)(66476007)(450100002)(478600001)(86362001)(8676002)(186003)(36756003)(31696002)(6666004)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWpDVlUybnJCanBCQXJXK2RnVitHbFM3Mzk2T2RydlpHYnBnYXAydjFGZmtU?=
 =?utf-8?B?UEVhYWN2Y3FaWFlyOHpNUlFZb2lRLzRDUVk4VHd0M3BKSmc1QXZXU1dwelQ5?=
 =?utf-8?B?bDBvVEllMWRHRG85b1lQbG0xTS9XR254N0laK1VnNGYyWnlYd3JUT3pucWhO?=
 =?utf-8?B?Y3JKWmpIeHUrMHpIK2t2Y2t1MTRFWERFWU8wU1AxOXVLM2duK3A3VVU0ekFo?=
 =?utf-8?B?VnlKa2tTZGhnQ3FXbGxlQmZoYWJIaVdwOUpycTJ0aWZVWVJqUWZ5Sk50dkJj?=
 =?utf-8?B?MUg1UFpIWVp4WnJNZ1N4QWJCTE9BZ2FDaE5PU1kzVGdSUUdmck1BdmZpYWph?=
 =?utf-8?B?Nkxnb1RyUmtacUxDUzFyLzhXbDdKVEd3OUY0MTFvWkltL1l6b3EwQlZLNjIx?=
 =?utf-8?B?WUd1bzFrTnlSY1BYckZ5WFFiVytxSERsakM3UkRHSWUyQmpnekxNdnZIaGEw?=
 =?utf-8?B?Tk5mWC9aOHhaMW52Y05OMXFUWUdYYzJQUVo5YmdyOWhNY0cwZWppaUk4VEl5?=
 =?utf-8?B?Q1JUMXFJMTE2NFRmWTU2Z3kxd0dLMkFCaGFNb2J4UHlaYW1PckVydUhDbTM3?=
 =?utf-8?B?N094UzZ3TE81LzZWMmhZYU1VbWZFNG5hTUpXU3pFRXJLU3ZGR3ltZkRzbkNo?=
 =?utf-8?B?dmlVRnUrOVBoVGFzUTNLWEhCYWpNT3JxRys0ZXRZNStmQmp5bkorRXB0Vm5W?=
 =?utf-8?B?VVdQdHBhb3N4UXYzRUhqdHhWUkhkWlI4RzRZZVJGRWRYNG9FbzI4QXFHdW9h?=
 =?utf-8?B?L3MyL2VRT3BXYXduTklKcWM4YVNWN0w3QjhuL1o2eDNWd0JXWndGb2dOeHZ6?=
 =?utf-8?B?SEM3R0Q5UjNYeEdON3U0ejNGZ1hqUFFYMVh6aEJ2UEhUTUFPTGZrVWxDeW56?=
 =?utf-8?B?T2xPaDFPRjdyei8xVnhDMXhQOHlaVnhzWUZSY01QcUVMdGEvOHM4T1dtVXhP?=
 =?utf-8?B?dmd4NzdHR016VG1hZkdOK3hsdmdZVlgyMGIxY0h1UjdyZ3BKZ01kQXJXWUU1?=
 =?utf-8?B?RDNOUXpIbnRJYlkrV2NjbTAvTjV0WjhUR0Ywb2VhOWtIK0FWVjZKWHFYdDBn?=
 =?utf-8?B?bEV1YzhEa3VmSUFmWFJVYjUwalJ3d0RMNFVDc3Z6R1NoUlh3QzZyc2J0aWlO?=
 =?utf-8?B?aDZITHFHbnM3bnFyUDJrNCtLaTZIUjR1cHpFU1hyRzEzeklTT1ZCbU81SWl4?=
 =?utf-8?B?YjVkYkN1bnJzWEc3R2RrSkh6clNVWjUySUxYcStrTkVZWFdkR3kvRXpRZ0JW?=
 =?utf-8?B?cHFZaURJVUhCRGdudDJTWlFjY3BRejhvbGM3NEpzdGowVVp1dlQ5elVRcURP?=
 =?utf-8?B?S05TMitobXdacjd2WVcwWGdQd2ZVZGdjSmFXeWFyQ3VnN0VmYThOKzZ5VWs1?=
 =?utf-8?B?d3ZrcUM1US96aHMwMURPeDNXZCs4MHFSK1RXWVAzdkh0bjg5enRwQmUwVjZx?=
 =?utf-8?B?cHA4Rnp1WjFOaEFKWmwvWDZ1QjVGN0lVcEdSZ21jdHVlMHNTRWxFL3crNytH?=
 =?utf-8?B?NFFvS0RkQW9SYUxHMGFHVFh2QnpwczAwQm9OUThpdUpIZmwwYUcwbVZCQ1Zl?=
 =?utf-8?B?VDI3VnRzSFlTNTJ5ZFZ5N0hwM2lGVUwyNGpka0xLaEFmSTNNa21FcDVoek9N?=
 =?utf-8?B?MlhwSitaeXRjRUtoa0U2M1pON2kzM2R3amlhd1FnTFI5b1cvY2NSdU9sUzZ6?=
 =?utf-8?B?RjloR0dUanp5ZzZFMWM5SW5ZdGRKY3lwcVZtUmVBT0xVTEN1MzFreGd4NW9X?=
 =?utf-8?B?VThncjJPME5OSkcwNDE5UzF4aFB2cVRTTHJsbmo5T1gvU0hIa2xCdk5HNWM0?=
 =?utf-8?B?eXArUmx5RzhnWFh1ZzRmNHBTNWpMaUdKTzZGeXBvYVFvVUwvVS93OWZBY3Rk?=
 =?utf-8?B?bG5HQ3BzR1A2QnhOUFdPWlp0NFhEK0RmWDRXNE5LcG8zZ3E1Qkdwa2l5NFl2?=
 =?utf-8?B?eGJ5V3ZrRm9qZXAzSVBCL1ZoMGxJRWFmREQ3RTlvYWhDRXhYOVdnaTBrRWpV?=
 =?utf-8?B?dFdSU0VpMmFhNmg0bGtKS2hoU3J6VzdCS1hvN0Fab3RDWE1OeGJLQnVIcUk0?=
 =?utf-8?B?U0gxSXZKcFRSdGpCcU42djl3NkVPaG53NlRua1R2VkVDeXZZVkhHek13WWty?=
 =?utf-8?B?L29rZVNidUQzWmxlQXZOUlVyTzJOZW1rUjFIODJkZ2VJbURDUUU4YlRMeXlQ?=
 =?utf-8?B?aHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4fe5cde-a38c-4567-3f64-08db48493a0d
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB3908.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2023 00:32:34.8914 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZoWlTxHOi4IRpD2/6pcNc42PrDYctV17hSNh3aBqxY5FJ1ivY3rwHvuoxOyzN5I4FF7N9rhnqZXVqAPP8VCA6IlXCG2ONERsvAsQQVzg0Qc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4887
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

On 4/28/2023 17:30, John Harrison wrote:
> On 4/28/2023 17:26, Ceraolo Spurio, Daniele wrote:
>> On 4/28/2023 5:16 PM, John Harrison wrote:
>>> On 4/28/2023 17:04, Ceraolo Spurio, Daniele wrote:
>>>> On 4/20/2023 6:15 PM, John.C.Harrison@Intel.com wrote:
>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>
>>>>> The validation of the firmware table was being done inside the code
>>>>> for scanning the table for the next available firmware blob. Which is
>>>>> unnecessary. So pull it out into a separate function that is only
>>>>> called once per blob type at init time.
>>>>>
>>>>> Also, drop the CONFIG_SELFTEST requirement and make errors terminal.
>>>>> It was mentioned that potential issues with backports would not be
>>>>> caught by regular pre-merge CI as that only occurs on tip not stable
>>>>> branches. Making the validation unconditional and failing driver load
>>>>> on detecting of a problem ensures that such backports will also be
>>>>> validated correctly.
>>>>>
>>>>> v2: Change to unconditionally fail module load on a validation error
>>>>> (review feedback/discussion with Daniele).
>>>>>
>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>> ---
>>>>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 157 
>>>>> +++++++++++++----------
>>>>>   1 file changed, 92 insertions(+), 65 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c 
>>>>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>>>> index c9cd9bb47577f..eb52e8db9ae0b 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>>>> @@ -233,20 +233,22 @@ struct fw_blobs_by_type {
>>>>>       u32 count;
>>>>>   };
>>>>>   +static const struct uc_fw_platform_requirement blobs_guc[] = {
>>>>> +    INTEL_GUC_FIRMWARE_DEFS(MAKE_FW_LIST, GUC_FW_BLOB, 
>>>>> GUC_FW_BLOB_MMP)
>>>>> +};
>>>>> +
>>>>> +static const struct uc_fw_platform_requirement blobs_huc[] = {
>>>>> +    INTEL_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB, 
>>>>> HUC_FW_BLOB_MMP, HUC_FW_BLOB_GSC)
>>>>> +};
>>>>> +
>>>>> +static const struct fw_blobs_by_type 
>>>>> blobs_all[INTEL_UC_FW_NUM_TYPES] = {
>>>>> +    [INTEL_UC_FW_TYPE_GUC] = { blobs_guc, ARRAY_SIZE(blobs_guc) },
>>>>> +    [INTEL_UC_FW_TYPE_HUC] = { blobs_huc, ARRAY_SIZE(blobs_huc) },
>>>>> +};
>>>>> +
>>>>>   static void
>>>>>   __uc_fw_auto_select(struct drm_i915_private *i915, struct 
>>>>> intel_uc_fw *uc_fw)
>>>>>   {
>>>>> -    static const struct uc_fw_platform_requirement blobs_guc[] = {
>>>>> -        INTEL_GUC_FIRMWARE_DEFS(MAKE_FW_LIST, GUC_FW_BLOB, 
>>>>> GUC_FW_BLOB_MMP)
>>>>> -    };
>>>>> -    static const struct uc_fw_platform_requirement blobs_huc[] = {
>>>>> -        INTEL_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB, 
>>>>> HUC_FW_BLOB_MMP, HUC_FW_BLOB_GSC)
>>>>> -    };
>>>>> -    static const struct fw_blobs_by_type 
>>>>> blobs_all[INTEL_UC_FW_NUM_TYPES] = {
>>>>> -        [INTEL_UC_FW_TYPE_GUC] = { blobs_guc, 
>>>>> ARRAY_SIZE(blobs_guc) },
>>>>> -        [INTEL_UC_FW_TYPE_HUC] = { blobs_huc, 
>>>>> ARRAY_SIZE(blobs_huc) },
>>>>> -    };
>>>>> -    static bool verified[INTEL_UC_FW_NUM_TYPES];
>>>>>       const struct uc_fw_platform_requirement *fw_blobs;
>>>>>       enum intel_platform p = INTEL_INFO(i915)->platform;
>>>>>       u32 fw_count;
>>>>> @@ -286,6 +288,11 @@ __uc_fw_auto_select(struct drm_i915_private 
>>>>> *i915, struct intel_uc_fw *uc_fw)
>>>>>               continue;
>>>>>             if (uc_fw->file_selected.path) {
>>>>> +            /*
>>>>> +             * Continuing an earlier search after a found blob 
>>>>> failed to load.
>>>>> +             * Once the previously chosen path has been found, 
>>>>> clear it out
>>>>> +             * and let the search continue from there.
>>>>> +             */
>>>>>               if (uc_fw->file_selected.path == blob->path)
>>>>>                   uc_fw->file_selected.path = NULL;
>>>>>   @@ -306,76 +313,91 @@ __uc_fw_auto_select(struct 
>>>>> drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>>>>>           /* Failed to find a match for the last attempt?! */
>>>>>           uc_fw->file_selected.path = NULL;
>>>>>       }
>>>>> +}
>>>>>   -    /* make sure the list is ordered as expected */
>>>>> -    if (IS_ENABLED(CONFIG_DRM_I915_SELFTEST) && 
>>>>> !verified[uc_fw->type]) {
>>>>> -        verified[uc_fw->type] = true;
>>>>> +static bool validate_fw_table_type(struct drm_i915_private *i915, 
>>>>> enum intel_uc_fw_type type)
>>>>> +{
>>>>> +    const struct uc_fw_platform_requirement *fw_blobs;
>>>>> +    u32 fw_count;
>>>>> +    int i;
>>>>>   -        for (i = 1; i < fw_count; i++) {
>>>>> -            /* Next platform is good: */
>>>>> -            if (fw_blobs[i].p < fw_blobs[i - 1].p)
>>>>> -                continue;
>>>>> +    if (type >= ARRAY_SIZE(blobs_all)) {
>>>>> +        drm_err(&i915->drm, "No blob array for %s\n", 
>>>>> intel_uc_fw_type_repr(type));
>>>>> +        return false;
>>>>> +    }
>>>>>   -            /* Next platform revision is good: */
>>>>> -            if (fw_blobs[i].p == fw_blobs[i - 1].p &&
>>>>> -                fw_blobs[i].rev < fw_blobs[i - 1].rev)
>>>>> -                continue;
>>>>> +    fw_blobs = blobs_all[type].blobs;
>>>>> +    fw_count = blobs_all[type].count;
>>>>>   -            /* Platform/revision must be in order: */
>>>>> -            if (fw_blobs[i].p != fw_blobs[i - 1].p ||
>>>>> -                fw_blobs[i].rev != fw_blobs[i - 1].rev)
>>>>> -                goto bad;
>>>>> +    if (!fw_count)
>>>>> +        return true;
>>>>>   -            /* Next major version is good: */
>>>>> -            if (fw_blobs[i].blob.major < fw_blobs[i - 1].blob.major)
>>>>> -                continue;
>>>>> +    /* make sure the list is ordered as expected */
>>>>> +    for (i = 1; i < fw_count; i++) {
>>>>> +        /* Next platform is good: */
>>>>> +        if (fw_blobs[i].p < fw_blobs[i - 1].p)
>>>>> +            continue;
>>>>>   -            /* New must be before legacy: */
>>>>> -            if (!fw_blobs[i].blob.legacy && fw_blobs[i - 
>>>>> 1].blob.legacy)
>>>>> -                goto bad;
>>>>> +        /* Next platform revision is good: */
>>>>> +        if (fw_blobs[i].p == fw_blobs[i - 1].p &&
>>>>> +            fw_blobs[i].rev < fw_blobs[i - 1].rev)
>>>>> +            continue;
>>>>>   -            /* New to legacy also means 0.0 to X.Y (HuC), or 
>>>>> X.0 to X.Y (GuC) */
>>>>> -            if (fw_blobs[i].blob.legacy && !fw_blobs[i - 
>>>>> 1].blob.legacy) {
>>>>> -                if (!fw_blobs[i - 1].blob.major)
>>>>> -                    continue;
>>>>> +        /* Platform/revision must be in order: */
>>>>> +        if (fw_blobs[i].p != fw_blobs[i - 1].p ||
>>>>> +            fw_blobs[i].rev != fw_blobs[i - 1].rev)
>>>>> +            goto bad;
>>>>>   -                if (fw_blobs[i].blob.major == fw_blobs[i - 
>>>>> 1].blob.major)
>>>>> -                    continue;
>>>>> -            }
>>>>> +        /* Next major version is good: */
>>>>> +        if (fw_blobs[i].blob.major < fw_blobs[i - 1].blob.major)
>>>>> +            continue;
>>>>>   -            /* Major versions must be in order: */
>>>>> -            if (fw_blobs[i].blob.major != fw_blobs[i - 
>>>>> 1].blob.major)
>>>>> -                goto bad;
>>>>> +        /* New must be before legacy: */
>>>>> +        if (!fw_blobs[i].blob.legacy && fw_blobs[i - 1].blob.legacy)
>>>>> +            goto bad;
>>>>>   -            /* Next minor version is good: */
>>>>> -            if (fw_blobs[i].blob.minor < fw_blobs[i - 1].blob.minor)
>>>>> +        /* New to legacy also means 0.0 to X.Y (HuC), or X.0 to 
>>>>> X.Y (GuC) */
>>>>> +        if (fw_blobs[i].blob.legacy && !fw_blobs[i - 
>>>>> 1].blob.legacy) {
>>>>> +            if (!fw_blobs[i - 1].blob.major)
>>>>>                   continue;
>>>>>   -            /* Minor versions must be in order: */
>>>>> -            if (fw_blobs[i].blob.minor != fw_blobs[i - 
>>>>> 1].blob.minor)
>>>>> -                goto bad;
>>>>> -
>>>>> -            /* Patch versions must be in order: */
>>>>> -            if (fw_blobs[i].blob.patch <= fw_blobs[i - 
>>>>> 1].blob.patch)
>>>>> +            if (fw_blobs[i].blob.major == fw_blobs[i - 
>>>>> 1].blob.major)
>>>>>                   continue;
>>>>> +        }
>>>>> +
>>>>> +        /* Major versions must be in order: */
>>>>> +        if (fw_blobs[i].blob.major != fw_blobs[i - 1].blob.major)
>>>>> +            goto bad;
>>>>> +
>>>>> +        /* Next minor version is good: */
>>>>> +        if (fw_blobs[i].blob.minor < fw_blobs[i - 1].blob.minor)
>>>>> +            continue;
>>>>> +
>>>>> +        /* Minor versions must be in order: */
>>>>> +        if (fw_blobs[i].blob.minor != fw_blobs[i - 1].blob.minor)
>>>>> +            goto bad;
>>>>> +
>>>>> +        /* Patch versions must be in order: */
>>>>> +        if (fw_blobs[i].blob.patch <= fw_blobs[i - 1].blob.patch)
>>>>> +            continue;
>>>>>     bad:
>>>>> -            drm_err(&i915->drm, "Invalid %s blob order: %s r%u 
>>>>> %s%d.%d.%d comes before %s r%u %s%d.%d.%d\n",
>>>>> -                intel_uc_fw_type_repr(uc_fw->type),
>>>>> -                intel_platform_name(fw_blobs[i - 1].p), 
>>>>> fw_blobs[i - 1].rev,
>>>>> -                fw_blobs[i - 1].blob.legacy ? "L" : "v",
>>>>> -                fw_blobs[i - 1].blob.major,
>>>>> -                fw_blobs[i - 1].blob.minor,
>>>>> -                fw_blobs[i - 1].blob.patch,
>>>>> -                intel_platform_name(fw_blobs[i].p), fw_blobs[i].rev,
>>>>> -                fw_blobs[i].blob.legacy ? "L" : "v",
>>>>> -                fw_blobs[i].blob.major,
>>>>> -                fw_blobs[i].blob.minor,
>>>>> -                fw_blobs[i].blob.patch);
>>>>> -
>>>>> -            uc_fw->file_selected.path = NULL;
>>>>> -        }
>>>>> +        drm_err(&i915->drm, "Invalid %s blob order: %s r%u 
>>>>> %s%d.%d.%d comes before %s r%u %s%d.%d.%d\n",
>>>>> +            intel_uc_fw_type_repr(type),
>>>>> +            intel_platform_name(fw_blobs[i - 1].p), fw_blobs[i - 
>>>>> 1].rev,
>>>>> +            fw_blobs[i - 1].blob.legacy ? "L" : "v",
>>>>> +            fw_blobs[i - 1].blob.major,
>>>>> +            fw_blobs[i - 1].blob.minor,
>>>>> +            fw_blobs[i - 1].blob.patch,
>>>>> +            intel_platform_name(fw_blobs[i].p), fw_blobs[i].rev,
>>>>> +            fw_blobs[i].blob.legacy ? "L" : "v",
>>>>> +            fw_blobs[i].blob.major,
>>>>> +            fw_blobs[i].blob.minor,
>>>>> +            fw_blobs[i].blob.patch);
>>>>> +        return false;
>>>>>       }
>>>>> +
>>>>> +    return true;
>>>>>   }
>>>>>     static const char *__override_guc_firmware_path(struct 
>>>>> drm_i915_private *i915)
>>>>> @@ -443,6 +465,11 @@ void intel_uc_fw_init_early(struct 
>>>>> intel_uc_fw *uc_fw,
>>>>>       uc_fw->type = type;
>>>>>         if (HAS_GT_UC(i915)) {
>>>>> +        if (!validate_fw_table_type(i915, type)) {
>>>>> +            intel_uc_fw_change_status(uc_fw, 
>>>>> INTEL_UC_FIRMWARE_ERROR);
>>>>
>>>> In our hierarchy of firmware statuses, INTEL_UC_FIRMWARE_ERROR 
>>>> includes the fact that the fw has been selected, which in turns 
>>>> implies that file_selected.path is valid. this means that even with 
>>>> enable_guc=0 the wants/uses_guc macro might end up returning true, 
>>>> which is not something we want.
>>>>
>>>> Daniele
>>> Suggestions for a better plan? Add an another status enum? Nothing 
>>> earlier in the sequence seems appropriate. And the init_early stack 
>>> does not support returning error codes.
>>
>> I think the question here is: what are you expecting to happen in 
>> case of error and on what platforms? let's say we have an invalid 
>> table entry for ADLP, would the expectation be that all GuC platforms 
>> won't boot, or just ADLP? And is that only if we have enable_guc set 
>> to a positive value, or even if enable_guc=0?
> The intention is to totally break driver load on any table error.
>
> The reason being that someone is back porting a firmware update to 
> ADL-P but breaks DG2 in the process. However, the are only intending 
> to change ADL-P and so don't test on DG2. They therefore don't realise 
> that the driver is now broken for someone else. Whereas, if we make 
> any table error a fatal load failure irrespective of tested platform, 
> enable_guc or other module params, etc. then it is guaranteed to be 
> caught no matter what platform they test on.
>
Well, I guess if you are testing on a platform that does'nt use GuC/HuC 
at all (or have enalble_guc=0) then none of this code would even run? 
But then, if you are patching the firmware loading code then it is 
reasonable to expect a test run on at least one firmware enabled platform.

John.

> John.
>
>>
>> Daniele
>>
>>>
>>> John.
>>>
>>>
>>>>
>>>>> +            return;
>>>>> +        }
>>>>> +
>>>>>           __uc_fw_auto_select(i915, uc_fw);
>>>>>           __uc_fw_user_override(i915, uc_fw);
>>>>>       }
>>>>
>>>
>>
>

