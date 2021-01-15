Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F90D2F835F
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:13:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B846E0CA;
	Fri, 15 Jan 2021 18:13:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE416E0CA
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:13:19 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id a12so10177822wrv.8
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i/V01bC2aUdNKYNoe3MIVez12Kd/PhheE7jFqPPyQbE=;
 b=tdtp5zVrXSZ9xCEWq4wDPWmDszIKiusvcCkT6+xOPlHugBuesmhOgr3x1e4Z1OvImt
 YBwqb6DRNCPOoNnezFV4nQx8TcVWfiHyn1lz8M4xrPH4DJi5oPAofFeKZcXTlbkFMiYC
 uiVEGcGwGl2hIiDmeJ1sB2lVCBzc5Yi12NMoCTclsFDsYOwl3ulgHNosfoEeFZtm4Ept
 TK4A8V+lCzJV4yhbrKF3ikkh+h3v2S370L1myjRFFVbW1/TKrLROLVRXtwlkevNxDDLK
 VonyoP1VxEhoJbflJ3z5jzdRX9JPjqbg5KlCZ0aBbZTT6bSh50NemXefSKW21TW3Fig1
 8leg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i/V01bC2aUdNKYNoe3MIVez12Kd/PhheE7jFqPPyQbE=;
 b=Ld42egukPmZAZC8VWylXnaV/WIFIsIuwsmIHWMbA44I43gemnTPZYw4RCR6ZPijW3a
 NM3tJahcc6JCZUxSb3KFR0zf7f3swVx94Ik4q8hpNGqyOPJbOi026Z0VaMWD6hYBLuKl
 mDu/HiubVtA5kU/htD1wQfcDhxX/I1qNDeSHZ9+RxM0iNZk3PrZXKO2xqFekq3+b7Gq8
 zHS5VbqcOiyLCbrtgxOOY4N1bT5ZdqtavvKgps0j4hQPCdflM/Cs+SSkL0c+9ZbIYE9W
 QEeX7oR0+jhpo3kbC9VFt8NSgJJ0R4w//XurScaDJnlDK3QuVL/nTXurusDBnVyGnHay
 47cw==
X-Gm-Message-State: AOAM53189arNUrEuKyB8tlJ0HjH4DFBBQkJTr0TDF94n8BM2uSJBoO5c
 MxFZIgIzKRWlaG2nE8PBu9oGaWjtBeQiBg8N
X-Google-Smtp-Source: ABdhPJz8O7H223OuzeVo01mBK9mVPgrtOxBxrFaN8ZeUyDOApOAOrP68CCOYVdTVyzjFpfZ3U0kzcg==
X-Received: by 2002:a5d:4307:: with SMTP id h7mr14649674wrq.353.1610734397874; 
 Fri, 15 Jan 2021 10:13:17 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id j2sm16123484wrh.78.2021.01.15.10.13.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:13:17 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 01/40] drm/r128/r128_ioc32: Document headers do not make good
 kernel-doc candidates
Date: Fri, 15 Jan 2021 18:12:34 +0000
Message-Id: <20210115181313.3431493-2-lee.jones@linaro.org>
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

 drivers/gpu/drm/r128/r128_ioc32.c:2: warning: Cannot understand  * file r128_ioc32.c

Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/r128/r128_ioc32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/r128/r128_ioc32.c b/drivers/gpu/drm/r128/r128_ioc32.c
index 6ac71755c22dd..187bdc435cb54 100644
--- a/drivers/gpu/drm/r128/r128_ioc32.c
+++ b/drivers/gpu/drm/r128/r128_ioc32.c
@@ -1,4 +1,4 @@
-/**
+/*
  * \file r128_ioc32.c
  *
  * 32-bit ioctl compatibility routines for the R128 DRM.
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
