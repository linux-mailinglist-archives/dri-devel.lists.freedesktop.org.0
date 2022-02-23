Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 686504C07AC
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 03:15:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2643F10E323;
	Wed, 23 Feb 2022 02:15:09 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94BA10E11A;
 Wed, 23 Feb 2022 02:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645582507; x=1677118507;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=F8Z+f5odHopJzYTXu5RwtIcU3d7Zv4NVgwj73+GEwVk=;
 b=KDmW6l3T84Ee0r0YJ3e6oduk0R4EBd8qoA7uKK3e7s34ikDS+jNn0rRV
 V1bxCtgBaYog1X9VhsVKynNRAqsdLhlUwLvn96neAOgOW23j1xdgZIBu8
 s/IUbHsj9ktZRDFvj62JbbvDbPAJSmU5UB81wULsN07EwhJGVfA0VksCT
 sGISTPLyX4tB4Kd95oZ7OpJcCWrEqFXsxA0XipbJEVBwSNrnORDZwnNBo
 O5IqMNroY1Fpp03VQQ7FxyN6jPldw9b6WSWofcOYU6JozovdFhJ2e+fNE
 Tt1GoMFbuW6ilXLYjAthsSpJ8hFX6j5Tu+rZ/8SL/bIB+o4DS5/vnjAHW w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="231838699"
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="231838699"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 18:15:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="532490660"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga007.jf.intel.com with ESMTP; 22 Feb 2022 18:15:07 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 22 Feb 2022 18:15:06 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 22 Feb 2022 18:15:06 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Tue, 22 Feb 2022 18:15:06 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 22 Feb 2022 18:15:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQhCSMK/Z6C5Twv2KeHl/wAodczeBbMedEC0PSknfVqMKU/IVBpwta01S0RCELNuYOEKTzhpLKtwVVxBF2ojGvozv3bmLuKR8rn1Us37pRiglXRaX7Lxv4r17fLy1zNfBi1N+6M7XY2DZl8gNiY0IvETj0YJMY6TL1QOrei3YnKudcejwVkYQ/P1Ws4AZ5xdEETqsczFUXB6iFIqxcvUbujC1Cwrk1gs4SlPBQLH7R4s+PgUGoyN6Qo6b7+fTm3YBuohmrw781OqShu5i9MwIg8HbCfgDxDkz4LZKQoYQBB9/kaUtSH3OZ3pdO2tUoU4BBDqpFLtynYs6jdsP/dD8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wY9RDeIKaghSXmKTmeH27ZbjXQw5ARihmd5LbbxOWqo=;
 b=TiXczJgeUtLsR45CN9L1LDMhQIX8U4DcEcFC95BelZVS9PQWYc3QsWiMKaVS8DwVHTpsjn7tmBa1SzM0i7kOSaLD566mNB05NnZrwb09H5ZUQQejPr99DYxPJpp8ZGlh2rB6oWfuU8qdrW1YFSzrp1A26a/SfZ+Drst+hnXHqpn6+tmactGIBGvjU4XEawTeZR7Ry7cyqZm1HbV/HTJK7uVQkfj1amfrFda/c3baynm1UBfBVy0e2RMZwiMzn4yepuolLDd7Ixi8FZNnR3GDO4JmAcGsGF4EayyYGUUHEuVsyS6/MdkmpYAo6dHOzljlSR8ENZ6ZoDBUzjXA0dxomg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM5PR11MB2043.namprd11.prod.outlook.com (2603:10b6:3:e::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.17; Wed, 23 Feb 2022 02:15:03 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7%4]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 02:15:03 +0000
Message-ID: <3b7c153c-0758-ae8e-e9de-3a0ec08cf757@intel.com>
Date: Tue, 22 Feb 2022 18:15:00 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/i915/guc: Limit scheduling properties
 to avoid overflow
Content-Language: en-GB
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220218213307.1338478-1-John.C.Harrison@Intel.com>
 <20220218213307.1338478-2-John.C.Harrison@Intel.com>
 <43188569-1b01-9e87-6b57-36920eccae92@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <43188569-1b01-9e87-6b57-36920eccae92@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P221CA0027.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::32) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a304a710-bff3-4099-f2c0-08d9f6724d40
X-MS-TrafficTypeDiagnostic: DM5PR11MB2043:EE_
X-Microsoft-Antispam-PRVS: <DM5PR11MB20434C667CDE2A44E6E7A444BD3C9@DM5PR11MB2043.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YxpRZNXuMXdzU/InxVEV8jU6tCD24xX0J7xwYw8MxFe0G52LwZd6K3WbUm/dxPO6B4e9xvoQVHIDjOG23W+4Yt43sfl2HJL+ZItSzXPT7U5su8mVmVxk9VW93NkqtoM4bcjZi8VQZAcTa2h1D+B9xKVNnV6NubiZi6E9I5fQCItmsJwzwpRrnLEjKwhc6zVfFfafD95jcT5+hd4jCUae8j06KdPsCwtUMt8YXPflARR6Ak54L12+I3HWsLklaYnDgA/IDRfWSicuCNqPy9aJZnZ3ofrbCFVGy7jguehlUzxlg1ma6BYTw385AEZLgWt3uLGLAmfjOdeVzpjqN9im160R3ycgB8g6O4YMnFld96XnVbyapWYdOSifga+Z9qF82L94DPGei48AWCGFODvsNhON5/7Kp4I6R0Tz8xDY0Sv10rO9bSBLpBAnUcmSGENOiu5CFwwINsfVO3dO02Wtf1mAeLIO9lFyz/wn6M8Eln1qLhafluuI6qSWUt/lJZw3SxKG6mWS68mwPyXRoJ9MPQkWhuJ29OrsTdeiimrYi+dTErectgZ9cnoMLYYvTtT0EDYsJffvAShs9E5RdLUKFu4+m6MbRPb4KfgD8WQgzNrxFs+ljw20dL6d1Y60X6qoJRjK5PH5OqA+9WB1qq60vhFn0dX9Kk9J0SjpVGyGd/MTglzHZ+5uCJZPdF2JeCpHJmrZAfJyacY/U5lFIeytx9SjBBdXH9f3spek9XriMgk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(38100700002)(83380400001)(36756003)(5660300002)(2906002)(8936002)(31686004)(6506007)(2616005)(53546011)(6486002)(186003)(26005)(6512007)(66946007)(66556008)(82960400001)(450100002)(66476007)(31696002)(86362001)(8676002)(508600001)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGpoV2Q2ZGRjdWJPcElZVkl6dU9wdm4vSTJwVXdpVXpnZWYxdlU3ZkN6UnhY?=
 =?utf-8?B?UjFsclZyVklHVmZYRnFqVFFPMUxSNDFXVG5RY2ErbU5tZ0ZDVCtjNmtUMFhL?=
 =?utf-8?B?aEdQWnBWLzFuMGlKeDFaUThVWC9BTzNHVXBUajhPS0VoVmRMNmNuQVF1bEdt?=
 =?utf-8?B?bVFvRy9CaHlCQjFiN1pHT3ZxZVdTZnV4VW9WeXdEemh1aGlNRHNjYmk4dUFy?=
 =?utf-8?B?OXFuQnJ4OUtiV3RBZGdRUFczR24vYURZNk5aMWZER3VlaG9jL2VZbHJOd2Zy?=
 =?utf-8?B?Vm9XMFovZ3FjZjAvUkN0ck5TYkNUVVA3a2MvM0M0NUFZZVVYQ3VlT3pXL2dh?=
 =?utf-8?B?R1VjR2ZRYTQ1TDcrdG9mTFVPWVB0ZUx1L0l2VDNNbWZZUlVCVTk3WlhEdDRC?=
 =?utf-8?B?NkNaQmVETGRKRU8vM0VrRzZ1SXI4dm5FQ2c1aDBPbXVzQzBqaXlsekpsNEd4?=
 =?utf-8?B?aTFSNXhVaHhYMVVLQW1zb2tidmNXR3grRXJhTnVWSG5yZ1R5SnZ1UzdxbXlZ?=
 =?utf-8?B?UG9zZk1UcHZIanhvci9MYkhEVzJKSjQ1aWV5cmxOYjNLb0k1SHBURytOeEZl?=
 =?utf-8?B?S2h6MS9PMi9yQi8rL3Ruc1g1NndwM0tyOEludU5BaUlraGUyV2dtdG94TlNY?=
 =?utf-8?B?YmM5K0FqSUs2YU1QOXBCNDNCVzgya1crK2hWQ3RXTWVNZ3hHTHV2MjRVbVlo?=
 =?utf-8?B?TkZkQlJLMEd4TDdMeFE3cEgvUm1UZlZud3licUtScjNyckNmQ3NWSzNGcHZt?=
 =?utf-8?B?ejV4RTNMcEl6NGVEYjB3MW11U2RSMUNXMi9UZHlrQ243Q0l1M0JRTGlqZHg3?=
 =?utf-8?B?c1NGVDNYTWRkcjdqV0pjTXJPSlp5eXZ0RWI4N2JkdS9xN2EvTDJ6R1lMeEpJ?=
 =?utf-8?B?bDlrVzdicys1L0FuV0FTKzdoVnYyYlNjSnNzdGNMVUFIdGVMSmdlL0o2b0Jx?=
 =?utf-8?B?OVdOVGJ4VUU2d1NvLzdzR0RLMzEzU3orVzE4SlFHQjlvWkU5OEZHNUdIanRy?=
 =?utf-8?B?T0FBSWg5cVRYa3lUbG9YSDduSmpwb0xDZ0pzbUl2cHZCcFFqeTBjK2xEWG01?=
 =?utf-8?B?cklBaUpJcXlyWTNPN3hDMlZ6N0E0ZHQ4Z09WeE5MYWhjT1dycmh0TmQ3cU9v?=
 =?utf-8?B?WjkwcnVUMEpaMVFQN1dVTTVYSFhYTVUzTlNiR2thdEo5ZWdYU1dlODZ2V3hh?=
 =?utf-8?B?YWNZdUZnWHUxUDFTR1piRkxLWDZHWEVnb1ZCaGVRL0dSVGxGTVh4NVNwK1RM?=
 =?utf-8?B?cXVST3NsaWFJdVlodXZrb00rQTQ2UDNnWFVkd1g3VUNEOGdWMU1NcEVUZE15?=
 =?utf-8?B?anQ4VEU2VVl3QThXOEl5dzFYWk9lZmZHNVRHcFBtZzVOMmNvN0dNSDRwekZK?=
 =?utf-8?B?N3VETkwrK2hoeG5rTVJmMFl2K2hlT1oxN3ZLaHBWbEtnU3lFQStWTmE0cGZY?=
 =?utf-8?B?U3NhY2QvdS9id0R2VC8vTityTWtnYkdRWUFuYkd3SENNRHFzOXl4a1NaNWo4?=
 =?utf-8?B?ZUVReTZteXZPajZ2Ym12b3hEeFZ0Y1VxTkw3WW5pdDhORlZiMVljNk5kQUpM?=
 =?utf-8?B?VWFDb0NraEVJZG5kM2NFLzZSYS91Nld4YjI0TGpVN3B3cTZvRkdyMnJPTmtE?=
 =?utf-8?B?aXpmNk5qMk9zZ05zTE5TMFN0NDI4cDlvN3Bwdm0rL2xYeFdvaWhVblB1bUM1?=
 =?utf-8?B?dm1vUHVpQzR4ODJzem82ckpJalJlaGE4ZDNFazVDUC9NbVpuMU5NQ3NwdlBN?=
 =?utf-8?B?M09sb296WnR6YjFPNnExVkhSbUxhUFFMMlBFTllzUkFsNEtCOVUwekQ1T1J4?=
 =?utf-8?B?SDhBRmRpSGRYVGtKbWEvWEsvWk9XM3Q0YlpIRkVsYTVoZUw2V1ROV0tRU0Nv?=
 =?utf-8?B?UktFMXBHaTdNZHM3b1dwV0VWamhjTXlxMjZUYW5GT2RRN0o1THZobExPZS8w?=
 =?utf-8?B?em1WMDhUTytDdmpPSlhSZmlSQm5iNUxSclJzYzMreXRCaDBoUEdUQjVuMVh6?=
 =?utf-8?B?eDBBcVYwZlNKU1ZqL0pSQzZ3T2RTeVYwa0xsa2FUZXhxZEpucW84RHIrUy9i?=
 =?utf-8?B?d2RPMER1SS85RFY1bjl3WTVCTGRwM1RYeDRLS1JZVDFYOTd3WStKc1BiaEZ0?=
 =?utf-8?B?bVRhOCtBcnMrT3VYZEdyTUZxVk9RQlQxSGl1bHczZGNKa2Y4SVA1WEs3WWhE?=
 =?utf-8?B?S0pKS1VIMzNETGNtSnNtekdLMm0vZVNHbzk2NXJnRFlVdFQ2eE5LRlA5TlJ5?=
 =?utf-8?Q?NTgoAZAUhvtOfm/5++6KOqcE39p02I7JYF5IMcPkJc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a304a710-bff3-4099-f2c0-08d9f6724d40
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 02:15:03.3692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +fz5fvgN7XY11gnKPa/m9g3OWKynlgHb38ZJSTP3Nztoz3I+jMTAHs6nPhyWGSJtkyv0q0xOPUazCUvsq+fLBdey9kVdygaf67drbTYJqwc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB2043
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

On 2/22/2022 16:52, Ceraolo Spurio, Daniele wrote:
> On 2/18/2022 1:33 PM, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> GuC converts the pre-emption timeout and timeslice quantum values into
>> clock ticks internally. That significantly reduces the point of 32bit
>> overflow. On current platforms, worst case scenario is approximately
>> 110 seconds. Rather than allowing the user to set higher values and
>> then get confused by early timeouts, add limits when setting these
>> values.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_engine_cs.c   | 15 +++++++++++++++
>>   drivers/gpu/drm/i915/gt/sysfs_engines.c     | 14 ++++++++++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h |  9 +++++++++
>>   3 files changed, 38 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c 
>> b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> index e53008b4dd05..2a1e9f36e6f5 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> @@ -389,6 +389,21 @@ static int intel_engine_setup(struct intel_gt 
>> *gt, enum intel_engine_id id,
>>       if (GRAPHICS_VER(i915) == 12 && engine->class == RENDER_CLASS)
>>           engine->props.preempt_timeout_ms = 0;
>>   +    /* Cap timeouts to prevent overflow inside GuC */
>> +    if (intel_guc_submission_is_wanted(&gt->uc.guc)) {
>> +        if (engine->props.timeslice_duration_ms > 
>> GUC_POLICY_MAX_EXEC_QUANTUM_MS) {
>> +            drm_info(&engine->i915->drm, "Warning, clamping 
>> timeslice duration to %d to prevent possibly overflow\n",
>
> I'd drop the word "possibly"
>
>> + GUC_POLICY_MAX_EXEC_QUANTUM_MS);
>> +            engine->props.timeslice_duration_ms = 
>> GUC_POLICY_MAX_EXEC_QUANTUM_MS;
>> +        }
>> +
>> +        if (engine->props.preempt_timeout_ms > 
>> GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS) {
>> +            drm_info(&engine->i915->drm, "Warning, clamping 
>> pre-emption timeout to %d to prevent possibly overflow\n",
>> +                 GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS);
>> +            engine->props.preempt_timeout_ms = 
>> GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS;
>> +        }
>> +    }
>> +
>>       engine->defaults = engine->props; /* never to change again */
>>         engine->context_size = intel_engine_context_size(gt, 
>> engine->class);
>> diff --git a/drivers/gpu/drm/i915/gt/sysfs_engines.c 
>> b/drivers/gpu/drm/i915/gt/sysfs_engines.c
>> index 967031056202..f57efe026474 100644
>> --- a/drivers/gpu/drm/i915/gt/sysfs_engines.c
>> +++ b/drivers/gpu/drm/i915/gt/sysfs_engines.c
>> @@ -221,6 +221,13 @@ timeslice_store(struct kobject *kobj, struct 
>> kobj_attribute *attr,
>>       if (duration > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
>>           return -EINVAL;
>>   +    if (intel_uc_uses_guc_submission(&engine->gt->uc) &&
>> +        duration > GUC_POLICY_MAX_EXEC_QUANTUM_MS) {
>> +        duration = GUC_POLICY_MAX_EXEC_QUANTUM_MS;
>> +        drm_info(&engine->i915->drm, "Warning, clamping timeslice 
>> duration to %lld to prevent possibly overflow\n",
>> +             duration);
>> +    }
>> +
>>       WRITE_ONCE(engine->props.timeslice_duration_ms, duration);
>>         if (execlists_active(&engine->execlists))
>> @@ -325,6 +332,13 @@ preempt_timeout_store(struct kobject *kobj, 
>> struct kobj_attribute *attr,
>>       if (timeout > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
>>           return -EINVAL;
>>   +    if (intel_uc_uses_guc_submission(&engine->gt->uc) &&
>> +        timeout > GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS) {
>> +        timeout = GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS;
>> +        drm_info(&engine->i915->drm, "Warning, clamping pre-emption 
>> timeout to %lld to prevent possibly overflow\n",
>> +             timeout);
>> +    }
>> +
>>       WRITE_ONCE(engine->props.preempt_timeout_ms, timeout);
>>         if (READ_ONCE(engine->execlists.pending[0]))
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>> index 6a4612a852e2..ad131092f8df 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>> @@ -248,6 +248,15 @@ struct guc_lrc_desc {
>>     #define GLOBAL_POLICY_DEFAULT_DPC_PROMOTE_TIME_US 500000
>>   +/*
>> + * GuC converts the timeout to clock ticks internally. Different 
>> platforms have
>> + * different GuC clocks. Thus, the maximum value before overflow is 
>> platform
>> + * dependent. Current worst case scenario is about 110s. So, limit 
>> to 100s to be
>> + * safe.
>> + */
>> +#define GUC_POLICY_MAX_EXEC_QUANTUM_MS        (100 * 1000)
>> +#define GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS    (100 * 1000)
>
> Those values don't seem to be defined in the GuC interface. If I'm 
> correct, IMO we need to ask the GuC team to add them in, because it 
> shouldn't be our responsibility to convert from ms to GuC clocks, 
> considering that the interface is in ms. Not a blocker for this patch.
>
As per other reply, no. GuC doesn't give us any hints or clues on any 
limits of these values. But yes, we can push them to at least document 
the limits.

John.


> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>
> Daniele
>
>> +
>>   struct guc_policies {
>>       u32 submission_queue_depth[GUC_MAX_ENGINE_CLASSES];
>>       /* In micro seconds. How much time to allow before DPC 
>> processing is
>

