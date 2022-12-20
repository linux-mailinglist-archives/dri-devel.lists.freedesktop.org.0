Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34585651F87
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 12:16:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2FA310E3A9;
	Tue, 20 Dec 2022 11:16:13 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B2410E3A9;
 Tue, 20 Dec 2022 11:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671534968; x=1703070968;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tj7xxgrZIgZfETltJVvF2gxASi/LN7yI/v4VqSnioYI=;
 b=OMuP8vJFSr64DswLWfAYdd0LVFw8GSuD8kSETpA0avFQ5s7FICpElS2r
 QpAObz2HdT+pwgczGn4WGkba+mtL0qoFwyON68pQRX6jictqpX2n/Dv6V
 IjTG3kXHlQpSlpDk23VeYyyGVaZNxm/hWcyBRmHghWHKrfo7nsPvSiJaU
 ta60/x01guJbppCwdV6NVkzx+sgY+2ZUaiFQEoRkHQhhMGbqLm7JJ44vB
 IDQ9qFQin67ZKR2WK0mhgBbBw7+rT0NfGUp2Bfc6Yr16aguSbDrKL/Y8N
 6RmAlV8Ftm/9A6wVxDsqN5GBYQFL5SvGET350LSaLn6LL+dK2IkSbvkip A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="318283229"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; d="scan'208";a="318283229"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2022 03:16:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="775257822"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; d="scan'208";a="775257822"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 20 Dec 2022 03:16:07 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 20 Dec 2022 03:16:07 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 20 Dec 2022 03:16:07 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 20 Dec 2022 03:16:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PzXVzmaU0gH2qYGK+JHCDoLGrb9KAwjyg/mfLoEjvwHtDhHncSNovT3Pg05i1klFYCf9/cO3Fi+f8Vt6GQsRfpikNXxMTlppfrfgyXKaGsVass6+0kHsFWSU13u9crdjXoy1s5uTd08+u1/9ezTROLc6ONzZFptHn0XuK1UXJPSkdzN27EfVE/tKxRPv6JHLuaTLmKb68CWjoMZ+PBQ6IlTb9VU4RdCCBr5NTLgQYUqQzkKjS0I4g550CwQVgvJ/u8hS24HRRcYD3CChUdF/jMieZTHRIoxSawDEOvWeqrsL2j9OsHJPKOWevCYEuagHPkNqmrxNJkJ8pM4UogZY/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q9GZZp/f/RbtYVlIGHTogNEwXi8LqAAZgbuG7rA7tQ4=;
 b=JLui4GqDeuXbZy7yhDCUZ1/7AOvm7z/j6U6vFHif+Bseia59RE8JIYs3TVbyB4FwiDwVK46e2emNETA7YCyzwGeC2C9g5sm6NMCXnYns3C4GRhafFXanGwn06pPfNR1V/qJ5QDZhNncAa2sXbawyUmuibtf3SOvIrIUqD80mffnUHRTv/bo4d83AXCGBcLTMXhz509hzq1b12W1kzRwFv9v+PmiL5Oi3lj/DaFMZJY+ZvjD+HZkj+4MynMn7dy/gaVula74FkkfQko15w5oR/WsCZRf3s95T+LcXkurCVALwEG7skvlsYHmrGKeHPRpEGgqtzcZ8VCfFrXFxTfDTxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 IA0PR11MB7790.namprd11.prod.outlook.com (2603:10b6:208:403::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 11:16:04 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::1209:b438:8e6b:509]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::1209:b438:8e6b:509%8]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 11:16:03 +0000
Message-ID: <6cf54357-ef07-fafc-c5e8-3b80ef519d2b@intel.com>
Date: Tue, 20 Dec 2022 12:15:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 3/3] drm/i915/uc: Fix two issues with over-size firmware
 files
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20221220024147.4118685-1-John.C.Harrison@Intel.com>
 <20221220024147.4118685-4-John.C.Harrison@Intel.com>
Content-Language: en-US
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20221220024147.4118685-4-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::20) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|IA0PR11MB7790:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b10e114-5739-47dc-92fe-08dae27b94f4
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sOVS5Aj5kd+hrxou8PzcGUNtOLnnddb42OvN5ElS7eDbuTpfdkIJat6sarLcD4lDlgJOMOtQO9j4YAgexXbrT/j187aXmPhSWZ923FnShAK4xA9cmvy7K6vCSoJwWkKjxEPq2a8CaVDj43UF8Ntzasb1dtp0HIMVl6ItauQl6HPiRdTpUi8KPfw2dlqYYbMXnt/5jMSEqM1lcVziz/pOvoQnQb6RHQlAydZZ9pBuvMxOTe66hRa7k0A2GfwHL8TCcY6zZKlRdjKRJXoo2peVvAW3ILtzz22n3KBGnOBJvTk29ubkNxBzignnPBC1DhZRGEre8kfflU/yLczyN4kjFgwBy45TAVB1qKXlV9LhViOqMQ06s0JWPE3PK5v/I77ch2Qc4ARto3T+95s9r6HsOZ2Yo7jSoqFdwz4RZa1Bwv7EKXte0/IxXHScFFQuGAVnXk01xBj3K8RyNseTgdlO3UMNIBCeh1sPMq0/d+C+/B7IhY8P9eosMUJirnQTGedkInCOzY6J4ERBCr61EV4EO1gpv6dbSDUH7h1OGZsdpOyFehYYDjMs0fEfv5rmy+V2vkM1DPanCflrxN+H0ahaRDqdBUUG97gLwtwWARE57t3otKEJOlo9brtdjRfUTfybmQzuivpK9kzhKSqXCllm+zv+VXqr/BnwZXJ2yuqcEsQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(136003)(376002)(366004)(396003)(346002)(451199015)(8936002)(31686004)(5660300002)(41300700001)(66556008)(8676002)(66476007)(66946007)(4326008)(36756003)(26005)(6666004)(53546011)(83380400001)(82960400001)(2906002)(38100700002)(478600001)(6512007)(186003)(6506007)(316002)(6486002)(66899015)(54906003)(66574015)(31696002)(86362001)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnRBSC9jRXJRNU9EeDhWVXZqdWJtSGg4NVlqSmxiWkJHVzlMOEFHOVJLZk9L?=
 =?utf-8?B?TjRTeTdMTkRUaVJKLytMN0R0aWYyMWt4L2xuQWFSRXVub0dSWXhiakZmUElq?=
 =?utf-8?B?RW1RQUYzUlUxQm4zQXFCcXpBQ0hsaExtclRxY1c1OVlFb3BTL2NRcytXM1N2?=
 =?utf-8?B?SjZTQXF3OEpjQldBbElURGxVdEE4Q3FESjhHcHJMNkwvRjNXYU5xdTJJRnox?=
 =?utf-8?B?aytkdVNMWkl0QTdQc2NuZG5CcFBBWC9randhdUdDQThBTHo5MHlnRDllaFRI?=
 =?utf-8?B?SVhLNng3dWdZYlVPMDQ2OWVTT1ZvTlRRQjhXc0lyaUs0RGpyejV6SnRwS0hz?=
 =?utf-8?B?VTJFUjhKTEpCZThVY2s1NE9sTUpqMGoxZjRKQXVHcmsvRSt0UHZPcFdsMUlH?=
 =?utf-8?B?MkpFSUo2MFA5K0pRdnhiOHNxM2h2eWY2cmxPN0tDdlJ0RktjblJUSWdIY2oz?=
 =?utf-8?B?cW8rSjNwREIvalVKZjBkeDN1cVF6dXJTeGd6OFRXZEcvYWswRWw4bkl6TDl4?=
 =?utf-8?B?VkxkRVFkWkszcUdDUWNWdk5EV0huN3R0TFBlaHljWHMrdEFzdWQ1VkMwOEFv?=
 =?utf-8?B?OExJRXBUaGlUUnFUbGpFUDFpOEJhbUFJczFONWRQNXFrRnZ3RU4zbEJscHA5?=
 =?utf-8?B?azhUd3pJMUlkUUQ0Ukg4WHpGRm82bFUxZW1CeE5VMWY1YkNIUmxQYkFyamZW?=
 =?utf-8?B?a3I3SmxQVGI5cENqWjIreXZUWmhOem1DR0dGTERQK3p4Q2NyTWpNZnl0dGZa?=
 =?utf-8?B?Q2t6c3grUVBhd0R6WVVDVk04Nm5ydEZyVFRHUW5CbFhLdW9BT2tNbTdpNzd1?=
 =?utf-8?B?ODlERGYrQUtKbkV5TEIrTHZMM2M1ZGhaaldFQkJPOWM0WDhVM2pvTVFSREZO?=
 =?utf-8?B?eWVZTEwyY3daOE4rUjlKekF5K2tHa2hGdUFoZFkyN3k5OWhZelp1cjRHajds?=
 =?utf-8?B?QThvUXphbmluaUtYUXc0UXFQZWVDL2ExTHVyRXJyNkdKblFOeDNuY2J4RTJh?=
 =?utf-8?B?OTNiK0ZnS0dtZGZ4OVVwZmxqdmhMUkl1c09hVDdORjNjVkMxTGllVVdSbXNv?=
 =?utf-8?B?NVFibE5GT3hWSk4rSkhWN1hDT0hUcVFkK3RkUjFOaG1LU0x1b3E4UHZMREhT?=
 =?utf-8?B?dFNEV255S05iOEFEbmxTeUx1ajF6VXE5QkpWVmM2bjA1YUJZOGc2RlpJdDRt?=
 =?utf-8?B?VkJSTkt6YjlVeno0eWVrTnpQbHlOOXR3VGd2V0U0R0xvdlFUbllMblcvSWtV?=
 =?utf-8?B?VWJnNWxZTTEyTXJ4QldxWVIzWmExb2dTTXRwQk1oZEsxVm51Y3djdDdkaG5S?=
 =?utf-8?B?eTJlWGZsQUNGOEdwL2Y5dFhUUFVjOWJlR2x0bkkwYmxZUkFWaHNtd1lLN0F3?=
 =?utf-8?B?SHRWaWRMbjkrL0ZFbmhiY3hmVEdjM3hWUGRBZ1V2ZmR1WUJ2T0k4UUtiT0RL?=
 =?utf-8?B?WWxSL0QxNk5Pc3dDc2xlblRYN01ScDB0Qmhyc09iYjVocFVXK2U3MFh1ZFNK?=
 =?utf-8?B?Wm54OUJuZDFJZWtkV0VReExvTkIxcG9IazR2Qk1mcmRTakNjN244UzJid3JB?=
 =?utf-8?B?NE1VUUFXR1B2OGJlWGtIL1FBOGQyWGt3cVN6SHdzeHJJb1ZJZWVrMnpScDNz?=
 =?utf-8?B?ZkN3ckRxTG90YktxRWxpbGJkQ1N0QStNL1BQL0duVHVDN1VUVTJjaDhsN1Ba?=
 =?utf-8?B?bzk4Q1hPOHltOVdpUEE1VkUrMFo3bit1dHdub3NpeW8vOXl1QkI2K2R0OTg3?=
 =?utf-8?B?NDRMNUhFYUxiNDlvUEFyZDJXU0NCVU5KT0xMRFRETVNZWmlUcGIvZXhCWXll?=
 =?utf-8?B?Q1V6RjZoRGFCRmxJekNxQ2tXbnRIeUhXNlcyY0IrSDJ0L216bEhsVUVTSWlz?=
 =?utf-8?B?Q21uYVJOTTI3Q2ZlS2E5UG0xUkJWbkNsa2tRT0F3OWFrUm41bjd5SGhsaTR5?=
 =?utf-8?B?R3dSTVRaUVpZaittM2xCY3RBcnUrZXNibUZ4eXpGUTVmdnVkVHc5U3QyQVph?=
 =?utf-8?B?QjBpRnhWeVNVRmtYWCtmT0RTejd4VmgxTzVTMGJzL01KVk9aOWN0Y2QwM0Zy?=
 =?utf-8?B?bkF4czVuUDBMaHp6UlBpb24xV0dLbmp0MEZ3eGhhcmxoNWRPb1N5eVlMTjZQ?=
 =?utf-8?B?TnZFVENuTUo3L1h5Qi96Tjc5c1lSSFlsRVV2b0FNbnhFT2lBd0M4UVRQUVBp?=
 =?utf-8?B?NWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b10e114-5739-47dc-92fe-08dae27b94f4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 11:16:03.7070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rg5MlVx95Xj/mA76ljqVu+pheFB6wS8oQbGmXX298cj4gdgfyqfOVI9OJaPydPttfBcFyUKBor/9xu2Aq7oi2RZYkGp+9USLmrR29Onwu+U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7790
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, DRI-Devel@Lists.FreeDesktop.Org,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/20/2022 3:41 AM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> In the case where a firmware file is too large (e.g. someone
> downloaded a web page ASCII dump from github...), the firmware object
> is released but the pointer is not zerod. If no other firmware file
> was found then release would be called again leading to a double kfree.
>
> Also, the size check was only being applied to the initial firmware
> load not any of the subsequent attempts. So move the check into a
> wrapper that is used for all loads.
>
> Fixes: 016241168dc5 ("drm/i915/uc: use different ggtt pin offsets for uc loads")
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>

There was another patch that was sent to fix the double free 
(https://patchwork.freedesktop.org/series/111545/), but this one is 
better because it also fixes the size check.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 42 ++++++++++++++++--------
>   1 file changed, 28 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index d6ff6c584c1e1..06b5f92ba3a55 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -675,6 +675,32 @@ static int check_fw_header(struct intel_gt *gt,
>   	return 0;
>   }
>   
> +int try_firmware_load(struct intel_uc_fw *uc_fw, const struct firmware **fw)
> +{
> +	struct intel_gt *gt = __uc_fw_to_gt(uc_fw);
> +	struct device *dev = gt->i915->drm.dev;
> +	int err;
> +
> +	err = firmware_request_nowarn(fw, uc_fw->file_selected.path, dev);
> +
> +	if (err)
> +		return err;
> +
> +	if ((*fw)->size > INTEL_UC_RSVD_GGTT_PER_FW) {
> +		drm_err(&gt->i915->drm,
> +			"%s firmware %s: size (%zuKB) exceeds max supported size (%uKB)\n",
> +			intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
> +			(*fw)->size / SZ_1K, INTEL_UC_RSVD_GGTT_PER_FW / SZ_1K);
> +
> +		/* try to find another blob to load */
> +		release_firmware(*fw);
> +		*fw = NULL;
> +		return -ENOENT;
> +	}
> +
> +	return 0;
> +}
> +
>   /**
>    * intel_uc_fw_fetch - fetch uC firmware
>    * @uc_fw: uC firmware
> @@ -688,7 +714,6 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>   	struct intel_gt *gt = __uc_fw_to_gt(uc_fw);
>   	struct drm_i915_private *i915 = gt->i915;
>   	struct intel_uc_fw_file file_ideal;
> -	struct device *dev = i915->drm.dev;
>   	struct drm_i915_gem_object *obj;
>   	const struct firmware *fw = NULL;
>   	bool old_ver = false;
> @@ -704,20 +729,9 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>   	__force_fw_fetch_failures(uc_fw, -EINVAL);
>   	__force_fw_fetch_failures(uc_fw, -ESTALE);
>   
> -	err = firmware_request_nowarn(&fw, uc_fw->file_selected.path, dev);
> +	err = try_firmware_load(uc_fw, &fw);
>   	memcpy(&file_ideal, &uc_fw->file_wanted, sizeof(file_ideal));
>   
> -	if (!err && fw->size > INTEL_UC_RSVD_GGTT_PER_FW) {
> -		drm_err(&i915->drm,
> -			"%s firmware %s: size (%zuKB) exceeds max supported size (%uKB)\n",
> -			intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
> -			fw->size / SZ_1K, INTEL_UC_RSVD_GGTT_PER_FW / SZ_1K);
> -
> -		/* try to find another blob to load */
> -		release_firmware(fw);
> -		err = -ENOENT;
> -	}
> -
>   	/* Any error is terminal if overriding. Don't bother searching for older versions */
>   	if (err && intel_uc_fw_is_overridden(uc_fw))
>   		goto fail;
> @@ -738,7 +752,7 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>   			break;
>   		}
>   
> -		err = firmware_request_nowarn(&fw, uc_fw->file_selected.path, dev);
> +		err = try_firmware_load(uc_fw, &fw);
>   	}
>   
>   	if (err)

