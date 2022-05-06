Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CEC51DC14
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 17:29:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23BCB10E29A;
	Fri,  6 May 2022 15:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A105C10E29A;
 Fri,  6 May 2022 15:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651850985; x=1683386985;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=baAwJQ1IxhvdsiXUyE+XzI5NVPhwhuXRZKeyTAXrJ28=;
 b=ItkzVaDpW/wwuKjfrfQKuEGkjX64s5Udm6qDNpxcYCt1r1QoA+yC1qA3
 63D+0FAb2LolJPj8xhipZJSMnUlMf3//1Jb/R69X9V8SgYmECwO+dYVRS
 Y0SqzYeDREwl1UxnhOcKwm5rPofMZuVNJAmFM6HrSIDWw5dnS16577R3v
 7zeU9A9SXlGFPSV8eX6mlpyJWbSRqpJyuzm6wUPwdUFfarhJHuuzdtqc1
 dSOYV4FwAtNtjMK3dLMF0ThEuIhYaJfifYQERFj4St0iL50ODn9abWGlZ
 2aYeISZr6lGpB0qN/s4nbroEZEBlyaUs++1qfeE/jgTy9wwBcFprnsOgt A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="249027804"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="249027804"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 08:29:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="695223545"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 06 May 2022 08:29:44 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 6 May 2022 08:29:44 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 6 May 2022 08:29:44 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 6 May 2022 08:29:44 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 6 May 2022 08:29:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bUWf2v3WpaCwPP+BxQ9oRP55kF+fuAxIFWhW4VxHz5hiLQebl3jjPahEcVZoOLeMXYU1ZaYuHpJ6b/8YzOF6jfWv00Bd3GXd0w8z+FTmoWRyrvYkNMbfuDn5bAqPHbjE0K2Ck9Na4nrTRdbUZYNRc4F4Q5RIWMFMMHFvYjxnJAdixvuQGgX/G/zwXQLkbngBVf4l1hx5iCe2qq6gx6hF8tOerhChj+LYWVmd1GATP47c2MZXmqErQWNxy08lQceGeb9nAUVIGWJBJrp0ZfWh2Oh96GPaG2wmseLN/wIqnX2zk/llgzD8lC+UM17yIQT1ZbTiz33Wv920fZArOZq1ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WebXh0KAiqhnd5OCSopWa5l1iS5F2rbv+dhuw1UrvDQ=;
 b=W/DZut6WFI1ZI3Jm99+2TdfxG/N8xDi4ucqAPorW77Vi3Mwe4SkR7WEQUtIRqv1jUYqTKg1nJBw2qIGhOUFJXoF9AxLpkPJrR5oWWAC19GimF1D9qgCVK+GDz4zFSY36cE8FXBLZ6fIcAdNS04UhNtGG486kFfFNPIwFtevZI0A2DpoQcFnFNLl3xovadlv8qUGFYKSUz8E8+SKCK9zd3PE1hJ6sfKJQh8DBcRsX5/yu2cJ5FAtBu2HudZEvcWtED+KY1L4ifSs1n5DAwwSjLrCNHbt+G1nSDqf8ykRSltejZVYuk5HFYcK35XHLLpMN/NtIopZ3TaKxQcYw8paZEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 MWHPR1101MB2222.namprd11.prod.outlook.com (2603:10b6:301:57::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Fri, 6 May
 2022 15:29:42 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::b907:4e16:92da:b2cf]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::b907:4e16:92da:b2cf%2]) with mapi id 15.20.5227.020; Fri, 6 May 2022
 15:29:42 +0000
Message-ID: <655df251-96b7-bad8-e723-ced5a08b70d0@intel.com>
Date: Fri, 6 May 2022 08:29:40 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/guc: Support programming the EU
 priority in the GuC descriptor
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, John Harrison
 <john.c.harrison@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20220504234636.2119794-1-daniele.ceraolospurio@intel.com>
 <95b167c3-08a4-0323-a538-c0f34cc3a13d@intel.com>
 <7218e8a8-d22f-41ce-13b8-56b24471a494@linux.intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <7218e8a8-d22f-41ce-13b8-56b24471a494@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0144.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::29) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77adde26-6c05-4398-afd2-08da2f753dc7
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2222:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1101MB222233CC0969634847731DC9F4C59@MWHPR1101MB2222.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z8Y5HeG+c8AccLl+Jgw01rdwQYdjgjCg2zz/SMcOREJ2/2ZjRpZIcmhGBAnFfPNEiUQeHbTybfvAe94a+ECxyJ6Za01OkC9L92TiEXUb4FlWsHruR4JfXyoxSgsSUJzj+6usSlAlRCLyKLmdjMgllHL0bbRP+pPr9LHPVGJC38WgNkast0PPMMXEPljVQDDhPe2Nuuds6/1Yp0f0rei7Zb1YEVHXREEZQ16yNfPJs+0f/m4dku3HOOwb1oZaTSpE5XUVrdrovf5pJleauVuMgf1MGXV8rXhHywzdRYmmTdu97JVQVj5wy4llWC5c4ARLmhQOQEblKKkjmLZqIkv4OIBf3s+n/hLcmoYGsnNNPnj+lSV7ezzy8bApzObFd6Hg0ipP1QWoScx+1tr/Wy7hOs1LpctE1SnpXniG3fFsFz6BrS8sVwiqJhftgb7ItVBTKsDIoK9u1d8fuvk9zFIfY8WBYaQKEucnhluKuOSd8fvH/9cW9PWrLX5Br2V9WJg0Nh4U18ExqCYG3xzCYxZ5bruPE7+uAmLlzowJrHIpXBbFTVG3J2eXR7AFBNz3hGoJqOFBxFQfR8CiDQHCbKf4KM0ECfOFN+FoffTLe++nOY4H1bL0iBM+RRbm9uRrhibtbC/HeKTwYDVLEwkkqWLQirx0fBDLA2J5EI2RvUNJVgVZFrg+TcMf7GpYNiDLoxjR3rKYZlWuAMiIdB5+iWYD9jApdG1kW8zjPPY5JwBt4BM5FoM9LWIjMVQmhFytzu/e
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(110136005)(38100700002)(82960400001)(5660300002)(316002)(8936002)(508600001)(6486002)(36756003)(6506007)(26005)(186003)(31696002)(53546011)(2906002)(86362001)(6512007)(83380400001)(31686004)(66946007)(66556008)(66476007)(4326008)(2616005)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHVod2ZxY1hwWWhKeDBQaytDRDE4dGo3VVd6a3I1dTFRMVNuaDFUeE5PTDFj?=
 =?utf-8?B?SjBpZmRDRXJoalVURVpxSWpRdzlBMEdTTWc0SGV4RDhFa0dJNEI5dm5WWDYy?=
 =?utf-8?B?eWRWUjJ1UXdBM0Q5OE1UNWh5akFYNUVIdFlpQTBjTXEzdU5kSlRERGh1Y1c3?=
 =?utf-8?B?RmRqMXpKRkRaVi9kWFVsUzVqaTBTNDFVV2xDZFMzTWdzR0RXQkdUb003SzZB?=
 =?utf-8?B?NHlDUzF2TDY1MGlBRWlOYnpWR2crTWwzTzJKRFpyclRSL0QrQjgrWTFmQjRE?=
 =?utf-8?B?QTQ0Sk5Qak1xUFE0d21oWEFvNmlWVGxkaFkxYkVkMFk4TjM3Mkd6cGZrZi9l?=
 =?utf-8?B?d1pRdHNwbzRlNitEVGVwUXgrM0t2dk9aZmt1K0tIOWZUMmtVYzdiTHBaeVZD?=
 =?utf-8?B?QmJZeGo0a3MxaVdWMElET3pXL29VbjZZUUd0dEhwNk80V0pDVTRUWVVDS1BX?=
 =?utf-8?B?S3NzSGlyVk84RHkxVUxtU0Jnd1BBcXUxQ1p2c2E1T0NVYUdGWDllc3E0dHZw?=
 =?utf-8?B?djJoWE9uRE4zckNxdGpIak0wc2lxdjNLWjIva2d2MVBCdDB4N0wrdnBTWVJw?=
 =?utf-8?B?YTRtRkQrOXlNdU9GK2MxSS82Z1JzTUQwSnZrMDFHMlplTVlkanVuYTY2L3NP?=
 =?utf-8?B?dFRpYTZ5a3RnY2hyZTFad2tLMkxONy93TkhuZGNYaDV1ekZyOTM4eUNtZ0tq?=
 =?utf-8?B?aGU5emNNZkZaWkp6aG1kKzQ0NzdDOFNjTGk3QjByMUhERS9SVkhySlRCRU0x?=
 =?utf-8?B?U2JxYjZJYTBKNFNVWGp5Zm4xY1VWQmlDaFVybEF0Mkg0VVQ0SFM2SktPM2NT?=
 =?utf-8?B?SWtydmcrMEtiUTN5ZFVOL2tnbXh6M2I0eVFWMWNXU1hLSGRFYzJON0p4WlpN?=
 =?utf-8?B?ZisxR25ZVDQxb1l1SkRWS1UyY0RBWTNiaU8yelFOOVlPY1lRek43aUVwWGtt?=
 =?utf-8?B?TlpGTWZaNElFOExQb2JtclJxOUh2SDhabWJkOWs0Tkx4RGh3eGQyZVV4NU5W?=
 =?utf-8?B?MHZBSnpOMXNsakZWUTJ6WTE4TTM0K1MyZmRTQTFLTEU0SEhFSlMvU1pWdk1H?=
 =?utf-8?B?UmJDMFNJaHRxcVBKYzBhTlkraUJvTDV0UkR1Y3M4cFg4VnhjTWxXUkllTkw1?=
 =?utf-8?B?ZXFLYW40ZHY2UU5qNGRVRTVKaW1YdHRBQitsVEZNeG5WUXp5Ny94WHA1cXIr?=
 =?utf-8?B?SWlVUzk3ZnNRcitNcXJvN2tqRGg3dDlOcWFCdzAyd0E1R01TMXVvekUza0dv?=
 =?utf-8?B?VnkxRXlkWDJ4QXpEMmVLWTkxclpLd0RkaWttSVcwbGNkeStoU2U0RTdZUWgr?=
 =?utf-8?B?NG82eHB5emJNak1WYnVYWlc2dmZ3WHd2WC9JSzczY2xYS1JRVnpmaXdSY1pE?=
 =?utf-8?B?VGsvSXpkYkhMYlgwVnZJU3RKVTVBUGthMXAzbG16bFAzS2NrWnNVOStHcWlt?=
 =?utf-8?B?M3FUczRESW9Eak05OHErZTRtOG5hMzAxbkVmbVJUY2RVVjlHYnhYTEg2QWRP?=
 =?utf-8?B?Vm1QV3NxeFNzUWdkbXNBZ3dBa0h4Vm1ZdDNuMGhGclVVWEQ0R1FNOUMwQ09O?=
 =?utf-8?B?V3J6MUJ0L25aTlRrMkdMeVQvVEVsWEx0SUxiaGNWbkVYRzU2R3QwRzNxdmxt?=
 =?utf-8?B?RFpRaFFmT2ZtSGxOYllSWmxpRHpjTUpUczgybkhuZnNFVzEyUFNSR2JjRWd4?=
 =?utf-8?B?TUt4N0c2YkFBbU9qb2xjQXh3dFQrZTBGQ0tONyt0V1JGc2hEaENvaFZXdGJw?=
 =?utf-8?B?L3lKbUU1dUQ5bDRwNXR6SHRuTTgvOWwwTXdwRHRMR1JRMHpUSWdrdFhhZ1RU?=
 =?utf-8?B?QVAyUmM2eEJSVkxBN2U5K3ZPdVBZOCtERkc1V2poSG5la2JwdmpDM2Zqc1VK?=
 =?utf-8?B?YWVtQUUzU2lmUlY2dzhjMWlacGl1YVpoWFdPem5JblRmNFN4cDdTNUd4Wk5w?=
 =?utf-8?B?YmJZMWxCcVhic3Q1Y1YxRk1ZRUxVNzJWdm5vOFRxWnJuL3BWMjlHK1FvV3Fk?=
 =?utf-8?B?ZUpDSmlZd2FxamtRNkpvRGkvYXhmdjljUGNsWU93SHhMYjNZSHBQLzd6TURt?=
 =?utf-8?B?NzhVUHlpY3ZDc2Y5RzY4MHdGZzZ6YldMaWRvZW1keExGUGRNcUJhVUtpM2JI?=
 =?utf-8?B?VkJwZHhIMTJTdG0ya0ordU1yc3NBeTFWOVdKTEppY1dKYzZMNjhQVGU2V0da?=
 =?utf-8?B?bFE0cTR5bEt6U3hyNGdGdTR0NUFWOGpFaEMrV1hPaklQZjEvSjlEQ2s5T29z?=
 =?utf-8?B?K3NDV3dFTUJOSWR6cFBVc1BBc05LSjBoZDJ0dUdObjIwSVpKeS9IbHZGMnhY?=
 =?utf-8?B?Zk5GZlp3M1Rsa0VzNHp1WFgzVXN5MUdKN3BuNzBUa3ZDc2NxcUJuZE82QWhW?=
 =?utf-8?Q?u5ijDSAvQgfnDoecVh6cnLIdcmUB3CZEMCX0d?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77adde26-6c05-4398-afd2-08da2f753dc7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 15:29:42.2240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JuHF5LwxpE1pYmvzpCOAa68/blchSOEoovTGd9mHc2qhtpXUae2kQZhOu7Q2LJ0SCXnVwN6ihMXuVLMVPDK8spYhsylFpRcsk/P0ki8hRhs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2222
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



On 5/6/2022 12:51 AM, Tvrtko Ursulin wrote:
>
> On 05/05/2022 19:56, John Harrison wrote:
>> On 5/4/2022 16:46, Daniele Ceraolo Spurio wrote:
>>> From: Matthew Brost <matthew.brost@intel.com>
>>>
>>> In GuC submission mode the EU priority must be updated by the GuC 
>>> rather
>>> than the driver as the GuC owns the programming of the context 
>>> descriptor.
>>>
>>> Given that the GuC code uses the GuC priorities, we can't use a generic
>>> function using i915 priorities for both execlists and GuC submission.
>>> The existing function has therefore been pushed to the execlists
>>> back-end while a new one has been added for GuC.
>>>
>>> v2: correctly use the GuC prio.
>>>
>>> Cc: John Harrison <john.c.harrison@intel.com>
>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
>
> I've asked for this already - since this seems a fix relevant for DG2, 
> but now that it has been merged without a Fixes: tag, it will not get 
> picked up for 5.19 by the scripts.
>
> Maybe I can cherry pick it manually in a few weeks, or maybe you guys 
> can send it to stable manually once 5.19 is released, please make a 
> reminder item if you think 5.19 should have it.

I didn't add the tag because DG2 still requires force_probe. If sending 
fixes for DG2 is ok, I'll make a reminder and I'll send it manually later.

Thanks,
Daniele

>
> Regards,
>
> Tvrtko
>
>>
>>> ---
>>>   .../drm/i915/gt/intel_execlists_submission.c  | 12 +++++++++-
>>>   drivers/gpu/drm/i915/gt/intel_lrc.h           | 10 ---------
>>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 22 
>>> +++++++++++++++++++
>>>   3 files changed, 33 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c 
>>> b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>> index 86f7a9ac1c394..2b0266cab66b9 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>> @@ -661,6 +661,16 @@ static inline void 
>>> execlists_schedule_out(struct i915_request *rq)
>>>       i915_request_put(rq);
>>>   }
>>> +static u32 map_i915_prio_to_lrc_desc_prio(int prio)
>>> +{
>>> +    if (prio > I915_PRIORITY_NORMAL)
>>> +        return GEN12_CTX_PRIORITY_HIGH;
>>> +    else if (prio < I915_PRIORITY_NORMAL)
>>> +        return GEN12_CTX_PRIORITY_LOW;
>>> +    else
>>> +        return GEN12_CTX_PRIORITY_NORMAL;
>>> +}
>>> +
>>>   static u64 execlists_update_context(struct i915_request *rq)
>>>   {
>>>       struct intel_context *ce = rq->context;
>>> @@ -669,7 +679,7 @@ static u64 execlists_update_context(struct 
>>> i915_request *rq)
>>>       desc = ce->lrc.desc;
>>>       if (rq->engine->flags & I915_ENGINE_HAS_EU_PRIORITY)
>>> -        desc |= lrc_desc_priority(rq_prio(rq));
>>> +        desc |= map_i915_prio_to_lrc_desc_prio(rq_prio(rq));
>>>       /*
>>>        * WaIdleLiteRestore:bdw,skl
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.h 
>>> b/drivers/gpu/drm/i915/gt/intel_lrc.h
>>> index 31be734010db3..a390f0813c8b6 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_lrc.h
>>> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.h
>>> @@ -111,16 +111,6 @@ enum {
>>>   #define XEHP_SW_COUNTER_SHIFT            58
>>>   #define XEHP_SW_COUNTER_WIDTH            6
>>> -static inline u32 lrc_desc_priority(int prio)
>>> -{
>>> -    if (prio > I915_PRIORITY_NORMAL)
>>> -        return GEN12_CTX_PRIORITY_HIGH;
>>> -    else if (prio < I915_PRIORITY_NORMAL)
>>> -        return GEN12_CTX_PRIORITY_LOW;
>>> -    else
>>> -        return GEN12_CTX_PRIORITY_NORMAL;
>>> -}
>>> -
>>>   static inline void lrc_runtime_start(struct intel_context *ce)
>>>   {
>>>       struct intel_context_stats *stats = &ce->stats;
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> index 75291e9846c50..8bf8b6d588d43 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> @@ -2394,6 +2394,26 @@ static int guc_context_policy_init(struct 
>>> intel_context *ce, bool loop)
>>>       return ret;
>>>   }
>>> +static u32 map_guc_prio_to_lrc_desc_prio(u8 prio)
>>> +{
>>> +    /*
>>> +     * this matches the mapping we do in map_i915_prio_to_guc_prio()
>>> +     * (e.g. prio < I915_PRIORITY_NORMAL maps to 
>>> GUC_CLIENT_PRIORITY_NORMAL)
>>> +     */
>>> +    switch (prio) {
>>> +    default:
>>> +        MISSING_CASE(prio);
>>> +        fallthrough;
>>> +    case GUC_CLIENT_PRIORITY_KMD_NORMAL:
>>> +        return GEN12_CTX_PRIORITY_NORMAL;
>>> +    case GUC_CLIENT_PRIORITY_NORMAL:
>>> +        return GEN12_CTX_PRIORITY_LOW;
>>> +    case GUC_CLIENT_PRIORITY_HIGH:
>>> +    case GUC_CLIENT_PRIORITY_KMD_HIGH:
>>> +        return GEN12_CTX_PRIORITY_HIGH;
>>> +    }
>>> +}
>>> +
>>>   static void prepare_context_registration_info(struct intel_context 
>>> *ce,
>>>                             struct guc_ctxt_registration_info *info)
>>>   {
>>> @@ -2420,6 +2440,8 @@ static void 
>>> prepare_context_registration_info(struct intel_context *ce,
>>>        */
>>>       info->hwlrca_lo = lower_32_bits(ce->lrc.lrca);
>>>       info->hwlrca_hi = upper_32_bits(ce->lrc.lrca);
>>> +    if (engine->flags & I915_ENGINE_HAS_EU_PRIORITY)
>>> +        info->hwlrca_lo |= 
>>> map_guc_prio_to_lrc_desc_prio(ce->guc_state.prio);
>>>       info->flags = CONTEXT_REGISTRATION_FLAG_KMD;
>>>       /*
>>

