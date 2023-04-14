Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 247956E1E5F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 10:34:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A40310EC8D;
	Fri, 14 Apr 2023 08:34:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 097E810EC8D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 08:33:57 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-94a34c2bc67so331021766b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 01:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681461236; x=1684053236;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NpwShvISTcTE3K551Ap7usqhXOxNcMryVkJfhLZoUUQ=;
 b=gsiPpWBp2wpRZMjngR/LlRcMXgtQhIJMpe1zxLflCmmCEgZt1OKJwCaaOuy1DRfeG4
 8Btrq6P7SzcRIEwS+LzlJZ7Xy8WKZllnDewpxsObInwk1yG9iMGXgLwLfVQrVvsmQ3l8
 GRnVASeSZv/aJAIJZcH2Tq5EIEKvmGeMwVpgmsKj2nG6SkyJk6BLzVeqL1fq/ClPJpAL
 D2HXXK5q+Sm/lZ+t6o/2LhFPgSoeb9zXxR7qfaDZKOqyccvzAfDms7EFm1rUOy0oT0pa
 S8ZqPM1ighYnFYjjvIwJuXJL4VsoiUOYj9wFcvl7d5v+aT2h15sOyAHO8r3o7TYGV/L8
 GreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681461236; x=1684053236;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NpwShvISTcTE3K551Ap7usqhXOxNcMryVkJfhLZoUUQ=;
 b=JAE9dqYyMwP5As5n0+ZDrRkbwxB+4cye5lRjF6vtEwKY2JmUKMuk2sx1o4ezQsNeu9
 5uXqQtOrKcFb6P/Ne2Yf9KqDaad2XwXwY++QRB6ZNG0XP5X7SUyO6XK1ek38pCgbS+le
 NKOjpqUxg53tkhT/UItLGwvusSa7ZbyuzpxoSAdJXP20TObqR922BsCAzbKytb7llGe5
 zz5bwjBHoiY4kBStfoyg4OtIX8EzhS93lugymfcBVnqdIo9BrXx4a88cRHfp6216VYiH
 YnejNIvZOWwvBsszYPmQroh23YKZk4oxEb3n4HdkScozpA58u80nkbycAYGF9EU7QXRx
 nBsw==
X-Gm-Message-State: AAQBX9c0Iu7cv3n8u3UO6tn+5AmSrVy+OpfY9bL772H7bGlBLAEfBxOj
 cY6vLy5scNwSXOVfsCxxZjevBA==
X-Google-Smtp-Source: AKy350ak3cqtwXDorNJtScCLcUQuNv92fnfl8eFxO84dV/0O6W4+Gjg7xHm2TDj2lqckrpNVg9kccw==
X-Received: by 2002:aa7:c7d4:0:b0:506:8470:c323 with SMTP id
 o20-20020aa7c7d4000000b005068470c323mr823188eds.24.1681461236235; 
 Fri, 14 Apr 2023 01:33:56 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb?
 ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
 by smtp.gmail.com with ESMTPSA id
 15-20020a170906208f00b0094a511b9e6csm2117677ejq.139.2023.04.14.01.33.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 01:33:55 -0700 (PDT)
Message-ID: <b573ddb8-3909-998d-f051-6a3c4af1c629@linaro.org>
Date: Fri, 14 Apr 2023 10:33:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 11/27] dt-bindings: display: mediatek: merge: Add
 compatible for MediaTek MT6795
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-12-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230412112739.160376-12-angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, kernel@collabora.com, xinlei.lee@mediatek.com,
 kishon@kernel.org, phone-devel@vger.kernel.org, jassisinghbrar@gmail.com,
 linux-pwm@vger.kernel.org, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, jitao.shi@mediatek.com, houlong.wei@mediatek.com,
 chunfeng.yun@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> Add a compatible string for MediaTek Helio X10 MT6795's MERGE block: this
> is the same as MT8173.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

