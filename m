Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA3575930A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 12:29:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F0B10E45E;
	Wed, 19 Jul 2023 10:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F1FA10E45E
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 10:29:35 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5217bb5ae05so5748035a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 03:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689762573; x=1692354573;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hsbdF3vSFjWOVf7tTPeAyNmYXPOrPPfpGyXWv71M4vY=;
 b=pMflW6B6zdC43SRPUZaBNyhVj9ywPekh1ELYAAqf0KlpE0hJGBH+W0q+Cw+ck5fBYV
 ymbC8xPJjNLICUR6EHbtArsWt4KeHjjU6xe+49HCiUWoCwxqgkSVijIhzhyHlV4ENYlf
 QqNapgCKPE+KhWpp0Lzz1eY2nNQyd1c98UIHgtNWjhyoQN+XR24GU0pIFvWE4P6rdY55
 fQ7dqFlUAyjHb3+GLq48He1mbQFjr9brzgkXWywQLzDgi6ooceElSVDDtVKGlQ0acRUX
 p0nuLr+M1NfwwPLJHe87MxbtgPqupsuabUz8pqE2fKQZJQXY5T2sI6XaY825SScC8TPf
 aunQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689762573; x=1692354573;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hsbdF3vSFjWOVf7tTPeAyNmYXPOrPPfpGyXWv71M4vY=;
 b=lLx5EyvF2wiW+dRMFXHROuZ1Y3cMz2uhOq3JLqSqhS6pu9AeHZiba4GIVANx4gcPWZ
 M4YndzjGdDtWDiUEo7XNppzrD4nqA907JX34qR5FJgy5B8cV2qUaBWa6iMDGyg89oerR
 xZVa/0quLK+ULK6dQg7DiwPiOW5AACd3ZpDTy2NtC6b0fLpMzTiofU2kNh+6LTu+h1tn
 d3cT6ForaoCbcHABCHMEDPA8FV2vPhgY72ua6jV2HULU2oSQ3ic+WdChU/6kg39Crlwi
 qDhc9louZARKippo6gPG8CSHgdxd29IF1D1wJOfcZgS5KB7H6todi/8pms0134T6gIDr
 48kg==
X-Gm-Message-State: ABy/qLYlSB0sXtbIiPCWuo5tBZzvLlxVuBXCFcWOwSom7Nx+zI4709xU
 TZ7PAkHxBnl2DVS+Q+SNvcS4Ig==
X-Google-Smtp-Source: APBJJlGjAQSiTv09hvjzoL2bHorCfqXaWQw+3rHRmToUpY1BWy3cRCU5AjBIV+sp0DuIyOQ3WgrdxA==
X-Received: by 2002:aa7:d482:0:b0:521:aa4b:24f3 with SMTP id
 b2-20020aa7d482000000b00521aa4b24f3mr2106665edr.24.1689762573695; 
 Wed, 19 Jul 2023 03:29:33 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a05640206c700b0051e2a5d9290sm2487874edy.77.2023.07.19.03.29.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jul 2023 03:29:33 -0700 (PDT)
Message-ID: <6d9ded3a-415a-e879-2c80-e462c21ed9cb@linaro.org>
Date: Wed, 19 Jul 2023 12:29:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] drm/tiny: add display driver for philips pcd8544
 display controller
Content-Language: en-US
To: Viktar Simanenka <viteosen@gmail.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230719102430.316504-1-viteosen@gmail.com>
 <20230719102430.316504-2-viteosen@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230719102430.316504-2-viteosen@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/07/2023 12:24, Viktar Simanenka wrote:
> Support for common monochrome LCD displays based on PCD8544 (such as
> Nokia 5110/3310 LCD) SPI controlled displays.
> 
> Signed-off-by: Viktar Simanenka <viteosen@gmail.com>
> ---

No changelog, same version, so nothing improved here?

Best regards,
Krzysztof

