Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 401085B96F1
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 11:04:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8E010E151;
	Thu, 15 Sep 2022 09:04:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE21910E151
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 09:04:01 +0000 (UTC)
Received: from [192.168.2.145] (109-252-122-187.nat.spd-mgts.ru
 [109.252.122.187])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A095A6601DA4;
 Thu, 15 Sep 2022 10:03:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663232640;
 bh=S1YLvSizmUIQcrD2uYb2yCCIIfInNdi/mmbDQPuBE7w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ug7NuurWv5VYl66s3rVq9CSL/vNzMEOfhHT2ruSW68q9xGzLhp6Qkfn8ZfScefyLt
 PRLwH8VtPDW2cDmQqSUMkaAc1TfscCL/9Wh7h0Pyju5MdmhWswtgWgg+yyBa6nQzAg
 usXsLgIXDU2UsR6TthrLvKzeUbwwJbUHWV57B6PoUXzTS8sUlkRcrtefimM00NfsTc
 Qngewm65dKVK5Ll1gY84IDo1VvWmlH+haIH8XCXbfuvo/le+esG+93p5IW+YVzR0G/
 4acjmReIpANfUOfkSEuweeD8PR7g8aaRPVrgl1iXi9jY4BeiVU+rQZDjqS0jTVcdAi
 qKN2B3rUDGZJQ==
Message-ID: <6051fab8-e198-fd58-2dfe-b2b344b67c15@collabora.com>
Date: Thu, 15 Sep 2022 12:03:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH -next] drm/mediatek: dp: change mtk_dp_driver to static
To: Yang Yingliang <yangyingliang@huawei.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20220913134929.1970187-1-yangyingliang@huawei.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220913134929.1970187-1-yangyingliang@huawei.com>
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
Cc: chunkuang.hu@kernel.org, msp@baylibre.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/13/22 16:49, Yang Yingliang wrote:
> mtk_dp_driver is only used in mtk_dp.c now, change it
> to static.
> 
> Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
> index dfa942ca62da..6a8c0f4c5c09 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -2642,7 +2642,7 @@ static const struct of_device_id mtk_dp_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, mtk_dp_of_match);
>  
> -struct platform_driver mtk_dp_driver = {
> +static struct platform_driver mtk_dp_driver = {
>  	.probe = mtk_dp_probe,
>  	.remove = mtk_dp_remove,
>  	.driver = {

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry

