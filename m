Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 357CD426A75
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 14:09:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E426F498;
	Fri,  8 Oct 2021 12:09:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2057.outbound.protection.outlook.com [40.107.236.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFCDF6F4F6
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 12:09:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MnOEDJJxg5fEe4C3c9ke/EabfS2vQTJyQINxo03LFq2Pw1tqPkkBYiP6oJnXOiP3CwOIgEoCY2ZVXIZLgUx34O/JAre9HvWEOkVoGKPhOkRt7yGeCZbyC3ox9TX560cFcSZgCtRrgfdbU4oJ5Lvxnz4tBsCv7QcTxs1v39Y3SZ803Wa27zXNitMLUouRCEPVSI7ccx5Y+GYJ70ibKy7i5589tbhlJpQhX1W/hzlzyAV110JvN2b+QI1PB1AeIDrYYckuzhs28+HKwrHXj4yGOGI6VgYvQgq1bC9EgAC1mZp8kjqTEU/95a5xtylxLi7o57pfFgMPab6vcWG27zIT7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQ0KpMwk1JliJS0/bq96FOQZWZ/ub7h2PvPqj8HQxAo=;
 b=FKNduYc0hoIOax/8sWhR0E8fq/9om3PFoV19PKzO6OAGGsHbmTQywZ/BG2B9jxtW3mO6k38Lk7HoEojXdrYZP0rZL4FdNIaZMjdWXiSNFNLkYBLVeVo7O2oW4H7dL0BG3EvsitfmJ02dCAmtqk+irJAhl1JGxFX+2N3SdTh79pi/p0+g2YAiSDaY8jpNFrbO3naMzBy8wmb26DB8eG/bldJnYL85OFCo7f5JtwShWIpK9H120uKEO+/q7nrpWSp1PDnChEWOIfk1S6LrhE0tNUrHs2tGAx/UaJ3YF5pvGO5zgBp/XxaXnvfMIMgkQGOhFkSVwvOHSXn2rWa+fShIrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQ0KpMwk1JliJS0/bq96FOQZWZ/ub7h2PvPqj8HQxAo=;
 b=bjdmV7NrW5NTfYG9cQjaRqfck196ufHaHoF8vTMwlRVGK8Aw29VttSWS9F0gDR2mNI56KJKii+H42pt+sTtLOBXsiak4nhtu7d4cI8XWEwvCRyJLAqOdZ9BhA039njdqMcXdUgyfO+tD6cbz6Ce47IS/V6aXn77veYEw5Qs9Aag=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1213.namprd12.prod.outlook.com
 (2603:10b6:300:f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Fri, 8 Oct
 2021 12:09:49 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 12:09:49 +0000
Subject: Re: [PATCH] dma-buf: Update obsoluted comments on
 dma_buf_vmap/vunmap()
To: Shunsuke Mie <mie@igel.co.jp>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20211008112009.118996-1-mie@igel.co.jp>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5ae41c5a-0ff4-5a82-2100-56bc415b5638@amd.com>
Date: Fri, 8 Oct 2021 14:09:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211008112009.118996-1-mie@igel.co.jp>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM6PR0202CA0053.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::30) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:efac:61bc:bb73:d6b5]
 (2a02:908:1252:fb60:efac:61bc:bb73:d6b5) by
 AM6PR0202CA0053.eurprd02.prod.outlook.com (2603:10a6:20b:3a::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Fri, 8 Oct 2021 12:09:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11843768-652c-4cae-003b-08d98a548634
X-MS-TrafficTypeDiagnostic: MWHPR12MB1213:
X-Microsoft-Antispam-PRVS: <MWHPR12MB12134B00704D0EB38EF373F783B29@MWHPR12MB1213.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kNKvwlQD/hA0cHX295SWTM5nFZ0T1HVKv4AZcT+M73Bq9cs4HhIRLoJ1mY9QebXctk7UTQddFSjacZlxnZyV+U9ZfMKBtjnbBxvIucOhHADDPejA4mtkWL/0DQpWBMGP5egggh3Us6gs0tYs0Pteft86M9GY0Rbi9L7VvWKt8H6FTDC4ksXVfgtn3HWPDWIolVpm4Q1y54v43Rl5PGFiVi3uPKH3MG3TVtApo8lHobGkYaKsw9uNcQXMIjlOAv//2tf8lQW/7Da+v2uzJ1FrtpwpsGHJW2KVndW37gOpr1QmsZbUBGNELnPG0CchgqN8OrQmy+PkwfxkMr7wxcfxwuR77AhcAIm3H6FcZ9CpeEw3Dk6jN26TEg0IiD06S9adPQLY7VEdmJv3Xmn5ZWQASLzQErIsrILxbpLZppgs6gGHUZ8836NXqsvsgGsvTfUYnsx66NwW/iJCyXxCB6Qbx/7FzPhf5h9H622tsujECAgsVss9otL/7/e+wWiBjjM1bxSwyVyXCIUx5EGw6heABSL3WTmRMT0lyAlAPs8DOK6Pxc1DEfD0AlfP5pT9KvfQxPz3nOsKWEtAv+4K6KZs2CoqU8ZEhiqLrApZ031LsvbgwsvugKrbWaxAVtitTqb4YtWhlJ7zUM742Y2q9QwTF9hPIRab1bH6mnjkfZ/sWsF2/2uVrabpfmynQO06HoTL20UA2G+o2H2cIHuXEIdRfvJmGpwsw2yLfGaELAZrXqjqGKgPuJrYtA9ZOPPR6eQM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(31686004)(186003)(6666004)(508600001)(83380400001)(31696002)(38100700002)(8676002)(5660300002)(2906002)(110136005)(36756003)(66946007)(8936002)(6486002)(86362001)(66556008)(66476007)(4326008)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUZ2YThLOVNBVjIyanE5MFk3SndKRTVRdWo0SC9WWE5yZmY5OG5LZXlmUWhy?=
 =?utf-8?B?US92WDd2Z0U4Z3p6eHdrbU1zQkZCZXoxcmFLTUlDS1FJVVVORE9LZXplejhi?=
 =?utf-8?B?bHMzK3lMSnJkc1ZKNFUzRy9STXVyeXNoays1MnlEUzVxSy95YnJPV2pBcXc3?=
 =?utf-8?B?NU1oTEhmNDU5dHFRdjJpWWtaYVcwRHpLSCtxdzBlMU9rSnUxWmtaNUhGSnQv?=
 =?utf-8?B?T0dSZVhVL3FidW1iZnNkMU9ENlRqeGN0WmdnbUlqYlhRUmUvVytPam4wQlYw?=
 =?utf-8?B?V2pMN0JiNi93cWFRNGN0dStpSzRsbW83cG94elhRQ2RKY1BkV2xleFk1dUZD?=
 =?utf-8?B?L1N3Vm1ZbzlzdmEwbXM1eHFDVXFpanBBekY3N0w1WVFhWDhDU2pSNmZZVkk4?=
 =?utf-8?B?a1paekkxU3pzQjhPTWF2V0FNWEpIRDkrcEZPSGs0Q2NaVFhUeWJMMGhleG9i?=
 =?utf-8?B?UEt5Mk15OURUb2xTekFqaGhyZGZVWktoR0F0dFE2YUZvWmRxdjdCUll1SitC?=
 =?utf-8?B?YmMvN1VoUUxjTWp4ZllsZHUxMTM2b2M2cHBDUEM2d2tFdW9PUWhoYzRyTVVh?=
 =?utf-8?B?V21yVjNXVWVBN1FMZW1ickRPbFRKTkhvSzBud25GZVQxRitGVEcrbHBJNDhn?=
 =?utf-8?B?WmNUWXZmejZ4TGY3N0NmV0MzSS9iNVZvdmhpRGlpbndPZUZnVS83M2k1WEV3?=
 =?utf-8?B?Ty9tb1FseXFkTzhCcmxUK1gvWm5ZVGxCSmpIbkZNd2E4dGM1bE9mREZTSFMw?=
 =?utf-8?B?MVV3Wmd4c29lajZWcWRUL0FhVTcyMHpTRlBsalBEK1N1Y1RwZ3p0Q2NrRjBD?=
 =?utf-8?B?NmtleU1WMnkrRGdLcTZzaUl5RzJjckV3MmRjZlg3OEtmc0NTYUxzL1ZFRkRJ?=
 =?utf-8?B?L3VCNkZXNlRPWHh3OFU4Q2RHaHhubkx5R1Z5VndxbmtmR2x2Tm1EcjlqSWhy?=
 =?utf-8?B?Zk1uM0RLWW15aUs4WU5IdWE2ampFZytIb0ZrU3VKOEo3cHNyL0JjV0hVZU4x?=
 =?utf-8?B?WUpVZWtPVk9IVDVrY0FadXVBOHd1amF6eUVhV1BmcEs4ZVg4K3NucVNJTEhC?=
 =?utf-8?B?WDNEQTR2Q3J0dEw4eG5xaVFzeDE3NFB0aFpwclFMMkloaDhaZFBXSU1CaUxt?=
 =?utf-8?B?d1NxeXZlTE5rK09NVFJTQ0xFdExIUlVzM3ZWb2FFaVlBRVJRc20vUVpRRjFQ?=
 =?utf-8?B?K2dYZkZaLzB1aktmNWVaZXE0Wk5Ebm5md3B1NURKelBVVUJ2YnVjOVFtL1FJ?=
 =?utf-8?B?MGtpOS9nRnd5amRvZU9aQm84dkg3TW5sVFpPRzAyNCsvdC83VWhTampXR3hq?=
 =?utf-8?B?VktuQ3NxSWVDMCt6Mm1QT3RSd1NjQ1RtUkptWFQydzVzVnJBRFlGaVp4Vno2?=
 =?utf-8?B?S0xpb0JqeHdiY1IrTkVXazF5NkEyK0k0d09XQ2pEVi9jSnZVZHVNcnN2Vnda?=
 =?utf-8?B?WTduQ2l2VnRIRExzM0NYaXVTWmdybGU3SHdOQksrRlBEbzdaUkcxd1gvNUtk?=
 =?utf-8?B?WHBmUVZseGsrOFZIelB2MVB4Y0VUcFBleDZXY1Fndi9YSVBXT3dMd0tpSEVl?=
 =?utf-8?B?TWlldXJraDdwL0RoeWVKOVRPQVZtbEdRY1l3Yzc4R0VSalhEUXUwL2VVV292?=
 =?utf-8?B?T2JVb3lWTUpJSGtnanpja1FIRXJwM1pPazhWSnhEdG92LzA1MzZyNU10Skdo?=
 =?utf-8?B?NTVuZUdPd3lia1lzaWlGL09ZN1R4WStaM3E1WWQ0TWV5OWhrY0VQWVRtU0Vv?=
 =?utf-8?B?amdqdXdKSTZwekFRWmtYR01hS0RNVTlTa1UxVGFZUFBoWGNLYmwvcHEweXhQ?=
 =?utf-8?B?ZUhDVzdzbFliS3JXTVVUam0rWU1JdW5SWHlTYklwQWRKOG92UmxXUWNMSVV5?=
 =?utf-8?Q?gwit8Wz1uuuA4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11843768-652c-4cae-003b-08d98a548634
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 12:09:48.8914 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /7mgNAUYQqxKCRCziuguPzz2SDv7heVJw6NkhmtpdhELhx0Y+03DFlS0ZkyXruyP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1213
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

Am 08.10.21 um 13:20 schrieb Shunsuke Mie:
> A comment for the dma_buf_vmap/vunmap() is not catching up a
> corresponding implementation.
>
> Signed-off-by: Shunsuke Mie <mie@igel.co.jp>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/dma-buf/dma-buf.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index beb504a92d60..7b619998f03a 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -1052,8 +1052,8 @@ EXPORT_SYMBOL_GPL(dma_buf_move_notify);
>    *
>    *   Interfaces::
>    *
> - *      void \*dma_buf_vmap(struct dma_buf \*dmabuf)
> - *      void dma_buf_vunmap(struct dma_buf \*dmabuf, void \*vaddr)
> + *      void \*dma_buf_vmap(struct dma_buf \*dmabuf, struct dma_buf_map \*map)
> + *      void dma_buf_vunmap(struct dma_buf \*dmabuf, struct dma_buf_map \*map)
>    *
>    *   The vmap call can fail if there is no vmap support in the exporter, or if
>    *   it runs out of vmalloc space. Note that the dma-buf layer keeps a reference

