Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AD2554CCE
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:24:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF75D10FD0E;
	Wed, 22 Jun 2022 14:23:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E36910FD0E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:23:56 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id z7so24124494edm.13
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 07:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ASFP5IP9NFXmeexPLRW7qWJpEpGv0lKpIUxpCQWgUGg=;
 b=XdOLqhNxL7lmkLKULp9Ztpbq+zF0iuuPKXJVOBPylr6Blak5hUecuSf5XJBQVWuSnv
 RVs0AQSC+RepxEmPKVkauvYKAH/mqWMBcDW33/NJ8uMCbKLnbCbbzwvHSqWaZoTbBL8W
 bzRxiDHY3fz0B0rTVUfZ92iwn4bfCZehABZI7kyUnm3yEgPGrVwt+zwMvg66IegAnlln
 SjKXLjNMEjBU0WQC2KQwB/t/nrKm40Pa7WgUjDQSaJfLKR3fy/LCIerQ2aEGkNo21q5/
 wGI4MW+Hotjd3W4iOAp2DNe6+7KDtiLFTRnks10ZzTlloBt2anznfpv9512OEIR71G0z
 pXlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ASFP5IP9NFXmeexPLRW7qWJpEpGv0lKpIUxpCQWgUGg=;
 b=Emc5UN+kDv8kEMTRrwi0k2iwxbUGg0T/NpwQgdZ3mdF/Rmh8bydgSVLTa/EeZceZyq
 pVE7jOkwN4WBlCbNqf9VUSZH/jMuQnbK/IVmpLnpb7qV8JGFVJq2ryYCde+Qoi4mPwer
 JdFLvkhfzXYOxLKE+EDwn4vbhsppO3cWs5tyGIlpz1aX4Ip+THukM9ZwyrZm01zoqTLb
 NHniNmg4GwBkUibk+Fq5buwFaHU9h9ozdnAWdbmjUAjfUllqPMryEJLjrPSd6hSRv2GS
 kBWq+6iTC1Zpqx5zmiLRVxRnIOk9mM8ZocBxHTRBWGlQoHXuyntdLR0ietTeBOmdLDjI
 tgXw==
X-Gm-Message-State: AJIora8OUg7F1reH+YOAXHgxWBiqcEAXj2HwtnTmQYRDrrBAu+6SYsXR
 adVQ8EddXiixqlM/ar26ulWEeg==
X-Google-Smtp-Source: AGRyM1seX4ZkksCXeRPMkaLKK5W0HwS2FvD9c/bqAUsr+AUyprpmhST58KhyYKsR0XgOay0M5lAMhA==
X-Received: by 2002:a05:6402:d0a:b0:421:10e6:2ecc with SMTP id
 eb10-20020a0564020d0a00b0042110e62eccmr4430327edb.329.1655907834622; 
 Wed, 22 Jun 2022 07:23:54 -0700 (PDT)
Received: from [192.168.0.225] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 v18-20020a170906293200b006f3ef214e20sm9337863ejd.134.2022.06.22.07.23.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jun 2022 07:23:54 -0700 (PDT)
Message-ID: <b6a8e40d-ca4d-a688-988d-6800150d4e68@linaro.org>
Date: Wed, 22 Jun 2022 16:23:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 02/13] dt-bindings: Add headers for Host1x and VIC on
 Tegra234
Content-Language: en-US
To: Mikko Perttunen <cyndis@kapsi.fi>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 digetx@gmail.com
References: <20220622113733.1710471-1-cyndis@kapsi.fi>
 <20220622113733.1710471-3-cyndis@kapsi.fi>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220622113733.1710471-3-cyndis@kapsi.fi>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/06/2022 13:37, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
> 
> Add clock, memory controller, powergate and reset dt-binding headers
> for Host1x and VIC on Tegra234.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  include/dt-bindings/clock/tegra234-clock.h     | 4 ++++
>  include/dt-bindings/memory/tegra234-mc.h       | 5 +++++
>  include/dt-bindings/power/tegra234-powergate.h | 1 +
>  include/dt-bindings/reset/tegra234-reset.h     | 1 +
>  4 files changed, 11 insertions(+)
> 

It's not the fault of this patch but in the past you started encoding
some register offsets or values in the bindings. That's not what
bindings headers are for. Store here hardware-independent IDs or
nothing. For new Tegra SoCs I might start pushing this back...

Anyway, it's not this patch which introduced it, so:
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
