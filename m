Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC639B7880
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 11:18:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 234F810E118;
	Thu, 31 Oct 2024 10:18:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GEwfHE6v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ECEF10E842
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 10:18:07 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-37d538fe5f2so563504f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 03:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730369885; x=1730974685; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zbKlMfLsvMFTnYP2zSuabkcuPcI1EtftuFYYUuKCDN8=;
 b=GEwfHE6vtZ6d+E2A+qedf1R+9lUduodLsIXAZI2Pa44QRq66rLpLL9ZZm+RBO3t1ru
 HsGv6ovVTBN/q6r+8pZL0/Sn3a+qSbv27b87CyNj8b1Yzr/ZMRCC/dj+dyRNpwFq1TGa
 a8wUSWL/kXNSOtRaGyi4OtT1wYcsn3eKeDppEiEQxF7Crtj5M8Ni/+7GJLSuf7EOiYIM
 gaSa939q0oGMx9LyV5SXFVMIwUiJj+CDhd86o/wcKfjR1dpDUqQwKp40sI2Zl/N2Zgc0
 WreS20i1lsVTS3b2TeuRcCHFgbhbi+W6IZ7RzBD+RXD7pkuGjjvo7DpoS4jk7G8rNi5E
 F5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730369885; x=1730974685;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zbKlMfLsvMFTnYP2zSuabkcuPcI1EtftuFYYUuKCDN8=;
 b=L7pVjo1mqDj6uZrjwLPKd/u4mtiAMAtDO/foCBA33nVNffwtOcENyyCexKcycvgM1P
 XlroLtc1rw7qD6HfGcPcn326mfIWtqmytw8mpAp6BpjzRLLUyXgEjv+rbT3FSzmwvZ7l
 cPq/Pol4qIsd+sz1q2VKwb7/u8uf7xVoaL0Uzh913T4P3k8oZmWZVVg1Q1W/Z/R71VwX
 OItkiurpo034f1g85NnZk33B0oxcYfawA+JmgkniEsoeNzjLzB2Fftjna0md7HUlALFm
 gTinnPArLBOaelnmg3yEDLq+wZ3jLOB9OVa004gCMvBZopXRpnbGhw2xTmzZx4n27FnR
 CSNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnylquduq/mjCruzfpsLK+AYiOT171ziNoh4/vMzYWxb/BJx9vAxPN1yFofZmXUJnqEY7CxxaLUpQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YznPyixJaJBwGJBKMqsk+Il4cs5fbQDlNjFx1lvRTLVwyXGiPfO
 lhHDkaHtSnkufiM/wgBFzKZhjpHPUFLq3sKSYNo3DY/cP6JcOwSYMaPOyPc9fD4=
X-Google-Smtp-Source: AGHT+IGCX3IRxS92Sd+q6XBt7pJBtLTSBxWZ6mf2JAbO8k9l38YvaQZx8tf1dO/Ew/ZMJtShzY0QOA==
X-Received: by 2002:a05:6000:2a8a:b0:37d:518f:995d with SMTP id
 ffacd0b85a97d-381bea2772amr2508132f8f.56.1730369885431; 
 Thu, 31 Oct 2024 03:18:05 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10e7449sm1678420f8f.49.2024.10.31.03.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 03:18:04 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jakob Hauser <jahau@rocketmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht
In-Reply-To: <cover.1730070570.git.jahau@rocketmail.com>
References: <cover.1730070570.git.jahau@rocketmail.com>
 <cover.1730070570.git.jahau@rocketmail.com>
Subject: Re: [PATCH v4 0/5] Add new panel driver Samsung S6E88A0-AMS427AP24
Message-Id: <173036988456.2180741.11445064656378016116.b4-ty@linaro.org>
Date: Thu, 31 Oct 2024 11:18:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Mon, 28 Oct 2024 00:42:01 +0100, Jakob Hauser wrote:
> The patchset adds a new driver for Samsung AMS427AP24 panel with S6E88A0
> controller. Patches are based on current branch drm-misc-next.
> 
> The discussion in v3 was not finished. I send v4 nonetheless as a new base to
> continue the discussion. I hope that's ok.
> 
> Changes in v4:
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/5] dt-bindings: display: panel: Move flip properties to panel-common
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/3c0ecd83eee9b8584588f629e01d209f2c3a632b
[2/5] dt-bindings: display: panel: Add Samsung S6E88A0-AMS427AP24
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/4998d53df6753c3dbb6e960291715027518c61df
[3/5] drm/panel: samsung-s6e88a0-ams427ap24: Add initial driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d5658db2a0768a73a862f8b5fe6daae10d3abfec
[4/5] drm/panel: samsung-s6e88a0-ams427ap24: Add brightness control
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/5b67fdf1668fc373b1e492e33ce7d17f7056a609
[5/5] drm/panel: samsung-s6e88a0-ams427ap24: Add flip option
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/e70d4f8e242bbc4fd39f3a867dc3e33122d7e559

-- 
Neil

