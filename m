Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F08483F843D
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 11:13:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3DAC6E573;
	Thu, 26 Aug 2021 09:13:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC8D6E573
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 09:13:50 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id d26so3997530wrc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 02:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LheJq9C51RQ5DWB1Tf2hPqzaPi3xdJvxhj11oVFW+lg=;
 b=Zf5OIRF9/TmyBjplaz9MxvYQIdkgnvf7MtJWhFj3U4DxdaZe52FP/rpaCa+X/zhww/
 GAxRNpu8FgCdRNwY0Yfo828xnw1TD6EHXup4Bqho9K7MK0NsS9KjlpPEZoDtcrZAwuue
 blfPq4masva3VxxY0qH0n++VVXYBmFX5VD6VE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LheJq9C51RQ5DWB1Tf2hPqzaPi3xdJvxhj11oVFW+lg=;
 b=QmyGEzk3DbP08HHVq2fZNa03YeUo58yV0JIkAUCgWEPkDjySbQ/ELgkP8vBNy9kOpq
 yL8aq871qJtTRWjnZhdBRBB5lyCc7TUWlc9zjYMIBIl7v58kV6JwM0WflGo/6/QX2fYw
 zToEeUervFqie6hgYHmeiwYuLcgdsalhEEOWIPgEjr7MCIbBZYK0frSVDF6ifBY5G4Nq
 7GTT9hEkDxFJgv1Vzjj2nT4aYR4YXa+HBxtnkMlnVtrnThqU0b7F1DnMQ7ivO99FMMR8
 lTd3QQI88pDqlQFf4bDQa4xlVrZRUlu99E0BDWWMZUfKTF87ZsAVbeVCDwUk53V48ANl
 NRuA==
X-Gm-Message-State: AOAM5333gorFD/nOk/ter46gd/adB95zmdUPKIOqChq/WqhkkEmneAaH
 20alkBNx/UV3eowZ+j9Q3XFkh4hI5MMBtQ==
X-Google-Smtp-Source: ABdhPJwBwXOa9q2M+caTrLd8CrrQjpc3NJ0hbf/XOSIVErz9DzgYIndPCJz9FnAwnPEoIc2tnjqshw==
X-Received: by 2002:adf:f646:: with SMTP id x6mr2706080wrp.0.1629969228810;
 Thu, 26 Aug 2021 02:13:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n10sm2411570wrw.76.2021.08.26.02.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 02:13:48 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH] MAINTAINERS: Add dri-devel for component.[hc]
Date: Thu, 26 Aug 2021 11:13:43 +0200
Message-Id: <20210826091343.1039763-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dri-devel is the main user, and somehow there's been the assumption
that component stuff is unmaintained.

References: https://lore.kernel.org/dri-devel/CAAEAJfDWOzCJxZFNtxeT7Cvr2pWbYrfz-YnA81sVNs-rM=8n4Q@mail.gmail.com/
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ac58d0032abd..7cdc19815ec4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5707,6 +5707,11 @@ F:	Documentation/admin-guide/blockdev/
 F:	drivers/block/drbd/
 F:	lib/lru_cache.c
 
+DRIVER COMPONENT FRAMEWORK
+L:	dri-devel@lists.freedesktop.org
+F:	drivers/base/component.c
+F:	include/linux/component.h
+
 DRIVER CORE, KOBJECTS, DEBUGFS AND SYSFS
 M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 R:	"Rafael J. Wysocki" <rafael@kernel.org>
-- 
2.32.0

