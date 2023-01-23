Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A126782EF
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 18:21:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADD710E511;
	Mon, 23 Jan 2023 17:21:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7432B10E511
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 17:21:07 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id r2so11498429wrv.7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 09:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0NkdC0QU+NJiZy30gFHK5froje5ppy8GnCGOO6YlT/4=;
 b=dClCrPrAvp54tBfhhfmEe/L8Zq40/1O1h4+Daf0GiIhH8CbbDOJOdG+RyQMM32PYuH
 t76G9YX3mGQamZMp8n02Xy3UjANYoSKjqO7uc4WiOmUX9h/9Ssre8dXjYvBLHTdRH/H3
 6DF5k04yTCs8oFvjmvJr4kfiAOKmwMfJTUG+y/8epn9RQ/h7fBJiNy/MUJ8AC5WeJc1d
 bqABbZoQbYFIbQzU8W6J7/yW8melDmt5H+0Tyd9GuWSBVHU7Q1HUL2cspFzvSu3Ic5vT
 +QTL/rRZSnwcdYY7cbIef2bgooLiJxEsf46MCZGXNKdnqWyVfKamOs/LJQ7RSrsit+Ma
 ebzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0NkdC0QU+NJiZy30gFHK5froje5ppy8GnCGOO6YlT/4=;
 b=gICF/jmZTo3YqAhWse7hxZczrHH8+CvWbs3WTXR1qtL9H2AvuLonni0m/ziDTvba9R
 vic+K73M8f4mOZJQxnE+/3y5KfUaed2s52RqibVscYHEMjkH8U53chl3tTFaddQxM0f2
 gQIR1OCPCpz/uucmsG8Cnx1wE/w56Yh+c9Hiv4Bf5P5GCXf5HQkqyyGHdBeFlxcFOZhm
 hNak+BVj+HpZNjrn9cJufryxsQ3kKFICpw/f0qUbKD/zeDU1tjCeuWsjg5plEuEVMdII
 EyT1tT8E0b2C5oU8d4vurrHVUkm/LSfdrwXHLr82coDBgFx88RZ2bvPD+EnwLW9tS72c
 Bi4g==
X-Gm-Message-State: AFqh2kreqQVfIDjOFzrqs2tffuhtxx2tOALuWAR4tUaXFtA+dGDxpWEB
 J2TR9X0hALkE1mLAUH1v62xyLg==
X-Google-Smtp-Source: AMrXdXvfvK5Ywap57CpzY+BNz4ZHGxEh8B24cRx5n07QzAht67wttwtPkaqAjQv0g1sb1+glpHELDw==
X-Received: by 2002:a5d:4c4c:0:b0:2bf:9498:a9b3 with SMTP id
 n12-20020a5d4c4c000000b002bf9498a9b3mr10557888wrt.13.1674494465715; 
 Mon, 23 Jan 2023 09:21:05 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 c14-20020a5d4cce000000b002426d0a4048sm5333462wrt.49.2023.01.23.09.21.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 09:21:05 -0800 (PST)
Message-ID: <1ece1aa8-b223-0088-96c0-a1b2a7c4827b@linaro.org>
Date: Mon, 23 Jan 2023 18:21:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 2/4] Revert "dt-bindings: vendor-prefixes: Document
 Chongzhou"
Content-Language: en-US
To: Jagan Teki <jagan@edgeble.ai>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
References: <20230123164018.403037-1-jagan@edgeble.ai>
 <20230123164018.403037-2-jagan@edgeble.ai>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230123164018.403037-2-jagan@edgeble.ai>
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
Cc: Tom Cubie <tom@radxa.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/01/2023 17:40, Jagan Teki wrote:
> This reverts commit 90f86d0c617d9461cb00f4d8e861eda28011d46e.
> 
> [why]
> The initial datasheet claimed that chouzhong designed the 10" DSI
> panel on top of JD9365DA IC, but later Radxa mentioned that chouzhong
> is the manufacturer. This concludes that the actual design of the
> panel, gsensor, and customized FPC is done by Radxa.
> 
> So, drop the Chongzhou vendor-prefix as it is no longer useful
> anywhere in the bindings.
> 
> Reported-by: Tom Cubie <tom@radxa.com>

If it is a real company making real products, we can keep it. We might
need it soon anyway.

Best regards,
Krzysztof

