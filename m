Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7185247C66D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 19:22:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6495E11B3CB;
	Tue, 21 Dec 2021 18:22:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 750EE11B3BB;
 Tue, 21 Dec 2021 18:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640110955; x=1671646955;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=+v2JoFyhxcajloL0bS8SNbsGEU95PiOutWto1BKwGu0=;
 b=ZVh57Cyr2a3ZQw+9JApZBQVjc9wNztpF0crNtwOa8M9+PLnsUwtQ9uGK
 MvAm46lFX3W8q31RuRLWAqamB8ni0qzyTZTms9Ydm1ftr+L5AI5nrWr9v
 Em6MMmc14ncIFx+mGk+mZa4+nBnY8tIHF3c3d1nQ6a84a3vi5tnBD4Nux
 aWEYCIADdH/pOqvcO13u3EQszUGv6LFJ56XguKYz3rCjEdxQaPuTJqoX7
 7+cIH7H9vihReaGXNPEzLqg+VuVI3vIpYvOjkGXL9N78zuvU40HbauOrG
 WhiFk0TyZ3h9DE7fOP9qcnSWfD0Oq0tzT6M8jLLQSUw8gTUT8rlKBJFA7 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="220477065"
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; d="scan'208";a="220477065"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 10:22:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; d="scan'208";a="570306334"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 21 Dec 2021 10:22:29 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 21 Dec 2021 10:22:28 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 21 Dec 2021 10:22:28 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 21 Dec 2021 10:22:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nrGpWzf5FLHAyX/IgwxLIDw8u5DTJjQbVRrShzCF/ANLGmTA3kVdjsL4uP3cfDhIscdiE6bEM/15cQT9XcY5kWQUk3Uuvgf+MofP89nZNNjCDwBZXM9IRKX6l1UMPnVjOsF/VPMAaFbQFCdBi+tdkHIBcTjWXa8R0CNnqW5Sg8jS3FwYYp5zV0cn6bh/+JCpP/opOyA+qRj3V8KKoFb3SOpth+c0FQdNkrG7uM3SAMw4UtbGPbY4tKZ9lCRzdNW737E52fUJZuAyWiUhULMzTiRiEqKYfSopSK1UieNHWSFM8OpmYUem9FkzsaG7jGbg6Q6f4nMq3GanSN5frOxqHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vAPAvZhe+BbXh1gMavLCkL5rILaBMINz1ZOjkamksDE=;
 b=U/V5CRu53LFUJrr+umy23EcmeX+QiilWxgTxrU6mn61NM3sTiYXfXh+S14JDMqY4N/srOMxk4nr7IwWui6mkmeumgGORjI4MradRD7DbYYxhAAB7ImDevWc44+nQsXKgnKRGZKeLI9K0siljb5yfySWIsoOzAb3vvUcnFBQQWep4L+B8BVupMYe1e2IdPRivE5oWHCULbF2lNkRWFutA55RkdlpSpmbsZiZIk7yXo/XSHfV4LYgPRjDJravB0/bYf62CQmH5OejF3kJdn48vmreYCi/pv2AH3fUU/53Qt4aRPIiwvbinzQkWjhavUl/8HIDxYdZ/yQDavuFsDos3GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 DM4PR11MB5566.namprd11.prod.outlook.com (2603:10b6:5:39c::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.17; Tue, 21 Dec 2021 18:22:26 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::e40a:cc5d:8b71:4ba9]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::e40a:cc5d:8b71:4ba9%4]) with mapi id 15.20.4823.017; Tue, 21 Dec 2021
 18:22:26 +0000
Message-ID: <0144748c-13db-fadb-f6f7-1f628730d8d6@intel.com>
Date: Tue, 21 Dec 2021 10:22:23 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Request RP0 before loading
 firmware
Content-Language: en-US
To: "Ewins, Jon" <jon.ewins@intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <john.c.harrison@intel.com>
References: <20211216233022.21351-1-vinay.belgaumkar@intel.com>
 <4a5ab73b-d68e-bc1a-ea26-d149ef338925@intel.com>
 <79e3fe07-91db-7356-bf49-6a3d79392332@intel.com>
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <79e3fe07-91db-7356-bf49-6a3d79392332@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR16CA0004.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::17) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d820bafa-3f65-410a-1fce-08d9c4aed74f
X-MS-TrafficTypeDiagnostic: DM4PR11MB5566:EE_
X-Microsoft-Antispam-PRVS: <DM4PR11MB55668D6DEC010AC7EA41F1EF8C7C9@DM4PR11MB5566.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:222;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AtJR67G91qXU70sTHN4iq5Et7e1jLa6HkTj/+Shi78PeXL6096gaqR5Gb91mrM7+dKBK51fWTAFoVMuZa++IdBcor5m+PAKRy+ayONjZFwcqeoj47zqvSW46YZe5Ks4wgUbb0SJBeBVuL4PU7DvbddGRI3kgHr0O/geepbM/V3rQLG7O8P90aUQtJnPZ+0y/gkv/Se3I5+hyT9vGJyB83+PhhVrkIwZ4ye+unF/thHVsnVd5/XSFTPLSTuVmZV+0dMxzg4vXWe5od9G1xmDuBCNyHVrid9pp2EMSwoJ9gAn1leUZC6ydYkL/Mqw7wSVgGVfx6EMkkGp24axUGfhd8yReETVpOl/7I9JSwY9NlOIp+XDOjPS0j9azAe5U4V+xeRbp2MtrA/NVUWaNVoDrXZlLFHVOitgGsiHDbPcPK1zoeIdb/tIOgtx/kObXYGnmw3RUnZ3b5V2xnA9juTmy0FZC4/zzTVc8eJ4hNvI0BUjRE3wp6nUnZnM66O9LIXyN5gD/0jHLHtrCvzMhaxLwsBDw/M4Hhl14pNH0UzTwMsaK/eSXC0Vs+bdsTX5dqk/xT9VoUJdJ7u+ERzWWcHp94gFnNF+hBhs9ecv/bqYB+KibbZbacQag7cWrITD4I371bOSaSLft1wHT0482zgKroavNN5zftR+QBAEOFUTjkRKunxsShNW+2kg0Stu6HDlWOCeh77Slyt2ZVc/rgG7KG3jGxflxUmPtccO0gDqu9b4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(6486002)(38100700002)(110136005)(5660300002)(316002)(31696002)(66946007)(86362001)(31686004)(6512007)(6636002)(66556008)(82960400001)(8936002)(66476007)(508600001)(6666004)(83380400001)(6506007)(450100002)(26005)(53546011)(36756003)(8676002)(186003)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3dCeExDeUZWRUlPbk5iQWp6T0hJbFpMMnJsc1BwZEhaSW00eWI0ZWp6UHF0?=
 =?utf-8?B?TEVOSWJ0czkvbEwxUGkwbmxZckZmN1BIM1Blamx4N3p2U3BoVGFmRFI1eDJr?=
 =?utf-8?B?anFsOExkVGhRU000YkJodEc5d2RvME83Q3p1UU44S3Nva0dRNUlzb3dsV0Zn?=
 =?utf-8?B?UjY5ajZRK0NnbVdIRk5CS09Hdi9abmNzVytpTFFmV0ZBOTdDNzlpOWhxd25Z?=
 =?utf-8?B?RW9NSEU4VnhudEhkK01YVGJtOGtaMGF1L2hNL1didlBTVHhFdVJ5Rm5HVzll?=
 =?utf-8?B?ZG13aEhMc2N3RFBnMjRac1BkRXlDR1BRSW1yMDFvOWo0azBzTUJlYlVERkg4?=
 =?utf-8?B?T2pVdUlDTnE4MEE3V1JYV2N3V0RoRWE0bUd5OFZSZ2s2TUgrL2I4Sy9WQVBn?=
 =?utf-8?B?alltT1llV1FaeHhaZStMSW1LWll6VVVzdXEvczVyL1YzTHpkekkyZ2R3K1N4?=
 =?utf-8?B?T3ByWnRzbjdISjQzWTFOT2t4Y09rOSt6cFMxVTRqR21oTGpFWnhHVjQwVmdy?=
 =?utf-8?B?VkYwb2V0TEVzMmFVREtoL09qdXREY2JZYXhLSnhrRDA4V3lwLzMvczFpaG56?=
 =?utf-8?B?VmN4NDBkaXNuSFdOSENuSlA2RVBNdk1RT0Y0UThHRVpxam5mYmNKL1NlL1pJ?=
 =?utf-8?B?bEIrUG82VElJak9mT05KTzVqdzZpakFSSjdGTDdXY3Q1UmNrWDcrd2ZkWEN6?=
 =?utf-8?B?RnpVWnAvV01IbFg1U0NoazBGWHNuTHlqblhWeUsydE13Y0xMYk1CZ043aUFj?=
 =?utf-8?B?Rk1zZ1JmWUtha1g5N1BTN0pEQ1NFaGwrUTdFRWo5UHdKVHRKeUg2b013U2ZC?=
 =?utf-8?B?WHBMVzR1MGRrSENXamQ5RENMcHU5Tlp5cER3NHRJWmFnTHBtVEJBREVnd3Uz?=
 =?utf-8?B?M2traEpZU2pzVThMalhoN2xtU2poYW9xenp4UithQlh5Ymh0Q0F4Mm5qREpP?=
 =?utf-8?B?anF1a1NRanVQRENud0pway9TSmsyZFNrSWJncHl0Wk9ra1RmQW9kUkdqWk1i?=
 =?utf-8?B?WjdnMkRCWVFicTF0RXRpVlZ1cU9SU2d6V1VQdW5MQ3J5Zk1ROWFUUHdydGRB?=
 =?utf-8?B?RjlnOXA0aGNCeWVkSjZCTjhheWRDM2ZjRmdZWk5RUnFsL2hTWno3KzhXOGxl?=
 =?utf-8?B?bURkOXNDMG0zZzcxMUZDL29rbFNVcWNmUmE0T0J5dGtDT2NGZlVOV1RJdjhP?=
 =?utf-8?B?S2kvUFhZQzlMWGNiUExjZWFrVmJ4QWxGRWxNbFFPZ3ZqdXl2SHo5bzFsdzB2?=
 =?utf-8?B?QzFIaG5GZGo2bHF2M01PeVdOY2ZyK1orN2owQWx1U010eVFBeW5DSC9sY0dt?=
 =?utf-8?B?REkrY1BCeWJtNHBmSU85NUJWNjM4NVFTOUdRWVpEckRIY3N4cHZUN0pKUm03?=
 =?utf-8?B?QVE3K1Z6YzdiUDZHZUVWalhPaENJREJUYUtRTEdwYzZjNDFIMWhvRURta0tw?=
 =?utf-8?B?SGp6LzVBcmV0Y2pZN2pZVjdMRVRJbUFmTHg1dHROMGlTaThNQ1R2TThhbE8v?=
 =?utf-8?B?U3V1TS90UmIwVmthWFI0ODNuRXhwUk1jN054dTZqbXV1YlhUTHRwZDNFS0dx?=
 =?utf-8?B?eEkvT1FVR0JYYU14RkgxdWFxbVp2Q3BHUThkWmRXNUhGNCtoZTJGdHNKK01h?=
 =?utf-8?B?QkZNcTJ5emZzZy9zNmpiMm9TVjZQbmNyRkpIc1UwU0R4UzBQVUZDK25wZ3VE?=
 =?utf-8?B?Y2xvMFM0WVhCNGlPWlRjNmRGMG5RSDhkMEMxbGlBNlFsOTlRYUppS1FneFVw?=
 =?utf-8?B?K2xBMkRETVcrcjBldUh3R2gzVzFMYit6QmRsblhmSUx5dEF1Qng1bXAyRXI1?=
 =?utf-8?B?Y0tyVXRCcEgwcHFMRWkwdlN3d09rdWxGS3ZwN2dZajl1SFk0YnFSalRjRWJL?=
 =?utf-8?B?M2I5Z3ZNM2NPVnBReENrcVdFbWRSczJ4UFpqbDF0SVRmb2c1ZG1WN0JreWtM?=
 =?utf-8?B?VzZhanI3b2hGOXRJcldvM3FyeXZJTjFsTENCdGNTOFRxNXFqNURBWHllRjdj?=
 =?utf-8?B?NkZzRXhjYStNOHRhSWFKR2pKdnVZQ2dxcGlvWkppTk1GSXdPVnJLZW9ta2Jz?=
 =?utf-8?B?eWhHbDFnRmlnM3lJbHZvYW1QMFJwaHl1M3NrajlsQ2x3WktPaUMyNThnNHln?=
 =?utf-8?B?eEl0NUM5OGtOdEhteFFJYkhuUVd2ekcrN25iMXRYbEN1WitYZzhpa2hic083?=
 =?utf-8?B?UE1VQlFEWXBzRWM1YVhVSlBFNjVYMEM1a1ZBaHg4TFFsdHM1Q0JHbHFLT0tu?=
 =?utf-8?B?Nnhkc3ZoN2dOTnlER0RSMDd4VjJnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d820bafa-3f65-410a-1fce-08d9c4aed74f
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 18:22:26.6995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3e6vL7oL4I8AIiZFrG82ipzVh3C692W9xgUGNVevCZCx0tPkJqggUYWz37kDSn2O0kJAvjSDojcW1IrwUSm0iRZ/Rdq4ER5z8nRya8+Jzdg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5566
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/21/2021 10:11 AM, Ewins, Jon wrote:
>
> On 12/20/2021 3:52 PM, Sundaresan, Sujaritha wrote:
>>
>> On 12/16/2021 3:30 PM, Vinay Belgaumkar wrote:
>>> By default, GT (and GuC) run at RPn. Requesting for RP0
>>> before firmware load can speed up DMA and HuC auth as well.
>>> In addition to writing to 0xA008, we also need to enable
>>> swreq in 0xA024 so that Punit will pay heed to our request.
>>>
>>> SLPC will restore the frequency back to RPn after initialization,
>>> but we need to manually do that for the non-SLPC path.
>>>
>>> We don't need a manual override in the SLPC disabled case, just
>>> use the intel_rps_set function to ensure consistent RPS state.
>>>
>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gt/intel_rps.c   | 59 
>>> +++++++++++++++++++++++++++
>>>   drivers/gpu/drm/i915/gt/intel_rps.h   |  2 +
>>>   drivers/gpu/drm/i915/gt/uc/intel_uc.c |  9 ++++
>>>   drivers/gpu/drm/i915/i915_reg.h       |  4 ++
>>>   4 files changed, 74 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c 
>>> b/drivers/gpu/drm/i915/gt/intel_rps.c
>>> index 07ff7ba7b2b7..d576b34c7d6f 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
>>> @@ -2226,6 +2226,65 @@ u32 intel_rps_read_state_cap(struct intel_rps 
>>> *rps)
>>>           return intel_uncore_read(uncore, GEN6_RP_STATE_CAP);
>>>   }
>>>   +static void intel_rps_set_manual(struct intel_rps *rps, bool enable)
>>> +{
>>> +    struct intel_uncore *uncore = rps_to_uncore(rps);
>>> +    u32 state = enable ? GEN9_RPSWCTL_ENABLE : GEN9_RPSWCTL_DISABLE;
>>> +
>>> +    /* Allow punit to process software requests */
>>> +    intel_uncore_write(uncore, GEN6_RP_CONTROL, state);
>>> +}
>> Was there a specific reason to remove the set/clear timer functions ?
>
> Replying on behalf of Vinay Belguamkar:
>
> We are now using the intel_rps_set() function which handles more state 
> update in the correct rps path. We also obtain an rps lock which 
> guarantees not clobbering rps data.  The set/clear timers were being 
> done when we were modifying the frequency outside of the rps paths.  
> rps_set_manual is now only called in the SLPC path where the rps 
> timers are not even running.

Got it.

Reviewed-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>


>
>>
>>> +
>>> +void intel_rps_raise_unslice(struct intel_rps *rps)
>>> +{
>>> +    struct intel_uncore *uncore = rps_to_uncore(rps);
>>> +    u32 rp0_unslice_req;
>>> +
>>> +    mutex_lock(&rps->lock);
>>> +
>>> +    if (rps_uses_slpc(rps)) {
>>> +        /* RP limits have not been initialized yet for SLPC path */
>>> +        rp0_unslice_req = ((intel_rps_read_state_cap(rps) >> 0)
>>> +                   & 0xff) * GEN9_FREQ_SCALER;
>>> +
>>> +        intel_rps_set_manual(rps, true);
>>> +        intel_uncore_write(uncore, GEN6_RPNSWREQ,
>>> +                   ((rp0_unslice_req <<
>>> +                   GEN9_SW_REQ_UNSLICE_RATIO_SHIFT) |
>>> +                   GEN9_IGNORE_SLICE_RATIO));
>>> +        intel_rps_set_manual(rps, false);
>>> +    } else {
>>> +        intel_rps_set(rps, rps->rp0_freq);
>>> +    }
>>> +
>>> +    mutex_unlock(&rps->lock);
>>> +}
>>> +
>>> +void intel_rps_lower_unslice(struct intel_rps *rps)
>>> +{
>>> +    struct intel_uncore *uncore = rps_to_uncore(rps);
>>> +    u32 rpn_unslice_req;
>>> +
>>> +    mutex_lock(&rps->lock);
>>> +
>>> +    if (rps_uses_slpc(rps)) {
>>> +        /* RP limits have not been initialized yet for SLPC path */
>>> +        rpn_unslice_req = ((intel_rps_read_state_cap(rps) >> 16)
>>> +                   & 0xff) * GEN9_FREQ_SCALER;
>>> +
>>> +        intel_rps_set_manual(rps, true);
>>> +        intel_uncore_write(uncore, GEN6_RPNSWREQ,
>>> +                   ((rpn_unslice_req <<
>>> +                   GEN9_SW_REQ_UNSLICE_RATIO_SHIFT) |
>>> +                   GEN9_IGNORE_SLICE_RATIO));
>>> +        intel_rps_set_manual(rps, false);
>>> +    } else {
>>> +        intel_rps_set(rps, rps->min_freq);
>>> +    }
>>> +
>>> +    mutex_unlock(&rps->lock);
>>> +}
>>> +
>> Small function name nitpick maybe unslice_freq ? Just a suggestion.
>>>   /* External interface for intel_ips.ko */
>>>     static struct drm_i915_private __rcu *ips_mchdev;
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.h 
>>> b/drivers/gpu/drm/i915/gt/intel_rps.h
>>> index aee12f37d38a..c6d76a3d1331 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_rps.h
>>> +++ b/drivers/gpu/drm/i915/gt/intel_rps.h
>>> @@ -45,6 +45,8 @@ u32 intel_rps_get_rpn_frequency(struct intel_rps 
>>> *rps);
>>>   u32 intel_rps_read_punit_req(struct intel_rps *rps);
>>>   u32 intel_rps_read_punit_req_frequency(struct intel_rps *rps);
>>>   u32 intel_rps_read_state_cap(struct intel_rps *rps);
>>> +void intel_rps_raise_unslice(struct intel_rps *rps);
>>> +void intel_rps_lower_unslice(struct intel_rps *rps);
>>>     void gen5_rps_irq_handler(struct intel_rps *rps);
>>>   void gen6_rps_irq_handler(struct intel_rps *rps, u32 pm_iir);
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>> index 2fef3b0bbe95..3693c4e7dad0 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>> @@ -8,6 +8,7 @@
>>>   #include "intel_guc.h"
>>>   #include "intel_guc_ads.h"
>>>   #include "intel_guc_submission.h"
>>> +#include "gt/intel_rps.h"
>>>   #include "intel_uc.h"
>>>     #include "i915_drv.h"
>>> @@ -462,6 +463,8 @@ static int __uc_init_hw(struct intel_uc *uc)
>>>       else
>>>           attempts = 1;
>>>   +    intel_rps_raise_unslice(&uc_to_gt(uc)->rps);
>>> +
>>>       while (attempts--) {
>>>           /*
>>>            * Always reset the GuC just before (re)loading, so
>>> @@ -499,6 +502,9 @@ static int __uc_init_hw(struct intel_uc *uc)
>>>           ret = intel_guc_slpc_enable(&guc->slpc);
>>>           if (ret)
>>>               goto err_submission;
>>> +    } else {
>>> +        /* Restore GT back to RPn for non-SLPC path */
>>> +        intel_rps_lower_unslice(&uc_to_gt(uc)->rps);
>>>       }
>>>         drm_info(&i915->drm, "%s firmware %s version %u.%u %s:%s\n",
>>> @@ -529,6 +535,9 @@ static int __uc_init_hw(struct intel_uc *uc)
>>>   err_log_capture:
>>>       __uc_capture_load_err_log(uc);
>>>   err_out:
>>> +    /* Return GT back to RPn */
>>> +    intel_rps_lower_unslice(&uc_to_gt(uc)->rps);
>>> +
>>>       __uc_sanitize(uc);
>>>         if (!ret) {
>>> diff --git a/drivers/gpu/drm/i915/i915_reg.h 
>>> b/drivers/gpu/drm/i915/i915_reg.h
>>> index 1891e7fac39b..b2a86a26b843 100644
>>> --- a/drivers/gpu/drm/i915/i915_reg.h
>>> +++ b/drivers/gpu/drm/i915/i915_reg.h
>>> @@ -9399,6 +9399,7 @@ enum {
>>>   #define   GEN6_OFFSET(x)            ((x) << 19)
>>>   #define   GEN6_AGGRESSIVE_TURBO            (0 << 15)
>>>   #define   GEN9_SW_REQ_UNSLICE_RATIO_SHIFT    23
>>> +#define   GEN9_IGNORE_SLICE_RATIO        (0 << 0)
>>>     #define GEN6_RC_VIDEO_FREQ            _MMIO(0xA00C)
>>>   #define GEN6_RC_CONTROL                _MMIO(0xA090)
>>> @@ -9434,6 +9435,9 @@ enum {
>>>   #define   GEN6_RP_UP_BUSY_CONT            (0x4 << 3)
>>>   #define   GEN6_RP_DOWN_IDLE_AVG            (0x2 << 0)
>>>   #define   GEN6_RP_DOWN_IDLE_CONT        (0x1 << 0)
>>> +#define   GEN6_RPSWCTL_SHIFT            9
>>> +#define   GEN9_RPSWCTL_ENABLE            (0x2 << GEN6_RPSWCTL_SHIFT)
>>> +#define   GEN9_RPSWCTL_DISABLE            (0x0 << GEN6_RPSWCTL_SHIFT)
>>>   #define GEN6_RP_UP_THRESHOLD            _MMIO(0xA02C)
>>>   #define GEN6_RP_DOWN_THRESHOLD            _MMIO(0xA030)
>>>   #define GEN6_RP_CUR_UP_EI            _MMIO(0xA050)
>>
>> Regards,
>>
>> Suja
>>
