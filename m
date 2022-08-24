Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1365A0318
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 22:57:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D28ACC9CA4;
	Wed, 24 Aug 2022 20:57:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 131C4B9FBA
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 16:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661357616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oSUiGfUcaLftnhFHbJ63fBQreSrudDWQdJ97QjeIClY=;
 b=gpDqDdj0ZCmTziObq+DOF4tDY+9CxahugckbrtSn80gpXEiIOLzs9rDEV56GPT5rvWs95e
 yrIaowNJKnEWy+950y+1RT6l8BZ1AHIMLoXlWXTwD75FyeFluO6pOLsPkwLlU6fO+q44+i
 OsWDWNRTB26cHiaaMnUgl74j7B0msN8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-564-FFLCDe_cNwya8vYSavLNEg-1; Wed, 24 Aug 2022 12:13:35 -0400
X-MC-Unique: FFLCDe_cNwya8vYSavLNEg-1
Received: by mail-ed1-f69.google.com with SMTP id
 w14-20020a05640234ce00b00446bb1d7cc3so6247413edc.20
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 09:13:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=oSUiGfUcaLftnhFHbJ63fBQreSrudDWQdJ97QjeIClY=;
 b=D7ekLCVR3IPFCKiwgRXctphjpthT/ko5h6i6zh+8xtNJofdbtjdnWAAfhE18WmQ/hT
 L5R77aMCHxIYYQHZGK2jhdel3ulP6yyACxzON5mKaEiz9WMZBHSj0gOqMYU3Px2gGj3P
 AIQ1mUKpHnt9lYQu4tWgEkDLN+HM/6C7b3UzUEZVj9oI1GBFw+i1BlJBl7dOMeuATyLR
 aGLupv2q4TQNU6S6mg+YplY+gAd7fny+YUl4/7ygnQN/HIppUzSLqs1cY7ypxyXyKlPY
 44O9+ctSKODT+EevdKp16pHU6FkA2eKp9r0jVUyu2TcWmE2RClrdsNrADeaEiPqWXDou
 ASeg==
X-Gm-Message-State: ACgBeo0xFnal67B674pGdpp3GDdTdvAi2lmlx9CEI7JcVua5y6+bvrXV
 K5mnccPYvR0vzlsHhQE4V+3yuSLPM5yEZ5Vbo1yIMNN/7V/qsoRx8OJbnVD0/doZTALAAcYft95
 sjNEhlpFlX8uXXJ522z1e27MAH21C
X-Received: by 2002:a17:907:7615:b0:730:e1ad:b132 with SMTP id
 jx21-20020a170907761500b00730e1adb132mr3363042ejc.744.1661357614007; 
 Wed, 24 Aug 2022 09:13:34 -0700 (PDT)
X-Google-Smtp-Source: AA6agR69EPCk9q905SAjfACG4R3hCH9I2FLwlrZOUitIQbz2LPC/YyVVwrrbmVQexaMoItcz8M5Kqg==
X-Received: by 2002:a17:907:7615:b0:730:e1ad:b132 with SMTP id
 jx21-20020a170907761500b00730e1adb132mr3363030ejc.744.1661357613817; 
 Wed, 24 Aug 2022 09:13:33 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 da12-20020a056402176c00b004478fdbe190sm791536edb.10.2022.08.24.09.13.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 09:13:32 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org
Subject: [PATCH drm-misc-next v3 0/4] Fixes for vc4 hotplug rework
Date: Wed, 24 Aug 2022 18:13:23 +0200
Message-Id: <20220824161327.330627-1-dakr@redhat.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I've found a few potential issues left after the hotplug rework.

In vc4_hdmi.c we're missing two mutex_unlock() calls when the device is
unplugged.

vc4_crtc and vc4_plane seem to miss some drm_dev_enter()/drm_dev_exit() calls
to protect against resource access after the device/driver is unbound, but the
DRM potentially isn't freed yet and userspace can still call into the driver.

Changes in v2:
  - Use drm_device pointer from struct drm_plane (Maxime)
  - Protect entire functions to increase readability (Maxime)
  - Add another patch to fix an uncovered MMIO access in vc4_hvs.c

Changes in v3:
  - vc4_plane: Actually protect entire functions to increase readability (Maxime)

Danilo Krummrich (4):
  drm/vc4: hdmi: unlock mutex when device is unplugged
  drm/vc4: plane: protect device resources after removal
  drm/vc4: crtc: protect device resources after removal
  drm/vc4: hvs: protect drm_print_regset32()

 drivers/gpu/drm/vc4/vc4_crtc.c  | 41 ++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/vc4/vc4_hdmi.c  |  7 ++++--
 drivers/gpu/drm/vc4/vc4_hvs.c   |  4 ++--
 drivers/gpu/drm/vc4/vc4_plane.c | 20 ++++++++++++++++
 4 files changed, 67 insertions(+), 5 deletions(-)


base-commit: 4d07b0bc403403438d9cf88450506240c5faf92f
-- 
2.37.2

