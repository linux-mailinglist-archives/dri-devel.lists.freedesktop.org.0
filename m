Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CF2446903
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 20:27:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D746E4D4;
	Fri,  5 Nov 2021 19:27:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15BA46E45C;
 Fri,  5 Nov 2021 19:27:10 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id x9so10508901ilu.6;
 Fri, 05 Nov 2021 12:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mbanz3Hfm4S/C9DnDL7HTgcmeqSrMpcM5u5NhVQnBuE=;
 b=VHic04TFK5OIOKout+PopC1QvUa9eGR8Ssxz4/epvHw2FIXkzJS5NLtlwsy7QsSXbE
 zQWk3RBt8/qPYKGz0h2DUtvUlXBEjrLJiTq0r6VKMeduj0C/9mHCPw80u9kTOXl88P/g
 LdoQ0TtMvRfJeh0kG/loEQdebfGwEHQC/oe8OFy55izv1tRM0Rv0LggBD/+3yBSzRtl6
 unVZJe4MPeHmWyd+LmmNVNlD8IKt58sDptGkjW5npmHkbX7XmuxUi55HA1fkIljywJWh
 fLLc7DwjnrixOIB97zgHUxPgSXf+zOgAn++chCxwamCO2c7fH6N/g6adxRpmUsu8vhbw
 Dgwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mbanz3Hfm4S/C9DnDL7HTgcmeqSrMpcM5u5NhVQnBuE=;
 b=oEBSx63YxkD1KdxITvBLYGXe+pp7ZEpnJGxAyDdHdXBSRuPPU8ViZI7wUwSOObPADH
 cH/FWbUXa/N2SaBSkcoX+dEwpArVhv7DRThZnjZj5QYJ4HFquaojbC70636IlVreI2H7
 gUBOktNHzR0ubgn7CmbvUtI+6D/q1Dtl2N0eJ0JFrd+CZYD6nFcsTDmtY476wvHM8D1C
 naQdbvjh54p2t6Z2lMqLop/UyDvIaL3d8HwFY9uL12SrcBqSadEWAPaEbslP/yJ0C5pP
 OZoO+EVXt2wkBkmjDxnkdHwumH8IBvHXk3xZbOrSCmxiiB/UlGawmxa8gEOJbTpIfBvJ
 mo6A==
X-Gm-Message-State: AOAM532D1t/GGw8kmKVeLEX+9/g2P5GMlFe9OBDOFmX9htS9oass9ENa
 cZd5KUHvEh7KYSnXtwqmBPA=
X-Google-Smtp-Source: ABdhPJy5rWjxc5K+tSAKEThodmKiaGWvIID7w4CSCBvuWOIP5mup87Nn2YES3sALcBam10Ce/HM0rA==
X-Received: by 2002:a05:6e02:1561:: with SMTP id
 k1mr18658520ilu.135.1636140429420; 
 Fri, 05 Nov 2021 12:27:09 -0700 (PDT)
Received: from samwise.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id l18sm4338617iob.17.2021.11.05.12.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 12:27:09 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
 daniel.vetter@ffwll.ch, seanpaul@chromium.org, lyude@redhat.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v10 02/10] drm: fix doc grammar
Date: Fri,  5 Nov 2021 13:26:29 -0600
Message-Id: <20211105192637.2370737-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211105192637.2370737-1-jim.cromie@gmail.com>
References: <20211105192637.2370737-1-jim.cromie@gmail.com>
MIME-Version: 1.0
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
Cc: Jim Cromie <jim.cromie@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

allocates and initializes ...

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/drm/drm_drv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 0cd95953cdf5..4b29261c4537 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -486,7 +486,7 @@ void *__devm_drm_dev_alloc(struct device *parent,
  * @type: the type of the struct which contains struct &drm_device
  * @member: the name of the &drm_device within @type.
  *
- * This allocates and initialize a new DRM device. No device registration is done.
+ * This allocates and initializes a new DRM device. No device registration is done.
  * Call drm_dev_register() to advertice the device to user space and register it
  * with other core subsystems. This should be done last in the device
  * initialization sequence to make sure userspace can't access an inconsistent
-- 
2.31.1

