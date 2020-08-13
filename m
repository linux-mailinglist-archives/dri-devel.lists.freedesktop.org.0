Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B037D243836
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 12:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEDAF6E1E9;
	Thu, 13 Aug 2020 10:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80045.outbound.protection.outlook.com [40.107.8.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A986E1B8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 10:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G1m9OllX6T6BfG+L5HAGjOrLQTw/0TtWZec6xM7eJjg=;
 b=K/ZeqfUqL7OGIqhuczSDWsFKZBnUG/xZpHg+HkjKWmvTO4oOn0NxslhIaZJI3SGMwUknUeH2wqaymeFMZKoYtOfGy0Rxu5ju7C0TSGY+sPLYOyMeIzwRyepItFgzeLRd9u5JpE0QKNQLM1qtyWZDm7oxkr84Lz4E6Ct1iWPmzM8=
Received: from DB6PR0501CA0045.eurprd05.prod.outlook.com (2603:10a6:4:67::31)
 by AM0PR08MB3202.eurprd08.prod.outlook.com (2603:10a6:208:56::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Thu, 13 Aug
 2020 10:04:38 +0000
Received: from DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:67:cafe::4a) by DB6PR0501CA0045.outlook.office365.com
 (2603:10a6:4:67::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend
 Transport; Thu, 13 Aug 2020 10:04:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT026.mail.protection.outlook.com (10.152.20.159) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Thu, 13 Aug 2020 10:04:38 +0000
Received: ("Tessian outbound 195a290eb161:v64");
 Thu, 13 Aug 2020 10:04:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5fbbf906cad0bcf1
X-CR-MTA-TID: 64aa7808
Received: from b4883763c2c0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EBACF89E-D8E3-4105-BBD3-3F618896FB37.1; 
 Thu, 13 Aug 2020 10:04:16 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b4883763c2c0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Aug 2020 10:04:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AXF6DACNo/6SjX/kQxDclJo6MBSwYFjJJe+a13cSAO6tT7Q3yTQ0Y8JPePKvQp2AgUQj2ww9KEyPHJfJ3IbBs1OGnTCmLxBWeiTndljdKrnIOHWpA0iCMAa3NL6/CsYDC2hKAi7SD/uQ2QXz59HNRE4qanfz4er3N/6nYKGp5cEpM81EyF8MwiQVgbh3rFI+jC/9Vx4HqhTbXJQq7CqgjnDd0rJPOtJMxDsFtvRjYDeCXg+sl1gs4X+KNjD7f+xT2e8cmbahlxGphui4Kccr5ljRGY9p+3JflDqsHft+v2HDalGFeUY/hUWbDl+EsjKBVNB787+C/CCrfiTY8ub1cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G1m9OllX6T6BfG+L5HAGjOrLQTw/0TtWZec6xM7eJjg=;
 b=YbSkTx/nlSDPXTZJPy2IygfEQIEo0HlPg2uS+WQ7jKkDkZ1kdQYSUaj8r+lumaq9gSaktxSlxzl6K7dXGAVGK2zAA+pVdRCbQRefumljCaepzPVk+DEHoCDXQrHtQthCeiwOYPXY2b1FfuzQkz9YOmaGup1Qt7TG69PE2BeVndmRPHwchbZC1RvjJnEHEXpb69/yVv9MlZIRcxvw5VZVgZInjxdYfsle81JPeGZ8u6VH9df2AXi25gF0C+Dla3SU9wzWlJe1zSwxTyYIlTOYihDphJxxlR50u8i7d0i3N0ttno8NvGkUwfyv0gB4YTcrVzMRZFFt6QHMcJtp9Z9ELg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G1m9OllX6T6BfG+L5HAGjOrLQTw/0TtWZec6xM7eJjg=;
 b=K/ZeqfUqL7OGIqhuczSDWsFKZBnUG/xZpHg+HkjKWmvTO4oOn0NxslhIaZJI3SGMwUknUeH2wqaymeFMZKoYtOfGy0Rxu5ju7C0TSGY+sPLYOyMeIzwRyepItFgzeLRd9u5JpE0QKNQLM1qtyWZDm7oxkr84Lz4E6Ct1iWPmzM8=
Authentication-Results-Original: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=arm.com;
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com (2603:10a6:7:36::11) by
 HE1PR0802MB2457.eurprd08.prod.outlook.com (2603:10a6:3:df::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.20; Thu, 13 Aug 2020 10:04:14 +0000
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::4592:81d3:6b32:e827]) by HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::4592:81d3:6b32:e827%7]) with mapi id 15.20.3261.025; Thu, 13 Aug 2020
 10:04:14 +0000
Date: Thu, 13 Aug 2020 11:04:11 +0100
From: Brian Starkey <brian.starkey@arm.com>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [RFC][PATCH] dma-heap: Add proper kref handling on dma-buf heaps
Message-ID: <20200813100411.3gh2awfbmdjupbnw@DESKTOP-E1NTVVP.localdomain>
References: <20200725032633.125006-1-john.stultz@linaro.org>
Content-Disposition: inline
In-Reply-To: <20200725032633.125006-1-john.stultz@linaro.org>
User-Agent: NeoMutt/20180716-849-147d51-dirty
X-ClientProxiedBy: LO2P265CA0286.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::34) To HE1PR08MB2890.eurprd08.prod.outlook.com
 (2603:10a6:7:36::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-E1NTVVP.localdomain (82.1.208.173) by
 LO2P265CA0286.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a1::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Thu, 13 Aug 2020 10:04:13 +0000
X-Originating-IP: [82.1.208.173]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8c700273-fee9-4856-2db5-08d83f7049f8
X-MS-TrafficTypeDiagnostic: HE1PR0802MB2457:|AM0PR08MB3202:
X-Microsoft-Antispam-PRVS: <AM0PR08MB3202CB7672BA053BD77671CEF0430@AM0PR08MB3202.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: kG6TLbds7gs/yEoxn+c5JxHdZl7QUrXm1b1vId0oYIqdxMa2vabRAt6AOPtz5RgDntvle/c1cx2FyJZD9b7ras+9pzUxBxaRJpBOdxW6viMiCPjy1/nE7jwHFOjRWKwni25aEuYql2DdpqB/CemiUH7snsWJWFzsMiXga5CNItwqWfhxsXpFJxHIgBZ0GwLn9Lwugd88g0uQnBZnISRr+DolIL5dfOHKw3THOAquZ2Hl9JyiudV8bsdckY3oQed4fU2iWdMhx8JEEgDSEYQ0Ffngh1siFaTcusTnliW5NPDRS09PGpJpR60h/FobW3r8xXyCr8+WJUNkd+gz/bZBsg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HE1PR08MB2890.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(44832011)(956004)(26005)(16526019)(54906003)(4326008)(2906002)(55016002)(7696005)(478600001)(6916009)(8676002)(86362001)(5660300002)(316002)(66556008)(66476007)(52116002)(9686003)(1076003)(8936002)(6506007)(186003)(83380400001)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: S1CXTvlmTkFx+LDK+zWXuFKv7E9UUwFxxFrFhxK2IxxCfNhW585wIvpiVrqxLMFohMmXA7coCRZ6CJXe2oKDp1VPCX0hBLjIZ7aUnhzjW3GZANaOKGaQPRmV/xy3deDDCtT0yrvyjrBEcQhXYxJlHrlU8UYx7BOd5Pzg19OmADRhU5LLmaq1uXctUes5K7nrW+WBViHR+6+7XrHlQbmMPqnbsEkkqmL0s6YTjKvObPObqreprEIUYSmP6OVyk/MoPFL+EEWY/OD7e6vVdWRZ1grqQ3+3V8XarTwKbaW4+Q+mD80R9f1zh7CBhE1mIA5cxZZLIyCHK/PDqqBE08HXz15I8tZ4Ks7rF9ekxqfeK7ZFqUaElrHK3FCSxqmKw9thwH/BnNNYLLZ9LlQ0ocF9D5fqSL7IxWVwU2cRPlAjBp4d3ouqBHexOq3LJS15Lcbh5A9DINC8KLQP1h/YIiruN3Qw/A7BXk3fgnSLM/FnLlxbrI/4AbvOVrTqQRIa+5/y8HdDpXLsh4+L01KdQLB0kKtVRSg9AO+rTklJM2xOpoL4MMBQJfghwI1WT0vkNb5XJaaNA3TzD7CtF1MJv+T9reQhx3HPTmwBbfU6pNvAhOswNaEQO5X1O+y0L59sDqgPfPRPgK7AH1h3j21NcNp7iw==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2457
Original-Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: b0ae5cbd-23de-45e4-95eb-08d83f703b75
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0XjkGjOFLL7+XRcHedwF5Sm7TvO0SSvSWtGuXfmbYx5kxTu5kZdhjNsLVjZNbG9qEznKDLrvuxmdWCbwCGQUjBuyvF72FLJnYC/qwUVmHmHUn8sEfDFp/WsCmRGl7FrBvljnt7cFDYqZSMq9yo0TFAXPktoaEJEk9/8sjYMO88cvdw+PhgyqDIw35vIECPAAnAtAQfjeeu18jawUpN5od62WZ6RXikGN3rLfyQnGDE5tzTMiVh7OvNkCMml9fsUVWa5SRyQ8V8KUNR8qf1LSPkoXHqLgpl1SFj2SDoigeEWkPaVbyvZfrR6USQv2PozwISMF21+Sn+dcgm/pkzrQ/ifX4nZu1Uuwg3V6gljWKmU3sN2QU8pY6HAJxKzV45wYH3IbyyF6BZHe8FeXARSG6A==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(376002)(396003)(39860400002)(346002)(136003)(46966005)(316002)(478600001)(81166007)(70586007)(70206006)(55016002)(336012)(1076003)(7696005)(26005)(2906002)(82310400002)(82740400003)(54906003)(6862004)(44832011)(5660300002)(4326008)(9686003)(8676002)(47076004)(956004)(356005)(186003)(86362001)(16526019)(8936002)(6506007)(83380400001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 10:04:38.2693 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c700273-fee9-4856-2db5-08d83f7049f8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3202
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
Cc: dri-devel@lists.freedesktop.org, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, "Andrew F . Davis" <afd@ti.com>,
 Laura Abbott <labbott@kernel.org>, nd@arm.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi John,

On Sat, Jul 25, 2020 at 03:26:33AM +0000, John Stultz wrote:
> Add proper refcounting on the dma_heap structure.
> While existing heaps are built-in, we may eventually
> have heaps loaded from modules, and we'll need to be
> able to properly handle the references to the heaps

I'm not 100% clear on the intention here. What would take/drop a
reference on a heap?

In the case of modules I think the bigger problem is how to prevent
the module getting removed while there's still something using it.

Cheers,
-Brian

> 
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Andrew F. Davis <afd@ti.com>
> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> Cc: Liam Mark <lmark@codeaurora.org>
> Cc: Laura Abbott <labbott@kernel.org>
> Cc: Brian Starkey <Brian.Starkey@arm.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>  drivers/dma-buf/dma-heap.c | 31 +++++++++++++++++++++++++++----
>  include/linux/dma-heap.h   |  6 ++++++
>  2 files changed, 33 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index afd22c9dbdcf..90c3720acc1c 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -40,6 +40,8 @@ struct dma_heap {
>  	dev_t heap_devt;
>  	struct list_head list;
>  	struct cdev heap_cdev;
> +	int minor;
> +	struct kref refcount;
>  };
>  
>  static LIST_HEAD(heap_list);
> @@ -190,11 +192,31 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
>  	return heap->priv;
>  }
>  
> +static void dma_heap_release(struct kref *ref)
> +{
> +	struct dma_heap *heap = container_of(ref, struct dma_heap, refcount);
> +
> +	/* Remove heap from the list */
> +	mutex_lock(&heap_list_lock);
> +	list_del(&heap->list);
> +	mutex_unlock(&heap_list_lock);
> +
> +	device_destroy(dma_heap_class, heap->heap_devt);
> +	cdev_del(&heap->heap_cdev);
> +	xa_erase(&dma_heap_minors, heap->minor);
> +
> +	kfree(heap);
> +}
> +
> +void dma_heap_put(struct dma_heap *h)
> +{
> +	kref_put(&h->refcount, dma_heap_release);
> +}
> +
>  struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>  {
>  	struct dma_heap *heap, *h, *err_ret;
>  	struct device *dev_ret;
> -	unsigned int minor;
>  	int ret;
>  
>  	if (!exp_info->name || !strcmp(exp_info->name, "")) {
> @@ -223,12 +245,13 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>  	if (!heap)
>  		return ERR_PTR(-ENOMEM);
>  
> +	kref_init(&heap->refcount);
>  	heap->name = exp_info->name;
>  	heap->ops = exp_info->ops;
>  	heap->priv = exp_info->priv;
>  
>  	/* Find unused minor number */
> -	ret = xa_alloc(&dma_heap_minors, &minor, heap,
> +	ret = xa_alloc(&dma_heap_minors, &heap->minor, heap,
>  		       XA_LIMIT(0, NUM_HEAP_MINORS - 1), GFP_KERNEL);
>  	if (ret < 0) {
>  		pr_err("dma_heap: Unable to get minor number for heap\n");
> @@ -237,7 +260,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>  	}
>  
>  	/* Create device */
> -	heap->heap_devt = MKDEV(MAJOR(dma_heap_devt), minor);
> +	heap->heap_devt = MKDEV(MAJOR(dma_heap_devt), heap->minor);
>  
>  	cdev_init(&heap->heap_cdev, &dma_heap_fops);
>  	ret = cdev_add(&heap->heap_cdev, heap->heap_devt, 1);
> @@ -267,7 +290,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>  err2:
>  	cdev_del(&heap->heap_cdev);
>  err1:
> -	xa_erase(&dma_heap_minors, minor);
> +	xa_erase(&dma_heap_minors, heap->minor);
>  err0:
>  	kfree(heap);
>  	return err_ret;
> diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
> index 454e354d1ffb..c1572f29cfac 100644
> --- a/include/linux/dma-heap.h
> +++ b/include/linux/dma-heap.h
> @@ -56,4 +56,10 @@ void *dma_heap_get_drvdata(struct dma_heap *heap);
>   */
>  struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info);
>  
> +/**
> + * dma_heap_put - drops a reference to a dmabuf heaps, potentially freeing it
> + * @heap:		heap pointer
> + */
> +void dma_heap_put(struct dma_heap *heap);
> +
>  #endif /* _DMA_HEAPS_H */
> -- 
> 2.17.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
