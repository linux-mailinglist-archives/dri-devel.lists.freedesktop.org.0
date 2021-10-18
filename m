Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98397431A3D
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 15:00:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE2316E0DB;
	Mon, 18 Oct 2021 13:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2049.outbound.protection.outlook.com [40.107.100.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B0046E0DB
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 13:00:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j/IJpI4hnSXRKj96difRuZA48Hmn4CazeaXwRvVnZSrQTEDW+VkIXvcDMKAWwM+DUsfcBziVM5+krWpr6GuYl4B9zXPtVKyYtg42B0HyRAe8Mmx77GIr9Lzb4J2egp68wSzGq3Anz2cadofbrrRn1IvvM8ZtlfX1hFogiUGhnLQFQYwXDEeyYa9iNs69AZ++ZGHPwZ59Rw2colDaB1Wm08hAAnMjqmx+n4XJkPh0kzST8rm7B00ZymgXH8e7pY7SATrnK8zRZu/cPC3DU/MBteV+FQDKdnKlK3zPP7OBUJm66MW+FrEqJaoBi8i4u9GKw6Acs9WRaVRUtzhUw5Sjpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EbsY80ymO0AMpfCnh03d23Xts2Zbfu+NqZQVPzGBCDE=;
 b=VRSVMH7p1Z7CnyBBoJ3KvlNVkRQrN2+QCvuqc0BJ22e0eQd5z34ZwSDiaNc7EWBULpxoi6HF72HEryP+9/9GvgBjX5LpJeD4Zsd1OoU6GnrXEYh/68zbSlEkdE+hvyh2afGM8KaIsyWUeTevs+3Oxnso9S5PeEe/8wfVUW+IzCr58X3qF4UsPL07VgPWQ+Wz5ntxGkF462zcdCCIvpafedkkP/kDBmGChb5u9VKwqj1K4Zy1GFgXMu/AJ7eJIugmvrwjid5qub3CcFXSVs5iQ2H8Vhzf8LUGlaZ8jDhiOenzVdcFziXGUhmhg0farEz/8S0MRwgJaHCfY1iA846Guw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbsY80ymO0AMpfCnh03d23Xts2Zbfu+NqZQVPzGBCDE=;
 b=Ygz+957KMIL0ME9TqXlZDz3h3HZrc4Dwe+R/bA7nadAxSR/GphKW+0t6zymh6qCzcGH4uL7baZzlhVySh7g+MigUT3VBic+vG5GTregVnWEZTwENjX+Andmb6479lwwHpxP8CDFjmBU14oD+KKAOxsH0R4aKMfZyjIE5t+0+Sq8=
Authentication-Results: amazon.com; dkim=none (message not signed)
 header.d=none;amazon.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1341.namprd12.prod.outlook.com
 (2603:10b6:300:11::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 13:00:00 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4608.018; Mon, 18 Oct
 2021 13:00:00 +0000
Subject: Re: [PATCH for-next 1/3] dma-buf: Fix pin callback comment
To: Gal Pressman <galpress@amazon.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Doug Ledford <dledford@redhat.com>,
 Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 Oded Gabbay <ogabbay@habana.ai>, Tomer Tayar <ttayar@habana.ai>,
 Yossi Leybovich <sleybo@amazon.com>, Alexander Matushevsky
 <matua@amazon.com>, Leon Romanovsky <leonro@nvidia.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>, Firas Jahjah <firasj@amazon.com>
References: <20211012120903.96933-1-galpress@amazon.com>
 <20211012120903.96933-2-galpress@amazon.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <912154f1-5809-3854-f205-61f0b7545a1c@amd.com>
Date: Mon, 18 Oct 2021 14:59:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211012120903.96933-2-galpress@amazon.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM6P193CA0118.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::23) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:c473:1c84:fac2:c272]
 (2a02:908:1252:fb60:c473:1c84:fac2:c272) by
 AM6P193CA0118.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.17 via Frontend Transport; Mon, 18 Oct 2021 12:59:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a7da1c8-5c67-42fe-abee-08d992373133
X-MS-TrafficTypeDiagnostic: MWHPR12MB1341:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1341CE237B8D9FF05F5E7D7B83BC9@MWHPR12MB1341.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mjrkft8Py+W040TOzC7cDeqbfzY4JmvmxNZaL/MKQSNHjOrhlOmPvBAa0OQYE+EDgx04X1bAGqOzwShA8MUNa4kpJ9s6l0bI0rBQDYfrlua0P1XxETR54/0XAyMNdiJnbhNQHNnSCFalmL6kIfe1RuFDBUpROeFe7m+uM3QxnbrM0wp2HsoN5YyRu6h8Ry1Wh8DEUW46mLgT7VliE2X+ECBBkcyfJRiVHQpOBpiMv/8tM9sUmvhB9q+1vhkU8yJkKc9GpkGyAFP3BcwmUB8rMvp6i35qs8Tgny8zrQp/w5eeq66cOcU4Ghyf4y/n7haeQc1j6YWq8ZR3zzZqB7Jj7xzDMXUl1i2AVc6df6cVmj2rsZq3IsiwhPsVcGKg1E4B4aCxixkDeH/m0NFcvgAtom6MwETuzZCXEqTWz20Hy4ZXexBtUmQ2qlFYwcBWg+BteQd1A2yV4hKYVdiTz/yIeM72DHoQgbzqIegmUJcSXydH/alvDTtQ9vQhCB3+iDMGHit4DqDsx2DujVauwNFcvQaWLc/CI+VYzpchLVvQsX8XkorLg6KRAC371xejLx8PnpHYW4014ujYzh20SnHjj63Hbfe1sk7QB878L6KTeiKo1jpoVFf6p4qTtu0nXp+zL570zmBSCuFCDQxjhoCOT2gG6KJvRhdTj4WUGZo56BeXDUpd7WJeM6Jio9D4BjcS9QRZ7roJYv+41ilwgVdBQDG0QX8QfQgMnExTlVXB6LMjtCGvl9zoM3dMO0yNHqv7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(508600001)(36756003)(66946007)(4326008)(31696002)(2906002)(7416002)(2616005)(38100700002)(8676002)(6486002)(31686004)(54906003)(110136005)(6666004)(5660300002)(8936002)(66574015)(66556008)(66476007)(186003)(83380400001)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHFSWVFRcWVFcHQ5SUY5OU5WQ2MwRXRMOXFLclJqY1lIcU1JVzRNM0xqRy9P?=
 =?utf-8?B?TCtZekJkWmx2QTNzNmRpS0tHcFRkbHBCMlE0dzUxZ0VrcWpZTFp6RzI0WnVn?=
 =?utf-8?B?VzRHUDNrMlE0QytBMDU4clBzN25mT2V4bERZSnl4bG0rR1JQcVV0L3JQUTIr?=
 =?utf-8?B?Y3l0VTBhbmNTNWRCVkhSMExXYVNydEFTbHdRb3oyMkgvSHo5VGFoWkFKVTg4?=
 =?utf-8?B?aGlQb3huUzArS3l5VnZaNElvN2VVNHBHSkJub3ltY0ZSdXVQQzYxb3VXUEZm?=
 =?utf-8?B?cmhyd2ZqNEQreG5MRFV0S2hTNjB4NEppTytTVi9PNHUzSzZwSUw3WlAzcEh0?=
 =?utf-8?B?cExBeUg0N2wxbWJMbXVRTGZ2YVAzZHNQUStHakwyUWk1M2Y1eThnVzI0cFBx?=
 =?utf-8?B?WW9pS0dwaUlScERBbzBhUE1IWVRCdS9zNXZMQ3VlNUp0OWpsZkRxRmNHMjE4?=
 =?utf-8?B?Nk9aNENKNkpqM0h2T0pKN1RVK2tOZXF3QWM2cVNQVGUzM3B3NFhUOWhEcE8r?=
 =?utf-8?B?ZW4xcjFZQkVWUlNWVVJKUUFHbWxqb2Q0bTFBUGtVaDlCR0hrenhEKzJyQUQr?=
 =?utf-8?B?clJpQklhTGFIT0VWdEVHTStQVlZUS21mZWxERmNiRUVlNUtWcjVLb2ZMNlNY?=
 =?utf-8?B?TlYxbWpEa2xaUUY2aW9Hd2M4L1JDQW1SRVNQaG5sRitGNk9JYW9aeHVKOExn?=
 =?utf-8?B?MWZGSHE1bENlWmtqT0F0ZHBGR01NYUswb05LVVJLYnNhWENGeFlMdTd4UmJl?=
 =?utf-8?B?SmdvT1djT3QyMm4xWFNMVm5CZW1LUkhWeEtFTzJsOUpsNElra1ZMbjQzVVdj?=
 =?utf-8?B?aVBNQ2NpWDhVK0hCTG1RdzFPc1RqNmlxY1BaOFdtVENSR0haaWVhTmIvenRq?=
 =?utf-8?B?NWpHMXhkcUxXU1FOdS9mWDAyaGxubXpSOU9ITjU5UXFJcmR5Z3FhUzhwc3dr?=
 =?utf-8?B?REJ5S2RnMjdYNG1WTG5tQTBHcVhyTXYrdFN1UWdBYWt1c0JHOVMxTlZmQTY5?=
 =?utf-8?B?RVBxZjVDam5aMVRhTDFQSXBVSGo0eDJiTU85UHZWMTMrK2hMV0hRclNzT2Vx?=
 =?utf-8?B?VUhXejZPRTlBb1JJNmpjWFJvck1hcHFJd05xTEo1SHlwNlFjNVNhS2YvRU1l?=
 =?utf-8?B?WXdYS01DdVAxbFhvam1pRHBlUHM3Vm55Z0E4SzB1OFNROGFhTXQ0YnV1ODB2?=
 =?utf-8?B?eG1HNUhLR21vcG82djYvK3FsTlVGdFBLQVdyNzNvZjgzYlo0bm5ERXRPcDFi?=
 =?utf-8?B?MHFvbDlISUo0SmZCQnc4Ykw0cHpKSytiVWlaeWl4SGd0TGNSKzg1ajRzTU5S?=
 =?utf-8?B?MmNsNFdWOWd1N0VndFAreTRtT0htbERVaWRQY0xpbisxZ2FTZHMwTVFraU5z?=
 =?utf-8?B?NThQUlZ6YlYzd2lPRDFCL0xuQXUyKzNYcjFUb0lCVXN1TmJMQmRXdk1VRzdq?=
 =?utf-8?B?UXl1eCtKVzArdUs1U3ZKakxPK1Nsd0JDcHdpRWpmVDhZQnFSTXl0R09UcDB5?=
 =?utf-8?B?SUg1YzlFdTVaZU5yRitxUHhtZGpEUDZSdExESUFVQjkySXkwcHd0Q1RhSVpn?=
 =?utf-8?B?YWZvZjR1MTNpcVFiTmpqWit3ZlpEYmc2QzFVbjVVVThyaFVzQ2JieVlwSjBw?=
 =?utf-8?B?c1dnNFE4bGtOQ2tndDY0SnBneFZYMXpMc3pHWWJmVjczalQ1L2NCV0pLN3do?=
 =?utf-8?B?T2FTZUtiVW81T2hvSFlseW9DQUI3SFZ1Ui9UTnh1YWpPc2piRXg2WGhGRHBL?=
 =?utf-8?B?OWtYTzJJWnRGM0xobFFNTFpTTzRNMkJsOGpjZFBoZk0yU3VYelRjc3VsamlE?=
 =?utf-8?B?WHdMY1Fuc3EvS2t1QVBXQTVPMjQrVTg3WjdtQW93MTFSUDNINDBWeHJIMDBG?=
 =?utf-8?Q?h7O66mYs58d4r?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a7da1c8-5c67-42fe-abee-08d992373133
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 13:00:00.3518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CvkdnlTCyfbQZRuln3cXMWdH8AAMdAJ7nqGStDenpax0f2sZET3v+SQXD70SMHiR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1341
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

Am 12.10.21 um 14:09 schrieb Gal Pressman:
> The pin callback does not necessarily have to move the memory to system
> memory, remove the sentence from the comment.
>
> Signed-off-by: Gal Pressman <galpress@amazon.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   include/linux/dma-buf.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index efdc56b9d95f..225e09caeb98 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -86,8 +86,8 @@ struct dma_buf_ops {
>   	 * @pin:
>   	 *
>   	 * This is called by dma_buf_pin() and lets the exporter know that the
> -	 * DMA-buf can't be moved any more. The exporter should pin the buffer
> -	 * into system memory to make sure it is generally accessible by other
> +	 * DMA-buf can't be moved any more. Ideally, the exporter should
> +	 * pin the buffer so that it is generally accessible by all
>   	 * devices.
>   	 *
>   	 * This is called with the &dmabuf.resv object locked and is mutual

