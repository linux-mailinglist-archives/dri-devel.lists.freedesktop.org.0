Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA1148E6B9
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 09:41:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0821810E1D0;
	Fri, 14 Jan 2022 08:41:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2046.outbound.protection.outlook.com [40.107.236.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D6B910E1D0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 08:41:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eGBeOAASPbM3IILzvTFeBOMWPhW2FZSCeLWoYD/8B6aygvrxboi6eX2zLBR/2Xe85xKyF2+fHbpfMGYALUgMhHdGnpfJQHwJdELybJZxBojMqm0W9FRD4nAYRD0wiCx14M+ez72lTipZJKlubCqI/GYJ2YMe2Sa84pnpWt2T4GxZOU6XxRnumSWHy4FDd1msmCNZCFxffCo7iNyg054cuXBrQBopL1MoQLhAzXcjDEQ6nDg8bv5RdOIyNbNapAB/7QduRJJJqeRcKPK4okiWH+8q4FQYlAGUc4+RwA7tJEQPIgtBYUgfYckL5kgCvEWCSPeqjRL14a+Pfo+aeLJ80g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/dH81X346AFl6oI7D9wIqMiwXZwnTZ/WiITibOWYw5Y=;
 b=I0BdQKOkd/Og8Mzp4GHQc6Reyl15SKNsOw/ErzjUq51hjv6Sx/5nSdb3HP2OMFGVhiZ5tWjkvDOIyALcSh/ietLT46tyX9+xUT0kMphcksHiFBtvdt28aIV2PcOm23p4j4LWc2tfgINp5Lzlat+bPxVCV1p9x4nxxdPOG2DWPS/w0UjRH0DYm/L/bd5XcpQIyLd8L28NFol0/INsiv091zjW4F4qlqcNzFDojttULXPzNLzH5v4wOymkZTUKFnqox/zeVejK7W6RHATJfBtK9oDC5MclCuzx3YZnuD7Za4i0r0NDIRwtJvmxdpsXzdzBMzywaFazPe4O1saCNY5AHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/dH81X346AFl6oI7D9wIqMiwXZwnTZ/WiITibOWYw5Y=;
 b=i3IZF3nfqPEdC40zfTGMxMfZNc+iPAQpSadc+zsTTxeG+RyKC5AqypdoGSTPrDHV59i4GDOxrNrpvKZ7HgaMPiaP1tFHf2WPG5q31HNQFYViO8nCrXpv8SjuIHDMGNPsd8BgnWxCO61+0GMHZu/e6uEP1tPqx/2W84bCv3QahN0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by BYAPR12MB3415.namprd12.prod.outlook.com
 (2603:10b6:a03:d5::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Fri, 14 Jan
 2022 08:41:03 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246%7]) with mapi id 15.20.4888.010; Fri, 14 Jan 2022
 08:41:02 +0000
Subject: Re: [PATCH] locking/rwsem: drop redundant semicolon of
 down_write_nest_lock
To: Guchun Chen <guchun.chen@amd.com>, peterz@infradead.org,
 mingo@redhat.com, will@kernel.org, longman@redhat.com, boqun.feng@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>
References: <20220114083742.6219-1-guchun.chen@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <33e93f72-0d5a-b624-f58e-c35155bbda1e@amd.com>
Date: Fri, 14 Jan 2022 09:40:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20220114083742.6219-1-guchun.chen@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM6P195CA0074.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::15) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd382c1f-e7e3-43d2-fca9-08d9d73998bd
X-MS-TrafficTypeDiagnostic: BYAPR12MB3415:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB34153F9EBD2E156B96877C4783549@BYAPR12MB3415.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E8Xcz/w+wStk7lJu6fZfLzrUt6WEaE4vBhUDEcR2dit+mZTpwYO7oQ8xrLk7m1RLxnnLmdDae+yRe5DJY/34u6sAQz6eYJo909Hk7bMGV3XHTuW5VepDKWsX/ejW+5ExhnXwkxFfZ2oVSDYaw+3sIRtIZ5YWX+mpbz3xrrPHwPRZOifxOr786DX3IBl37nPuKKhZuqiZ9koM3XszyNzDSrUmQszcmVdBDV52zolt7t7+ZO/xn47K66ccy+KT7kbL/0kSruKCn2VTT1yeRke3GFGV65By7al/lo9KsiCpDpQLGQumUucJzP0UQ3kxqLCOmLRQRE4v4tDgxUF81olMSWmf/p4zkEVvYpBT7B/YojpZolSZ3VmodZhyJ7sYfJmIPy1qxMTZ70TCJhjRdr7r3sWDimUXXWiaQQA91vSIpMCdg5HMVuQcR/iCxo6n0pIVjguDscgj3aTtoL4vOpjUGTMTEmVclPB62BA9mRBoncLh2/1/09oAABzeI582sSYuGGPltYa0HwlnKWZhSYDpLRLjiuOg5Tx56slLSRgOjgK0TdvBfd22J4Mg6DxX4BkZwJK/AJ+rf1GF5NeUVmqxRPpS793H0t+KHRCuDpi8dENtYEri55VCloCvFOoyM702zyi7Y+flo9xR5dL2tc/oa32gw4bWjSi0V3cj5UsnTvrHAApGeORnri+Oeu5MrxS0v14ADUEsLJiRJOcSK5oyTr736Mw/XL+apxDuWBxLvlqBIBDRYXovZN6Z4r8huPcE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6512007)(31696002)(6506007)(508600001)(316002)(66574015)(2616005)(6486002)(38100700002)(110136005)(8936002)(31686004)(36756003)(83380400001)(2906002)(26005)(186003)(66946007)(6666004)(5660300002)(8676002)(66476007)(4744005)(86362001)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUdjamp1eWpTaXRGaXNsSzRPMGtjYW41dFBWOEhDdmJ5cjByWDNHRS9WME5N?=
 =?utf-8?B?aGhSOWFnclVzRldJRjB3bTBQSW93WXgydzU2SmdmYlgwL3BpaFlqWjBTeEI0?=
 =?utf-8?B?ZnlSKzZqZlI5ZVBHYVNvUytIOGFxTGdkZkcxdGZ6K3BGd0VlK1crbnY3ejhS?=
 =?utf-8?B?clIrUWxtUlViTnZ1WUVncFlFTWR5Wno2NDNNZzVVVUNHMDFrRXZHY0Z6OENa?=
 =?utf-8?B?MERZaElTVytvWjhwSnZudVVMUjZPMlVTd3hjVVZRaWtoZjJ2RlBvS0ljcHVB?=
 =?utf-8?B?QkZqU0VuTWc4L2NpeHdnNEhXMG4xZlRzWloxcUp3cEZneHNWV2ZoSTdSdk1r?=
 =?utf-8?B?YVpybzYxU1o4STBuWmorNmpWYzh3OGdteXp5SFE5aGwzazFjeGpMRjZycGor?=
 =?utf-8?B?cjdNMjBlVS9qMVVxeUsrK2tGdzYrZDVqWHFxdGd6RUpOczlZa1p1R1hXRnBH?=
 =?utf-8?B?U3hCQ1U0TUpWNjVxY2RxT2tpSU1ibEFlTkZmUzYveWhrc0xYR0Y2Mm53cnJW?=
 =?utf-8?B?NTYwRXplTHNVcGZMMXV4SzNQaDczQlR6ZHBJRkptcXUwdXg0STkyVCt6VjBQ?=
 =?utf-8?B?TllLK0VPMTdWZlg1S0FWcG5xN1U2RGROdHRrbERQOUg5Y2g4UTFNalV6M0dD?=
 =?utf-8?B?aXNxNEdDRktQb0YzSmJwd2QxdlBBQ3QrN1BPRExpdHZDeDF0MzlMQ3EzbUdB?=
 =?utf-8?B?Vk9IaWlaV3YveFA5MlJHODAyUnJZYklYK3BLQ29rVzVtWFRFcW82SHlEaDl0?=
 =?utf-8?B?S0JHaUU0Wm5SRU9zdXVhTUdhYTBTamRvVmYrcFBPUFJpdGhRVXZnTFFzTjZi?=
 =?utf-8?B?VTI4OEo3TS9LN240UFZ2am00ZzAwVUUxV1N3WlZHdjVZSFZCbkdCNXZyT3du?=
 =?utf-8?B?c0hNZDk4K3BlakZySUQ4TWtlRVdEaTJCeW1ISXBGR2hxUU9Wd2NEZ2QwWi9t?=
 =?utf-8?B?SWhxdE1pc0VUNm5rV1JXQTd2akJHdUtoMmtwQU5YRzhCZ211WkN3dGtOT1dI?=
 =?utf-8?B?UFlXQlp0dFJ4OWM5Q2lVT3lOT2NrSWN4cTQrdUljeUgwVHZqWjRUZ3kvTllm?=
 =?utf-8?B?aGhKaVpJVHBMMDhyN1Q0Y2xBOTJmWWk0M2dmQlR3Q3hUdkFOL0d5MVhndHVR?=
 =?utf-8?B?Q09pS2NxQ2RtYTRvM3hZdG9MZUxuVFM1M2kxUytodWVZS3RsR2NlR3Ewai9Z?=
 =?utf-8?B?S2J5cVp6WDdyWnhDY00yVGdqQTlVeG82RDJoTTJ6UCtTeHVIRFhBcHZEWWNR?=
 =?utf-8?B?SWowc0ZyZUpaNVcvcGQybG40ZDlwYzJLWUNhb3NIdkg2VC8zU2hEWENRRllp?=
 =?utf-8?B?OUxHbjZhRWlzMTd3cU9yZ0J5VkF5L2E2dXVLTDBYVmdNNCtheTB4UE9xbndL?=
 =?utf-8?B?L2UxSnpDNGVNbXpVYmFGb3kyWUtDTzJGd0NiLzlWYTF3TndybUZhUHNET3ZI?=
 =?utf-8?B?UWpRUTB4YjY3L0MyMEZtZ1ZpRVRhaEpWTzVMRTl6YXdYZ0dHYzRtcTZXUEVh?=
 =?utf-8?B?MEt0OFhSYmZNZ0xTalFtZlNIeDlGWFp6UFVqWjhvdmhVRmtBQnNRdnJUc1NB?=
 =?utf-8?B?NHgyNC82SVIxeFk0Zk9iblZtM2tYeUh6L1R2c2Z4SlYrNVJLQ052Wnl0MGV4?=
 =?utf-8?B?VEJsRkIxTEdFN1NJWnJqV05qRHg1Q3hJckVUaG0wUmMzbFFZVktRdjM0Mmx0?=
 =?utf-8?B?V1I5bHpPYjBrSmtsMEoxdmJRK2d3WFh2ZkcwNlFqM2FwSlQvOXZDeTdRc1Ey?=
 =?utf-8?B?eUtDRzNURWtkQUg4Z2QvRHN4WWFiU0tmZnVPZVJTaklVSy9xTjRPbmJnK0lp?=
 =?utf-8?B?b05SR1pxRENCdFhEN1E3YTAyUE1JNDE0TG9rZm40c3grRU9BUnlsL0s4Yzd3?=
 =?utf-8?B?MmF4T0loT1RKalR4QmhoT0Q0MHlPeWR6cnlvaENjUzR5ekprQmNRTTk5QmlW?=
 =?utf-8?B?ckN2cjJUR2hrUGwrOEdUNDZ4dkoyQloyclBJVlBBdkJnTS82L1RsZ2s0bEd1?=
 =?utf-8?B?bnFua09Xa0JmMlMyRzhVbXIrUk1ZMTVWdlZMejZwa3VCaUxUZDd3WXk2OUU5?=
 =?utf-8?B?STA5YXYzSDBwTFduWndpdG9NNjlQVWtlMFliT3BCTTB6Vk9VdnFxSVcrcDZW?=
 =?utf-8?Q?UhAQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd382c1f-e7e3-43d2-fca9-08d9d73998bd
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 08:41:02.7987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yzjc050Olp8ukhTv66geU13VFwtE2gf4JoS37fREc+/1IMPYX5Y0r/B7Tisk6BIW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3415
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

Am 14.01.22 um 09:37 schrieb Guchun Chen:
> Otherwise, braces are needed when using it.
>
> Signed-off-by: Guchun Chen <guchun.chen@amd.com>

Acked-by: Christian König <christian.koenig@amd.com>

Peter any objections that we push this upstream through the drm subsystem?

Thanks,
Christian.

> ---
>   include/linux/rwsem.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/rwsem.h b/include/linux/rwsem.h
> index f9348769e558..efa5c324369a 100644
> --- a/include/linux/rwsem.h
> +++ b/include/linux/rwsem.h
> @@ -230,7 +230,7 @@ extern void _down_write_nest_lock(struct rw_semaphore *sem, struct lockdep_map *
>   do {								\
>   	typecheck(struct lockdep_map *, &(nest_lock)->dep_map);	\
>   	_down_write_nest_lock(sem, &(nest_lock)->dep_map);	\
> -} while (0);
> +} while (0)
>   
>   /*
>    * Take/release a lock when not the owner will release it.

