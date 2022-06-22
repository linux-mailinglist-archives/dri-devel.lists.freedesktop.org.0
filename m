Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 627E5554CE1
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:25:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E70510E254;
	Wed, 22 Jun 2022 14:25:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E82610E254
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:25:18 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id o9so14921732edt.12
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 07:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=o8BQszykOO01GSg6GqcelFQFdO6aAlqQ4V6nI9Ak9xU=;
 b=PL/Jy2/6E29/4T6R7ah0BIsvf2/tYs4P99/RVkkS2epNWM1/8L0TeK4CyZUQChD/Nr
 iwirMg82FxYllvVcN4WQY0tbm0ahAPbCNHooc8EK63IDLEns5AevQpDagl1dBBkeCPOp
 5Uhgn47SVJ6GGggGu3qETpIKjween7omIMWy0YqWc8c426EerA5HwXHznhZxFW90h3Kc
 HKWGmBe+PWvAl6/cMAS1mGBawpsmhyoUzct0G/iqk0vNcgoL9S6EF7cQ3JVESuqKZXG/
 XqNuWNP/u51ZXZDWYltK6VXhHt8YTRoaQs4WqNLBvJJTOuAjNFBeLW3vedWgBCxb6CVG
 EPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=o8BQszykOO01GSg6GqcelFQFdO6aAlqQ4V6nI9Ak9xU=;
 b=PB58cya2wH7xI17kE2GMq2wo2zBN3lg9xE3UjBejIGnVUIxynOGpcMtRICCoSbKosU
 uEptT1TBnaEH1n2ZLA71jcAHbAwaZIMg7el8yqJWC1v9uSEfq/I1JQv/h9WNxaVk20mi
 AkGBLU0e8aJaWb/5HdtlNwh5W54GpVc6eAmv8H+cauGAEL+pGMEQEk49WDS+Q5lVyg0h
 ytibuy62yPs3S6LaIXSu9sTewxMh58nRlyaP4ojBEp8FkvvS0LtnYM/46c/ZFa326uN4
 BB0jj7wBQHeLkyI5N2uKU+T7Xvh1JbFaHITzsH7VIByvBcZjTxe/FBpDXfdlWYNGPZ2w
 eWSg==
X-Gm-Message-State: AJIora8iuO2IGVmsifQTtqKo10gJy22y9RLs7pkJoxLuzt/kWRGTUtuO
 H/3LCA3bEN/UNWFfKa2tQIrlmg==
X-Google-Smtp-Source: AGRyM1usJfLNlqwF3SOJlrmxqF0s/Afh6Lg9nbMm7/FV4DlxjCxOcEI6qm1P5bDVYjGEghLhPUEdQw==
X-Received: by 2002:a05:6402:278f:b0:435:9bd4:be9d with SMTP id
 b15-20020a056402278f00b004359bd4be9dmr4383865ede.154.1655907916760; 
 Wed, 22 Jun 2022 07:25:16 -0700 (PDT)
Received: from [192.168.0.225] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 d4-20020a170906370400b006fec56c57f3sm9604429ejc.178.2022.06.22.07.25.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jun 2022 07:25:16 -0700 (PDT)
Message-ID: <56c45859-a4a4-07dd-6166-d4fa09769d8a@linaro.org>
Date: Wed, 22 Jun 2022 16:25:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 00/13] Host1x support on Tegra234
Content-Language: en-US
To: Mikko Perttunen <cyndis@kapsi.fi>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 digetx@gmail.com
References: <20220622113733.1710471-1-cyndis@kapsi.fi>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220622113733.1710471-1-cyndis@kapsi.fi>
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
> -------------
> Merging notes
> -------------
> 
> This series should be applied on top of the Host1x context isolation
> series.
> 

The dependency should be first merged into next, so automated tools can
process it.

Best regards,
Krzysztof
