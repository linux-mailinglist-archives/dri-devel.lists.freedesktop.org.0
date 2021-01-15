Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 407002F83B7
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:16:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8534F6E4FB;
	Fri, 15 Jan 2021 18:16:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B97BE6E4D4
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:16:33 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id y17so10197429wrr.10
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wypu520/ZqfvAXznwR+SiEUfHGdGNRczeGZtn7BjKuI=;
 b=uklAgr3xItoJKlJFKyo5xlUgWSX86AVAJKpBlIAUHTTmJjmZdSCU3C0YIEToX62mDd
 K/q2X8OFUobZ9apHOg5lG1GBQGolXMVympwlmVmG744dMCd2dWaaFzva7ZHAC2rxe8ZT
 UYd32/gVhlXs0lrLcNrxzeaton9E3NJF68/fCh8AO+k1rR8iZlnQyaRWUplWqAmXNr75
 R1hc5DJYvgH5jtjYE09AxYlUfEodnGMkrDo21uOE+kDFnsIPEEdGk6LB0CEApsChvvW6
 AiH2mwlhtlzZXrsmBq8HiKT9MWeMVzDIZMfAkqtqASnMz40a8PRSoSG+ZdGHw377wRBE
 CaGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wypu520/ZqfvAXznwR+SiEUfHGdGNRczeGZtn7BjKuI=;
 b=P+JHu2SdxD3lrPxwrdugbc3JdBJ2xz3/a6PV+WOsWEKjSJXeBm/Yyz8W2omlXB4MlQ
 dAvsBzwVM148zOaZk2VE/cKsZkRIUu3EzkjfixfTJSeRSHFOuYB2TszN3oEFqBpDvMm4
 3467AfChz/o1x9ZHEnUXPnGTmweuUxkAMB3NnbDfA4BeOdoAbkM8GnwoytG95av0A26i
 CGTFcaxeAlbUWwAGRn7ocQEQSHIzaolgMMZua0x7ZW9YmwLwT51TbKoLgP0zabV4+eiW
 0YobW3PvcnH50nKFKCYvYnl5qRB1EKIgUIoX7F8llDe3sPhX4DP2xebOmflwq6VWDMAe
 AkWw==
X-Gm-Message-State: AOAM530HLKiO4wUEqPemRWoZVvUaLaYzGG4+SFjB51rWNRN2xduInbaY
 zYAFPHY1NvcbFEJmpOpySnq+Bg==
X-Google-Smtp-Source: ABdhPJyFfHc9cpBrLJAjZ1f8AMeApx1fDCkuNGMJmPVlsbqk/HoTtgo+IczuMWa9mDl+g0zmExLmVg==
X-Received: by 2002:a5d:4dcd:: with SMTP id f13mr14488386wru.10.1610734592374; 
 Fri, 15 Jan 2021 10:16:32 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id b133sm14405979wme.33.2021.01.15.10.16.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:16:31 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 19/29] drm/gma500/oaktrail_lvds: Demote one documentation
 header fix another
Date: Fri, 15 Jan 2021 18:15:51 +0000
Message-Id: <20210115181601.3432599-20-lee.jones@linaro.org>
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
 Jesse Barnes <jesse.barnes@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/gma500/oaktrail_lvds.c:38: warning: Function parameter or member 'dev' not described in 'oaktrail_lvds_set_power'
 drivers/gpu/drm/gma500/oaktrail_lvds.c:38: warning: Function parameter or member 'gma_encoder' not described in 'oaktrail_lvds_set_power'
 drivers/gpu/drm/gma500/oaktrail_lvds.c:38: warning: Function parameter or member 'on' not described in 'oaktrail_lvds_set_power'
 drivers/gpu/drm/gma500/oaktrail_lvds.c:291: warning: Function parameter or member 'mode_dev' not described in 'oaktrail_lvds_init'

Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Eric Anholt <eric@anholt.net>
Cc: Jesse Barnes <jesse.barnes@intel.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/gma500/oaktrail_lvds.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/oaktrail_lvds.c b/drivers/gpu/drm/gma500/oaktrail_lvds.c
index 3abaedb01afc1..432bdcc57ac9e 100644
--- a/drivers/gpu/drm/gma500/oaktrail_lvds.c
+++ b/drivers/gpu/drm/gma500/oaktrail_lvds.c
@@ -29,7 +29,7 @@
 #define MRST_BLC_MAX_PWM_REG_FREQ	    0xFFFF
 #define BRIGHTNESS_MAX_LEVEL 100
 
-/**
+/*
  * Sets the power state for the panel.
  */
 static void oaktrail_lvds_set_power(struct drm_device *dev,
@@ -282,6 +282,7 @@ static void oaktrail_lvds_get_configuration_mode(struct drm_device *dev,
 /**
  * oaktrail_lvds_init - setup LVDS connectors on this device
  * @dev: drm device
+ * @mode_dev: PSB mode device
  *
  * Create the connector, register the LVDS DDC bus, and try to figure out what
  * modes we can display on the LVDS panel (if present).
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
