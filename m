Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1C44166A8
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 22:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C9B76EDA2;
	Thu, 23 Sep 2021 20:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D4B6ED9F
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 20:25:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l3MrS+uY4FqDYkdJtgCZWBqEcoFoxN9e/6ezzG9Je6hmhgnlJgfx6tPSa5Ldtv1TKZENetiRRLOx2krUgGFr+DJRIFMaCPVRU9hS46977ivCBi44xavgYiBldYnh7dBF6q0kDNu6hqYkbzL1rX2gXzRDTpP6rXOMeb1MXNB6tJlX+S3iZ26DdZgIYGvk2XLQNrRJ7JVuVoiLj+NITP8kmqqg3IWpzQx2YPtYnrisbAxa8uxvpgMEyZVFHC3QILiXcWRrszlQVkr7yCys1+wbbZL32VcoRjyGgAkKgNybtY33ffdEXnuKrJi48K6cXJjvM4ITKGgVNmgEzYyRfaIXbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=xcgT19IPGfU9SxLjWTmiQz4396d8XxumcO79inxo9So=;
 b=EgRenUyurpzhtpnsiDTsDXpHrsH7YgngE8C0bIKcVNMHPCttchqZ9p99CTQsM3gfEliuiP7FTmrKtM7el4DsDmCghxfW4LdPGlQh8AF3WK/f8SarU82Z+D0bo/RTmIaPCmEqLavRCFrq/avDxuZVD6hyKBB1FFWjfdLt6ZbDFoQcqihgOUMPkJZgDbpvEU598k3agF4zt5mFf1p575xkG4vM52UvJ1OPtzcvxqlBT9GQzZ27GScrZ+zdt3VO3HmPp/KingStF1MfRRgcUWm+x0fiL5GnjI2xaNCQJ0pRndkbgxRqkFCutEiHSLZiKmpYmZCIkCwLFwJPR0B1Vggz/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xcgT19IPGfU9SxLjWTmiQz4396d8XxumcO79inxo9So=;
 b=1t2o41AjIfE4UePRu3TjnW14CNvxYlNZajv9lKvvow52lNxbBlSMH7Ns/OGSYz7u3NhjVtSBUDBC5OVL1RLn41dIZV8frGADBkbrUK3sjMzbcbrxvb8FG51u7QaZicO9aiyfaVvdnjaCEbwfJwuwdIzmarCUOVlQczPsGghTAJo=
Authentication-Results: fooishbar.org; dkim=none (message not signed)
 header.d=none;fooishbar.org; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5383.namprd12.prod.outlook.com (2603:10b6:408:104::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 23 Sep
 2021 20:25:11 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::94bc:6146:87a:9f3c]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::94bc:6146:87a:9f3c%5]) with mapi id 15.20.4544.015; Thu, 23 Sep 2021
 20:25:11 +0000
Subject: Re: BoF at LPC: Documenting the Heterogeneous Memory Model
 Architecture
From: Felix Kuehling <felix.kuehling@amd.com>
To: Linux MM <linux-mm@kvack.org>, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>,
 Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Theodore Ts'o <tytso@mit.edu>, Andrew Morton <akpm@linux-foundation.org>,
 Mel Gorman <mgorman@techsingularity.net>,
 Peter Zijlstra <peterz@infradead.org>,
 "Phillips, Daniel" <Daniel.Phillips@amd.com>,
 "Sierra Guiza, Alejandro (Alex)" <Alex.Sierra@amd.com>,
 Daniel Stone <daniel@fooishbar.org>
References: <23aeacb6-0cd9-d10f-76bc-3c9d33905daa@amd.com>
Organization: AMD Inc.
Message-ID: <ca132183-e778-4a86-c81e-4d292e9d41a7@amd.com>
Date: Thu, 23 Sep 2021 16:25:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <23aeacb6-0cd9-d10f-76bc-3c9d33905daa@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT2PR01CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::34) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
Received: from [172.27.226.80] (165.204.55.251) by
 YT2PR01CA0029.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 20:25:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 146a6933-9d14-4494-1838-08d97ed03dff
X-MS-TrafficTypeDiagnostic: BN9PR12MB5383:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB53833F7FE1AFE79A9E6C36C692A39@BN9PR12MB5383.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tW0AYKPfVSp54Lhti+QtIXHAG9sh2OaFVrMUvknX0tS+wZi8VpGxBXYX5FcmhYM/QQHag5IelkG7q0vIj/9X1CMfTjnRzjdYaQzel2aB39NpLoVX0d+Q3CYTCtXoFd6s8HoDhYIc12SJbJktfCoBZjnB6iWFuVv5b5nVNrFeYoXfAsHVLocKiAzko135x0/Aiyu3UuLsUkrqjHKaTumsQ3YiBCr7pXw9FGzIV/XWnDw1MkQoiNghmNCFEabbhSYaZh/FFkviRKYWswBAIJtDtzXJm68sXASbUSGW1FjYwEqVF3OEzpnTsUYi25hf20U7pTAvETHFZOyYiNKOLIe1GdwxPZ2ROktFPkU3yryXzv9KLTtZ2oIF2cOBXb7Jhq1OHM/tXQ2Wpr0iMg6Ac6vyi1wnMNNV5SsjYyiMfUa/zMiXGh0Ye56DOcYkrmDQy8DMLqJN4t/UdD1HL0wk5gARDb2w6h3QbvHqS96NoTKf1VO+nThFBGFPmuxwfZ4oHk+5O1sj5jgMonGJZ8Q2uXBW8l5Oz2RVuaOdKokqID7sB1BqwXDBqGcHkQ96D+cg+aRcXHMvO24VcT6mf5B4eRJk7zrNXr2z5SA7NV9zNS01LgPffnOTqsPT969hXhOZdKBWCO/g/xvDh1sUxnPwjxkH+GBBR1IxIHQ6DoS3cVZBG+6NZtvJgtG2i1EtqVq0/ne0xta1ArQqxsAE/tR+Rxu9+zaVOPMGJAuRtcpNCw22rPsWzfapxbTj/qP73M3QGEbsCzlKKeNQ1spzJfPn9yin3giG6GTSMMKdmg9bEH6zF1ubcS2EPZhaIYQMYVBvkv5S
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(956004)(966005)(86362001)(2616005)(508600001)(31696002)(186003)(38100700002)(31686004)(83380400001)(26005)(5660300002)(66476007)(66556008)(66946007)(8676002)(53546011)(8936002)(316002)(6486002)(2906002)(16576012)(110136005)(44832011)(4326008)(54906003)(7416002)(36916002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGY1N3hYc1hjM3JuSWptM3Z1VFRvUkthVFY4Sko5TzlDK0hvcGp3cVZLaWNS?=
 =?utf-8?B?eEhodnV6dFgrSy93RlR4c1BlRnIzSDliYVRYZjBhQ1RCRTVGRmR1NU9WTENW?=
 =?utf-8?B?RDZ0SlpvZkJ3cWFwZlhNcHNBYWFEQnVSeTlJcWd4YktEUFRSKzBBaXZlenRa?=
 =?utf-8?B?MEtFdExUejVTSW9pSjhXMlBNU1poQ1hza3hnYWpSWnBsejNSYStYS1JEN2xJ?=
 =?utf-8?B?WDFCTzVRNGJIR3hMZFJFOFIvT0kvZGJXUXRIV3RBQ2hPdFNzN2VHNjBIbUdB?=
 =?utf-8?B?NVY0cWxTdVZ3MTUwOXowS3ZiNVBvNVJNbWFEeDNsRUt0TjFrY1VWVEtUcFBL?=
 =?utf-8?B?UzhPRU9MWW9ieGM3Tm5teXIzb3RveGI2eHBiY1lFVGhpWkZ3SGlhOS9oL1Ew?=
 =?utf-8?B?VTJ6Y1hnUTQyaFQ2L1JGTUNZang4RWp5SWdXMzNWbGUzM0EwVnFkL0svNEoy?=
 =?utf-8?B?d2lkVEtwVEJTY0lia2FlZ0swOU9oMmJMVThmbGNNUkwwQXRjbDJUVlBLQkQ5?=
 =?utf-8?B?VkZzTWUvMmJGc3NGaGxtTGIrSEJHdW40Y1d0elF5dXI3TXlhUklCYmRVY2ht?=
 =?utf-8?B?YnhLUHE1Wm9pOGJ4Y0JIOFpRakVjOFBkTG1SZVl5bkRhTkYrUVNhTTI3cC9Z?=
 =?utf-8?B?dUJGQ29GOERPekgrcEpveHhaYTJNeWtqaWZSSU5PL2ZRV04zclAxaElYejNE?=
 =?utf-8?B?NU5wQWc0ZysxOXV0ckZZT09uRHpyaVJLNzRZOGJUaitES3N2S1JZWnlPTDNO?=
 =?utf-8?B?RlVtSlZWampGanU4d0tROElWcXhmd2hmMExmQ0VTb0cvYnMzOXVVTE54OFRl?=
 =?utf-8?B?U1N2VUtheHVCOEQzWnBJWlhHcWI2b3d1WGxYZHVWOVZuRHZpWTYvWFkycGdN?=
 =?utf-8?B?MGFmVFhzS2g5U0Uxak5ZSWZjcFVDdUQ3djVoY3FTV2xWNktVem5nMnRMdnpB?=
 =?utf-8?B?UzB1anFjM2NKNFNvSU9xa0gxb1EweHpTWmIvcTZNRGNGL1BhcUhzTmtFd1Jk?=
 =?utf-8?B?RjhpdFdqYUNCM2ZWWmJyRHc1Um1wSjNXekhrVHlRQU9ScHl0YUhyTG11RG9C?=
 =?utf-8?B?cmtzNEliSGZ1L0xVYUkvUjJZdnN6ZklrZEp2Q0VLd1VNbG5XeU9vc1Zka1lJ?=
 =?utf-8?B?eXJmbFJUNTRvM28rQzRybDd5cGNGcUxCd1BWaGJIVitpOE51L3JZbmJFcU1L?=
 =?utf-8?B?VndndnJQeEhRSE5UbkpkQzJOditCVFYxZUZYUzNvM2lNbEJDdUJVN0ZINWpL?=
 =?utf-8?B?V2NteUxzOGlPTk4wL09MbC9QRjZyZTBTZ2gyR3V3UG9kM3NWTE9xbnB2d2dS?=
 =?utf-8?B?TzlEVUNsY1Q4WWk3M2s4YzRMWk9qbzRzRmtmS0RBQmt4ZlBiOW9rQmRYam9X?=
 =?utf-8?B?VDVsR3ZQNWdKaHBYNHIvdGQ1U2hEVm0wT09PemlGcFU0OW1WdXlQdlMwNkxE?=
 =?utf-8?B?YkREek1VUVc5dUtxTzhwNmloUGpBYTZIUUtESnJhYTZjNXVLdHZZSHl4ZUt2?=
 =?utf-8?B?VTVvTFNYdkRqWTFQMUJEeTltSWpjVEYzcUg4QnRwdnNjUS9lNGZ3UUd0UVEx?=
 =?utf-8?B?dGZQWDArdi80K0hndmRhUlQwc2tyWnNpeGRNenRSZTJsRzdUdnlJSW14RU1P?=
 =?utf-8?B?U21ucGROSVI2VGYzd09SdTF3UFplNi9VMFU1RVhzZk5pV3VGekpCaEQyRlNI?=
 =?utf-8?B?VEsrQWxydzN6SEFkS20vd1VmTGdUSnVreUMvaHJmZHZoOWtOWGFXakwxNmpV?=
 =?utf-8?Q?2OLoWE0JVoLP/5201pyXxv6DmZyWiy6baiJ/YHo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 146a6933-9d14-4494-1838-08d97ed03dff
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 20:25:10.9733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ehLcHxEdeuZKbLTDow35BDuHMY0oN0uTtGTlnZj7YZ6naRaBDFedEAn1qAhWyrRz6mg18Pzptd8GpLRhV91uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5383
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

Change of plan: Instead of a BoF, this is now a session in the 
"GPU/media/AI buffer management and interop MC" micro conference. Thank 
you Daniel Stone for making that happen. 
https://linuxplumbersconf.org/event/11/contributions/1112/

It is scheduled for tomorrow (Friday) 08:40-10:00 Pacific, 11:40-13:00 
Eastern, 15:40-17:00 UTC.

I hope to see you all tomorrow,
   Felix


On 2021-09-21 3:19 p.m., Felix Kuehling wrote:
> As the programming models for GPU-based high-performance computing 
> applications are evolving, HMM is helping us integrate the GPU memory 
> management more closely with the kernel's virtual memory management. 
> As a result we can provide a shared virtual address space with 
> demand-paging and page-based migrations of anonymous pages to/from 
> device memory. A patch series by AMD [1, 2] to add support for 
> cache-coherent, CPU-accessible device memory has brought up some 
> fairly fundamental questions about HMM and its interaction with 
> virtual memory management, page cache and file systems. We'd like to 
> use the chance of getting together for a BoF [3] at LPC to raise 
> awareness for HMM outside the GPU driver code, identify gaps in the 
> architectural documentation and clarify our priorities for future 
> development.
>
> Thank you, Daniel, for suggesting the BoF and getting it scheduled. 
> It's set for Friday, 10am Pacific, 1pm Eastern, 5pm UTC.
>
> I am registered at LPC. Daniel got a speaker's pass. We're still 
> trying to work something out for Alex.
>
> I hope to see many of you on Friday.
>
> Best regards,
>   Felix
>
>
> [1] https://patchwork.freedesktop.org/series/94611/
> [2] https://patchwork.freedesktop.org/series/90706/
> [3] https://linuxplumbersconf.org/event/11/contributions/1123/
>
