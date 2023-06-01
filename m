Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77845718F8F
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 02:32:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 481BF10E175;
	Thu,  1 Jun 2023 00:32:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E50B10E175;
 Thu,  1 Jun 2023 00:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685579542; x=1717115542;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NPwvVkQ1vAhoL9No4HTojnqcTY3briRXtbPx6aXa6Uc=;
 b=mhtEzPJp4qVk7yQ+hiQHKIm8wa1OD3uyLkfDTjWc+MrVo+U2Tvk27a1s
 5gCAXujfUqfw8wE27E7PpXbyU+fMPRlJBNFwnjgyAu+3qGJ5zlGzJx6wd
 5l7VQq5wf21izv4tBwqCtj8EMMjQgrGrFSLvxBPEdsTZom4lQiBWiZx/N
 FNr0k16Lj/cwS+4cQrwm+SQk+QSufaqgK8dpyNAnq6LSjr3lR729Ivdd2
 54yWvt+cyA2RZUbwLRxsgHRRUWi55b0q1fSkZYV2u2PTnJyZgI4yNyEjD
 WVuoJ9mM4dtZCEp6Daxxw0v6lfOEyfIR1LwtcgDap/j71aj8C4NzDz7+Q Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="421183306"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="421183306"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 17:32:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="831376850"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="831376850"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 31 May 2023 17:32:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 17:32:21 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 17:32:20 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 31 May 2023 17:32:20 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 31 May 2023 17:32:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oUxSGo5xkuevMOZA2mLPdBsYNUlBZ+SkOgeCKRK1YmznfER7ioNMs7SJfp9+c+u8l+MnwQqxZP3mLrs6Pv5E1Q2ozxNk01y8N2mXv5R2NQEbv3BW9CxeBCGckpuDSsGnLTqESX8ZB9QmwCmRGmTeq0ibKfFQrX6bzf9SLMxNJ1gH9zaOvY+6REdjiL4llhtg9rGi1npKOt5FPvnVfhgCW7tsqq1GxcaRrqztUgWLOp6svR2w8sajSTH486qwoSw7aFvO+48yUhSn7onxD2U9WeK6WfKBDMYUy+yFnPGUX+eNQRI0RZfN6Sp9JUyIdesvqK6y33N4y+h5swzjorSneQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dm6yoV/gEdzI6wkVrg+x287/Lox/iJEbGCwq3+KS0HY=;
 b=POkKbwR2o+5a/UwLWg7hM6X2nJc7M8nOhfceG+TWexTF2dbxU7px95D3RxBjkhl7Q81OsgBvLk5gFHa36jGwCKyAKx7LTb1v0foFxgI+MfvBfD7ephft572vc/y7r54VcdKcBk1WKPggAl436i15HFjJKuDpPYwp9cgIAHJq1jkllj7XX4VY4P1AEXmpBZiaXKARXLK0ZM4ZxXJwKrnZzR1cz+bBk0rLdvmntkaK0Ktp1UJKhc1Aae1zq6nlqJRExMITsTL6YVo1/uygOqghhW4fE8/V5AOYgZqBbf2DfE7haqGyQPknA47H9zr6vi6JMErBYa4+0ENCRpwBOwhZvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5475.namprd11.prod.outlook.com (2603:10b6:610:d6::21)
 by DM6PR11MB4593.namprd11.prod.outlook.com (2603:10b6:5:2a3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Thu, 1 Jun
 2023 00:32:19 +0000
Received: from CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::3e21:b089:38bd:7ab2]) by CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::3e21:b089:38bd:7ab2%5]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 00:32:19 +0000
Message-ID: <cbaf49aa-558a-362a-06fe-e4379a448acf@intel.com>
Date: Wed, 31 May 2023 17:32:16 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 5/6] drm/i915/uc/gsc: define gsc fw
Content-Language: en-US
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20230505160415.889525-1-daniele.ceraolospurio@intel.com>
 <20230505160415.889525-6-daniele.ceraolospurio@intel.com>
 <9d42920feebb8cd7f244ddf42239b63eb2630ac4.camel@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <9d42920feebb8cd7f244ddf42239b63eb2630ac4.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0136.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::21) To CH0PR11MB5475.namprd11.prod.outlook.com
 (2603:10b6:610:d6::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5475:EE_|DM6PR11MB4593:EE_
X-MS-Office365-Filtering-Correlation-Id: 280e0cfc-679d-4b08-9102-08db6237a82e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ms8vbWN06IzcRND+kCBY0vfmfSzKSM9pheEyObRfMXYfIQFYJThUYI6098l1IfcRuDdI5LCCaNIeWsEWc7GeonQ7yJrErUZ91x8+3OCB3o628kAxT9js4jiUduNy8Hjgb6kuQ+B0nTSd997B7+dgqAS2OLyWrObAeZQvrvZmy3T2a1OGNOjy383nVRWQJKEfjfrUJDoU/r8Ru2R71unys9uvyW7was+bfqh9lpG53qaJHMA1Ttu+uV4PtiBcRpm55EjCgM1saqy68hZVCRV9AtTmrqS1LOmWzcAQdaa7wsKouANzAPM6hyM6Aud99Oa0zHieEUrdj0gOnryE/NhctF4gRdaf/3ugbn/LV5PddrMQQ187LdlsYh93pw1GVFld/QUo7ciTgajb3gM2APTUs604b5kOs6MY6vohuadzWOb9IGZ5FN6eVjk4rySh0pkVcaQu18BqIIOEOar4f8pCKTGBO1rwSaCyIt1rHbikF3YzAkC0diHaKnLD3v/IwsVXFbEJ2klovtkMuTFsxIF9sSVZLudsyc2mROMrOBnKHdWc5GiG/TIH9Y45GTjUttahUYsD7tK0/Wyg6kqVpQ3Ga343bHZYA5r7fBULDTy1V7F2E6/ym8+yzH12p6BtMdOXhle691ktRlRQH4P5SV63EA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5475.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(366004)(376002)(346002)(396003)(451199021)(6486002)(478600001)(6666004)(36756003)(186003)(2616005)(6506007)(83380400001)(86362001)(6512007)(38100700002)(31696002)(53546011)(82960400001)(26005)(107886003)(316002)(4326008)(66476007)(66556008)(450100002)(2906002)(41300700001)(66946007)(31686004)(5660300002)(8936002)(8676002)(110136005)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0ljS1BSYUNCOEdSS0VRRlNycXp5enZkU2JwMkhqY0h3Qms2TjUvTW5JaGw4?=
 =?utf-8?B?WDRkL1dUckFCN3ljQzJEeHZ0SkpEekpTSzRTSFFvejlTcDFOc2pqNnFsYnBj?=
 =?utf-8?B?TGNSUDZyNkRuMFFFTWF0QTNGeEx2MFJmZWlMVWxIUkZNcjREdlMzeUsvZ05q?=
 =?utf-8?B?Z2g2T2Vub3VuNlpDdytRMTRKU3BRQUY5NFl0elQ1UFpUV1c5cTJCQWdPVE56?=
 =?utf-8?B?aGk1Umx4N3QyM1ZudFBNN0xJM1VMdENlc1BEbUF1Y3dFdWtlT2JtU2RYS3FH?=
 =?utf-8?B?UU9Ra3ZCSm8wdDI3a1Ftd2Rpdy9Wbkx5aVhTS0Fqd2w3aCs4ZDVJS0ZSZHh0?=
 =?utf-8?B?RjNGKzVxRTlLNlBMSDBJcUlXUVlzSW5IeEVZaXBNN0xadG9tMkNpQ25qRTZP?=
 =?utf-8?B?U3JXSmNtS1hYLzd6YzdINXlhdmFEWUU1eHFDWjZRNk9EbnRkcHMzMENHUmFN?=
 =?utf-8?B?MXJuU2pibWtzN1dHdmdlK1NXMGJCTTlIb1ZCdVlWcGs3NVVUMU8wc05uU0lD?=
 =?utf-8?B?NWIvaE5LTTk4R0xOT3o3aTJLa1lDRFlPNGdwS2x3dVNFdTVaVVdsd01ENmll?=
 =?utf-8?B?c3RXWXJhUEIvS3pnb1NFRzJJT29CN2dqalVaL2doaHppYng1WU9xZy84QWht?=
 =?utf-8?B?US9YYXUyTExVMVlYRThTa2hyVHoyS3VBV1NpVGhjZlFlNExKQm53bXd0eEtk?=
 =?utf-8?B?V25SVlJzRGVReXI0cWNmL0FuUXdYbmZFWExtYmgzZ1RYN1l4bXlFMUc4VnQ5?=
 =?utf-8?B?RklxYlRWN1dmcnlOV3hjbkJyWTAxOUF4blMyU1ZCenVFbUlqUTh0UExycGcz?=
 =?utf-8?B?WUNaTnZpc1N1czYrd0wyRDI3TmdLaXdlMDFWY250cm1SanBDK2xFbEYvdWpV?=
 =?utf-8?B?RExMeVFtSlFsRUR2OUhGMDEzT1lNZ2V4aitWaERreDUvTythOFRXcUJmd3Qw?=
 =?utf-8?B?eGZUZ1JzUDJSbVhHSE1GSE0yeTN0eTlpOFFMVncwZm1FOTdwL052NUlia3Nm?=
 =?utf-8?B?MTFGNEVoZ3pIUTc1LzRIYWM1cFhhcHhjL2lodWV4aGVPdzIxNzlVdXZMU1h4?=
 =?utf-8?B?RGVZSlFsdElNTUtuN1Mxc0dSOUlNVldjZFJ2TGFTa0lsR01TODRwYVRqZ3J2?=
 =?utf-8?B?U2hkRDdUZjRpTjd0SkxCbS81VzBUbXBSVFAzTWhHR0RHM01oNXE5bUtYMU9v?=
 =?utf-8?B?T3VoYXY1eFdBdUhub3UwZHUzclUvWldnbjdGRGRCOVpDVzVmMFV3ak5qT3Ax?=
 =?utf-8?B?NHZCbzBSRWFSdnRWb0hvZGdkdGg3WWFVNFBwZmg0eXhyQW1oMkprZDB0MjB3?=
 =?utf-8?B?N2ErN1FNeDd3b1NrdzFFUlNydHAweGMzT2pkWTA1UzIxNmV2bVBzVDFMbERB?=
 =?utf-8?B?bzM5blZScGpMODU0emJxUy9kNmNuUDFRQWttYWdnQUxtaVhXMEhTOHpwM2VI?=
 =?utf-8?B?Vnlpb2Nhc2JyRU43WUdEK2tlbHlkaVFyMzdsOWhXeWoyRTAyVXlGWWtSZm1U?=
 =?utf-8?B?SjJCUFd0WW5rRXlyWWpLU1NhcmRhWEdzTE9vSGJsTXVwQXB0RitQaVhmMnQr?=
 =?utf-8?B?Yk9vQis1Nk9RRkV1R3BpcnhaakppcGZLMUg5MkNxT0R6dFU4cFJkSGdTYlMv?=
 =?utf-8?B?a0M0bXk2YnJuaVV3M0dDakVQb2lGM2xMVlVGVklmaE8wMWV4aHNsYmxMcEhI?=
 =?utf-8?B?UVJJUGpkVkdvK3dYbm9BSWRlWUpuOGhBVWhvQTQ1TUd5NGh0WmpLWkE4VDlx?=
 =?utf-8?B?SFlLNFVlNm5GZHdmbTYzTkpxQnZIbkFSdzJTWXc1UmhEVXR6MGlCeGlsamlu?=
 =?utf-8?B?dGxpTnplYU5wLzhKTTNOVEdvZmdzL1hQOUpVckRqVkI0WWVnUC9STnFZZzVa?=
 =?utf-8?B?Qm1BNmpobU9rdkc2QlBxaW9reHcyMS80ODlaWjRiU2ZzOXVINThGbWlNTzd2?=
 =?utf-8?B?ZWp4QnRaSjRiUkRjQnpEZytNSmxuRUJsMUdQTTd1SHBxNFhOVEtibnVYaDl4?=
 =?utf-8?B?N0lBU1FzMkl1TWVGcTV2aFBKMVhMWVpTd1Z3YStoNnVPclhtbjN1NDRFcGV0?=
 =?utf-8?B?amZ5RElrdU45djIrMDRUK2RnUENPQzJQcGU2VnF5aStlaFF5aW5ZT2xPU3Rr?=
 =?utf-8?B?dkthdCsxbFBYREtHM1NmZkhzVXJQbEQ3U3hua2d0ZDFpRkdESTlGYURDUHJt?=
 =?utf-8?B?cHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 280e0cfc-679d-4b08-9102-08db6237a82e
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5475.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 00:32:18.9376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: amT9qQYnJKjyArdYpcLw8ei1yuoeQOA8tWjO8D8vbYnn71CjPefRTKOhB9a6keLK0EUk7jAn/nCLWIKuVDVTYHAjBK3rKU2soG3kF4yFuTE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4593
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
Cc: "Harrison, John C" <john.c.harrison@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/25/2023 4:48 PM, Teres Alexis, Alan Previn wrote:
> Considering the only request i have below is touching up of existing comments (as
> far as this patch is concerned), and since the rest of the code looks good, here is
> my R-b - but i hope you can anwser my newbie question at the bottom:
>
> Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
>
> On Fri, 2023-05-05 at 09:04 -0700, Ceraolo Spurio, Daniele wrote:
>> Add FW definition and the matching override modparam.
>>
>> The GSC FW has both a release version, based on platform and a rolling
>> counter, and a compatibility version, which is the one tracking
>> interface changes. Since what we care about is the interface, we use
>> the compatibility version in the buinary names.
> alan :s/buinary/binary
>
>> Same as with the GuC, a major version bump indicate a
>> backward-incompatible change, while a minor version bump indicates a
>> backward-compatible one, so we use only the former in the file name.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 32 ++++++++++++++++++------
>>   1 file changed, 24 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> index 36ee96c02d74..531cd172151d 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> @@ -124,6 +124,18 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
>>   	fw_def(BROXTON,      0, huc_mmp(bxt,  2, 0, 0)) \
>>   	fw_def(SKYLAKE,      0, huc_mmp(skl,  2, 0, 0))
>>   
>> +/*
>> + * The GSC FW has both a release version, based on platform and a rolling
>> + * counter, and a compatibility version, which is the one tracking
>> + * interface changes. Since what we care about is the interface, we use
>> + * the compatibility version in the buinary names.
> alan:s/buinary/binary
> also, since we will (i hope) be adding several comments (alongside the new
> version objects under intel_gsc_uc structure) in the patch #3 about what
> their differences are and which one we care about and when they get populated,
> perhaps we can minimize the information here and redirect to that other
> comment... OR ... we can minimize the comments in patch #3 and redirect here
> (will be good to have a single location with detailed explaination in the
> comments and a redirect-ptr from the other location since a reader would
> most likely stumble onto those questions from either of these locations).

I'll redirect, that makes more sense

>
>> + * Same as with the GuC, a major version bump indicate a
>> + * backward-incompatible change, while a minor version bump indicates a
>> + * backward-compatible one, so we use only the former in the file name.
>> + */
>> +#define INTEL_GSC_FIRMWARE_DEFS(fw_def, gsc_def) \
>> +	fw_def(METEORLAKE,   0, gsc_def(mtl, 1, 0))
>> +
>>   /*
>>   
>>
> alan:snip
>
>> @@ -257,14 +281,6 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>>   	int i;
>>   	bool found;
>>   
>> -	/*
>> -	 * GSC FW support is still not fully in place, so we're not defining
>> -	 * the FW blob yet because we don't want the driver to attempt to load
>> -	 * it until we're ready for it.
>> -	 */
>> -	if (uc_fw->type == INTEL_UC_FW_TYPE_GSC)
>> -		return;
>> -
> alan: more of a newbie question from myself: considering this is a new firmware
> we are adding, is there some kind of requirement to provide a link to the patch
> targetting the linux firmware repo that is a dependency of this series?
> or perhaps we should mention in the series that merge will only happen after
> that patch gets merged (with a final rev that includes the patch on
> the fw-repo side?). Just trying to understand the process.

We usually merge the kernel patch first and do the pull-request to 
linux-firmware immediately after. We did have cases where we change 
firmware version between the first rev and the one that gets merged, so 
we only go to linux-firmware once we're sure it's not going to change 
anymore. Case in point, the GSC team has asked me to hold off in sending 
the current blob to linux-firmware because they have some pending fixes 
they want to include in the first "official" release.

Daniele

>
>
>>   	/*
>>   	 * The only difference between the ADL GuC FWs is the HWConfig support.
>>   	 * ADL-N does not support HWConfig, so we should use the same binary as

