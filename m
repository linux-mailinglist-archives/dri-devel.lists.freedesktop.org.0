Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4B6203B95
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 17:54:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B2526E096;
	Mon, 22 Jun 2020 15:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 733CB6E096
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 15:54:17 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id o11so9502623wrv.9
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 08:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5vFrkeZQfkF+X3F51MR72kw4rxnUJbdYv8qMFbrWUSo=;
 b=nKZK6zF0Dg8tJX+t3TBIsjafGj8sRbAwShgZVhOZ/O8GPVM8xpX8ss3MRXDnUbT9tS
 g2CR0AUD0k6f8YX5InVrggLH3ksl/S1idz2S/RuvG64Wf95PMrEi0X0fibuQYurSPzPZ
 rcb8yRxK8IzuE7i+2kcb8od13H9KL6t9j0RBWhC6Y3dBwh+GQE3yj3wUE3HT/9U3geBv
 qb1ZygTf9fc6JscpA67jQ6PY1sSV28vZlf1q9RdD7yHw7bZAiYqOVThjllBT3MY/jIPX
 pLrQ1itJCHIFxzZNyOASXf1PGvq+0xqGe5BzNWCjN6b9DPyMmUNnURnEPesYpOw5GcRx
 gP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=5vFrkeZQfkF+X3F51MR72kw4rxnUJbdYv8qMFbrWUSo=;
 b=GX/GcJvAEggucl6U8hYxO5+ovYvj2fR61ppCuKhv7FylRJ6aHdEQ+Od2LZ4YJfcV75
 GuKTzLiQ4wB3d3mAHy32JPu/9VZ2COzyusaiuZAfNfHba+v1tE758Y9YWLq1uNST6Cxr
 AivVYn8qF9ILSxcGeL638afS+HAo7UmHkwCOdU0gLua2lHxy4dbjJvy0iWVYorH71/06
 opZwGmFQEdG7zNKyyfQbp5xbfoDxehV3q45KKY+EiQIToHbsIjgK3w1ZwHt2I3x6dJbh
 lh3+q00zdgfcGdtQDY2Cg7dspfLv+xBctviLmgjalSIZHkYxBqEMdilRFTgveESlzDSd
 wd1Q==
X-Gm-Message-State: AOAM530VG2UyV06NDBiwD6s4B+IyAwmWHHk8FCUVlio964QEqnV8+Le0
 ipd0+ZB3vgZCu9gxHiT0ho8=
X-Google-Smtp-Source: ABdhPJzoGtwB6cLNM7pIdb83WPlgG98du1PQFqxgPDpVPiogNlfUhaRBIYFLa7tfIc+gBrzha0Zcmg==
X-Received: by 2002:a5d:4286:: with SMTP id k6mr19114188wrq.140.1592841256065; 
 Mon, 22 Jun 2020 08:54:16 -0700 (PDT)
Received: from ziggy.stardust ([213.195.114.138])
 by smtp.gmail.com with ESMTPSA id h18sm18443775wru.7.2020.06.22.08.54.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2020 08:54:14 -0700 (PDT)
Subject: Re: [PATCH v1 03/11] soc: mediatek: cmdq: add write_s function
To: Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>
References: <1592749115-24158-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1592749115-24158-4-git-send-email-dennis-yc.hsieh@mediatek.com>
 <a9c6f28a-94d1-f92b-a017-935e80d0ec26@gmail.com>
 <1592840183.1307.12.camel@mtkswgap22>
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <8bdfff5f-9fa8-7a13-79d3-dcb63d587629@gmail.com>
Date: Mon, 22 Jun 2020 17:54:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1592840183.1307.12.camel@mtkswgap22>
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
Cc: wsd_upstream@mediatek.com, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Houlong Wei <houlong.wei@mediatek.com>,
 HS Liao <hs.liao@mediatek.com>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 22/06/2020 17:36, Dennis-YC Hsieh wrote:
> Hi Matthias,
> 
> thanks for your comment.
> 
> On Mon, 2020-06-22 at 13:07 +0200, Matthias Brugger wrote:
>>
>> On 21/06/2020 16:18, Dennis YC Hsieh wrote:
>>> add write_s function in cmdq helper functions which
>>> writes value contains in internal register to address
>>> with large dma access support.
>>>
>>> Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
>>> ---
>>>  drivers/soc/mediatek/mtk-cmdq-helper.c   |   19 +++++++++++++++++++
>>>  include/linux/mailbox/mtk-cmdq-mailbox.h |    1 +
>>>  include/linux/soc/mediatek/mtk-cmdq.h    |   19 +++++++++++++++++++
>>>  3 files changed, 39 insertions(+)
>>>
>>> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
>>> index bf32e3b2ca6c..817a5a97dbe5 100644
>>> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
>>> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
>>> @@ -18,6 +18,10 @@ struct cmdq_instruction {
>>>  	union {
>>>  		u32 value;
>>>  		u32 mask;
>>> +		struct {
>>> +			u16 arg_c;
>>> +			u16 src_reg;
>>> +		};
>>>  	};
>>>  	union {
>>>  		u16 offset;
>>> @@ -222,6 +226,21 @@ int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
>>>  }
>>>  EXPORT_SYMBOL(cmdq_pkt_write_mask);
>>>  
>>> +int cmdq_pkt_write_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
>>> +		     u16 addr_low, u16 src_reg_idx)
>>> +{
>>
>> Do I understand correctly that we use CMDQ_ADDR_HIGH(addr) and
>> CMDQ_ADDR_LOW(addr) to calculate in the client high_addr_reg_idx and addr_low
>> respectively?
>>
>> In that case I think a better interface would be to pass the address and do the
>> high/low calculation in the cmdq_pkt_write_s
> 
> Not exactly. The high_addr_reg_idx parameter is index of internal
> register (which store address bit[47:16]), not result of
> CMDQ_ADDR_HIGH(addr). 
> 
> The CMDQ_ADDR_HIGH macro use in patch 02/11 cmdq_pkt_assign() api. This
> api helps assign address bit[47:16] into one of internal register by
> index. And same index could be use in cmdq_pkt_write_s(). The gce
> combine bit[47:16] in internal register and bit[15:0] in addr_low
> parameter to final address. So it is better to keep interface in this
> way.
> 

Got it, but then why don't we call cmdq_pkt_assign() in cmdq_pkt_write_s()? This
way we would get a clean API for what we want to do.
Do we expect other users of cmdq_pkt_assign()? Otherwise we could keep it
private the this file and don't export it.

By the way, why do you postfix the _s, I understand that it reflects the large
DMA access but I wonder why you choose '_s'.

Regards,
Matthias

> 
> Regards,
> Dennis
> 
>>
>> Regards,
>> Matthias
>>
>>> +	struct cmdq_instruction inst = {};
>>> +
>>> +	inst.op = CMDQ_CODE_WRITE_S;
>>> +	inst.src_t = CMDQ_REG_TYPE;
>>> +	inst.sop = high_addr_reg_idx;
>>> +	inst.offset = addr_low;
>>> +	inst.src_reg = src_reg_idx;
>>> +
>>> +	return cmdq_pkt_append_command(pkt, inst);
>>> +}
>>> +EXPORT_SYMBOL(cmdq_pkt_write_s);
>>> +
>>>  int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event)
>>>  {
>>>  	struct cmdq_instruction inst = { {0} };
>>> diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
>>> index 121c3bb6d3de..ee67dd3b86f5 100644
>>> --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
>>> +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
>>> @@ -59,6 +59,7 @@ enum cmdq_code {
>>>  	CMDQ_CODE_JUMP = 0x10,
>>>  	CMDQ_CODE_WFE = 0x20,
>>>  	CMDQ_CODE_EOC = 0x40,
>>> +	CMDQ_CODE_WRITE_S = 0x90,
>>>  	CMDQ_CODE_LOGIC = 0xa0,
>>>  };
>>>  
>>> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
>>> index 83340211e1d3..e1c5a7549b4f 100644
>>> --- a/include/linux/soc/mediatek/mtk-cmdq.h
>>> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
>>> @@ -12,6 +12,8 @@
>>>  #include <linux/timer.h>
>>>  
>>>  #define CMDQ_NO_TIMEOUT		0xffffffffu
>>> +#define CMDQ_ADDR_HIGH(addr)	((u32)(((addr) >> 16) & GENMASK(31, 0)))
>>> +#define CMDQ_ADDR_LOW(addr)	((u16)(addr) | BIT(1))
>>>  
>>>  struct cmdq_pkt;
>>>  
>>> @@ -103,6 +105,23 @@ int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
>>>  			u16 offset, u32 value, u32 mask);
>>>  
>>>  /**
>>> + * cmdq_pkt_write_s() - append write_s command to the CMDQ packet
>>> + * @pkt:	the CMDQ packet
>>> + * @high_addr_reg_idx:	internal register ID which contains high address of pa
>>> + * @addr_low:	low address of pa
>>> + * @src_reg_idx:	the CMDQ internal register ID which cache source value
>>> + *
>>> + * Return: 0 for success; else the error code is returned
>>> + *
>>> + * Support write value to physical address without subsys. Use CMDQ_ADDR_HIGH()
>>> + * to get high address and call cmdq_pkt_assign() to assign value into internal
>>> + * reg. Also use CMDQ_ADDR_LOW() to get low address for addr_low parameter when
>>> + * call to this function.
>>> + */
>>> +int cmdq_pkt_write_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
>>> +		     u16 addr_low, u16 src_reg_idx);
>>> +
>>> +/**
>>>   * cmdq_pkt_wfe() - append wait for event command to the CMDQ packet
>>>   * @pkt:	the CMDQ packet
>>>   * @event:	the desired event type to "wait and CLEAR"
>>>
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
