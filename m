Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 220B66FCCBD
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 19:28:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31CCC10E3C2;
	Tue,  9 May 2023 17:27:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36D5A10E3C2
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 17:27:55 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-50bc5197d33so11635788a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 May 2023 10:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683653273; x=1686245273;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4A92c1vtjQm0dyCbqNgY2DMk3DzF3junHi3LSgNBl4I=;
 b=TXeeB171PkquAzTh2Cb0+GAqKxFrnr/28vWsBAAsiX1GmpHMKTH4WIpmo9CM5wQ6te
 uaP/FI9TPDHJU3c4bbCTwYfVPrZVVdpduFFE5kF4vYNAXIKSSX5KMCDJLJfxg5FxZ9ax
 msfG4HsvxkWhIkEftL4Gwco1z7wYG3df+pYlRngxYt175YoPuL6YzRLh7YuTDKyYoVmJ
 jwFbJzPAPCnnsLJOz3El5GPJnmIrszkfckhATeMdbA/XOIpiwwzORkntblZYRHsNeEg6
 z3ipJpbqE0gluja6FTwOTzx9LC3w8TrU46l4wEDXvCj7/kbhdr/dBADhg+dh48TCXSsb
 BoHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683653273; x=1686245273;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4A92c1vtjQm0dyCbqNgY2DMk3DzF3junHi3LSgNBl4I=;
 b=dh81PH9kXVInUSVGSQaJgSQcy6s+WKroUGRZbHNq8sipYh4RB9VqGnlxPr3szJSC1n
 5fKKOPTEnZ+hj8HLmK0SA0HHAdfyMoHZ6MESR4ZTL10Z5O7qDUMK1l0AaVRidIrxV681
 gD5G1T03Y7EHWDdbJ+SdKJ1XF2VMM3Uzq9oL60lgmf5+S7MlkkBRbj9pRfUuWabnEBUn
 Fl6H0NqNrmzLxinbiu7Em5jpCXBlzGJwncYyuObAPhflgMGHmcYq4Zns9t312Nhskida
 cKFPKlQCMamy5H1AoM7necelGvEe2NdigLipu1ds1VkmLxkECl2Suhnmu+PwcdfVVXTB
 aBoA==
X-Gm-Message-State: AC+VfDzaG2jd9WhpaS1AqhjJXnLVOAPQsfvjYeP8d+WHxIzdVCHqAoKE
 6kg4V4aOJQilcH1+zKci6aCb/Q==
X-Google-Smtp-Source: ACHHUZ4MwBHj1nlk8aNZla64nFIvcafvGf40YO9N3RH/cCJQ7uMOJbn+Er+XO4QfiBoAembA4xcT0A==
X-Received: by 2002:aa7:c747:0:b0:50b:fb49:c4a8 with SMTP id
 c7-20020aa7c747000000b0050bfb49c4a8mr11588323eds.27.1683653273247; 
 Tue, 09 May 2023 10:27:53 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d0d5:7818:2f46:5e76?
 ([2a02:810d:15c0:828:d0d5:7818:2f46:5e76])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a056402134200b00504ecc4fa96sm960737edw.95.2023.05.09.10.27.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 10:27:52 -0700 (PDT)
Message-ID: <e17bd606-dd58-0eef-2835-7a35b629d82a@linaro.org>
Date: Tue, 9 May 2023 19:27:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/3] dt-bindings: display: hdmi-connector: add hdmi-pwr
 supply
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230507201218.2339014-1-dmitry.baryshkov@linaro.org>
 <20230507201218.2339014-2-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230507201218.2339014-2-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/05/2023 22:12, Dmitry Baryshkov wrote:
> Follow the dp-connector example and add hdmi-pwr supply to drive the 5V
> pin of the HDMI connector (together with some simple glue logic possibly
> attached to the connector).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

