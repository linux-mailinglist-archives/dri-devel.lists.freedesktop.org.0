Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9E365AF3C
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 11:03:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1939910E2E9;
	Mon,  2 Jan 2023 10:03:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F8D710E2E9
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 10:03:52 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id g10so6264992wmo.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Jan 2023 02:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1A/c903RG4DRD/KA4H0kqMsL+9GohbLG+0ZnJrSJAlQ=;
 b=D+1k9L0qY0P1Ji/qNFpRhC5aixsA7eIu6QVRV9pnRf2ULMiRuUt+m8lZKp9TX8qR3g
 E1pklVDK9x3S+rMDlU4lfVWM7Yyj9Cz+R/r/8Tbn1MJ5cAHVkU2RIu9Gaau1OnaFifHX
 kFpJXKaGvnSY2xQwmwS0B7u1yOdSRk7dCwM7V9a2GEPsWkMAUWJQRR7KtleUM119053u
 DMYyMTz5Q4ZLYs7glMovTp5NAV1QL0J7seK3+rhzmDxX+L/XSwkMgPBZkKpa0Jz3JLiP
 AHXjoPl2MY1Qx05Rs34jAbqQhv3phgF7lSO7jSXb/Ghm/P/Qzaj23bzSMpIYIo2SsLpB
 nBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1A/c903RG4DRD/KA4H0kqMsL+9GohbLG+0ZnJrSJAlQ=;
 b=Bk5KFvj2XlXm+A2VGxFuvNjEBhXPOKyvGbaRw5KMm9yFWSY1JvdTGGtQar/dpwg/jf
 rOOasQhec+DZdq6sD+hMbo3nwG3DSDPJnnLyW57xuSmpC+ZEk++hVx9GIELEcJ0Mi2pe
 lmhh3g8h9upLigsc1rlSkPcSpJB1CdB3xQoFZuqdbGjObYALTLsbe5cAg3+dujEXkfJy
 zxdT1v3aEQifZ1r5RDeT7IWRkCKwrD4vzKhyxLVVfrTRkJxn+hIJQTSC5OElCwswxS8T
 U0jRYZxiw9hn21VdngZgS6PMyyB1J4nvLt3xScwLRru5rnv+KhWiXxzXg5/kYGfYMnoP
 T5bQ==
X-Gm-Message-State: AFqh2kqZN4wxdN0JbjcpQaQyB1VpBVcooQvTcX+0npYx8mPlWczyRTbx
 LTGN5gmCgnQqvX3Kl2nb8kycTlce/2VTTv3p
X-Google-Smtp-Source: AMrXdXt0Bh9wmwk3RF4bAotZJsEsotBcms18Id+jqLzrnyIEkrT9a0ZIrdm1+6Wcvuc6QGNHjinrCg==
X-Received: by 2002:a7b:cbd4:0:b0:3d3:3d51:7d44 with SMTP id
 n20-20020a7bcbd4000000b003d33d517d44mr28810985wmi.33.1672653830942; 
 Mon, 02 Jan 2023 02:03:50 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 i25-20020a1c5419000000b003c6c182bef9sm50636137wmb.36.2023.01.02.02.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 02:03:50 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Daniel Vetter <daniel@ffwll.ch>, Mark Brown <broonie@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Carlo Caione <ccaione@baylibre.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>, 
 David Airlie <airlied@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
In-Reply-To: <20221116-s905x_spi_ili9486-v4-0-f86b4463b9e4@baylibre.com>
References: <20221116-s905x_spi_ili9486-v4-0-f86b4463b9e4@baylibre.com>
Subject: Re: [PATCH v4 0/2] Make ILI9486 driver working with 16-bits SPI
 controllers
Message-Id: <167265383013.332488.18055553575413500835.b4-ty@linaro.org>
Date: Mon, 02 Jan 2023 11:03:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
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
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 19 Dec 2022 10:02:36 +0100, Carlo Caione wrote:
> This patchset is trying to fix problems seen on S905X boards when interfacing
> with an ILI9486 equipped SPI panel.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/2] drm/tiny: ili9486: Enable driver module autoloading
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=e9c7cfe7b71d26ee4a9f17192632f3d0ff246001
[2/2] drm/tiny: ili9486: Do not assume 8-bit only SPI controllers
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=77772e607522daa61f3af74df018559db75c43d6

-- 
Neil
