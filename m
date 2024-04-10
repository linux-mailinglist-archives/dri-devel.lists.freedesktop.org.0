Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 586D789EE0C
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 10:54:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B34311326D;
	Wed, 10 Apr 2024 08:54:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="c7rk875S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 875D211326D
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 08:54:54 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-516d3a470d5so6214185e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 01:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712739292; x=1713344092; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q9n9bIdxiQcPgRyTX+n58GNtmNfwkau4b2336NlqK0w=;
 b=c7rk875SopWUHe0oPWdRm+efIF08tDxm3B5azBVch1EnTqtMpmMqSMc0LaHQ6BvU+S
 7OmHWbDCY/W9iZBIQ3U1RghOYkiQFenIT1MaqBX91v67ofP6NL/unhI1dcnVXcV1a678
 UGcYkhXyDjVkKce+Pkkly21FNCy86aNQfVJsUBSUrW1DmjNe2eYKlPrkRawJ/aHkk+5a
 FY14IUcQnUrH1kBE81b1/P1TQVqe9o7xmJmGQdFguCwe9jx33uEBoOzlVdPBnyutpcDG
 rrXl2E1dNjb92nx9gG35sKM1d6cr3mFcPD0XcgEwtMXgHXm+QFcmTHd+rqg6sqSPRKps
 LDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712739292; x=1713344092;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q9n9bIdxiQcPgRyTX+n58GNtmNfwkau4b2336NlqK0w=;
 b=iU3rxoA2vGOYx04w7Ff0KiV082MgvM0reUWHnHbsPbs38R/TxbbrvyaJnob+2MZPqP
 leG+J1Q7XCQE7FeZNGWPsyHD6z7zGVmZS+5RU4MDtBSKKYXXVjBixM4NxgMAC0iYygIx
 UtqhluaXlpsVVjl+7ZgOiW0BdwY1tPq+RhOUoAAJwypiEYHT5/QpAuhVMLaiOxJdUTP+
 VMzb6KDXj0ALIhEyErQhoLU0ghCeEosENdrvZSCAxKz5fzmKJ5gwWdibExsXgIFFIwC8
 fTJl/pLBGJqq850mdmwqPXUDp7/RG+XXfqeH56jiwSbc28czr1qq2YgvXCII/uPR1eeY
 AFrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6IFTQwwLMBAxqDIGYiWxGLBHluLQ24H+p0nPDJxEvnWjrjJGiivfDEo7QC7t0Yzw9X+ydsr+G2ss97+W+Oui6Yp3bZEBJJ0eUq5vwN71n
X-Gm-Message-State: AOJu0Yx24VwIgkI8h+Ui9FSDoN/AWVA0R3yOwCDC95IYK9SqfUQqWVw4
 SEJ6MuhBcg9mObs62TX0eIZxfnsmnPqxaB0l+w36wwI5endFL9hdZzmbQdE9+EYvZvzmYgYB9zu
 Y5Ds=
X-Google-Smtp-Source: AGHT+IFNFRt4eMSzQqZ/7NkG1db8x/cM2BTv+GM3c/HklSBaajG7sctnDL9a2AdHlmfF903QzBJ7Tw==
X-Received: by 2002:ac2:47f0:0:b0:516:d30c:7236 with SMTP id
 b16-20020ac247f0000000b00516d30c7236mr1322034lfp.18.1712739292455; 
 Wed, 10 Apr 2024 01:54:52 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a05600c1c0100b00417be508e44sm408832wms.34.2024.04.10.01.54.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 01:54:52 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
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
Message-Id: <171273929144.3191460.10788273510731412114.b4-ty@linaro.org>
Date: Wed, 10 Apr 2024 10:54:51 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
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

Hi,

On Wed, 03 Apr 2024 09:46:31 +0200, Neil Armstrong wrote:
> The Amlogic G12A, G12B & SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a),
> with a custom glue managing the IP resets, clock and data input similar to the DW-HDMI
> glue on the same Amlogic SoCs.
> 
> This is a follow-up of v5 now the DRM patches are applied, the clk & DT changes
> remains for a full DSI support on G12A & SM1 platforms.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.10/arm64-dt)

[1/7] dt-bindings: arm: amlogic: Document the MNT Reform 2 CM4 adapter with a BPI-CM4 Module
      https://git.kernel.org/amlogic/c/ef5a84d716042871599ff7c8ff571a6390b99718
[5/7] arm64: meson: g12-common: add the MIPI DSI nodes
      https://git.kernel.org/amlogic/c/6f1c2a12ed1138c3e680935718672d361afee372
[6/7] arm64: meson: khadas-vim3l: add TS050 DSI panel overlay
      https://git.kernel.org/amlogic/c/2a885bad5ba4d553758d3f1689000cee8e6dae87
[7/7] arm64: dts: amlogic: meson-g12b-bananapi-cm4: add support for MNT Reform2 with CM4 adaper
      https://git.kernel.org/amlogic/c/fde2d69c1626bebb3a8851909c912e582db1ca95

These changes has been applied on the intermediate git tree [1].

The v6.10/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

