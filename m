Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D1D2F83AF
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:16:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6066E4E3;
	Fri, 15 Jan 2021 18:16:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EDBC6E4D0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:16:27 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id r4so8379173wmh.5
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xb1YCvw4kaZw9lo4k2diSP0ZRuU7Xd8WppcxAl/MiDA=;
 b=uXazNko3Ye2A1AYNrjCLLq6bpwOE4mQ3fhAnSbVRy3tPzywmhYFHem+yunqZ87yneH
 s8CtKFvBmI7Fv4kX+gFnj6sm144bKSbUTSVopB6LjjLuc+F9IyhdfMRL/ldkxzbTX6ii
 ARDQ+2r+b+kRMKDqhpvG3RjtrfU+GaSZGcwOMnaxOh9zyRuyAbjk6ZFPwodt5Pzvan/a
 4sE5ZdYFPgmgjqpSgG6kntQdsVdXRIx8/IVLyOPHWHzRE82z9E8B7FWWDecj6jllHJ50
 O5qzM/Z9Bv+xVV72ain840kaDl2JAFSXhWAaAz+U6ciAzzdkyNrgZgbgK1CJ+zzRZCGd
 VF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xb1YCvw4kaZw9lo4k2diSP0ZRuU7Xd8WppcxAl/MiDA=;
 b=qqYJqzkgQ+EQsh7FIzhFkF1wcBkGfCw35M4yPF3zZ69EFccA89gH8O+pY6cpj8TAcl
 FGEPawL8BoNQf07dyBLNBm+NaVm/p/SkKoI+5/n4V78kPoAzWV7SAPM1uCatOdNiPLfr
 3FL+2msWIt0f63i4sTfgwnClq378lHwBSV82VPMp9JJaEwYHxqo3943ouoioSLTKaBZ7
 QXWd5mxh/FE7WAGl/hNCWTc9z3wzFHn6HDZ90rm5kNqacx2Kl7SIwLOrz2UjS5ogIOR1
 xurMOagFQH1XOnBbiYGeUjMDTX0+T0shtNfzlCZIPD+rTDRRwh56csB0oK08QGuwJSIZ
 O02w==
X-Gm-Message-State: AOAM532tCpIGsafJ2xr+VGXShkJ2lstkIIRq8EEyoDPwI4c1/2b05cO8
 ExvuL4eyV/jb6dp4IxuAzxm2kw==
X-Google-Smtp-Source: ABdhPJxW/+bf0aOgWlZYDE1g3TAxNc01NP5C9reyjW+xsDu0vazbM2CsWTjG8T7jj6kcJW2nFm5fZg==
X-Received: by 2002:a1c:9684:: with SMTP id y126mr10147012wmd.2.1610734585915; 
 Fri, 15 Jan 2021 10:16:25 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id b133sm14405979wme.33.2021.01.15.10.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:16:25 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 14/29] drm/gma500/cdv_intel_crt: Demote kernel-doc abuse in
 'cdv_intel_crt_detect_hotplug()'s header
Date: Fri, 15 Jan 2021 18:15:46 +0000
Message-Id: <20210115181601.3432599-15-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181601.3432599-1-lee.jones@linaro.org>
References: <20210115181601.3432599-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/gma500/cdv_intel_crt.c:138: warning: Function parameter or member 'connector' not described in 'cdv_intel_crt_detect_hotplug'
 drivers/gpu/drm/gma500/cdv_intel_crt.c:138: warning: Function parameter or member 'force' not described in 'cdv_intel_crt_detect_hotplug'

Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Eric Anholt <eric@anholt.net>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/gma500/cdv_intel_crt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_crt.c b/drivers/gpu/drm/gma500/cdv_intel_crt.c
index fc58a73ed11d6..c48c9d322dfbd 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_crt.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_crt.c
@@ -127,7 +127,7 @@ static void cdv_intel_crt_mode_set(struct drm_encoder *encoder,
 }
 
 
-/**
+/*
  * Uses CRT_HOTPLUG_EN and CRT_HOTPLUG_STAT to detect CRT presence.
  *
  * \return true if CRT is connected.
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
