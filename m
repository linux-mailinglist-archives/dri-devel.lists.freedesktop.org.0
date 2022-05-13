Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A36525F9F
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 12:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB0610E8B9;
	Fri, 13 May 2022 10:18:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C24D10E8B9
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 10:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1652437111; x=1683973111;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=iywQtXelYTHo32D1tr1Is1mkpMiEf3de8gjUGnLQUz0=;
 b=t0axkAn3ZVa6uFP4hdCBjFR1lqsephLI0CAtzUDWdiJnrsCJuo2Aja46
 ntHaVyxIioSMiTPSgDV1wjzVWi/nF7IObk8wuoVPtql8K5rYYucFHF82P
 APN1auImrgcgcaETkgy4jv80botnbAY0MHM2jIcqcerSWW9DaTp+QaKsa s=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 13 May 2022 03:18:31 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2022 03:18:30 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 13 May 2022 03:18:29 -0700
Received: from [10.214.30.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 13 May
 2022 03:18:26 -0700
Message-ID: <2a45f1e1-39d5-76b3-8fd3-c1f8b288afac@quicinc.com>
Date: Fri, 13 May 2022 15:48:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V3] dma-buf: ensure unique directory name for dmabuf stats
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
References: <1652434689-6203-1-git-send-email-quic_charante@quicinc.com>
 <Yn4u0AG8iC33S3jO@kroah.com>
From: Charan Teja Kalla <quic_charante@quicinc.com>
In-Reply-To: <Yn4u0AG8iC33S3jO@kroah.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tjmercier@google.com,
 linaro-mm-sig@lists.linaro.org, hridya@google.com, sumit.semwal@linaro.org,
 christian.koenig@amd.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/13/2022 3:41 PM, Greg KH wrote:
>> Reported-by: kernel test robot <lkp@intel.com>
> The trest robot did not say that the dmabuf stat name was being
> duplicated, did it?
>

It reported a printk warning on V2[1]. Should we remove this on V3?

@Christian: Could you please drop this tag while merging?

[1] https://lore.kernel.org/all/202205110511.E0d8TXXC-lkp@intel.com/


>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>> index a6fc96e..0ad5039 100644
>> --- a/drivers/dma-buf/dma-buf.c
>> +++ b/drivers/dma-buf/dma-buf.c
>> @@ -407,6 +407,7 @@ static inline int is_dma_buf_file(struct file *file)
>>  
>>  static struct file *dma_buf_getfile(struct dma_buf *dmabuf, int flags)
>>  {
>> +	static atomic64_t dmabuf_inode = ATOMIC64_INIT(0);
>>  	struct file *file;
>>  	struct inode *inode = alloc_anon_inode(dma_buf_mnt->mnt_sb);
>>  
>> @@ -416,6 +417,13 @@ static struct file *dma_buf_getfile(struct dma_buf *dmabuf, int flags)
>>  	inode->i_size = dmabuf->size;
>>  	inode_set_bytes(inode, dmabuf->size);
>>  
>> +	/*
>> +	 * The ->i_ino acquired from get_next_ino() is not unique thus
>> +	 * not suitable for using it as dentry name by dmabuf stats.
>> +	 * Override ->i_ino with the unique and dmabuffs specific
>> +	 * value.
>> +	 */
>> +	inode->i_ino = atomic64_add_return(1, &dmabuf_inode);
>>  	file = alloc_file_pseudo(inode, dma_buf_mnt, "dmabuf",
>>  				 flags, &dma_buf_fops);
>>  	if (IS_ERR(file))
>> -- 
>> 2.7.4
>>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thanks for the ACK.

--Charan
