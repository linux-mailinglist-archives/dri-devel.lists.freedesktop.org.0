Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6C58B3C53
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 18:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F1410E139;
	Fri, 26 Apr 2024 16:03:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="00vDy1Z2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8624E10F10E
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 16:03:20 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2df9af57b5eso2671111fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 09:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714147398; x=1714752198;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9vAUdsTCR2PnKMamTrwyk474FOGzS7dCZMJ7/drYNGg=;
 b=00vDy1Z20V5W0BE5bXGSd/i63apX2pq0LLVpcP1ZuVvf+St2Y6kJ3qKZfmngd/qsPa
 O55tyx+c4OmwxnM0dqrgUoMEX3RAPdFsdLU4Fx5hnV1JP5hophnEEgi7wX0CFpw3rD7a
 sXBx4tbaAlSBVxRHf/wQDh9kwtXs0Cm59S+UMY1T40wM3uUIwarP3Vdf+QWURoLVp0Lg
 Ge426lqPf4SUwU/2FaS7EgGxVgrX49lLyKyQJvzg+Ca+YBcoGO48p6FBFyXcizMooYE7
 R9M94Q7jMmH/YR0IXfyoCWT0biF36LWC0AxemxuOx0wXYH21XOxZTzcpnGXMhsofd6bf
 lkkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714147398; x=1714752198;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9vAUdsTCR2PnKMamTrwyk474FOGzS7dCZMJ7/drYNGg=;
 b=cnYzzKtpNTHtifzooqdpuvMrMDtZLY+4ggr89ziGCt+dVGn7FyZzdmOZM8PgPxz5KA
 CGisC3Rj6rqVWrgf8eHNGu0NBMyglaloI/+YzSry8h2EnxVLkyqLLRPu1m4u9iCb1io5
 xDs5doZx8USbqavWI8st7ESM4ctxaecGMNwCmifA4LqwMazJtC9HJcK7iAiaN3NqgTkJ
 HfYKTWOYHcytGU37Ox7/ClykNqB4cgT0BTqJYHejY+p1j788cj7EXdZwJrnv5wYy396X
 zm3GLrENRzyS3AbFq9WpMuSWM4fa04AoAHNpSuiwiXANEn1dcAoocdESpmJ3mdlg9CBD
 01EA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8FFuACzTg0jk3grYWbmuatD79KuQpI+AJN07Ou2sa1r43o2sTil6D3cqIw3xKSUvxJlfiIoKTpa8wdv9KSPnFJoTWzPAQeezzdLBS9ltv
X-Gm-Message-State: AOJu0YycWv0RbRtnKJn8aOheqxY6izIZ/4pqMd+e6HddRfyeb5mTNVPZ
 C5Of/vAx7BiKArxC0b0p8nBAQxJLirgup5pY7kMW09hrZxw+2qm7dJwYBbYp1eo=
X-Google-Smtp-Source: AGHT+IFZVBNi2xUBOvk7vvZqb2k5iPH7tOf6qAZxXIoF5HheGesLAylF10j55jmXO8j3H5I/limBAw==
X-Received: by 2002:a2e:92c2:0:b0:2d7:1323:6792 with SMTP id
 k2-20020a2e92c2000000b002d713236792mr2751149ljh.43.1714147397625; 
 Fri, 26 Apr 2024 09:03:17 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1926:f73e:8b99:1c0a])
 by smtp.googlemail.com with ESMTPSA id
 p14-20020a05600c1d8e00b0041bab13cd74sm1271408wms.17.2024.04.26.09.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 09:03:17 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] drm/meson: fix hdmi auxiliary system operation without
 display
Date: Fri, 26 Apr 2024 18:02:52 +0200
Message-ID: <20240426160256.3089978-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
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

CEC and ARC should work even when HDMI is not actively used for the
display but it is not the case with Amlogic HDMI.

This is important for devices such as sound bars which may use DSI
to display a UI and HDMI for CEC/ARC. A display is not required for these
functions

This patchset fixes the problem.

Jerome Brunet (2):
  drm/meson: dw-hdmi: power up phy on device init
  drm/meson: dw-hdmi: add bandgap setting for g12

 drivers/gpu/drm/meson/meson_dw_hdmi.c | 70 ++++++++++++---------------
 1 file changed, 31 insertions(+), 39 deletions(-)

-- 
2.43.0

