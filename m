Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A127203A7
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 15:45:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B071410E11D;
	Fri,  2 Jun 2023 13:45:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B12FA10E11D
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 13:45:35 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-307d58b3efbso1962212f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jun 2023 06:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685713534; x=1688305534;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=gF49zRdU5uYPaFJUudEu7rAmB8Wh16UloOD04JQ8NIs=;
 b=RVJEO2eVuCuiL1511OFZBGs54XGY4/XZu7MAVL9WepBFRG2JZjVui9DsL7r3zRTsfS
 AtGDQQzas3aSWpLbtbl6G0ZFPkbaOKdwRUfVLu76hUoIYRUh3MIQSFsy82zLtF1S5PZn
 zMe2R76tOb/Yv1lAf7Q1FTQi59VTSwVi8ODHs2nn8dyR7k/mhsb1/0zMmK2tjYhfx/25
 tKJvKlq8j94Sf6vyQwR2SyM93KBsPTp+LY5KnSkOWzN6MKI96mUuhR6cVIeYyFisHsA4
 zgh0QxEEMbq0Sw7hSZVN73QrgTEdmWhWcioTGzztTTnYGbDoG2UO1Bs7+sxNW6LFUhPf
 3YfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685713534; x=1688305534;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gF49zRdU5uYPaFJUudEu7rAmB8Wh16UloOD04JQ8NIs=;
 b=KUvUFP9/iytu46d0beQcu+n7JPWVVBiRd5wMYWxbIbgATb3O9yYyTRm2BtKcxY919j
 d/hMgk1bcen/11tHTME0u4tcRgDfm4OZmUkFPxKAn9OBYo/c3dyNtT3iEms1v3y1KS8g
 8A6iJvCTP5gEbYNe/XyKQKzfubDVc20QCSOOWUxRs+kPUN1BmKT3T1HddV9Pn3NCbViU
 Pv9kFlP8oR7cgIbfmlIC1S5/Psil/KyBzQY4m7UIfA1J5mIlyyq34RNf9DCAlz+bLucH
 AvLb7/AJCa2HsTPDJ51bwitLaTZHpDbNJg/ZKJHlsjxEbQDfRAEDTgVgXOPUHpVCigwF
 1xfg==
X-Gm-Message-State: AC+VfDwCcjC3Tr996OMnrhvohjSzYpnmG7mpdhN1ZB0uZiExrqcf7NIo
 rvkEPrBQtKjWxGvg43lwtTi9Tw==
X-Google-Smtp-Source: ACHHUZ7e5gX8srqJY3LI2LuOHEcTHAy31A308Z2pNKwyz3Q8cm4AnEw6BqUi6wXA0jx4C2egKv13DA==
X-Received: by 2002:adf:f2c7:0:b0:309:e24:57aa with SMTP id
 d7-20020adff2c7000000b003090e2457aamr45060wrp.19.1685713533710; 
 Fri, 02 Jun 2023 06:45:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:cabd:b6f:39ae:51a2?
 ([2a01:e0a:982:cbb0:cabd:b6f:39ae:51a2])
 by smtp.gmail.com with ESMTPSA id
 q12-20020a05600000cc00b003093a412310sm1741471wrx.92.2023.06.02.06.45.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jun 2023 06:45:29 -0700 (PDT)
Message-ID: <cc95cd30-ef3c-63e3-0f44-ad6338c7ed8e@linaro.org>
Date: Fri, 2 Jun 2023 15:45:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/meson: venc: include linux/bitfield.h
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Nicolas Belin <nbelin@baylibre.com>
References: <20230602124539.894888-1-arnd@kernel.org>
Organization: Linaro Developer Services
In-Reply-To: <20230602124539.894888-1-arnd@kernel.org>
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
Reply-To: neil.armstrong@linaro.org
Cc: Arnd Bergmann <arnd@arndb.de>, Carlo Caione <ccaione@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/06/2023 14:45, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Without this header, the use of FIELD_PREP() can cause a build failure:
> 
> drivers/gpu/drm/meson/meson_venc.c: In function 'meson_encl_set_gamma_table':
> drivers/gpu/drm/meson/meson_venc.c:1595:24: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
> 
> Fixes: 51fc01a03442c ("drm/meson: venc: add ENCL encoder setup for MIPI-DSI output")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/gpu/drm/meson/meson_venc.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
> index 2bdc2855e249b..3bf0d6e4fc30a 100644
> --- a/drivers/gpu/drm/meson/meson_venc.c
> +++ b/drivers/gpu/drm/meson/meson_venc.c
> @@ -5,6 +5,7 @@
>    * Copyright (C) 2015 Amlogic, Inc. All rights reserved.
>    */
>   
> +#include <linux/bitfield.h>
>   #include <linux/export.h>
>   #include <linux/iopoll.h>
>   

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
