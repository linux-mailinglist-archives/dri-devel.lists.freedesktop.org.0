Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A506FEE04
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 10:48:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB7710E5C1;
	Thu, 11 May 2023 08:48:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F71410E5C0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 08:48:48 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f42c865534so28005035e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 01:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683794926; x=1686386926;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MavG6Kk9Pe4HL8j0/etWioEuDmEHCWaEC1JE6orX7J8=;
 b=NxXdF6IBega8jFYuWRkcRkfYvkDka8+uB3602hlNkRCCOIaUDNICbSKD55cWEW8SJc
 GCUnzVdCB2GM+oMnpi0pUGK3ZAciq05gaus6Jl415AJDnoYltrMsXoj4gjsukrqg6a+p
 G86oMsjtNTL6zNdLj5KbG0Eg3xW5MKYfYWDO6ZAFdCkn97UJ5tBJo+cIs1U+8q1Fgv+K
 3lGonlm90bIZR/9/4+6L47VXHPVWgfDVt2geFOgLMDScX25vPeSlsRCEkHt3V4ESBb5J
 YpxV4yIJTYxY1/2QYAkGbbLhv8xskuMQB6Iysg9LR44sX5HACNEIXqUNPt6R8wcxC8v9
 z44A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683794926; x=1686386926;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MavG6Kk9Pe4HL8j0/etWioEuDmEHCWaEC1JE6orX7J8=;
 b=akcOmhR/paZD2BjXIYCdCnCoDvyUhXot9QntcQb5ZZSMmOMa9nZ1o8G6ZNJSIrFEtV
 57Y992sqVh2+LCQftv1NG4KPLJmF2Uhm2tErrW3jNbAeOnQChHeJuD2qPtmRXclOajRU
 wYqAwzy+B4asfsKmXvyktkdrWcFjQ8YZDDpfzibP+fF7f9CP/iSCm9ChnTiER76sCGCQ
 kvseQfDs/hOMOpLNaHo/py0Bcxb4gKpnXOrv9OXvZqrsEJ7Zmx34Yg4RHsG/yGy41TTB
 8eOy2c3C9uMoYYubhpWErA4/w4lh8no2pQnhfoDWCeTc5dOuV0cTZtsbmjsk7CvdE6Z0
 SomQ==
X-Gm-Message-State: AC+VfDxUfr9xJ/pfuCYVGAalq8tRNSykLlEPHoKaI9fJN/bCdWm/me4U
 U+Fu/7T2u4pkxI5Nzcr8rjgqYA==
X-Google-Smtp-Source: ACHHUZ6FxN8xnWtJ2s+Qw/vMfGQbDW2EOFTHMfzqCuWj9Tjx6S+HdeZIbvhZc1lxPKciTJMffPqKPw==
X-Received: by 2002:a5d:4fd1:0:b0:2f4:e96e:3c86 with SMTP id
 h17-20020a5d4fd1000000b002f4e96e3c86mr15638478wrw.14.1683794926354; 
 Thu, 11 May 2023 01:48:46 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 z6-20020adff746000000b002f103ca90cdsm19707750wrp.101.2023.05.11.01.48.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:48:46 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Liu Ying <victor.liu@nxp.com>
In-Reply-To: <20230508083826.1016206-1-victor.liu@nxp.com>
References: <20230508083826.1016206-1-victor.liu@nxp.com>
Subject: Re: [PATCH v2 0/2] drm/panel: panel-simple: Add BOE
 EV121WXM-N10-1850 panel support
Message-Id: <168379492556.1992146.7262967209295860985.b4-ty@linaro.org>
Date: Thu, 11 May 2023 10:48:45 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
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
Cc: conor+dt@kernel.org, sam@ravnborg.org, krzysztof.kozlowski@linaro.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, linux-imx@nxp.com,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 08 May 2023 16:38:24 +0800, Liu Ying wrote:
> This patch series aims to add BOE EV121WXM-N10-1850 panel support
> in the DRM simple panel driver.
> 
> Patch 1/2 adds dt-bindings support for the panel.
> Patch 2/2 adds the panel support in the DRM simple panel driver.
> 
> v1->v2:
> * Add Krzysztof's A-b tag on patch 1/2.
> * Use struct display_timing in patch 2/2 to tell minimum and maximum
>   pixel clock rates.
> * Set bus_flags to DRM_BUS_FLAG_DE_HIGH in struct panel_desc in patch 2/2.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/2] dt-bindings: display: simple: Add BOE EV121WXM-N10-1850 panel
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=0bd5bd65cd2e4d1335ea6c17cd2c8664decbc630
[2/2] drm/panel: panel-simple: Add BOE EV121WXM-N10-1850 panel support
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=8bb7c7bca5b70f3cd22d95b4d36029295c4274f6

-- 
Neil

