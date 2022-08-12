Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE68590CBE
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 09:44:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8174214B3D2;
	Fri, 12 Aug 2022 07:44:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F9210E1EB
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 07:43:08 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id z20so175325ljq.3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 00:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=3VS7TWQot+IlEnwML927JkmV58E4LYSjP3ZVnbKvo9o=;
 b=H6veR4g/W1qzmoejhWrzNTQwPauG85mbgpysc5AndaHpPwUL46BFgVxeeGb2A66u5P
 IXdCseqv9FE799SRriDfUyuz/1BJcdY522DlofonUQtYQCPqxHzkpWLZKQ+W2CSV7QUo
 09hxtgv2kBaeVaLTKw0A76lTFs2Ua3TSFv3Bq7sWzfIr+HcUZ0p7UUL2ZjmMglDKcyRb
 tsLPdOsyfNd9lUvZMsQlAuimpvqm/V0mVwj8e8azBjnadFAn6+6pa4z1CXX2ZspADiVR
 ExqWeCB6yJKm8solaw/dXy2p2CqnYDt3T18qOd6Z2BPCCjiq42cOMbEFYY+AxQ6Y6uxX
 T8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=3VS7TWQot+IlEnwML927JkmV58E4LYSjP3ZVnbKvo9o=;
 b=yKIhRjTXf0Lh3PYkpd2hV6vC3oJDDjextaTTOTxHKHDyCuMPo+Lj/YSIz4rLe5FBoD
 nim3wKOIKNKw6kFm0FdIA2BvPMHh+o+g4f0Fg9uvzLiLMSgD4It9fc+QT2IfjnYPXait
 Yl6LztVHX4q7dCvoyeBdioeHehuZCaiwLXr2vxGM6dSBoPbC37mraPJqdJCh6L4ojr4j
 CCkpVXpjh3h6Dp/EWkuTelLe1WsKYHwKcXpEjmBlAlfjD3WPx87aHfBIQEXAwxvjmItr
 ORWUguZQ58a2RyYs1uP3FO+iCYwM22oU3rwZeJu19gR3pQm5EkZtdl5ziJKJhjCNPFDr
 TScw==
X-Gm-Message-State: ACgBeo0gYxwsPXf8zDqZvwgPb2y5kGRegG49ZTotzwJtw9jWun5hhIZv
 vrUspEMgZGSkqz+ZHqKM5/r/Fg==
X-Google-Smtp-Source: AA6agR7ZfeMJcaErbEl0GD4He0/9ETlWF7jSLhneR8xK84QqhWg3QQHewdW5lNe/WC0N5Wv2ZlPPOg==
X-Received: by 2002:a05:651c:c98:b0:25e:6894:650 with SMTP id
 bz24-20020a05651c0c9800b0025e68940650mr840132ljb.487.1660290186671; 
 Fri, 12 Aug 2022 00:43:06 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a056512114400b0048b12c4c7e6sm126911lfg.12.2022.08.12.00.43.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Aug 2022 00:43:06 -0700 (PDT)
Message-ID: <ba1b272c-0d3a-b1c7-0ca3-5279496e1a6a@linaro.org>
Date: Fri, 12 Aug 2022 10:43:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] dt-bindings: display: sun4i: Add D1 TCONs to conditionals
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maxime Ripard <mripard@kernel.org>
References: <20220812073702.57618-1-samuel@sholland.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220812073702.57618-1-samuel@sholland.org>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/08/2022 10:37, Samuel Holland wrote:
> When adding the D1 TCON bindings, I missed the conditional blocks that
> restrict the binding for TCON LCD vs TCON TV hardware. Add the D1 TCON
> variants to the appropriate blocks for DE2 TCON LCDs and TCON TVs.
> 
> Fixes: ae5a5d26c15c ("dt-bindings: display: Add D1 display engine compatibles")
> Signed-off-by: Samuel Holland <samuel@sholland.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
