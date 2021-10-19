Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69351433ABD
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 17:37:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BD396E156;
	Tue, 19 Oct 2021 15:37:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 791FC6E156
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 15:37:30 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 l38-20020a05600c1d2600b0030d80c3667aso3639428wms.5
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 08:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=RgqbMViYrJvJfXSAuMuLBuTv0g/FzYQxy3+96xrZPS0=;
 b=YmeqlfO34935zN/p6151KhT5q8/n/UAZJ7siGtJq4Wl/hpIasVfuQruYC1O5ImJlHX
 aqTyJfrXXWKok6ZXNVafOeUcZsces60DF1b1Fs+hOmL1Nv5zNwq325bWiz0I6N737JpF
 540P2ri3nDh5djMD2XvSRWdtsbnQ5OQBrYQZmKjV1YnobBOYOOlO6f8R2vSPRn86TjVx
 Hf6qIxysua0PWBdSCNpOFQSYO/fU4AnVarw1LUW5s7RMhl7UesK76DPvZIdtoTBT1C7Y
 WL6frWqMP055Ji6qUrDRFDP/pv4z5heB/8V3lJ8TYGIAQLJvrNpZtTT4A4O8iJMKBfv4
 9a8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=RgqbMViYrJvJfXSAuMuLBuTv0g/FzYQxy3+96xrZPS0=;
 b=xuWhcsVn68HWbi03UDiWnITZHL767Jt1miGEGOoAYZxtOJbDRB86TunpEGB7VzWyEA
 boy8WdCcrSZl3spCjNyW1/+It61u/hMa/PkPvMr+Cx3wJ8683AaNCwk74vS/qd/LONS8
 AFuWiee62nu7OfKAT9Px+rYfjJK8MgtcN6mGxl75LKvRgIl5HIWD2+BRfxtt3sqgTF2V
 jsMbHl6k6b0RQS1B7y/VoiALhnCbF5KIqWtrfWKUHpj3saoAgHZOGXYDvpqgYBG5ApSh
 bAp9FDIAX/hBE8QryxJhe0idWQljQSA1XOxOaQedYDJuhDzX1qN+yHfA79wy607aGwQR
 pT8A==
X-Gm-Message-State: AOAM531jV6DtgwJZQtdAa023u/YV+4/5UdYA10Kz5gPqh21MGtDcGNVc
 csYSE0kvLg4div9FrBCYIoI=
X-Google-Smtp-Source: ABdhPJyV3vN0PZ3kgNo2DYsqASVSMxXzcJdOA/Cy11dK5ItxP1hEcHr1ZXlKcn82BkT3iH0l73oVag==
X-Received: by 2002:adf:f902:: with SMTP id b2mr45955598wrr.265.1634657849077; 
 Tue, 19 Oct 2021 08:37:29 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:4fc4:fae2:bc41:a808?
 ([2a02:908:1252:fb60:4fc4:fae2:bc41:a808])
 by smtp.gmail.com with ESMTPSA id l124sm2611704wml.8.2021.10.19.08.37.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 08:37:28 -0700 (PDT)
Subject: Re: [Linaro-mm-sig] [PATCH] dma-buf: add attachments empty check for
 dma_buf_release
To: guangming.cao@mediatek.com, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, wsd_upstream@mediatek.com
References: <20211019122345.160555-1-guangming.cao@mediatek.com>
 <YW686sIZie4xRUQO@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <8cca7188-6484-d3a5-2b87-400f6500e742@gmail.com>
Date: Tue, 19 Oct 2021 17:37:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YW686sIZie4xRUQO@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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



Am 19.10.21 um 14:41 schrieb Daniel Vetter:
> On Tue, Oct 19, 2021 at 08:23:45PM +0800, guangming.cao@mediatek.com wrote:
>> From: Guangming Cao <Guangming.Cao@mediatek.com>
>>
>> Since there is no mandatory inspection for attachments in dma_buf_release.
>> There will be a case that dma_buf already released but attachment is still
>> in use, which can points to the dmabuf, and it maybe cause
>> some unexpected issues.
>>
>> With IOMMU, when this cases occurs, there will have IOMMU address
>> translation fault(s) followed by this warning,
>> I think it's useful for dma devices to debug issue.
>>
>> Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
> This feels a lot like hand-rolling kobject debugging. If you want to do
> this then I think adding kobject debug support to
> dma_buf/dma_buf_attachment would be better than hand-rolling something
> bespoke here.

Well I would call that overkill.

>
> Also on the patch itself: You don't need the trylock. For correctly
> working code non one else can get at the dma-buf, so no locking needed to
> iterate through the attachment list. For incorrect code the kernel will be
> on fire pretty soon anyway, trying to do locking won't help :-) And
> without the trylock we can catch more bugs (e.g. if you also forgot to
> unlock and not just forgot to detach).

You also don't need the WARN(!list_empty...) because a few line below we 
already have a "WARN_ON(!list_empty(&dmabuf->attachments));".

Christian.

> -Daniel
>
>> ---
>>   drivers/dma-buf/dma-buf.c | 23 +++++++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>> index 511fe0d217a0..672404857d6a 100644
>> --- a/drivers/dma-buf/dma-buf.c
>> +++ b/drivers/dma-buf/dma-buf.c
>> @@ -74,6 +74,29 @@ static void dma_buf_release(struct dentry *dentry)
>>   	 */
>>   	BUG_ON(dmabuf->cb_shared.active || dmabuf->cb_excl.active);
>>   
>> +	/* attachment check */
>> +	if (dma_resv_trylock(dmabuf->resv) && WARN(!list_empty(&dmabuf->attachments),
>> +	    "%s err, inode:%08lu size:%08zu name:%s exp_name:%s flags:0x%08x mode:0x%08x, %s\n",
>> +	    __func__, file_inode(dmabuf->file)->i_ino, dmabuf->size,
>> +	    dmabuf->name, dmabuf->exp_name,
>> +	    dmabuf->file->f_flags, dmabuf->file->f_mode,
>> +	    "Release dmabuf before detach all attachments, dump attach:\n")) {
>> +		int attach_cnt = 0;
>> +		dma_addr_t dma_addr;
>> +		struct dma_buf_attachment *attach_obj;
>> +		/* dump all attachment info */
>> +		list_for_each_entry(attach_obj, &dmabuf->attachments, node) {
>> +			dma_addr = (dma_addr_t)0;
>> +			if (attach_obj->sgt)
>> +				dma_addr = sg_dma_address(attach_obj->sgt->sgl);
>> +			pr_err("attach[%d]: dev:%s dma_addr:0x%-12lx\n",
>> +			       attach_cnt, dev_name(attach_obj->dev), dma_addr);
>> +			attach_cnt++;
>> +		}
>> +		pr_err("Total %d devices attached\n\n", attach_cnt);
>> +		dma_resv_unlock(dmabuf->resv);
>> +	}
>> +
>>   	dmabuf->ops->release(dmabuf);
>>   
>>   	if (dmabuf->resv == (struct dma_resv *)&dmabuf[1])
>> -- 
>> 2.17.1
>>

