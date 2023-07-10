Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9E474CDC3
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 08:59:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B907110E1AF;
	Mon, 10 Jul 2023 06:59:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D0110E1AF
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 06:59:39 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b6fdaf6eefso61955201fa.0
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Jul 2023 23:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688972377; x=1691564377;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KIClO8Lu4EpQRuSM4dQTJsPgeAAmg04f9ozvN8hppFU=;
 b=h66ZEBNcpH4beV2RchzHrF9JSa2iIMx5RlJAfNSm8AGigvGOOjV9G7p6RRYhousOsW
 lJJb6oIBLNS+yiR4Tyasz0GXII2E82fddz4qffWTzaJ690Zj/5Iynl3AbgNJWKsE65z5
 kK77k+ChrwSl7CcEKr1boDwtV4zPhuLnVrTab6Fj6ITEu50v2d72pv/u0hROlb3f65dw
 DcCi5uU4Hxa5nfZBY7nmBEf13SUVa6uDmmjBwaeiovBd5KSTnf5KxGfd2fzdEA/Ed620
 rrdLhq1u/I3ob9diGm4amyOYDQs5CRpYn48AlfyRpgvjOPIEK4eitNzuqgDfXI5obFK0
 HDWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688972377; x=1691564377;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KIClO8Lu4EpQRuSM4dQTJsPgeAAmg04f9ozvN8hppFU=;
 b=TxYL+H189FLN4nphknfJA7a/zBeXirN6KIYnbLWhhDEc3dfxoauV4AXLouMyNrIYfN
 ntR1hNtnXai4VNA+SogPvpD9ji8SChZwo+I6R12QNS+RHGwZgDPFri4puLJh8yDlCFRB
 YTwiGGYots6V4l7eEtIrLyo5SsyO+ZIlF5M5AU0i3liWoozIANUfhNPfpOys+QqzMwtj
 5wJVwll9LrO6o7+/gARaU9M4Un4KtM8NrNcwXlw98s6/uEx9WZHnlucLz+V9B9QDOe+U
 aBjjHUqAy0gtuk5FL3larQnUkjndIMMoM7CtfMKGtLxy8zKbsYV3M+to0um49T1C6uxN
 OTgQ==
X-Gm-Message-State: ABy/qLbTcbAjKxdVg1Tju/TX1K23E+OiHllVGu3sKKUKSibaOTZGqn8n
 208tYuBK9baSMgBl/paOyw1WCQ==
X-Google-Smtp-Source: APBJJlHdBzz0FIIHNvRSRvaVIuA6CJ8sE0O8DPjVl2svOP7xogmqgfwctSl4QSYL+FVPc+RlxhQs/Q==
X-Received: by 2002:a2e:740a:0:b0:2b6:da66:2d69 with SMTP id
 p10-20020a2e740a000000b002b6da662d69mr8748695ljc.28.1688972377077; 
 Sun, 09 Jul 2023 23:59:37 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 le26-20020a170907171a00b00987e2f84768sm5687713ejc.0.2023.07.09.23.59.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jul 2023 23:59:36 -0700 (PDT)
Message-ID: <98b39071-cbfa-bc58-032e-56f6e9dd5c2a@linaro.org>
Date: Mon, 10 Jul 2023 08:59:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 3/3] ARM: dts: exynos/i9100: Fix LCD screen's physical
 size
Content-Language: en-US
To: Paul Cercueil <paul@crapouillou.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
References: <20230708084027.18352-1-paul@crapouillou.net>
 <20230708084027.18352-4-paul@crapouillou.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230708084027.18352-4-paul@crapouillou.net>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/07/2023 10:40, Paul Cercueil wrote:
> The previous values were completely bogus, and resulted in the computed
> DPI ratio being much lower than reality, causing applications and UIs to
> misbehave.
> 
> The new values were measured by myself with a ruler.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Fixes: 8620cc2f99b7 ("ARM: dts: exynos: Add devicetree file for the Galaxy S2")
> Cc: <stable@vger.kernel.org> # v5.8+
> ---

This does not apply. You rebased your work on some older version/tree,
without new layout. Please work on linux-next.

Best regards,
Krzysztof

