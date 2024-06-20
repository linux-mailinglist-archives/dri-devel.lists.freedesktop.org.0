Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEF9910A64
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 17:47:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2B8210EA7B;
	Thu, 20 Jun 2024 15:46:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="IWO3d5JT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f100.google.com (mail-wm1-f100.google.com
 [209.85.128.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DCDF10EA82
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 15:46:45 +0000 (UTC)
Received: by mail-wm1-f100.google.com with SMTP id
 5b1f17b1804b1-4217d451f69so9505925e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718898404; x=1719503204;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zk1KYP1kQCc4BbpEkWcdsHf4wCBFSdrzFBih3Vj76ZQ=;
 b=IWO3d5JTIhIVdOmFcqmxuPo+SHS1Tvj6AgvCODw5WXaBycDVOeMRXB9xvk60wu/Rfd
 DCct1Xj+QPCUmm26e9lrmS+U60Y/p+dVpjofmL6EwepA7/9ZnL/RQ38DqkYSZTMlf+P/
 vAhFssFpU1+QPRl+OUZSQmJEwltT8cqsPfhldf8Kdd0PQz/AQyU9Oe1NjO990BzXg6RG
 5tl1r3ttN6/7e5RAiTGLKWCeztjgevQmfpPmFQYO+qKHjfLEg7B/02sA8xaO3YTrJTDm
 k4HpAMzyZmGB2EqmgiW4Xyw6KB4wI93kHjbVFq466XMd8d4CgeIuzbqRM3EBGtLDbObK
 ctxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718898404; x=1719503204;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zk1KYP1kQCc4BbpEkWcdsHf4wCBFSdrzFBih3Vj76ZQ=;
 b=DIUAeE8TRh2+gGrSP9mhXIgwvzvcvDqojihHwZ6Bp3fc90+FRvxKGKjdf8a7+3zMQJ
 J7yn5vNKKku1zuv7XqervpOWOVy952BWJ5RVDgXRPfACaiLMglwLDtd0rL6+JNyrwh2r
 dR1pTAA0RfByn+ZuMX+ujlwllrJxyu/nsZawwJ4TwHk10dprm4LWhGF/wANd2oTQh0zo
 Qf797ViDuy5+ndy3TeZ9nJwAYxWsHWzTNdPCqPDDk/E1xV+PAmJmVfqptWF8hA35RUWM
 79zu5ZvL7sH/0WuTpfuMk+1DsRFuPz9K+V34+W4ub0Gn5ulePI3tls1gyrLSPS82RhK1
 6F5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXvc7Y3AQxp4iYzMIHnfyaE+bk6sKK/UZxyQidsqcGkYA6ZmfsbQfq+2vn14/DEuc62lP1RmrCCUdYMNoj7L4/AcFXAHVgMPJxQl3pw1tQ
X-Gm-Message-State: AOJu0YzISCA4g3iKJrfFvpr5jmQwxsAlGzxuqPti5WmBdUI6xtKhX0Tq
 MPJ57jK6gfIpEubekDT9mRsEYzhGQsIAyiBp7AK91EZ3bO7Wa4wt6KxM5ihJg+pZIpHGQtmw1Jf
 5AhRRTCuDJbIDlpaWGQ4taRq+GM5Bf/cU
X-Google-Smtp-Source: AGHT+IHo2oOtHXr+XOxwt6fHBqSiV8xbhPfPknxNJCeWJk1Bo+/Q0V9c8O0LwU4eQgced3Z9493dJxCyvOKN
X-Received: by 2002:a05:600c:3b98:b0:424:7490:23f0 with SMTP id
 5b1f17b1804b1-4247529b358mr42171695e9.38.1718898403899; 
 Thu, 20 Jun 2024 08:46:43 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 ffacd0b85a97d-364066d31c5sm255293f8f.6.2024.06.20.08.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 08:46:43 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Maxime Ripard <maxime@cerno.tech>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 09/31] drm/vc4: hdmi: Warn if writing to an unknown HDMI
 register
Date: Thu, 20 Jun 2024 16:46:10 +0100
Message-Id: <20240620154632.4125308-10-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
References: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
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

From: Maxime Ripard <maxime@cerno.tech>

The VC4 HDMI driver has a bunch of accessors to read from a register.
The read accessor was warning when accessing an unknown register, but
the write one was just returning silently.

Let's make sure we warn also when writing to an unknown register.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
index b04b2fc8d831..68455ce513e7 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
@@ -498,8 +498,11 @@ static inline void vc4_hdmi_write(struct vc4_hdmi *hdmi,
 
 	field = &variant->registers[reg];
 	base = __vc4_hdmi_get_field_base(hdmi, field->reg);
-	if (!base)
+	if (!base) {
+		dev_warn(&hdmi->pdev->dev,
+			 "Unknown register ID %u\n", reg);
 		return;
+	}
 
 	writel(value, base + field->offset);
 }
-- 
2.34.1

