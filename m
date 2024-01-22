Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B42836BDA
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 17:53:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E620010E6D5;
	Mon, 22 Jan 2024 16:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Mon, 22 Jan 2024 16:53:08 UTC
Received: from omta38.uswest2.a.cloudfilter.net
 (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4846310E6D5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 16:53:08 +0000 (UTC)
Received: from eig-obgw-6003a.ext.cloudfilter.net ([10.0.30.151])
 by cmsmtp with ESMTPS
 id RwGDr0RBEoMN9RxQprrgFp; Mon, 22 Jan 2024 16:45:55 +0000
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with ESMTPS
 id RxQnrvbkGtzh2RxQordxM2; Mon, 22 Jan 2024 16:45:54 +0000
X-Authority-Analysis: v=2.4 cv=Ra6Dtnhv c=1 sm=1 tr=0 ts=65ae9bc2
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=IkcTkHD0fZMA:10 a=dEuoMetlWLkA:10 a=wYkD_t78qR0A:10 a=VwQbUJbxAAAA:8
 a=NEAV23lmAAAA:8 a=7YfXLusrAAAA:8 a=ps32sclX-u3JLzBWafQA:9 a=QEXdDO2ut3YA:10
 a=9cHFzqQdt-sA:10 a=PUnBvhIW4WwA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=SLz71HocmBbuEhFRYD3r:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xUmqrSRHbxv53MrhsbK61lfGw0UBXJAtEIXR6/E0CJU=; b=CpdmXFW14Ut65dA/d7TajA+NjN
 er+uzY2rdtSFEn/ege72uebuTI1K4TtaeCE+EjzE6QR7HDsTUNJIz2zfdNAkb2cPCOtToqekVQBen
 C/LIZLfjnWTKu5c3745w8D6zdWTWAu+3Ep/fLdxBIkneE1b+wNHs439HZKydo/5qnYQnKKvpLpkWF
 q9njQKFarI31OvYq+S4H31FFF+1eoglpskI/FYjupjdJg4ZhWC91MhFB9QpNRsGQfoKN4815Wn+Pr
 B1OKXWD5dNWaoPbo+7jKOjNq8KfhrfRb8nh0IazN2PaOeCLYbvko7W8pip3xxqnnf85UKRaJDGAWW
 eZL7322Q==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:56808
 helo=[192.168.15.10])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96.2)
 (envelope-from <gustavo@embeddedor.com>) id 1rRxQn-004JlJ-0e;
 Mon, 22 Jan 2024 10:45:53 -0600
Message-ID: <91e87233-3a10-43d6-b850-9cac083913e0@embeddedor.com>
Date: Mon, 22 Jan 2024 10:45:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/habanalabs: use kcalloc() instead of kzalloc()
Content-Language: en-US
To: Erick Archer <erick.archer@gmx.com>, Oded Gabbay <ogabbay@kernel.org>,
 Marco Pagani <marpagan@redhat.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
References: <20240120151028.11092-1-erick.archer@gmx.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20240120151028.11092-1-erick.archer@gmx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1rRxQn-004JlJ-0e
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.10])
 [187.162.21.192]:56808
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 9
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfI/+q2JbJ8ILd8Y9UcVafqBnd9Z+FDFHwVxGbJcC7cr+sQcABKSIgI/+51FZ/m/IJFAYrqZsQjYCU+LzhyocPzVOyjRwpu09+Zqxz7n6L88WlNPaYhFA
 Gv1W0ItO0fZseDWMT5Z2ihd0aq3xpkJuNP3dNI8j+RTNw++Q6FdcCeVzeWNt8aHxcqPjGbdPnIyofUWI4qOrz5z/oY9XJ3YKyyGHDsAXAcWKlBdGgA+n7CAr
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/20/24 09:10, Erick Archer wrote:
> As noted in the "Deprecated Interfaces, Language Features, Attributes,
> and Conventions" documentation [1], size calculations (especially
> multiplication) should not be performed in memory allocator (or similar)
> function arguments due to the risk of them overflowing. This could lead
> to values wrapping around and a smaller allocation being made than the
> caller was expecting. Using those allocations could lead to linear
> overflows of heap memory and other misbehaviors.
> 
> So, use the purpose specific kcalloc() function instead of the argument
> size * count in the kzalloc() function.
> 
> Link: https://www.kernel.org/doc/html/next/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments [1]
> Link: https://github.com/KSPP/linux/issues/162
> 
> Signed-off-by: Erick Archer <erick.archer@gmx.com>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks!
-- 
Gustavo

> ---
>   drivers/accel/habanalabs/common/mmu/mmu_v1.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/habanalabs/common/mmu/mmu_v1.c b/drivers/accel/habanalabs/common/mmu/mmu_v1.c
> index d925dc4dd097..e3d42cfead27 100644
> --- a/drivers/accel/habanalabs/common/mmu/mmu_v1.c
> +++ b/drivers/accel/habanalabs/common/mmu/mmu_v1.c
> @@ -232,7 +232,7 @@ static int dram_default_mapping_init(struct hl_ctx *ctx)
>   	/* add hop1 and hop2 */
>   	total_hops = num_of_hop3 + 2;
> 
> -	ctx->dram_default_hops = kzalloc(HL_PTE_SIZE * total_hops,  GFP_KERNEL);
> +	ctx->dram_default_hops = kcalloc(total_hops, HL_PTE_SIZE,  GFP_KERNEL);
>   	if (!ctx->dram_default_hops)
>   		return -ENOMEM;
> 
> --
> 2.25.1
> 
> 
