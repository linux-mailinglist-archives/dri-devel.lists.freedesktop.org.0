Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2856562E3BF
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 19:07:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3933E10E666;
	Thu, 17 Nov 2022 18:07:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9089410E666
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 18:07:35 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id g12so4126726lfh.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 10:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vc61MC15ng5hg9XN/HE09Tk5Va/o8Qyfi0Jm/l2XQGg=;
 b=WDoE+Z5NrWgh34tzb9p90gt4St3P4LpmKJu8/fU6ZRY4KBUVGb+uayCquoyTVU59RN
 7qMz1NRJFHMWQTbsw2D2RBC4Zwm+jOmyLGJdi8HSk83NmiH2oOjeq8xmXVk6MwfueC2n
 FKjZSF0wha8Znv97evAMyy+m590PTGSAljm6uB+xnNN5Xijdssqx+JBMh1uGYmdDyOPX
 zPqSPhT7QvR3MCryd67f/cDnXmIPbuw3SfQo4fXJfW64ikTRa8aHDM4wjCM2x3fBE5gk
 YIgSx/l+76u9sVunpDu6uarwICT+ytlp7AHU0Z6UZpu9LFJLezVzOYbsXeepvriTyeJu
 iTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vc61MC15ng5hg9XN/HE09Tk5Va/o8Qyfi0Jm/l2XQGg=;
 b=8SBxJdA2NPFjQKpTIPQM0ddFWwczIr2fEbr2S2ChJBcxP4eDmOpsoCuVn2aBtKV5j2
 LziEyn+WRVLZ3TyvS/uyzDZgH/jRK4MU/ZHqPPuwY79dF8kquJshXuSx7rT0ziyfwpsV
 ogRtXyse2p+1ziOOMBvgsFn/CiaE2yG9ssAr+xFhjXl8KQz4G6Ipij9ej9dpgqPxoD4K
 WEql/WeloDn27JrdD0+rC5ttAJQgI3nwn9fLt6iFIlKSMUUUjALAzP9tiuE1eX1Q77VF
 N2/EIpRROFRcACDxJ6wHZD4akvIHchLVwVoqRo9H8VSy9IJQPBR+/6MB2+8wLJPpjvUd
 bhiQ==
X-Gm-Message-State: ANoB5pmWCBOu5cHsoBh7a6tJKZG6j21J+4nSo9nu99q5mMyoJC8FrEl8
 juDP4iojbxmdmzucaenvYG+ZJg==
X-Google-Smtp-Source: AA0mqf4wziC0JjtpCHYSk2OlbVd5tdl6jKrb5WVCJQfcRVbDRpEvoGt7ai3GWxFhDkSFfDWMzcsShQ==
X-Received: by 2002:a05:6512:3fb:b0:4a2:2eb2:c88 with SMTP id
 n27-20020a05651203fb00b004a22eb20c88mr1286232lfq.496.1668708453903; 
 Thu, 17 Nov 2022 10:07:33 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a05651220d300b004b4a0482a53sm255275lfr.231.2022.11.17.10.07.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 10:07:33 -0800 (PST)
Message-ID: <dd2fcddd-13ee-34f5-575d-0de751b2042a@linaro.org>
Date: Thu, 17 Nov 2022 19:07:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 1/8] dt-bindings: display: renesas, du: Provide bindings
 for r8a779g0
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20221117122547.809644-1-tomi.valkeinen@ideasonboard.com>
 <20221117122547.809644-2-tomi.valkeinen@ideasonboard.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221117122547.809644-2-tomi.valkeinen@ideasonboard.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/11/2022 13:25, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> Extend the Renesas DU display bindings to support the r8a779g0 V4H.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  Documentation/devicetree/bindings/display/renesas,du.yaml | 2 ++
>  1 file changed, 2 insertions(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

