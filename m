Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31720272B86
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 18:16:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B6E96E4DE;
	Mon, 21 Sep 2020 16:16:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C70A6E4DE
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 16:16:28 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a9so86683wmm.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 09:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=htPCe9d3Pa34TUPhjBFaGH8jRG+GS7pqXbTfR7z8+ow=;
 b=bFr/8F0r8SQESPG+ae54M5kO3y6FJPn/zwCLYrMQZraawA77/OO7/q6mgP3wWpVDC3
 c/SeKw1k9YRMjOTs612ls6tyHIFP/czLpsQ5AP27Ju3iQglx2JTIU/RDTOmsCbRbVDEL
 kIqS6kj41Y1rnt0GJlu8gKKtRxLpOmfzifKg7CANEf4OoZ4qExU17GLLr2PKmThEhgwt
 OQrzNZNm4kaQi7P5Z3/NqMPH3xbUl+CeSWtdWInpuHpt0Hl7LlNk+Vb+N9Hjf/ITfd3+
 bMfQzlziZuc5U2m2ddQfl1+c8svX1aF1+zP9mY2081/UqiWS+1TWOcGour0yfJxlhbK0
 sfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=htPCe9d3Pa34TUPhjBFaGH8jRG+GS7pqXbTfR7z8+ow=;
 b=A2LEex2KI4iNrsCXrIMXLpvxP9arHz9ov39ovN9JezEGsIL1ligFXNZHgLFdesIP9m
 EDqcPOw+GHkVZcQbrbtCvhxVIGuBUF/s7GWu5QrXscMJBuBWKjNf6JRc9knkLuB3fy3H
 CHpyZx5tenI8HivUb06048BRK6Qz7JFiVSGDxMrrl839d2e4zRI9Gz49VVZFC64MMmKI
 clw1ojPflEUXJweNGx+uP+q59F0xh5IeIN6KvvkShZRFPnj7aEpAkGzWSS6koMEDBJMA
 +yvC7z1Gl48J+iHgW3Ui3mfFs723cJEyAVNHZTKKD5lQaITaRHZGAcOGtEfnNI8KNxCE
 wD+Q==
X-Gm-Message-State: AOAM533kK8+PPb68Ag+KwsllmBMj9D7H6uVtT+7jLyGLS1DkRRgRu4Xf
 yJW9m8mYWrxUWFh8lHgRPaE=
X-Google-Smtp-Source: ABdhPJwROwWW5Cd9tMiIlzNGJ1RQLMos0xb80a01XNW5a03Lm1yduKnwbtLNjxfaN/pF20k1d7GARg==
X-Received: by 2002:a1c:4886:: with SMTP id v128mr118594wma.139.1600704987151; 
 Mon, 21 Sep 2020 09:16:27 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id m18sm71951wmg.32.2020.09.21.09.16.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 09:16:26 -0700 (PDT)
Subject: Re: [PATCH v3 6/9] soc: mediatek: cmdq: add write_s_mask value
 function
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>
References: <1594136714-11650-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1594136714-11650-7-git-send-email-dennis-yc.hsieh@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <9073ff83-ad99-8e40-e25e-360df74435fd@gmail.com>
Date: Mon, 21 Sep 2020 18:16:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1594136714-11650-7-git-send-email-dennis-yc.hsieh@mediatek.com>
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
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, HS Liao <hs.liao@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 07/07/2020 17:45, Dennis YC Hsieh wrote:
> add write_s_mask_value function in cmdq helper functions which
> writes a constant value to address with mask and large dma
> access support.
> 
> Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>

Now pushed to v5.9-next/soc

Thanks!

> ---
>   drivers/soc/mediatek/mtk-cmdq-helper.c |   21 +++++++++++++++++++++
>   include/linux/soc/mediatek/mtk-cmdq.h  |   15 +++++++++++++++
>   2 files changed, 36 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index 4e86b65815fc..b6e25f216605 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -294,6 +294,27 @@ int cmdq_pkt_write_s_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
>   }
>   EXPORT_SYMBOL(cmdq_pkt_write_s_value);
>   
> +int cmdq_pkt_write_s_mask_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
> +				u16 addr_low, u32 value, u32 mask)
> +{
> +	struct cmdq_instruction inst = {};
> +	int err;
> +
> +	inst.op = CMDQ_CODE_MASK;
> +	inst.mask = ~mask;
> +	err = cmdq_pkt_append_command(pkt, inst);
> +	if (err < 0)
> +		return err;
> +
> +	inst.op = CMDQ_CODE_WRITE_S_MASK;
> +	inst.sop = high_addr_reg_idx;
> +	inst.offset = addr_low;
> +	inst.value = value;
> +
> +	return cmdq_pkt_append_command(pkt, inst);
> +}
> +EXPORT_SYMBOL(cmdq_pkt_write_s_mask_value);
> +
>   int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event)
>   {
>   	struct cmdq_instruction inst = { {0} };
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index ae73e10da274..d9390d76ee14 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -165,6 +165,21 @@ int cmdq_pkt_write_s_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
>   			   u16 addr_low, u32 value);
>   
>   /**
> + * cmdq_pkt_write_s_mask_value() - append write_s command with mask to the CMDQ
> + *				   packet which write value to a physical
> + *				   address
> + * @pkt:	the CMDQ packet
> + * @high_addr_reg_idx:	internal register ID which contains high address of pa
> + * @addr_low:	low address of pa
> + * @value:	the specified target value
> + * @mask:	the specified target mask
> + *
> + * Return: 0 for success; else the error code is returned
> + */
> +int cmdq_pkt_write_s_mask_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
> +				u16 addr_low, u32 value, u32 mask);
> +
> +/**
>    * cmdq_pkt_wfe() - append wait for event command to the CMDQ packet
>    * @pkt:	the CMDQ packet
>    * @event:	the desired event type to "wait and CLEAR"
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
