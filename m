Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4C385EBA8
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 23:12:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB0110E3F3;
	Wed, 21 Feb 2024 22:12:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VmQ+v+z3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FFA210E3F3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 22:12:52 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-dc23bf7e5aaso7001390276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 14:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708553571; x=1709158371; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zvHohG/osJUUJ6MrbAQ8TEaNGcUB4t0Qr7/JkHGHUIo=;
 b=VmQ+v+z3mEl4ATXha08RlQ8wTOAimqCJgkEbTWEpxWebWgcq9R9TBxmJjzpp8l3dUK
 Yf2ZvM9n0NwyAtE7ajSbSh3sHerdkWzmIh4FIXcmVbNwGZIAi/S7ViCKYTnDUoZjsR7I
 J53FEoBdl1YGWtwmDM1IelkY7SWVuE9bp1n1GVnPEtaTYQhbeZkKQlQ90QzDfgbAJUTj
 FMQaR9EcbqjOBVp3qs8P4NGYImHGL72tT9UR4zyX99pMgQcOezme918GH4+N4ahuD0ao
 vaZ/w7epUDdvDW1250/RpPZ9JGiVn3RChR5aaUNW19OobXrJHbLs+rk4QrGbE5SQf/Ay
 ilVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708553571; x=1709158371;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zvHohG/osJUUJ6MrbAQ8TEaNGcUB4t0Qr7/JkHGHUIo=;
 b=F2ycBswNE05mJhBxc5ixK6plDG+3Jkw0ma45SDKeVQP7XOfthDdW7Gi9cFMksBfME+
 ilt3TYfy6x+btb4gNC3d7tryOnhT+n9Yemaab8Yqwlqr6+xGFGWQK3nrJtMQ7j+P5Nij
 ShCDBmEd71NOl2ZF/rh6paXc7ffmZQFn+V24EFu//jc05naZTbAIzTKLjJPkxbqaYwxM
 XClTEXJS6eEOIJU70gDoIhG7X7HwL+19Fhpcnq8eKoj3RBMWaYg3+FqtvCjz6LiNyCwL
 wmjPUwPHZZHGPw3B2DEUcopQPr5knCEGM/houeSUIPk0wDnb5MZuWpGsQLrihM78EG3j
 dN6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWly0UYFDCNsU5F7Yx1OvsUg/joGOTyXcsZvVlfFRglEg1CKbEqy1pYP4g7pXlukYS9S89YLPuMkx0BEUNqOSSwGUWThok9eLFLhnJVkvQ2
X-Gm-Message-State: AOJu0Yy/D7zYo44aExm+tQ1OaEK690ARnACsHhyU9sXO0Dzv3TnL/CCk
 gvNCE3EOP02SzY2Y0lBRUiBPEY7FvQuAiCVcP7Tq6Og0eopnexKs
X-Google-Smtp-Source: AGHT+IF7kP+13CFMgvNV4rXPEp1sBAjlnfLwnWDRvHGUt3wwBoE4opoEpDnOPFhvcnuSrbWo1HtsDQ==
X-Received: by 2002:a25:9346:0:b0:dcc:76a0:503b with SMTP id
 g6-20020a259346000000b00dcc76a0503bmr692068ybo.13.1708553571608; 
 Wed, 21 Feb 2024 14:12:51 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 i19-20020a05620a405300b007858c17df9csm4712295qko.96.2024.02.21.14.12.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 14:12:50 -0800 (PST)
Message-ID: <69a0df59-7d27-406b-b0a0-3e43f18b20bf@gmail.com>
Date: Wed, 21 Feb 2024 14:12:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: constify of_phandle_args in xlate
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20240217093937.58234-1-krzysztof.kozlowski@linaro.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20240217093937.58234-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 2/17/24 01:39, Krzysztof Kozlowski wrote:
> The xlate callbacks are supposed to translate of_phandle_args to proper
> provider without modifying the of_phandle_args.  Make the argument
> pointer to const for code safety and readability.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Florian Fainelli <florian.fainelli@broadcom.com> #Broadcom
-- 
Florian

