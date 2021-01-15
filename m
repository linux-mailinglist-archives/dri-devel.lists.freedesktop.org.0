Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 016FA2F8360
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:13:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E136E120;
	Fri, 15 Jan 2021 18:13:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D5076E0CA
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:13:20 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id y17so10189069wrr.10
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jZXgyLMN5uQO65wHWj6R5etzWm7XSdTARLD88YxZwNc=;
 b=Xu1ET1nmvjXAUY6crjgaR39cbqwSVmVo2ScDDgeSRVpgynPUOLLekfR/OCdafkS4hP
 bfhZawflBkkwYwH2VwzGuWy7DCzAd4ZXKoH/q6aLI5a8/rpVnORkJKn+QZaWpKiLlMre
 9miXu/DVCub/uSXDfBagraPMWIufaRC8UzzkiGX+Z9/fOFXq0TU6jnlEkURMsIBcpd4+
 cQ2RbBCZlLwZp9dPYyyKEg8yKxrNT9cAur22wGnT0TZe5xSCwkEk+9mlbIt1w5G0eexA
 PzPxXN5op6KJ5MhfYL7nfl0Ig7vQzhqQh3mPBU42Ge7Vdg8v6svlDSlCkajtjaeqjW5C
 m+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jZXgyLMN5uQO65wHWj6R5etzWm7XSdTARLD88YxZwNc=;
 b=adq4lj07Otwbg7dXAnqiu2G7ZLaWD0q7xLukpAQnPEaAN8tN79MSE6BaMs410nW7Eu
 w3xJAgLoMorE7S23ltpkgocvie198UoHUAq2XwbKMDjzWTCSSBEGHTc6HicvJC7B9yZb
 SvR8B0KADcNJBOkr04Nscjt93Wc3ExU+lIQhhewuh8Vqo9CA7r9S5v/PA1okqZ0U0ckO
 B9HFupL/N1hZXAY3/tm874WAW01bDH6p/O1AahFQNXaMW7hxTQihA9AGL9NDW5zFKRgS
 lkyWDOAiOYlJZN5q5M5SgprTvZDo1RC4ZxM7GZuqv979HFgKk7pTqckbIGeo/zHeg7R0
 dcRA==
X-Gm-Message-State: AOAM533oHkhYX9GIr6zeSLB2jn/sKcpYyLKHQBTQxZN86cas9Hhv7FB1
 WvvgnlloKoPmT6ua/kfb2VGGSA==
X-Google-Smtp-Source: ABdhPJwbDsoDCLQH6olNPLchaH7rNB+XAw15Ic2HNzwGJh633jpa3gffPWKcpLeztoyVrz5qULb4Pg==
X-Received: by 2002:a5d:6a4c:: with SMTP id t12mr14481400wrw.249.1610734399016; 
 Fri, 15 Jan 2021 10:13:19 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id j2sm16123484wrh.78.2021.01.15.10.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:13:18 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 02/40] drm/mga/mga_ioc32: Document headers do not make good
 kernel-doc candidates
Date: Fri, 15 Jan 2021 18:12:35 +0000
Message-Id: <20210115181313.3431493-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181313.3431493-1-lee.jones@linaro.org>
References: <20210115181313.3431493-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/mga/mga_ioc32.c:2: warning: Cannot understand  * file mga_ioc32.c

Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/mga/mga_ioc32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mga/mga_ioc32.c b/drivers/gpu/drm/mga/mga_ioc32.c
index 6ccd270789c6b..fd2160ea71fe1 100644
--- a/drivers/gpu/drm/mga/mga_ioc32.c
+++ b/drivers/gpu/drm/mga/mga_ioc32.c
@@ -1,4 +1,4 @@
-/**
+/*
  * \file mga_ioc32.c
  *
  * 32-bit ioctl compatibility routines for the MGA DRM.
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
