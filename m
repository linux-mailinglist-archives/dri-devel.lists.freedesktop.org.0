Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 302EC5A112B
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 14:54:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBEAC10E1BA;
	Thu, 25 Aug 2022 12:54:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6323210E19F
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 12:54:14 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id bt10so15131416lfb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 05:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=S3SutAB1J4Kb12rqzo8+qQuuCiQhbu1bFQAHyt9SB6M=;
 b=dYjtx8g4GgRergvoaiFBiWUr5mp8xRc3ajTrabyMa3BOgh/UVTKQun5yXKMMauJRMc
 0+eMWOZNpd+3omG8H8DsIx+7J/08M1obW4O6HuN1/6XLZ7QuOwCY1q+xfn6tJ+0Xi14+
 ksNb9HYycX9JV7LSoOaOjrls83z6BtK7RxIHe3ALGiTFz8yuJpE4sPI1e86PN7lUIzGK
 S8tSB5c0ljyYXthRQu2jA7GyvpLd+heV1qrFqZCGJBjiEVJ6Vy6J+YZ24ODQg1o2U+IP
 Dze5Q7iBwMGW9rsKKt87+CJsHJHv0w9JrU4MyWUPP+KZqYEF+MoQG0xlpjAQYO0XCqSZ
 jISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=S3SutAB1J4Kb12rqzo8+qQuuCiQhbu1bFQAHyt9SB6M=;
 b=io1OGKuYs+fl4XqACebTz7P+Mu0/NbZ2dydbW+6ohEDTp95LGIrSiuRs3yow1PXXj2
 cMYm2hwfKf91rTl273GGg/myjFO5bxE+joTqDr+/Dv4twB0bF8ruhvv9+VR5yg2p7IUW
 Uj8F7HMiS3nwcRxkSsTJRJSoz4r89WcKFg8xlSZDiJT1TZdKDR1YidwMyKvc/VqpG3xk
 2Blp/aZxD4QOynAONzN4veugFjop0lPeltDoTbx4Ey1Z7nslc1c1Xd21B5pxtL7HQIll
 VXJLvCQXTJIcURYZfkYIugXI96vp7y3bSw2uEwNm5l/DN/an89iVl6u/GhutvXTZMiPN
 HW9A==
X-Gm-Message-State: ACgBeo1wRQpuQExlc6vIVMNVrXQIaXJ8FyEju03kGyHhmUF6F1lnk3ee
 2AS5GXseXbuK2O7TGdUbjLGWBw==
X-Google-Smtp-Source: AA6agR6Beh4p+rci4zh/hhXKnzTrbCflB3h0vAEJeLxMjM0OmsBCjw8pY7pJZ0BeP5ai02rnqARMJQ==
X-Received: by 2002:a05:6512:b08:b0:492:87ad:5f5c with SMTP id
 w8-20020a0565120b0800b0049287ad5f5cmr1269359lfu.293.1661432052713; 
 Thu, 25 Aug 2022 05:54:12 -0700 (PDT)
Received: from krzk-bin.starman.ee (82.131.98.15.cable.starman.ee.
 [82.131.98.15]) by smtp.gmail.com with ESMTPSA id
 z14-20020a056512370e00b00492e3a8366esm494304lfr.9.2022.08.25.05.54.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 05:54:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Kiran Gunda <kgunda@codeaurora.org>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH RESEND - dt 0/2] dt-bindings: left-overs for DT tree
Date: Thu, 25 Aug 2022 15:54:08 +0300
Message-Id: <20220825125410.232377-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

These were sent some months ago, then resent and still were not applied.

You already reviewed them (I removed your tag here). Can you apply them to your tree?

https://lore.kernel.org/all/20220720163720.7099-1-krzysztof.kozlowski@linaro.org/
https://lore.kernel.org/all/daaf6ad7-6204-2a13-442b-05068d29e734@linaro.org/

Best regards,
Krzysztof

Krzysztof Kozlowski (2):
  dt-bindings: nvmem: qfprom: add IPQ8064 and SDM630 compatibles
  dt-bindings: leds: qcom-wled: fix number of addresses

 .../devicetree/bindings/leds/backlight/qcom-wled.yaml    | 9 ++++++++-
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 2 ++
 2 files changed, 10 insertions(+), 1 deletion(-)

-- 
2.34.1

