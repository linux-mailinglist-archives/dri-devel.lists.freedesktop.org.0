Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB716C5852
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 22:00:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7BD010E3FA;
	Wed, 22 Mar 2023 21:00:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D111210E272;
 Wed, 22 Mar 2023 21:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679518802; x=1711054802;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ifs5f3gGTrxefST6kEaTo8p8xRxrXwbbnykcZjuciy4=;
 b=eMx5yuSNelF/QT7uGOjfnZYDT3TkNZnhhYnppbtRcXNQgBj8Jm+iPj3b
 OP0oyx6rUPYjhvTK+v9qNweHE0b2J43Rg/mjnSJJWPj1TLKbm+3BSLJ3l
 P9m0Anl3zzsH5zzo59ThxyXUwpk3gPM79nZNq10tivujkurXnrL4XKDcP
 0OsYVPi2ewigDLwKmfoAm8mvPO4mitzXld/4qzTaGyLWjXwA5lT/ZvB8g
 4s4MZmE56fSKKNFCjcnnKzWYUrIiuuqBffMSkTi+X2PUc7crR+8nshKxh
 nCFPHWuAw98pDQiswOVEoYO/yLzsvPx/rT/y6kiMcMuNalUZbUnVleRpx g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="318982513"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="318982513"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 14:00:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="805999065"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="805999065"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 22 Mar 2023 14:00:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 14:00:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 22 Mar 2023 14:00:01 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 22 Mar 2023 13:59:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bG9knPyzpA+nEGWOYU5sf5O5WiKx3Mfbqm15oNOlM7Tuf2A8AaEM0zFnElvTImMYe3PHfX6c9mxdvtEaq92LLsWlUMkuWamHBDOCe8fsxyx/sHh6U8Wj9UAlIJklO/T3RXXxmhD+mCdwaaraS5UbU33UUel+yla3zUBhRcoym8Cxnm2F70Q6AG4Y37HN2y16CjPShgMaRZx3OvgKtW2fYXXWaj0AKcuEJPLOz1XQbhz/8C4tLY3YvGQbIkxLf2tbU6uD9cfxQWHUgG91fx9E21M1WMEKU+nlUNrPy2n/6/jCvveUZCh/mo7qr3+WZfQLjHeQg8Qb2RVkQbR7lWpYeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6uxJWZJioTfDT7tujWjVtkAqw0cucQKyrM+WL6W5NDE=;
 b=KhUhZbnU6b1YMYLt+KUGC8DwxivgrusSyY+h7yfO6RAGJ8min73ijulkzb3lFJHEHtMzIOr6bgDm5x3p4lgJCgj9EgMr8ve9q8e7CwIUs8g3Uj3gN+CIQOFtTtAfRTEc5MaKIPNCTN6/67s431XAH1/CzykHVwo3h3zNgQwnkFGPbarCkWpQNN1ULp8xwaMLZmsRXAnX8FbPxXVZaQUUx3sk3A28e4jUIMgb8mxTmNrxyvyv2UjCc2rtEyIrUzKgeQEDE81rIacO8Cd4rGmUsTYJrfZ7lW62d6JluMgDeA6buOFYIlcu3vJwyzxyhPr8Ze5COr3g0IWWFzV+x6wOuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 CO1PR11MB5075.namprd11.prod.outlook.com (2603:10b6:303:9e::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.37; Wed, 22 Mar 2023 20:59:57 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3e9f:e67a:40c:d2da]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3e9f:e67a:40c:d2da%8]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 20:59:57 +0000
Message-ID: <a9cf94f9-784f-ab30-ec5f-5155ef098dd5@intel.com>
Date: Wed, 22 Mar 2023 13:59:54 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/2] drm/i915/gsc: implement wa 14015076503
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230320211039.1513368-1-daniele.ceraolospurio@intel.com>
 <20230320211039.1513368-2-daniele.ceraolospurio@intel.com>
 <6763dca1-5061-f508-0846-8ef51a7acdc8@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <6763dca1-5061-f508-0846-8ef51a7acdc8@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::12) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|CO1PR11MB5075:EE_
X-MS-Office365-Filtering-Correlation-Id: 346b0f74-25e0-49a7-8798-08db2b186485
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P7iTaiFfDDUdVusQpCza3sheBs5nWtzuPcQ7w+s3aYHMWUMe7iHIDnKRCJzrykBSmSmMuH+uTQd7TWRe3vrEOaUMSpdwnMRCszk1ycxB8ZmzcQVrgkTD1wY//KPQFEq9H0M6s5+2BLIKnMZd9HgHBhmSnNKwbSZMxGXfjV3jjN35lFuUSIJGqtJsUv637/Q5k5zgjZgWZfgAiYIbiNTupHRmhAJQxUDKyqCWCVbMdKmwtXB1SrMQoCGUQXozUrY497p4+ZqhsW5h7X4S0WuSuVpzJwGA/jqZ23FyPP3rC0dPzzYAfEvMP3daDtbbNw/Pz9x5VLg/kKk9f/N12qTQ0rFmP3i5CaLWoe9B1KmSOWZFx8EpXWfe0/yDj2kvg7mRMztNm+/khf+Iz7gDBTS/voZARCLsdkqMuLKVKGkAAT2Kn6D9NsBjgHfCZ5GGHgGUKwxMv0Ev8+7e+rJF3rZhcXJinjgUB0t9EqO/Z1XqbEqtGhzzjXSNgx1HD77/rDoNDZbW/ZnGolwJB19LEiQWHEyNoE2kEpZNA86NNaQHPGaL62dwOL0PB3roUiNRt7BvWwqPVOEZshG+C8uCoQd13ZrJwEvUnTwxmAglU+HU0DgtMIep1ZL7gN//vU64ioATwDu5THVwhkSlk+nRVRf2wIRPoInWPjkd6Ii2GEUvTET3fpFf4KjWUp6HtcRltjmmfV2iYLbrjikvR2DKCQ49ZyJW2CvD8RWtCAP7flsKa2E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(39860400002)(376002)(346002)(366004)(136003)(451199018)(31686004)(450100002)(66946007)(66556008)(478600001)(8676002)(54906003)(66476007)(316002)(41300700001)(2906002)(4326008)(5660300002)(8936002)(31696002)(36756003)(86362001)(6506007)(26005)(186003)(53546011)(6486002)(107886003)(6666004)(2616005)(6512007)(82960400001)(38100700002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2lOVE5ER1U0VUlsaGJ2Y2tzOW5KOUh1SE43bVVzdkdpZWk1RVM2NlRTRFpt?=
 =?utf-8?B?RlpLRDZaR2JsUnFCTFZWZVIwanBaK0pVVExVWlFlNm1VeFQvL012TkhqeFNq?=
 =?utf-8?B?aFowblR2dGxlUk51MXhpQlo0MkppS29MdCtrNGllM1duYlBtczg1WkJOWnFw?=
 =?utf-8?B?UmdIZFBGSnZxNmx1NzZqdDZPWUtoNDBrL3hFeHFiNlFJYVBIUEpiTEtFZjJU?=
 =?utf-8?B?Qm5ZV1RITEhzcXlxUEFpSW5LS09Md1JCS2lNc0lGb1dZU3BPNlNLVDZ3Qkh4?=
 =?utf-8?B?UUV1QmxTMU5IQkYxRGVqTVg4SjFqRi95S0hGeUNab3Q1Z09VR0pnUko3dkFh?=
 =?utf-8?B?R1g1dDd6Q3BlWnJwMlk5WVZDYTdydmo3cldiN2thdER0MVdtTXRmejJ5N0xF?=
 =?utf-8?B?cDBRMm54SHBSWWZRMVdrVVBIZUZ5bXNwWUZnUmxmeGF1R2RKdnRXZ041Y0Fz?=
 =?utf-8?B?TmplK0tlYmloYjNxTGF2aUNCZm85TkRGMS93MVh2Z3NuVk9jS3pkWkJKSkdB?=
 =?utf-8?B?UmpqQTN0UEEvRjRlNkF2UGNvRkw0UkRUdjdnR1lCRVdYbWJyMVdKZjZQZE9a?=
 =?utf-8?B?ZHJVOXZxbG0zV2kxakpTZURxand2eFZLOTV3VS82RndNZjR0blFud29HQWxi?=
 =?utf-8?B?RnNxZzBpd3ZFSTJRMGZhTUxJaTRXWERTN1dPbW9wcU1SWThTWERzSjYvbWdT?=
 =?utf-8?B?UTJ5U2paTXhvN0xvWmlId2FqRkJoNnpxcExZTExOWDRTMXo4MVM4elEzOURr?=
 =?utf-8?B?MGxmcC9nU1huV21JM3lSQ1I2QzkrdUNERno2WGdFRTVCWlduU2ttcWRwVzFY?=
 =?utf-8?B?aXZ5RGpHakREdTZjRmJLcVQ4bmsrMWlnM04yQXZHUVpaak5GU0tFS0NXeHla?=
 =?utf-8?B?OVh0UVEwMERBWDQ3a1VNWlNnQVFWbHJmTm9xdittVFFMUjU5a2lGQ09FVWJt?=
 =?utf-8?B?L3ZEVTJOb3JjRG1pa204c1BBa3VmUmdPdlI5YmxiWEpvOGtteGcvbmJoaGxV?=
 =?utf-8?B?Q2hFSTRCRE5GS0xaaHByR2dzZzFWOGp2WVJOQU9KZm1XWi80K2V6NlphL0ov?=
 =?utf-8?B?VHRodHQzQU9FdVJKeGx2NkFrY3B1UngvdVRyNTg3bzlkODdKckYrVU84cDVY?=
 =?utf-8?B?MTI1d2VnSEkyb21wN1FkS1lKcjh5RVpIWHdUdCtzVUV6TE1tMTJzUThxeEJ1?=
 =?utf-8?B?ZUNjN0NRZVYycG1oRHQ1dkZoREtjaThsSnErSTQ5RXM2NENub3lKbHdnUFJ6?=
 =?utf-8?B?K05RZ29XLzJ0aTVublp3ZnRDWmdRcE9DQ2VWei9CMnB2NGJycExJMjRhTVh6?=
 =?utf-8?B?c09nT3dWdUh2cnhXZGpJak1uSi94VEZGTHFZbWl0Ym0xd0pEdDU4RnZwMWww?=
 =?utf-8?B?RUNWSkp2OUV5Yzd4ajJRSzZEMnQzR0xUdXhwbWVoMzI0VkQvWlY3ZGlYLzF3?=
 =?utf-8?B?aVN0S0tmTmIzNS9BcDlYYk1tYjBkcStseE56c2dNZXhsSEJ4MXhRT2QyNjBw?=
 =?utf-8?B?Q21DNDNhbHZkMmFZOVBJaFlER0FmdklhTXpsdHFNeHNGWkEvbjgrZGhRak9y?=
 =?utf-8?B?TGdaOGdLL01KeWhwdzlxUHBYcmw3dGpvY01jTkZJaWpybXV3ZW9HYUF6eXFU?=
 =?utf-8?B?dnB4UjVTenlra1pCOVhrU3VCbWZmODBDUmdiR3E1Q1FwaG9wd1hKbFdoeTRF?=
 =?utf-8?B?djdZdHAxaXJMcjN2MThvVjNiVVJHS253a3hPNDVya1p6LzlOMVVHbVpraTJk?=
 =?utf-8?B?T1JWczJ4NmtpQzBHV3VnWGl4Njg0Rm9BN0p6OEsybTZhS0VBYUMvNFE0UHM2?=
 =?utf-8?B?eGl1TXpCUGVDdWFMVWZmc2NKcXZWVDBwY0d0aW1oYkdEZUFEdXJuN0M1VWk5?=
 =?utf-8?B?bWdBVzdZRjRJTkkxbmJuM3pFOFl5RDNUVzVZMjNQekpsZzFwN3dscVQ3L09W?=
 =?utf-8?B?N2sxNGQrZFIwZnhCN0syZS9vRWw5dTNOMHVOOEFlbmN2N3Q3TTgxVWtaVUZZ?=
 =?utf-8?B?Vnk2VlA2Q3NTczJUcXB5ODlibHVwL0FZRjh0U3FKRnVCVmNJQ0ZVdDhaTXYz?=
 =?utf-8?B?dm1ZcDM2bzM0OWVDdUExeVNqNnFSLzN4NnU4VFJNZ1RJLy9GYnVpdDl4b0Iz?=
 =?utf-8?B?VHczQmZpUzF4RWMvNmk2VXdnN1BCdDJWTHBJUFJTUmdLWE4yZ2k0UnRVTUUw?=
 =?utf-8?Q?Vo3PWr9d6bjlVBTNRKt9piE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 346b0f74-25e0-49a7-8798-08db2b186485
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 20:59:57.0770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AFObcdl0A4BYfY4t/tPNZbKcn2Q/sYzEe//M1EekjVPqG3uCFms0UFsxYPqHg5BL1VyweYvJ45oGizkboChHlgYCvMqZ+LPvqrEvS3QC4Go=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5075
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
Cc: Matt Roper <matthew.d.roper@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/22/2023 12:44 PM, John Harrison wrote:
> On 3/20/2023 14:10, Daniele Ceraolo Spurio wrote:
>> The WA states that we need to alert the GSC FW before doing a GSC engine
>> reset and then wait for 200ms. The GuC owns engine reset, so on the i915
>> side we only need to apply this for full GT reset.
>>
>> Given that we do full GT resets in the resume paths to cleanup the HW
>> state and that a long wait in those scenarios would not be acceptable,
>> a faster path has been introduced where, if the GSC is idle, we try 
>> first
>> to individually reset the GuC and all engines except the GSC and only 
>> fall
>> back to full reset if that fails.
> I'm confused. If the code path is a resume then surely all engines are 
> idle. But, there is presumably a reason why we do a full GT reset on 
> the resume - because the hardware state is not guaranteed to be 
> sensible at that point. So how is it safe to skip the GSC reset?

Differently from other engines, the GSCCS only role is to forward the 
commands to the GSC FW, so it doesn't have any HW outside of the CS 
itself and therefore it has no state that we don't explicitly re-init on 
resume or on context switch (LRC or power context). The HW for the GSC 
uC is managed by the GSC FW so we don't need to care about that. I can 
add this to the commit message if it makes things clearer

Daniele

>
>>
>> Note: according to the WA specs, if the GSC is idle it should be 
>> possible
>> to only wait for the uC wakeup time (~15ms) instead of the whole 200ms.
>> However, the GSC FW team have mentioned that the wakeup time can change
>> based on other things going on in the HW and pcode, so a good security
>> margin would be required. Given that when the GSC is idle we already
>> skip the wait & reset entirely and that this reduced wait would still
>> likely be too long to use in resume paths, it's not worth adding support
>> for this reduced wait.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: John Harrison <john.c.harrison@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_reset.c     | 77 +++++++++++++++++++++--
>>   drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h |  2 +
>>   drivers/gpu/drm/i915/i915_reg.h           | 14 ++++-
>>   3 files changed, 86 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c 
>> b/drivers/gpu/drm/i915/gt/intel_reset.c
>> index 2c3463f77e5c..5f75f59122cf 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
>> @@ -14,6 +14,8 @@
>>     #include "gt/intel_gt_regs.h"
>>   +#include "gt/uc/intel_gsc_fw.h"
>> +
>>   #include "i915_drv.h"
>>   #include "i915_file_private.h"
>>   #include "i915_gpu_error.h"
>> @@ -695,6 +697,67 @@ static reset_func intel_get_gpu_reset(const 
>> struct intel_gt *gt)
>>           return NULL;
>>   }
>>   +static int __reset_guc(struct intel_gt *gt)
>> +{
>> +    u32 guc_domain =
>> +        GRAPHICS_VER(gt->i915) >= 11 ? GEN11_GRDOM_GUC : 
>> GEN9_GRDOM_GUC;
>> +
>> +    return gen6_hw_domain_reset(gt, guc_domain);
>> +}
>> +
>> +static bool needs_wa_14015076503(struct intel_gt *gt, 
>> intel_engine_mask_t engine_mask)
>> +{
>> +    if (!IS_METEORLAKE(gt->i915) || !HAS_ENGINE(gt, GSC0))
>> +        return false;
>> +
>> +    if (!__HAS_ENGINE(engine_mask, GSC0))
>> +        return false;
>> +
>> +    return intel_gsc_uc_fw_init_done(&gt->uc.gsc);
>> +}
>> +
>> +static intel_engine_mask_t
>> +wa_14015076503_start(struct intel_gt *gt, intel_engine_mask_t 
>> engine_mask, bool first)
>> +{
>> +    if (!needs_wa_14015076503(gt, engine_mask))
>> +        return engine_mask;
>> +
>> +    /*
>> +     * wa_14015076503: if the GSC FW is loaded, we need to alert it 
>> that
>> +     * we're going to do a GSC engine reset and then wait for 200ms 
>> for the
>> +     * FW to get ready for it. However, if this the first 
>> ALL_ENGINES reset
> if this is
>
> John.
>
>> +     * attempt and the GSC is not busy, we can try to instead reset 
>> the GuC
>> +     * and all the other engines individually to avoid the 200ms wait.
>> +     */
>> +    if (engine_mask == ALL_ENGINES && first && 
>> intel_engine_is_idle(gt->engine[GSC0])) {
>> +        __reset_guc(gt);
>> +        engine_mask = gt->info.engine_mask & ~BIT(GSC0);
>> +    } else {
>> +        intel_uncore_rmw(gt->uncore,
>> +                 HECI_H_GS1(MTL_GSC_HECI2_BASE),
>> +                 0, HECI_H_GS1_ER_PREP);
>> +
>> +        /* make sure the reset bit is clear when writing the CSR reg */
>> +        intel_uncore_rmw(gt->uncore,
>> +                 HECI_H_CSR(MTL_GSC_HECI2_BASE),
>> +                 HECI_H_CSR_RST, HECI_H_CSR_IG);
>> +        msleep(200);
>> +    }
>> +
>> +    return engine_mask;
>> +}
>> +
>> +static void
>> +wa_14015076503_end(struct intel_gt *gt, intel_engine_mask_t 
>> engine_mask)
>> +{
>> +    if (!needs_wa_14015076503(gt, engine_mask))
>> +        return;
>> +
>> +    intel_uncore_rmw(gt->uncore,
>> +             HECI_H_GS1(MTL_GSC_HECI2_BASE),
>> +             HECI_H_GS1_ER_PREP, 0);
>> +}
>> +
>>   int __intel_gt_reset(struct intel_gt *gt, intel_engine_mask_t 
>> engine_mask)
>>   {
>>       const int retries = engine_mask == ALL_ENGINES ? 
>> RESET_MAX_RETRIES : 1;
>> @@ -712,10 +775,16 @@ int __intel_gt_reset(struct intel_gt *gt, 
>> intel_engine_mask_t engine_mask)
>>        */
>>       intel_uncore_forcewake_get(gt->uncore, FORCEWAKE_ALL);
>>       for (retry = 0; ret == -ETIMEDOUT && retry < retries; retry++) {
>> -        GT_TRACE(gt, "engine_mask=%x\n", engine_mask);
>> +        intel_engine_mask_t reset_mask;
>> +
>> +        reset_mask = wa_14015076503_start(gt, engine_mask, !retry);
>> +
>> +        GT_TRACE(gt, "engine_mask=%x\n", reset_mask);
>>           preempt_disable();
>> -        ret = reset(gt, engine_mask, retry);
>> +        ret = reset(gt, reset_mask, retry);
>>           preempt_enable();
>> +
>> +        wa_14015076503_end(gt, reset_mask);
>>       }
>>       intel_uncore_forcewake_put(gt->uncore, FORCEWAKE_ALL);
>>   @@ -740,14 +809,12 @@ bool intel_has_reset_engine(const struct 
>> intel_gt *gt)
>>     int intel_reset_guc(struct intel_gt *gt)
>>   {
>> -    u32 guc_domain =
>> -        GRAPHICS_VER(gt->i915) >= 11 ? GEN11_GRDOM_GUC : 
>> GEN9_GRDOM_GUC;
>>       int ret;
>>         GEM_BUG_ON(!HAS_GT_UC(gt->i915));
>>         intel_uncore_forcewake_get(gt->uncore, FORCEWAKE_ALL);
>> -    ret = gen6_hw_domain_reset(gt, guc_domain);
>> +    ret = __reset_guc(gt);
>>       intel_uncore_forcewake_put(gt->uncore, FORCEWAKE_ALL);
>>         return ret;
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h 
>> b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
>> index 4b5dbb44afb4..f4c1106bb2a9 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
>> @@ -9,7 +9,9 @@
>>   #include <linux/types.h>
>>     struct intel_gsc_uc;
>> +struct intel_uncore;
>>     int intel_gsc_uc_fw_upload(struct intel_gsc_uc *gsc);
>>   bool intel_gsc_uc_fw_init_done(struct intel_gsc_uc *gsc);
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/i915/i915_reg.h 
>> b/drivers/gpu/drm/i915/i915_reg.h
>> index d22ffd7a32dc..80e33ede7fac 100644
>> --- a/drivers/gpu/drm/i915/i915_reg.h
>> +++ b/drivers/gpu/drm/i915/i915_reg.h
>> @@ -928,8 +928,18 @@
>>   #define DG1_GSC_HECI2_BASE    0x00259000
>>   #define DG2_GSC_HECI1_BASE    0x00373000
>>   #define DG2_GSC_HECI2_BASE    0x00374000
>> -
>> -
>> +#define MTL_GSC_HECI1_BASE    0x00116000
>> +#define MTL_GSC_HECI2_BASE    0x00117000
>> +
>> +#define HECI_H_CSR(base)    _MMIO(base + 0x4)
>> +#define   HECI_H_CSR_IE        REG_BIT(0)
>> +#define   HECI_H_CSR_IS        REG_BIT(1)
>> +#define   HECI_H_CSR_IG        REG_BIT(2)
>> +#define   HECI_H_CSR_RDY    REG_BIT(3)
>> +#define   HECI_H_CSR_RST    REG_BIT(4)
>> +
>> +#define HECI_H_GS1(base)    _MMIO(base + 0xc4c)
>> +#define   HECI_H_GS1_ER_PREP    REG_BIT(0)
>>     #define HSW_GTT_CACHE_EN    _MMIO(0x4024)
>>   #define   GTT_CACHE_EN_ALL    0xF0007FFF
>

