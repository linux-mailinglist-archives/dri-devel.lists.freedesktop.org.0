Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19201ACAE1B
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 14:34:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 384C110E511;
	Mon,  2 Jun 2025 12:34:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tpy5EAJV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2042.outbound.protection.outlook.com [40.107.94.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24CDB10E511
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 12:34:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xSiH1JVwenGAc2Rbn9tT9eqzAUoMxNJQkw3GoGD8SKE2fAsG2CaJrXrud1IXW3KyQX/Z6ZmCj6Ngno7eBXfttOv08qQM5lNMCRVH3MHCdNxttcsFKwHjO1l6V4voNg2YNNHyPUV4Tt3FvsuofF6MSauPB5Qt9AwZemE1+RZ1i0sa38RCcbRm7B48T7/sjXGfXSMXuHpSPF4YYJ2JuyApaiaEa3MAXtgK84N4P4bPGY5rfSxWB+T71OFmVTe0Uw3YcXA9P89f/YBl+vCoZSj6a9xG9libCdlG3Mayfk2tg+pDCo9sEGHS21eU32sta3bmeBnFmhcsxbhoQwmXYbboJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1IzTjhHKkt9y2+0ujG+2aCtodJ8h0pX95XSA0CRrark=;
 b=dsEihLW1G2yQv9xs8qBTfoNVsE+sT57+2rVMANyJSg1phFTt0Bm8OxUxXmyzbW/CSaxRCPFDlINlHLUwZh8nxA7dLGi5NrIJHOr8Bz4+i6IpIfzZTDaLjuR55f+aPQoLeA5iYSOYFFuLIEqITJTz1mA0MIXdrJxAyAdaHoOI5zSND64kcH4jFQ8anf8NC8tLb7EIV9ZfWYhL9omq6f435A00yixcDzy2Eme4bUbAL0oIYHnaFubzS8D8WmjcigA6PQHwD54vt8nWbdztAc1wjsDyyWwF4mCSN+1wcwePlqk1odVa2sSQFYpNv9A9/VdXrDcGVvTlvemv3pIJaplFxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1IzTjhHKkt9y2+0ujG+2aCtodJ8h0pX95XSA0CRrark=;
 b=tpy5EAJVhJWk30z7kjeOxGYaX99zYmSH1cPKksbCs4c4QAqKI8TAfTJJyMYX1e8Zc/PJcG31hgYMbKNM8H/3azLh2muxrZuheGssLCHvxl3MukueJrNzc8NUUK+bLfoZYL9o4px45QhBrSeCNqfq/oZ6laPj9mpYoX+aVkCyKIs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB9472.namprd12.prod.outlook.com (2603:10b6:806:45b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Mon, 2 Jun
 2025 12:34:05 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Mon, 2 Jun 2025
 12:34:05 +0000
Message-ID: <81bbe3d3-668b-4bf9-b4c4-a71b3b12c26c@amd.com>
Date: Mon, 2 Jun 2025 14:33:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: Add forward declaration of struct seq_file in
 dma-fence.h
To: Herbert Xu <herbert@gondor.apana.org.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <aDlu5TGyA1WuMsvw@gondor.apana.org.au>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aDlu5TGyA1WuMsvw@gondor.apana.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR06CA0011.namprd06.prod.outlook.com
 (2603:10b6:208:23d::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB9472:EE_
X-MS-Office365-Filtering-Correlation-Id: 00fef4e2-7e16-47f3-f57e-08dda1d1c338
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGc3WjdkQVFqd24wTnFuUGdvcGcralpvZUxZMmhScXVGNzBPUFlkTXRQd0hU?=
 =?utf-8?B?SzNnQ1NhSGNSNm1JU00yOU5mWFMydkhQVlh2dHNLM0pOWnhaN2ZsVmxlUG5v?=
 =?utf-8?B?YWZlR1JobHlvZDBCcFlBSTdsQUFiL0wrZzFBdGNlSFB1NnlCREJNNjUyMTlj?=
 =?utf-8?B?Z3VUVFJScXpuc2d6RnQrS2RabU8rMGtmVVE4clhTYWxEdFZNZ3J6UUJCSnU0?=
 =?utf-8?B?LzRza3pLS0NiL00rVy9oWWpCSUtQUG5VY01NSkRMbGZySHpLYVp2RGwzYjdQ?=
 =?utf-8?B?bW1VNDZrck9jT3BRSDJTWHJ3Ykp2Vm1ISjI4YjJub2poWldob09RRDFJRXBF?=
 =?utf-8?B?VEJ0OWJEMEhDMkg2cTNyWVFMWWFHVkNZT3cvZlJZRkxQdU5abzFkc25MeTRk?=
 =?utf-8?B?SlRFdzJJb2x5N1pVUThQVDJLNFp0R21HcjlON3NXeUpjdjNPVzd6QkZpN1JE?=
 =?utf-8?B?alh1MnVibW9IWHNmeExEQVZOMlQxMDFwbFE0VVNHT0Q4c1B1SGFPK2dGY2tv?=
 =?utf-8?B?L1dPVzRPMm9keTFNb2JXUGRMbGpSd1RCQ1ltRjRqQWFZYm9jV2loREF4VDJO?=
 =?utf-8?B?dWg1VXFOb2FMNXo5aldQMlRIVjdUc0VLdEpZemFRMmZ2MmgrQ3o4Z05wRUFM?=
 =?utf-8?B?UGpFd3E3ZlJmQlhVV3lvTGhlVy83NW41LytKdTBXZmR6a0prU3EwSTI0K1pt?=
 =?utf-8?B?SWRIZVVBUUZvRVlpMWd0VlJicDVlRGMwdDUzb2VjMG1YanZpRVBzWU5yV0g5?=
 =?utf-8?B?OXoxZXBJMkZ3eklrYmJPSFh2allxTHR4cG80cG80TUxmYkJwS3lwNE0xOVRt?=
 =?utf-8?B?MlQ4eUZnWnZOZGpKY0x3QnoyUEFKNHAxQ2lwZlZLUWJEMHh2VmF5VFQ2cXY1?=
 =?utf-8?B?d0RVb3dkN1h2NmpKeDFITjM5NTdPelRhRWxuWEIxdkxpUWdRSHNWQld2QnRL?=
 =?utf-8?B?MjVBS0JYdkVjdG1hL1E0L294dURmc1d0S2ZYYnhIZEo0M3grT3kwRitxVlJ1?=
 =?utf-8?B?QUhBWDlVeGJKa3VWbFBxd2FvTFlUNStOZFpRTTliaFUreWdlb2RCRXk0UjlH?=
 =?utf-8?B?cUpxa3E1ZDk1NVc0cFRZanpCejQ4emNCaHhmWG9sQzVjTW1zQTQzeGNvdE9N?=
 =?utf-8?B?a3FFeTBJTkxVU0krUDFTQWZQZjBRem0vbklCV3dmR3JsampscUZldUwxSmZO?=
 =?utf-8?B?cEdqalpGL2xld1dWNjBPNWFpWmFxRUxsSHlVUm9CRUtheHpNbWdJOFJDSVFq?=
 =?utf-8?B?RDlQSmQrUEErTXRRemZ0akFlMzI4anF2VFJyU0hqQzM0WE1kVG92NjdWNFhL?=
 =?utf-8?B?cDdseEpNaElmSFdpcnFkM0RodmFmQk1DWDVxZFZwQXRiUTJnbXJ1azJqR2l3?=
 =?utf-8?B?ZDY0QUUyOXNWdTkyMkljUi9zQ2swcCtYZHZMWnE1TkZqdHc3dnpabW1hMm80?=
 =?utf-8?B?ZEhoY0FFRmc4bEkxcVNHcWFyQmxMbExQS1JRQ3I2VlR0R1VTVEx0ZyswTzA0?=
 =?utf-8?B?SXVkeVB1ZHE0cUV6ZHNRUWM3dE1Eb0dzRWRwM1Bod3UxZXcvRmFFN2VPUy9i?=
 =?utf-8?B?UTdjVjc4RE9wZDU3OVZwanJKZC9OMndIeUphOGYxYStYQjlhYVBWZ3o3d0xJ?=
 =?utf-8?B?VFM0VHk0N2p2QnpUSGtSbHFZck56dFQ5K0x4TW1lVHorZll2Sk1Vc2V4d0lJ?=
 =?utf-8?B?elh3YXdsWS8zQ2hCTkNCcFJ6WnkxZVZLSml1cGZxaXBKWCtGb1BOZmZUd2kz?=
 =?utf-8?B?dlZ3RWVNVllReEg3K2FyOGN6MVpJTU5sRkpTNkwwcDVuU0ZHRnhYcGhSWTdj?=
 =?utf-8?B?Z1ZycmxDS2dzcERWZGxwMEJyYS9sZ1VHTEdYYmw3anhOQTBHTmdPS0JrYllJ?=
 =?utf-8?B?QlRIeHZ2MlRYbkJMTGJNR3JyaExpU2VzWUhzUUpXbDFaa2N0eUN5TjFUWWtJ?=
 =?utf-8?Q?awyHA1DLUOw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEFFdmdKY0YwY2gvV3FuQjdIMFpoYlFsZjExS0wwd0xiazVZcTZwUFBkNHk5?=
 =?utf-8?B?MUpleWxvK09uR0h5MXVvbGExMTFEY21UcVBPcDFGalYvakd0Zk1iQkR6MHBU?=
 =?utf-8?B?Y0xJOU1CSllzcHRwcUJnc3dIR0xnWTJqZk9ZdEJaOFNLRm44MXhHQk1zMVNB?=
 =?utf-8?B?Vnlnc09EWFpKMmp3bHFHa0ZIcHFSU1lPT2tldDhaWXAxdEQvWlJnZStaaU1x?=
 =?utf-8?B?K0RkMFduWWJQMzFMY2ZYTUJmZ1Frb280RGF6a2VQL1JZZ09SYWpTNi92eVAx?=
 =?utf-8?B?cGNoUnNVamcxMENDNlhPTmJyTFJpQU5JbVZmRkI2cmVnMWpZc1hVRE4rTE9o?=
 =?utf-8?B?MlFQK05Td1o2aEV1UFRYbFlwY3NHMkdaRmRyVzZ5aU5VY3d2SWZZaUxnd3Rp?=
 =?utf-8?B?djFrVTlFd2JoZXFqWmtpdGxqejVQbTgwdjEwWXIwcnpGc0l2TWcwZnNhZCtz?=
 =?utf-8?B?b2JZZEdvYVp6MldOaGdwSzN5VWxPY2cyNEw3Z29CQmQ3bzVQd2tlWSt2bHNt?=
 =?utf-8?B?UUZqVUpUaXpnUzRHSjJFRXNnc3pva2xYNFdTcHR4dnZua3U2dVNORGdOcGZX?=
 =?utf-8?B?SDk1aDZWY3VNNHpKWHJpcWRCNlJpOGJtNjZkOUVhMkw3c0lNUUxGVGtpYTdF?=
 =?utf-8?B?TGpiMlVzNG4vSi91ZmY3WjMwcVJKYlNvZFVXdlRmT3B3MVRTcG5rTGRFaU1J?=
 =?utf-8?B?SnFyZXJRcFo5Y0ZqWlVDSlZ2bGFSRUVtbUtwWjcvak16QVVQenh2NVRINXZ6?=
 =?utf-8?B?WjMySUhhMWRDUDI0OVpoaVgyYTRDaG9iNmVpcElNTnpRanlFMFJGRnp3N09h?=
 =?utf-8?B?eUFFWUNhcFJJbU5zWGdUandRUUs4WWtZaGdUN21ZTEZ4MDZhZzQwWUk1Z1dn?=
 =?utf-8?B?S0RjM1NqWkREamovR010U0dPd0tEeE02ck9BRnAwK3RLSDJ6dktmSDF6SkNW?=
 =?utf-8?B?ODdNRXJnRXVjdnQ5L2xpakZ0Lzh3Zit1SkdLTXFyM1ZESEx3N29KQnhhOHJr?=
 =?utf-8?B?V3VpN1k4QkpESDZ4VEtXUXF5NG1SSEZVT1hsODl1bTVaa0c3ZnRuK3hoVS9X?=
 =?utf-8?B?a2lHdy82M2JuZXpFRHZwL1FHVFpHVmJIWVNaWGM3NmNENEZVb0lkY0tXbW1i?=
 =?utf-8?B?ZmF0dHRaV0hIV3JBM3dUUVRnZEZFdkRTWkVHaWdNaERnSjZ6QzdoQitmNVlO?=
 =?utf-8?B?VVB5a0hxbm5sWDlCdzJGWWtXQlQwK1FBRnN4RFl3cnRmU3l4RSs4Ry93M3RL?=
 =?utf-8?B?MEY4cE42cTI4dGl3RGRNZFA3bVJkRGxIY1ZCN1BaMGt5N3hORGpkdTJYbmNW?=
 =?utf-8?B?S014eVFDamVQMGs5Y3dXdmQ1UVRxYWcxb3k2SUtOemZSSDcrSHpTUjJaTnhl?=
 =?utf-8?B?ZjZmeFZZS0ZtdE1udUdLYmkwekVsSGwwaUdZdnRzaCtTQWNMN1ZuTlUrUjFB?=
 =?utf-8?B?RTBEeEFSQ0FDUExMMDJEWE0zU0V6eDVLRk1oWEltVy84NlN4eGxneitYWVVa?=
 =?utf-8?B?REJ2WHRRbU96bGxYei9OcENaeEo0SHBwUy81QStqNTdXRWxQTWJtRU5aU25n?=
 =?utf-8?B?ZE9RVytWZWg3cUxrMDJGNG4xNHdlazh4UnVpaWcxUCtjNWlHVUlpdm5jS1Z6?=
 =?utf-8?B?R01YU2ZGbmhqN2lUUTUzSkZZQmVzYlJ3VS9aZnJDSzFyK2lmWGtLYzlYWjI1?=
 =?utf-8?B?TnpDclFEa2pwN0l5d3RYcEMvWURwTkJjNEdINm44U3JuVXMvZ0s0b1d6Qkda?=
 =?utf-8?B?ZXBuZlQ3cW9ZU1dHTWF4Y09kblBFY1JnUUNDc1VyaHF3U0VxemhKRWVJRG9O?=
 =?utf-8?B?alZkZVNDQndOeGI5R0ZuZ0JyTTQzN09NU2M2TzJxWVVVZS9xYko1a1pmTkhF?=
 =?utf-8?B?OWJBbzVjbEkrZ2Nrb2wxTnBtV0VOMGp6MVFpK2tFbUJ5eGhaYVBLZlhkcTJW?=
 =?utf-8?B?MEwzSWllak5nOUJoY3I5ZzFRcjBnQzV4TlVZVksyVXNWUUtIbEd6aksvV1ov?=
 =?utf-8?B?UFdDUER4bjlXYnpyemMvVHhiakRIZEc0VGpmdS85QzhhRW16STYvazlaNXRq?=
 =?utf-8?B?VXAwa1kwbkRYK2MzdmxRRnh1Z0hMNVk3c1pHbDIyakFJMEEyQzBBY1RKSW9B?=
 =?utf-8?Q?F1IfHhsNpq7GIIrGkvOh1TBgV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00fef4e2-7e16-47f3-f57e-08dda1d1c338
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 12:34:05.4269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A8koZ9tmvHbUhrM9f+Sd20MfhfJ1e9bkf/4LCLIo3IARJTsVAohnNejd7AfZ/rAr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9472
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

On 5/30/25 10:40, Herbert Xu wrote:
> Add forward declaration of struct seq_file before using it in
> function prototype.
> 
> Fixes: a25efb3863d0 ("dma-buf: add dma_fence_describe and dma_resv_describe v2")

I've removed this fixes tag since this is basically just a cleanup and not really a bug fix.

If compilation would have failed we would have noticed that much earlier.

Added my rb and pushed the result to drm-misc-next.

Thanks,
Christian.


> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
> 
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index e7ad819962e3..b751ae49d007 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -26,6 +26,7 @@
>  struct dma_fence;
>  struct dma_fence_ops;
>  struct dma_fence_cb;
> +struct seq_file;
>  
>  /**
>   * struct dma_fence - software synchronization primitive

