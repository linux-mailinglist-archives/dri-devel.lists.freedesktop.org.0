Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D6B4FA97E
	for <lists+dri-devel@lfdr.de>; Sat,  9 Apr 2022 18:29:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F0D410E19B;
	Sat,  9 Apr 2022 16:29:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D4AF10E165
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Apr 2022 16:29:20 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id c64so1160688edf.11
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Apr 2022 09:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=013KQyZoC1kiZK8acrvQDTsvOmSOuQ5IBcDI4parlh4=;
 b=yRLY31N37VK2cj40RKzRn4+6jDccfmifkjJE0UtauU4xkiKlwJatKyqvpuf9zcyk99
 1HxMksrcfB3cF0MZ/9jQazdY+jqCsLCOGJw+X6rTvWrZveibmeqQuLja+LFPoMZHJchL
 dNqjc4m/hmCCjTeS5PCVAYThu/vRzu9iOFOWoojX+bZoay1vK2wnaPE77qL2ML0W996L
 dfxWcptyWqo7jrhuTrl9/n+Kq7N3G6efYjeZ6N8bYrI+qVnUonDQPl81jSnDgRlPsl3i
 YGSXAEmXdgZoq+Cq2MYipbejX8LZbtU+tNRWgLrUWJPciF1xtwiclBJKiLo5qpenLRDw
 HgzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=013KQyZoC1kiZK8acrvQDTsvOmSOuQ5IBcDI4parlh4=;
 b=6AUiDxCzGppc9h1P+oR5SCXt8qZNHEb96u9XFFJfuZr4hFbighusMxws8Ifd2qh/e1
 uIM85WhC9CNasq5BJUTIPb4gPuOzZiXUih1vCF739Jc4kqbWV63/nJR/LDGMWYcj9R/f
 Q+oo/7RPl+3HKPBtEzIt2K/lvhzyhz7DOdIyzKVGF8+fnF2/IOz4Vx1quDdL8DbC/peM
 LyVANKVoyVRHLh9XPyG3O27ZI7Jn/4U1Kmkqf+M53dgZqxS4ZXMMoq2cYxAs830jlpqm
 WRyAALIdjx2dmqPjfwt4hfqjwPJ1ekYgI2lJY3iesYRWBxZYMC8X0isYIQhNaXGKOZL7
 JvfQ==
X-Gm-Message-State: AOAM531xrpHX33I4X3r5NsrbbBnIJxYNO7OvVQGgyDMTglqjM1Rg+1dA
 ofjhkJTax6sJ/FEw8Vu8Rf/FBQ==
X-Google-Smtp-Source: ABdhPJzQFbm5lCSBjckKBhmk/0GHd3D233fa4uyGyQrZQ8dNln3xQBzO5NCowNNtBZahuYgMrlTpkw==
X-Received: by 2002:a05:6402:2554:b0:41d:79:945f with SMTP id
 l20-20020a056402255400b0041d0079945fmr15417239edb.120.1649521758824; 
 Sat, 09 Apr 2022 09:29:18 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 f26-20020a170906825a00b006e7efc52be8sm6865768ejx.166.2022.04.09.09.29.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 09:29:18 -0700 (PDT)
Message-ID: <c63f7e1c-b40f-474b-507f-86d214048a5b@linaro.org>
Date: Sat, 9 Apr 2022 18:29:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] dt-bindings: display: msm: Add optional resets
Content-Language: en-US
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220408210253.581337-1-bjorn.andersson@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220408210253.581337-1-bjorn.andersson@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/04/2022 23:02, Bjorn Andersson wrote:
> Add an optional reference to the MDSS_CORE reset, which when specified
> can be used by the implementation to reset the hardware blocks.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v2:
> - None
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
