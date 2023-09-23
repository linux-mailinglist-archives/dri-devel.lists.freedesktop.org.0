Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D087AC454
	for <lists+dri-devel@lfdr.de>; Sat, 23 Sep 2023 20:09:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDC6010E07F;
	Sat, 23 Sep 2023 18:09:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8446310E07F
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 18:08:59 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4053cb57f02so27000445e9.1
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 11:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695492538; x=1696097338; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lNuBtdApmtdUf0XvIROq9J8oEW88H73TUSgaToXrYf4=;
 b=LvBVPCg+jXkHb8bPwZgmB4yOCxW5joAsUr6o/kp9ae0itfUoeiaVw7HwxPA3jDdwnr
 FLzwp/lp/ynlnBqr3lwaFKupxP283CeQfodg7F5X4BB/WH3vEWllYNi6RvyIQcr/U/4Q
 L8Bl13oh+2LCLm4J6eMaul+m/j/UVuTLvxKkMkUf/xmzHsXPn9p85XA9zYJbx5SXP837
 UVQV/ToZ0EfsubWL/Ck+p2rMOkOj4lgtB1W4NLLroVXn2IW0sSeBfqkTiSCi/jPRdpJx
 114JvZPrSIt5AKIujInfATD1FT8ZzzWmIyu1C33pK4sQwA+pyU7LB7NwdIB7tC7gAd4B
 uf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695492538; x=1696097338;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lNuBtdApmtdUf0XvIROq9J8oEW88H73TUSgaToXrYf4=;
 b=iFlIfXa47zoqcD1JgbCz2v4sKri8ayuZ86KQTANtfrsx47ef5Dg3S9ZDlzsmqFZfWK
 EyLZZd7lyg+0E01hg5Uod4pSWLI+LZAC2XUI2cTCeJm/zUVEVg9tA6hELrUNhXmwaXkD
 Qk158N138P7Cw15bpdOwrs6n1oSTDQ2BR91d4fbxCwJId/LpE4CApQvx3n/uf1Nbj25M
 80aLhkQOe2dXUF+oPlthi/jFTVG651zN5hDHT48z0MrpmX3W4SAu+mFdcbd/19yY4gst
 sL8IvbncmZW0tuOgJUEixxO97aLL1YJC5rfxHbRn/9JU0/dTJajbSsQl7iyjrwgqbDoq
 B6qg==
X-Gm-Message-State: AOJu0YxSv28SNr/0nZQXFBQlfNbVKHJFPM8rlpxqZSzVd8C3j2pYzxZW
 KSPpe4Gm2xujTWY3UDm30sCYcQ==
X-Google-Smtp-Source: AGHT+IGKEp63EtWq7UClnEUTgxHKAz2asZi2uiPoLLgcA6MXNaQLGed3QzNZ6A9pBoZIGrf4AgNtFA==
X-Received: by 2002:a7b:c409:0:b0:405:3d83:2b76 with SMTP id
 k9-20020a7bc409000000b004053d832b76mr2293124wmi.13.1695492537810; 
 Sat, 23 Sep 2023 11:08:57 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a5d4f0a000000b0031f3ad17b2csm7485185wru.52.2023.09.23.11.08.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Sep 2023 11:08:57 -0700 (PDT)
Message-ID: <a1dbb788-d2c8-c358-9f9e-54ca664dc6df@linaro.org>
Date: Sat, 23 Sep 2023 20:08:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 14/15] mailbox: mediatek: Add mt8195 support for CMDQ
 secure driver
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
 <20230918192204.32263-15-jason-jh.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230918192204.32263-15-jason-jh.lin@mediatek.com>
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

On 18/09/2023 21:22, Jason-JH.Lin wrote:
> Add mt8195 support for CMDQ secure driver.

How is it anyhow related to your patch content?

> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index 4e047dc916b9..d27d033c587d 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -735,6 +735,7 @@ static const struct gce_plat gce_plat_v6 = {
>  	.thread_nr = 24,
>  	.shift = 3,
>  	.control_by_sw = true,
> +	.has_sec = true,

Really, how?

Best regards,
Krzysztof

