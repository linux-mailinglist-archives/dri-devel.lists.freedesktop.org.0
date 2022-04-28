Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E061E512DA3
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 10:01:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F2610F529;
	Thu, 28 Apr 2022 08:01:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7422410F529
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 08:01:26 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id j6so7869940ejc.13
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 01:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=N3zGC1wvB/nv29USBZmgr41Ud8zfxazlWsebIt8ip4Q=;
 b=alOVobKdRyJlxqUq5m4tQ+rLDAJA7KXpBB2ytou6HHFpDfB3f5kv+zQalrik8copss
 r1LItmgyw22vCY2WbxQviTHxqrVO9zGDeP19mxvGGOWSsViC039ZIJtfWuSpK7+ntt7j
 sCYwOm0atELLB7BV1Q+c3DVfueRMW+41ISUWXROy+lTX0VvobJoYCMKKpXveTJxFSJxk
 /RWoLfVl9SGr2M8IG1erfZzq/fQSxN40+x10Ch7IpqCdSSQFPWIHJPhmiHekkHot3W4w
 Uo6Rgxm9orwY9a6EpcUK6k+8DH7yXc2/6vgWLzV481iPLPuPR8A7dmZXJrBUoUvAloZR
 ybXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=N3zGC1wvB/nv29USBZmgr41Ud8zfxazlWsebIt8ip4Q=;
 b=DQ/KPc+FUo/DtKHv+B/TeSQazaEZitGpBpLIEPhkcEFpl09MzJMXmUoPlOB4jI+4lF
 BwrQuicP8z/RxhpygMkilxL5TJfyKUrgNBn+FihvkyZLySm8JmmLET0gn0NqYvNVVU8i
 MUQzv9v8uzCnN7jCXVQi1q3itH8GdLbV0NxTvUySnn71NFZt70qtavpph5d8xkYB7uDY
 qJMVCZr8g+oAIYyqUOutZY5KoXzCdmkGtdTI+PylqMWhLYcEpvzcfXxBSuARjLKixCPY
 c6E5k846dfq/B+sYxYviTZijHVsB0px8+9roHtkFItZPYt5yHbdAJ2zrcJtEcw+TOVh7
 IiKw==
X-Gm-Message-State: AOAM532HlWzNs1GThcWMJ3T4UuFTOttJOfPCGyHTwPeQNJ6qAsFtsTcp
 QC9Z8qI2I/W+SAc+BLBbJB/O4g==
X-Google-Smtp-Source: ABdhPJworzFD0TJcsIvHlg66JrAELoo4MwLAYTdDemevzuTQhZHWIqepHbmVFR5ZuQxbvYQj2P1hnw==
X-Received: by 2002:a17:907:97d3:b0:6ef:f445:dd96 with SMTP id
 js19-20020a17090797d300b006eff445dd96mr30238068ejc.416.1651132884946; 
 Thu, 28 Apr 2022 01:01:24 -0700 (PDT)
Received: from [192.168.0.161] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 v4-20020a17090690c400b006f3c15eefb9sm2784318ejw.17.2022.04.28.01.01.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 01:01:24 -0700 (PDT)
Message-ID: <6a2917b8-90a7-55dd-d814-5f4dd515c908@linaro.org>
Date: Thu, 28 Apr 2022 10:01:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 1/4] dt-bindings: display: simple: Add DataImage
 FG1001L0DSSWMG01 compatible string
Content-Language: en-US
To: Philip Oberfichtner <pro@denx.de>
References: <20220427135229.2339865-1-pro@denx.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220427135229.2339865-1-pro@denx.de>
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
 matthias.winker@de.bosch.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/04/2022 15:52, Philip Oberfichtner wrote:
> Add DataImage FG1001L0DSSWMG01 10.1" 1280x800 TFT LCD panel compatible
> string.
> 
> Signed-off-by: Philip Oberfichtner <pro@denx.de>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
