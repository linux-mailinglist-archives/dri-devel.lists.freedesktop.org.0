Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5DD968B16
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 17:32:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD2310E32E;
	Mon,  2 Sep 2024 15:31:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kWFUuws8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F1CC10E32F
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 15:31:57 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-533488ffaebso5227065e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 08:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725291115; x=1725895915; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=1lEAaITg61rMOKoeV9sGqIv6NT56UG0eY9VP45Si6Hs=;
 b=kWFUuws8hQOB8Rce5jXj3pnDkZQ1D6sJqLuKGdYRUU3lBa0kDQ/z2sMjSWQ5ADexjn
 Uqe/6ybf7MXnBd4V63ll6BMqm/wsBVzTfEAX7ZH6SQzwGG9Sr/Zl+fPkFePFjIgi7T0T
 lFVkxiocb1RIDwiVKk9aYoN/f5lvfdBWXH/93ImnOhdapbAld0TUdLKZkZTsTE7YQVd8
 ppNKiDtIRVCUDb7Tf11T7QsF2BAXTlx1c2eYDZlCyzKkEv95AdHkY3cbMbLiI4a3FOtD
 GCR1e8WZBo8+MhAfRQVeCO3PM7RVr8f+d6swSaXp/hkSEfIO3zLRvx6TQhWKhmkAbjbR
 Yr6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725291115; x=1725895915;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1lEAaITg61rMOKoeV9sGqIv6NT56UG0eY9VP45Si6Hs=;
 b=OCPPI8dFhCyxVHlWws7aTMPL+s+kdZsRTf2GPZWuNmN5ivdhd/ENNYV67N7QK+VWPN
 QbiINi31Zg/KW0uMotGLHJFs0wlbdnLbQxpcJL2/S1oLduZz8GFQd7kNKH0FMpmFE4eX
 nwiYmb42vI8y4Ds9GCd+SWVj+ur1gqON7aLbwDT44FGVM1u6qIFDSV4BdS7GyDKfEoO+
 hDNhj+KPR8z/DtwT10cB9fqnpm8aZplRDMtermlT0KASnR4jZkVb1MD4jWnHwMjutJED
 AvtQB9Js4LwMKvbAvpkbtOuiR/FbJ3BfxVLYHsF/Hh+Dm18dWn+QyXqTiLZe0boaue4J
 FqFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAaytleYhiHwVNMZ4YLfg+3NyYkA+96lJ1RJf5HaTrp6/1FsOiPMSzUfyv8IqPrw3d/LZxja9YmdM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywv8AmmewaIR8uhB6y0xyYcuLkXaEiHIqKafG4tr7oLlk2RbCTJ
 N+j5EkoAfFdwaLG2NFYqNGFZM1dpnKsdjxUjsC7a3etHUM73bBoQRRlX3g==
X-Google-Smtp-Source: AGHT+IGYGf8VX7LIcYOgdyPmt731pfn6LVYofo2CruraVVYwx7aQjpnX8k6VgUS23jgFdINd2tm2Fw==
X-Received: by 2002:a05:6512:a92:b0:533:77d:1176 with SMTP id
 2adb3069b0e04-53546af3011mr6978933e87.4.1725291114527; 
 Mon, 02 Sep 2024 08:31:54 -0700 (PDT)
Received: from [192.168.0.20] ([148.56.230.39])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989233403sm569728466b.212.2024.09.02.08.31.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 08:31:53 -0700 (PDT)
Message-ID: <f6566469-36fe-4cf8-b1c1-4a476e5c5645@gmail.com>
Date: Mon, 2 Sep 2024 17:31:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] soc: mediatek: cmdq: Remove cmdq_pkt_finalize()
 helper function
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Moudy Ho
 <moudy.ho@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20240901143259.16849-1-chunkuang.hu@kernel.org>
 <20240901143259.16849-4-chunkuang.hu@kernel.org>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20240901143259.16849-4-chunkuang.hu@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 01/09/2024 16:32, Chun-Kuang Hu wrote:
> In order to have fine-grained control, use cmdq_pkt_eoc() and
> cmdq_pkt_jump_rel() to replace cmdq_pkt_finalize().
> 
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Acked-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/soc/mediatek/mtk-cmdq-helper.c | 22 ----------------------
>   include/linux/soc/mediatek/mtk-cmdq.h  | 13 -------------
>   2 files changed, 35 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index a8fccedba83f..2a47dda4dd4a 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -538,27 +538,5 @@ int cmdq_pkt_eoc(struct cmdq_pkt *pkt)
>   }
>   EXPORT_SYMBOL(cmdq_pkt_eoc);
>   
> -int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
> -{
> -	struct cmdq_instruction inst = { {0} };
> -	int err;
> -
> -	/* insert EOC and generate IRQ for each command iteration */
> -	inst.op = CMDQ_CODE_EOC;
> -	inst.value = CMDQ_EOC_IRQ_EN;
> -	err = cmdq_pkt_append_command(pkt, inst);
> -	if (err < 0)
> -		return err;
> -
> -	/* JUMP to end */
> -	inst.op = CMDQ_CODE_JUMP;
> -	inst.value = CMDQ_JUMP_PASS >>
> -		cmdq_get_shift_pa(((struct cmdq_client *)pkt->cl)->chan);
> -	err = cmdq_pkt_append_command(pkt, inst);
> -
> -	return err;
> -}
> -EXPORT_SYMBOL(cmdq_pkt_finalize);
> -
>   MODULE_DESCRIPTION("MediaTek Command Queue (CMDQ) driver");
>   MODULE_LICENSE("GPL v2");
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index 5bee6f7fc400..0c3906e8ad19 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -391,14 +391,6 @@ int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa);
>    */
>   int cmdq_pkt_eoc(struct cmdq_pkt *pkt);
>   
> -/**
> - * cmdq_pkt_finalize() - Append EOC and jump command to pkt.
> - * @pkt:	the CMDQ packet
> - *
> - * Return: 0 for success; else the error code is returned
> - */
> -int cmdq_pkt_finalize(struct cmdq_pkt *pkt);
> -
>   #else /* IS_ENABLED(CONFIG_MTK_CMDQ) */
>   
>   static inline int cmdq_dev_get_client_reg(struct device *dev,
> @@ -519,11 +511,6 @@ static inline int cmdq_pkt_eoc(struct cmdq_pkt *pkt)
>   	return -EINVAL;
>   }
>   
> -static inline int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
> -{
> -	return -EINVAL;
> -}
> -
>   #endif /* IS_ENABLED(CONFIG_MTK_CMDQ) */
>   
>   #endif	/* __MTK_CMDQ_H__ */
