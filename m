Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 791195E8ACC
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 11:29:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF85110E59E;
	Sat, 24 Sep 2022 09:29:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E75E010E59D
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 09:29:45 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id a10so2518664ljq.0
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 02:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=DZGAIB6lOdSfIICauQbfT5Gio7LJSO7BYlR0b7U8DS8=;
 b=pNvfAYYPA0xFYXDIi5y4/92pkWfgTeRTqoJ+Nce4yxlfZbl5qnT8BcKAwvo8ZUMMQa
 Tsgsd1dU4t6pIJ04hWvXqPPi3frAY6pxcRUIEJAnws3MS2tiqAylhibn51MicUYjfTBK
 //Q21qbi38NHXgeZX4DaQEgNlNfgHpE7Jdqq6Ub0I5dVUNUismaSRIrc1uiK63dHOyfL
 K0je9eCCGpMWZMgKU8fC8LsaM+JmhjzVRX/dt+UtMyFQDRAsoj0REM+1WlDosfC0DtDe
 IsX7WrqEnmi6TTVg+f4x7VZdewwNqN2QUIAH/QKxjWisVIhw/Gn7dzFBXpucMiSw+aRd
 ii2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=DZGAIB6lOdSfIICauQbfT5Gio7LJSO7BYlR0b7U8DS8=;
 b=GXmFB5y3HLkfqmKxEGvMKFmjV4iB2x5bY/WIxZQgKrrmDN1lHy3GxrGscPZT/vrdmo
 H8QAJH4v64ZWge4PzAjX0d3Tm43ilkcVGNdAlnfKndmyp8WyzlNh7slUgdojSQY51JVe
 2M3rmIKQ8m8oNpO7aHAO+HjEklyNHFz0TYtv6GCKfvufZ1I1qvvtyHHnhnh7zOhMC7VY
 yG9NEMNX63adzOytnmM7lngyp27m88bdE8zzF9MCKmB9tC5agUG2CNeBIsXMTngEkEFl
 0Lb4MsM/QW+rtzvLgpeyACXHob/1+da+B6nFiQ+0rqfjK+b2RAvXsugMpeKYTeEzr/9n
 Yggg==
X-Gm-Message-State: ACrzQf08t5Sr6P9xd8BoHMsB6H8ot3vFzXjNzZxGd5d0Rl7ZGdLwe82v
 8QIV5wsqnHb11dVPj4RVUlJbIg==
X-Google-Smtp-Source: AMsMyM5SWQN3EwIq8in2Z15Fx8LgxNJnzmtrpYJprInmv+ZrHJMt6KkxewCGTsrGVOf/otXbQLbwUw==
X-Received: by 2002:a2e:a5cb:0:b0:26c:4311:91cf with SMTP id
 n11-20020a2ea5cb000000b0026c431191cfmr4168268ljp.491.1664011784324; 
 Sat, 24 Sep 2022 02:29:44 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 o9-20020a05651205c900b004979ec19387sm1826256lfo.305.2022.09.24.02.29.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 02:29:43 -0700 (PDT)
Message-ID: <5ea1e309-6ea8-f6c1-dc53-471d858ff60d@linaro.org>
Date: Sat, 24 Sep 2022 11:29:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 0/9] arm: dts: qcom: rename DSI PHY nodes
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
 <fd91077b-e4ff-0187-8424-0b83b96588ef@linaro.org>
 <361ad59f-288f-beae-25c7-7acd42c2db94@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <361ad59f-288f-beae-25c7-7acd42c2db94@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/09/2022 11:20, Dmitry Baryshkov wrote:
> On 24/09/2022 12:11, Krzysztof Kozlowski wrote:
>> On 24/09/2022 11:00, Dmitry Baryshkov wrote:
>>> Historically DSI PHY device tree nodes used the dsi-phy@ names. Replace
>>> them with generic phy@ names.
>>>
>>> Dmitry Baryshkov (9):
>>>    ARM: dts: qcom-apq8064: change DSI PHY node name to generic one
>>
>> dsi-phy is similar to other generic names (usb-phy, ethernet-phy) [1] so
>> it could stay. Is there particular need for this, like coming from DT
>> schema?
> 
> No, there is no requirement from the DT schema. However:
> 1) The resent qcom DT files already use just phy@ for most of PHY nodes
> 2) The recommended list mentions usb-phy/ethernet-phy, but not 
> <anything>-phy, so I'd think that those two are mostly for backwards 
> compatibility.
> 3) I liked the example of sc7280 which switched all MDSS PHYs to just 
> phy@ (this includes DSI PHY, eDP PHY and, by extension, the HDMI PHY).

Good explanation. If there is going to be resent/submit, please add it
to cover letter. :)

Best regards,
Krzysztof

