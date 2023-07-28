Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EF4766DC5
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 15:01:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 794BB10E6E5;
	Fri, 28 Jul 2023 13:01:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 539A510E6E5
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 13:01:15 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3fbc5d5742bso23043265e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 06:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690549274; x=1691154074; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QW6VR0xbVDGg7YcGByTjYohe8SAyF9UA/FukyNaJluU=;
 b=b6qmhCDLZx5ial+sDOWJFOT0dV5I0NmjgWyc+CLCN8TsuuB36X6UJ0KD1m46xSOI0G
 N+pgOSfKpGRLawHGfwESWZL7mLOF1GchjCOMiMkwk3rF1SIgMja4SGgc1YfebArTkVOT
 dfQz1DhOsQJb+UaVx7UMOUCfMRbEZdGpsCdSJc/SVNO+izFKzscpcFoWB1+t+d/Pcr/J
 Z+uzbSJHD5H+9vzoGZsRCZva5wktpM7d17yKww7w560AaNfOxRO5bduB7aLyysjDy/2Q
 J+L5MIbOpk9Em5q0B2E5dweFMsikV/Es4rZZq36NLKE09DgTisBf0erR74kH/0wdgO6O
 F7zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690549274; x=1691154074;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QW6VR0xbVDGg7YcGByTjYohe8SAyF9UA/FukyNaJluU=;
 b=KFHa2bcMqNLOv014CXMk0ijUdHyJxmvnYxZ/sKZkeA//vgeqI7ituE7KnfFe/dmpcs
 pSow9+XUhl9SIspa+iPiDzjv6UtgUJXLMZOiVZ/G5WXLNvZ/hvp15YqsC4pROiIJw4Ft
 bA+p2IexHm4Ik2UD96+445gIoryvorsJahnx80cz5iTIS9XgSwz5DwjIGgMdGCBEpv40
 lc/UkjVxkgIgrF+2MEMdQg0l7orhHw4taRQsWy6FH0kjTR4EwVUB6tEg5txvTzZJ8fOY
 Y0HmGDHweFjZRsgxaPF4Rm87fszcHEtjggQGl7lcEeOR05FhFO+AH4isrDPZdraNJ0wN
 gSUw==
X-Gm-Message-State: ABy/qLYx1w5hG5NDLdqA7Gn9IIx5ZRam4X1SvSWxSqDSUlU/SMn/3Y4J
 ZcDmhYmmWXVyw1QcDeS39ZqLog==
X-Google-Smtp-Source: APBJJlEmvDuoO6G/U6S079+Ig7EF8C9rgaePYvCOkc4Rlvpl1lXKFgFL1zUobv0qcSK4Q5YppqbAbA==
X-Received: by 2002:a05:600c:22c4:b0:3fb:c9f4:1506 with SMTP id
 4-20020a05600c22c400b003fbc9f41506mr1917683wmg.1.1690549273790; 
 Fri, 28 Jul 2023 06:01:13 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 v18-20020a05600c215200b003fe0bb31a6asm1216079wml.43.2023.07.28.06.01.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jul 2023 06:01:13 -0700 (PDT)
Message-ID: <764aa9af-fbf2-5dfe-9816-bab8568a925d@baylibre.com>
Date: Fri, 28 Jul 2023 15:01:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v6 06/11] drm/mediatek: gamma: Use bitfield macros
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
References: <20230727094633.22505-1-angelogioacchino.delregno@collabora.com>
 <20230727094633.22505-7-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230727094633.22505-7-angelogioacchino.delregno@collabora.com>
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
Cc: "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 ehristev@collabora.com, wenst@chromium.org, matthias.bgg@gmail.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 27/07/2023 11:46, AngeloGioacchino Del Regno wrote:
> Make the code more robust and improve readability by using bitfield
> macros instead of open coding bit operations.
> While at it, also add a definition for LUT_BITS_DEFAULT.

-- 
Regards,
Alexandre
