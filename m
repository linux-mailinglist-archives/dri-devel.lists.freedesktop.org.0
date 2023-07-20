Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A5375B3A4
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 17:58:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 439A710E15E;
	Thu, 20 Jul 2023 15:58:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A27310E15E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 15:58:01 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3fbd33a57dcso8593605e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 08:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689868679; x=1690473479; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ScmE8r0rxxQCSuio4l33tUu3r4Tsu2mdETilqyHlA68=;
 b=A3exCasWYBk9MN1lB8jnIxVvIYr4390ayA7HijOrvQDBD/WZQTcZxCfhhaTK/dSRx7
 AknB73ZWYt+BFUyrwessOCVTrBcH1z60/QOQFXrQtWzH9Zmqvr5mXFNi7sC3dXNZOiGp
 nFRDgc/AFIZoqPmhnVKw05buL8OUCoEJfY06Z+fvPRDxTxFd10+4ikAkY0wgitmYMrBs
 9MvVw87BAPcBcd7vgBp1MelLgXwjyOkWtLYYAwYVgzbQflFvICZ4dWvRgTY03M1fzfSf
 aHKonVx1d+dKiNhnGMyYpQDsXgoHobkZyP4gqNvvWa0oHSOkbq0t4wEDZdgaion4k8re
 t6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689868679; x=1690473479;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ScmE8r0rxxQCSuio4l33tUu3r4Tsu2mdETilqyHlA68=;
 b=fLd6q8qVZQ3tMxc1a20q7oELuoXGb0f5yaBsj4ZSv4be4Jf3MQWoLjz12WH2rmrEFT
 W3fIkE7UKl5jdULXBoP2MT1s0obhxQT1W2F7pe1IdH2CtCiQzFfz8D85GcI7/ZHZzfrK
 VvxHOl3mPIOokCmMwQgPN7+EbrAe/grNkJkSsZpj2bZU4jLFNyDeX8Y5T7iP5NS91/fg
 ko5y+y63m5FRBfaW9syv10N2cyehlJVdGjmgb+TlAUw8M2d3RN/chXwAQREo1vvjBbG1
 OT6JjqdnVH/48ZUbhUq/4DQ+hNIuH+GhSfTz6QQy1sQ2gFTBV75cYt785ZZOyTxIHsiG
 1vqA==
X-Gm-Message-State: ABy/qLaU4jY8S3c1tHn0WHDw5lyL6Ai0A62E476+pBaIl3Kr64PVxrEf
 J6f9L6fPFXchtYjt2YYxmeqnpw==
X-Google-Smtp-Source: APBJJlGYC6yA01AOSEM/0mE5MXhgTzoU6ewGKF/cbW8YmGXhi7AkY7Gets4CXxis5J5YQaTN+4qPCA==
X-Received: by 2002:adf:ee0b:0:b0:313:f235:cd17 with SMTP id
 y11-20020adfee0b000000b00313f235cd17mr2257248wrn.40.1689868679497; 
 Thu, 20 Jul 2023 08:57:59 -0700 (PDT)
Received: from [10.1.3.131]
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 o8-20020adfeac8000000b003143b7449ffsm1690412wrn.25.2023.07.20.08.57.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jul 2023 08:57:59 -0700 (PDT)
Message-ID: <d2817cd7-0d44-5572-8e38-da5478da5fe7@baylibre.com>
Date: Thu, 20 Jul 2023 17:57:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 03/11] drm/mediatek: dp: Change logging to dev for
 mtk_dp_aux_transfer()
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
References: <20230717141438.274419-1-angelogioacchino.delregno@collabora.com>
 <20230717141438.274419-4-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230717141438.274419-4-angelogioacchino.delregno@collabora.com>
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
Cc: nfraprado@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 17/07/2023 16:14, AngeloGioacchino Del Regno wrote:
> Change logging from drm_{err,info}() to dev_{err,info}() in functions
> mtk_dp_aux_transfer() and mtk_dp_aux_do_transfer(): this will be
> essential to avoid getting NULL pointer kernel panics if any kind
> of error happens during AUX transfers happening before the bridge
> is attached.
> 
> This may potentially start happening in a later commit implementing
> aux-bus support, as AUX transfers will be triggered from the panel
> driver (for EDID) before the mtk-dp bridge gets attached, and it's
> done in preparation for the same.

-- 
Regards,
Alexandre
