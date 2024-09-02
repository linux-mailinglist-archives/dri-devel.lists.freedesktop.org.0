Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E63968C0E
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 18:32:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D128510E379;
	Mon,  2 Sep 2024 16:31:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DoiKe9r8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A356110E35B;
 Mon,  2 Sep 2024 16:31:57 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a8696e9bd24so513685366b.0; 
 Mon, 02 Sep 2024 09:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725294716; x=1725899516; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=qIuNgf8vibX5+q+1uvohe/8Xj5W/5yWFtisNRGo9UZU=;
 b=DoiKe9r8jt3bh2IAc1U+pYX6Xg2U1Q3kTx9LmLANFaE2dvr2ZgkVfNao8JnZFO8m0k
 aQnByL58zDR53AAEbJU9u/xiJ87dckzG6DB4ZT11zL80m2Qvy+A7nNxQQQEPl5WASWPc
 OyAmf22kUZCkg9S3DbeGDgT5l9OYl7KBIdMrVMWm5e4GtsaLxWMlLI40s0VkmSmlIQXY
 106+iChrHuOuPY3jRIHMUWh2kZnNEoBCdRqx/U481yQDaRNNHJK4ZQ4oKxkeeKoQ+Hd6
 NCgb45TQliPjnLFzPzQik0EHEzwqBZtSrptQTiX2eb6LFt4sEZnOYzzQgi9jbIedbqJB
 xWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725294716; x=1725899516;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qIuNgf8vibX5+q+1uvohe/8Xj5W/5yWFtisNRGo9UZU=;
 b=NjqeQA0e68Ud80mHxBStuMs+7VsYknh60usbqc8OCkpW5fLUe7YY3idVj+Rrc8Sa5B
 QKAzsBBPTOl9F1T8e1EAnrOgpi+kolBLNNdii9v+LZoDjstdApl0nvjclccdfyfT2SD/
 MQSOe6V4Pr9zin5X2ep1T+6ncdmUYY6/erp1Ud67BkgcgDibs4chyMlsHozl7VKr4DE2
 QY4ZZ75b77CwAhJwUDLE0xD/6xocmJ6BeVoaIXK6P/joh68mr2eKgb95jT6FTdchYTPI
 Cw/Z+rGQPk7pnZzXJ6zYZle5+ZWIxvWlgUP3fd3EALRTAW3wcF+xvfnj72rLzH6Uima0
 EDRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIH4CSd5jYrdIbG6JLKEDz0ZVcmb/UwGYwWbl4wK5WilYDCLn3/5Ygzlshtg5Q7zwR/pOOSF7LXglQ@lists.freedesktop.org,
 AJvYcCUkaVkyI5ujuAJbLh29kDO+lDWnu1naZTSjdUEkxLVe0WhP//ES2xXBs793a/Q4X51UumtgLehZ@lists.freedesktop.org,
 AJvYcCVVUbTJh2UlvsBnA8xyAxCzXWwOsK0kQsYPQyKfwmJ2VylzQs2xzU3M+5E/iYxtRIzLOiYzCtZxaek=@lists.freedesktop.org,
 AJvYcCXx4qSJYbQJqMdx3hjwjEAgtayRb+XFjEQQnF8im2ao69nM5c1tS8nRsKNCa5zlVzzJKEylBXrQnA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcNyrCXHLZ56cEwlLcSKg6Ax/o7IzOw0nWvVL5wcsAr8phscf3
 Sv8x0ET5xWDgyYFhYAfXQC3g7Q5y1ZaSYRohh9mgWjIrgh2M/LVs
X-Google-Smtp-Source: AGHT+IGkmyRRaFc3yk7kChHhC1FscCc8RPz9j5sqv+VQDpOUo4KdmOEEu62eFFZCqWuMxuXGFRTuSg==
X-Received: by 2002:a17:907:7204:b0:a86:c825:7678 with SMTP id
 a640c23a62f3a-a897fad7638mr1114110466b.64.1725294715458; 
 Mon, 02 Sep 2024 09:31:55 -0700 (PDT)
Received: from [192.168.0.20] ([148.56.230.39])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89892232c7sm573747166b.222.2024.09.02.09.31.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 09:31:54 -0700 (PDT)
Message-ID: <ca9c2f00-e275-454a-8c0c-b7e7cc5dcc4c@gmail.com>
Date: Mon, 2 Sep 2024 18:31:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 26/81] drm/mediatek: Run DRM default client setup
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Chun-KuaIng Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-27-tzimmermann@suse.de>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20240830084456.77630-27-tzimmermann@suse.de>
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



On 30/08/2024 10:40, Thomas Zimmermann wrote:
> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
> 
> The mediatek driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Chun-KuaIng Hu <chunkuang.hu@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 77b50c56c124..b1309a70fdcd 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -14,6 +14,7 @@
>   
>   #include <drm/drm_atomic.h>
>   #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_client_setup.h>
>   #include <drm/drm_drv.h>
>   #include <drm/drm_fbdev_dma.h>
>   #include <drm/drm_fourcc.h>
> @@ -610,6 +611,7 @@ static const struct drm_driver mtk_drm_driver = {
>   	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
>   
>   	.dumb_create = mtk_gem_dumb_create,
> +	DRM_FBDEV_DMA_DRIVER_OPS,
>   
>   	.gem_prime_import = mtk_gem_prime_import,
>   	.gem_prime_import_sg_table = mtk_gem_prime_import_sg_table,
> @@ -666,7 +668,7 @@ static int mtk_drm_bind(struct device *dev)
>   	if (ret < 0)
>   		goto err_deinit;
>   
> -	drm_fbdev_dma_setup(drm, 32);
> +	drm_client_setup(drm, NULL);
>   
>   	return 0;
>   
