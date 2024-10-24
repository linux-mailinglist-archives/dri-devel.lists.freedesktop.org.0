Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B73B9ADBD2
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 08:14:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D2BD10E8B0;
	Thu, 24 Oct 2024 06:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="4K73Q4Kx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com
 [209.85.128.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DECF410E8B0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 06:14:06 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id
 00721157ae682-6e376aa4586so10678887b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 23:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1729750446; x=1730355246;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=RirtA7EgN4fQOOKugcSYCvUnz6k6FXA4tnIv667SP2U=;
 b=4K73Q4KxiNenV+nB4z4ga/3/8hUvtDbe7p94/AiSrBWpfKwKw0V2FEMXDISc5vLXBP
 pelvMsZUvDtMjWQRiTMEvE5RUgYJZhvd+UegcvDtZRSmwmcHfcuRduH9wKtjzmeP6PQI
 wGFS57i0V4bh9B6heo/8UbaI33NJCLntHfMSYTz6/r+KigtScVxNqlW/9ZTjMuTNLB0O
 1080eBiZGxxx++P54fhyUpSldUl0I/4lJE5MCbR5z+9tqePZXuCakAahLNtmLcU9U4Oq
 CR+Z0NJkPc5ygJOEe54W5E7jXHZSWHZ7wZQk2U8mlbH/ApZcVP2X/xwfHTZKnFVDX909
 1Mqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729750446; x=1730355246;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RirtA7EgN4fQOOKugcSYCvUnz6k6FXA4tnIv667SP2U=;
 b=shPFOLGr0zsFSujFv/0c7xAAVtLh5+LgN6aNagU05ebT4dZ5k/favuV72XxasN5J4e
 Hwvyaw6AqzYVlv1MyEF5LGJce6Q+AMdbGFPJ68e4RW/ZT+zvlHNjLmkVdwjlvkQTALyx
 LY9kkXlswSzISOAHKITQwJphc84N/lrCll/uqLq4ZrQppXKW6EK1RFPsxXlb55iygJlN
 mnppPxBA5kIsjOpL4/9Pl2riCYsgfK5ZG1ka3/94P9DJ4QB6ichHluwzKv/c7voYPFUV
 lelAIqT77jFhGSm1UMQLK9Q3eg8ReIR8m8m+0bN0nxomfdv/CQPmWiKUs3OtKWTsRUS9
 bACg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9ZXfdM3ywqxkwGt+hJ8Un0VeWWZO7DtXLXiq73s4Yqz8z6cHzbdsE+l2iUXEVMr6MwnGRKIB0tkg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFTxspKpjjafqReC++iLCU/3P59cYcVYsJh7cADZXSKwncWGE1
 QfjuNnxfHS4WTiYBru6fGTdsClJGDE93jqcnsksJG6thg5PMztsCmqJkxjCatEZFZh0C4HTLEJE
 8aCdkeKQMawRsVg==
X-Google-Smtp-Source: AGHT+IEJXaAAeZpuDAkTsefFXLL2kex4B2AlfwjdclQcvPn636A6m5nX8BurNhgR4ykV7U+QaaWd5sb2nHuey3k=
X-Received: from saravanak.san.corp.google.com
 ([2620:15c:2d:3:965e:f81d:c9fb:b352])
 (user=saravanak job=sendgmr) by 2002:a05:690c:3749:b0:6e2:4b3:ee22 with SMTP
 id 00721157ae682-6e866359b6fmr171667b3.6.1729750445961; Wed, 23 Oct 2024
 23:14:05 -0700 (PDT)
Date: Wed, 23 Oct 2024 23:13:44 -0700
In-Reply-To: <20241024061347.1771063-1-saravanak@google.com>
Message-Id: <20241024061347.1771063-4-saravanak@google.com>
Mime-Version: 1.0
References: <20241024061347.1771063-1-saravanak@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Subject: [PATCH 3/3] drivers: core: fw_devlink: Make the error message a bit
 more useful
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

It would make it easier to debugs issues similar to the ones
reported[1][2] recently where some devices didn't have the fwnode set.

[1] - https://lore.kernel.org/all/7b995947-4540-4b17-872e-e107adca4598@notapiano/
[2] - https://lore.kernel.org/all/20240910130019.35081-1-jonathanh@nvidia.com/

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/base/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index a4c853411a6b..3b13fed1c3e3 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2181,8 +2181,8 @@ static int fw_devlink_create_devlink(struct device *con,
 		}
 
 		if (con != sup_dev && !device_link_add(con, sup_dev, flags)) {
-			dev_err(con, "Failed to create device link (0x%x) with %s\n",
-				flags, dev_name(sup_dev));
+			dev_err(con, "Failed to create device link (0x%x) with supplier %s for %pfwf\n",
+				flags, dev_name(sup_dev), link->consumer);
 			ret = -EINVAL;
 		}
 
-- 
2.47.0.105.g07ac214952-goog

