Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD0E6938DE
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 17:57:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC3B410E1E1;
	Sun, 12 Feb 2023 16:56:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF8C610E1E3
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 16:56:54 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 s13-20020a05600c45cd00b003ddca7a2bcbso2022293wmo.3
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 08:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/Eru5lWHw1YT6wGcDm/Y1zHrSXGWrUQ4j4UJ9DI8DhY=;
 b=YhD7GXsOXf/ZWNNEyO00bn8lrwtUXD0yCHYuK9vhLDg4CcjCbF4hZB4J2MkSDNdkFT
 lli22RfskaAd0tjyVvv/eCE/A0kVfJJv6nhqQqc26MXOljkyZbNqrHjnfqdNWEySaiMM
 OhU0YNoHpJ86obFkfdDoN6pHWjPLyOcsbbjMOnE+RRAqkKFOyrWe+qd6P273rOyiMjVY
 ygM3aeImD6ysrIa/nNzpMvWJksRW5mw3YxbvfzdLOiR81/rW6Zupyi19qEBOiB8cFNb1
 igrIb3RaWYveg9152PB91GfpoICjpEGpVp0/nS7Ao04ik1JjAr7q3nfNTtdUd70J5DJG
 Gymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/Eru5lWHw1YT6wGcDm/Y1zHrSXGWrUQ4j4UJ9DI8DhY=;
 b=cwJudaVBM40RS4cON2H6NnfJEZ0ijGgd7pPDNUUYunwIFeuHk3hhRqnFnuprHCAYLN
 NfP7jHYGqF+wH0q6vQBla0zC+5Rwaii5xauI4hcBZZaEmcuquNnJzYtfEAau+VZSyEtF
 +QJ1O0ncg/EoBnO7qj1i09hQqsidHN5L6yj8Gg5YgG7Sh0MCZiODrboHbXgNSFEA1hOr
 6lqa+cptSoczqfZV1B3OwTLG9Ob5gf0/tqJ9Hl/19yT20g8PHsUyfWWl/3xlxlHy1H8G
 mNIsJ64qWYWwaiQ0vfvZb2dd741ky58B1DUtAzavsg+GMGIAEdrA5Hf15SmurtS3szTr
 BMQw==
X-Gm-Message-State: AO0yUKXaeyn67RsUKK5Mn42EWto8ZRMBjCDxB1GHcxg0oKQpYErjnDRx
 vo/W0lcsrJf7yAGrU8iL0haRbA==
X-Google-Smtp-Source: AK7set9zT0F9F59wplZJome4tcnMKXDw3AXx1E5Rklu8HGmYaTSV/UpCGVDTm5PYo0A91G/GlbNlkw==
X-Received: by 2002:a05:600c:9a2:b0:3dc:576c:ab07 with SMTP id
 w34-20020a05600c09a200b003dc576cab07mr16942584wmp.14.1676221013326; 
 Sun, 12 Feb 2023 08:56:53 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 p24-20020a05600c1d9800b003dd1bd0b915sm14369327wms.22.2023.02.12.08.56.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Feb 2023 08:56:52 -0800 (PST)
Message-ID: <7adf2cf5-dcd0-748b-9aaf-7e5abc45d2ae@linaro.org>
Date: Sun, 12 Feb 2023 17:56:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: Add BOE
 EV121WXM-N10-1850 panel
Content-Language: en-US
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230212040843.231934-1-victor.liu@nxp.com>
 <20230212040843.231934-2-victor.liu@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230212040843.231934-2-victor.liu@nxp.com>
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
Cc: sam@ravnborg.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/02/2023 05:08, Liu Ying wrote:
> Add BOE EV121WXM-N10-1850 12.1" WXGA (1280x800) TFT LCD panel
> compatible string.  The panel has a LVDS display interface.
> 
> The panel's product specification can be found at:
> http://www.onetech.com.tw/files/EV121WXM-N10-1850ProductSpecification_20180801.pdf
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

