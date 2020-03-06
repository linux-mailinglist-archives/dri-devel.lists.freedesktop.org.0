Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A351F17B7F8
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 09:04:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B8B6EC7D;
	Fri,  6 Mar 2020 08:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38FBF6EC3A
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 00:21:18 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id np16so293289pjb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2020 16:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wJSb47iRAmacuiIgPWOL6dFUPqbDjpIVJqy0/NtA6/o=;
 b=CKYtvbCQIDRoU2urvS0iaJ8B+f6KWSMedxeRgGs2XCLSRQ7E0n0NPAy7fsx/4NWiN3
 xaaUL1ki4WjoFup6wgcUYLY+anMKStvUn25Oc7J95rrz3iO2WTCK2F93/ehzzWeFtJOP
 7U5FsNYBGY59eodEfQ81oloKD2DLpT19Zy9SQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wJSb47iRAmacuiIgPWOL6dFUPqbDjpIVJqy0/NtA6/o=;
 b=OZKnBzdZ/91AiogTV420g0inCgJ06u60SYLw+xugUHRtN3YaklGsVxjvf0yjHl4j7c
 Y3SI6WjpP3vs6CjtV/gFNH3vk8Thnqjj5T52h4ypb5lO34F1aa2GhI1m5qtKTGB8ZDf9
 3M8pvcBjTxOS2UMPjFtUy2vYvtQxuUwKEnc7LKyXh1VHe9i9Pf26JOb5FvVuDigkaOb8
 /o/P8TcUvLSayIzeXhHD3xKEYE0FoslCIkzvBxjVXr/GUGiWaerbnNrmIclVdcO0On9E
 mukGWQAazSzXULtUY0PDY4oByPPqDfS8XT+wkq+/M+8G8Eu1alkjT8EPxs0LJSJagSoF
 bf/A==
X-Gm-Message-State: ANhLgQ3rHkpaXOIwvc/U2SaRCF1hpd7NIRZHUfzmlbvD5pDMNlI6g54J
 INBP9rKnRHc1/XPkB+CJMtdhew==
X-Google-Smtp-Source: ADFU+vvmhMGHJxnqwlSNBaW/zJEwPDdnnhVY/JhYtnz8CTMEhmrOcwC0a3b957LsR4UX7PR0yEDTmw==
X-Received: by 2002:a17:90a:da03:: with SMTP id e3mr715297pjv.57.1583454077682; 
 Thu, 05 Mar 2020 16:21:17 -0800 (PST)
Received: from exogeni.mtv.corp.google.com
 ([2620:15c:202:1:5be8:f2a6:fd7b:7459])
 by smtp.gmail.com with ESMTPSA id y1sm30080225pgs.74.2020.03.05.16.21.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 16:21:16 -0800 (PST)
From: Derek Basehore <dbasehore@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v10 0/2] Panel rotation patches
Date: Thu,  5 Mar 2020 16:21:10 -0800
Message-Id: <20200306002112.255361-1-dbasehore@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 06 Mar 2020 08:03:01 +0000
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
Cc: David Airlie <airlied@linux.ie>, Derek Basehore <dbasehore@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds the plumbing for reading panel rotation from the devicetree
and sets up adding a panel property for the panel orientation on
Mediatek SoCs when a rotation is present.

v10 changes:
-Adapted to drm_panel_attach changes, so panel orientation is now set
 for the connector in get_modes
-Dropped patch that was already accepted

v9 changes:
-Changed to copying display properties from another copy of
 drm_display_info in drm_panel_attach.

v8 changes:
-added reviewed-by tags
-fixed conflict with i915 patch that recently landed
-Added additional documentation

v7 changes:
-forgot to add static inline

v6 changes:
-added enum declaration to drm_panel.h header

v5 changes:
-rebased

v4 changes:
-fixed some changes made to the i915 driver
-clarified comments on of orientation helper

v3 changes:
-changed from attach/detach callbacks to directly setting fixed panel
 values in drm_panel_attach
-removed update to Documentation
-added separate function for quirked panel orientation property init

v2 changes:
fixed build errors in i915

Derek Basehore (4):
  drm/panel: Add helper for reading DT rotation
  drm/panel: set display info in panel attach
  drm/connector: Split out orientation quirk detection
  drm/mtk: add panel orientation property

 drivers/gpu/drm/drm_connector.c    | 45 ++++++++++++++-----
 drivers/gpu/drm/drm_panel.c        | 70 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/intel_dp.c    |  4 +-
 drivers/gpu/drm/i915/vlv_dsi.c     |  5 +--
 drivers/gpu/drm/mediatek/mtk_dsi.c |  8 ++++
 include/drm/drm_connector.h        |  2 +
 include/drm/drm_panel.h            | 21 +++++++++
 7 files changed, 138 insertions(+), 17 deletions(-)

-- 
2.22.0.410.gd8fdbe21b5-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
