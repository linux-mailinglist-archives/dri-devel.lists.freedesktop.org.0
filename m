Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2920584919
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 02:35:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 912D911BF79;
	Fri, 29 Jul 2022 00:35:36 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 735AA11BF79;
 Fri, 29 Jul 2022 00:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659054934; x=1690590934;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=J+Hz8J99w0nqQ5vWKKmRNy593e97M5eOY6UsylivcZE=;
 b=j6jXchL6fE1cjPruiM7vSCc/y9HgDAzmHtM/jkh0vhzaWzoquaUBeWIb
 RMBLUhXiN2hkkbOXkG9uuOSzOwM/0yANUEm3CmYU0tB6DZ0cWT6gw1lS6
 UIcjS9MjJqGSvAtCr42HuoqIqTFnm5+qzzI+VcjFJQfAQ9akh+V9gEbSW
 3zsjNa2VGNi47DZAoMxd+Dbk4bAWTu9LBjaruSIgN8EvQ4eYfmYvKUrVA
 aS8mcJD1lQ9bREQY7/MNNtedGM8eDbgHO3aR2vP708+ZTCitiRzPU5myA
 jrH927QD/rr/U9u+nv6D926t6Q4wUFY3uCx1VgMIIJS1KC3jzc1JUtn57 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10422"; a="350362545"
X-IronPort-AV: E=Sophos;i="5.93,199,1654585200"; d="scan'208";a="350362545"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2022 17:35:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,199,1654585200"; d="scan'208";a="576736740"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga006.jf.intel.com with ESMTP; 28 Jul 2022 17:35:33 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 28 Jul 2022 17:35:33 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 28 Jul 2022 17:35:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Thu, 28 Jul 2022 17:35:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Thu, 28 Jul 2022 17:35:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C9XVdlARWZnbbAbr7ePmbqjGRdLzZc6zpVNJv8Nt5oksPZU6IcQ3dFm0oKGmZ/w7+wWIW2eGgBlk3pwul4fBIcDzhTj0XmOAbT6znuBivBLzu+AtfUe5ap3GTds9jmXMfq/OMuH3Owbx6jIV7+W5gLXHPJu+c3HJ77twn9JRRiNF3lPHAzsof3jdMLoRNZceRnrrj36Q8xHh+Ry6XnoghZpfB+SgdD3FsCLyVDSnih3Kcr5AK5HCdRf+kMLhR6s1cIUM5WImG7FRvHoutx0xC5fnJyVsEjaaguYelJ9er5r0xPgAMdkAU9AIu543dfUYsMdar0nkE5rK+h9t48kgdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+GhjMiG7gNiV4AeKmFzXzKc+Zw57ZPQuisyJaYod9s=;
 b=L8H3gnnj6eJFdn/8juBdIQ6L5LQ+F3n0GkvmpZT9CVYk+ETmI74AI9dxNBmtxiEN48v3UmdDoBhpxYtKOpKeX6VPnsd8/u43CA5aMJ1yugR2YXFSY/PLA3PyZOZ8L0Dc1+KhQ2Uvf5f7T4wihyA7yPILMT4kq7q+4LAiAfpRn2rvgMR73ZM16qGCWMPLZPFYaJ7mmSus5L/GRMiF3FwIazvyZFxqQ0Daj71q9h/QuQ/5iBBI4IB0DcdTCvcGS0uOIn8E5iEh1JHkNV3TftPXGZVYWAJG+KZEX9cFNymFuvV7iiJdGin9IqP4MnNkL6aOIZgP9TjpvhtDTlZ4/0iQVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by MN2PR11MB3599.namprd11.prod.outlook.com (2603:10b6:208:ed::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Fri, 29 Jul
 2022 00:35:31 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12%6]) with mapi id 15.20.5458.024; Fri, 29 Jul 2022
 00:35:31 +0000
Message-ID: <e9fb8872-1d78-430a-ee91-175bac5d85ba@intel.com>
Date: Thu, 28 Jul 2022 17:35:28 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [Intel-gfx] [PATCH 6/6] drm/i915/guc: Don't abort on CTB_UNUSED
 status
Content-Language: en-GB
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220728024225.2363663-1-John.C.Harrison@Intel.com>
 <20220728024225.2363663-7-John.C.Harrison@Intel.com>
 <d0e94746-132d-061c-ef68-2016d50b09d9@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <d0e94746-132d-061c-ef68-2016d50b09d9@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW3PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:303:2b::17) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfe4af49-66b8-4176-c9d5-08da70fa3de5
X-MS-TrafficTypeDiagnostic: MN2PR11MB3599:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4JlJyfXwOKAdmxSRBOMjj4lJPBf3scijbcRn1ixm+cU/xABeSKS8SxuUZCnxQmccY0ZMYgqEJwnC26qydzx3W/3Xzm6pmtjWXMMN+M47BkSosyq3gkYRbdX0u1/CB8yELLP5nf6ijko2joDXX9J2CmxlwZfd63DCX6uthtuKz3K20mgQDJHtHuTBrSO0ShMSQgklRLHTybM7FhdrQ9Rc2MnSQfrVnirHU+OAjOIrohOAcH8W+O9bK7OF3vKeaVzfsoFAHfBd4NzTpDU59sqYWlfGppi2bynulzMtGn82+A+pokuGPYoocaEvUxckQCpU42wZYqwAqcdWOpjXeYek3Cn9qBt1sPKAQPWV8qxg3Y/nKh3K2mXpYPQ4+LHo2oIroMR+UsrKZGM6q13EX2ctxzSlfm/qxasYbxATEJWH22ENKFGX7AEFfajZVg94QqW4ND/R3ulnW3//wNXvNsAL4F2p7ENTizMq5CsLrq8ZSbBbUiYZmpoTQR75NsIDN7wE/lQBWD4Xl01upHAt6eKt/L9P05fgH9BO+hZ9eh5kZTxgHhyG0MFIF853im05u9EltDKMW021KGyZY6513NZf8VceBDuPXfWCzeVhnznvjLgUI1smAVQrh7dgMix/LFmDKUTFqK/LiRZX10/cRCGRd7d6A2xetwNQwPdyc1Hm7fcwlY9o3zqEamkW65gZjWf4gFjJ0L/KXt026ZmhRKPkEcGvqL6bsWB1hif/ddznYGzrL7tGvDgQyDVYogaeKikC+P3v5NE8un2Af09e0ZAq7kEWcJ5O+v4auDLK7wVoZU/320cOONtrwz5YUMpI6iXCL3rVLPLOb1UCBzqRutYrHQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(136003)(366004)(346002)(376002)(39860400002)(66946007)(66476007)(478600001)(450100002)(8676002)(5660300002)(4326008)(66556008)(36756003)(31686004)(8936002)(6486002)(316002)(2616005)(53546011)(6506007)(186003)(6666004)(2906002)(41300700001)(26005)(82960400001)(38100700002)(6512007)(83380400001)(86362001)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDQ5Q3NIbEVGbm9nb0lFSi9za1VBWUNvbkxLQUY5SklZSlprT3dhOUd1WDBk?=
 =?utf-8?B?ei9ZRnN1RlVZd0diVFpLZnJKZ0U5RTd0MjZIbHRBQVhsOTk5VkpYSWlndWIx?=
 =?utf-8?B?aEVQQ1UrRm9wYzQ4ekJDRHV3UG5KL3BGZ1lMWmVJY3NuekRqMzdIanp1WVFq?=
 =?utf-8?B?ZzZsa2kzN0c2OGFsMlNzUUN2WWlLdGJlTDlJaWxxUHV3RndkRUpZQkJlL0xl?=
 =?utf-8?B?VG14azZKZU9ham1tT0syL0p4TWFDamhwMVI2cUUrWkVNUG5oZEdmUWc2MDBu?=
 =?utf-8?B?L09jQVlCU2ROMyt4clBtclp2NXVPK09ScVNxc0VGZG9WOTlvZWJOaFVhVTRL?=
 =?utf-8?B?ZlRUZHFyd0UrS0U2NzZhRDcvYjVRb2xadG5NRmJpdGVhWUIybE1Sb04rTXVp?=
 =?utf-8?B?ajdVZnBPVzUvNjBtYytGOVZvUFBQZmdqc3FqamlFUU9pQnpOazVmdnByQkJy?=
 =?utf-8?B?TVhITlhIWHgrZGdyRkNrNzRvWlMvT1BZNTg1dCtPYVFFdWJ3MjVMTlR5ZXJQ?=
 =?utf-8?B?ZjRFWTByRTJ2NjVLc0xtU2YxUDg1QzByYXJHUHp5YjBkc1JPcVV5TFg3cXc4?=
 =?utf-8?B?Qlg3RUFOWDlyRk42MWxUMlV0N0xpNmtJV1RsdFByck5NdlpTYUh4amo1Zm93?=
 =?utf-8?B?RWN5cVJDbU04bDYyeEpnVWZyRjJnd2ZpcmNLMjNiUk5sNW0vVnVrbEZZTkRV?=
 =?utf-8?B?MXJpMHYrYVVLd2hjc1hNbzlFREcxVm1tZzY2a1BwOHlRZjlPbjhML0tZWlNa?=
 =?utf-8?B?NkZzQkFUWkxDYkJpSVlRNjNoOVBLUXdJWjB5amV2VTlmVVZwTXJGOHZRN0po?=
 =?utf-8?B?a3hBcXl4Y2lQblRORHB6cVVpM0ZodUJsaFhDdjdnTVd2ZmNwY3l0L2MzWlBw?=
 =?utf-8?B?aDkvRnZpM0tOTG0zOXlMOW5halVWeGxqZEQ2VGJ5TmVUMFgyMmVsaUZGRCts?=
 =?utf-8?B?eXQ3a0VUTE8xWmFtZUkyekgyNXFPTzRnZXcrQXMxTFFRUFFjb0NmOEU5MkJ1?=
 =?utf-8?B?UmF0bjB2M2I5a0k5VDhtV3RUZmF6WjNnYXhRcERHd1k0b200UjdJdXUza1Rm?=
 =?utf-8?B?eWtsdzJORWdPSWdEeDRBck5DVWNjV1E3R0Y5TWVwWk14L3RCNHNDcC9VRDRk?=
 =?utf-8?B?TE9kQ2lubnhtdDNXWnJhM3UxUVkzYURudTcyRklzdHdQclgva3Rmbk1FRklz?=
 =?utf-8?B?K1lCZWJ0SWxRZ2Y3eGRNWmUwLzM1VXAwQzN2dy9YbE9UdWthdGZKdlRRVU1j?=
 =?utf-8?B?QWFiZERVVjhUWTdRb1cxVUJDZ0RTeDZicjBwWU9HMzh1REM2ZUlCN0RqdVVU?=
 =?utf-8?B?ZWhHM1JPM3QxZyt2bVR5cENxOXNsQ28xdUVYUXMxa1FyZ2Zzc1FFK1V1SGY0?=
 =?utf-8?B?L1UxenN1MEgvTXh5MXRhb2hJSTYvSERDNlBOTXBjZ2llVjhlb3grVHpZRzV4?=
 =?utf-8?B?azZ2OExTN1Z2Rm5FODlTYmI3aE5OS3k0VDZUQU9PSEx1ekZpN3RrWUN0YkVB?=
 =?utf-8?B?R1doeXVFTWQ4NVY5NzFlcEtQMzQ2NEYvcHJVemJHYlRaZVY0Qzk4L3A4TGRt?=
 =?utf-8?B?b1lsc2tzME9OZ0RBNzRISkFBRUdDdHNxL1lNa1pqcWxpVjh2MFdEemFmcmtV?=
 =?utf-8?B?bXNhd1J5Rjc2UTJJdjRwclFEREZYOHJRU3dFRnQwR29IMWh4cENUZG1yd3RE?=
 =?utf-8?B?VGRkVFkyQUxPSVQ5aEQvQ3dXb05KMGtzTWpEMTR0RnRNb2t1cjNoNlVzM3Zv?=
 =?utf-8?B?Y3N0NW8zR2pvNllhZXdaYUZ1TWtiVWJMVzhPQ3F6U09aeEpZR21sRTdLaEQ0?=
 =?utf-8?B?L2wyZUtFQWNXK2xFVW4wYVpVTU9MeXdYaTJjNnFwNzF2L2poNjN2Vlc3LzVs?=
 =?utf-8?B?OVpkWngxSUxGZkZBc2tZbWU0K3NDWE5DWWsza0xhOWFiOVNrRFpyMHliTjUv?=
 =?utf-8?B?bk9BV3E0UEI3RS9yMDhsZTdjMFBXZVlRbVg4eUJ6NmxiY3JiaS8xMXJJUTZU?=
 =?utf-8?B?T0lwR1dWcmpabzRQMW92VjVYMjhUQnZYNW9JRExUam5QMVNPWm0yUW5WS253?=
 =?utf-8?B?UXVwTWlGMU1lTlQycnpHdkdrN2hxdzQyNFNqcDJrSmRxZXJ1RmJVNzIyck1o?=
 =?utf-8?B?SkZ1RytsV2kxRFJnYWNqOUNOL1l4MkN3Wks2OG1LVDBiWHhKRFZ1ckJ4VFFv?=
 =?utf-8?B?emc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe4af49-66b8-4176-c9d5-08da70fa3de5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2022 00:35:31.0513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jstJEDhdegsw1gLgfG/yVIBga+HlNKnhRTEv+pcILCHOef0rjlzaQIjOxT8GpfOp3f7uSTwaRPG+KxanJzhF8ejKt/kFgPYAGUrs4V73lMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3599
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

On 7/28/2022 17:00, Ceraolo Spurio, Daniele wrote:
> On 7/27/2022 7:42 PM, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> When the KMD sends a CLIENT_RESET request to GuC (as part of the
>> suspend sequence), GuC will mark the CTB buffer as 'UNUSED'. If the
>> KMD then checked the CTB queue, it would see a non-zero status value
>> and report the buffer as corrupted.
>>
>> Technically, no G2H messages should be received once the CLIENT_RESET
>> has been sent. However, if a context was outstanding on an engine then
>> it would get reset and a reset notification would be sent. So, don't
>> actually treat UNUSED as a catastrophic error. Just flag it up as
>> unexpected and keep going.
>
> Given that we disable CTs right after sending the CLIENT_RESET, there 
> is only a small window for the kernel to receive a G2H interrupt 
> before we turn everything off. If we want to support catching 
> unexpected G2Hs coming at that time, maybe we should instead make sure 
> all CT messages (if any) have been processed before the disable. Not a 
> blocker for this patch, can be done as a follow-up.
Yeah, it gets messy. How do you check for messages in a CTB that is 
already marked as 'do not touch me'? The current check for available 
work (head != tail) is after the status check. This is specifically so 
that we don't try to process corrupted messages in a corrupted buffer. 
But by definition, if the send(CLIENT_RESEET) call has returned then the 
status is already 'do not use'. Ideally, we would just want to flush out 
any pending interrupts before turning interrupts off in the sanitise 
code. But then, is there a race where the interrupt hasn't quite made it 
far enough by that time? Do we need to stall for a bit? How long?

As noted, in the case where we actually hit the issue the interrupt 
handler did get to run in the gap between sending the reset message and 
turning off the i915 side of the CTB. So we are basically into windows 
of opportunity and diminishing returns. Given that it is supposedly an 
impossible situation anyway, I'm not sure it is worth putting a complex 
solution in to solve. But yeah, can think more and maybe get some kind 
of extra check in there as a follow up.

John.


>
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>
> Daniele
>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   .../i915/gt/uc/abi/guc_communication_ctb_abi.h |  8 +++++---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c      | 18 ++++++++++++++++--
>>   2 files changed, 21 insertions(+), 5 deletions(-)
>>
>> diff --git 
>> a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h 
>> b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
>> index df83c1cc7c7a6..28b8387f97b77 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
>> @@ -37,6 +37,7 @@
>>    *  |   |       |   - _`GUC_CTB_STATUS_OVERFLOW` = 1 (head/tail too 
>> large)     |
>>    *  |   |       |   - _`GUC_CTB_STATUS_UNDERFLOW` = 2 (truncated 
>> message)      |
>>    *  |   |       |   - _`GUC_CTB_STATUS_MISMATCH` = 4 (head/tail 
>> modified)      |
>> + *  |   |       |   - _`GUC_CTB_STATUS_UNUSED` = 8 (CTB is not in 
>> use)         |
>>    * 
>> +---+-------+--------------------------------------------------------------+
>>    *  |...|       | RESERVED = 
>> MBZ                                               |
>>    * 
>> +---+-------+--------------------------------------------------------------+
>> @@ -49,9 +50,10 @@ struct guc_ct_buffer_desc {
>>       u32 tail;
>>       u32 status;
>>   #define GUC_CTB_STATUS_NO_ERROR                0
>> -#define GUC_CTB_STATUS_OVERFLOW                (1 << 0)
>> -#define GUC_CTB_STATUS_UNDERFLOW            (1 << 1)
>> -#define GUC_CTB_STATUS_MISMATCH                (1 << 2)
>> +#define GUC_CTB_STATUS_OVERFLOW                BIT(0)
>> +#define GUC_CTB_STATUS_UNDERFLOW            BIT(1)
>> +#define GUC_CTB_STATUS_MISMATCH                BIT(2)
>> +#define GUC_CTB_STATUS_UNUSED                BIT(3)
>>       u32 reserved[13];
>>   } __packed;
>>   static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>> index f01325cd1b625..11b5d4ddb19ce 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>> @@ -816,8 +816,22 @@ static int ct_read(struct intel_guc_ct *ct, 
>> struct ct_incoming_msg **msg)
>>       if (unlikely(ctb->broken))
>>           return -EPIPE;
>>   -    if (unlikely(desc->status))
>> -        goto corrupted;
>> +    if (unlikely(desc->status)) {
>> +        u32 status = desc->status;
>> +
>> +        if (status & GUC_CTB_STATUS_UNUSED) {
>> +            /*
>> +             * Potentially valid if a CLIENT_RESET request resulted in
>> +             * contexts/engines being reset. But should never happen as
>> +             * no contexts should be active when CLIENT_RESET is sent.
>> +             */
>> +            CT_ERROR(ct, "Unexpected G2H after GuC has stopped!\n");
>> +            status &= ~GUC_CTB_STATUS_UNUSED;
>> +        }
>> +
>> +        if (status)
>> +            goto corrupted;
>> +    }
>>         GEM_BUG_ON(head > size);
>

