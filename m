Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79592529D24
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 11:02:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B264510E148;
	Tue, 17 May 2022 09:02:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4631410E148
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 09:02:09 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id fd25so8901577edb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 02:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RgPVi+DWNHOkIK0uf2dswKPC6dDGkOdaICJBn5DTVB8=;
 b=iQyYjfRVFFzq25dlyesa10yBjX5Xu9MqzA/v9Uw7PphKpywZkAcdJeNgXOUO9M4Pf4
 ZQ94UqmWmlcuSdNOaVq/wueTsWCit44KazORnavmwqIX7rl7Z63K8Q1aNm0Y9ZyUBvco
 ZP6arhkkm6BNe2Z2jfJhdHh5E/OtX8knwXK6rGw2bkUu0kwmAndAAAWWgnJVQBAo6VlO
 bc8F5PiuBOZv/t0wMKs3ALrNsQiIi/K4G51GjqF9QKVwzqKXr9WBz0+QbmZ9KWX48DGl
 eAXXp0wH23PyGnm76FJdbbm+QU/Dohk0Ib/Dk4SbbT3tSZIVVogyeoEwvPzB1UTl892u
 A7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RgPVi+DWNHOkIK0uf2dswKPC6dDGkOdaICJBn5DTVB8=;
 b=nfSnw51Rv+0T/1hxIDI6aqmPJNx0wNQYepHzPaAlaAf8MrRPmWgAZ/ps3XEsoZHo4j
 xpD42dhsp2e1iJgzooWe75Nc6/BNqOBG0YRtPZPIZ2oBRNNkblFTTGQLaLiu3DOI9z0Z
 0MMZh9AH4F7g3RTPTtQp+9uc2mvPxIKWkYFBPmDo34WKQUtQI6+E1JSkgGnvY39qr9hL
 n5MihYm2U5whk6YLcT2Lb17TOHGp4Z3tk+9/o1BToyH/GzkHh8NzSSYC0K8PI/eNLZBh
 htB4aY2+JfanazjKj/sgmNtMm23+DN2UMwDvVuvzdZs7d6O6ev7jfwOWGsKV/xvz12Gm
 F6lQ==
X-Gm-Message-State: AOAM531TBQ3gBwXKNDQH0FIqfWWQ7U/FCUQOTufn7dMi+GI0j8FfyDEj
 8YULui1dXhMZF4ZGIZuqqeSxfA==
X-Google-Smtp-Source: ABdhPJyE0oiGq6f2ZE0B636lzw80jYuv2cwe46N7jkeL31ZT3I5Ap1rxo3ApQT6rHcSk91j4xh1+gQ==
X-Received: by 2002:a05:6402:363:b0:42a:aa92:c302 with SMTP id
 s3-20020a056402036300b0042aaa92c302mr12755919edw.386.1652778127744; 
 Tue, 17 May 2022 02:02:07 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 w12-20020aa7da4c000000b0042ab649183asm2450941eds.35.2022.05.17.02.02.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 02:02:07 -0700 (PDT)
Message-ID: <c397bff2-b4c0-3f85-e5b9-22f03bc80a2b@linaro.org>
Date: Tue, 17 May 2022 11:02:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 1/3] dt-bindings: display: rockchip: make reg-names
 mandatory for VOP2
Content-Language: en-US
To: Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 Sascha Hauer <s.hauer@pengutronix.de>, robh+dt@kernel.org
References: <20220511082109.1110043-1-s.hauer@pengutronix.de>
 <20220511082109.1110043-2-s.hauer@pengutronix.de> <6824319.LvFx2qVVIh@phil>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <6824319.LvFx2qVVIh@phil>
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/05/2022 00:26, Heiko Stuebner wrote:
> Hi Rob, Krzysztof,
> 
> Am Mittwoch, 11. Mai 2022, 10:21:07 CEST schrieb Sascha Hauer:
>> The VOP2 driver relies on reg-names properties, but these are not
>> documented. Add the missing documentation, make reg-names mandatory
>> and increase minItems to 2 as always both register spaces are needed.
>>
>> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> 
> does this look ok now?

Neither Rob nor me was Cced on original email, so I don't have it in my
mailbox... I would expect that scripts/get_maintainers.pl is a known tool.


Best regards,
Krzysztof
