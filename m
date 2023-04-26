Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E7C6EF93B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 19:23:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26F5B10E26D;
	Wed, 26 Apr 2023 17:23:02 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 368F810E267;
 Wed, 26 Apr 2023 17:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682529779; x=1714065779;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+WAQ1CPfT+iHzykM3+0Np2kzLAGUFS9JdBnVm0KHtgg=;
 b=OscJVy6Kr1+fwDzqBDaoyya7F6fJgIuu/9WwMCxKrICBhTaVEC+jvfAc
 F8laH41OhJmmmEcqOo2leVIxpIupaiF0olocy4I+2GP+TUm76/KiD73ad
 JjDGoPnky9Jn/9JR9p9/17f/20xyKxuC3BKvRZpt3diHH80uzB9bWvGiS
 qZxrG6gqEnKOnAW4vKxLMRaO7utqcEJ63ec8fM5+arvoivHzjeyMmdlJy
 fcC1uyBa97eP5DRKbUFq8EHzV7p7nXqd1ITTPb/PP97ArrvVCzJBB1036
 RsHsgBcz9xSNib33ArUcA4ahyJj0Gf1c6Xlt3to6ojU5dPOSuhvbb6yEN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="336101002"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="336101002"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 10:22:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="868372889"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="868372889"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 26 Apr 2023 10:22:57 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 10:22:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 10:22:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 10:22:57 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 26 Apr 2023 10:22:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/wg+RJD8TzD/85WvcSBMQBx13yL9XQw9x+o7n13UB6hmpLubEOml485YxyxqNQncbM0gzvIB/lJlhMikYfOm0gZ8m/YmjQK3Lg//fwf06X+1ecPBix5G4SqcLunHt0OA83s4oIvwtjPHt1+fsLqbbtcGOiCcP4pzea5ePWU4FqcJf9LFWp48ZGl+u7c3spiilQmkm4562l5cb9Q22nMaRRbf9B0IdV9qrrv3gzlj5Gt16P6jgnMAFaHYBKJuWqJA43tssl491Bd81aAtn7RbvNxfCAFLdCl9Tl3+ujlA+hxGJi3LurK+yoxB9PnuCVHDL/nvZuheD+k4PiLHxdm9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9iJs0tBETlysG6UQ+Ftlid+/FM8cSeeJsNS9VRBS0ew=;
 b=RZWT4IuBeac4AAgnnoe56+r3QX9NRwjqSSUpe9ipGLbtOOF6k2siU6UgQNvJi6x/X12hO231Zkb4oSl9sqlO9bW5gfz/QHeDtCFhbZbwzI5iDDz/bYWBQNhyHu7khrtULBv1NuqxtURFWAxIvk2EL6Arjd0vqWdZVcEYBl5cjOEe2Un69wMTG+5yYveBwHqp8v4mfPTU3rpifUlFTWdNGw0tbp6778561fKASAtVNkwpXLgdvMpUscIZm4Viz8OkjcprH9dFTYqxIw8lGfC7vy/J/pTKZOrRt9/eteO6nCfaRJ5NyYgUsZuB8kgB3tl8G8+TKFZelARXheVWDBwOqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by IA1PR11MB7872.namprd11.prod.outlook.com (2603:10b6:208:3fe::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 17:22:55 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::2687:6af2:e0ca:c1e3]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::2687:6af2:e0ca:c1e3%5]) with mapi id 15.20.6340.021; Wed, 26 Apr 2023
 17:22:55 +0000
Message-ID: <bfd87057-6067-f5a9-4edd-9e9404a06c0f@intel.com>
Date: Wed, 26 Apr 2023 10:22:52 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [PATCH 1/5] drm/i915/guc: Don't capture Gen8 regs on Xe devices
Content-Language: en-GB
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230406222617.790484-1-John.C.Harrison@Intel.com>
 <20230406222617.790484-2-John.C.Harrison@Intel.com>
 <97546a0ca475345fd18f8d80fafa5f7a11e34101.camel@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <97546a0ca475345fd18f8d80fafa5f7a11e34101.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0169.namprd03.prod.outlook.com
 (2603:10b6:a03:338::24) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|IA1PR11MB7872:EE_
X-MS-Office365-Filtering-Correlation-Id: ded9725e-0e51-4847-0f98-08db467adf57
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: megb6wEjmgb4F1GGlMDVoERlJ9+y+m4uFiZ8zq4CdQrvdH2HTudTE7kvTfEVfNsMLXOxb3yWa4XMdH7R/viAtDXt8o47dNMeTBBC36m2sdGGqub0FjH2mow3yb6Js8xnlYsM9URqAzjl6067i/ieSbQMQzGySGOlEuSrqCnVPYEhmv8fN6nDLLkdcyGK+9plWatcH1ztfQUA59QfhrWIVtNYR4YcR0BdB1zkQmkrr+Mortc2uCsscfR1uHtRKLa5qZ9z06rWX94cd4GFDUnIfbReBMMmoCB2F4CRn1twyBw19M2b5aUNyMUpncun7OPjpbjITtHkJSFIz2bzbIeETpgWZ6wzjIkvR61J/wRkJQmRnhizesKyDvxfT5KyCCduaCowOQiHKDr8XzlnQuHGegrtHR7GJCPXIAE9QLKpMc7tLS4by27sXOF21PIVyTnAlEXSjJVSMtKCDv3lTnN1XZ/5qBXhq2tbmPr+/ZeVzRRDFHuuCw62RyP17cEXH5OFYYFNGbn4DwDyQkYOCtmOL1MJUwLamyjSChGmF52SgeS32S6pBg0qUAZj5U24yPIzW+OhiCHu+MNHpmSjb4iRSp4MhDSyRN08KTfnaX+1E9rnA2llyNi2x8rfODGTG6/g0ymgnnfij91hqDvrK47VLg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(376002)(39860400002)(366004)(346002)(451199021)(31686004)(6486002)(6666004)(450100002)(6512007)(186003)(6506007)(26005)(53546011)(107886003)(2616005)(36756003)(54906003)(4326008)(82960400001)(316002)(478600001)(110136005)(86362001)(8676002)(8936002)(2906002)(66946007)(66556008)(66476007)(31696002)(5660300002)(38100700002)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnI3ZURkdDkxZFBXMEtQdC9MVmYxYzhmNDN1Qk9sMlB5c3N5SHg4YWFvTUFy?=
 =?utf-8?B?S0g4ZXBxcXZXUUxyK3lTTDVHcTd2N3h4dG5WbjNiUEZ1YTlBVlJoNGQvUmtm?=
 =?utf-8?B?MlRER2VadkVnSVAzVTB0YVFiaVRGZlhGZW5HTndiVGo5WlFqREEzN0RqRDli?=
 =?utf-8?B?VGtLNGRvbWF0RHBzeGN3T0J3YlNSZzBybW9lQjQ3SFdERDJ4U2IxeitwZTdS?=
 =?utf-8?B?WXduOTZIcjg2RWJ6NTV3ZzJMeTBZM0Y4MmNtRHc4T2FNMVVwOUtDWUpiNndT?=
 =?utf-8?B?NW1LVWVJN0k2UWJvZXFsNHdDZEFHK0k3QWdZaTAwQXJPS1RVdDRnSDlGc1hl?=
 =?utf-8?B?OHpjRXZXaExLb2ZrRVFZcVZxVTJORk9tQWdkSUxNZ0NRenlyUFY1VXUzM1hB?=
 =?utf-8?B?aSsyVFhhR3RScERBM2hzMjhlT1hYbEN5d01ldEd5SzJkd3p1ZU1aN3Z2eEd4?=
 =?utf-8?B?cVgvZ09Xb2lOWFFlWDBDVXkrTGVvYUNUZHppbEkxMHRqa1hRY0hYYjJqU3l0?=
 =?utf-8?B?OTRMWWpmVVBYd1hPQXlub243WXIwVWxUMllOd3hWMDkzM29WWWJkZTJ1R0RR?=
 =?utf-8?B?TGpKbzFSdjlDZmY0T2NBWTBxYXhRUENmckVEN295RjJSU05TM0k5QlEwUjBP?=
 =?utf-8?B?Y2I1cXRrR2pMbGdlV1VvemlxQ2ZjNG44RW5NYzY2aERjUG9UdUNTeTlnOGNV?=
 =?utf-8?B?blJwTHBndkUrSFFTaHh4RTUyR2lhTWl6WGxLL3pQVnNTNC80ZktaeUJYb29W?=
 =?utf-8?B?UVNOM0lJOGJyT3krT2dJcWdDc2s2OGdnZDhTY2pnQzhQaWNHZGtid0ZnTW1Z?=
 =?utf-8?B?bTdQWHVVSGFhTGJVSWtyaGxsRVVmWjg5bCtTeVNMVUZQNTNoT2hjbGZiRzY4?=
 =?utf-8?B?ZU9TYlVUaDkxZ2loMEgzSEZlQ2p2V0xzYlJCS0UvWmVUakxuM0hzNkNNektZ?=
 =?utf-8?B?c05jK21TbmMraEtJRmNZbmRieElSbTUrVjNFR3lmWUZRenFFUGhqOCtJWFBl?=
 =?utf-8?B?NjFGSUFyMWFzN3BzWlkwVGdoT3NoV2pRSWdOSXd0RmFaZXhtL2NrZis2Qmtp?=
 =?utf-8?B?eHZKSWs5T3pIUW1nRi94ODhLdVZWY3ZqRWYrNXNPUEVZcE9meEwwdWVKSm5u?=
 =?utf-8?B?QTJRclpuUmptaGVmMWhhelZoaTFMd0ZhL2hEK0VwV0N3YUNKUWM4OWpmOStM?=
 =?utf-8?B?Nm1CYXVPYTd3RkdHeFAxcDI2YUJPN1NzeGllTytlTlEvb21pZjhuN0c4Mjhr?=
 =?utf-8?B?WlY2aWxGMmE2ZEVSTjhwTHdLNzkxeTR3R1RvNmRGemg2dUVsVXFNdGJsYjZF?=
 =?utf-8?B?enY1UDdXdnhIZmZjNVBsWFFQZ0t4OCsxZUliTDdadzBZUjk5dWhkanhleXJU?=
 =?utf-8?B?MWs1eGgvcHIxSlVYRUNjKyt1dDVSenFMNS9idEU5VlBTNTBZZm1LWWk5aG1J?=
 =?utf-8?B?VVdyYUhVQ3pmWGhvaWhvaW5SU0dPK0dqZEcvakUzSFRtdVovRnlDekU1d25q?=
 =?utf-8?B?M3VpdzZPaFhRdHpEcVVmSnY5VnlMdzczankzSHI3Qms2YzFZYkFDL0tUbHRE?=
 =?utf-8?B?bVhCbTdKMXBHak01WnFmanFpUXhXZzVnbHdFZUMrSXErNXZyTE9seXNQWHBT?=
 =?utf-8?B?V3ROeUdYUkZwbFFWVUhzWHF1U0dpSjVSM3VBdlpCbzhxMnd6VnJWNytabWhs?=
 =?utf-8?B?RFhqODEwSW0vRWQyVzJBS1E1T21Sa0F1TlpsQmE3M2ZVR0taYzUzM1JTOEpQ?=
 =?utf-8?B?MmQwenl4MXZuQUFRWVpOUUx1dHliQm8xTEFaamc1TjUxZnBaNTZGVy8wN0Jw?=
 =?utf-8?B?QUl5UFRJcGFZMXJNTjU1cWkra0FieFYwVlpwOW5ZOXQ0djdvSGZ1TVJUZFNy?=
 =?utf-8?B?TnErYWtheUpGT0dTdUIyUDN3K2hvSVB2dDZuYnhXWFpYSTFzaFdZY0VZUzF2?=
 =?utf-8?B?UmZkUnEwR1lvbHZNd1R1Y3dzYmpkSWFWRG5DTGM1S2NoM3lWUTVqTThtbS80?=
 =?utf-8?B?dUQxZ2QwbThoQmV2U2tyTlgwNlZQMG5QRHlOeitFOCswUlIyS3F2czVHbHdW?=
 =?utf-8?B?WHVZUktaNGlFemtiTWozcjF4VW5Fdy85TlgwRERzV3FaMG4rYlBNRXhGZmJ2?=
 =?utf-8?B?VlJTblVza3laR3YvT3g4ZXVhNENueHN3UGxhSFBQL3hVcDFvZzA4S2pnWEtk?=
 =?utf-8?B?Qmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ded9725e-0e51-4847-0f98-08db467adf57
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 17:22:55.2443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S5VaCMf9wZRecu5TufOWcArOfcQTreNuRD9iaVeUtpdufBuVsctyJEPcjn+WNPrDiP/BwWK638bdfbFnmTkr1WdTNuR1eK3yp0ut25DF1zU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7872
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
Cc: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "Nikula, Jani" <jani.nikula@intel.com>, "Nerlige Ramappa,
 Umesh" <umesh.nerlige.ramappa@intel.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>,
 "DRI-Devel@Lists.FreeDesktop.Org" <DRI-Devel@Lists.FreeDesktop.Org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/25/2023 10:55, Teres Alexis, Alan Previn wrote:
> On Thu, 2023-04-06 at 15:26 -0700, Harrison, John C wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> A pair of pre-Xe registers were being included in the Xe capture list.
>> GuC was rejecting those as being invalid and logging errors about
>> them. So, stop doing it.
>>
> alan:snip
>>   #define COMMON_GEN9BASE_GLOBAL \
>> -	{ GEN8_FAULT_TLB_DATA0,     0,      0, "GEN8_FAULT_TLB_DATA0" }, \
>> -	{ GEN8_FAULT_TLB_DATA1,     0,      0, "GEN8_FAULT_TLB_DATA1" }, \
>>   	{ ERROR_GEN6,               0,      0, "ERROR_GEN6" }, \
>>   	{ DONE_REG,                 0,      0, "DONE_REG" }, \
>>   	{ HSW_GTT_CACHE_EN,         0,      0, "HSW_GTT_CACHE_EN" }
>>   
>> +#define GEN9_GLOBAL \
>> +	{ GEN8_FAULT_TLB_DATA0,     0,      0, "GEN8_FAULT_TLB_DATA0" }, \
>> +	{ GEN8_FAULT_TLB_DATA1,     0,      0, "GEN8_FAULT_TLB_DATA1" }
>> +
>>   #define COMMON_GEN12BASE_GLOBAL \
>>   	{ GEN12_FAULT_TLB_DATA0,    0,      0, "GEN12_FAULT_TLB_DATA0" }, \
>>   	{ GEN12_FAULT_TLB_DATA1,    0,      0, "GEN12_FAULT_TLB_DATA1" }, \
>> @@ -142,6 +144,7 @@ static const struct __guc_mmio_reg_descr xe_lpd_gsc_inst_regs[] = {
>>   static const struct __guc_mmio_reg_descr default_global_regs[] = {
>>   	COMMON_BASE_GLOBAL,
>>   	COMMON_GEN9BASE_GLOBAL,
>> +	GEN9_GLOBAL,
>>   };
>>   
> alan: splitting out a couple registers from COMMON_GEN9BASE_GLOBAL into GEN9_GLOBAL
> doesn't seem to communicate the intent of fix for this patch. This is more of a naming,
> thing and i am not sure what counter-proposal will work well in terms of readibility.
> One idea: perhaps we rename "COMMON_GEN9BASE_GLOBAL" to "COMMON_GEN9PLUS_BASE_GLOBAL"
> and rename GEN9_GLOBAL to COMMON_GEN9LEGACY_GLOBAL. so we would have two gen9-global
> with a clear distinction in naming where one is "GEN9PLUS" and the other is "GEN9LEGACY".
>
> But since this is a list-naming thing, i am okay either above change... OR...
> keeping the same but with the condition of adding a comment under
> COMMON_GEN9BASE_GLOBAL and GEN9_GLOBAL names that explain the differences where one
> is gen9-legacy and the other is gen9-and-future that carries over to beyond Gen9.
> (side note: coding style wise, is it possible to add the comment right under the #define
> line as opposed to under the entire list?)
>
> (conditional) Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
>
I'm not entirely sure what you are arguing here.

My reading of the original code is that COMMON_GENX_ means the registers 
were introduced on the named device but a are common to later devices. 
Whereas GENX_ means the registers are specific to that device alone. 
That seems a pretty straight forward and simple naming scheme to me.

John.

