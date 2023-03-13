Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4009B6B731B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 10:49:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E5A10E492;
	Mon, 13 Mar 2023 09:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E7510E492
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 09:48:58 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so10439852wmb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 02:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678700937;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=HkyQXV8Sx9ZiihnRIEst2K2Pia3Osr/efAg4G6vW/d4=;
 b=YyIhi+qBKXeCniBQqYHNXvbSy+16jKMevR5pLkpADFaOLjyEDkhC1KEP/+/NtUNqLq
 WRtlKz6pUBPcjb4ZyHkYR+Zyfd5tzUnvH6LkYPU3ym7PxHURP+R2tVeHPQy2VivX91IT
 y1fpoowiLZ5AIV5uyXZQofz9T9bTRjLbAtZezcwoN0COtmR1SagwpWgKbSX7Uy0Y4arS
 ZrrAO5teJRJXswXBzMcBvdjWuTjdZy4iAzhhGImwEyt0elgs8DBIKVuZUNgkQQVkwcPY
 thb/JLkAv46ioNhodlfr0RgdHBKOennanVxscJu0TTFISuJgGIXZiyCXxRzFJLkzQ/jh
 kKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678700937;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HkyQXV8Sx9ZiihnRIEst2K2Pia3Osr/efAg4G6vW/d4=;
 b=AhuowQ2+75D8fw1KBMDcgKHV5CNQKi19wbQ2juELn1zCRUcAJQ8i5GORqI1cmtzDyL
 XIbqNwLxgW/9RrC0Ss93TypbqhVsWmHb6NQ54lxTv8nkpj8XfBCocaoit45Dvag310nC
 Ztd08cc+Jg2JLS73Lu/Bd9pFcj/Oyrtwgvc9cJszGSASEC33khpXSjZRzh3GXRK5orFM
 ASQlauaK8VApuCpeSBYwKh7M6Q8qA9VaAaZQ7lNI4k/DJgy/cGc1xPfhhXalr2Kj7ORd
 iTOOX5Jc8TOri0JDguRdOaGZVHZi2xLHcoRmHCLdEj43tpclRYyPMgJ6B9Kn1pzQ0dZI
 kirg==
X-Gm-Message-State: AO0yUKVBtnq0Y6V/ns6EqYXGxAm7WJj6ZUxCG3s879hMLGkD7nNNRu0w
 RpdsADlMw7urzKdJGGGbFNDB6Q==
X-Google-Smtp-Source: AK7set/o8hyLBzsXl3rkE65eXXSwq1sPMaL90pmRe5O2/veHyLmLBgHIUUgjnFdyrjDZ5pHpoAQCsg==
X-Received: by 2002:a05:600c:198a:b0:3e2:1368:e395 with SMTP id
 t10-20020a05600c198a00b003e21368e395mr10237994wmq.33.1678700937004; 
 Mon, 13 Mar 2023 02:48:57 -0700 (PDT)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 t1-20020a05600c2f8100b003e2058a7109sm4732704wmn.14.2023.03.13.02.48.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 02:48:56 -0700 (PDT)
Date: Mon, 13 Mar 2023 09:48:54 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] backlight: lp855x: mark OF related data as maybe
 unused
Message-ID: <20230313094854.GC55049@aspen.lan>
References: <20230311173556.263086-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230311173556.263086-1-krzysztof.kozlowski@linaro.org>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Mar 11, 2023 at 06:35:55PM +0100, Krzysztof Kozlowski wrote:
> The driver can be compile tested with !CONFIG_OF making certain data
> unused:
>
>   drivers/video/backlight/lp855x_bl.c:551:34: error: ‘lp855x_dt_ids’ defined but not used [-Werror=unused-const-variable=]
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
