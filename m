Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 951D358F7DF
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 08:47:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5824EA4625;
	Thu, 11 Aug 2022 06:47:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB18A44CD
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 06:46:49 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id z25so24360511lfr.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 23:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=Ze5ZL6mhZA/038hc0sNqOpFFP77DQHoANtqwTyyYtwo=;
 b=RY/pf8JiaZcQkcC+P2qhQc18MJw/HJn+xkkoDUToY9iW1xgqkbfMZGFlUormKUpqrK
 fySHe77hclKqS7plk8bEuO2w5dMq+nzVrXi2vkwToJ7nNjC/wTsQxXWnwwo7q/2zjtLY
 K/QCdeHkzzzVl4KNzUENfRuvntkgrjAYNyyZ9GgQe1zFXzf3gL4Q6VhrH4KRMwq3dBZ6
 K1axPKKBY6Dtruxw0COScRdQIVkOfxsIZjoQSKBVqWpMBqpuknzewebRrT6+POoysB1d
 dk0fYROZ0+Yblz8e7/Qeqq7TIVMdCALvJ4P2o6LsOyqWFIub1sKb1uBPJJ6orVJlazed
 krYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Ze5ZL6mhZA/038hc0sNqOpFFP77DQHoANtqwTyyYtwo=;
 b=n3PTRp1A4S03nsqwJSV6jUcM8hvJEvgX5lJNYzki1c9qlZEim2TOAjkauhKd1pHYHt
 HIxfg2TnXPcQlk8Q7Nmjt2QibcZSekBBlmZYH3t7/kLy5blF+OaBP9tgoCGbwRN4NIQJ
 yriHMUS7Z0MSmeJJfMwA/wpNfdugKM0f7Cf/KKQ5mIcFrHRqETDaZ5O8EOk9NbbspsCk
 XkkRXaCc+q/Dn/hyuV6hOYzoB5tJnf5JrUdsMKk+n2BahCZcw062IIw2YidGp9nxuq0l
 D8ptH1FGc/yXtHiwOt/mmZLMpjWLVdFaOMx+RastB3V0Qc4qz/oHbFPgKNb+VYiDRTI3
 QeZA==
X-Gm-Message-State: ACgBeo3ZdxnA3NnCcWSYIvze2KescfkP2GlUFIqEcHicXEghJrtDo6l4
 u2cGpa2JoAVWZkKt6ClwIGGWFecst5dAQSgC
X-Google-Smtp-Source: AA6agR7URPCr/SYdpLGcqmjqS9vKnv4ta1Zr4nypW+uAe3yWDyfZdPtxX9/38lQaUQqi5eAYJnh4eg==
X-Received: by 2002:a05:6512:688:b0:48b:967a:8266 with SMTP id
 t8-20020a056512068800b0048b967a8266mr8002229lfe.243.1660200407731; 
 Wed, 10 Aug 2022 23:46:47 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
 by smtp.gmail.com with ESMTPSA id
 j24-20020ac253b8000000b0048b28acab8csm600703lfh.64.2022.08.10.23.46.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Aug 2022 23:46:47 -0700 (PDT)
Message-ID: <f6fb0920-facf-05b0-9901-e23df71d3175@linaro.org>
Date: Thu, 11 Aug 2022 09:46:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/2] dt-bindings: arm,versatile-sysreg: Convert to DT
 schema format
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220810160341.51995-1-robh@kernel.org>
 <20220810160341.51995-3-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220810160341.51995-3-robh@kernel.org>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/08/2022 19:03, Rob Herring wrote:
> Convert the arm,versatile-sysreg binding to DT schema format.
> 
> The original binding was missing 'simple-mfd' and a 'panel' sub node which
> the only user (versatile-ab.dts) of this binding has.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
