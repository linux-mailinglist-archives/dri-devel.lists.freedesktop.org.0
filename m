Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A18AC2F836F
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:14:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0286E488;
	Fri, 15 Jan 2021 18:13:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E726E47E
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:13:42 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id 7so2966410wrz.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fYtw8GzoU8Bqr/iSnXTLs/UzdpcC7+8OaiBwfsZ40Oc=;
 b=U8irOcupICW0AmAfXBUsHfVL2wyDZgSXZaObAH//1x1fRMn1cg1To4KbPNc5oTas1c
 apyd8AV8gA6lEiNxVwlntq8O/K6LORf9JQhFMZ18wqw2aYzxYeHPD69K5vZ7lLX3pWf3
 9KrGDXnG8CKL/7C0pIiBtaML3+s/HHkifHwl3ZCSwnQLeqXuU+k/A6BrZmP7BUWf9iJx
 Gw0bof7iS/mi53tvZmrFuhxB8rPE8DwM3m3P325uwrmUYMF2vXLq+3QZZU5kEN74w9bT
 zL7O8AojKXlr0DS1tU3U5WOy4IU/UJizeFIaJWuvtY0Ls/UrPhlKLFZ13UOquviqGxem
 JuOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fYtw8GzoU8Bqr/iSnXTLs/UzdpcC7+8OaiBwfsZ40Oc=;
 b=Sts9IY7HjVyT2nAqguq4PiK8zK8h9MHL0pd9BJLpNg6WjuSaE4zVgglgemNFOxhiTI
 y80ty6fiSMZZ6b+iEkUSJ6NFJkdINqyFJ7FAmUJxXhoZo2b14VPI4PVISN5rRCNy7pcJ
 2/PnXkp11fxzKlc4+ooqTWt5S7UgrSy8Pw2ZrIasCp+IAl5eJqwuDw1GRKAdHU/Wqn3O
 UNN3yQc+OPHXfp/WmTxh1xBwL7BEQH9TuhdQHEZAOk0Ow0Ju9iiKexnURYzv/R1DXj5d
 /AJpMWSL9QNIVE21Ec3BVnTqVkGivE6cAy+imBZ8Otam9m/LYaCiPci/sKN7FqRx4ShU
 yIVA==
X-Gm-Message-State: AOAM533sAYnT/dFvOj6hI9lCwMC8A7OziQcNQpc2hQ+ppxPov1A8G8yQ
 hfTRQa2C2n1UUgzsi4emaWdEJQ==
X-Google-Smtp-Source: ABdhPJzOfZs8jm74WsjZlxRA+7WSux0MsT67QoSS9lraOoJ6f+Z54JPLseMY3Fajw43W4AUhQrbFDA==
X-Received: by 2002:adf:c444:: with SMTP id a4mr10946428wrg.164.1610734421283; 
 Fri, 15 Jan 2021 10:13:41 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id j2sm16123484wrh.78.2021.01.15.10.13.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:13:40 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 16/40] drm/gma500/intel_bios: Demote non-conformant kernel-doc
 header
Date: Fri, 15 Jan 2021 18:12:49 +0000
Message-Id: <20210115181313.3431493-17-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/gma500/intel_bios.c:581: warning: Function parameter or member 'dev' not described in 'psb_intel_destroy_bios'

Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Eric Anholt <eric@anholt.net>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/gma500/intel_bios.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/intel_bios.c b/drivers/gpu/drm/gma500/intel_bios.c
index a3b843316f4e5..d838369f01194 100644
--- a/drivers/gpu/drm/gma500/intel_bios.c
+++ b/drivers/gpu/drm/gma500/intel_bios.c
@@ -574,7 +574,7 @@ int psb_intel_init_bios(struct drm_device *dev)
 	return 0;
 }
 
-/**
+/*
  * Destroy and free VBT data
  */
 void psb_intel_destroy_bios(struct drm_device *dev)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
