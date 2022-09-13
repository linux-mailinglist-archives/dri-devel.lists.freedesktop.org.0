Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D78865B7C61
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 22:56:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1993E10E4ED;
	Tue, 13 Sep 2022 20:56:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa49.google.com (mail-vk1-xa49.google.com
 [IPv6:2607:f8b0:4864:20::a49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1580910E4E8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 20:56:00 +0000 (UTC)
Received: by mail-vk1-xa49.google.com with SMTP id
 y13-20020a1f320d000000b003a27b2acf97so1347889vky.23
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 13:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date; bh=uR2BlBWxNwDXVN8KePRFZ054d83TeFIdqVCYAABhYhE=;
 b=KNxgHGMC5WX5o28iqf/s0dskwm5mmsxJ0wZRSSxynx4xdtWEgEz4Flo8Cw99zS5s5s
 KAgUjuccBs2bLOd+3qcCyeG9WsVLDIBdnmLU4P4jHYoMtXT6Phl4Z4EUd4Dvui5ye1K7
 XDHlIbQoqA3IcdUsiiZKKxznchTLyYiYmaH5m2Vpp0C5T47szsZiVlY0XKyreM127+RP
 vUY8sBQZx279lJcP8CQYOAXLV3rSP1srdtBWVGET+LZpJPkv0Mg+V7WNt997ptz2QJLh
 9kDaguBL6H0iTkRLN4T0gz+ptaMbOH5YcxaupcZmV+Vox7o6ANx6jw7gZsCWJSBZ4lMQ
 ZFwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date;
 bh=uR2BlBWxNwDXVN8KePRFZ054d83TeFIdqVCYAABhYhE=;
 b=eQKcrUcWoMQbs2RsVAI3/nuIriiW9as95Umx1aGDgpmZTUmzD/9WIfvdyaASlJhYkR
 oOH9IKAwAYlQRVqneAROxvMdh1VkchHU0s6b9KFtow7kt0ne9j3rR0hmXJNSrj0ogg1J
 jv4Gc6aVddvELrp/LxumwdoDYOR32nFQ+y/kzUwabheDFT1aWYSkGA5um6T1buIm2Hb0
 BMza7NbDsPxNrhGDWxZxwkdzOnjH7ECffLyjbKHJtCV3bfjIbg6W9OGkwrNWPxrs0enc
 YMui/OoqIk73zNHbUjMr00uPzEIk+9HIx/wAW9x7z5i4n/nzMM1NBv31Wdft7BecX0Xu
 smdQ==
X-Gm-Message-State: ACgBeo1p4obgaFVozSWI3jMvKdCpZ5Xac5He7r4zlotwDtffsEJJMvgY
 7uLRqtKgZww71qu1BoLUVRJVZ32EqQ==
X-Google-Smtp-Source: AA6agR6BKp9O4/iCA7qsoXlt+ctid4gFcnrvB+lLTtzXiws1cBAzJPZ8bBFJc6NV4pZunK7Q1bkvTIRxbQ==
X-Received: from nhuck.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:39cc])
 (user=nhuck job=sendgmr) by 2002:a1f:b40a:0:b0:3a2:5af2:4750 with
 SMTP id
 d10-20020a1fb40a000000b003a25af24750mr3582947vkf.0.1663102558921; Tue, 13 Sep
 2022 13:55:58 -0700 (PDT)
Date: Tue, 13 Sep 2022 13:55:55 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220913205555.155149-1-nhuck@google.com>
Subject: [PATCH] drm/rockchip: Fix return type of cdn_dp_connector_mode_valid
From: Nathan Huckleberry <nhuck@google.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, Nathan Huckleberry <nhuck@google.com>,
 Nathan Chancellor <nathan@kernel.org>, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Dan Carpenter <error27@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The mode_valid field in drm_connector_helper_funcs is expected to be of
type:
enum drm_mode_status (* mode_valid) (struct drm_connector *connector,
				     struct drm_display_mode *mode);

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of cdn_dp_connector_mode_valid should be changed from
int to enum drm_mode_status.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 drivers/gpu/drm/rockchip/cdn-dp-core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index c204e9b95c1f..518ee13b1d6f 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -283,8 +283,9 @@ static int cdn_dp_connector_get_modes(struct drm_connector *connector)
 	return ret;
 }
 
-static int cdn_dp_connector_mode_valid(struct drm_connector *connector,
-				       struct drm_display_mode *mode)
+static enum drm_mode_status
+cdn_dp_connector_mode_valid(struct drm_connector *connector,
+			    struct drm_display_mode *mode)
 {
 	struct cdn_dp_device *dp = connector_to_dp(connector);
 	struct drm_display_info *display_info = &dp->connector.display_info;
-- 
2.37.2.789.g6183377224-goog

