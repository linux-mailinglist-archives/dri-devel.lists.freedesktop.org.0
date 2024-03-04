Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C7686FB4D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 09:07:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9186610FE04;
	Mon,  4 Mar 2024 08:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QohYZ3ym";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E9610FE04
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 08:07:42 +0000 (UTC)
Received: by mail-ua1-f42.google.com with SMTP id
 a1e0cc1a2514c-7d5bbbe5844so2234593241.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 00:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709539661; x=1710144461; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=I4V64q1EnS//uojIpdSXO9kfi0xqru4ymFKUT9EN5ZI=;
 b=QohYZ3ymhhae4/NH78Es0b2LAYo5wrcBDDsymaKD1Nw6evHOSoQGLz/Q/et8nimkuk
 GpikS+JCqaz4R3pDFDEe8k+93zbLoVu8lpjptA3qaPNYOsL1LjZphis1NVl3q/VCmfNV
 1u8jKttdjZlsZHW7mL5XvL6j1Kw5aUmMG+VI6CeT2R8tz/A2Ky9QXdjcT6zLE8ldjGYe
 9KWU9ZJ+1LXrzan5IKMT0WsgcdEb2qpl17oyi94JFP4d9e9Cr/LefPKQiNisN5QuGVuM
 vbY2IB/nmznoQB+OKdbIM6mrLuBxCczzN8yqNXs+ofmDdQPt3+31LGcSHvKQcsKLu8e/
 Vytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709539661; x=1710144461;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I4V64q1EnS//uojIpdSXO9kfi0xqru4ymFKUT9EN5ZI=;
 b=u7dbMdTqxNs1IOt/HHjnK7+B+aB+YVDTRdl7YUZpdY8ZqqZdp+vpbDq9TgTzieaPDQ
 30laNSDwMk6bvDZiwdCUCKfJwOVi6eo508qdu6VFB5aBdGUfwPsxBZLD/kWM3g6FtrH/
 pBSuf36nzEZ57IavnFjzBF4fKCkRSpAh/r6gVZ4tIaMJogsSMD8WDm4cgU4bovAsSBJh
 4vadoS/qV18+CfmrDcAvu+mfk5yTgOu7n+foBcty2vvbOIQKgud3Q2hdSgRD92bchyUu
 HVOMnPjkMukdSTeby1VaiPbmXGYb2b7t2BqpHOq3H44ZxQbf6xAiuQ691degGIJvZUXV
 1C0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXa1lBLzrHospy9Oyq5x2Qm8T90B0DGYriXU5YCQIT+uhzuR4sRl4+2zEts2GyU2k/HvgNfwodXazZ5JmwsSYVmLuQnse18Zj6lV8CtAR80
X-Gm-Message-State: AOJu0Yz8u6mcjaR8rqlrmjiKfmKC0ra1pW94URE2UlH2+eAomAafknDf
 IsLss78jclPJbn7Tj+bRSaqw1ndf8AQPaMi6bHA8t46PSv6mXsze5sIiGN3sFhkm1+CikGUfMpD
 S7ItxcbwgjURyfvBi3KGrKsKGXzsFAKShaKWn9g==
X-Google-Smtp-Source: AGHT+IGe/sEs/lbpDzYz9UckYPkNs1+8EFlDGUFzLUMP5Sy5o1K+biDa5g/KZP7WE5+fr/wSS0T9+F0Wwd8AmHuOlTA=
X-Received: by 2002:a67:f1d1:0:b0:472:7729:69b with SMTP id
 v17-20020a67f1d1000000b004727729069bmr5396096vsm.29.1709539660578; Mon, 04
 Mar 2024 00:07:40 -0800 (PST)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 4 Mar 2024 13:37:29 +0530
Message-ID: <CA+G9fYvG9KE15PGNoLu+SBVyShe+u5HBLQ81+kK9Zop6u=ywmw@mail.gmail.com>
Subject: arm: ERROR: modpost: "__aeabi_uldivmod"
 [drivers/gpu/drm/sun4i/sun4i-drm-hdmi.ko] undefined!
To: open list <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, lkft-triage@lists.linaro.org
Cc: Maxime Ripard <mripard@kernel.org>, Dave Airlie <airlied@redhat.com>, 
 Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
 Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

The arm defconfig builds failed on today's Linux next tag next-20240304.

Build log:
---------
ERROR: modpost: "__aeabi_uldivmod"
[drivers/gpu/drm/sun4i/sun4i-drm-hdmi.ko] undefined!

Steps to reproduce:
  # tuxmake --runtime podman --target-arch arm --toolchain clang-17
--kconfig defconfig LLVM=1 LLVM_IAS=1

Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240304/testrun/22919744/suite/build/test/clang-17-defconfig/history/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240304/testrun/22919744/suite/build/test/clang-17-defconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240304/testrun/22919744/suite/build/test/clang-17-defconfig/details/


--
Linaro LKFT
https://lkft.linaro.org
