Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DD069F1CD
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 10:34:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F7310E432;
	Wed, 22 Feb 2023 09:34:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8637F10E432
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 09:34:52 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id l1so6776917wry.10
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 01:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NRk5F+0/KBJtXy1UGgffMDC3lUYcUK9POoNTTNzoa24=;
 b=u+urDYkiChNW/YI0+mNXcxcwazZf2oOYqiBgCEV2QRhM9Bj6bxgttGAPIfrpBsmZxB
 F/vzmmCmy0CmXzapu9KDPiLA9pY7S1B1GBW680gB1ZUGoMoUy99YDtiK57CeqAaY2HDG
 0K6bgiYCumaL/dEN8e2MSENFFfv0PQ9lP8dbpE6nD1ZEyuCRN6nDMhxiua2p5l7kkJgh
 7fxk/bcZzDt3idskr7rGCw0S6Js/HSnwDHdjcNFVO3Tdji5NuQ4PprVdhfl0lRLFdIbN
 nBWs7kKgv2X0JbhP42VvRIC5GiSY67juoj1zkN5gTEpZF3ZSitEAYHdksPGLvld9I7Aj
 k8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NRk5F+0/KBJtXy1UGgffMDC3lUYcUK9POoNTTNzoa24=;
 b=6pEsxQRRxpYIhuYht2NcdxuKo1civJn5mXBM2sHqqY/0P096yTo93UenbQ6j0RqOdA
 DifXK/sfB7AFE8wTSAobX/de/hIvHu2zXP65wd39fPqQCVyg2IgxFJjNRPEWAzdNm1Ii
 5lFjrOwnNVVH8+5vK5EXJ7pyUrgE7mVN0jxfJG4CZcK7I5GJCUpqTI2kgr898U8Bznrp
 OberyZ1sRAEXdHWCKGxdzCjKOWVApDbrD47A6FRFY/+5H2duODozTRMvYcannF46iqNH
 THZ1j93sylvyHDlT8h+RdD6MGy1z7DbtCuHZpIB6j7Q8rUOmhCZbisGor1iUhCMaUDCT
 TjCA==
X-Gm-Message-State: AO0yUKWSCqj7OoUBpgL/neQ4lN7f98KCbU50BKj3/itG5oRCoZlhnc3G
 mv8/bD8ry83JTUd2zCyUyfZz0Q==
X-Google-Smtp-Source: AK7set8hSrDxe9qvKyM2TLqTXl2UDNEIhR+MHKT7cLtR99WMCh22GQotZ3MUmWOEuM4/zk8YKoN/yQ==
X-Received: by 2002:a5d:4d01:0:b0:2c5:4ca0:1abb with SMTP id
 z1-20020a5d4d01000000b002c54ca01abbmr7295022wrt.60.1677058490952; 
 Wed, 22 Feb 2023 01:34:50 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 e16-20020adfe390000000b002c54c8e70b1sm7061642wrm.9.2023.02.22.01.34.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 01:34:50 -0800 (PST)
Message-ID: <f6f91c5f-5013-3c1a-9eac-e87fb7071031@linaro.org>
Date: Wed, 22 Feb 2023 10:34:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: Add Novatek NT36523
 bindings
Content-Language: en-US
To: Jianhua Lu <lujianhua000@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230220121258.10727-1-lujianhua000@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230220121258.10727-1-lujianhua000@gmail.com>
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
Cc: devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/02/2023 13:12, Jianhua Lu wrote:
> Novatek NT36523 is a display driver IC used to drive DSI panels.
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
> Changes in v2:
>   - Drop unnecessary description
>   - dsi0 -> dsi


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

