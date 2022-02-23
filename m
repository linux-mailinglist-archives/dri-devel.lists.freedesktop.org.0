Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CA34C1D14
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 21:23:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E63B010EC0E;
	Wed, 23 Feb 2022 20:23:08 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C04AA10EC0C;
 Wed, 23 Feb 2022 20:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645647787; x=1677183787;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lQPF8zxou8fZ0n43U9k0airhQ9EWbsOx30uo5oIYfdw=;
 b=KBjJq+eNWi+gURZyXz5UN9mnHgkEUkrZjYHnSvRhUFXpCOfa0YO0wP3C
 qRQUurQfjKbnwG9fayx8Nut6qH5SWaPZhIqnl++P/a2Cyg99estRoTMEM
 0J5yA00XYENiXw5x9xezT/naddk8eQ1LMe96RQShJIRomWqxmKJSL0J9R
 9XhZl4ZlKvjkIErhDDCqCZ9ZqdBXldg0F8dOrzRRIVQSwMD9j0YV7nPb/
 SD0GRCnMs3UQPng4MceCKqjPLidoBoWlVgq/nVxX8o1YqDnKAmCohNJgO
 prUimgEi8eStVzcxwFLJQXCBmvw/0BQ1PqJuZSdlXM2IWtdNoitanoC7j w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="232047565"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; d="scan'208";a="232047565"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 12:23:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; d="scan'208";a="628218611"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 23 Feb 2022 12:23:07 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 23 Feb 2022 12:23:06 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 23 Feb 2022 12:23:06 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 23 Feb 2022 12:23:06 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 23 Feb 2022 12:23:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BQyly7CLPKtBnp/igmSapdfsnHq4GPv42txYoAr8XPie7SiY2oJFXNmE0RnM0OAyYgyJmFLvW0vzdecHebehCc6rPszdctO/e04ovBH7TEx0iAP/c0gkzHJJHrQujga/YAcxtKbHYkJrQprclP9gKUmk/JQ5WOuHt9tHTnm/bmjuUviyXi6OA0wNfsLDAL30r7mBy6ErTlbuQTao31JgWZaRDxwTPvncrX1x5TQ7nKrtwtqbgEEISC2N9QmExPvng5bQ59y3VLZNcrlasSfE/Ku1vR+2iy7NVNqrD9ewZSXpHNpDTEFZjB7s5H3YqqBvBvd8RSUEEnOiwMJoRx6nyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X13jJeyBd7i2le3amyepX57590gtMVxCCOsmBPSNyJw=;
 b=VdqWwSjPK/NJ/UEQwbooJ1ZL6Qza6tAbJllSs2+z4jC03c5uMSnSs0EyoixwG28gRW3nW77qHZFLmJtJguEesJ6qR0n2AGBEB6orfKSoZnB9ARKf1N6QlgnhgWASu/hTROWoBPZ4j8ah0nXCqSMfdjwEM5GzZJPDPMviJDv4E0RCYrEmW+bLTi3pls4HGHgoypM/z1yWhkELudJRbbG8cA/AAnYwxhzmPSUlVW1TtS1FPNFi3uT23bVGU2nP0nNdz3zKILqZBZup4sz67lAavlfq1OfZOCicSO13vhFsseFhJx4zgWGWgRhxTzbUEeKimPZI3pb2gr29edW+pA7+pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by PH7PR11MB5981.namprd11.prod.outlook.com (2603:10b6:510:1e0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Wed, 23 Feb
 2022 20:23:04 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7%4]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 20:23:04 +0000
Message-ID: <0b971744-b456-9a92-818f-1f038669da7f@intel.com>
Date: Wed, 23 Feb 2022 12:23:01 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [Intel-gfx] [PATCH 5/8] drm/i915/guc: Move lrc desc setup to
 where it is needed
Content-Language: en-GB
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220217235207.930153-1-John.C.Harrison@Intel.com>
 <20220217235207.930153-6-John.C.Harrison@Intel.com>
 <cc5b20ac-86b4-2d8a-8d53-c4b870213b10@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <cc5b20ac-86b4-2d8a-8d53-c4b870213b10@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW3PR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:303:2b::26) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c17c4d9-f65f-48b7-a96b-08d9f70a4bb0
X-MS-TrafficTypeDiagnostic: PH7PR11MB5981:EE_
X-Microsoft-Antispam-PRVS: <PH7PR11MB598128C06D059BFD6CFD234CBD3C9@PH7PR11MB5981.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pGnQdcwJSij5FYO6Npw9FqvpACZbqOPIC8HKNmUXmn13LUdGUVVG6Q2HUrKAmC9MmRMTW0ijbTNXoY7MPJRVMGRLOnqDmnqXqMhTqvygqzYmSWUtL0idhadesACIbqX1IYHA+FM8Q5YBrikLb0AWvXWblHTx4/cH3x+WP3DDxE0uZRqXR5fHYEckJoOD4uQPzyDPZWW8zlaDl9duTvSLjYEB67VEfDdWI0FnhQy4Yhh5PfpvPXTRorwRazD3Siw1Yim0zDly8N2Vckua8VC/sFRmOVCWHZonC/haSS7qkb5V6C2Wi3tq+a6eSEoH1tIrF1BdCFRawXjVdzzo6ghZXq+wio/MPZBUsWicPpvNQ3qomiON171nS5uatU2/ul+5Jun4DBogAqmXB4WcRSuPqdHa9/+a/5EP3vPMk6psI0BrXx286u9vnFby3JLk8aS467H+8tEDISetXYN0BUyhXHYzuP9wRPMCfiWejJc0po/7yvxieMalx5LniRbp+q8A/JhKuVJO8lZcgklimAx0/ijJ/OsHq+aexOvI5qYXlei7t2pcJQYWE06X5kFOy2uN+p3uT2+uXdRg6kRHWblJ+gM2jDW+IKeUSFnWegcAAD38cWHycM307XzrhDjO/50kR95NUEkXLUGq2tVTNa/hFfGA7wJag5BsU3+ZkbOgAYduqdeXrGe3JYiM9LcQy7EPCDe3FSfUsHAs6BklRgCLNT2pyaQNpCnh1G4Kol1K64C2KRACPpdpR+bUqy2Og0/D
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66476007)(66556008)(5660300002)(316002)(450100002)(2906002)(6486002)(8676002)(4326008)(38100700002)(66946007)(8936002)(82960400001)(2616005)(508600001)(31696002)(83380400001)(36756003)(31686004)(53546011)(6506007)(186003)(6666004)(6512007)(26005)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXN5d2dZNnF1dVlsc1Z3NFMyQS9LSUN1aUhNbFVjYXFmNVhDZ3cvSlNtZjZY?=
 =?utf-8?B?WUhkTWxncXN1K2dDbFBpd3VhNFMxSVB3VU90cVpYTVBVcy9QalNtN3VwaFgy?=
 =?utf-8?B?em5rSzUvTUxMU1VvdWdjalhEcW40SW5EUXpJdjE5M1c3MzAzcE00OEhxOEd6?=
 =?utf-8?B?anRkQU56TzdHazNGdlhRS0t1SVVCamxtcVlYcnpwUUJGOEZUaDVCRGtiRnVx?=
 =?utf-8?B?a1QwY20xamJROUhqSmRWTjFqcnZKTzhDZlhjbnVKVEYyVUYvUkJ3ajNEbVJw?=
 =?utf-8?B?TDN6NTZSUVFhc1RUVlVrSmdyU3RpWjNuNGZXWG9LMHBSVFNDUnIwanp5blBt?=
 =?utf-8?B?cTJMWmxjM0xIMm4ydHdpbjhndUJ4V0M0VnlsT1NvYnRvd1hKTVhKYXpVaDlk?=
 =?utf-8?B?VVJVbEJ5Zy9iMWcwZFlhdTlTSm5uWHR2aDdoSk1lR2hacG0wR0pnWDE4VW05?=
 =?utf-8?B?UjlONVkxb2x0VmJsMVZBSUJHNGdka1pkMUJBVUs2czlOeUtKQWtmcWFaMU9D?=
 =?utf-8?B?RmZwNTFzcWxPQ0YrVUJFRHhXdjRPNGtWRFBSYWwrVkpRaWxnY0NYb1ZpMGVG?=
 =?utf-8?B?MXB5ZUhIVmtRTHg0dHljOERTSjBnRFB3L0dQTlBMV1k4aWN0RjlmaGZmSEpC?=
 =?utf-8?B?VHhsMHVjM2d2REVUaStHWXJyNVo0OUwrSnRFWm5RckMxQzdiSklrcTU2b0hL?=
 =?utf-8?B?dGdTUUdLMW5XZUd5NlAraU1ibHE3RzQ0VkJLbjBZS21xYlNrNHB4R3hybjcw?=
 =?utf-8?B?MGF2ajNTcHp4S2txQXJ3aEdDaHZwSk00N1l0YU55K29acm5tNTlKN0xiNlF5?=
 =?utf-8?B?c2UvNmoxWURBNDFlbi9DSW10ZytDc0hMd1ZaTmpkQ25IbklNcnkrc0xORzdn?=
 =?utf-8?B?REpOVUxveWdqb01Rall5VHdPV1ZkUzVtdFd3aHlkUmp4RmxzRkJRSGs2eC8x?=
 =?utf-8?B?SEpEc3pyL3hTNk9MaVlXWEpvcTlMNVdkQ21FaGZYbmZGTkk5Z05hTnJhN1N1?=
 =?utf-8?B?QjljUFFINnVXb1h0QSthbkI0eGV2K3NrQXZib2FTbmZkTzZaU1h0SGNjbUk2?=
 =?utf-8?B?NS95S1JVS01BK1M1aVRrMTdmcDcybjhDWXMxc3E4aVhmMTFxNVdONGhxUEtt?=
 =?utf-8?B?MVN6UXZlMGZKdlJNNTR5UXRWR3dxaXBGTjI1WmZNdTZWQ0ExYWdSbnlYODdY?=
 =?utf-8?B?MU5HcFRaSFRibmNRR0tVU2RaZGN6b3BNSHE5ZVVPdlk1aEVKeVlCWGFkM3Q2?=
 =?utf-8?B?UnlLdFBUSTlGZkVoOVMrZnFZL1pGYUIyeXZQWVBsZFJpRmxNYWVWWktKNnpY?=
 =?utf-8?B?SUtqcnVnT3IvckhHdGhnYTA5K1RlZGgzYWx3VFBYWGhmMi9WYVlpbTJRdkdP?=
 =?utf-8?B?UFlEeXJVR0c5L3lRUFJSSlVkMGt6d2FnZDFkNWpPWk1MN1d2K05IQ05uMHpv?=
 =?utf-8?B?S2JDMzJoTTU2eS9LdjFiTlZjdUxpMEgzWkhkUEZub0ljYUhaTTJtNW9OYng4?=
 =?utf-8?B?RTk5VXRVMWgxcDFlVHViTVpSMzNXL05qdStMdHNxdW5xYk5xN0ZwQ2dmUTAv?=
 =?utf-8?B?MHlLR2VMMnBWOHBKL0JpczQ5WXF0QjBGaExZVThPc1ZFWFdVSmdqT205NEVX?=
 =?utf-8?B?QUxabTllVHMwV2ZhTnVEeTcwTXd2VWt3YmxZMU5JYWRmRWxhNU1sN0FkQytI?=
 =?utf-8?B?L0tZbHFMb1Jyb3ZaeU4xejJjUGdpMEI1TDJob2lYVURhcVhkTEZjelF1dGcz?=
 =?utf-8?B?L1B3VHhUUS9WQjk4Z0VlSDh6LzNWTXVla3pFaEJETWRVbE4xaUpKWCtTNnJj?=
 =?utf-8?B?NmFLMmh4QS9TL01lK2l0dTdCWnhBTHZJZCtiWDdFcmNEM25HcThLWUpQZVhx?=
 =?utf-8?B?SWc2NHFEZXNpZGhmdUh1cHRTNGQ2UWs0VE9yaU9adG94eS9GQVBGSFVBalV5?=
 =?utf-8?B?bkxYK1FScHlja056di9sUUVrbHlsbTVIZjZGQytSOGtkTzRPdDdqZHVzRis0?=
 =?utf-8?B?dFNRL1BRV1RPd3BzRTF1UThYY1VXMXhOaUtEK01zaHlGSmxmZmhGVE9LQmNO?=
 =?utf-8?B?QW5yV0VjVHFQZmpMVlJDYytDelFwQlhxYkRMTnN6V0J4S3I3MUhnaHdxYXJO?=
 =?utf-8?B?dXh6d2ZCclptVld3cDNpMUswc25JcFI3L3BJR2tTbW5JbUpobEhoZlg1TnJm?=
 =?utf-8?B?dFd5bEFQWndMK21SdVN0VkZ1ZW1BK2RnU1NXbnhJVU52YW5OTTM0NEZYY0M0?=
 =?utf-8?Q?Y9iPjuZzgDXr/nFynjAswgg4FursVAmtkn/oeNVboc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c17c4d9-f65f-48b7-a96b-08d9f70a4bb0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 20:23:04.2800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YcrLnC0sQ0QReXu+4OBQny6Zmzj7of0pmmivtbDhr8J/UnNyhHDAuifAvYgJJvqcEYx3/jGt2AA/WHeLO8t4N9FLViqe0RTspKEZO6pVTJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5981
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

On 2/22/2022 17:12, Ceraolo Spurio, Daniele wrote:
> On 2/17/2022 3:52 PM, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> The LRC descriptor was being initialised early on in the context
>> registration sequence. It could then be determined that the actual
>> registration needs to be delayed and the descriptor would be wiped
>> out. This is inefficient, so move the setup to later in the process
>> after the point of no return.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 11 +++++++++--
>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index 0ab2d1a24bf6..aa74ec74194a 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -2153,6 +2153,8 @@ static int __guc_action_register_context(struct 
>> intel_guc *guc,
>>                            0, loop);
>>   }
>>   +static void prepare_context_registration_info(struct intel_context 
>> *ce);
>> +
>>   static int register_context(struct intel_context *ce, bool loop)
>>   {
>>       struct intel_guc *guc = ce_to_guc(ce);
>> @@ -2163,6 +2165,8 @@ static int register_context(struct 
>> intel_context *ce, bool loop)
>>       GEM_BUG_ON(intel_context_is_child(ce));
>>       trace_intel_context_register(ce);
>>   +    prepare_context_registration_info(ce);
>> +
>>       if (intel_context_is_parent(ce))
>>           ret = __guc_action_register_multi_lrc(guc, ce, ce->guc_id.id,
>>                                 offset, loop);
>> @@ -2246,7 +2250,6 @@ static void 
>> prepare_context_registration_info(struct intel_context *ce)
>>       struct intel_context *child;
>>         GEM_BUG_ON(!engine->mask);
>> -    GEM_BUG_ON(!sched_state_is_init(ce));
>>         /*
>>        * Ensure LRC + CT vmas are is same region as write barrier is 
>> done
>> @@ -2314,9 +2317,13 @@ static int try_context_registration(struct 
>> intel_context *ce, bool loop)
>>       bool context_registered;
>>       int ret = 0;
>>   +    GEM_BUG_ON(!sched_state_is_init(ce));
>> +
>>       context_registered = ctx_id_mapped(guc, desc_idx);
>>   -    prepare_context_registration_info(ce);
>> +    if (context_registered)
>> +        clr_ctx_id_mapping(guc, desc_idx);
>> +    set_ctx_id_mapping(guc, desc_idx, ce);
>
> I think we can do the clr unconditionally. Also, should we drop the 
> clr/set pair in prepare_context_registration_info? it shouldn't be 
> needed, unless I'm missing a path where we don;t pass through here.
>
> Daniele
I don't believe so.

The point is that the context id might have changed (it got stolen, 
re-used, etc. - all the state machine code below can cause aborts and 
retries and such like if something is pending and the register needs to 
be delayed). So we need to clear out the old mapping and add a new one 
to be safe. Also, I'm not sure if it is safe to do a xa_store to an 
already used entry as an update or if you are supposed to clear it 
first? But that's what the code did before and I'm trying to not change 
any actual behaviour here.

John.

>
>>         /*
>>        * The context_lookup xarray is used to determine if the hardware
>

