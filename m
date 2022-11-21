Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8D2632815
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 16:28:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E98210E2F3;
	Mon, 21 Nov 2022 15:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01olkn2082.outbound.protection.outlook.com [40.92.98.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 266C010E2F3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 15:28:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qelv/iufT4t1r0STen5pA4Obumrn9/St/SUjUhI0VdsG5XFCy/TfG9G7o5ABzskMguMY6jgP+w0gkM4Igzy2BfUjocAHrNBQ2oVifr7GqGx9BA5gxRoSaWJ/4ja6ymXiUibnvhSbXFtEuA4UCmXNFfsJAfpkhoS4W9dg0nY9Yha1SDYj0V9htK1KUXHI9N4BLtHvSnuku1qtK8iTLIeS9zpaM3VUjRF3Dw/udXK6IF6fjMaooHQTnqTosOiDK9L/35qdIxmYbvmQE66ddX8vMOxe5F6/aU/9mpiblPc7CfVZEXMHWGSZBa1W2amBkTXw5ncwEyI8H4OsVGl6HHUUjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ly1rcD1U0Bd9tIswe0QbNLxpcD4H4qzzCby4dNqVSwE=;
 b=YZYTDuRhq4el0D9+x2iDsxPxmCBXA9W5MVl+7ypf5X/BA9JDpJaniO9WsoZPH0nMWUZ2otRAo1zPaYNorQyFR9PPyTqCFzjvjiZXQRW4gCTBKFs0Zxu7Kex9PT907srpTrEiG7OKGzaf30UV8KQ96xbbds5GUX4GTa6Kkf79OUyXJieKkU5E5fhUWdAKyNM/TdK1wPC+M1PWblODdJvJ+/Hn7jqWJ4M4YPTRPiBkf8GIgDjUjG8lLlP8kCxjgk7N2tbXJd0KL/hdRhmANrkxlyiNTsyIRJN7u+AZP6rE0RMk1eyNgp7Ur3Fcf89djuEA+WdpOqnOQsyBTGssJ/auzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ly1rcD1U0Bd9tIswe0QbNLxpcD4H4qzzCby4dNqVSwE=;
 b=Ntx0wTRw3fQtkRLN/nwK4IPXHcdmzHeSdwm5T6MHh5CNmvI+vagLH42ZYChC+wh2JTdJ8yeGpqwOncei4XTjw+RmKi/v88GcoQMHHeBFG5YnJQY90VLKSEFBpudD6DqDjW5yjWO56EFkUWvKQoP93nwlfz2IpOpAOcQkh4p4/mNdxNA/jr60Mg1lPMaR6xHLbjNuZ2Ep8ACHenH67RKLbgyWASufaVRsLODYBZ6wrF6R2iZODJ2125GbxGJQZyqtG3OcjHuL0NtUqVxlbBuWJMdaw5k5EKD9P2+ZKPOogpjN/3ferj+BSCKvtbDAK8m1ZEm5D/RHmxHihKgl2C0NMQ==
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:152::9)
 by OSZP286MB1557.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:1b2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Mon, 21 Nov
 2022 15:28:19 +0000
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ff96:9cb6:e047:c605]) by TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ff96:9cb6:e047:c605%4]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 15:28:19 +0000
Date: Mon, 21 Nov 2022 23:28:13 +0800
From: Dawei Li <set_pte_at@outlook.com>
To: sumit.semwal@linaro.org, christian.koenig@amd.com
Subject: Re: [PATCH v4] dma-buf: fix racing conflict of dma_heap_add()
Message-ID: <TYCP286MB2323894F9939C27291FD998CCA0A9@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
References: <TYCP286MB2323873BBDF88020781FB986CA3B9@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYCP286MB2323873BBDF88020781FB986CA3B9@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
X-TMN: [UoBXl6n5xYFVzXXIeJukr5rGJBgLvpuw]
X-ClientProxiedBy: SI2PR02CA0022.apcprd02.prod.outlook.com
 (2603:1096:4:195::23) To TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:152::9)
X-Microsoft-Original-Message-ID: <20221121152813.GA4430@wendao-VirtualBox>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB2323:EE_|OSZP286MB1557:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bdd4859-e0bd-4a7a-ac5a-08dacbd5037c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GqoSvLfYXio+NfurrX6DuPkLI264iiky6pW8TDT72WhS29smZPkFMMY9nQ6Js8Nq7LLLJYXGcXvmkVgfha4Awaiw3rOXIz8mw8UY0a5e8n5viR/tpusvEsCLasF69YhMuezOgHOtOQ+aMSZHz1KkoaGYpz0ajSdhgBuUIfFw4Vsl8Teo1zhzT7CsANhMmGLJcQhtaXdByccj5hDUZzCE7LhbBWgEHSsNPswitvR3YtRVI/MdEZhvpQT/i4xWYVJ9HdvMl+GrhppuCO5aBmjQUx6jttqxHNWBIandEpyH0rpWiGwASMapPPNAZsTv1iA0NtmjmvE/oL+M+IXkGpf7nBhEs9jefOvXUwxTTmLBNM/mKESNfsdlI9TH7Cq8mX78Q4DMa/d2JV//ZQBUGumPt7UK11Wks0MEemughLvod/jFYismmwtmxPJIGSZVgUkl5ZD/DVMd8UzAkFCQG6ERU+0v4LuADDimU1TcQkEO9E2DNdSqQVJ9RPJhWcEMu03xkDXJWOmV8thXsV+hnFlYBNsEFeYGfIpBYBeKP94onGnfCu+PVwvw9Kn6ncwZ8/y7Va9oa9TjfUlBwuECMII7+qgt9dPdiXPzLzJk9mdpYkv//mmInoVxdq58t3hb9O6W0YLcOdtFHrT/7wmvcirq2Q==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vBpnwVeJMnCyVEzp23LIvfCxQ9la+ozPK451H4PzT5prytczX1hOpXAI8LNp?=
 =?us-ascii?Q?hq7RM4SNqa3ddlx2eKwoN5DU5/ZQSQexItwVZAtx9BXSLCEOY4mcYwGB75WW?=
 =?us-ascii?Q?3n4K9Pptcx7Yp8dQvgKzKEYkNNFPQuTlUpgxlCRqFUDFGlpCMKcsFvJj3tY1?=
 =?us-ascii?Q?eJCm79itu3QHeqmQaSA6OUWDW328IkX6N09nhtGLw+4rCwBiYDOZwkhC0rPm?=
 =?us-ascii?Q?wJ8nPld8YwB9RJptBHj6NDcocKADHKXao/RImLIthniuBjfrWpcsYCS0Qu8f?=
 =?us-ascii?Q?FSX+yHeQ3okcguK7dOE5UPqCmMralAVsiVQNBk5j0F0cvsZ10vIyA8z+CK2F?=
 =?us-ascii?Q?Przkq3RfsoiFq8ZfGnASZ44tCt0QCZVdIXfbmJx9GdlXIi3+QE13x3cFA3w9?=
 =?us-ascii?Q?/73X3WeYy8wYIfd2EXGyqO3r3XMgaqNege21cp7LbqE5RkIEcEheSKYa3bo+?=
 =?us-ascii?Q?t2Y/OLhYbMX5uv1qwoF4xAlzR02VNFOBQRt4rVZKCmw9SyotRCUJ21dUljq7?=
 =?us-ascii?Q?ykYzQ71M+D7l5KP6QEdRECl5No0Qo6WJRiuYgqxIhYm9xv38qMNYLTlefAQW?=
 =?us-ascii?Q?q+k+eadEcwbnPNajXiSVmRReP9fJoA1CsMsaIyKivfpyph3EA1MHFvTuB+gx?=
 =?us-ascii?Q?S01L7/wm7VtWqi07xYOcbawz4yX0jgpAeYy0RoAtwuvEIovgApFdKpTWSvxP?=
 =?us-ascii?Q?pLdArMxbedEjY2bZPIlxOhXeY5JWUdPXOq1deyzp+SmWoslCM8ZiLdbSewCN?=
 =?us-ascii?Q?ugDxyn112kVpSapEA60iPHFgTmbsYRimgXNN4PdG25ekHy0LNe0hIIbC0yqa?=
 =?us-ascii?Q?d6AqR16G/R3H3PFevtIkWiejd28oAE9ks+Ai+Pt+1oiokQ5TDZqloy7mw3iJ?=
 =?us-ascii?Q?6SGoVfk0NX/S13FwHiYe5Dnqo+DlXInis16GEVPDz/OFvOD5PjCOHS6dyxvS?=
 =?us-ascii?Q?adXAXZkNqaM/4zkra1VaiTBPyk5m0jhHH2XtT+XzosDM84JoIsWyYptw2P3N?=
 =?us-ascii?Q?aeOQb0zOHvskmHZoI9fTSfuZGzYKfBqvb/cEbyE7uEUS3dtbftTSxrdXEDZp?=
 =?us-ascii?Q?eiYPLk00LMI0EBnfsCnlSQmW2eDE8jR6PWCaJTZ7s02mXj1B7Az0y5wOOv6Y?=
 =?us-ascii?Q?uAmT7HL4POnakvTaHrwL3mQAwfXLLuSS+AVGRt/BK1h4xI7DW8fz+Ahluh00?=
 =?us-ascii?Q?OUvtBzxQnkMC9f6A52x/ow9bI7PwQs618Kfw38he7oTbAof8EGHh0eJW+d9J?=
 =?us-ascii?Q?c98tr8+J7ZS4gtw7X7ThxgevikZkIycJTTC0Rz/7eQ=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bdd4859-e0bd-4a7a-ac5a-08dacbd5037c
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 15:28:19.4874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZP286MB1557
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
Cc: benjamin.gaignard@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 jstultz@google.com, afd@ti.com, labbott@redhat.com, sspatil@android.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Nov 05, 2022 at 12:05:36AM +0800, Dawei Li wrote:

Hi Christian,
May I have your opinion on this change?

Thanks,
Dawei

> Racing conflict could be:
> task A                 task B
> list_for_each_entry
> strcmp(h->name))
>                        list_for_each_entry
>                        strcmp(h->name)
> kzalloc                kzalloc
> ......                 .....
> device_create          device_create
> list_add
>                        list_add
> 
> The root cause is that task B has no idea about the fact someone
> else(A) has inserted heap with same name when it calls list_add,
> so a potential collision occurs.
> 
> Fixes: c02a81fba74f ("dma-buf: Add dma-buf heaps framework")
> Signed-off-by: Dawei Li <set_pte_at@outlook.com>
> ---
> v1: https://lore.kernel.org/all/TYCP286MB2323950197F60FC3473123B7CA349@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM/
> v1->v2: Narrow down locking scope, check the existence of heap before
> insertion, as suggested by Andrew Davis.
> v2->v3: Remove double checking.
> v3->v4: Minor coding style and patch formatting adjustment.
> ---
>  drivers/dma-buf/dma-heap.c | 28 +++++++++++++++-------------
>  1 file changed, 15 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index 8f5848aa144f..59d158873f4c 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -233,18 +233,6 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>  		return ERR_PTR(-EINVAL);
>  	}
>  
> -	/* check the name is unique */
> -	mutex_lock(&heap_list_lock);
> -	list_for_each_entry(h, &heap_list, list) {
> -		if (!strcmp(h->name, exp_info->name)) {
> -			mutex_unlock(&heap_list_lock);
> -			pr_err("dma_heap: Already registered heap named %s\n",
> -			       exp_info->name);
> -			return ERR_PTR(-EINVAL);
> -		}
> -	}
> -	mutex_unlock(&heap_list_lock);
> -
>  	heap = kzalloc(sizeof(*heap), GFP_KERNEL);
>  	if (!heap)
>  		return ERR_PTR(-ENOMEM);
> @@ -283,13 +271,27 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>  		err_ret = ERR_CAST(dev_ret);
>  		goto err2;
>  	}
> -	/* Add heap to the list */
> +
>  	mutex_lock(&heap_list_lock);
> +	/* check the name is unique */
> +	list_for_each_entry(h, &heap_list, list) {
> +		if (!strcmp(h->name, exp_info->name)) {
> +			mutex_unlock(&heap_list_lock);
> +			pr_err("dma_heap: Already registered heap named %s\n",
> +			       exp_info->name);
> +			err_ret = ERR_PTR(-EINVAL);
> +			goto err3;
> +		}
> +	}
> +
> +	/* Add heap to the list */
>  	list_add(&heap->list, &heap_list);
>  	mutex_unlock(&heap_list_lock);
>  
>  	return heap;
>  
> +err3:
> +	device_destroy(dma_heap_class, heap->heap_devt);
>  err2:
>  	cdev_del(&heap->heap_cdev);
>  err1:
> -- 
> 2.25.1
> 
