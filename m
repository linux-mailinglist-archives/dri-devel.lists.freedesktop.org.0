Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 991B189EE0E
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 10:55:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03EB111326E;
	Wed, 10 Apr 2024 08:54:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KAQdSWiY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712D611326F
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 08:54:53 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-41745acb8f4so1952045e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 01:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712739292; x=1713344092; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D2AsZ1QIiCmfybXFGVW0zxiOuEp+rgs+ouNgKbZDKFg=;
 b=KAQdSWiYpoJdEcL139jmig8ehL8yKS+xpvgbsj1lE4CRue+2KWRpID9ygV/dVx0ElC
 UJrQKn7ZQEIXLu/eR9ZYrvhQLydTqswa6cOty65LCBakMLpGJAhgPnLS2Mcmud4PYR9z
 OBHm35WvMyOCaJ/anj39MC//SdfLKiCDR+L1I5OOxE8EFFBKd6KMAYE4HWd75MB8pMBb
 3itXKdB9Q4GZW5+wUWvLaqLTcRO/3Ekp7U+DxdK73zt5gU5iAGZqA5MuI6+Pr9ePbgGu
 Ua3k49h3IEgvemhUYHXiT3LnJswoxfjlGCUsb6pa7gdj287DA0svmy5R+tBYyrno46wP
 jxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712739292; x=1713344092;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D2AsZ1QIiCmfybXFGVW0zxiOuEp+rgs+ouNgKbZDKFg=;
 b=BeSVzqyXDS3Gok7YvDJW6IM9wtg/Jkh6b18vD3UgvCsol8Zd20mEgOLGvtS6PzgKlc
 PNP7ZTy8P72GyhkqU+wqVqDssy/zr7mfM+FBthbUkD5UNIqVvYCPW4W+swghwTWzXWC6
 2l2ssYX/u3E/9ATyzM4rly26HdnuEntTkp78dUDI80O897QcUK7VQCQUsK40I7gzSmq9
 HcicchbpTo6mqt/7mw2S9BmLXlx4tVrOxoYzSIibnq7TgNJRtoVGLnZmsVeqSR0aYBDX
 d41XRKAA4g4LxXkQwpaU96SlO/qADAjkJGP/pbvprzwlNRwT5Wb7u3jWWPKYSPeAXUAG
 YRYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXB5LHahc/p0mjM/YtJWExVQ3YFpGAl9rEvUA7Am1/fehzJ9gUTBHo4CyRzbBxRNkZOwv9PMTDqAGfHEa27uD+QGOiDjIQ3AX4HpT6MqZzh
X-Gm-Message-State: AOJu0YwzYrXCxcrSsu40GRIBzbho2DEIdVVYZpfS6rulhWxYWF1aEBCd
 btpvV8QSSd4Ekz6vT8RzD9ebTVz1jx/UHwTAVF30v6lFnCNQeD4ztEgXE8BsNIa/sFUZq2+49vk
 iTjU=
X-Google-Smtp-Source: AGHT+IEJgQ9v9FGTkOkguC9zTMYpllaqcg3VK+wytjhD6ErKqeWqI+TOXQq+JItqSKG5kCWe34nSYg==
X-Received: by 2002:a05:600c:a4b:b0:414:726:87d9 with SMTP id
 c11-20020a05600c0a4b00b00414072687d9mr1961567wmq.12.1712739291342; 
 Wed, 10 Apr 2024 01:54:51 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a05600c1c0100b00417be508e44sm408832wms.34.2024.04.10.01.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 01:54:50 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Nicolas Belin <nbelin@baylibre.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 "Lukas F. Hartmann" <lukas@mntre.com>
In-Reply-To: <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-0-04f55de44604@linaro.org>
References: <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-0-04f55de44604@linaro.org>
Subject: Re: [PATCH v11 0/7] drm/meson: add support for MIPI DSI Display
Message-Id: <171273929022.3191460.6988833554592946386.b4-ty@linaro.org>
Date: Wed, 10 Apr 2024 10:54:50 +0200
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

On Mon, 25 Mar 2024 12:09:46 +0100, Neil Armstrong wrote:
> The Amlogic G12A, G12B & SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a),
> with a custom glue managing the IP resets, clock and data input similar to the DW-HDMI
> glue on the same Amlogic SoCs.
> 
> This is a follow-up of v5  now the DRM patches are applied, the clk & DT changes
> remains for a full DSI support on G12A & SM1 platforms.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.10/arm64-dt)

[1/7] dt-bindings: arm: amlogic: Document the MNT Reform 2 CM4 adapter with a BPI-CM4 Module
      https://git.kernel.org/amlogic/c/ef5a84d716042871599ff7c8ff571a6390b99718
[2/7] clk: meson: add vclk driver
      (no commit info)
[3/7] clk: meson: g12a: make VCLK2 and ENCL clock path configurable by CCF
      (no commit info)
[4/7] drm/meson: gate px_clk when setting rate
      (no commit info)
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

