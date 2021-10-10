Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3283F427F6A
	for <lists+dri-devel@lfdr.de>; Sun, 10 Oct 2021 08:50:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B30D16E20F;
	Sun, 10 Oct 2021 06:50:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-fw-9102.amazon.com (smtp-fw-9102.amazon.com
 [207.171.184.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D886E20F
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Oct 2021 06:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1633848645; x=1665384645;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KP6hoaLqxS7CuDq+2tVqjhX+TIOLgyNhBq/ixB8TFnc=;
 b=utNj0s7jktjAQXSDoq7u//o/3/6PaMf40CUCjIaVSh+9/S6lBN6BEFRM
 DY0fd+XzjKIn0RCJWf6LNpy0kAIypuIjs+tX3XwJpcYXFhlGBYLC0Nay8
 qM2eomP7ASapgL9PSaRx43ccJA7BEuq0vDAT/KOObBtiVRkfJzcokNL56 A=;
X-IronPort-AV: E=Sophos;i="5.85,362,1624320000"; d="scan'208";a="165923525"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-pdx-2b-05e8af15.us-west-2.amazon.com) ([10.25.36.214])
 by smtp-border-fw-9102.sea19.amazon.com with ESMTP; 10 Oct 2021 06:50:37 +0000
Received: from EX13D19EUB003.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-pdx-2b-05e8af15.us-west-2.amazon.com (Postfix) with
 ESMTPS id C55F1A2855; Sun, 10 Oct 2021 06:50:36 +0000 (UTC)
Received: from [192.168.22.40] (10.43.160.215) by EX13D19EUB003.ant.amazon.com
 (10.43.166.69) with Microsoft SMTP Server (TLS) id 15.0.1497.23;
 Sun, 10 Oct 2021 06:50:29 +0000
Message-ID: <ed04e512-ffad-58c8-4e8b-83c6b6099f0f@amazon.com>
Date: Sun, 10 Oct 2021 09:50:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.1.2
Subject: Re: [RFC PATCH 1/2] dma-buf: Fix pin callback comment
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Doug Ledford <dledford@redhat.com>, Jason
 Gunthorpe <jgg@ziepe.ca>
CC: <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-rdma@vger.kernel.org>, Oded Gabbay
 <ogabbay@habana.ai>, Tomer Tayar <ttayar@habana.ai>, Yossi Leybovich
 <sleybo@amazon.com>, Alexander Matushevsky <matua@amazon.com>, Leon
 Romanovsky <leonro@nvidia.com>, Jianxin Xiong <jianxin.xiong@intel.com>,
 Firas Jahjah <firasj@amazon.com>
References: <20211007104301.76693-1-galpress@amazon.com>
 <20211007104301.76693-2-galpress@amazon.com>
 <747d423e-9073-9bed-778a-292e47adf0f6@amd.com>
From: Gal Pressman <galpress@amazon.com>
In-Reply-To: <747d423e-9073-9bed-778a-292e47adf0f6@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.43.160.215]
X-ClientProxiedBy: EX13D39UWB002.ant.amazon.com (10.43.161.116) To
 EX13D19EUB003.ant.amazon.com (10.43.166.69)
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

On 07/10/2021 13:44, Christian König wrote:
> Am 07.10.21 um 12:42 schrieb Gal Pressman:
>> The pin callback does not necessarily have to move the memory to system
>> memory, remove the sentence from the comment.
>>
>> Signed-off-by: Gal Pressman <galpress@amazon.com>
>> ---
>>   include/linux/dma-buf.h | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>> index efdc56b9d95f..93830731a9a3 100644
>> --- a/include/linux/dma-buf.h
>> +++ b/include/linux/dma-buf.h
>> @@ -86,9 +86,7 @@ struct dma_buf_ops {
>>        * @pin:
>>        *
>>        * This is called by dma_buf_pin() and lets the exporter know that the
>> -     * DMA-buf can't be moved any more. The exporter should pin the buffer
>> -     * into system memory to make sure it is generally accessible by other
>> -     * devices.
> 
> Maybe change that to something like "Ideally the exporter should pin the buffer
> so that it is generally accessible by all devices".

Sure, thanks.
