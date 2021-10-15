Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C6E42FC1D
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 21:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 441B36EDBF;
	Fri, 15 Oct 2021 19:27:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C6F6EDBF
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 19:27:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a7GrzTvoJtHrab7H5ZHeCce/IM2vi7xhi0SYWyd6gH1xAdqADNkU7QG1wzPZ3WD7CX+kWOAcbh4nlQc0djy2T3oRyWPx+1Bnbilu3sVyd4TCThbzAm/xf/TPYXly00Jjf5U45nuiWwZxHs5BKPpOw5vZmdEQ+fzt3GH6t3IF+BZTNUb1B2GaBZaWapYRdcteYiIYVqzH1R4qnBgsthCmRH6nzgK/FPpFoCpUkwa7pBfo4o/ui9XcsQw3bVi5i+4700MD7LaYuY9j0VdeJMYaqIq4AlgFJWFdDl3ogYd4IFwXHtGnmzzZxdxsBw6zdtYZps/PbObJOPnFSD3AiiWcaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pTSv7kdDhn3B673SW9d4supg6JWHN1h2Uk3h1igbh+g=;
 b=LCErnJc39g4m+J5WrVklo5qTEMqj1NZMeYhcAZlB63vX4WM/N7NZhmQDp7Ei8sV8OcnIh6gnAFwaCbbRJO1IBaJUXloYAJya4Rs1vh7EqMEA9ezOfk2KlF5WMvqDgFY5SonSxWEdbcfewA8aY37jHrwYYFxiGf0g/Y01caksASPgtnGbdxuz9/Q2ExxWfVVkx2n7eUEYGXH4CH/qLhCfA4/4hEJRS3B9dg6Zloynaj8D94WuNDmAz69NdjWv5o1eoq94owDXa+/Im0He+oPy0Z4LDRA8p4Wo3ZHil2PQRc65pUYxLuqbjF6EtFgcpxxrbbueo7MjdFwRnNmAhf03Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pTSv7kdDhn3B673SW9d4supg6JWHN1h2Uk3h1igbh+g=;
 b=2MCWwtrps3/FLhtl4p2d9wcnSd4fCeamAXTDQMnosAxxzm0GKa21LvStd6XtdZI6rY4+KKxKPSQzEnU/W7seXCYOn+Z3oU1l2PiLZCp464GejaBYsY3wNBMMsIi3k27xXr737i7p6luHAfjCjFs2VyHSH/HhM52DJRJikNv6mLs=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3505.namprd12.prod.outlook.com (2603:10b6:408:69::17)
 by BN6PR12MB1889.namprd12.prod.outlook.com (2603:10b6:404:105::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14; Fri, 15 Oct
 2021 19:27:43 +0000
Received: from BN8PR12MB3505.namprd12.prod.outlook.com
 ([fe80::704c:60ed:36f:4e4c]) by BN8PR12MB3505.namprd12.prod.outlook.com
 ([fe80::704c:60ed:36f:4e4c%7]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 19:27:43 +0000
Subject: Re: [PATCH] Revert "drm/ast: Zero is missing in detect function"
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 daniel@ffwll.ch, ainux.wang@gmail.com
Cc: dri-devel@lists.freedesktop.org, Chuck Lever III <chuck.lever@oracle.com>
References: <20211015072546.3705-1-tzimmermann@suse.de>
From: Kim Phillips <kim.phillips@amd.com>
Organization: AMD
Message-ID: <bf0d8c37-188a-f49c-d0d2-eef3de366d78@amd.com>
Date: Fri, 15 Oct 2021 14:27:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211015072546.3705-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN8PR12CA0021.namprd12.prod.outlook.com
 (2603:10b6:408:60::34) To BN8PR12MB3505.namprd12.prod.outlook.com
 (2603:10b6:408:69::17)
MIME-Version: 1.0
Received: from [IPv6:2603:8080:1540:87c:25b6:cfad:ab64:b973]
 (2603:8080:1540:87c:25b6:cfad:ab64:b973) by
 BN8PR12CA0021.namprd12.prod.outlook.com (2603:10b6:408:60::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Fri, 15 Oct 2021 19:27:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 686ecd7b-5d81-415e-e8b1-08d99011dc51
X-MS-TrafficTypeDiagnostic: BN6PR12MB1889:
X-Microsoft-Antispam-PRVS: <BN6PR12MB18892DC41677589F7D20CBDC87B99@BN6PR12MB1889.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:398;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2kGX5Jp7/Be3BEqQ5cyLcKznIU3T1M+JsF1t1nl+Q85vfeDCn7YNQXJFd1xI+lMthSqLt8J5Wy5fmSTLMejOji1SE0r8RoFRoyAWPTrXE+KnXlawo+gcMjpSa5Hntm0M6A4V5i/CCztsN5LRnDrTrIGqYYVoyhLnBUaRwgAVSGmGfopaYjZe/lDS9mw+PRNpderOHDZ4wf9oZBofGM819+8mfScwLtdtL9JxtDqZQGhoGfYxRtqiUbJBKVxiKmbBQgGoosNPDVdP6AYMRrxomEsLI57kTVh7F/8a6DaJ7hkrtCwSRXMIVrOyfxWxQ8Ep/DUbHHEqLSvEsRJf4IyuZ6EGB5kmg6b6pne6OVQhubpPUPJ3EcsSoOftMhybegG+kBha7BH2Re+QxgSoJkOhtGnoY5ZKHxyTBj7IHd0wAIoZIQDL0wafpfQ4arXHQuBh8elUo/i7YXa2sbYn4aa+U3FFU3+eLkxyKYN5Eg+Hc2AIfbB42iIvmr08nnO1OyCw7HcDLYYjcfncfJUmMmCBjHGWADZZI/AEVfxnIc15tr8tCTyIgHdAcwZYy0fs6HPDiICzt2R7PjosYpcI8FzH5gYdIx4DOkR1CpYfpjNZW95eSMsC/SJWNhNP09JL6BNmjleZTQxBHmuWGz4BepxWsNNZHpYyJ9JvRzhHUE8+W4B90CDBUEeNjFlQEAZcbN0WCVGcBil3xPrACWhj1MEfag/yrYWviFvIKSjfQ1cRr8MHzkZyJn8pDmSZASlWk1lxMH934THt/yiS7ZbANEWVJrdcdTQfyCs41s2ILWXPfSPmwWkBwYbW1JTAoHsWUX8v
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3505.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(316002)(966005)(2906002)(66946007)(66476007)(38100700002)(66556008)(6486002)(186003)(83380400001)(53546011)(4744005)(8936002)(86362001)(2616005)(36916002)(508600001)(44832011)(31696002)(8676002)(4326008)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0JLMDVCNitSc1hLaWJPREFKY3Vic3U2WHBlc3Ivb3RWUXRsMWtxMTVOTSsv?=
 =?utf-8?B?UG94UzVsbzNYQ2xWR1RSaWczR09UNy9sRnVUSXppbWxHQzZRMjRkQ2hibXgv?=
 =?utf-8?B?WnFJVUNBeWdtZlprdXVOaFJhOUQrN0hZQk1ZWGJRdXRPUjVsS1ByUTBtRmJq?=
 =?utf-8?B?SVFLa2hJK2VmTk53VGQ2YWtIS0NOZHh4TUQ2QUZaY3ZpSk5haHJ1Yms5c3VF?=
 =?utf-8?B?UnlHcUVZbDFLS05PL2NIYnpkeGZxZGRiOHNHUzM2STdtM1hSSUhUZFU0QUtk?=
 =?utf-8?B?bWFJN0U3RXB2dG1OWDFOZDlZTDZCN09iZG9JeFJQS0lGc3FMdXU0ckVqQ0FD?=
 =?utf-8?B?bTVDamtnWWYvQ1hOM1hMamxxSUZJeE9oTGJvNFFncjBjNzJuUkk0ZHVZbjEv?=
 =?utf-8?B?UFNSeU11eisrTEIxTTdlV1VxbDlQQko3TklZc0UyTWFaWmhOVHVwRFRaZnJV?=
 =?utf-8?B?Zmo1RStwUFczUm43cFEzalBqemhKWitPekxoeEllS1BKNkIxZ1ExcU9wc2g0?=
 =?utf-8?B?TGwvc3hrQ2tJenRLemtPZHVsb29mdU1LNzZOdEgyNmRIUDNDN1hBVTFoUmpy?=
 =?utf-8?B?eDBoY1NqQ2ZXdzRVTkdwVzFIWUZEaTZmMWZvSitUbUcvWFJvV3JaU1M5VGUv?=
 =?utf-8?B?K3hmNXgvRnVORXFHYzBTdzlIRUtEcXI3U1h3NDR3TTQ4YUhrbndKRjVJc1Zq?=
 =?utf-8?B?M29ndExpY3RDWTRBMkxhMWp4QnVsMXRlSEZ5eTdEbW5FZkNTWUdjRGp4OFN3?=
 =?utf-8?B?Ylc1NzJSUWxOcTRsZDU2SjcyRDJFdzl3VGlLbGJFem5YL2g3OVJSTlgxNDY3?=
 =?utf-8?B?M2JFbDczQjBVcmxmOXFOSVBmQ2NkSlVUcWhuYmdjSTIreXVFUGdRTnR5YTVI?=
 =?utf-8?B?ZytFRTZSelZQZXZ0NkxBd3JBMTVsQXZ2TUsvQktQTTZHMFJoay9tM1NDMDRL?=
 =?utf-8?B?Y2V3MEMzZnR6bWtweGwwZ0tSWkExVmFobTFWT3FDTUhPcS9yR2NpVUZKVk5L?=
 =?utf-8?B?eHQ2cFBtZko3ZUpKbXBwL3V3TlM1QWxDbUtYczRVOG5GWlFkUUZxWDlTSEZK?=
 =?utf-8?B?eWFZNVMvZE5zWEFkS1hlMXF4L3JyTThlMG9lMXUyVlhFbnp6QkM2akpxRjMr?=
 =?utf-8?B?dGxjdUNSWFY5cUFlcTZ6eFU1LzJqODdseE8rYkhldzdhOStPWjN0dTRpb0hQ?=
 =?utf-8?B?cnNOMWxWU2lJYTJHSnhzcW81ZHBhQjZmTmUxNS9kYXQvSjFsRk5XWjQ3dWFt?=
 =?utf-8?B?OXVBekE1TWdjY2ltakY1ZmNiSXlmd3JjOTlLRXZJbzZqWEQwQzV4dlpyQzF0?=
 =?utf-8?B?RHU1dDdXVTExUHhsTmdEZ0VCbFRPWWxJbEtXNDBvUnR4b2ZaczRaZXFYdEcw?=
 =?utf-8?B?cTlzNjNrckFSV1dOZ08zS2ZJamJBME5NeXhmYm10RGFSQ1FzVnpYY0lMOVA4?=
 =?utf-8?B?S1ZKQ3JqL0tad1NJRlpLQ2NrUEJLVjZiSmNRTVh2b3ErbGZKZmpRUElQMGZw?=
 =?utf-8?B?b1kvTXNiSWl2aVZPbXFhNEMxRU90NWtqWCtPUEdFaTc2UUxlSDNaOHI3WmxU?=
 =?utf-8?B?ejJwSkgxTDVqRU9mYzV6MityN2VTbUEwbHNiN1JKdUc1aEZaZldmR1NVQ3J4?=
 =?utf-8?B?SGdjVWJ2TUtaOWpycXFRK2gydUhqYW5KOFNuWGtEL1pVb3R4RG5kS3YvWFFr?=
 =?utf-8?B?a2F1RlFySzB4dDhDMStaZXlPeS9UWXNKWDNhM2FqUHU2U1kwQlMxR0R2QjM0?=
 =?utf-8?B?bHR1LzFDaVNXSlVrbUhvaUdQL1YvYnlHOFR2REh1enFpOVdKN0tYZ3Y5VC8y?=
 =?utf-8?B?dUlSWGdLcTJmRDR0RGViU1RWeEF1ZndGaFdqVDBHWjZWbnJrUmJLeFV1djgv?=
 =?utf-8?Q?FjNtB6zN2ST5b?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 686ecd7b-5d81-415e-e8b1-08d99011dc51
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3505.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 19:27:43.6104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SlzUHjk67xxrMYELskVKRGgUjfd5PC06gGo5lh+B5SaKXzavwRoHPAlF6VlStLymqym+xU/5NB5uIF8Nm9ulCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1889
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

On 10/15/21 2:25 AM, Thomas Zimmermann wrote:
> Commit 572994bf18ff ("drm/ast: Zero is missing in detect function")
> prevents some systems from booting. Seen on Supermicro Super
> Server/X10SRL-F, BIOS 3.3 10/28/2020 . There's further a bug that
> results in
> 
>    KASAN: use-after-free in enqueue_timer+0x4f/0x1e0
> 
> which is also triggered by commit
> 572994bf18ff ("drm/ast: Zero is missing in detect function").

That last statement is technically wrong.  Like I said, in my
case [1], the bad commit is commit aae74ff9caa8 ("drm/ast:
Add detect function support")

Please revert aae74ff9caa8.

Thanks,

Kim

[1] https://www.spinics.net/lists/dri-devel/msg318039.html

