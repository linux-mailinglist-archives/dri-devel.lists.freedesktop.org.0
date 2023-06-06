Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4261D72385D
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 09:07:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8306E10E20E;
	Tue,  6 Jun 2023 07:07:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9434910E20E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 07:07:14 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9745d99cfccso741066466b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jun 2023 00:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686035232; x=1688627232;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LfyrHHXs/3FEw5JUsOIXcywbYi43JeBHM9rQiciunaM=;
 b=JqtOPZz6gEmwZSjRofN+GZ3syD8hO6vnTjcwGS7tp/iQMi0AQEcs4gh89+ZgqJCwfg
 LkUindMIXYvzVe41WfuQy3iR0a1YcViNY/HHmXPW+/OtP+4GDuInRdOVvet04QrgNZ+z
 58ZpqxYapCWRZTY/QKqh2OR9Bf/S5qkeAIEfgDck+dWKa7+JGTPvshWG/D+ewHIXIlK1
 agTjB5P+ONFDH8MUyP456odMXVnjWPCmDRxplEzA7DfvGF4P+dz082ceg9bdXAttrC2S
 j2/iZopcu9316HCt6dLyUTeUdiqWad42Q0HScPsz54kWFro+VK0Pm1r8IzSUkfInVrGp
 9YkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686035232; x=1688627232;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LfyrHHXs/3FEw5JUsOIXcywbYi43JeBHM9rQiciunaM=;
 b=BiCBt3YEpCAbb0mlB6WBt0BND8WHPapQ/McRRUJ81Etlm5DYn/HWN9JFc9CGs6SwMi
 nZv/9W0ZKhSvVWxOBWb4IaC/DCSm57hIu1O1YPETTaXxk3rGwFiJlq+1JSe5GKEy6XrQ
 4UBzwPHBU9v2VB8HmuDl33HzoUrUlFOgsOLEKVmvKL+8byj3Sig1r43xsXpOLbZqdmRA
 QpCR71jPEaSRmbZsEN6aypJwISGeEPx0L+9GxjpYv7nXWYZlocI8roZUlnFwguRjsIG9
 fGb2BZ46jXIaLt4vDdBAI4n6uNr6zQoZWLkKRwtlH7IkyYtQdAlO+SY5ZLLuNcqbLdBN
 kErg==
X-Gm-Message-State: AC+VfDwlEWdnn3dvXM/5qSp1/YCp2GA+hVJpYRo7TZvyJN6SceawcfZD
 C6SbzggOxlBIiXCxWL0DAPnOsg==
X-Google-Smtp-Source: ACHHUZ4Vudc4edlU0LDDXrW6BYI1uics/oXG6J+ziisGwljUrIb9OXoKemrkfNCZWSUUE8Bc17JblQ==
X-Received: by 2002:a17:907:3d88:b0:973:8198:bbfb with SMTP id
 he8-20020a1709073d8800b009738198bbfbmr1633982ejc.31.1686035232584; 
 Tue, 06 Jun 2023 00:07:12 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a50eb48000000b00510da8aa2c6sm4718596edp.69.2023.06.06.00.07.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 00:07:12 -0700 (PDT)
Message-ID: <fb34990c-f463-d816-8b2f-8a622b626f37@linaro.org>
Date: Tue, 6 Jun 2023 09:07:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 1/3] dt-bindings: add fannal vendor prefix
Content-Language: en-US
To: Paulo Pavacic <pavacic.p@gmail.com>, neil.armstrong@linaro.org,
 sam@ravnborg.org, airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
References: <20230605153539.497602-1-pavacic.p@gmail.com>
 <20230605153539.497602-2-pavacic.p@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230605153539.497602-2-pavacic.p@gmail.com>
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

On 05/06/2023 17:35, Paulo Pavacic wrote:
> Fannal is a one-stop-solution provider for touch displays in industrial
> application, committed to delivering a variety of professional high-quality
> products and technical services globally.
> 
> Website: www.fannal.com
> 
> Signed-off-by: Paulo Pavacic <pavacic.p@gmail.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

