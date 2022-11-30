Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F3A63D6A6
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 14:27:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E3510E096;
	Wed, 30 Nov 2022 13:27:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33DA10E096
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 13:27:15 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id bn5so20873840ljb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 05:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=L9Lt8MusbIeLzXLuEmIXUX298UXRhIvm9jk18drcsFo=;
 b=l57aOrkN2uN2PqRsh1eKKWNXOZ/F9drJSVv/pZ1A2t13xU5kAuOGJCLaiPPcORDqff
 estgByqVkVRqALowSAMqFHEUmRlWBDQRonomz7olwzvJAvUT7F3WVh5KDxS39nOcHEWs
 HFGujvPus5okKsrXiWD+kCRST4b2UB/4MX4bW+fZNXzL2KEIudB/LfONblgbRiYsNLZ3
 mE9zyfZULBU67zgp1vl6q+NAx2fPaYn16dZyCGeB3VrHXdhc/AOlAXiP1Nb6tcEwCyCc
 5xtmNQrHMPQwd52qzHE/9h+O7QA5cfvKDahmuvYNCEtMczxdxPDyi88hcYdmXoKjMy9n
 p4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L9Lt8MusbIeLzXLuEmIXUX298UXRhIvm9jk18drcsFo=;
 b=xfzZitc+Ry0RpDuQUoTIUU5dQWEkjVb7WYePzr+pswZCG6HzS3850vFTfAML+GKzwg
 HFF0VMAGxmHAyaesx3lD9GQCdvJn2/ND12ZV2Fl/OHtD9IMmazQWN+rr+OrNN0sDvLBn
 ry1fILomDfjORixc2D95fb5Y+r8KPGPqhAotD7EFoyQXkPQFjFpo39nX2tfdb0z7dSrc
 rOgJuPGZClixDDsocVUnB1HUatR4vaBX59n3cGUc7x0HHqL24HWluuTe/8ynO0hT6rgG
 vbt1AqnsNWVEE0iYRXrCeq35uFHkvitcvpPNeqN/vTiW24qF4f6S+dyB+Srb4hqO3GWW
 XY8w==
X-Gm-Message-State: ANoB5pkku5J4q8IkTg77WszLDo4KMhwAkJeIwIZ00KaIWCxUuBOXQ5Cz
 oGJBaZkXSz2BIVVLYzODWMAuRQ==
X-Google-Smtp-Source: AA0mqf6F3wfnpDtDP8Gs5j5HfzOMh180Qqp7mnxZe5Lb5rW7gaX/Ij2qnb0gmJ4akI/C/4ibmTUsLg==
X-Received: by 2002:a05:651c:1ce:b0:278:a696:2781 with SMTP id
 d14-20020a05651c01ce00b00278a6962781mr19189869ljn.401.1669814834196; 
 Wed, 30 Nov 2022 05:27:14 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 19-20020ac25f53000000b00497a3e11608sm253815lfz.303.2022.11.30.05.27.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 05:27:13 -0800 (PST)
Message-ID: <327abc1a-b602-7aa0-b6c8-d60e96975c48@linaro.org>
Date: Wed, 30 Nov 2022 14:27:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2] dt-bindings: display: Convert fsl,imx-fb.txt to
 dt-schema
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Sascha Hauer
 <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221129180414.2729091-1-u.kleine-koenig@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221129180414.2729091-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/11/2022 19:04, Uwe Kleine-König wrote:
> Compared to the txt description this adds clocks and clock-names to
> match reality.

(...)

> +
> +maintainers:
> +  - Sascha Hauer <s.hauer@pengutronix.de>
> +  - Pengutronix Kernel Team <kernel@pengutronix.de>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - fsl,imx1-fb
> +          - fsl,imx21-fb
> +      - items:
> +          - enum:
> +              - fsl,imx25-fb
> +              - fsl,imx27-fb
> +          - const: fsl,imx21-fb
> +
> +  clocks:
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: ipg
> +      - const: ahb
> +      - const: per
> +
> +  display:
> +    $ref: /schemas/types.yaml#/definitions/phandle

You could mention here in "description" expected properties of display,
just like original binding. Anyway, looks good:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

