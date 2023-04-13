Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BD06E0855
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 09:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CBF410EA54;
	Thu, 13 Apr 2023 07:55:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBA7510EA54
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 07:55:49 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id ud9so35023108ejc.7
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 00:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681372547; x=1683964547;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nYaSNvD865fCT97F0L2xR1Bm2H0BYse+wXALebMN8Dw=;
 b=YeoNBncNdratOA+nG4/QQmfDFmk+aRb6ZOjShBnjbxGcAIXWr5CFcu8lH3rlDEVkJS
 +OOAyx1sXYEyOOmDuET+oXxmkbJNH5bOrZCe7KHlRKgTHwjdAFiW6QDtz6vXm1P0Yk1E
 mZoySTs564ndc1owes8C21jnstyzCwwZX67tza3wC65AqZqLQnX+GdOhMuvKE7oAZt/W
 VeMrqSK8TTAWHLXG095rRnX6IQY8TrdiIRphf28Bx0fYCk7s5dR0FqLqsG67iq1jhNgI
 3/bPm0sEj/+ex3x4ifW5lCtyLkiV/GGYMOKDbTjLs1oRnp8E2BQTRfQDwVHEenbh0fWM
 kJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681372547; x=1683964547;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nYaSNvD865fCT97F0L2xR1Bm2H0BYse+wXALebMN8Dw=;
 b=lxG/2VfZOMKIiKy9DPCcHm4T4LiXwJLSwTR0KiCPkLw6AMMoOj5DcIjNSCvA7JydYx
 A84OhFrENIaq358ARMcZS1jG9/lkIlrE4Ef+cS4Z/4xHnzFSjYd/etje+wogGuSCR+Zv
 LXUU3w/Z1vqOXIySycnTkjnNmfia0qk0wza+ka7L+bw5v8Cti08SPKFmNcNmMrzzuSpn
 rt83B1wl7mrIwJ09aG10PmPbVt4XbzDG/EMPZkMKJbKfxnDJTDqGNx385DVIeoB71LYq
 U9grq/LKdENlcrdQlJrRrkIj2/5jGzBs+Sf0gK0WsP1YOgorKAPfwL+oMMbrtuxvqfke
 qFOQ==
X-Gm-Message-State: AAQBX9cO7jppMH01oyqRujqEs0PiQlqeJqlqPd67E11Un9Xo9gNs/OWz
 NH0r4hDRsLUa+gwCMBKWpYF15A==
X-Google-Smtp-Source: AKy350aKrgFbJ+g45nZKrL/st5lbS76IIsZLLcs6i317bpl/6vAUsECE0H23wl9cmPxFfPxWYwk2lQ==
X-Received: by 2002:a17:906:9e1f:b0:930:f953:9614 with SMTP id
 fp31-20020a1709069e1f00b00930f9539614mr1570602ejc.1.1681372547646; 
 Thu, 13 Apr 2023 00:55:47 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ec6f:1b33:ab3f:bfd7?
 ([2a02:810d:15c0:828:ec6f:1b33:ab3f:bfd7])
 by smtp.gmail.com with ESMTPSA id
 lv25-20020a170906bc9900b0094a77168584sm569716ejb.125.2023.04.13.00.55.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Apr 2023 00:55:47 -0700 (PDT)
Message-ID: <e51d76e6-2fa9-7081-7d52-f78f70080c1d@linaro.org>
Date: Thu, 13 Apr 2023 09:55:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/3] dt-bindings: display: mediatek: dsi: Add compatible
 for MediaTek MT8188
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 jitao.shi@mediatek.com, shuijing.li@mediatek.com
References: <1681366162-4949-1-git-send-email-xinlei.lee@mediatek.com>
 <1681366162-4949-2-git-send-email-xinlei.lee@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1681366162-4949-2-git-send-email-xinlei.lee@mediatek.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/04/2023 08:09, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Add dt-binding documentation of dsi for MediaTek MT8188 SoC.
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

