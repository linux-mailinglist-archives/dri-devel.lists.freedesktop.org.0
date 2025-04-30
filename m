Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 767DEAA44AC
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 10:02:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC09110E6EC;
	Wed, 30 Apr 2025 08:02:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BGR5XjHn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1510E10E6EC
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 08:02:20 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso47475435e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 01:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746000138; x=1746604938; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5eNop9DYwAQhVzXmJiwsaAYhnwQ6MIh2/EYqFvocTWw=;
 b=BGR5XjHnyYJH8iqgXRZgfe5vVpQPKmzzCXTLLebl+WcJtUmMApUB/DPcn/H1DeaaNG
 ihSqAg64DjaupYrMvk/0bkN90ynlvpWWteYZrcFoLIXvwmIadoxxpul+mU/FpfVkNjPu
 cc25hQsp+hQ7JycjrQaYDxtkJYJxU/HV1YGGxyt75LwRcWYgj5zS5bP4ZWFwleTsxSOw
 tCZ2cwia9lk7mjFJ3jlYPVpdboK5da0QEqhYffS+TRKAHpuXxPKHX27+JEgcoXMeuCHL
 IElS5c0KRwI72QXAtSLpXn968Nu6/rTNKFO/NUAy3YwRA27Y51dRYACTPwQxVCnbZ+zb
 zJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746000138; x=1746604938;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5eNop9DYwAQhVzXmJiwsaAYhnwQ6MIh2/EYqFvocTWw=;
 b=sYxu2OPekcfCi0CQxn4rHCjV8iCHiqVpcXPj4us6BRsTep6SCML3g+capvi61eWFIZ
 xyb84BMkTuTEA0z/igVZTnIwhMnzlIR/L/tX820ZdgpSL2gHDXXXXhSrz7PyGOgtuwaF
 SeqEJpFsyk2ixxGrakSrTpHDksRy7ROmZxMvsDHOdtv+fPqyPEUM88tCHpjaQvpD6ASm
 CqAjIElN11EYRVu9YcarntwLZvdQHzWpaYL00tCHgd3jC4Zc39qMefMysifCDJLb7zA6
 +7fRUUN0oLT7gZvd4kl6RXbtdlIfhMLo7lKooRP5yADltp6xnLkwlR1vmlqUBTeLToT2
 velg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxogHOeWbwa+v+ahF2/tvTgtsidlUQdNchMOn7J1xfTMsK1wTP5vtUJowo23+9/01nfrrU0lZDYJs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzV3W5SPj4CB258imkmFh19/Fk7sYfI3xC2/TRG8v5PfYyWuUuE
 x1KmzOHH6UkwO6isrOZpDe8Aa1yccOh/YZa+tnCyosxo31W90/La2AHlRCehl9s=
X-Gm-Gg: ASbGncuc5VG4eI2MLS1ZHA6BAp/u7dRjCqgWLf0NWBaZn47MoJ6z7MyF2NHAAcpQazJ
 IXZkUkSxnBN7J6KSXWNRSRDwIPwGyr1Xj4XArIxy1rvUofmFchOGhhTYW/L95BzYbATYl2Galyw
 y11XokDCIngn9pNIOndy58D+yl7SAX4j8jUpLiGJwnGJ4UX/nIp5vh0ZJA5cl1CSHmWdjQu+OrM
 A3NkvCGq5LQTAs8NpadWbQIAINjFJVynY1usaqclFxNU2PV1h8w+73/4XC8ec//c1vXXZt+moWt
 c7fvoGo4ah22Q33DxQQGDsGHcCE2f5K/VYVdSYGIYMHDuQ==
X-Google-Smtp-Source: AGHT+IGT1Od0xFVtaHSj+oRT01S7/5XLmHwGGeR66z6gtIE6Magc/YRwfBBoRUc6co7tzsfh+2jl/A==
X-Received: by 2002:a05:600c:a4e:b0:43b:c95f:fd9 with SMTP id
 5b1f17b1804b1-441b1f30682mr18860075e9.5.1746000138541; 
 Wed, 30 Apr 2025 01:02:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-441ae3fb8fesm31939645e9.1.2025.04.30.01.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 01:02:17 -0700 (PDT)
Date: Wed, 30 Apr 2025 11:02:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 Lyude Paul <lyude@redhat.com>, Andy Yan <andy.yan@rock-chips.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Vitalii Mordan <mordan@ispras.ru>,
 Sui Jingfeng <sui.jingfeng@linux.dev>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/bridge: cdns-mhdp8546: unlock on error in
 cdns_mhdp_atomic_enable()
Message-ID: <aBHZBjiOVkI_8Shg@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

Unlock and reschedule if drm_mode_duplicate() fails.  In real life, the
drm_mode_duplicate() function does a small allocation and those never
fail in current kernels.  So this doesn't really affect runtime but
the missing unlock triggers a static checker warning.

Fixes: 935a92a1c400 ("drm: bridge: cdns-mhdp8546: Fix possible null pointer dereference")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index b431e7efd1f0..172039fbfab8 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -1984,8 +1984,10 @@ static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
 	mhdp_state = to_cdns_mhdp_bridge_state(new_state);
 
 	mhdp_state->current_mode = drm_mode_duplicate(bridge->dev, mode);
-	if (!mhdp_state->current_mode)
-		return;
+	if (!mhdp_state->current_mode) {
+		ret = -ENOMEM;
+		goto out;
+	}
 
 	drm_mode_set_name(mhdp_state->current_mode);
 
-- 
2.47.2

