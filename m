Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB71C7FE68
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 11:30:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38DB10E1A1;
	Mon, 24 Nov 2025 10:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="KI8YDpri";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9453E10E1FF
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 10:30:50 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-477b1cc8fb4so23350375e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 02:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1763980249; x=1764585049;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4c093UhJVULliuhoXS0buCOSXcGwmlWet+kmHrIixLs=;
 b=KI8YDpriZ49cZXEei715dR9nSCcWYcCA3bEDYcNEVgnXO7khyK+Oe6/0tV9XBRzLmi
 C0PNofZq+wB5dWSk3fY91pYoVgCOo6OHI2wjqigVKcWLg+QA2+Z8WMoBNBlR1ktcJUta
 0jY7bH89c7+gXSUbUgYJn37uU1EMHV+KntFcn3xVYHZwQ3+qPf328vveMx8964QPbleV
 vaBL1NKFSWEcxiSAtpJgHZ9/PoCysjdpeDa2z1ZD0sXPpk/NSZIXAb1zHC2f8ZQ3m+yG
 EKucTotJWFMxGjrbsN5kl4lPhKSZ4DFeF+HapN5W7M8oH2MmNE1QEZ72K/lg79CCzKwA
 PDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763980249; x=1764585049;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4c093UhJVULliuhoXS0buCOSXcGwmlWet+kmHrIixLs=;
 b=AtBl8RWajOe++1JmYPo0NzneaVwiKgJmPJ+3IMuO3dzEVyNnT3qeszcqg5QUf2MlLd
 M2g7FhjTc2uQGh8VynymLeP+L0OOqGrSNBpfQ6pFykFNFI/KD1KHISyD/iuwTlLLEkls
 8jMmvGGMIfAsm52l4bQI2+hgHnBlmuLLr0Il6/ZDtTyWtyfdt/IC1lDvSMYFZqeclMxv
 e9ZjGD8zl4Fu08NUakopNQVtDC/cfMnBXgq2X8Nb639ZB57UfeA5vPA1xLr7He5NWlPj
 0Ix2fmGfHUklIl3KSOIsFnGHujZcuzqBKStSbtvF7s8G1V9awY16RgZoGXURDXmQyDAQ
 ficw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWc8j7JZ8CTAIGCq5rdSbh3o0eoPX2j1e9Wk+D1oJDWNvfJkjuyAbynaEsHg+igLNDV+04AwQTIZVY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtnBPxRRT5ZqbkyXghzPUow/KO3ALXHg/Lu75S1ZkBKKlXcNpH
 AbChDypnUUMe9xR7mza221QLS561W3WYaGRd3XtY/ra1c0FtTpYGopUqhVUuUfKczGI=
X-Gm-Gg: ASbGnct04ClnFS5WGVuIWlUYEMuOSiZdO+EqaIaV5VQ/MsAPtWAnd9KLgF659cPuj0X
 bsxTsdI44xKVKbgOd/kuseV6YlN2ICPLZW0rNkIQ4qkrdW9WnkU2+eO5cIIFIC36CbYUrqJUgPt
 lGQbfQhFs1HkgwRxCOq/P37ivIr5Pt/LATnbeTzbeA6if8yP4kKzX7K56x0yUwxPOCdjg932KsL
 PdmkSTIsLnfvza2aOlljtI864nRUKFCWr5Pzo+s0wEm4WrwrKjRVcXw1ff867XpuEe6t/Qy17iu
 Apz5o+XO5jKlaScqLj7K6J/iSfOibo+m02aF54o6G1evcH/gGSyOjCQ4w9pOLIFqAKYVrL78GCV
 /XV04RPRlXbuvqhPnR4xByqTnObO9TUaHHsOO2pljGNcVHRFVZwgc04tMjsqK/JNrd+jQEqG3bL
 p1mp8pEok1h0IxVIh6bzmegx+c/zbrkrr133DHRgzy1q6e70I5EUufuqKhe6UuPsfEQqSFIg==
X-Google-Smtp-Source: AGHT+IHPvlWQDf6K1Dga8MvZAdfzerPWHGBEBq8a4QKy7lgUieNkzL+6lwU5ijEhA9SrymIWtcSJSQ==
X-Received: by 2002:a05:600c:35cf:b0:477:9a28:b0a4 with SMTP id
 5b1f17b1804b1-477c00ee003mr144798845e9.0.1763980248870; 
 Mon, 24 Nov 2025 02:30:48 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf227ae2sm188134925e9.9.2025.11.24.02.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 02:30:48 -0800 (PST)
Date: Mon, 24 Nov 2025 10:34:32 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Pengyu Luo <mitltlatltl@gmail.com>, Junjie Cao <caojunjie650@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 patches@lists.linux.dev
Subject: Re: [PATCH] backlight: aw99706: Fix unused function warnings from
 suspend/resume ops
Message-ID: <aSQ0uLLsvnWy_yvj@aspen.lan>
References: <20251120-backlight-aw99706-fix-unused-pm-functions-v1-1-8b9c17c4e783@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120-backlight-aw99706-fix-unused-pm-functions-v1-1-8b9c17c4e783@kernel.org>
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

On Thu, Nov 20, 2025 at 01:22:46PM -0700, Nathan Chancellor wrote:
> When building for a platform without CONFIG_PM_SLEEP, such as s390,
> there are two unused function warnings:
>
>   drivers/video/backlight/aw99706.c:436:12: error: 'aw99706_resume' defined but not used [-Werror=unused-function]
>     436 | static int aw99706_resume(struct device *dev)
>         |            ^~~~~~~~~~~~~~
>   drivers/video/backlight/aw99706.c:429:12: error: 'aw99706_suspend' defined but not used [-Werror=unused-function]
>     429 | static int aw99706_suspend(struct device *dev)
>         |            ^~~~~~~~~~~~~~~
>
> SET_SYSTEM_SLEEP_PM_OPS, used within SIMPLE_DEV_PM_OPS, expands to
> nothing when CONFIG_PM_SLEEP is not set, so these functions are
> completely unused in this configuration.
>
> SIMPLE_DEV_PM_OPS is deprecated in favor of DEFINE_SIMPLE_DEV_PM_OPS,
> which avoids this issue by using pm_sleep_ptr to make these callbacks
> NULL when CONFIG_PM_SLEEP is unset while making the callback functions
> always appear used to the compiler regardless of configuration. Switch
> to DEFINE_SIMPLE_DEV_PM_OPS for aw99706_pm_ops to clear up the warning.
>
> Additionally, wrap the pointer to aw99706_pm_ops in pm_ptr() in
> aw99706_i2c_driver to ensure that the structure is completely eliminated
> in configurations without CONFIG_PM.
>
> Fixes: 88a8e9b49ee8 ("backlight: aw99706: Add support for Awinic AW99706 backlight")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.
