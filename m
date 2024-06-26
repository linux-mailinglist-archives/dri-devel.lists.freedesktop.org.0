Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D95059179C2
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 09:32:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8108C10E79E;
	Wed, 26 Jun 2024 07:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Fo+y/5ex";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE6810E79E
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 07:32:36 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3650f2e540dso4312841f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 00:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719387155; x=1719991955; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7W4OioQKN0eIBHViOR9QZ+vNRz4LIKL+fXoMKffOCkw=;
 b=Fo+y/5ex2Ojwcwwq3s8urzV2NppcC/mtQhVwjXI1Y6ySQAKGPRAy6WbPkCVlrujkX5
 nqQRIatPbdoNr1Z/uN+DZFrOpEZ98SNBPaSdnQk1x6pT6s8tnn+YfC/YoKtRCZJcxqsY
 d97nXv46FMOccaU8T5Wd9SJDYNfyM4BxH29PFwhDhxa4HjLr8Nq1MUBvzLoKssx9Mz3l
 fL5aAgAM8eIMm0BdPGBGFEwOkiGSjdhzsWT6pSWvOS0SjJDqNdtuKslnrvArXGuAVYm1
 FUI1dVJY9sIM1oqIy0mqVBTOArRWO+CYGp+i02egCIunzbrr3s+g4Jt/SoimPJABj74E
 Szlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719387155; x=1719991955;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7W4OioQKN0eIBHViOR9QZ+vNRz4LIKL+fXoMKffOCkw=;
 b=QaDFOyEY3DzTtXMHmr02V7/5zIrnU+b/sqQyK9foCZrgni1jApAN4htc7PRE7eIYwN
 Jouzr2WQhrzzts96AlPH3NLoAPN/jQAwHAW/oGBCgwl9OAzlxNi2XGksvEK3XjE6ABZn
 cCFAFlzdhCRSB9jkOkb4DuhhGTKnAQEZd7fepxHVTpuezJUOk4eQsqG0SJhtkA270Mzh
 KApuCdynHfEMb0vBLIPfhjYW1llqqtYZhyrbwgTLHjo+1PCNEXT/4PORHb3MORJSEVQ9
 leEmk0c3+8bm1YM1CLUZTyrTn1H8hLuS+/f2tS58CJ+uBXX1mzhcff3G3bR/N3JUdelc
 uYdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaQo/R4Cwm6f6lA1hGLH3XGVr28B0YvMIQSNXJE6fZt+lFV8798Lrfm363w3qTzLUh3nIrgCih07MWu0Rczz7JWkzlrdY1kDewGbvQdw2L
X-Gm-Message-State: AOJu0YzNLUjC1Hnlrz1lQ/3z64MO2wz7ch1wRhsTWiUoVJM0/Brm68UD
 Yx1dihuAvIva4uLCS4wLEbwkljVnkIH6V48Iz+heRE/tpW/vzsxqhttbfA6bYl4=
X-Google-Smtp-Source: AGHT+IHkStzMgEtlbhfEd3vr7XWwRbdJYImOIKudj1b47ahck4Suw5YJPuzNImYmMu5zR3rIDZJ4Eg==
X-Received: by 2002:adf:fc0d:0:b0:355:143:b5f5 with SMTP id
 ffacd0b85a97d-366e96bf096mr5830496f8f.64.1719387154733; 
 Wed, 26 Jun 2024 00:32:34 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3663a8c8f07sm14962150f8f.110.2024.06.26.00.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 00:32:34 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org
In-Reply-To: <20240625145017.1003346-1-jbrunet@baylibre.com>
References: <20240625145017.1003346-1-jbrunet@baylibre.com>
Subject: Re: (subset) [PATCH 0/2] arm64: dts: amlogic: add power domain to
 hdmitx
Message-Id: <171938715374.1644768.9308792407844880407.b4-ty@linaro.org>
Date: Wed, 26 Jun 2024 09:32:33 +0200
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

Hi,

On Tue, 25 Jun 2024 16:50:13 +0200, Jerome Brunet wrote:
> This patchset add the bindings for the power domain of the HDMI Tx
> on Amlogic SoC.
> 
> This is a 1st step in cleaning HDMI Tx and its direct usage of HHI
> register space. Eventually, this will help remove component usage from
> the Amlogic display drivers.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.11/arm64-dt)

[2/2] arm64: dts: amlogic: add power domain to hdmitx
      https://git.kernel.org/amlogic/c/f1ab099d6591a353899a2ee09c89de0fc908e2d2

These changes has been applied on the intermediate git tree [1].

The v6.11/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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

