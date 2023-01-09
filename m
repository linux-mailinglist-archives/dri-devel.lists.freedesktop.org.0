Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4DD6631A0
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 21:36:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6399810E48E;
	Mon,  9 Jan 2023 20:36:38 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EBCA10E48E;
 Mon,  9 Jan 2023 20:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673296595; x=1704832595;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jqn+fcWw/KVHNUCRLZoIREyrwfFkFxKqF4AfFj32ro8=;
 b=KtkMGYfcrybm5DLMy3plP0gSIGeh6OjqR2Jq+dRLfsju2TMPIxU+2zIN
 55cK8qMiF2NcWn+4sIRunX8WPnfEVUyzrLCSS85EUl3pEKZQIGiQu8cWn
 SPBYiHeWjyV/oKvOpTWODpQ/lkDOYh5B4my/LKix4Uo8ro+2HQQpzqQi8
 qR2lkNmG32LqOCrUv7GQRXftXQghdPPzvJaCnLzlVSC0I4n5G1OqCjs1g
 g66nfUauYNbJJ81iODo+EOUFRc9ITdF6suu3112UBe2AT7Jh6xqj0EvQ9
 ZJZWK8rMvES8q3H06j5leOEq29/BK9ZIbSgN0j2u+rQ9Hr324H86fA5YK Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="320674866"
X-IronPort-AV: E=Sophos;i="5.96,313,1665471600"; d="scan'208";a="320674866"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2023 12:36:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="725295851"
X-IronPort-AV: E=Sophos;i="5.96,313,1665471600"; d="scan'208";a="725295851"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 09 Jan 2023 12:36:34 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 9 Jan 2023 12:36:33 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 9 Jan 2023 12:36:33 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 9 Jan 2023 12:36:33 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 9 Jan 2023 12:36:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=itf1QBtHTLqlHC+bHhBKiG/4bXwujXFXrLSZDf7nkgO/FASRFDk/4+aiZHKLtCL7MDrfU7dciudner9tjYwoN8HxLedtdksk0SVK6FVK4Lknu9xtrs0MdJbRtGlOQf+DQZnKaJWHH+Ow5hn/+5eurn3t3Iqw8iHSI5OWTs0Aaa+8MuF+imFjgej6wYMWo1OxhzyS7h1M2MR5Z7b40Y5e3/7AF3jHnKCDAtOnhKpUPtzn1dWjdhQvULoh2XOL3pdEn2IXROPXEx+rplPjW2Pw+wKa+7Y2zKxw+xVqR6w4zijvWOthxrl7OIK1BfjfWcVda1Mhp54FQAMnj6x5cwWk7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UAV3oPmEMAvWCi8nRdpvdf8cMDLPwJAaBEiNG0gLuwQ=;
 b=oLdwzs5BLOz8Nzkc+JTEKL79RLRTwZZCqa4P8KtYdGDFrFOhbq1KGbxXYc/I2sN5mBtN51X2VYuSFxWvdZHYsF1pPhL/nr6TGWfW3gx0HVHAldlf3jI3CQWpIaJIgHMyl7oSVtV12npB2u89fUhDGgx/2JyYGcnVw//PVotP0HrewxjNy3todWETowE0ecSngUXO4AqOfcUv2ozOdrnSo2CSz5tTLSADa4KQ32IVONgJbS5MFd/JrW0cIzeAjkXlLF3WqUhRo7VfUFqxc25sjQVFq1tcvXOkkBrLmXDFN7XB6uhEehuyNSDm3NUpqKOeB+XndEe2wx59JAlIBuPiPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BN9PR11MB5452.namprd11.prod.outlook.com (2603:10b6:408:101::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 20:36:31 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::ec2f:4a87:326b:2610]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::ec2f:4a87:326b:2610%7]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 20:36:31 +0000
Message-ID: <9b3b91fa-568f-982c-7e87-7b3580aac1ed@intel.com>
Date: Mon, 9 Jan 2023 12:36:28 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH v2 4/5] drm/i915/guc: Add GuC CT specific
 debug print wrappers
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20221118015858.2548106-1-John.C.Harrison@Intel.com>
 <20221118015858.2548106-5-John.C.Harrison@Intel.com>
 <48f594de-9682-4b60-f934-9420d02b405e@intel.com>
 <dd9559e8-7d65-d7bb-ea1a-d169a1c7eec3@intel.com>
 <4579b7e8-eae7-b760-66aa-b01273d18aab@intel.com>
 <d658f8fa-a063-aa0c-48ff-14f32cb6b339@intel.com>
 <9a5a84be-a5ae-7be2-f522-5e976511e4e1@intel.com>
 <143a660d-de2d-a77a-b490-8ad2add80420@linux.intel.com>
 <dd787d9d-8559-1da4-7e99-2635ef1341a8@intel.com>
 <c5622088-e381-1df4-417d-9b033b0a6afe@linux.intel.com>
 <467f47f4-c30f-16ba-3330-a3d4752366a8@intel.com>
 <f0ebffa1-45b7-d6f9-4341-3fa8aabae3f5@linux.intel.com>
 <127d50a6-b0c4-b87b-ddf5-6bd121d53f3c@intel.com>
 <58691e33-4b69-aa16-42bf-4c2d5ae5b699@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <58691e33-4b69-aa16-42bf-4c2d5ae5b699@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0205.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::30) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|BN9PR11MB5452:EE_
X-MS-Office365-Filtering-Correlation-Id: dcaea33f-601d-456f-8417-08daf28130c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dXqU30HKkKmYtOl9tERPVAp0oF1VdJ882MNOXugvxivXCm76ZI4uZjwXAeSujNpa9YfOPkhgdODDtDmUr+/jAbQU1/cfEG7f/HU8oQ6LOYjGdvp5dK2JNkC0StxzJNT0GVfNHHJvE8zAHsXH6e1uSxarCOjd0piP2Uan2s446Nj9HvjMkyZd1CoH4m4VH/Zf3xWrNjkE3+prbag1D2GCV17N7q3RoTRpn6xhvwLPMEDpbE87EPEgqVOh+U6snpzdrp5Vn+ci/KAIyGKww17sea/OazpxYPUbMH1alvvgbSiXRrqTrviw2h8H8CfWCat2EAJKOCJNkLNGUP2SS9OQ9A+NvYB1TMWIAP8HtX3FIxMeLA2lrs2Js6ctIdxlANO1TG4tw4Dz3M9HugDuy9xkmDafjmY6lcdKUuiHuj7YnWJN3zZzM57txXEzqTt///5tvNtHwk3iSxpkqchGLMX7BMchOSVjDMRPj8+Z0JpReCd9c7GNlDPT/3FVqIszzBpHls2VQYDUwGkKyY7PizD6DbtiXe5OgWiO/UnORx5Gg7IraJm657VHpfydEAgB2HlvJRNNYou82cnV8yvSlEUXe8YeT9PpLBxBbzBBo6ZdtOTP1tbKTfjp+ucUF7euD0PutXuPB6uZvur2RHCbdPKStwORX96YXmfTvJSzGwI4qwlc1H4oDz71rmi55eI3XgjH8+9qHNHH/RCR9znU4PzHQ98Za9wpSF1Tct5eh/qkJW5oazgeNZldLLRn6dKdCNWR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(376002)(346002)(39860400002)(136003)(396003)(451199015)(2906002)(83380400001)(66899015)(110136005)(54906003)(2616005)(66476007)(66556008)(5660300002)(66946007)(6666004)(26005)(53546011)(186003)(36756003)(8936002)(6506007)(6512007)(478600001)(82960400001)(38100700002)(8676002)(41300700001)(6486002)(31686004)(86362001)(4326008)(316002)(31696002)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0pVa004SjNyWWlOTkNodzFNQTV5NE9WeGFmTmZ1c1BnMy9vWCtKTTMvU0c1?=
 =?utf-8?B?UHBuRjM0Rk5qSVBsbjRJWTZrdW5LT3RkYlNDbHRHN01wU1JmZlQrVGF5UHFU?=
 =?utf-8?B?Y1BNNHlIdjMxNjkrWlZhZ2ZCWTZsZWtwejJGWTdyOGxDOVdmeWQvclg0OW5V?=
 =?utf-8?B?a0lLcnJPQkFpN254ZTdmRWRxY1dyR2xsTm1ZdG12ekFzV0JjM255dmY5ZlVS?=
 =?utf-8?B?Y3ZCV1VsLzE4Z3NXamt5dndXNUVGV0FtRk5kSUJXbCt6dldiNzdTTWsrQ0pJ?=
 =?utf-8?B?OHdZQmJVWlRXZHpoZU1reWM3NHlTUDFzSGptcFNsZmgvMldpVk9SUzdMVTZr?=
 =?utf-8?B?M0hMa2dvTzdYVXgyb3hRb1Jma2FNS25wYWlzTDZEMUwrK0lwNHBtNWowM2h1?=
 =?utf-8?B?akhsZ3U1VlpZU2ttRnVEUWdVWFp2L1dGeGhvTWRVeEk0SVk3eEVoZzZhbDZ2?=
 =?utf-8?B?emNDbVI5bUF6UDc3U2h4bkJoYjFBUXEySVlrWnIxcHRTRWFMVDQ1bDB2MXZy?=
 =?utf-8?B?QjVBNWpzNXZraFk1ZHdMSGViTE04Z3d1OTNGZ0NSdXZ5UGprTUtwbURTZDA1?=
 =?utf-8?B?U3hRVFBGN0R6V0c5ZFJIRS9UMURKamZBYysvYVF6OEtqenZDamZRaUhObUFK?=
 =?utf-8?B?NFpMSnlTOGs2LzViNlNoSm90N0hpK2lVaUlVc3FjSGwyUC9uS3NLT29vcldK?=
 =?utf-8?B?T1ZsR2lXUDlIWEQvdmZlWjdxSkJwYXFadXlUYi9HTjNpazk0bDNOYll3V1kr?=
 =?utf-8?B?dERMeXA4YUhNUFlwMHhibkV0ZU80QmhwYzN3dlR0Rk9UaXpwOHd1a2NXN0JT?=
 =?utf-8?B?a1VYY2hWKy9qakUvZkkxelBDZC8vRW1VbitFYld6cGYvdWMzT0xocWdldUdj?=
 =?utf-8?B?a29xWk5sVWRCNEJyay9kWHY2NmpaMzVGeDVCVnZWNlVzbkozRVVlTXVkTnVx?=
 =?utf-8?B?aWx5Nml1SFhNOWcxeHVXRVNiRWtlRTltQ0o4K2QvcHFwc3RVbFA4OVJiaVBv?=
 =?utf-8?B?YVdrUWZjdW9maUltM2k1SmFQM2Mrdk10WDZqanZwWjZtdmRCWGJsN2N2WkZR?=
 =?utf-8?B?M21pMndPYTdVenBuRGNJZWhtaVRuY2VscW5UV2N1bG1IRVpHclVRODNWL1pB?=
 =?utf-8?B?Wmt1aG1sdVJiNUlzbGQ4L3dQdVk0TXNyT1R5ZWpaYmNtNkFpR3NjcG5JZjV3?=
 =?utf-8?B?SC8vQitYd3ZuVHJCem1pZW4wRXpralJsUXJHNlBSOWRpbThQYTR3OVgydFF2?=
 =?utf-8?B?NVFBQ2d1M205MC9hbHY1TDFVNGxXQjNPSC95R0Z0NXJ1cDdnSjBCK1RUdmNy?=
 =?utf-8?B?SXVWR2Z1NlZSME5vT0xlclZCUWJEand4WkVkYklFN1dhR3RLMElmR2UvMi9z?=
 =?utf-8?B?ek9QOGJueUZzeE81ZDlaUlhMY0NycUY3dTROcUYzY3Q0Yjc0UzE1L280Y2Rw?=
 =?utf-8?B?bEhpbWQwRUVESnk4QUxhUnJneWM1Rzk3cTNXdFp4bXdJbGVTWEZ4V1QwQ0pT?=
 =?utf-8?B?cXlraEdJbW8xQmlqb1M5akJ2eHhHbUtjamFTODRJOUJLOEVrYnNYV3NqVDBX?=
 =?utf-8?B?MTZ5V0Z6K0NXS25CN2l4bFg2WEN1bUd1dzRWZGcrNUZNcUoxMzBSWnUvK3gv?=
 =?utf-8?B?eFg0SExXSlZFdlRJRDlFUzM4SXhnb2xlcXV3eEhNK2pRZ3VqdUg3dklUQmxB?=
 =?utf-8?B?VmgrWGsvcmFPa01yM3dUcXhIVGlPZnUwSXhKSXNCNnBvQ2pjTDAwMFQ1cnRn?=
 =?utf-8?B?QXZKRTUycHFMMk5Fd1NoMWF2U2VZTWUyaDR0Y1llSWpoVlpJdk1jUnFvcldl?=
 =?utf-8?B?ODBJQk5ST25PVGxmRzFPMis2cUdPUnJZUjIva2RCKzV5ZGV4WU5uSEQ4WU5a?=
 =?utf-8?B?SW9PLzliOVVpTHd1MEgzNTFEMkVEc1F0S0doWk9MdUhwNWxuTTJkV3craHo0?=
 =?utf-8?B?Ylh6Ukt3K0x5TVBJS0lZbU5OTm5JOTUya1ZKM1Vpb1FhenE5RVc0NmtIdDRH?=
 =?utf-8?B?cnJmUXI2NHZuRE9WdjRGaXh0SHl5VTJpUThBMWxmQjBpWHE0MlVzWGdKVjZI?=
 =?utf-8?B?aTRuWkw4QUpQTjdDeElCZmRJZUl0L21naGFrdFE4RU1LQ2Q5UmhJOHpHci9H?=
 =?utf-8?B?TmpHSUp0QnlaaE91eXBZZTBnZldBQ3VCL2VGVmswekFydXcvMWZSSGFKYk5X?=
 =?utf-8?B?b3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dcaea33f-601d-456f-8417-08daf28130c9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 20:36:31.0499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hV6Zz5Cmge/BxEKKMien+xUHAuywbyF6YrU2oESfxxQMUGziWTIFe69OioomkGZngDKQjZ2zDSegONe55H5FTLvp7unjDuimNCJJgLJQlkQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5452
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
Cc: "Ewins, Jon" <jon.ewins@intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/9/2023 01:39, Tvrtko Ursulin wrote:
> On 06/01/2023 18:57, John Harrison wrote:
>> On 12/6/2022 03:06, Tvrtko Ursulin wrote:
>>> On 05/12/2022 18:44, Michal Wajdeczko wrote:
>>>> On 05.12.2022 14:16, Tvrtko Ursulin wrote:
>>>>> On 02/12/2022 20:14, John Harrison wrote:
>>>>> [snip]
>>>>>
>>>>>> Random meaningless (to me) message that is apparently a display 
>>>>>> thing:
>>>>>> drm_dbg_kms(&dev_priv->drm, "disabling %s\n", pll->info->name);
>>>>>> i915 0000:00:02.0: [drm:intel_disable_shared_dpll [i915]] disabling
>>>>>> PORT PLL B
>>>>>
>>>>> Plan is to not touch outside gt/.
>> For some unexplicable reason that means it is almost impossible to 
>> see the actual problems in most CI dmesg logs because they are 
>> swamped with irrelevant display messages that cannot be filtered out. 
>> For example, I recently manually grep'd out all the display spam from 
>> a bug report log. The dmesg file went from 12MB to 700KB. That is a 
>> significant problem that makes bug triage way harder than it needs to 
>> be.
>
> I didn't get this part, how it would reduce the amount of spam by 
> adding new macros? Anyway, that's something to split out and discuss 
> with display folks.
It will allow someone to trivially filter out everything with that tag. 
Which then makes it orders of magnitude easy to scan through the log to 
see what happened.

>
>>> Maybe as a way forward work could be split? If John wants to deal 
>>> with gt_xxx macros, avoid touching GuC (putting his original 
>>> motivation aside) and you want to convert the gt/uc folder? Assuming 
>>> John you are okay with "GuC:" and "CT:" prefixes.
>> Meaning just repost patch #1 only and expand to more intel_gt_* 
>> files? Sure, if someone will actually reply to that patch with some 
>> kind of r-b first so I know I'm not still wasting my time on a huge 
>> re-write that will to be redone multiple times when someone objects 
>> to the use of a colon or the lack of spaces, braces or whatever.
>
> First patch looks good to me (ack in principle) apart that Michal 
> found one potential null pointer dereference if I understood it right. 
> That other comment about the ratelimited call is maybe okay to leave 
> for later, *if* it will be a single instance, otherwise needs a gt 
> logger as well. I can r-b once you re-send with the first issue fixed.
I've already fixed those two issues locally. I'm not going to touch the 
TRACE macros.

Okay. I'll extend it further and repost.

John.


>
> Regards,
>
> Tvrtko

