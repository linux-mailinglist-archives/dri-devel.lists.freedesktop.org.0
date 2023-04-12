Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2CC6DF584
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 14:37:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD97910E7B7;
	Wed, 12 Apr 2023 12:37:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA2610E7B7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 12:37:53 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 gw11-20020a05600c850b00b003f07d305b32so7193047wmb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 05:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681303072; x=1683895072;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DqzXeJlC0I7OCnn6X0zvc6BscDwvzPmPZCU3yLPpNiA=;
 b=g11yy33k7UG9ipZVQ9TTaveA9K8uRz761fIaV7l2bVKANwUlHj+6VO9ulIV6KMZ1R+
 1I3cfHUYxN+56k/nPh4m9ceKodMdrpuCOWmSpJKE/dOPIhiibtAwrEzR+0x49wDMNuSI
 sc4v/V0Fwh3+hj70QfO8gBccxGwGOd/cIvrFqRoUmoiKiHeUZeox+oo+I/a3NbVnulwn
 ssmrWOc/7APl2rptNC+KuwS47t6unxlguKwRN2KvpOH/HRAhhRbl/3uZcXGaosLwv0RB
 oYF0ZSKuIK0tVeVriN9wY2CSWBPDAXu4I1xbOEm6YWc1vKsRbd25DFVFh20woxjB23dP
 zMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681303072; x=1683895072;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DqzXeJlC0I7OCnn6X0zvc6BscDwvzPmPZCU3yLPpNiA=;
 b=w4mz6lnmmYSZGpiSbVpDNqrck7MDBuPuan89jF1fR1mefREPT61YadRGvibVrvd59j
 xJcA6SoCbTv5Ib9Prq3P5/UPO3SQc0s+JlH/YUYJibshJWkWyzKB5ikCuzEmfWCgMVmw
 5a3nC9RtpDyhcPN8mJo2LBlAN4sebJXIBPugMC4xvzYZeFaji3+XFZiTQVANXMG8v5jg
 9YTiY3b4H9Ms/uobLeO5823SkiqE2hd2Qs+dV+wNcDUdzaE4jOsjd3unHA0tRhqmJmHI
 RPgRQZUNhtgXI2+WbY93IE73+EVFzExowb4PKV5KtvwdjaAcbhTEl0jZDqVL3ztfXmv3
 hkwQ==
X-Gm-Message-State: AAQBX9cWc59tfd4QcqPmw/ZIRaLECxWo4gbtlqNYeVSBfBRWIn8s2lTM
 LBGaE5RI8r5GWkfr0Wkh4Us=
X-Google-Smtp-Source: AKy350YE7V2DR9bqM7GHaBKFa8M9MorPtdk6Hf8fTIr6Fb5dH11dtYMtZVVF1m92uPYPmtcZcNtEYQ==
X-Received: by 2002:a1c:4c08:0:b0:3ed:1fa1:73c5 with SMTP id
 z8-20020a1c4c08000000b003ed1fa173c5mr1898107wmf.27.1681303072175; 
 Wed, 12 Apr 2023 05:37:52 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a5d514c000000b002c561805a4csm17085971wrt.45.2023.04.12.05.37.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 05:37:51 -0700 (PDT)
Message-ID: <fc679db4-8f56-a707-9e28-6eb109b37011@gmail.com>
Date: Wed, 12 Apr 2023 14:37:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 12/27] dt-bindings: display: mediatek: split: Add
 compatible for MediaTek MT6795
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-13-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412112739.160376-13-angelogioacchino.delregno@collabora.com>
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
> Add a compatible string for MediaTek Helio X10 MT6795's SPLIT block: this
> is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   .../devicetree/bindings/display/mediatek/mediatek,split.yaml   | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
> index 35ace1f322e8..fa6dd9b649fe 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
> @@ -23,6 +23,9 @@ properties:
>       oneOf:
>         - items:
>             - const: mediatek,mt8173-disp-split
> +      - items:
> +          - const: mediatek,mt6795-disp-split
> +          - const: mediatek,mt8173-disp-split

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

>   
>     reg:
>       maxItems: 1
