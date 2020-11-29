Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF802C7A76
	for <lists+dri-devel@lfdr.de>; Sun, 29 Nov 2020 19:10:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E844E6E221;
	Sun, 29 Nov 2020 18:10:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C896E221;
 Sun, 29 Nov 2020 18:10:48 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id o4so6299525pgj.0;
 Sun, 29 Nov 2020 10:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EVR6Dei8Bnt3OCxC95LBwIuM/4G2sFcsm8vaAAg9zHw=;
 b=pLbgtMYF6C4LhXbvtthI4VE4GeH7PSNJTDAReVjFExXzpHh9hosl9/odkNkV8cZcrw
 h6VVppYcTosIljKdoD3kiKU0YX/qPgzuZfq7ZcDsj8bs7QE1RJngAiyvogjZ3sr7y0yL
 xgWvv+MEQ/6UQGIrPoFDhBrqwtuGIJ1eAMWkrDMWc61qzy1vuYYyYU5tHe04T3jjSwER
 kCBH5Ygx0/uKXWSKacL1u32RRU/DL4njb62ZAE7h5iX9tSeCjugKGn0/fsV4B1G89s+a
 KMd0FnmXwMDszqCCl8iGZXB47Z6SQ6q9unAnX2/vRMolOwnjTD1W8BtTMxwimExAdjIe
 LawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EVR6Dei8Bnt3OCxC95LBwIuM/4G2sFcsm8vaAAg9zHw=;
 b=lrNmzYKEhVipFD//xuzLOS/BlUT2WpvpUGJemUMY6UJMUg5PKXm+lo1g+npDdE9gVI
 geStOKZ6WN9CEPuD6Df67LbUrFO//fJI7Byb9Ho0yX6Q5fy2KiVxtItULnYd3TuPbOmP
 185xAXcI4atd6Y32YNPVoCiSDBi3Hw6Mt9I0BD8y/fxNKGKOlMm9JETKFq0U8MvmnPL4
 c7PqVq94FiFVZoq89aVU29WKYZE4n+4z9Hkvsy3fdDNYWVOp5y9LKOrE4o/SdbSK/iK8
 788N6zpCyyuDBPJ1sJgwuN2lPFmVWv6DteTCa0gIEpzZFf9j3YgEhtjX/4tVtZCKTDuw
 MKdg==
X-Gm-Message-State: AOAM5320laBkFsMEdpWiJC0ZDk0poDStgddYheblNikinVKmk1kEbV3o
 2mGqPs36Sq7fyXPhGIxlx2AlWMOAuWM=
X-Google-Smtp-Source: ABdhPJzn7CuP2SUe4fgH+BNUk3eUTnzgiUKfmd5REq9zmWNXr/V2XilbUSU9UY5tJ6B4x0F0B4Y7rg==
X-Received: by 2002:a17:90a:5905:: with SMTP id
 k5mr21915670pji.198.1606673446893; 
 Sun, 29 Nov 2020 10:10:46 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 bf3sm5142567pjb.45.2020.11.29.10.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Nov 2020 10:10:45 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] msm/mdp5: Fix some kernel-doc warnings
Date: Sun, 29 Nov 2020 10:12:40 -0800
Message-Id: <20201129181243.1091742-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.28.0
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Lee Jones <lee.jones@linaro.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Function parameter or member 'ctl' not described in 'mdp5_ctl_set_encoder_state'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Function parameter or member 'pipeline' not described in 'mdp5_ctl_set_encoder_state'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Function parameter or member 'enabled' not described in 'mdp5_ctl_set_encoder_state'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Excess function parameter 'enable' description in 'mdp5_ctl_set_encoder_state'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function parameter or member 'ctl' not described in 'mdp5_ctl_commit'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function parameter or member 'pipeline' not described in 'mdp5_ctl_commit'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function parameter or member 'flush_mask' not described in 'mdp5_ctl_commit'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function parameter or member 'start' not described in 'mdp5_ctl_commit'

Cc: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
index 030279d7b64b..81b0c7cf954e 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
@@ -216,7 +216,9 @@ static void send_start_signal(struct mdp5_ctl *ctl)
 /**
  * mdp5_ctl_set_encoder_state() - set the encoder state
  *
- * @enable: true, when encoder is ready for data streaming; false, otherwise.
+ * @ctl:      the CTL instance
+ * @pipeline: the encoder's INTF + MIXER configuration
+ * @enabled:  true, when encoder is ready for data streaming; false, otherwise.
  *
  * Note:
  * This encoder state is needed to trigger START signal (data path kickoff).
@@ -510,6 +512,13 @@ static void fix_for_single_flush(struct mdp5_ctl *ctl, u32 *flush_mask,
 /**
  * mdp5_ctl_commit() - Register Flush
  *
+ * @ctl:        the CTL instance
+ * @pipeline:   the encoder's INTF + MIXER configuration
+ * @flush_mask: bitmask of display controller hw blocks to flush
+ * @start:      if true, immediately update flush registers and set START
+ *              bit, otherwise accumulate flush_mask bits until we are
+ *              ready to START
+ *
  * The flush register is used to indicate several registers are all
  * programmed, and are safe to update to the back copy of the double
  * buffered registers.
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
