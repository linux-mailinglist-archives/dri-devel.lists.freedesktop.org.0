Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0659273737B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 20:05:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6893910E266;
	Tue, 20 Jun 2023 18:05:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B13B10E266;
 Tue, 20 Jun 2023 18:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687284341; x=1718820341;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=m+xazlxRlELtEuCC4OF/oaktXXJ/1EIY9BChlMfMhfc=;
 b=IdlNzAN2M/k0CBvtwBvkjlxR/niIY537rqN3XBtgn2IQPcZAHXXYnm9C
 iWo/Mi0bV0AdPH/aeopa9LsQgXshj9t3y2QI1ku967byo2+umd84YuI2W
 i3cS9wxcUbUTilIubwZrM17TUy/3u/a7ynBq9kRvFe2SW6Xpy7EMiAp1O
 keHFdkN/wFROPPKrTGWAY43njxi+h3Q2GGCpoFCqwHsVfrtMWWTOtWJcB
 agroLr2hRCw00KMhaRTQu0LPjfaSGC0EUIwMwfgE6PjpTFNAhqygEswwa
 agyz4aOvhTBV8yJNSKkE3M5FIukNMt3QqC1hW+8K5Eq4XcrMjKjd/4FkM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="425899372"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; d="scan'208";a="425899372"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2023 11:05:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="779539947"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; d="scan'208";a="779539947"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 20 Jun 2023 11:05:38 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 20 Jun 2023 11:05:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 20 Jun 2023 11:05:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 20 Jun 2023 11:05:37 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 20 Jun 2023 11:05:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oavRd7XXc8a8y/l7LJFtZr2v52MD+kaBteC6jJo0TtngEb0hrqRH4aZ5Tju7j87/dFe3+VAISI7G5PfbhXm4uNAnXd9iKCckYHwStADWjhq2bbA7OdsOrkk7RqfNHPuHcqQtmVrtG2HwkGiQeO6TSsalpOiANmFQq8yqREGYCh9TmpmmmHexq4s5rc37yDn3PQz9YWqXi4hddQ5C4obw82Xgc2SLYsCxQvYOR2f4u/sqjmKGIMLFbWGUtI5cM2glty/ZMOuB9rXrcBDGm1yPDM6AuB9oXFo6zBKcwekT/26M4nFYDcUnRV77SOKwXPE4OkUHat4sjhjurxAutrC3sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pbOPTdZSWQ1s0RXgyCzY0Qv3GjTpq9N1xoMtEVTnXP8=;
 b=WeZAzlWdACQ5T41tW7wmEWXEVzlS5rt0v8C6tAB8gHQr0zGT53h2l0VvkqzNr8eSK5DT1szTa+UfmDvTArbnAKrafMwsP/HwUUC2urMk4IPKIkTmS3+DJLszISQtU2yrum3mJdrd5Iz4XKdXAcRuxFgIohE9xxwB37FoqhWcIOFN0AjhpdLfVJ27WtYL0bAyWUTyHPH+wNv3B/R6SVaYUJzI7cEA+2SPgSF8X9n1XBTH/ASw50+WZcFLEZOItf84/1IHtZXSze66O7Z7wg9L0UNN5mDp7ezZl7A61gu8z2dxEo/Q5HbI5hMpHhNujwEa6gIfu25BfGoH6Xf7IBenFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH0PR11MB4981.namprd11.prod.outlook.com (2603:10b6:510:39::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Tue, 20 Jun
 2023 18:05:35 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d2fe:fc74:e24b:26da]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d2fe:fc74:e24b:26da%5]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 18:05:35 +0000
Message-ID: <8968d99e-b49e-d854-f15d-18925f83470a@intel.com>
Date: Tue, 20 Jun 2023 11:05:31 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1] drm/i915/gsc: Fix intel_gsc_uc_fw_proxy_init_done with
 directed wakerefs
Content-Language: en-US
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230615211940.4061378-1-alan.previn.teres.alexis@intel.com>
 <2e8ce4e7-9efa-3c47-d9b2-b16f4ba75dba@intel.com>
In-Reply-To: <2e8ce4e7-9efa-3c47-d9b2-b16f4ba75dba@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0253.namprd04.prod.outlook.com
 (2603:10b6:303:88::18) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH0PR11MB4981:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ed3509b-bc4b-4edd-ef67-08db71b8f1bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MqGlf1KTkHDnf1IFzihkSuNkmRWbjKgpqbQ4jbtSy2CdawwyLZywMdGiTEdTleJbNqDPTd5VAj2aLuyyagLUuubdNADGm9aXz6hHbx6tSEYND03XuUs3qb8eo1TS8Sx9QwL/Fjp1utQAshGmLX3WSZgAP2SYWskaJxZpfzSxRGF0pjhdTdXQzTn5ljJNFTVQIz7AufkL5rO+NsoXL5DUvempkCppCw8IcMWPFUeYHmijcPUHKhN9lMydmy9V9wpoVtJOIhZsRdGIcVErkWlgncpFFO5Ml3nRr3Tt5b42Aem80ewO4Bgw+j4bLVn6k6/JK2isifHof7dY8XiaTtDmR03o3mWHwA0+cnTkimL/vI7Y7oenf0wmtUEVL/iTwC8SPStj65qNz+MJfOO2bk1Up7KPDvN+jIyzKRsGZBK/KyIRAUbnYNEePlD4JyrGa7AErYa22lLmFsL1NVYHhQCl3DkQchhnina6/UEpIZH5lTITMJ6fMwVlVPQSnhozLJ2Q3csQeSD7GZUgdbSGInsvO77tXjBiiAb1QuaFZhuhVcZHaiPMcMB54C2dcLS+2x2gPLMYN4zxHhDUszgGPCkHqSRZLM6PM0HlGXYlhgB36clMjmPFYFdgUlnTsRfWu6Wq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(376002)(366004)(346002)(136003)(451199021)(450100002)(66556008)(66946007)(4326008)(66476007)(2616005)(38100700002)(31696002)(86362001)(53546011)(6512007)(6506007)(26005)(186003)(82960400001)(83380400001)(478600001)(36756003)(6486002)(6666004)(2906002)(41300700001)(31686004)(8936002)(8676002)(5660300002)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkkvTE1iM01JTU85WENqdVB4b1U1QnBYdlJ3OEpVRldpT2txRzBtNmFRUDRO?=
 =?utf-8?B?eTJjWWoxamdBM1JoZTVCTlJkU2ozTnI3U2hQWWJkY3NyVUdRWUV6Q04vQUxD?=
 =?utf-8?B?cDFYanZwb1BydmNjRll1VlUrZ2xBb3d4T2NVVVA1b1FNN0JVMW5LM09nNHY4?=
 =?utf-8?B?c3ZJbHB4MXBQTUZWdWRCNUlyZDN3Q3M1NjNvNitkOVVVV05lK0Z3WU5rbXJh?=
 =?utf-8?B?dEtuQXMwQ3BHVFFvalgzcFplU2ZNMkpDQUFnVHBtQkcvbllSUTdvT2xzUVoz?=
 =?utf-8?B?Q3M1SkhuODAxRUhRbmhJQ3hpZHVKSUMxS1ZlVGk3QUxuQVBicTRNSzdSOFVw?=
 =?utf-8?B?Z0p0VDRrWnJMZTIwbU5XOGxlOE8vYXRBU0puQXFCdkFqM3B4Tm5KSlhHSGRR?=
 =?utf-8?B?QTRhdWh6azFPNzNvNEUxajhaOGE0WGN1MllNS1MvWHZuUjgxem00b2dBdkZI?=
 =?utf-8?B?enpXaTE4RVFaZjZIaDVCY25HVFppQStnMDVCTytSTWdjYmJTK0wzZkpIYlVX?=
 =?utf-8?B?djcvT1dpRWtObDltTFU4S3JUOTAxSU5rdkhwc2FZTGlQLzhCaW40cWJBVElR?=
 =?utf-8?B?d2hObjkrb1FLdklXWWM1RHpOZXZNOFVidEhZdnFBVlVLWVZId0dmcTVrdnR4?=
 =?utf-8?B?RnJBdlI5YlFDbldzejVCbEVxNG11Q3Z0bEczK2dOSWVEc09MVmtnb2d1U1Z1?=
 =?utf-8?B?a29rRklQZzlPYXR0Ynd0cW9PaExsdWNpQ2d6VTBnL1ZPU2MwSENtMWxzZmpB?=
 =?utf-8?B?TEpyZFBkKzVZR3c0UWs4b21TNXoycnJ0L1ZmdDEvUG1UUkxidUhDSUI1MnQz?=
 =?utf-8?B?NWg1L3dsTys2YjFDVDNvVGhLZlZWS1lKSnAxS3BYUk9HaDloUWVTZFZrQ0hB?=
 =?utf-8?B?UXpvaUQ3MGY1ZzBsUkx3UWdabUsrOXRsek1BbHBhaUh1OUpPajRqMDhJdXB4?=
 =?utf-8?B?eml5MnVaMlRRY0ZKZXU0bXBnQ0MxeENHYWxMNE9OZmdpTytHL2RKUXU1QkFx?=
 =?utf-8?B?cmNVc1V5aDd5N0RHVHFNNDlIVHNxOFkrMzJZdEh4dnpXN1JVa1VhNGNHSlQ3?=
 =?utf-8?B?MDVKaHVlMC9WNlYxSXhxYU1NYTl6aHEzNnRCQVZHaFFhSW80LzlwMncyMWFP?=
 =?utf-8?B?V0szRENEOUs2RmhkSlE5bXE1SWN3ZWhGcVhTdi9Lb0E2VWY5VGV1TCtSZVFQ?=
 =?utf-8?B?RSt1UUR5U01uZDZPZXdLbFBURDRoTXVaeUxxYUZiOURqcU5IUkRRY3YvdmtY?=
 =?utf-8?B?L2NraGIvWGlwZ1BFWkx5LzNoVHkxaTlwMUNVR0VoYjJpakt1RzlEN0ZNaitu?=
 =?utf-8?B?TENJYitwZ3ZKQi9GVkJKRldVMnJyaWg1aEEwTWJPaFpEdlRxSUpFYUF2QWlU?=
 =?utf-8?B?UzRhbXRZZzFQV1lSc292Z3JMaUZ6Z0JYenZWOU1tNmIxZ1NmRXk0ODRyMEs2?=
 =?utf-8?B?NTIvTy9ZL2NILysydU5meGhYTHRkWGJZanM3aHJIM3VSbSs0OEVpRU40b291?=
 =?utf-8?B?c000MTJ3THUyNndKU05mb2s3VHl5WGJrc1c3OG9IcVFlbkc2enhZUXEyK3da?=
 =?utf-8?B?NFRCaTFrMDMrWk56VjNVdGRrWmJHSGp2TTlCeVF3cjJtV3BuVEt6WTNPSFdl?=
 =?utf-8?B?M1pVSE1KWm9Nc21LNCsyVU9lSldWcGJQOFY0QWR5RXVGS2RFa1duanFkbkZL?=
 =?utf-8?B?eXk4YU1FRWRmaStCTDQ5M0Q5L2xVYnRDSDl3SW5YbkhYWjVSUGVSR2JCSTM3?=
 =?utf-8?B?RXYxdys2dXQ2UU8xZVRHWUJaY2tYekZPSy82NURsN3pZYU9McFhyOWwwdlow?=
 =?utf-8?B?NjMrampkT1dkM21NNzgzeUpoSVZ4TkMwUDFnaHUrd1ZBS1NYMGRZWjdyV2pt?=
 =?utf-8?B?TlpSM3lmaExucEZkQnpsdzd5dStjOFhSZXJoU2thbnFRQThFQnY2c0FzL2FF?=
 =?utf-8?B?dVpSYVZ0d2NHWDJrT3BnVkhLL0xUOVpwTDB5S1lHVjJxYmNubStXZnMzT0h6?=
 =?utf-8?B?azBja2hRWHgzVml6Z0xxamhlYjZUckxNN2tIZmNxK3pWWXhlVVZmS1EwRGd4?=
 =?utf-8?B?UFFyekora1F0cEsvMEhVY1dkVUhRcXhqeG92M0NiYys4SmViRmFreHlwN04r?=
 =?utf-8?B?dFlzRkgwOHE5YTc1QlRqVFRPVEFOT0I2YW9lQWxFL0QwTlhoY3dmTURQcnJT?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ed3509b-bc4b-4edd-ef67-08db71b8f1bb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 18:05:34.8526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5C6VlFQbUt/GK+NI1cS6aMNXMnQxVHHbbdBf4jYlrSpZlG2dAH0BYrFSzgKwwfDZtFk2N0p2/StX0BdHOB6COda26qw+jBPdfi+aSj9eP+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4981
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/16/2023 8:54 AM, Ceraolo Spurio, Daniele wrote:
>
>
> On 6/15/2023 2:19 PM, Alan Previn wrote:
>> intel_gsc_uc_fw_proxy_init_done is used by a few code paths
>> and usages. However, certain paths need a wakeref while others
>> can't take a wakeref such as from the runtime_pm_resume callstack.
>>
>> Add a param into this helper to allow callers to direct whether
>> to take the wakeref or not. This resolves the following bug:
>>
>>     INFO: task sh:2607 blocked for more than 61 seconds.
>>     Not tainted 6.3.0-pxp-gsc-final-jun14+ #297
>>     "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this 
>> message.
>>     task:sh              state:D stack:13016 pid:2607 ppid:2602   
>> flags:0x00004000
>>     Call Trace:
>>        <TASK>
>>        __schedule+0x47b/0xe10
>>        schedule+0x58/0xd0
>>        rpm_resume+0x1cc/0x800
>>        ? __pfx_autoremove_wake_function+0x10/0x10
>>        __pm_runtime_resume+0x42/0x80
>>        __intel_runtime_pm_get+0x19/0x80 [i915]
>>        gsc_uc_get_fw_status+0x10/0x50 [i915]
>>        intel_gsc_uc_fw_init_done+0x9/0x20 [i915]
>>        intel_gsc_uc_load_start+0x5b/0x130 [i915]
>>        __uc_resume+0xa5/0x280 [i915]
>>        intel_runtime_resume+0xd4/0x250 [i915]
>>        ? __pfx_pci_pm_runtime_resume+0x10/0x10
>>     __rpm_callback+0x3c/0x160
>>
>> Fixes: 8c33c3755b75 ("drm/i915/gsc: take a wakeref for the 
>> proxy-init-completion check")
>> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
>
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>
> I'm going to send a trybot of this patch with the FW definition patch, 
> just to make sure there aren't any other issues that kick in once the 
> FW is defined and the code starts being executed, and merge if the 
> results are ok.

Trybot came back green 
(https://patchwork.freedesktop.org/series/119471/), so pushed.

Daniele

>
> Daniele
>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c  | 17 +++++++++++------
>>   drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h  |  2 +-
>>   drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c  |  2 +-
>>   drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c |  2 +-
>>   4 files changed, 14 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
>> index 856de9af1e3a..ab1a456f833d 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
>> @@ -22,27 +22,32 @@ static bool gsc_is_in_reset(struct intel_uncore 
>> *uncore)
>>               HECI1_FWSTS1_CURRENT_STATE_RESET;
>>   }
>>   -static u32 gsc_uc_get_fw_status(struct intel_uncore *uncore)
>> +static u32 gsc_uc_get_fw_status(struct intel_uncore *uncore, bool 
>> needs_wakeref)
>>   {
>>       intel_wakeref_t wakeref;
>>       u32 fw_status = 0;
>>   -    with_intel_runtime_pm(uncore->rpm, wakeref)
>> -        fw_status = intel_uncore_read(uncore, 
>> HECI_FWSTS(MTL_GSC_HECI1_BASE, 1));
>> +    if (needs_wakeref)
>> +        wakeref = intel_runtime_pm_get(uncore->rpm);
>>   +    fw_status = intel_uncore_read(uncore, 
>> HECI_FWSTS(MTL_GSC_HECI1_BASE, 1));
>> +
>> +    if (needs_wakeref)
>> +        intel_runtime_pm_put(uncore->rpm, wakeref);
>>       return fw_status;
>>   }
>>   -bool intel_gsc_uc_fw_proxy_init_done(struct intel_gsc_uc *gsc)
>> +bool intel_gsc_uc_fw_proxy_init_done(struct intel_gsc_uc *gsc, bool 
>> needs_wakeref)
>>   {
>>       return REG_FIELD_GET(HECI1_FWSTS1_CURRENT_STATE,
>> - gsc_uc_get_fw_status(gsc_uc_to_gt(gsc)->uncore)) ==
>> + gsc_uc_get_fw_status(gsc_uc_to_gt(gsc)->uncore,
>> +                          needs_wakeref)) ==
>>              HECI1_FWSTS1_PROXY_STATE_NORMAL;
>>   }
>>     bool intel_gsc_uc_fw_init_done(struct intel_gsc_uc *gsc)
>>   {
>> -    return gsc_uc_get_fw_status(gsc_uc_to_gt(gsc)->uncore) &
>> +    return gsc_uc_get_fw_status(gsc_uc_to_gt(gsc)->uncore, false) &
>>              HECI1_FWSTS1_INIT_COMPLETE;
>>   }
>>   diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h 
>> b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
>> index 8d7b9e4f1ffc..ad2167ce9137 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
>> @@ -15,6 +15,6 @@ struct intel_uncore;
>>   int intel_gsc_fw_get_binary_info(struct intel_uc_fw *gsc_fw, const 
>> void *data, size_t size);
>>   int intel_gsc_uc_fw_upload(struct intel_gsc_uc *gsc);
>>   bool intel_gsc_uc_fw_init_done(struct intel_gsc_uc *gsc);
>> -bool intel_gsc_uc_fw_proxy_init_done(struct intel_gsc_uc *gsc);
>> +bool intel_gsc_uc_fw_proxy_init_done(struct intel_gsc_uc *gsc, bool 
>> needs_wakeref);
>>     #endif
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
>> index 85d90f0a15e3..75a3a0790ef3 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
>> @@ -72,7 +72,7 @@ static void gsc_work(struct work_struct *work)
>>                * complete the request handling cleanly, so we need to 
>> check the
>>                * status register to check if the proxy init was 
>> actually successful
>>                */
>> -            if (intel_gsc_uc_fw_proxy_init_done(gsc)) {
>> +            if (intel_gsc_uc_fw_proxy_init_done(gsc, false)) {
>>                   drm_dbg(&gt->i915->drm, "GSC Proxy initialized\n");
>>                   intel_uc_fw_change_status(&gsc->fw, 
>> INTEL_UC_FIRMWARE_RUNNING);
>>               } else {
>> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c 
>> b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
>> index f13890ec7db1..c7df47364013 100644
>> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
>> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
>> @@ -197,7 +197,7 @@ bool intel_pxp_gsccs_is_ready_for_sessions(struct 
>> intel_pxp *pxp)
>>        * are out of order) will suffice.
>>        */
>>       if (intel_huc_is_authenticated(&pxp->ctrl_gt->uc.huc, 
>> INTEL_HUC_AUTH_BY_GSC) &&
>> - intel_gsc_uc_fw_proxy_init_done(&pxp->ctrl_gt->uc.gsc))
>> + intel_gsc_uc_fw_proxy_init_done(&pxp->ctrl_gt->uc.gsc, true))
>>           return true;
>>         return false;
>>
>> base-commit: 134d180cacae82fadbc5ee32f86014cc290f5e0c
>

