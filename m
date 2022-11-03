Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1B46178F0
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 09:41:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D76BD10E253;
	Thu,  3 Nov 2022 08:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F4F10E253
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 08:41:42 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id cl5so1524026wrb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 01:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W9DytQ1lu/QgUtGO9mzgm9cxKNspCA3RpOmraCTiE/0=;
 b=ihPXTyZfARlzx3zOeMgnhgDEhAPFQtxt1dh/8v6xYYs43Ecge13lHiGYkcUjZQKcJS
 CDeRGSDlcKyd1uI4AgO4P9gq3fZ3SNRCBMA2TZEjJCqLXcDv3MEcWmJuVrulMa6b5HEX
 lLQREkxj4BSVnbxmqIM5YHhXNpnGBG4egcSsybFwYgGBRhk+DlrVgFNqvq5gFelw5SD9
 qSkT5x7/PLTP4wbL4yQeez8JMxmUKGGMYlwV5pVthv+ut4P9xGSsBH0w+iOW887dPP7U
 vNUeeAqjOO0oBRa0HY2IYYnyPbzoJrVrNA6CAb4/6oSszx5tjSuroRv8mOQwks2K5bt3
 8wLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W9DytQ1lu/QgUtGO9mzgm9cxKNspCA3RpOmraCTiE/0=;
 b=LQaU6YxX/ZjiHdQLXo9/P59MZmp51i7lQelkaTttt1FNpiAVfqUhEUAglJZHv97PPe
 tzay63mc7ikNHJ6ljpEdTyEhuBxavOwClHO+E8yZNVlJdAw70O4B+4VXFNGUOJhB/NAx
 t6IN0lKTaaagSs3qoi3SZ2voYq2+jfexTDsswKGnPWf0JOi/V+01pI5sF9H15cKPavAX
 RYRwagInW3MqW0G6mZ2fJLMIANb/Gp/BJH750Y2jmhwNFzWHfOq29jN4tjMupY6wietE
 1+IfIc//3IMKZ4BKP5hPOXyuigrTRjYMYVgkev5iVysYTN1IjCKQ2kla5QWAu8Jw+AXS
 4ciw==
X-Gm-Message-State: ACrzQf1YifcUuq9938aYHptKTXfG+o50l1afSHnj8Bmj4oMkPEsN9aTm
 ehDkC0pzHWdk8GcFu0t5OBT3fw==
X-Google-Smtp-Source: AMsMyM7hD2iS4TPUK2fXFcCk74ymN/Esmn+RsmRn2QjdiPKVFaUKmnE6zQeDBpcdQb0f/AtWUQ4wSA==
X-Received: by 2002:adf:eb51:0:b0:236:cfcc:76e4 with SMTP id
 u17-20020adfeb51000000b00236cfcc76e4mr12571984wrn.291.1667464901174; 
 Thu, 03 Nov 2022 01:41:41 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a05600c0a5300b003c21ba7d7d6sm504178wmq.44.2022.11.03.01.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 01:41:40 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Nathan Chancellor <nathan@kernel.org>
In-Reply-To: <20221102155242.1927166-1-nathan@kernel.org>
References: <20221102155242.1927166-1-nathan@kernel.org>
Subject: Re: [PATCH] drm/meson: Fix return type of
 meson_encoder_cvbs_mode_valid()
Message-Id: <166746490033.1047451.8509801800691914580.b4-ty@linaro.org>
Date: Thu, 03 Nov 2022 09:41:40 +0100
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
Cc: Kees Cook <keescook@chromium.org>, Tom Rix <trix@redhat.com>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>,
 linux-amlogic@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 2 Nov 2022 08:52:42 -0700, Nathan Chancellor wrote:
> With clang's kernel control flow integrity (kCFI, CONFIG_CFI_CLANG),
> indirect call targets are validated against the expected function
> pointer prototype to make sure the call target is valid to help mitigate
> ROP attacks. If they are not identical, there is a failure at run time,
> which manifests as either a kernel panic or thread getting killed. A
> proposed warning in clang aims to catch these at compile time, which
> reveals:
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/meson: Fix return type of meson_encoder_cvbs_mode_valid()
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=6c4e4d35203301906afb53c6d1e1302d4c793c05

-- 
Neil
