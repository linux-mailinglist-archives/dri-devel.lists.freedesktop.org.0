Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 473311E0156
	for <lists+dri-devel@lfdr.de>; Sun, 24 May 2020 20:09:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC52189A1A;
	Sun, 24 May 2020 18:09:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D9D89A1A
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 18:09:40 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l11so15214530wru.0
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 11:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=I5sd0bpTTGmV/rnbGwNSLP2tv0PAifOdYjpUCKeY/9Y=;
 b=F2lRHHdI1Gh2zVbp7VJLLXuucQ1zJQM7uX5jS6okh0tKvR8DdjzYErg3OTgTAcHluX
 yKOWYGKGtOOvMRBFGBWFpAQG/NvXvEbkNd8SO3vQH4m0LTPY3KaRNCs98Q+RBMrXcDom
 DlhHa1dYvllKU5qzHqcrUjAcT7SrVL8iJ2UY3W6STlfkT8AN0zCOxXDNn3E/8tlpcS7k
 M9XKoF+DkYtJKBSOPBdBjBx01VVX//L6wnoOauu6nql8NB0yR9jXFLTH6Ujq+wVwzY9z
 dDK4nJ8/37te84EDGdiHp2PfNqoP0l6Qb6ruy1RIl4bcWl9kZFwA+rwp8ex1PmFDfGPz
 pG3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=I5sd0bpTTGmV/rnbGwNSLP2tv0PAifOdYjpUCKeY/9Y=;
 b=SDprJBl4aehc/WJs2Ml7IrBtL3I6iP67ksbVZjoNR2DDoBFd3z1obo9MBdxVKkwwTh
 PhxeM+sR1QiRLpueXWC1O+t1VqnGH6P24g3QqtzjD2OTnsn5GZkfa/HtsEQbMVBmKvn4
 mE77+HHcVt3NcIdiiCbHP7Rk3UKqoc+XWiDbkPtp+jhBak/5wY38GYFYuQkIX3C1UyT6
 SV12wkwELV8BpIlKFhrfs8JHX4mHHiBkB+IK0jpSujWGeWhHHeUtIF+/Pjxw1fLaOLj/
 wTEK48/6HYJ16oMXpczOXu8qnileDQ82r4605dEy1Jif1JAftv5pohgHRekM1Mn6WiyN
 4TAA==
X-Gm-Message-State: AOAM5306HpiAFbva7A5n4+cicrcnUaGmPWaSVFUKrYFLNQ+qRvhBurqh
 6qWaOK7nh8dbXh7VsJG5Tvw=
X-Google-Smtp-Source: ABdhPJwUAPfdVye1qlS2OnpvE2aWbOl9Nu9LFLUxMjbIEVv0wPhNWDieR2d5P+5yES1Bm+jiaLYxoA==
X-Received: by 2002:a5d:6284:: with SMTP id k4mr12552733wru.40.1590343778785; 
 Sun, 24 May 2020 11:09:38 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.243])
 by smtp.gmail.com with ESMTPSA id w10sm4434164wrp.16.2020.05.24.11.09.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 May 2020 11:09:37 -0700 (PDT)
Subject: Re: [PATCH v5 06/13] soc: mediatek: cmdq: add assign function
To: Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>
References: <1583664775-19382-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1583664775-19382-7-git-send-email-dennis-yc.hsieh@mediatek.com>
 <c671ea8a-07fa-a050-4679-c7aa15d19a9d@gmail.com>
 <1590339695.31286.4.camel@mtkswgap22>
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <b087eb7c-7b6b-344e-0c50-34b09610e74e@gmail.com>
Date: Sun, 24 May 2020 20:09:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1590339695.31286.4.camel@mtkswgap22>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 wsd_upstream@mediatek.com, David Airlie <airlied@linux.ie>,
 Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, HS Liao <hs.liao@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Houlong Wei <houlong.wei@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 24/05/2020 19:01, Dennis-YC Hsieh wrote:
> Hi Matthias,
> 
> Thanks for your comment.
> 
> On Sat, 2020-05-16 at 19:59 +0200, Matthias Brugger wrote:
>>
>> On 08/03/2020 11:52, Dennis YC Hsieh wrote:
>>> Add assign function in cmdq helper which assign constant value into
>>> internal register by index.
>>>
>>> Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
>>> Reviewed-by: CK Hu <ck.hu@mediatek.com>
>>> ---
>>>  drivers/soc/mediatek/mtk-cmdq-helper.c   | 24 +++++++++++++++++++++++-
>>>  include/linux/mailbox/mtk-cmdq-mailbox.h |  1 +
>>>  include/linux/soc/mediatek/mtk-cmdq.h    | 14 ++++++++++++++
>>>  3 files changed, 38 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
>>> index 98f23ba3ba47..33153d17c9d9 100644
>>> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
>>> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
>>> @@ -12,6 +12,7 @@
>>>  #define CMDQ_WRITE_ENABLE_MASK	BIT(0)
>>>  #define CMDQ_POLL_ENABLE_MASK	BIT(0)
>>>  #define CMDQ_EOC_IRQ_EN		BIT(0)
>>> +#define CMDQ_REG_TYPE		1
>>>  
>>>  struct cmdq_instruction {
>>>  	union {
>>> @@ -21,8 +22,17 @@ struct cmdq_instruction {
>>>  	union {
>>>  		u16 offset;
>>>  		u16 event;
>>> +		u16 reg_dst;
>>> +	};
>>> +	union {
>>> +		u8 subsys;
>>> +		struct {
>>> +			u8 sop:5;
>>> +			u8 arg_c_t:1;
>>> +			u8 arg_b_t:1;
>>> +			u8 dst_t:1;
>>> +		};
>>
>> This union seems without context in this patch. Please drop.
>>
> 
> The dst_t use in cmdq_pkt_assign function so how about merge other

Ah didn't realize this. Then I think it's OK like it is.

Regards,
Matthias

> variables to reserved and leave dst_t ?
> 
> struct {
> 	u8 reserved_t:7;
> 	u8 dst_t:1;
> };
> 
> 
> Regards,
> Dennis
> 
> 
>> Regards,
>> Matthias
>>
>>>  	};
>>> -	u8 subsys;
>>>  	u8 op;
>>>  };
>>>  
>>> @@ -277,6 +287,18 @@ int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys,
>>>  }
>>>  EXPORT_SYMBOL(cmdq_pkt_poll_mask);
>>>  
>>> +int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value)
>>> +{
>>> +	struct cmdq_instruction inst = { {0} };
>>> +
>>> +	inst.op = CMDQ_CODE_LOGIC;
>>> +	inst.dst_t = CMDQ_REG_TYPE;
>>> +	inst.reg_dst = reg_idx;
>>> +	inst.value = value;
>>> +	return cmdq_pkt_append_command(pkt, inst);
>>> +}
>>> +EXPORT_SYMBOL(cmdq_pkt_assign);
>>> +
>>>  static int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
>>>  {
>>>  	struct cmdq_instruction inst = { {0} };
>>> diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
>>> index dfe5b2eb85cc..121c3bb6d3de 100644
>>> --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
>>> +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
>>> @@ -59,6 +59,7 @@ enum cmdq_code {
>>>  	CMDQ_CODE_JUMP = 0x10,
>>>  	CMDQ_CODE_WFE = 0x20,
>>>  	CMDQ_CODE_EOC = 0x40,
>>> +	CMDQ_CODE_LOGIC = 0xa0,
>>>  };
>>>  
>>>  enum cmdq_cb_status {
>>> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
>>> index a74c1d5acdf3..83340211e1d3 100644
>>> --- a/include/linux/soc/mediatek/mtk-cmdq.h
>>> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
>>> @@ -152,6 +152,20 @@ int cmdq_pkt_poll(struct cmdq_pkt *pkt, u8 subsys,
>>>   */
>>>  int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys,
>>>  		       u16 offset, u32 value, u32 mask);
>>> +
>>> +/**
>>> + * cmdq_pkt_assign() - Append logic assign command to the CMDQ packet, ask GCE
>>> + *		       to execute an instruction that set a constant value into
>>> + *		       internal register and use as value, mask or address in
>>> + *		       read/write instruction.
>>> + * @pkt:	the CMDQ packet
>>> + * @reg_idx:	the CMDQ internal register ID
>>> + * @value:	the specified value
>>> + *
>>> + * Return: 0 for success; else the error code is returned
>>> + */
>>> +int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value);
>>> +
>>>  /**
>>>   * cmdq_pkt_flush_async() - trigger CMDQ to asynchronously execute the CMDQ
>>>   *                          packet and call back at the end of done packet
>>>
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
