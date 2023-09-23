Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 033F57AC44E
	for <lists+dri-devel@lfdr.de>; Sat, 23 Sep 2023 20:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DDDE10E07D;
	Sat, 23 Sep 2023 18:07:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68DAB10E07D
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 18:07:10 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3231dff4343so124576f8f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 11:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695492429; x=1696097229; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H149ZKwWnYhZ1xunGnnrQ+QQwSAWk1F1dR91/0OJmNc=;
 b=g955HPg5ZKhX18fLeciLqWYRfr/8YA0fc1pqRkZKzEjJA+q/61affj4nWYGZI3+Hvf
 hY8UCPW5CWDDJKaE3/bWyyV5gqIary8qmzcGPEOvlvkXr7uBhkBFjHQk6X9Cuev7R8+M
 snA64aNXDav9IFMmNzigyOlwo3j3KmlDaqLcg7coeBTcUikvrZq9+rHTC3qAsrg/19qN
 YasV/tz0ilmi/6H3iKSG0YM6SgjoQA2YQUTANzAT6xrFdUtQK2jkmCw06e+Rm3UWGSAs
 u/XfHIzogvnE0VP4LQ/AAo25zLomJ2SrVZpgsz6P7tHXsZAA+dsfUojHWJ5dYQigUt5r
 kwdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695492429; x=1696097229;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H149ZKwWnYhZ1xunGnnrQ+QQwSAWk1F1dR91/0OJmNc=;
 b=t/gt+z3ZYRPo9mPwlEPcM5mRawAtwEAOK5Erw4MacbZZxxE7BxInKVGAGxfNpB391W
 sX/8p7FrB4qsqFsd1kU5LO6UDBrKHzqhhgMSVb0voo4zu6wmrSzR9LAi4C8RoddXS77A
 rakljw7ZR50E1Lybs02+ADfSDVvybErfx+M6JkvToxbSRst8fvD0ZiRAXPmWYu97fcDh
 cN0FSnZ4cK5xKFS+j9veNc/32GskIAXdG1mjITMifvrQ9kxwUFDTMQ/NiFIqR7KIFY2J
 CYusTjyWo6jYqrKI78dOukCe/nvBPFXplk24ycDw7uvFipmcY5GhWbSbq4Yp6aB+8Hy0
 1HOQ==
X-Gm-Message-State: AOJu0Yzj7q1TjCI5WxpE95/6sSex21qlkpMcRDOTHSkjFuVaTyaCVXBJ
 ljGB5Jw96stsqeUYadI4Kk0vXQ==
X-Google-Smtp-Source: AGHT+IGGssrmYKQo06++hnwES4sRRwvQ+H+tZUVgGod48UpHafZ5lCkIM3LAng25TajcdA+SQMzndg==
X-Received: by 2002:a5d:4682:0:b0:319:5234:5c92 with SMTP id
 u2-20020a5d4682000000b0031952345c92mr1812474wrq.35.1695492428791; 
 Sat, 23 Sep 2023 11:07:08 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a056000018500b0031c855d52efsm7427661wrx.87.2023.09.23.11.07.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Sep 2023 11:07:08 -0700 (PDT)
Message-ID: <84655695-52bf-a67f-e0f1-7ad46fe44e6e@linaro.org>
Date: Sat, 23 Sep 2023 20:07:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 06/15] mailbox: mediatek: Add cmdq_mbox_stop to disable
 GCE thread
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
 <20230918192204.32263-7-jason-jh.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230918192204.32263-7-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Elvis Wang <Elvis.Wang@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/09/2023 21:21, Jason-JH.Lin wrote:
> Add cmdq_mbox_stop to disable GCE thread.
> 
> To support the error handling or the stop flow of the GCE loopping
> thread, lopping thread user can call cmdq_mbox_stop to disable the
> GCE HW thread.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c       | 6 ++++++
>  include/linux/mailbox/mtk-cmdq-mailbox.h | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index 4d62b07c1411..8bd39fecbf00 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -469,6 +469,12 @@ static void cmdq_mbox_shutdown(struct mbox_chan *chan)
>  	spin_unlock_irqrestore(&thread->chan->lock, flags);
>  }
>  
> +void cmdq_mbox_stop(struct mbox_chan *chan)
> +{
> +	cmdq_mbox_shutdown(chan);
> +}
> +EXPORT_SYMBOL(cmdq_mbox_stop);

Plus there are no users.

NAK. This is not code which should be posted upstream.

Best regards,
Krzysztof

