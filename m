Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C724668DD07
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 16:28:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68FCE10E526;
	Tue,  7 Feb 2023 15:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7095F10E526
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 15:28:46 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 az4-20020a05600c600400b003dff767a1f1so6489077wmb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Feb 2023 07:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kO3g6tMzeksffKItSMhNAfHH5Mpd7ePKisYPK9hzGZA=;
 b=dl/z/Tb4LsogbIi6ENpWJYW69dvAzo/eaQY7ZbHPrPKC5qgjTViA3+CLv9j4R2Z74P
 4h/FGuMZc4f5ZHfRawSLOiO9DibjiQ2D3082ZYe4Anw0OlaWUzMkBk4ihEEIT+QHfg+M
 cDI+KbilrRJ7RjlMRiTCAjUMiJFNAm0AsYVlDsUTDbSViFAAsiKaiC0WcNlTJ9a2FdSK
 dR4tH5SCgE7vjOdZ3Sjbs8wU3BdlMByocIHOSW9PU3K37WfpRD9vjW+X+U60o4hmKOgm
 nL8XbGM0UcKYwQCZZUnUK8GdayJXekKNMMz2M1xmaVW1D5pkMwEWPlq6MkTGEurdkxnH
 zKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kO3g6tMzeksffKItSMhNAfHH5Mpd7ePKisYPK9hzGZA=;
 b=gp2pMQxNxx6rBaILHIHNBx+1hyKHnmRWitngF000bVxPqtjv5BhJgXvvmGlfkmSwun
 /bw9pXnyxhC/Z71od4Vb+BkruUJjTCmB6q2YzSv7Z8GMWl5IpgCnLwDVG88yEteaGm/n
 bIwvlCkriigiPcD9Q1xBNNzRjnXWOVnzAzGEwKtj7UFvU2ZsscW0rQILvmBHhmOy5KDT
 GSTbDHZMWfHim69q5/9a36cSNwDmYzQBq6JTc3p9/UDCxMphzLgvrvb3h5OcTzsi3lGL
 kLnacfdCN6SOcyl+56JqWW3X4s06Efy4zkg8ek8ZDV0J0h2q1HLLGeG6IVYTpym9svI8
 HQMA==
X-Gm-Message-State: AO0yUKWZ2YibLPY47myyDPId7UDbeHv54RMWy8LX7RFaD9431tP/hyj1
 qMOwF+wckaLG1X17cuvJ0maypA==
X-Google-Smtp-Source: AK7set+1ajp6SAml8UxWiVQB7HudkRig9quzQFy6PDGQW+8qnJR3N3QvWDxd3OFTjwRRNy3hna0gFg==
X-Received: by 2002:a05:600c:2b46:b0:3dc:50dd:361b with SMTP id
 e6-20020a05600c2b4600b003dc50dd361bmr3374354wmf.5.1675783724981; 
 Tue, 07 Feb 2023 07:28:44 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 he7-20020a05600c540700b003df5be8987esm17200336wmb.20.2023.02.07.07.28.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 07:28:44 -0800 (PST)
Message-ID: <db2bdbf0-7e43-d8e7-70f8-532021a15c35@linaro.org>
Date: Tue, 7 Feb 2023 16:28:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] dt-bindings: display: panel: visionox,vtdr6130: add
 missing reg property
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230207-topic-sm8550-upstream-vtdr6130-bindings-fix-v1-1-0ba2323420c5@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230207-topic-sm8550-upstream-vtdr6130-bindings-fix-v1-1-0ba2323420c5@linaro.org>
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

On 07/02/2023 11:04, Neil Armstrong wrote:
> Add missing reg property and update example to add dsi top node.
> 
> Fixes: ef85db911134 ("dt-bindings: display: panel: document the Visionox VTDR6130 AMOLED DSI Panel")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

