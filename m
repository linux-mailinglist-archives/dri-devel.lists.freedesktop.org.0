Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDD07203B3
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 15:49:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FBAD10E156;
	Fri,  2 Jun 2023 13:49:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B5E10E156
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 13:49:20 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f61530506aso20831905e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jun 2023 06:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685713758; x=1688305758;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c8bnl8GQKoT6cwlD325NEGqoE59ixJfMqJHln/m0Cg4=;
 b=eyC+VMNvjOptGOgTy3U4OFJbTt6xWOHDjCabC5yB27fsk2QH50oXNro0SlTWPns0jT
 ZDx02HwzNB8dOK+3qicBybjCRdGSHIdOfxaAnZnYsUz7bFQlSOg86jtOIikz4ntYJG/B
 5qNOfCSsRMtrhBcQhGiTC99FKW0hDXMkZ+dR/y9zL4R5yRKNLdfbFqWUQlvmdJZjm+L3
 jKCEoyWxymKV3NewlctpoGnnAEElZ+MJUqVcE7QEGQbIyZTxVMQ72GhxN1IvwM8NuWXs
 skhEgm+AgONtaBqaA+XavrEF2zH8psnsBWXRtZeFNK1hLwW132sRjLhIDUJhRvDcNmtL
 dwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685713758; x=1688305758;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c8bnl8GQKoT6cwlD325NEGqoE59ixJfMqJHln/m0Cg4=;
 b=d9nGzarQV4tO8tTQVDdYZeQNUds0osWVgou9Ip0WVaBF8vaL6a/5Sl5DzQezWFHC/N
 5Qe+Y/n9soMbBySZOwIt55ZTO8IhFebukFeuWOJKYNU69+DPMaPwOVBL9FLTAbH5p6vv
 yOJjj/LMayVFdI/yTk9XDYlKyT0KpauWy30Ha2ECSxa+x/ijRmqkg7IYvgW/RN3G3T0f
 YadgDpn8wWEoViIqF6UUbTniqjOxoCtKcIRSL3diCWKjxvLH+sKqv7ZENsClfprVWKeI
 axJ37CnU9O5pTzSlKUqBhJqh+QSlhOEUAMIDyAaOQbjPmYR/voh1ukBrKUWZga1q9ZhT
 s6sQ==
X-Gm-Message-State: AC+VfDyFtlKcBKDOBZPIahy9Cb+m23Bd0s/ZqknQ46N4/033GlKKmT6k
 yBQ4xzWVnQ+lXYwOEC8bpWXOWg==
X-Google-Smtp-Source: ACHHUZ5S/JA1hr5rSYxSnxg7uYsN2zZpSGqYIEPOQJaeEmxWuJhheGTMro5peQL6aYr6JcOsOeeO+w==
X-Received: by 2002:a05:600c:2903:b0:3f6:1bb:1dce with SMTP id
 i3-20020a05600c290300b003f601bb1dcemr2073697wmd.13.1685713757900; 
 Fri, 02 Jun 2023 06:49:17 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a5d6786000000b003078cd719ffsm1752941wru.95.2023.06.02.06.49.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 06:49:17 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: airlied@gmail.com, Yang Li <yang.lee@linux.alibaba.com>
In-Reply-To: <20230602091416.107850-1-yang.lee@linux.alibaba.com>
References: <20230602091416.107850-1-yang.lee@linux.alibaba.com>
Subject: Re: [PATCH -next] drm/meson: Remove unneeded semicolon
Message-Id: <168571375715.833434.17616843568511143973.b4-ty@linaro.org>
Date: Fri, 02 Jun 2023 15:49:17 +0200
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
Cc: martin.blumenstingl@googlemail.com, khilman@baylibre.com,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, 02 Jun 2023 17:14:16 +0800, Yang Li wrote:
> ./drivers/gpu/drm/meson/meson_dw_mipi_dsi.c:117:2-3: Unneeded semicolon
> ./drivers/gpu/drm/meson/meson_dw_mipi_dsi.c:231:2-3: Unneeded semicolon
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/meson: Remove unneeded semicolon
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=e96f099c8544a542f7cd37d2e51ba52786adbbc7

-- 
Neil

