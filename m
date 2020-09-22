Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 473C32752AC
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 09:54:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6466B6E8ED;
	Wed, 23 Sep 2020 07:54:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D4089E5B
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 20:31:23 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id a17so18496374wrn.6
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 13:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gX9IO5DpX0Oyo76FoBWgDaUccVLtvB5CmzQwxpomYMM=;
 b=tt/TTqjBTAhlSNEh4MlThxkbFeRZUCiSrVESk7ywxFuTyDJlPV+VVfUAOQ5TxQ4geg
 8DfNWex5LRrLWnOtib/RrzFLWhC6o3xrfK+CagvnIV775bH8fbId27Gwxfnuql9ZGZJC
 X6TmSBmIrMXZ+oyJOSagw5XlubJRQyelk+afU9dTrVq0jZAP0n4kyU63cutP5JZ+WWBC
 PNeLyQGQOkRgh97g6CkFyyV4gGc2FZ45niJgVXVvK74UjZ5qWSdq5Y4IErcLzZv7Shnc
 G1/36aV1B7DfTlEWdXRYrrwUNt45+4M7Ya1LxkJZKRnG58OFucQQQGMvqI6yPXDK7d9H
 UwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gX9IO5DpX0Oyo76FoBWgDaUccVLtvB5CmzQwxpomYMM=;
 b=mzFPWzZb7kJYaxtIuTD6zhoXMo7cSaIJV9pTwVkIy0fBvIOMov3eQ1ynqAwp7cfzVE
 GaBKL3fN+qwoR4zzJjrpnQJwrNFwYaXkveRYRJZyjVRfTIQgz+UxeN04iGLpIPS1ukpE
 Wh4QaJhjv2RHrNSQC1e+TvP4PwiKjUgBFer+gOfjsZaBxruMK08rnEHlysz3be/w8Is/
 kuRcDYGR18cUmtZb5tIXEEn7skN0OQHbGLMhuK0geLrAPw6timEIUpMEAgHB9oqaG9Nx
 5YqrZHMbcGRiL8TarDBwFeZBmIhbhRpHEqdAkvcsyeswIoSRMkkrnCjluZJT9wmzM7MR
 A73A==
X-Gm-Message-State: AOAM533WtWOLqCs1sn0rp8VBEVRxPx6D9Qmt+7wsExQ5KZ3o7i1GVBlS
 RZgIVX2BE73we6BDxjrFD6M=
X-Google-Smtp-Source: ABdhPJxF/lNJUJgqdUMQqKW7wBh4mAI8AHazZHk84HLlPru3YnyKcMGQb3qKQu8Jti8TIFS4nnVxDg==
X-Received: by 2002:adf:ec92:: with SMTP id z18mr7741204wrn.53.1600806681913; 
 Tue, 22 Sep 2020 13:31:21 -0700 (PDT)
Received: from localhost.localdomain ([170.253.46.69])
 by smtp.gmail.com with ESMTPSA id r14sm27256849wrn.56.2020.09.22.13.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 13:31:20 -0700 (PDT)
From: Vicente Bergas <vicencb@gmail.com>
To: Doug Anderson <dianders@chromium.org>, crj <algea.cao@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Subject: [PATCH v2 0/3] drm: rockchip: hdmi: enable higher resolutions than FHD
Date: Tue, 22 Sep 2020 22:31:04 +0200
Message-Id: <20200922203107.2932-1-vicencb@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 23 Sep 2020 07:53:20 +0000
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
Cc: Vicente Bergas <vicencb@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series enable a QHD HDMI monitor to work at native resolution.
Tested on a Sapphire board with RK3399 connected to a Q27q-10 monitor at 2560x1440@60

Changes since v1:
Use alternative clock rounding code proposed by Doug Anderson

Vicente Bergas (3):
  drm: rockchip: hdmi: fix clock rounding code
  drm: rockchip: hdmi: allow any clock that is within the range
  drm: rockchip: hdmi: add higher pixel clock frequencies

 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 8 +++++++-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 7 ++-----
 2 files changed, 9 insertions(+), 6 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
