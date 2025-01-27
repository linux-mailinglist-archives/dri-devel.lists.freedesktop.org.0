Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A67A1CF87
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 02:57:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B0410E0E8;
	Mon, 27 Jan 2025 01:46:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="YrVlz9Mh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB7210E0E8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 01:46:13 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-21636268e43so84205365ad.2
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 17:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1737942373; x=1738547173; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5RsY0FJYh8Mg72JGIAX2jOiKQUfY87RZcqUfL58/Txk=;
 b=YrVlz9Mhd6HWQDtotlzU8hIc0rNeBJppwhI9tlphVCo2kyPZjSFtsNtkfslNa1/54R
 0TQpkNYjdSAmgs9jRCdPZCln4aI/T1/Av3CWNGoXvA7FMiWw0QIp4tRTQuHGlzI2rA2M
 B0lbHY6FHwYCLJ/J9toJQ3qQxc7RymWIlzR/cD1Z33WBFH5b9VR01yKRc7tUTT+KfPoy
 MsKMEIMoYg9MCflBxXWjsWIrSxncJVDKQMq/QtqP0wI8LGdZIXhCuoD7qnMzuxeabz0j
 3lIJ0Z6wAixtS7usurNd/Vj2vcmJ5QdH/QRTa9fRIZuYvPFTNisVfIf+2w1yLA44zqeS
 Fa7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737942373; x=1738547173;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5RsY0FJYh8Mg72JGIAX2jOiKQUfY87RZcqUfL58/Txk=;
 b=dePh5FqGTCzne7thryqe/ZBpuKG7wkw6KCNFeDyaUMkzRPggIN8+/s0tvp0s1JXkIo
 3rFliBwx+ZQLdhqCThLvT/vKqAmqjI9+uRqfJ57IVOfctOFHqt/cK0fBYZ1EslipLims
 kz6ZXtNzOolowmt/anGQSmLT/li21FaMhSYDVrAzvly0CaI+6knf0Q6nJti7tIWqM1fW
 urTRsnLdnl4N5zHgU785MDOuAf5QH93CC8+60Hr3xJPuaTYNZQAiwYkeY+QZoMIRU87I
 piqCorl9CL6yXjtBw0HdvCWe5eCzjLyBR46piXZf7ykOIVWxXkgYUyZu3LKVL+2U4HHx
 6i+g==
X-Gm-Message-State: AOJu0Yxxq9Pp4DY1dq4g9du5g9OP4Q2ZjbdQGBBKE1oqmhsmBvOMewfu
 afPtNTW+skvHTW9sOMbN8OYwd/nqv0qNjcC021L7YUgelL1NxyVVOrQL2nl3SEQ=
X-Gm-Gg: ASbGncsmbOmyKmCsgbvpUHFgnpYe7qmfsS39QbNJfj2KcvFTgkZKsnBPbGc0+wXJdvZ
 6PvdpbWyb1MzqUwhHV+ZAPxKpcxaia/dX6sHeK0cgaqMZMD0ue+KZGwLzw/MV1q8X9+YAu91muS
 u9ctSmu7OEB424eTSiVtR64GVeGMLIu95RfBdasoeIRs/sxq3+10evvLtiJatbVrfPr+YX8Tlrv
 e+QcAwrtDGDDpohsXv7jgG9hj5XWj+fZLeQnqBHitSL5Q0pK7TpcfPXDy9cAqsNNvko5HeILnGc
 4EjAqeKXXi5//Y//StyhIyMhGshsU/xrk75nIE591NhLMFLx3Crk
X-Google-Smtp-Source: AGHT+IEOPRBz6WQ4EitH6B7+CmA6sNE5X/hbPdALVt58bY7uN7m2ozrloc6Kvy4FEt2HJB5mXkDBZg==
X-Received: by 2002:a17:903:41c3:b0:215:4f3b:cb20 with SMTP id
 d9443c01a7336-21c3554b37emr589252295ad.23.1737942373083; 
 Sun, 26 Jan 2025 17:46:13 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21da4141f93sm51344205ad.147.2025.01.26.17.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 17:46:12 -0800 (PST)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v1 0/2] support for csot-pna957qt1-1 MIPI-DSI panel
Date: Mon, 27 Jan 2025 09:46:03 +0800
Message-Id: <20250127014605.1862287-1-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
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

The csot-pna957qt1-1 panel uses HX83102 IC, so add the compatible to
the hx83102 binding files and add this panel to panel-himax-hx83102.c.

Langyan Ye (2):
  dt-bindings: display: panel: Add compatible for CSOT PNA957QT1-1
  drm/panel: panel-himax-hx83102: support for csot-pna957qt1-1 MIPI-DSI
    panel

 .../bindings/display/panel/himax,hx83102.yaml |   2 +
 drivers/gpu/drm/panel/panel-himax-hx83102.c   | 123 ++++++++++++++++++
 2 files changed, 125 insertions(+)

-- 
2.34.1

