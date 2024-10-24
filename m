Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FF09ADBD0
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 08:14:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D037310E8AD;
	Thu, 24 Oct 2024 06:14:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Bq2PjO9c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com
 [209.85.128.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F20610E8AD
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 06:14:01 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id
 00721157ae682-6e59dc7df64so7436197b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 23:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1729750441; x=1730355241;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:references
 :mime-version:message-id:in-reply-to:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pXMUNc/LORv2j86/u57jzQlk6FOM7Zoz5+8UmtPcmgU=;
 b=Bq2PjO9cjUx5A6dfWyYLUf3VZN+iMJ59VMcwegEKR7LGUwAfRGNRxC+gx5kQf9o90n
 PLXJUAWNAdO966A9j1IN2E19FYQchoLXTKKHtnTn9zI9kqKBl6/Y864wB+JLQISYZ9hS
 RK9YYohq/f0e7Vs0nSUKR927n7mDR6cueRG7aXkzZotBg2VAplpi0zIf15WQI8o4mV/L
 9YaJPXW7tSJcNR3VnMyEHS/x17NB3ZGb96FZJd4ZpXGhL5e72X2J5hVEvBc/U4oig7T0
 dp7812a8Xp73ovJna7JxcX8+06+gojstwCXNy/E3wv7YEGYH06Jp9BlZO8aymtjXKWSx
 aI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729750441; x=1730355241;
 h=content-transfer-encoding:cc:to:from:subject:references
 :mime-version:message-id:in-reply-to:date:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=pXMUNc/LORv2j86/u57jzQlk6FOM7Zoz5+8UmtPcmgU=;
 b=e2oinT+v4qwtliUbPxXP6fed9rG4yZx0q4O+2E+oDsUpHR5PeHsY3rJyFm6lCXFCVl
 jxRnvK7XWLERSSWLXYHADU003vABiPm/bf0tf9OZ5InlB1fcyzpiYjaTbTPKz3EWy80m
 6FDyC1j2SlYgVJFb9ZARwdiCVOjpNeu0AptVd9rZETMNIoIe2HMc7G4fdOxyBbQRpPDn
 zvBXGc4sM6BGrlG4/KH2xGyoO7fgHW8NeP4+ZaTE6/c+er49KQWtLlMf9z60hZUawpeD
 /Wj7iY4DQO5G0a5DU11GakpPVy1tubays8haF5jmuLIrzJtDHSTIio8OYGVQG4q0Yq2z
 RETA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfvB+Ri5cJoirurMbiRMWMddCd5m2C1J6O6SMoG7z2Jqc0Jf7VDHVJwzWMU24dvhQeDVp6tSYcDDs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLhI80XvRQvjpWaJ1v0JcL/FpMrQ+XxW6Sp6irbofduXrnGR4A
 y9xGpdXaeBj2g5kkhFVHKOr9DTYIob3UHiapI+wWuWcwlOT7+z3guWWWKjRPjO4rpsAI/WQ495X
 76pfrQ4VJZlOiaw==
X-Google-Smtp-Source: AGHT+IEvWKI797qzaVIyJQytUKUTuDrxqDTilc69F1bH77+J3k5wYMBvLRY6cYuzVgsPwwCo2eftygSjpmQuXoI=
X-Received: from saravanak.san.corp.google.com
 ([2620:15c:2d:3:965e:f81d:c9fb:b352])
 (user=saravanak job=sendgmr) by 2002:a05:690c:9c06:b0:6e3:c4cb:689b with SMTP
 id 00721157ae682-6e866350bbfmr483267b3.4.1729750440665; Wed, 23 Oct 2024
 23:14:00 -0700 (PDT)
Date: Wed, 23 Oct 2024 23:13:43 -0700
In-Reply-To: <20241024061347.1771063-1-saravanak@google.com>
Message-Id: <20241024061347.1771063-3-saravanak@google.com>
Mime-Version: 1.0
References: <20241024061347.1771063-1-saravanak@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Subject: [PATCH 2/3] phy: tegra: xusb: Set fwnode for xusb port devices
From: Saravana Kannan <saravanak@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 JC Kuo <jckuo@nvidia.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Saravana Kannan <saravanak@google.com>, 
 "=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?="
 <nfraprado@collabora.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

fwnode needs to be set for a device for fw_devlink to be able to
track/enforce its dependencies correctly. Without this, you'll see error
messages like this when the supplier has probed and tries to make sure
all its fwnode consumers are linked to it using device links:

tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180) with=
 1-0008

Reported-by: Jon Hunter <jonathanh@nvidia.com>
Closes: https://lore.kernel.org/all/20240910130019.35081-1-jonathanh@nvidia=
.com/
Tested-by: Jon Hunter <jonathanh@nvidia.com>
Suggested-by: "N=C3=ADcolas F. R. A. Prado" <nfraprado@collabora.com>
Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/phy/tegra/xusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index cfdb54b6070a..0a2096085971 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -543,7 +543,7 @@ static int tegra_xusb_port_init(struct tegra_xusb_port =
*port,
=20
 	device_initialize(&port->dev);
 	port->dev.type =3D &tegra_xusb_port_type;
-	port->dev.of_node =3D of_node_get(np);
+	device_set_node(&port->dev, of_fwnode_handle(of_node_get(np)));
 	port->dev.parent =3D padctl->dev;
=20
 	err =3D dev_set_name(&port->dev, "%s-%u", name, index);
--=20
2.47.0.105.g07ac214952-goog

