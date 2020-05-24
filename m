Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 118471E016C
	for <lists+dri-devel@lfdr.de>; Sun, 24 May 2020 20:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C05889C14;
	Sun, 24 May 2020 18:15:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB32589C14
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 18:15:35 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id y5so1552295wmi.5
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 11:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=irsfSsmadqx4cn62cMsJq5Ki4bjoJ+huXBcvgx5K95s=;
 b=VQ5n7BAsC+2O+nNUUuf14VrxVdM7QAQiFFRWCGUHNC9+087aL+6tOq5Ax6SbEvuyaK
 zzMDT8Sdkv0Jv6ekY1Dg2utbtJUpiJOgifzSac/iR8IbmWBpixD3EzwUp7dSbO9NKvD5
 hPdZ1zfwZpSpp5AHWqvyAc+2iPBkQFO5Un1/+zvvVhZcqmJMbBht0/s9p0CPvBLEa/sF
 Fh5rvvv8opsJJEXJ3TDoFJ5pwGHd9KXmePKBFhXjeq7konFlI5KG5eqfe0xt0206zni/
 c2IpvVWK0DxLRx+bphbzcSsLp67vQQ7PHlIkHWTsNx84U+b/odB+WtGdRmN9ahy20dh+
 EMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=irsfSsmadqx4cn62cMsJq5Ki4bjoJ+huXBcvgx5K95s=;
 b=uhW5a1SADcOxkkV1/xoHvyKDhkGgerL58iMsOIuS9XthIKwOnCosy0ge2FX+HyFdEu
 thKJ/E8JH7qPw8UUYr3EFjnf2FbxPHmYBAkKmnBk9CgPBEXV2AyE2NFnkNciGPIWJeZC
 lfvt0lL75MTmmVsqVae1TPmWTeWhx9BGjAAR/Epcxtt+XlfmVBhh5xOnto9Pac6DklWf
 IvGSNksPz7uvlXfegWvVj5HDsHFbwgqqzeD+XZZFrMJ6+e37FY7xB5GPlF1ORDidS9x8
 tqXfvxc5zPdFDraL8rOk9j21aHKPPapcK9pkTEIF2drNhKqmwsZA5MVmnfweM0H813Z2
 g3IA==
X-Gm-Message-State: AOAM530pDUxnJphroCOHWldA5UpOLZpUxG8tQlXasiUToX+8LLkbyYHX
 DSc1x0G4Cnd1El4rjQGjSNU=
X-Google-Smtp-Source: ABdhPJwuPjNJ9e215u2BiKz1o5KUfGw9WQzKg8KGKeZlFocHfS5bMBf5EnhU4S5gdFya3ZIjVUJ8AA==
X-Received: by 2002:a1c:6a0d:: with SMTP id f13mr5560229wmc.180.1590344134557; 
 Sun, 24 May 2020 11:15:34 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.243])
 by smtp.gmail.com with ESMTPSA id 94sm16236045wrf.74.2020.05.24.11.15.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 May 2020 11:15:33 -0700 (PDT)
Subject: Re: [PATCH v5 13/13] soc: mediatek: cmdq: add set event function
To: Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>
References: <1583664775-19382-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1583664775-19382-14-git-send-email-dennis-yc.hsieh@mediatek.com>
 <d00dd874-edda-701a-2acc-540ed19d1300@gmail.com>
 <1590341965.31286.27.camel@mtkswgap22>
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <bfe4a888-61b3-130c-380b-bcac3a820cdd@gmail.com>
Date: Sun, 24 May 2020 20:15:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1590341965.31286.27.camel@mtkswgap22>
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



On 24/05/2020 19:39, Dennis-YC Hsieh wrote:
> Hi Matthias,
> 
> Thanks for your comment.
> 
> 
> On Sat, 2020-05-16 at 20:32 +0200, Matthias Brugger wrote:
>>
>> On 08/03/2020 11:52, Dennis YC Hsieh wrote:
>>> Add set event function in cmdq helper functions to set specific event.
>>>
>>> Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
>>> Reviewed-by: CK Hu <ck.hu@mediatek.com>
>>> ---
>>>  drivers/soc/mediatek/mtk-cmdq-helper.c   | 15 +++++++++++++++
>>>  include/linux/mailbox/mtk-cmdq-mailbox.h |  1 +
>>>  include/linux/soc/mediatek/mtk-cmdq.h    |  9 +++++++++
>>>  3 files changed, 25 insertions(+)
>>>
>>> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
>>> index ec5637d43254..3294c9285994 100644
>>> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
>>> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
>>> @@ -327,6 +327,21 @@ int cmdq_pkt_clear_event(struct cmdq_pkt *pkt, u16 event)
>>>  }
>>>  EXPORT_SYMBOL(cmdq_pkt_clear_event);
>>>  
>>> +int cmdq_pkt_set_event(struct cmdq_pkt *pkt, u16 event)
>>> +{
>>> +	struct cmdq_instruction inst = { {0} };
>>> +
>>> +	if (event >= CMDQ_MAX_EVENT)
>>> +		return -EINVAL;
>>> +
>>> +	inst.op = CMDQ_CODE_WFE;
>>> +	inst.value = CMDQ_WFE_UPDATE | CMDQ_WFE_UPDATE_VALUE;
>>> +	inst.event = event;
>>> +
>>> +	return cmdq_pkt_append_command(pkt, inst);
>>> +}
>>> +EXPORT_SYMBOL(cmdq_pkt_set_event);
>>> +
>>>  int cmdq_pkt_poll(struct cmdq_pkt *pkt, u8 subsys,
>>>  		  u16 offset, u32 value)
>>>  {
>>> diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
>>> index 42d2a30e6a70..ba2d811183a9 100644
>>> --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
>>> +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
>>> @@ -17,6 +17,7 @@
>>>  #define CMDQ_JUMP_PASS			CMDQ_INST_SIZE
>>>  
>>>  #define CMDQ_WFE_UPDATE			BIT(31)
>>> +#define CMDQ_WFE_UPDATE_VALUE		BIT(16)
>>>  #define CMDQ_WFE_WAIT			BIT(15)
>>>  #define CMDQ_WFE_WAIT_VALUE		0x1
>>>  
>>> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
>>> index d63749440697..ca70296ae120 100644
>>> --- a/include/linux/soc/mediatek/mtk-cmdq.h
>>> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
>>> @@ -168,6 +168,15 @@ int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event, bool clear);
>>>   */
>>>  int cmdq_pkt_clear_event(struct cmdq_pkt *pkt, u16 event);
>>>  
>>> +/**
>>> + * cmdq_pkt_set_event() - append set event command to the CMDQ packet
>>> + * @pkt:	the CMDQ packet
>>> + * @event:	the desired event to be set
>>
>> Can we add the events and their code, so that later on, when a consumer calls
>> cmdq_pkt_set_event() we don't have any magic values that are hard to understand?
> 
> Please see patch 02/13:
> http://lists.infradead.org/pipermail/linux-mediatek/2020-March/027801.html
> 
> Definitions begin with CMDQ_EVENT_ is the event id to this function.
> Since the event id is different between platform, client must parse it
> from device tree. So no magic values require when call this function.
> 
> 

Got it, thanks for clarification.
Matthias
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
