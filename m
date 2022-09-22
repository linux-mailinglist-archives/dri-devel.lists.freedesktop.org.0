Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD155E5BFC
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 09:12:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE9810E07E;
	Thu, 22 Sep 2022 07:12:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0872C10E07E
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 07:12:50 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id f14so13186593lfg.5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 00:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=rwfoTSI2+bODt184zqvk6o5KksPyLZOSxRrSre7m3nU=;
 b=MhBkMtNFvRKB+E48vrLoICpKm9sgw+cleIPWAZdLL/Zi1TbaAIdQ95hT//NfG41w3e
 CI4FfhpaK1pwUNjEUDFFqLN2WW4uCqaJy2iaA0/BhawC0nYmq58tsVXzRIn2D14awddP
 mHTBZAtcEBQJF6I9/XNAchneT562u5ZnnDjlX/uJ16P4/th4pGWksVDx6vpENafmdGhg
 ieVTp393OQtS6QAxqdIfc8g2WjzUdqt/5lMb5W56Nyxsh4LMRw1sKV5eN3a1PRZoNwmb
 H5f2yYPHjs0GnoIDHP4T8bY/lcFFUJ4rYUnDPPvGbWNK3chXy+JlrWlultv+vJjBPnDi
 qYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=rwfoTSI2+bODt184zqvk6o5KksPyLZOSxRrSre7m3nU=;
 b=ZpMgOVCNI8+Dudmph529KZ7w8YPbGZTPLpD84Ai4pUPJ8pvaXV+V6LLaxhg4O9JF16
 NWbzrIz5fv/5UL9gGCeMyCq+wZvD+jEyeXY//Iv34y7/gf69/X8qcRC9hXL3Vp9d1Lax
 DrmqzXgkbEVINZPJ55MLEOpP4QkJMJj/UuDkvrM5Ceb7GC0SdCVvvmzNW3TPApieDyR8
 mSWq+0DSpQCY3ZsH5lBxJN5QFLJKPxSQ8XYe0F7MqKbuS6NHhiTa3LAEQBXOwGwliE6T
 mDvksqDbncF92QkHH/uW/52YoAhReqVLa7pInxiIWk+fT5I5sssiEe9QCU22bOsKaTGi
 aNJg==
X-Gm-Message-State: ACrzQf35noITszL11JzaFAcLc1utMcj+FUS7+caxj1GP0AEcULrmACIM
 dJA4Aybtixb1nPr8L80tlaSJaQ==
X-Google-Smtp-Source: AMsMyM7tSmDdOf9yUwEBPNVo4LJveoksYmGyeRKCvdI8La3tpcO4vDQdzuT8eLiZWZvV10EZkCS7KA==
X-Received: by 2002:a05:6512:260d:b0:492:df5a:e4f9 with SMTP id
 bt13-20020a056512260d00b00492df5ae4f9mr667074lfb.90.1663830768385; 
 Thu, 22 Sep 2022 00:12:48 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 z12-20020a056512370c00b0048a8c907fe9sm794191lfr.167.2022.09.22.00.12.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 00:12:47 -0700 (PDT)
Message-ID: <e583c9d1-b936-3c19-ab6c-8fab4704ca45@linaro.org>
Date: Thu, 22 Sep 2022 09:12:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v1 03/17] dt-bindings: phy: mediatek: hdmi-phy: Add mt8195
 compatible
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>, Vinod Koul <vkoul@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-3-4844816c9808@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220919-v1-3-4844816c9808@baylibre.com>
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
Cc: devicetree@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, Pablo Sun <pablo.sun@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/09/2022 18:56, Guillaume Ranquet wrote:
> Add a compatible for the HDMI PHY on MT8195
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

The same... maybe it works, maybe not, I don't know. Any reason not
using standard tools and producing standard patches?

Best regards,
Krzysztof

