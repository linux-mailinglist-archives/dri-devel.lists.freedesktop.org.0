Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CCE6E1E07
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 10:23:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1294810E1B0;
	Fri, 14 Apr 2023 08:23:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7331A10E1AB
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 08:23:11 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id jg21so43356717ejc.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 01:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681460589; x=1684052589;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NzRZEIILpWyKZWJo32FSk8kcuPmn4Poe45kfA2ZbqGM=;
 b=uozEHOqhsVLQi8VAd0LiVLiIcaJjqdIe0doxfbqY4LrNElfxRSLsWLNNn5zylJUn0h
 lHxL6cLx6Lm8AJU1Qz7HAS25JoY5i+onzAcV4fLv6Z1z39K0Kknjov5Ime2nZn+f3mKi
 qpeInhnvcx9i+yORBAcxGjvqxyQatYSOgfeWUwXBVPHjesc7/k+ZMwA636R6djieJvJm
 vBChHpBBwVm348eRPxDxWYvwS9mjTI/AdRatEsyAsi9HCe2EedzgJwqtMoqjXsiQTI/q
 BSIUkO+iAL745TdY1tYj04jYfu39mDcmIy3b/wqdgvci8hkpq1ezVGuswXsbqQOUKUX5
 cM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681460589; x=1684052589;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NzRZEIILpWyKZWJo32FSk8kcuPmn4Poe45kfA2ZbqGM=;
 b=ROpn00hbP1m6NwdcMR5UOFMJs1ld4WjWjAhEIBfvhJeq8LQLbuJaMauo0ZVQsPrTKj
 m0nnjGugXQZmhLpJRRNu4GjA/IM4wFBii3aNJ+D+iBDvzd7QzSnNPK/rDXbUS/778h/l
 4/TlCZiYI4inCSv/X9tGpT4li/wKHh7BbuOKrdb4ggUXAYK2/jiTIaOwYtPX7+4Sx2tN
 0tkwPqjHrYnRQ1bPBdanXsLmCKOjCZv5RnsEG/0I7+raLuEfKh1xHoVmD1Y2M+t/H1Ew
 XlkW8fKE5qAYli563ZEPI5lVuKw8DQJSyp21fUR7Ss5jS+5j23tkT+k6edub/nUQK8ca
 blfQ==
X-Gm-Message-State: AAQBX9d4CgYuMxg/Ew6Nedcoq+b9TrBFUrn2adL5nafp7NKwLpKQ1s27
 sZbnCr/f0hXDxepmURPKZP8dxw==
X-Google-Smtp-Source: AKy350berumbKkfJ41+HfpsbynlljsimfYfJHpk52Z1fKMpG3joFYZsRrgaiLWvTZCpLIyxkJxRVVw==
X-Received: by 2002:a17:906:4743:b0:932:fc34:88f with SMTP id
 j3-20020a170906474300b00932fc34088fmr5878677ejs.11.1681460589673; 
 Fri, 14 Apr 2023 01:23:09 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb?
 ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
 by smtp.gmail.com with ESMTPSA id
 me17-20020a170906aed100b0094e002dd3bbsm2094050ejb.224.2023.04.14.01.23.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 01:23:09 -0700 (PDT)
Message-ID: <2247fca1-ac4a-a1ea-1c06-0e25d19c0eaf@linaro.org>
Date: Fri, 14 Apr 2023 10:23:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 03/27] dt-bindings: display: mediatek: dpi: Add compatible
 for MediaTek MT6795
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-4-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230412112739.160376-4-angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, kernel@collabora.com, xinlei.lee@mediatek.com,
 kishon@kernel.org, phone-devel@vger.kernel.org, jassisinghbrar@gmail.com,
 linux-pwm@vger.kernel.org, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, jitao.shi@mediatek.com, houlong.wei@mediatek.com,
 chunfeng.yun@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> Add a compatible string for the MediaTek Helio X10 MT6795 SoC, using
> the same parameters as MT8183.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

