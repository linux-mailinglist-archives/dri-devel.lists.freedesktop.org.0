Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D434A75B395
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 17:55:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3503A10E15D;
	Thu, 20 Jul 2023 15:55:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D614410E15C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 15:55:10 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4fb7589b187so1458782e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 08:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689868509; x=1690473309; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R/vajSz0EMzHxMTH4BJFALvBAcvnPkERwUPuHlbHS8Y=;
 b=GMKGYC43J5tI4ZHdzTaBI/o/alJd9YdIhB6mQCzf0Ewrhd6/KZNv4tDsSkOsaZ20qN
 O4K5O35MUgU4VN6yPLYbkNZXEiD0s7mpvRkzYRnUyzwDKQWITr1tTAO9JtRx1mmIvkWS
 KqoW72N6eu6cVUlR/nc7dTg2sKLp49PIsN2ocLCIca7vvwSW6ET/iXtFkh2EuL7kxcm5
 92R1jXNGkeHRXvuJCY+bKOeNBMCqXSKSYj9CE2lrkExjAOCzkMtC26JDlEQ8HU2LlJJr
 6iBgbKzPD5PkQyxmfjhj/5exLb6hJ7WTRc3c0idlcIx0AqNf61XVJdpdvZC7q/GDJMKk
 qvzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689868509; x=1690473309;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R/vajSz0EMzHxMTH4BJFALvBAcvnPkERwUPuHlbHS8Y=;
 b=Lk7DRdrX6qT7Wi6pagYyUMXGkzcYa40sbGzCDqB2prySgpE/fUNN0C4A0TL25eFVLD
 f3Px+roIfL8jAJtDzS2O7gcS67qRcsfL4Q2M40Mscvm+MjmGtjeC2DMwDW0vfCf5JOfd
 PGCcS8lz6wVbA6SJw+l4EnT2EcokolIwp7X4X7Kkk/sW8/Od6FIKk0XiQbb1EwZNz2XF
 Ay4U0nZRTuBkMMSlpL1LyzOheA8k+Owr2gI31kTRw9BjapbTiLJh+unqCFLPO8cNHYhY
 JG8CFwKBfHEM3mrq2YtDO7guUxNll/YA0sypcAohA1wuqPQGEoGjx2CFX6szgvWeT9kg
 S0HQ==
X-Gm-Message-State: ABy/qLYJV/VpG6XrCoglFzj/rvT7fxGwhD2Dw7Hc0ktjqIEbIWzVS7Oh
 AhoOZueRBjZNzRlQWth4Adk1cw==
X-Google-Smtp-Source: APBJJlEBIY1TvT6KLSO+AQ7zN+qW0dTIKxqy0mEXcL2xvmxKlSGoTfz+JsEur/+Zh4XZ44l7bzIJlA==
X-Received: by 2002:a05:6512:3443:b0:4fb:8a0a:31f2 with SMTP id
 j3-20020a056512344300b004fb8a0a31f2mr2428594lfr.69.1689868508680; 
 Thu, 20 Jul 2023 08:55:08 -0700 (PDT)
Received: from [10.1.3.131]
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 q17-20020adff511000000b0031272fced4dsm1695889wro.52.2023.07.20.08.55.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jul 2023 08:55:08 -0700 (PDT)
Message-ID: <f7234a53-2449-426c-4cff-91c89bada258@baylibre.com>
Date: Thu, 20 Jul 2023 17:55:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 11/11] drm/mediatek: dp: Don't register HPD interrupt
 handler for eDP case
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
References: <20230717141438.274419-1-angelogioacchino.delregno@collabora.com>
 <20230717141438.274419-12-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230717141438.274419-12-angelogioacchino.delregno@collabora.com>
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
> The interrupt handler for HPD is useful only if a display is actually
> supposed to be hotpluggable, as that manages the machinery to perform
> cable (un)plug detection, debouncing and setup for re-training.
> 
> Since eDP panels are not supposed to be hotpluggable we can avoid
> using the HPD interrupts altogether and rely on HPD polling only
> for the suspend/resume case, saving us some spinlocking action and
> the overhead of interrupts firing at every suspend/resume cycle,
> achieving a faster (even if just slightly) display resume.

-- 
Regards,
Alexandre
