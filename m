Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 666A86E39C5
	for <lists+dri-devel@lfdr.de>; Sun, 16 Apr 2023 17:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CAC510E241;
	Sun, 16 Apr 2023 15:20:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5455A10E241
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 15:20:57 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id xd13so23949199ejb.4
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 08:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681658455; x=1684250455;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HvXM66+wlKkFUvRtmKhBXN6oxkloozMo1v8ngT/SFfA=;
 b=UEZNrrLfnOopAP4aSZZ5loJpKwTXS5274mRgre30gZf2wxcqHerllf9Anh+j9g9vZb
 hqqZmy//KHgOb3JDMvfaYfAgGxWJAAfIW07Kbcu+jKoZd3KxT/mtxK0oK0Qf/mb0CbQr
 eRRqhrXjFUm4Isx7pBlEuJxy9WxHaeJvZMMSm3cN0FtlD1BH5St8BJwRCzQPRcQz3lxx
 k/62L39R+pjfDnWJBYadZ2znMIh9sMYgmosxIJ6OQMQTR2NK/Nux2DS1d3QPWhEDbksr
 ecT7HMUhLuMZFTWVXrM6kqYnMHEltoTIoTljjKvAAzrpQS2/yuOctgD1U+5Z0c4uUky8
 DxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681658455; x=1684250455;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HvXM66+wlKkFUvRtmKhBXN6oxkloozMo1v8ngT/SFfA=;
 b=OOEKCfjNbSrKf176VWtSOuiJhcoPMm/vfS+HLL3fBmkRbHEwtz1iuZnK0hWfICBlzx
 czgpZxSgIw0p1031sRqFDD3R3+Vg9CPQ53V2FI9URB3Ehfpf0IEueilzsxhB3ujHnxan
 Ryyc5tMn/kqOgzbBlzYQIfLXzVlGBq+mPTAf6kdHZvIBQuHB4rnJQSbkvazSRwqQDBwP
 edg7VMcxh0AOpTAZG+vJLJR1yOyX9rOki/DKQW42uExkh/cWADTlx5GHAG9RDT60f7Nz
 y7tWdam4Sh0wnvfQIJ1DzZ17gD41OaszrERHX0eVeQ3BxEf8Vjd/q3lLZfIs7D/SmMLh
 j7jQ==
X-Gm-Message-State: AAQBX9fmO3DC6cAqkFQevwJa7BQdScUKTkrLWhVCE1z9cFzu5ezCMeg2
 EuikuQeR/MCt5xccX+80UHcg7A==
X-Google-Smtp-Source: AKy350Y+s7Ijt20/BwCPxv3poFP7aqQ0pdWGGDzX92mJ9W66gTBIBYxk7M9UGVWa/Kap5xLj+TUBGA==
X-Received: by 2002:a17:906:c004:b0:94e:fa56:a74f with SMTP id
 e4-20020a170906c00400b0094efa56a74fmr4803037ejz.14.1681658455533; 
 Sun, 16 Apr 2023 08:20:55 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ba4d:301c:484d:5c9?
 ([2a02:810d:15c0:828:ba4d:301c:484d:5c9])
 by smtp.gmail.com with ESMTPSA id
 gn23-20020a1709070d1700b009373f1b5c4esm5230726ejc.161.2023.04.16.08.20.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Apr 2023 08:20:55 -0700 (PDT)
Message-ID: <55392744-b707-2ab1-e897-dee562b94f6a@linaro.org>
Date: Sun, 16 Apr 2023 17:20:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 2/5] dt-bindings: display: panel: nt36523: Add Lenovo
 J606F panel
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jianhua Lu <lujianhua000@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230412-topic-lenovopanel-v2-0-055c3649788e@linaro.org>
 <20230412-topic-lenovopanel-v2-2-055c3649788e@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230412-topic-lenovopanel-v2-2-055c3649788e@linaro.org>
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
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/04/2023 12:09, Konrad Dybcio wrote:
> Some Lenovo J606F tablets come with a 2K (2000x1200) 60Hz 11" 5:3
> video mode display. Document it and allow rotation while at it (Lenovo
> mounted it upside down!).
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

