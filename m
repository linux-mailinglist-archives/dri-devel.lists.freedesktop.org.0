Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A46A644DD80
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 23:02:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE3D36E941;
	Thu, 11 Nov 2021 22:02:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A784F6E486;
 Thu, 11 Nov 2021 22:02:23 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id 14so8740268ioe.2;
 Thu, 11 Nov 2021 14:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mbanz3Hfm4S/C9DnDL7HTgcmeqSrMpcM5u5NhVQnBuE=;
 b=DmXCdbRBoMWI1VYMI2YRL7P5zoc6R1p7G+fy2Hx3MJid/seCHRkz+7bbuoHcUvt6Ru
 SC2WGtzWNjxOriGj6/8Dt8wQAEe8TH9nmjiySsQzyrJrCcOaz3NMmCWeIzeLYIuHZo6M
 3RwTgvE4FEMrUG1qmnh4pk2RTbNUCwVk7G2C5M7/MtDOpYq+Jm1pqUCityV3cDWmt8vE
 mW0fx35QuyYmGiORKMD23vCRBK0sOkD+n5KrGduqOHSm3rCf1Q9VVBEvXHPnR4PS7Ky0
 pJZ/tuLKXLFECbEY+Npir6CmwXm+9eJyaPxZNzQTc2VWwR0pmBHH5Oy7oqfOGwTSAHi+
 Rfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mbanz3Hfm4S/C9DnDL7HTgcmeqSrMpcM5u5NhVQnBuE=;
 b=cpMi/Fz1Pv4yZ0Ba5FtG6So1JEMN33OnQgX2SXA3FGYPEHkYU4yi+sJ2lIkKRxh3j5
 AobyyAbXo7+OOr1ueHUgzbVLVQfd7mUhK2sMKlx//LLWTEiCrpNKeJR4a2uEh8/KgiTn
 gYfGP2662NAhozkVISYIZvDxexRJXkIlEWsiLOJeFkFv+1Oe2Rfe0CCcn31dPNdetXvI
 8E/b4uNcWtGayhdZFsBa1NASOPa5H3jPbEilpHerLgyS+ic7ts3qW4/LXs92WlyNVKTa
 rgqhCFDYtavMr2qRjAI2wcwbdmWoP2xnhGSQuj8BC8o64uBox44MIpOJFJLo1h5OQw14
 aSUg==
X-Gm-Message-State: AOAM532fyxilhxqBwi9ZZQriQ0kOCRjaN7w2dNBMewvic4BmI352r8Kb
 LjBJQg4rcYnTNZaCHkRdtug=
X-Google-Smtp-Source: ABdhPJzaxVowbpjY4Enj6gZEXCpcUzdifKZ5Ri/ujMA2V+WrooRclNivztuFNXyAwaCrp8fxJYvabw==
X-Received: by 2002:a05:6602:2a42:: with SMTP id
 k2mr6924715iov.132.1636668142992; 
 Thu, 11 Nov 2021 14:02:22 -0800 (PST)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id t5sm2612315ilp.8.2021.11.11.14.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 14:02:22 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, robdclark@gmail.com,
 sean@poorly.run, daniel.vetter@ffwll.ch, seanpaul@chromium.org,
 lyude@redhat.com, linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 mathieu.desnoyers@efficios.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v10 02/10] drm: fix doc grammar
Date: Thu, 11 Nov 2021 15:01:58 -0700
Message-Id: <20211111220206.121610-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211111220206.121610-1-jim.cromie@gmail.com>
References: <20211111220206.121610-1-jim.cromie@gmail.com>
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
Cc: quic_saipraka@quicinc.com, arnd@arndb.de, jim.cromie@gmail.com,
 catalin.marinas@arm.com, linux-arm-msm@vger.kernel.org, mingo@redhat.com,
 quic_psodagud@quicinc.com, maz@kernel.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
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

