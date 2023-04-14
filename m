Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F466E1E1B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 10:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 844D610EA76;
	Fri, 14 Apr 2023 08:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87CAD10EA76
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 08:24:57 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id jg21so43366369ejc.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 01:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681460695; x=1684052695;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZrBCPg/7kEQmQ/S2HJSPkvrLLN8UQjkoca9tiMHDaUE=;
 b=iXaoED0tEhQSyqai1EUHpNUUpddB1+3po1KoelJvQpfZqBH4H6WVcBblHREMFFlW5Q
 8Kq1hy2OAtnQfaxolldPzxw6ICb6zFRRhzaPml3lz8Hy+oeQfebpYJH6tAG9Wy344SR/
 u5rm6jiEjAmPA/VfiSMyvGOJJqd02KePv4/h2VpXjdmytS96sbfQirFHcQ88xrLG3JhM
 Ke3b5bnSHYuSx66e2NJRZXo/ltKWw3tpZ27pfDoQ6rrnygFeVi1+5BvD0QTpPzZsCedU
 6rHEsdlUWSHeJWKESndXy+cnXro09stKuckPHDpDO//EeGxxya1i37IAVarJ9zDmIBEw
 xAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681460695; x=1684052695;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZrBCPg/7kEQmQ/S2HJSPkvrLLN8UQjkoca9tiMHDaUE=;
 b=W/77jheNQ+aiJTHT2ICu0rkz2Q1ZWYgP+p1+iCnW2rHNxPV4lW8gv1a7lKLqKMZO4S
 0eIjvjE2FsYG/9OTchVm03RLdfKuY1+/w5T4glnkiOWpEcEl+Et46vVcGc1weB2lZR1G
 qhG0WrqHJH2MgV0+OOm2zAa61F99cN1DWn/06hI0eXpMaroHI+8Abk6YuG/zVhVUfFIA
 dy/HRxRQIJcthlyk87azO4lOrIMLLZ29M2XXE07K+/KE76RQOplq9dJnDF54JYQTWCTZ
 t2SAdN2NpkpvMbVwlGGLADdNOh/L4yhZNSU+ZlbZct9AA5GDtQZPZo+ajGfZMGu51fla
 Ya8Q==
X-Gm-Message-State: AAQBX9eFd8SZOi5U7TvD5lilnDUPJVpsrdzDd9LL+I3LUlIiFinBuccP
 RSQc8R0EH4UJpHtDcII7aK85kg==
X-Google-Smtp-Source: AKy350YXpqn0+HLdiWaIxk7myrpXbNP2xw+hirOiGiyN4wIw3OtEzEGmrJZjwJmO7o1h3UaPSKK/WQ==
X-Received: by 2002:a17:907:e8c:b0:948:a1ae:b2c4 with SMTP id
 ho12-20020a1709070e8c00b00948a1aeb2c4mr7740362ejc.6.1681460695443; 
 Fri, 14 Apr 2023 01:24:55 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb?
 ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a170906440800b0094a8f61ef3fsm2119353ejo.173.2023.04.14.01.24.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 01:24:55 -0700 (PDT)
Message-ID: <8e629e18-547b-10a0-9be3-157f6ea139fb@linaro.org>
Date: Fri, 14 Apr 2023 10:24:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 06/27] dt-bindings: display: mediatek: ovl: Add compatible
 for MediaTek MT6795
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-7-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230412112739.160376-7-angelogioacchino.delregno@collabora.com>
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
> Add a compatible string for MediaTek Helio X10 MT6795's OVL block: this
> is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

