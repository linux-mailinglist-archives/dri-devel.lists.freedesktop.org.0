Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB09B8B3B95
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 17:32:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F365810F11F;
	Fri, 26 Apr 2024 15:32:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="exVXzt/A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B4E10F11F
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 15:32:34 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-57232e47a81so3897328a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 08:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714145552; x=1714750352; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=sJXC/5vAoOZwUtcvINfBAZrBvMOr+O+V8uNP31uYJMs=;
 b=exVXzt/AbqjUoLLfLXLOP+bDhrLcigGJPJY5V6M3K+iX+qXDWc+hJPtZlqkOSS1bGV
 A/ZxoQzjlRwt9vjNMgoCOmuLrQH2K5rLZEAXjZ1VvQv/0G3ir5H88SLaouB3Lc/jxkBK
 z1aLtDlKqeOwqvWD++VDjEaKvMYJyQZM69V8YMZBjn0ITmZ4SuB9YKgyzO9QGxcWu905
 aOULcO5tZasu5rlV01V9cpbpQo4R8tuEbC7xTlj5xHOeoX5Rh22Sr+u+M9zKKyJXNk8c
 d5uOF5LZCCvboKtq5jhN6K0U8np28R5LURynM67Fl+UPJnabAWQ1VuOv8rsSmB/TiEVd
 XvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714145552; x=1714750352;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sJXC/5vAoOZwUtcvINfBAZrBvMOr+O+V8uNP31uYJMs=;
 b=fwA/QTxBEN0JpoHvsi3PoqxYj5Nw9HCw1sB0rtQ858tC94zoE4v9xYz8elGGjISOvw
 c5mdlmOSOoV+XFc8Ma2SSoeRB1fATfIMJHTkUMZ04faiKnx4dC1bPBuKYo9mFsb5ZCZ0
 rRD+ylAmE6c/6GSJNqgcOEbmDDBQ8b8+vkuYjrTqFfUImGBKAHRCMrEAI4fjnQZSIdOL
 YOIPqziuqLhwYSNnd2Wb4fOk23tvXH0C6V/uP7Jc+hZwEULiT2vjAbGdXVZPIdPJmYWE
 IfL/Vmhdmj3pJb4ft9sJhfK1lxC4bGnEzK8Kt13QhKssPbCfbQ3V/Rnjne6NyhEzbS4h
 xDiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvWkL3/haryIAeAIXDWUmQPifI7501VezPyogiHjFaB5wSVAWrTzzg/xRxsXTJk+2ImHVnjocJKSpw1RYGBMs8GHYq2NnCWFwiM/9TYe9Q
X-Gm-Message-State: AOJu0YylJuFYfSPwYPCZfvbOAFaqI3iPR31Lo9oB3IWNx8rPqR1kkYWx
 NTeSe+sgxr3uJRYGdxNVrSKY6oINlWRYUy+k6TMrYsryUl2N4XKH
X-Google-Smtp-Source: AGHT+IHULtZbR/4hjUfKh64G2f3BnxFRCTlvgkv414w4u51Jyt7pp+dglbscvZM5LOhe9A6qttVJLA==
X-Received: by 2002:a50:d6c9:0:b0:572:3b3c:754f with SMTP id
 l9-20020a50d6c9000000b005723b3c754fmr2680979edj.4.1714145552381; 
 Fri, 26 Apr 2024 08:32:32 -0700 (PDT)
Received: from localhost
 (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 y43-20020a50bb2e000000b0057000a2cb5bsm10542044ede.18.2024.04.26.08.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 08:32:32 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: herbert@gondor.apana.org.au, davem@davemloft.net, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, catalin.marinas@arm.com,
 will@kernel.org, mperttunen@nvidia.com, airlied@gmail.com, daniel@ffwll.ch,
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Akhil R <akhilrajeev@nvidia.com>
Subject: Re: (subset) [PATCH v7 0/5] Add Tegra Security Engine driver
Date: Fri, 26 Apr 2024 17:32:30 +0200
Message-ID: <171414552137.2298337.4837480787385115790.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403100039.33146-1-akhilrajeev@nvidia.com>
References: <20240403100039.33146-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

From: Thierry Reding <treding@nvidia.com>


On Wed, 03 Apr 2024 15:30:34 +0530, Akhil R wrote:
> Add support for Tegra Security Engine which can accelerates various
> crypto algorithms. The Engine has two separate instances within for
> AES and HASH algorithms respectively.
> 
> The driver registers two crypto engines - one for AES and another for
> HASH algorithms and these operate independently and both uses the host1x
> bus. Additionally, it provides  hardware-assisted key protection for up to
> 15 symmetric keys which it can use for the cipher operations.
> 
> [...]

Applied, thanks!

[4/5] arm64: defconfig: Enable Tegra Security Engine
      commit: 4d4d3fe6b3cc2a0b2a334a08bb9c64ba1dcbbea4

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
