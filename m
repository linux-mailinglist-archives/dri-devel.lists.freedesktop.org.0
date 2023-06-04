Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 138DC7215F8
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 12:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 919FE10E126;
	Sun,  4 Jun 2023 10:16:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6996F10E126
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 10:16:36 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5149390b20aso5732187a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jun 2023 03:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685873794; x=1688465794;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZLg9QBJhk1oImNoGSDJiKswDbiKjTVpqU48w/ZpJGgc=;
 b=L2QUXG/6NWS2T85/D3ATrgEr19pjlsgEtwm3WZDq6GTOStkw/tdCPQyod87YsTxlEj
 ZIEUHw3xnxN6WaWwbPoSblcKwT4JJtJUAmse/8hWAeXq1/w1wXP+H/2KdWehcnbdjlXJ
 0udN2SNpie4vr/EW9zAjgrpqI9p39ejHx9sqcV25twz4AP4Qbef58xd0FIHgMqCQS6RU
 lK6HPpB+ZHftNIoL1txD8wajsGuDW7ETUPYBoZyTZIe/G4AIOEUzQqCZd2r4Oztc56Et
 A6j+gYZZVjyg1WeCmKPqYTy5izgNQ1kD3xvXnGm/mU4rcKhtW2O9nkHfYAufPt0YsIhW
 7D/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685873794; x=1688465794;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZLg9QBJhk1oImNoGSDJiKswDbiKjTVpqU48w/ZpJGgc=;
 b=JT2BHgOXynRBb4bcWGP7dPUBRqC1HNfOs9eNRYH3EPs2bd+aV9DT991lbCx4i9EXGP
 5DVrQLXdf1ynyyF0fu3cWL4hfYDRJy2jhhE1MAQnmIWP8BlEJITWUNJYrszUKo27BOPq
 mLr73C2S8OaKArqI+mf/e5wEM1/uKiF0D+AxXkstTczOXTxWI7Abaac7XQc87C5KsXjm
 sKsgYbBBz5RXGIksHa5mGYrqYuHZsNKK0xcLBCjdCwx5AGYomt5de//IKSFBJVZABsc+
 CwC1MSliPX4sGbo+Qu7ahascIIKB2UORmehOuJN9MYRQCWqZ3tOzZdulG3gONTCgMFqD
 14ww==
X-Gm-Message-State: AC+VfDxt5LRvAHj+71qN92H48WXdJ4Ib9c9hFJVA7Y0hMMHHiqhYOQfv
 EIpfP/Dnt0zTyXLxbYR/n8P1Tw==
X-Google-Smtp-Source: ACHHUZ4YqYusxv/TXLHJE8KhbEgaiaOewFEXjb3jA7TtNsn/LlZwnZM1seDK3ppCp78H/qP/xit0KQ==
X-Received: by 2002:aa7:c2d9:0:b0:514:af52:e492 with SMTP id
 m25-20020aa7c2d9000000b00514af52e492mr5536683edp.33.1685873794033; 
 Sun, 04 Jun 2023 03:16:34 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
 by smtp.gmail.com with ESMTPSA id
 bc10-20020a056402204a00b00510de087302sm2626887edb.47.2023.06.04.03.16.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Jun 2023 03:16:33 -0700 (PDT)
Message-ID: <8c0b1e70-382d-669c-c0ee-438fada6e78a@linaro.org>
Date: Sun, 4 Jun 2023 12:16:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: Add NXP i.MX93
 parallel display format configuration
Content-Language: en-US
To: Ying Liu <gnuiyl@gmail.com>
References: <20230531093206.3893469-1-victor.liu@nxp.com>
 <20230531093206.3893469-2-victor.liu@nxp.com>
 <bd257ed0-71a7-0504-0bfe-14775ac93571@linaro.org>
 <CAOcKUNWkubMK1MJS73tpbm4bafQv2GAMuq_JOTFbvB9EVDRvxg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAOcKUNWkubMK1MJS73tpbm4bafQv2GAMuq_JOTFbvB9EVDRvxg@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, rfoss@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 Liu Ying <victor.liu@nxp.com>, s.hauer@pengutronix.de, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, jernej.skrabec@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, linux-imx@nxp.com, shawnguo@kernel.org,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/06/2023 05:54, Ying Liu wrote:
> On Fri, Jun 2, 2023 at 1:45 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 31/05/2023 11:32, Liu Ying wrote:
>>> NXP i.MX93 mediamix blk-ctrl contains one DISPLAY_MUX register which
>>> configures parallel display format by using the "PARALLEL_DISP_FORMAT"
>>> field. Add device tree bindings for the display format configuration.
>>>
>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>> ---
>>> v1->v2:
>>> * No change.
>>
>> How did you implement Rob's comment?
> 
> Should have discussed more in v1 about Rob's comment, but
> let me explain why this dt-binding makes sense here:

"It needs to be defined as part of the mediamix blkctrl
schema though."

Where is it defined in mediamix blkctrl?



Best regards,
Krzysztof

