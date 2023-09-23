Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC737AC447
	for <lists+dri-devel@lfdr.de>; Sat, 23 Sep 2023 20:04:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A96310E07A;
	Sat, 23 Sep 2023 18:04:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4968B10E07A
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 18:04:50 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-533d31a8523so888159a12.1
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 11:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695492288; x=1696097088; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bLYCr2Z4vuDAhql4XDXkXixLZPPP1JO3qvIuyryDbtU=;
 b=eZeqqgz6kKvVlFs1o1QZoSESkyD3nqDfIt9d2IRR0TVsqggjvTRf/zdKYJsPwRcoOH
 fS6hOZVz1ehfMrkJKqjfDiEhdHjReLaX/FV5Yweu84QXwhUjA397sgZcfPFiiBLznTW8
 jl8F5aqGsYEr8EDahpUEvEU3ZhGNbnFEPfRK9FHWVN2fJ96uehEM0TF7rhJKyHRWMRWo
 vSFzl5NCC+StpZr/RtZasjDqVpSXQpBvTr0OHglem+OwIDD4H5N3kF6HBwqnrNX8kRoS
 RgEtPW3fvqyA6BDXOU3nlnVnu02ZtbIpTtZvtbKPDzsVqQBkY8deywnCeGm3RXG85yvi
 iP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695492289; x=1696097089;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bLYCr2Z4vuDAhql4XDXkXixLZPPP1JO3qvIuyryDbtU=;
 b=PWSmodLd/ZBOvRb6l1lt3iBO9QUFKupAmoc7zWCKpi5BzkS/HPc8EPPuYtAVZN4CMr
 yXBKHzyVEeuLZ3C4rjRRrYdokqtD0U3I7uyTGRP2nShwsXXAViFDEdV8f+04rxVDuB/u
 GEH3T9St5CTg94V2pAIR7micl7oIbniGaH3OmaGXzm+awbxMUkrowyBDEmXjNL0Kc+KG
 CHQ52QCKMLQiGrxiwnSjqk097/0IseQJ5DexJmRAoA+/yh1FKsFbr8sDl0hAxxx7tbFK
 1PPXT4pmEdVmV30c5cAGtlBtXjMs9RDlXXd47VKxCKnfWhx8hA91rzWYBaWkKbA+FImg
 7emg==
X-Gm-Message-State: AOJu0YzEPQROYq3NPAvaKls0mYzVOfX7c9cqLJzR7BdtVmwVMRt6n37Q
 rz+nmyH+SOt7S71DiFqsQcU0Xg==
X-Google-Smtp-Source: AGHT+IEw+sN5D8rf7LUOkThHrXnJDjHXiCrShJbLvyy6HlUTwvbaS++DGIvd128TxX7bpTRBo77clg==
X-Received: by 2002:aa7:d518:0:b0:522:2111:1063 with SMTP id
 y24-20020aa7d518000000b0052221111063mr2280637edq.18.1695492288665; 
 Sat, 23 Sep 2023 11:04:48 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
 by smtp.gmail.com with ESMTPSA id
 s3-20020aa7d783000000b0053116e45317sm3534309edq.44.2023.09.23.11.04.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Sep 2023 11:04:48 -0700 (PDT)
Message-ID: <46e6aba3-cd10-5fb1-c217-5d9341a65381@linaro.org>
Date: Sat, 23 Sep 2023 20:04:45 +0200
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

1. Missing GPL
2. Missing kerneldoc
3. Missing user
4. Are you going to split the patchset into one function per patch? No.

Best regards,
Krzysztof

