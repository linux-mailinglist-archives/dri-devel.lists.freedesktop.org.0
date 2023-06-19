Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E9D735B01
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 17:21:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CC3910E054;
	Mon, 19 Jun 2023 15:21:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7149D10E054
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 15:21:00 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f90bff0f27so12770125e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 08:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687188056; x=1689780056;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XwN3PZ1wjLMk6buIa7toS1K6WytwdNPBNwxi1r1rCEk=;
 b=Aqig/3zOeQpdRTYZiGfg/KlTCq7ZXkYHPTrUprvJkAcnmhrvzkYndc+actcCZn8v9X
 2jAgfZ6+j2LQzbI2KMlkW9zc67wP+Njjj5WXT/fcUor7xSfh2iImMe9rveB45lqKXZz6
 NCI+PbbRlVniN/zbRnUizZFl2zg//nhlmmsTVWYs3BmgF4/pWaEGLIY4f9+OMfYYKNs5
 QloNDZMMfkX9Iei7tQIObiHFujbZROhRshzptvE2g55nO6W+F0n9KrSGja3F62W3tJGJ
 uDTXS/RZrYmtqU+mS5tivEkNnfpK7Y7dWtM1mqnLOgG5XxnDIGy/Hr7uMf/4Sqt52Sst
 LL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687188056; x=1689780056;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XwN3PZ1wjLMk6buIa7toS1K6WytwdNPBNwxi1r1rCEk=;
 b=NDo4xwGQ1gFPQzqpG20phONk7FHJuNGwnAAKMIL1Q53EE0NuhIctONTkQiiW5WRe9u
 poR+O/r0U3jahYgC/Cs9qp/36Jlf25kKhnVw0rx5cVvSpGCXlqlt2wgKw69QXZ+Tr0dE
 cnGvp0iPN8nBmFpgzRjgBV/PhkdMWWKbIk0nuZ24ShenzS4vPE6gxFqug1JJ9srLI591
 g0QLxZsuc7K3rKzWfptNLsOG85VAbg/MIDdENA8EpjIP8KQmMygdAHJAH5Q3TYV+IhpR
 XE/KqBvmJ9Jx9pcxoCQD+ZfpQXoiVXKTq6TwnwLmwzNtJAPFRAh4PLlp3Bnusn4xTFuj
 iPsg==
X-Gm-Message-State: AC+VfDw++Ay0KBeXlmuD6K0rmk3KMfNxgRJfP7u0VOWHh4/w7pkA7Qor
 p7KC3PQhm2jyq5j2zynaFhg=
X-Google-Smtp-Source: ACHHUZ774LceIVSslgnYV3/ERRNDOqTQzWZEwR884PFc6smp+4gyLIISFnLGepomdZBG7RtA4dOo3A==
X-Received: by 2002:a05:6000:151:b0:312:74a9:8267 with SMTP id
 r17-20020a056000015100b0031274a98267mr1127094wrx.9.1687188056191; 
 Mon, 19 Jun 2023 08:20:56 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a5d67cd000000b003111fd2e33dsm9946792wrw.30.2023.06.19.08.20.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 08:20:55 -0700 (PDT)
Message-ID: <91e84965-f44c-e5a5-67a8-e6d286a6ad99@gmail.com>
Date: Mon, 19 Jun 2023 17:20:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2, 3/3] drm/mediatek: dsi: Add dsi cmdq_ctl to send panel
 initial code
Content-Language: en-US, ca-ES, es-ES
To: Shuijing Li <shuijing.li@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 angelogioacchino.delregno@collabora.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
References: <20230616073659.26536-1-shuijing.li@mediatek.com>
 <20230616073659.26536-4-shuijing.li@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230616073659.26536-4-shuijing.li@mediatek.com>
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
Cc: devicetree@vger.kernel.org, jitao.shi@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 16/06/2023 09:36, Shuijing Li wrote:
> For mt8188, add dsi cmdq reg control to send long packets to panel
> initialization.
> 
> Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
> Changes in v2:
> use mtk_dsi_mask(dsi, DSI_CMDQ_SIZE, CMDQ_SIZE_SEL, CMDQ_SIZE_SEL); directly,
> per suggestion from the previous thread:
> https://lore.kernel.org/lkml/015f4c60-ed77-9e1f-8a6b-cda6e4f6ac93@gmail.com/
> ---
>   drivers/gpu/drm/mediatek/mtk_dsi.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 500a3054282d..8b43d9f48178 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -86,6 +86,7 @@
>   
>   #define DSI_CMDQ_SIZE		0x60
>   #define CMDQ_SIZE			0x3f
> +#define CMDQ_SIZE_SEL			BIT(15)
>   
>   #define DSI_HSTX_CKL_WC		0x64
>   
> @@ -178,6 +179,7 @@ struct mtk_dsi_driver_data {
>   	const u32 reg_cmdq_off;
>   	bool has_shadow_ctl;
>   	bool has_size_ctl;
> +	bool cmdq_long_packet_ctl;
>   };
>   
>   struct mtk_dsi {
> @@ -996,6 +998,8 @@ static void mtk_dsi_cmdq(struct mtk_dsi *dsi, const struct mipi_dsi_msg *msg)
>   
>   	mtk_dsi_mask(dsi, reg_cmdq_off, cmdq_mask, reg_val);
>   	mtk_dsi_mask(dsi, DSI_CMDQ_SIZE, CMDQ_SIZE, cmdq_size);
> +	if (dsi->driver_data->cmdq_long_packet_ctl)
> +		mtk_dsi_mask(dsi, DSI_CMDQ_SIZE, CMDQ_SIZE_SEL, CMDQ_SIZE_SEL);
>   }
>   
>   static ssize_t mtk_dsi_host_send_cmd(struct mtk_dsi *dsi,
> @@ -1200,18 +1204,21 @@ static const struct mtk_dsi_driver_data mt8183_dsi_driver_data = {
>   	.reg_cmdq_off = 0x200,
>   	.has_shadow_ctl = true,
>   	.has_size_ctl = true,
> +	.cmdq_long_packet_ctl = false,
>   };
>   
>   static const struct mtk_dsi_driver_data mt8186_dsi_driver_data = {
>   	.reg_cmdq_off = 0xd00,
>   	.has_shadow_ctl = true,
>   	.has_size_ctl = true,
> +	.cmdq_long_packet_ctl = false,
>   };
>   
>   static const struct mtk_dsi_driver_data mt8188_dsi_driver_data = {
>   	.reg_cmdq_off = 0xd00,
>   	.has_shadow_ctl = true,
>   	.has_size_ctl = true,
> +	.cmdq_long_packet_ctl = true,
>   };
>   
>   static const struct of_device_id mtk_dsi_of_match[] = {
