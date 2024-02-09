Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2897A84FA32
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 17:54:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1382610F796;
	Fri,  9 Feb 2024 16:54:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A3C10F796
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 16:54:25 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-40fe03cd1caso10803325e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Feb 2024 08:54:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707497663; x=1708102463;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gaeS1h5VpNcLueh2QkyDz5epDwwi2WqLNLn06Yy2Ju0=;
 b=pQyF93zAUzAefvQIE45IJ/BgYV2eWwUjec2OSBt1P1XcRsWTjPQRaZPhUjf9QqulzQ
 gBx1xhqTypVpQEct0el+bUyF9UnyC7zGWBraLR2L10elh/f9e5CxGYraMjPxPBqC7HIL
 JKfszTE32s+mxyCeJTH2j/RFrXvKI52BPvAtNd4RISAboA25DIBUy/92dau46FiGRX9d
 fgz19ec+dZDyMDJ9OESXtVKbIJX+IHxLHaHp6RpeVn/Rw3ev3Rg5sBTgrFU8BmDZ7XHD
 PGYZY8wmLasDZecxCFzP6UFex6me75I98dzXATm+ZSBYGmKNOC14uu3rsaT+CAUg4MNs
 eGHA==
X-Gm-Message-State: AOJu0YwnWwDEPdTAdxVIjpaA7UJTVzVsBiHoOnmGTiP7PzAzpUNkLhyJ
 LGHpp/Q46kQXdKXH3y0YznVTyfVmvg7WGDbUaI/F/amkdr2hA8zA49SJeTwxfC4=
X-Google-Smtp-Source: AGHT+IFFQBdbLfWayHTU8Eyq8ZvAud7LXc4qcTBXSQ4DrOkj/epQ1OHads3NQ5CmHYF2BrxQlm76xw==
X-Received: by 2002:a5d:4d8e:0:b0:33b:64c6:f9ae with SMTP id
 b14-20020a5d4d8e000000b0033b64c6f9aemr1367869wru.47.1707497663119; 
 Fri, 09 Feb 2024 08:54:23 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWBQE4LWBDwbGnoMAWhtz7+4QsEtFEepTMSYVpdz+rG6ssDqSAx4tr0B1oD6jHW94j0Rvk+BktbilfxzdtLg6lfG1DQgyCmHtEU+6s6wlmemq+4Cvq0f+rGhIaDrIVNhDOZmPfNzGGdX65kayUqj2g6mdI=
Received: from Xavers-PC.fritz.box ([2a04:7d84:aacb:b490:2982:f457:3c53:d3fd])
 by smtp.gmail.com with ESMTPSA id
 bp12-20020a5d5a8c000000b0033b4341eb78sm2315607wrb.1.2024.02.09.08.54.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 08:54:22 -0800 (PST)
From: Xaver Hugl <xaver.hugl@kde.org>
To: dri-devel@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, contact@emersion.fr,
 sebastian.wick@redhat.com, Xaver Hugl <xaver.hugl@kde.org>
Subject: [PATCH] drm: document userspace expectations around the Colorspace
 connector property
Date: Fri,  9 Feb 2024 17:53:07 +0100
Message-ID: <20240209165307.29856-1-xaver.hugl@kde.org>
X-Mailer: git-send-email 2.43.0
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

Signed-off-by: Xaver Hugl <xaver.hugl@kde.org>
---
 drivers/gpu/drm/drm_connector.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index b0516505f7ae..01e13984629b 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2158,6 +2158,14 @@ EXPORT_SYMBOL(drm_mode_create_aspect_ratio_property);
  *     one supported. Sink supported colorspaces should be retrieved by
  *     userspace from EDID and driver will not explicitly expose them.
  *
+ *     As userspace can't currently know whether or not the output is using
+ *     RGB or YCC signalling, the driver must translate properties to their
+ *     relevant RGB or YCC counterparts, depending on the actually used
+ *     signalling. Property values that are only valid for either YCC or RGB
+ *     and have no equivalent for the other signalling type must not be
+ *     exposed as supported, unless the driver can guarantee it never uses
+ *     the signalling that doesn't match the property.
+ *
  *     Basically the expectation from userspace is:
  *      - Set up CRTC DEGAMMA/CTM/GAMMA to convert to some sink
  *        colorspace
-- 
2.43.0

