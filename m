Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED20B7AC450
	for <lists+dri-devel@lfdr.de>; Sat, 23 Sep 2023 20:08:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E36E10E084;
	Sat, 23 Sep 2023 18:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B1210E07F
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 18:08:22 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-31f7400cb74so3560693f8f.2
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 11:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695492501; x=1696097301; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8RYcBLgXi2Usyjv8O8F7jTAVsfiwldX4rLiaCjIZSoY=;
 b=xJaZxMWHd+S9YESUuD8S04dHKuImSGsTXU+nY8lVR7LDwPNWUSeWYPdYNpzjZk7Q+s
 +p/ryRD8MmO7Z5l3jwwwEHt4Z4PyICAWRoRPmenDgD+tguyDqrRerAYipxTpzX6OwDst
 8KWdGP/S/tgOvNspd988DGXuKM4TeI2qt/MLKoYIWhHtGjLHwRVFUZWlXoHqrhaTPq2I
 yCot+lqryHtXTxH8aVHluIgQvVHmCv2Z8UwiJcCrLWrTZ8EUhUFTroZNHkKkJmSVWefw
 nKj8nruqi1KLpc6saSD55ueTJKx1WTNrvpHTiyqNJtT5oeLSW8OGIqmphx/SorXa5OFJ
 geow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695492501; x=1696097301;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8RYcBLgXi2Usyjv8O8F7jTAVsfiwldX4rLiaCjIZSoY=;
 b=aVObuOFDgbzhlzn3XFCcEAMyTvJyd5/rBKlL/J4RGlkDeDJvYh8MNRD6y9v5ItX01t
 vr2wc7ryLFwmFjgnQGH0SfvqTXYT7qUpz9V1L6N9KbRbmdOJXf2EArytp1acpOqH83kP
 QdxMe8gFKSdCNxP0E9x6DVGMUQquT9OqoVVFAtWDS4c+QdhosZPiOEfxv6uBlrK/vXGd
 NwqqD+faw5R8fXfzOSqV8Md4L+U/RMcPe0S/BttuWyym5ovegOTjneLmvcdSuc/RXzZM
 BPvB2+24CHGwrIvfjDZ3ayQnwQXWGBWddO8blaL6N/04zOqGA7XVCVAVlWcX7lSVcbOU
 kECw==
X-Gm-Message-State: AOJu0Yw5PmU4mQgSOIuNg6QvBbSk4eZY5CBn1qtPV5MrvBdywYQdox2m
 0v76/TyTSyKJoUykHL+lBLq4jQ==
X-Google-Smtp-Source: AGHT+IHgTWwCB7z8DnJNi+Zreo84MahTyxYFZoaRGkQRiDLl6+zBS9mKeFPkwSsb23KkMMbqczLODw==
X-Received: by 2002:a5d:6b51:0:b0:31f:d95d:20a6 with SMTP id
 x17-20020a5d6b51000000b0031fd95d20a6mr2321405wrw.12.1695492500957; 
 Sat, 23 Sep 2023 11:08:20 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a056000008c00b0031f3b04e7cdsm7440226wrx.109.2023.09.23.11.08.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Sep 2023 11:08:20 -0700 (PDT)
Message-ID: <ecda52ed-1d17-45e8-ab90-a9070ceb2d1c@linaro.org>
Date: Sat, 23 Sep 2023 20:08:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 08/15] soc: mediatek: Add cmdq_pkt_finalize_loop to CMDQ
 driver
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
 <20230918192204.32263-9-jason-jh.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230918192204.32263-9-jason-jh.lin@mediatek.com>
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
> Add cmdq_pkt_finalize_loop to CMDQ driver.
> 
> cmdq_pkt_finalize_loop appends end of command(EOC) instruction and
> jump to start of command buffer instruction to make the command
> buffer loopable.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-cmdq-helper.c | 23 +++++++++++++++++++++++
>  include/linux/soc/mediatek/mtk-cmdq.h  |  8 ++++++++
>  2 files changed, 31 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index 4be2a18a4a02..bbb127620bb3 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -475,6 +475,29 @@ int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
>  }
>  EXPORT_SYMBOL(cmdq_pkt_finalize);
>  
> +int cmdq_pkt_finalize_loop(struct cmdq_pkt *pkt)
> +{
> +	struct cmdq_instruction inst = { {0} };
> +	int err;
> +
> +	/* insert EOC and generate IRQ for each command iteration */
> +	inst.op = CMDQ_CODE_EOC;
> +	inst.value = CMDQ_EOC_IRQ_EN;
> +	err = cmdq_pkt_append_command(pkt, inst);
> +	if (err < 0)
> +		return err;
> +
> +	/* JUMP to start of pkt */
> +	err = cmdq_pkt_jump(pkt, pkt->pa_base);
> +	if (err < 0)
> +		return err;
> +
> +	pkt->loop = true;
> +
> +	return err;
> +}
> +EXPORT_SYMBOL(cmdq_pkt_finalize_loop);

NAK. No users (and please carefully think before you answer that your
other patch uses it).

Best regards,
Krzysztof

