Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E916FA22D
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 10:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E3510E15D;
	Mon,  8 May 2023 08:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D11D10E15D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 08:26:05 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3063b5f32aaso2654624f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 May 2023 01:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683534363; x=1686126363;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xXa0uGPhE0KctSUw4+SndKWGHKFHHzQ2XqiJ9KtCp7I=;
 b=FTiru0tnSJy7FuH7UZujStcI8OERjVTJl8+UTIU112kpB19VMbW2UBampbjIvqDz0i
 hktclbT9kWu14p4GzOCb+g6MTseYCRYvLKP/HZWtljr/sDjfeAjKrU7aCiqZPs6Jw24m
 3XpEPVHYNjjbtOskVlfjRlQp9/rM60o/wD+Nx/JOtGf0ZsgvecI8GZb7brPPqo9Ad/+v
 qFO6OVEUIMRPX4phcUFsR3EdnULfLMX9aeziaJJdm7MV2K8TPdfBOy1Dwtcu5k+NNlrB
 o1YwDt8mtGMomAiDQB/2VghFhae4UA5KFGkhUKpRcCTS3EERpmSmBkPJfHvTmDCADnv6
 WrKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683534363; x=1686126363;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xXa0uGPhE0KctSUw4+SndKWGHKFHHzQ2XqiJ9KtCp7I=;
 b=dLmzJvU5F2lp6o5mejn5iCm5ny3ju8mX3fKd4GXDd5SG0R/e8sqH6QROfEaMBsOJrJ
 biQFo+PcgMxpPLGW/3XvyVzSzD9PVBVJDlt+GwVNZgQzzjVPs41fB8KNx97MSoPdU6hB
 C7qYsUi9J5DekTC0rMelFfouThDJNWg1BgYIEIjvEg5H0GZJ9T1PbdZCURpysU0llQwh
 LyCuIjNp9JUv5/aOy2WCx0ZxwB1qD4XFJhpnkJSfjAUMG07/DpXLMTlvSpRW3oQzUZYE
 3JMcBRr2K9Ogi/Mt4RwjxCB36SwOZejOxp2yLRDlLaH/E5xqnLTIp1dXwEvAgmekk/Cd
 RlwQ==
X-Gm-Message-State: AC+VfDxdkCyi2+U/MAKiaOdzmwm0F17x+5aG2n7R9+6CKTaFtRg389lQ
 csktFMJMh9+ADxjEMNp3v9g=
X-Google-Smtp-Source: ACHHUZ4vgqYc95MP1tLQbZAD7zAu1WzZp8GKxK+1hLCjTeIxzu3i0reKJSeaDWKZs0XindiyzHVglw==
X-Received: by 2002:a5d:46cc:0:b0:307:1bba:ea61 with SMTP id
 g12-20020a5d46cc000000b003071bbaea61mr6867402wrs.44.1683534363097; 
 Mon, 08 May 2023 01:26:03 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a7bc40b000000b003f4247fbb5fsm2888892wmi.10.2023.05.08.01.25.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 01:26:02 -0700 (PDT)
Message-ID: <7aa7aca9-aa50-209a-fefd-a0792540aceb@gmail.com>
Date: Mon, 8 May 2023 10:25:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 28/53] drm/mediatek: Convert to platform remove callback
 returning void
Content-Language: en-US, ca-ES, es-ES
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-29-u.kleine-koenig@pengutronix.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230507162616.1368908-29-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 07/05/2023 18:25, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_cec.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_cec.c b/drivers/gpu/drm/mediatek/mtk_cec.c
> index b640bc0559e7..f47f417d8ba6 100644
> --- a/drivers/gpu/drm/mediatek/mtk_cec.c
> +++ b/drivers/gpu/drm/mediatek/mtk_cec.c
> @@ -235,13 +235,12 @@ static int mtk_cec_probe(struct platform_device *pdev)
>   	return 0;
>   }
>   
> -static int mtk_cec_remove(struct platform_device *pdev)
> +static void mtk_cec_remove(struct platform_device *pdev)
>   {
>   	struct mtk_cec *cec = platform_get_drvdata(pdev);
>   
>   	mtk_cec_htplg_irq_disable(cec);
>   	clk_disable_unprepare(cec->clk);
> -	return 0;
>   }
>   
>   static const struct of_device_id mtk_cec_of_ids[] = {
> @@ -252,7 +251,7 @@ MODULE_DEVICE_TABLE(of, mtk_cec_of_ids);
>   
>   struct platform_driver mtk_cec_driver = {
>   	.probe = mtk_cec_probe,
> -	.remove = mtk_cec_remove,
> +	.remove_new = mtk_cec_remove,
>   	.driver = {
>   		.name = "mediatek-cec",
>   		.of_match_table = mtk_cec_of_ids,
