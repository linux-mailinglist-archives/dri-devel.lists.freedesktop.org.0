Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9ABF6E8024
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 19:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5EDB10E1C2;
	Wed, 19 Apr 2023 17:12:09 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF29510E070;
 Wed, 19 Apr 2023 17:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681924327; x=1713460327;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iSzWw1fx/I+Jo9WFtYXmj6SVPjhUCp9lSMnuK4GPHbk=;
 b=CDPzlzru+cEvFYEDWJPptTI85e9ogrhl8QR1/9m2TqX0DqV57g50G9rf
 1q103m8dzv4M+59wxpN3QKsHNXMNBdDOPis5++Fpx2OLmNlcxENR8JMFj
 Jv6wzugNUj2LEJLYUQMVsg/bOLbwPKcag4s3AKoeJ47EHvhX/iev9Eex9
 ww1H5ouJCcycQVwszGRAR+gc47qdvsQJf19UjuW/In0brNCeEb2dxMVb3
 pBzUigzHnlEGQyX0EqxKAT5Ug6xIeDXy6PlyFz/aQflctAdoBAlchIOgH
 rEDBBGpId3/X2UxeGiIb6KC+3aNhQOS6CynXIDOSpyyjE9IDHF0pV8Wos Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="344259475"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="344259475"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 10:12:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="760813525"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="760813525"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP; 19 Apr 2023 10:12:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 10:12:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 10:12:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 10:12:06 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 10:12:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gbPlVoDBHt5Zu6DylauakC2f1QFyT8BWECWaI2edJQwGRhqCHFIa73L+EGyop4o9ZHJct8+rDQgOpfJtn2CFjJw8rftPdpPbO/uc3DX2XneS43D1jZrMwr+BHhcr3JqCLT81GCjjwUZGWiy5r9ckeJH08GuzF1a+kFyoJjeSX/9FenEy5h3KcimK5x7mvkVwAc3A4YkjULhn+YmbN10n4ofgU6DWxvOJ6l/JeogdO2wMNSxzsEARMBvWWA2jpYXwn43OGMJs0VHadHO4+vedkhDdFWtYpdP1/MQXGIMrey9ABzsmjgjkrikjV/tOe1TFtaseuOVNnt9UkQvDoINskA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MBWYOAFCwN1ax1x2Ht90BP3z/Rk/WlwrQ01x5W9BRVE=;
 b=SJ8EPi/+LnG3iNnnQb7QwnQhn+kQNSDIcH0M6y2iRezKqBYK2fP21/HCGUt6DLoeksVoBdxXRNuBHRIZi/+5Xpd1tlZchcEkjMdm/mCGnvYQioOuH6JphqijN72CQZb/wLg5MRczckZbZ4VMrTuc0k5iwy1vErD82rXMI1QU4YgsXV0NSXod4x8t2RzyUcwU2N758XIMBwPHxtd1pp7SCqM8ywDktqgAOYWYIYjrxEoBr4tbgFMk/NLF0fGotcZQ9NMuOY5IU21M948fomCLYDJXaCVwmeedA1GaO82fXXDioTnOsIAi40AMFQschU6uGUcPiPOE2zki0bapiHVkRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB3908.namprd11.prod.outlook.com (2603:10b6:405:7d::13)
 by DM4PR11MB6359.namprd11.prod.outlook.com (2603:10b6:8:b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Wed, 19 Apr
 2023 17:12:03 +0000
Received: from BN6PR11MB3908.namprd11.prod.outlook.com
 ([fe80::7b09:91d7:6e26:5833]) by BN6PR11MB3908.namprd11.prod.outlook.com
 ([fe80::7b09:91d7:6e26:5833%2]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 17:12:03 +0000
Message-ID: <2cd1381b-10c6-f5ce-e868-39615d24280c@intel.com>
Date: Wed, 19 Apr 2023 10:12:00 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH 5/5] drm/i915/uc: Reject doplicate entries in
 firmware table
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230415005706.4135485-1-John.C.Harrison@Intel.com>
 <20230415005706.4135485-6-John.C.Harrison@Intel.com>
 <ff39e6ca-4ee6-149e-e0ba-13490306c577@intel.com>
 <c3632e2e-c064-d3f6-a68e-c77a662b1d2c@intel.com>
In-Reply-To: <c3632e2e-c064-d3f6-a68e-c77a662b1d2c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0031.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::44) To BN6PR11MB3908.namprd11.prod.outlook.com
 (2603:10b6:405:7d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR11MB3908:EE_|DM4PR11MB6359:EE_
X-MS-Office365-Filtering-Correlation-Id: 53b14fec-0477-43b2-074e-08db40f931ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: upD9IvUIusSrFoXbtXr/NDJZN7hdmvAvGm4OG4JBwecRiLo/5ySIU8+pWxSUjLwecxHjC6my+pQqvdYh+gyVLS7c4v866uzNEocAgGp4Mjy6U2TNoyRq3Crspw+QT7E9O8zkXqcM65jyGXKMn34DxX55FDLpbo11b5BLSlANQEzuQeVjTqLBD7+pUUF/z6I60K4Q7vOY+dm91ft6FW0dRYPuzw1HCWDoUayYDFk/LKjCsaAwm67dpwo0z1vbA+Qm0qbKDSSF8ojXp20qJsGmD1h8V0hqo66CDQvM7V9bHxA2MoTmire1rSzMeBUmr4WzJiAT2u3D+ksm2Wqa75/Lt9DhwtSEURFnRgmuqiMRYUl7JZ8q88BGkw/txkzJSSC0bpTZtmzx9mminFHvQj704SNG11v1vlQSqJnVBnEG6WggKEYwl36Gc8b/PAKE+ydFpNsGqfXd9SQOq2Y4CrxpDQg5XoxPKopSem+pGDoi8TCZeD634xgnAWF9yly+bvG1cfq8Sp1VsdcIDSzS1EisAs0m2BWJkhbUcQ2tpRwRARmzPQtzzZzuF4NyNNxSlwVO2e0QI2f953757RyDlcrY5FyTwG4PYG7bmK2BN1Ct/HAxzVJ5nUT8hzJ3Q08/tOSg89xoShgut13B12Y8y0vhSQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB3908.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(136003)(39860400002)(346002)(396003)(451199021)(4326008)(82960400001)(8936002)(8676002)(38100700002)(316002)(66946007)(66556008)(66476007)(450100002)(2906002)(478600001)(6486002)(26005)(6512007)(6506007)(86362001)(31696002)(53546011)(31686004)(83380400001)(5660300002)(41300700001)(2616005)(36756003)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RS9VSUdQNUdwVG5NMTNSdkZFbnRUR1lzTCtRNkFqU0YzK1RtS3NTUnFRelQr?=
 =?utf-8?B?bDZSRU5oUkd6eURuckpJVzBQUjJWRnU5YmFRd2pIcGxTYmxWdGQ0ajVZOER4?=
 =?utf-8?B?Z2NtcW9vZ3pWcmlIRUlpVU9sR014OW95aWMwWlhNcU5GV1RSNnhqNVFLM2R6?=
 =?utf-8?B?ZlU3L1Z0YW9ZajFOQVYrQzNiZ2R3OThUT3ozVEQrQnpuOFNhTVFIODFvRVZI?=
 =?utf-8?B?TVJvem5zUVI0bFZMb3NQTE91d252VStyV1daUTFBNUlPWkJteVdLb2hobGRS?=
 =?utf-8?B?VDZGR016ZlF1eHRDTXhkZUNuYlRQOVlvSTRpMnhtUUVVRGdDOXJRdm5SWmVM?=
 =?utf-8?B?aVpMK0tadFg0TnpYenZGdGkzZDF2Ync0V3EvOFZCWCsrTlpkU2hRMDVQR2Fp?=
 =?utf-8?B?RVh2VXYzcDl2Nk9YWWE5S3IwelR4ZVdUdUZNbmlpbkwwZ1QxdEF0SFY3WlIx?=
 =?utf-8?B?Z0Z2Z3FCdVBrRHpYM1lhb09uNUhRNlYvNjYxUE1lUWtFek8wcFJvTkw4dThq?=
 =?utf-8?B?Q3g3ZkhJOUVlWjlxdmVIakI2RHVGRnZQTnhYYy9IVmJ3bFhvNXBZNGVMYzBk?=
 =?utf-8?B?SWw0SUc1WWZEbDdOelZxbWZOeDY1cUNLdE83ZHVjbHYwMEh4SWZTcHc2ek5U?=
 =?utf-8?B?OGJqV0VKM3RyT1hpQ2VsZHdIWHpxRFUvREhsUHk4YUVYMlNaZ1FlQVI2ZWhO?=
 =?utf-8?B?ODN1eTdOWURsZW1pTzFaWElRMFV2SmRVSldJaXBiMVJ4S3llZUhIVHFZdlk0?=
 =?utf-8?B?SzhETGJNZytWT2x0ekRDclhOVTcrUEZabUVESCt2UEpvWm51WDdOdG9zSXVK?=
 =?utf-8?B?UGROTW9GL2dtTk5DVkZUODRCdC9aSlU4dGhRNTRFcWZiZ01LM2w2eDdMdkVo?=
 =?utf-8?B?bFZiaTV2eEI2eEtOeVdmUUY0WjJIUjRyTjNEOHVuczhvQnBwZ3ZaM1VnaGJk?=
 =?utf-8?B?OVBYMXdyT2hvSWhHMmk1eWxWaWNHY25lbjkyc3N4MmozMnJvWklDWGhNZGpa?=
 =?utf-8?B?S1I4d2RKQnZ0dmgvcjFCbHo5NURadGVOaGJFM0QvQnFjUUdlWVBNb1hOeHFw?=
 =?utf-8?B?bGhwMmZ4TlVDUFhyemMwc1B5UjNyclhQLzJSekNrdmhjUmJpamJuMHRZeG9G?=
 =?utf-8?B?RXhYTmo5UWpMS3R2aXhtTTBlUkIzVE9TMkRLQmRtQjB2OStIdzZMRHJtMzJa?=
 =?utf-8?B?bnJZa0ZlVUxZWEFQenRkN2xieEtwMUtGS2d4bUhmRVRSYm5lL1pvU3lZQ2cy?=
 =?utf-8?B?dExxQS9HRVFxVHhMYnczSWJxd1BKcXJuZk1pTVQyQ0ViTXJJT2hnMjk4Smdy?=
 =?utf-8?B?T0MrVGxzWVQ2S3dkNDkxazcxQjEwSWRac0Q2cC9HRGMzQVZvWHErTENNZ2xM?=
 =?utf-8?B?bGNJcEQ1L0xZQURKSy9WVys0c00xM1JTQnFrM3dHcGk5MFpQbHEvdS80VEZ0?=
 =?utf-8?B?U0w3bXc1eDhxbkZ4MEFXamlpdFRibU1Vby9zV01VdFRMRTNaR0JwajRwdGhS?=
 =?utf-8?B?QXh4ZS9ZK3IzRWdjR1hJbXVtZWtZcW9QejJyL1BuM2R6RUxIeDNqZ09oVUla?=
 =?utf-8?B?L1JOTFVoZkEyOFk5aGhudzczaEduRXFsMUozNWtINUZOY3BBakpLOXJEZ3Bh?=
 =?utf-8?B?S3Q3SWdpU1Y5NFBvNUh0VGlDS3puNy9hYXlETnBOV1NQNXJyRmlqc3hPVGIy?=
 =?utf-8?B?MXhoRzMwN0lKVVMrSldnSHkvVk5BSWttSWZ3b0luSDg0aWxWV1pCay94V05R?=
 =?utf-8?B?OEJnV1F4RlBITDdsQzNKY3crM3laMHR1LzFPL0xXM0w0YVd5ZlhZeXFxZkd2?=
 =?utf-8?B?SkptRWk0d0R1Qkw4cjFRUXlJeVlUZzFrSHZKSzBhSWRPdzk4eWdCeWV6UUlh?=
 =?utf-8?B?SDNZRS9QR2d3bU5NbHlXMTlRODBHcHVlN09DaVdaMnB0NU9VYnIwWVVGVTlI?=
 =?utf-8?B?bytkcnJ0eGpPNGMrd1d1WXhVV3d0SVVRRllTem4zOEl6VlFoRXV1bmJ3bHIy?=
 =?utf-8?B?UkRoa2tvbWpnZzN1dis1MmVMM050V2M4VHJ3aXBnYnpUNXJEU1ZWNzNIYnFB?=
 =?utf-8?B?MWNGMURNL1V1ZktjRkk4WXdJMG5pekVXc2NPT251elVUa2FFQVljNDl6ZmxG?=
 =?utf-8?B?dHBHWVNKUnFmdjZoOUdFejEvajNHQmE3bGNJT3hnQnZmbEJwRUduVXZFRm5U?=
 =?utf-8?B?emc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53b14fec-0477-43b2-074e-08db40f931ac
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB3908.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 17:12:03.0895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tVVJ5eP89iSJksccuyeVlQ7x47a+iAqokSojy1WOLCW0AhPBakAZP4nPcuKVCkvH+GmOA+3o7LVyteyMSWrujxyn//2XzmvOi1R6FGrXh/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6359
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

On 4/19/2023 10:02, John Harrison wrote:
> On 4/18/2023 16:24, Ceraolo Spurio, Daniele wrote:
>> Typo doplicate in patch title
>>
>> On 4/14/2023 5:57 PM, John.C.Harrison@Intel.com wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> It was noticed that duplicte entries in the firmware table could cause
>>
>> typo duplicte
>>
>>> an infinite loop in the firmware loading code if that entry failed to
>>> load. Duplicate entries are a bug anyway and so should never happen.
>>> Ensure they don't by tweaking the table validation code to reject
>>> duplicates.
>>
>> Here you're not really rejecting anything though, just printing an 
>> error (and even that only if the SELFTEST kconfig is selected). This 
>> would allow our CI to catch issues with patches sent to our ML, but 
>> IIRC the reported bug was on a kernel fork. We could disable the FW 
>> loading is the table for that particular blob type is in an invalid 
>> state, as it wouldn't be safe to attempt a load in that case anyway.
> The validation code is rejecting duplicates. Whether the driver loads 
> or not after a failed validation is another matter.
>
> I was basically assuming that CI will fail on the error message and 
> thus prevent such code ever being merged. But yeah, I guess we don't 
> run CI on backports to stable kernels and such. Although, I would hope 
> that anyone pushing patches to a stable kernel would run some testing 
> on it first!
>
> Any thoughts on a good way to fail the load? We don't want to just 
> pretend that firmware is not wanted/required on the platform and just 
> load the i915 module without the firmware. Also, what about the longer 
> plan of moving the validation to a selftest. You can't fail the load 
> at all then.
Actually, forgot we already have a INTEL_UC_FIRMWARE_ERROR status. That 
works fine for aborting the load. So just go with that and drop the plan 
to move to a selftest?

John.


>
> John.
>
>>
>>>
>>> For full m/m/p files, that can be done by simply tweaking the patch
>>> level check to reject matching values. For reduced version entries,
>>> the filename itself must be compared.
>>>
>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 27 
>>> +++++++++++++++++++++---
>>>   1 file changed, 24 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>> index c589782467265..44829247ef6bc 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>> @@ -319,7 +319,7 @@ static void validate_fw_table_type(struct 
>>> drm_i915_private *i915, enum intel_uc_
>>>   {
>>>       const struct uc_fw_platform_requirement *fw_blobs;
>>>       u32 fw_count;
>>> -    int i;
>>> +    int i, j;
>>>         if (type >= ARRAY_SIZE(blobs_all)) {
>>>           drm_err(&i915->drm, "No blob array for %s\n", 
>>> intel_uc_fw_type_repr(type));
>>> @@ -334,6 +334,27 @@ static void validate_fw_table_type(struct 
>>> drm_i915_private *i915, enum intel_uc_
>>>         /* make sure the list is ordered as expected */
>>>       for (i = 1; i < fw_count; i++) {
>>> +        /* Versionless file names must be unique per platform: */
>>> +        for (j = i + 1; j < fw_count; j++) {
>>> +            /* Same platform? */
>>> +            if (fw_blobs[i].p != fw_blobs[j].p)
>>> +                continue;
>>> +
>>> +            if (fw_blobs[i].blob.path != fw_blobs[j].blob.path)
>>> +                continue;
>>> +
>>> +            drm_err(&i915->drm, "Diplicaate %s blobs: %s r%u 
>>> %s%d.%d.%d [%s] matches %s r%u %s%d.%d.%d [%s]\n",
>>
>> Typo Diplicaate
>>
>> Daniele
>>
>>> + intel_uc_fw_type_repr(type),
>>> +                intel_platform_name(fw_blobs[j].p), fw_blobs[j].rev,
>>> +                fw_blobs[j].blob.legacy ? "L" : "v",
>>> +                fw_blobs[j].blob.major, fw_blobs[j].blob.minor,
>>> +                fw_blobs[j].blob.patch, fw_blobs[j].blob.path,
>>> +                intel_platform_name(fw_blobs[i].p), fw_blobs[i].rev,
>>> +                fw_blobs[i].blob.legacy ? "L" : "v",
>>> +                fw_blobs[i].blob.major, fw_blobs[i].blob.minor,
>>> +                fw_blobs[i].blob.patch, fw_blobs[i].blob.path);
>>> +        }
>>> +
>>>           /* Next platform is good: */
>>>           if (fw_blobs[i].p < fw_blobs[i - 1].p)
>>>               continue;
>>> @@ -377,8 +398,8 @@ static void validate_fw_table_type(struct 
>>> drm_i915_private *i915, enum intel_uc_
>>>           if (fw_blobs[i].blob.minor != fw_blobs[i - 1].blob.minor)
>>>               goto bad;
>>>   -        /* Patch versions must be in order: */
>>> -        if (fw_blobs[i].blob.patch <= fw_blobs[i - 1].blob.patch)
>>> +        /* Patch versions must be in order and unique: */
>>> +        if (fw_blobs[i].blob.patch < fw_blobs[i - 1].blob.patch)
>>>               continue;
>>>     bad:
>>
>

