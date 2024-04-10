Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DD789EDE1
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 10:44:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B86B1130C4;
	Wed, 10 Apr 2024 08:44:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="IgYV336K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B1F7113260
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 08:44:37 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-416a208d496so11763715e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 01:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712738675; x=1713343475;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OXrCNXWIgPaFh0QtuAJvo+rsWblvd0ADI99YH8byk0o=;
 b=IgYV336KzXypQ5r35vw2mr6S9aGDcx+pzSVrvdF80U1N5cxyxHaOdLFkIPgR648vaH
 9cNcmOFy5BP/Qm5BLcJ/jaVcgUYt2J7hzEnpDU4FQ1nHj9HYvZzEaefEwiHPmbJC/zs8
 szKn74BIQxOUSu2nwMeKNNHRMMIMKWih7Cx/Pvh+83hFbkprXpzB/BAC2HjRbLnn/5jn
 80OGvW9zk3tg1e2lPNEQccYOZ5g6sGKwSQrcAbasn/9mFzJ1qfJIQ26w4GhDeMswit3r
 i/MfZ2hA5Dyc8CedwE0Wq7g1NrjS12R34juzpzoPMc+aqp/9XEu0Qhvre4M+7ekMnEPZ
 Pgag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712738675; x=1713343475;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OXrCNXWIgPaFh0QtuAJvo+rsWblvd0ADI99YH8byk0o=;
 b=Z6ZO3YwHqkwQo6v7q3NgP58QE5kmGf8UOmjhA7kcZZcwhr/tOygDUDxabrh0337mBF
 YETeE2YR4VBuOwpo0m3GSECRBnDp4vfq/YogbT7/ZIm85mG+Z/+Wj83V/ReeaQBh455c
 UOFSDs4cmKJ/nCHpbLdFdI8KDcE48cxSTnlDAG+Pgb70TdectgZwj4JHm3nCG1pDC8mo
 z1wKq12Bh8JrfBO1GNYof1f6BQvgIkhqXV9xlvQRZri69F+o/hoFa29EmmYaSLHswnuO
 55W1gzQGuxoISWN1ji0CqKtCkf7T02HkxpGJi8PDypzAtia6KEwx4MOUizalwXcqjNdp
 BikQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYVM4k4f3TbIiKMxIbh0CH7a/g93nT7Gz/K1YX1R5rKwDDuKDwboQx2zsPXrHasqU5JAfAioyHa2jIRq0Nl2qZAjYWiYpL3nZRvmsRWYVY
X-Gm-Message-State: AOJu0YyTzEe8BROYEB/fAK0V243TJyWG1EDmU3TMzbK5RGLC5EyQaz/K
 L8rjS8hlFUYdIAv1QbJkRMeWaiEiY5GNin2Ij3e9rmaWO43EAfgxYaRsPefbi1k=
X-Google-Smtp-Source: AGHT+IHe2X0O7trL5Pg/N7aJNVS5U+dm4Rs/QIlLSTeBZVXFLzWtij6sQgRwdxIn0sbsxOB8JhZ8Vg==
X-Received: by 2002:a05:600c:1e0f:b0:415:8651:9bae with SMTP id
 ay15-20020a05600c1e0f00b0041586519baemr1464364wmb.41.1712738675386; 
 Wed, 10 Apr 2024 01:44:35 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:49de:129e:d25e:c803])
 by smtp.googlemail.com with ESMTPSA id
 t1-20020a05600c41c100b00416b5e6d75dsm2066078wmh.1.2024.04.10.01.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 01:44:34 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 "Lukas F. Hartmann" <lukas@mntre.com>
In-Reply-To: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-0-99ecdfdc87fc@linaro.org>
References: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-0-99ecdfdc87fc@linaro.org>
Subject: Re: (subset) [PATCH v12 0/7] drm/meson: add support for MIPI DSI
 Display
Message-Id: <171273867421.2243434.5037326499046523723.b4-ty@baylibre.com>
Date: Wed, 10 Apr 2024 10:44:34 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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

Applied to clk-meson (v6.10/drivers), thanks!

[2/7] clk: meson: add vclk driver
      https://github.com/BayLibre/clk-meson/commit/bb5aa08572b5
[3/7] clk: meson: g12a: make VCLK2 and ENCL clock path configurable by CCF
      https://github.com/BayLibre/clk-meson/commit/b70cb1a21a54

Best regards,
--
Jerome

