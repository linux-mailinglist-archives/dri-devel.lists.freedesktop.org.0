Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6BB74FEBC
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 07:35:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66FB010E48E;
	Wed, 12 Jul 2023 05:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45AA510E48E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 05:34:58 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-99364ae9596so825417166b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 22:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689140096; x=1691732096;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rzJbnI9xDPktX2PXM2vmFGHodNGh1pHwZKlhR5E7tY8=;
 b=D+ciM8CzGJruO0NevH+0m/2WlZVARC7yZe+30xiAI07MJevCs5AYYvaKN4oqSK9iSv
 kAeuL7tV3jswlEA+DP3L5qRlRpgL4k6K15CcnUZaIyMOM0tnXvBfyfbQd2zKk9klpKGU
 sKv6ZWwXS/UM0wVaU4JN9302AM5wyZJk59zWFDh6fe/5Xxtvguquftn4eDWqmjRs2cN4
 woY95YCRLU7W5nkdOleKvYIWG/qSA1NWC8Jx9E+Od0PVOmG9izcoYU93Pl+G2KV9nIMf
 W3sYFSD0UoQwU9inQ3opeZb0GwMuuecJ1ZhirvtwLGX5ufejF1hj0hbpN2TtUSQ2dG5k
 LY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689140096; x=1691732096;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rzJbnI9xDPktX2PXM2vmFGHodNGh1pHwZKlhR5E7tY8=;
 b=bVyVePALpoqccobhf6hFq/j0MBb4x/3TOS4BfuiblokUzBQh4wcSjYviDeaIL/Cyug
 nHrjdIubadop/eGtY5V1+1Uz07o1bdYzulmPIeAXnSOkmoDKwKPGn0Ma/CpAF6l7QExF
 17IIfTQpv0HVwjRwtbQDxhJmqjPUcgHeqW9Jvs1qQdZXMRntcy2zx96bpAdhoCVzy9Jk
 XYaLXlBU45RAG621VHbblYk+0YpOe2DWqA8cyzwvElokRVsMxdwN0F8a4vfuvTcP/TQp
 5EuMI+2KHP+873g8abzhZ0UWtLiZAkE+il9lFWY/ncDLC1m9y9OK1Eo48pBnFK4jrwbT
 MgPQ==
X-Gm-Message-State: ABy/qLZLskku7qgnXeNEn96eZzuL4QuKiAWiZ/XjSa8N8U1TZu7KZlcX
 gDrnRyqMCn89q4VvVa/LY9TWXA==
X-Google-Smtp-Source: APBJJlH1KLJ6R946VEt7ThL/DnXhPEDSh8WytqCiKirxOQ/jpWOssUPPgI4BskjuamxGT4fAc/YO/g==
X-Received: by 2002:a17:906:b04c:b0:98d:5ae2:f1c with SMTP id
 bj12-20020a170906b04c00b0098d5ae20f1cmr15383503ejb.34.1689140095525; 
 Tue, 11 Jul 2023 22:34:55 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 cx18-20020a170906c81200b00992e14af9c3sm2039633ejb.143.2023.07.11.22.34.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jul 2023 22:34:54 -0700 (PDT)
Message-ID: <c2ae813b-c6d3-0137-b3bd-2938345ff186@linaro.org>
Date: Wed, 12 Jul 2023 07:34:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/9] dt-bindings: mfd: Add bindings for SAM9X75 LCD
 controller
Content-Language: en-US
To: Manikandan Muralidharan <manikandan.m@microchip.com>, lee@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@microchip.com, sam@ravnborg.org, bbrezillon@kernel.org,
 airlied@gmail.com, daniel@ffwll.ch, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20230712024017.218921-1-manikandan.m@microchip.com>
 <20230712024017.218921-2-manikandan.m@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230712024017.218921-2-manikandan.m@microchip.com>
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
Cc: Balakrishnan.S@microchip.com, Nayabbasha.Sayed@microchip.com,
 Balamanikandan.Gunasundar@microchip.com, Varshini.Rajendran@microchip.com,
 Dharma.B@microchip.com, Durai.ManickamKR@microchip.com,
 Hari.PrasathGE@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/07/2023 04:40, Manikandan Muralidharan wrote:
> Add new compatible string for the XLCD controller on sam9x75 variant
> of the SAM9X7 SoC family.
> The XLCD controller in sam9x75 variant supports interfacing with
> LVDS and MIPI-DSI and parallel port RGB.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

