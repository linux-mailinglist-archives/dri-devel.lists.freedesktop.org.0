Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D475544A9
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 10:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A24E10F434;
	Wed, 22 Jun 2022 08:35:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0626110F434
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 08:35:51 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id eq6so15504016edb.6
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 01:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=LKVKNIti1LcRpv/jEhLMMKWh1ADREH2xijbZTCW6Xr4=;
 b=HTdEvAVx/Nof1YbJwQLyXd8dTkR/+m7SXUfhIdnvWqSKFFHyN4/nJbLZN7l3HUb/VL
 ejdoskCUL3HevZhUZLkymtquwxhwS0Yyk39d1zwHTft+vMf/6ece6uy7Z576XCZHwjYp
 gh+L1ynkZnUwloRiWvrQNH8vxZ5jeLFClRX1/m13hbqYB9RRh0PNgKJPNTNd5aHJ58iW
 NR51sWkbop9/ITHUdhlwLAMIjsnnEKDu1CXoCaNShIrzMmRdGlnwERlp0cTsgoMro4Lb
 2Q8QzCWCz2XGC/23fXWJrfKQHQpQcvBqVB+4FZAIG+OXNYDWUoh9bR0T7xC8FwWr7OaK
 htYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LKVKNIti1LcRpv/jEhLMMKWh1ADREH2xijbZTCW6Xr4=;
 b=1t6n9XwNy5mGnGY7qbRU1pbXJWI8zZoCb/2/4hkYQR31Ubs80xbLZLM/gbrU1z8AzZ
 Qs3Kj9ZYuiCwzqzo252bzNXru0IL10x8+EJ4tC584gRyUuSvAPcqkuZz3ccP2OvzkZmB
 cf/7PNcdjN5O3aqKiw3iCMDTjGoT64G9GzJzp8Ku+22XjaQ6RsqltE2wDd+ejWHG4A/r
 EIOpcR3Q3yAFJhwaLI2cyq9Z8GNl4qm61F+czhdqjxxoNRreaMatH+1Yg60QEHbPcrWR
 /PSeBXUSrSML/v0+6s0PM9NLCz3jDeOKRTFaYLc2A/uuequwj/F8VoDoTxa7CycLRv2y
 LnRw==
X-Gm-Message-State: AJIora/g4aFYhCXLu/0tmMZMgVI52IGO5PWDzIEwKLCPhSHKWe8d/e0Q
 p7ZLIRsdCOnq6gO5uPhioY7bOw==
X-Google-Smtp-Source: AGRyM1ubdfO8px4g4kpPHR6o6PIPxQqkUkvACkcd7VlHI+hBIgv/8yaZr8ORCW2o1aIa03m0jnMdpQ==
X-Received: by 2002:a05:6402:358b:b0:435:828a:a403 with SMTP id
 y11-20020a056402358b00b00435828aa403mr2788497edc.117.1655886949582; 
 Wed, 22 Jun 2022 01:35:49 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 ku10-20020a170907788a00b00722e603c39asm1979733ejc.31.2022.06.22.01.35.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 01:35:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: kgunda@codeaurora.org, devicetree@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, pavel@ucw.cz,
 dri-devel@lists.freedesktop.org, daniel.thompson@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, lee.jones@linaro.org,
 linux-kernel@vger.kernel.org, agross@kernel.org,
 bjorn.andersson@linaro.org, krzysztof.kozlowski@linaro.org,
 jingoohan1@gmail.com, linux-leds@vger.kernel.org
Subject: Re: (subset) [PATCH 2/2] arm64: dts: qcom: correct SPMI WLED register
 range encoding
Date: Wed, 22 Jun 2022 10:35:35 +0200
Message-Id: <165588692597.15720.6527539957529378086.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220505154702.422108-2-krzysztof.kozlowski@linaro.org>
References: <20220505154702.422108-1-krzysztof.kozlowski@linaro.org>
 <20220505154702.422108-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 5 May 2022 17:47:02 +0200, Krzysztof Kozlowski wrote:
> On PM660L, PMI8994 and PMI8998, the WLED has two address spaces and with
> size-cells=0, they should be encoded as two separate items.
> 
> 

Applied, thanks!

[2/2] arm64: dts: qcom: correct SPMI WLED register range encoding
      https://git.kernel.org/krzk/linux/c/2559f68b5991be168785a16a53f582862cf0063c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
