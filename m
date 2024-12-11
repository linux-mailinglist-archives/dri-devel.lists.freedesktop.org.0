Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4239EDC84
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 01:28:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E48310EC8F;
	Thu, 12 Dec 2024 00:28:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MUGJgKLa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1908F10EB1C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 12:20:31 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a9ec267b879so1309508266b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 04:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733919629; x=1734524429; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dZg1Qv/4mtP2MMB22o2pEVgK6OLFDKWOSAkJVQZ+VCc=;
 b=MUGJgKLaXOYkkHpEtLpyjw1HRAissLJyUuG2Qfz7wahG4N/bke9aCU/T3NkWY1mg8A
 Hw63aAkps14u1TOS6xLxsQzK4Jg0tI/3hXYiG9rmjlEmj6iuOhwL6xkNFSqpgG9dVabR
 viawZJUOqPkJ8F1GvELz44a72+70LTvKD4s4YRMzL54+5sKhr7gT+L50xakruGd83dER
 dVJYhblDqqvXIxZzP4L8hxO6lJMt9uo4+c1S0nW8+9tcG1biG8Gt4sZqZP5PameIEBD6
 0YSGHINgKJYS7VHq3eneaMlz2qJDAvWjNJuHxfb0BjZ9e8CTxrS8Qvd668fdwYZSOf2U
 B8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733919629; x=1734524429;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dZg1Qv/4mtP2MMB22o2pEVgK6OLFDKWOSAkJVQZ+VCc=;
 b=SOwnd0/otfPnaoCC9Dee5YRwjH/gc/lGWziDFOj5Rr39u1GNySyEV5rZ8g1lxEqxWo
 QknbVgk2jspbOMyMwreyXwkE/i22t5wGu5eUDby5sj2rp0woQqj0YoLZjY9ZtPEIWdok
 +wLd0aO+G/TDc6zx38oxkDIgBvpIlE5RpzL2yntVHLs8wqof4Gv/mpa9Tlsk5bF8PmwK
 Ay3D6SRRD+v208WWOsEDkNWnEfjX91ikiKryqrcw49zK3AiEfTeQivPR4Cdf+Cuu0yFm
 Ip5pv6sSEIx1kSiv3SV0GWp4c0oz+VPwbMXMxE7fpEF9YNpxZmz2uhPRIP6ORmRND+zR
 0VDQ==
X-Gm-Message-State: AOJu0YybvsTrBPrJB7MA6NFObMXDPrYveddDZxaFlEbv02FMgBGZDYQw
 z2azoXN1SckX+EPq/tcgyx6+Kl9OAtANjGIhkMDQtdlJcoTYzY1m
X-Gm-Gg: ASbGnct1UeJatPsuEqWjQ47N01l32aMVRYmbn3kykoPA+8VRgF7lEEkynDEsf4JP1av
 bLtt7/xXCLXc7GATEudg1i6r0ytIIImLLxQohfNlX7CAEO9dhTX+UU/4mo+7zgGOTySvIOsE66S
 o3GgZrhO71iWjVTz6glKLp456AalGVtHrY1KC9jumcXIv4nBq6rJXtvnjBeKa1iQ2/nUgDclbKC
 Y9y+5GzdHIKqFcmNe2sN9kxAWI4yYDqEnYEcwJfx7m+2aXhr4jSttLY2ctSMkPYPw==
X-Google-Smtp-Source: AGHT+IEcp829lZqDsm7lXw0MRlclUKlA4nHlWQBjQ5jFpBUMws73Uc9UVaybAO+Oqfzvd+n0cqJv2g==
X-Received: by 2002:a17:907:944c:b0:aa6:6ece:8eb1 with SMTP id
 a640c23a62f3a-aa6b13f7d49mr232417966b.54.1733919629132; 
 Wed, 11 Dec 2024 04:20:29 -0800 (PST)
Received: from C-KP-LP15v.consult.red ([83.168.79.145])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa658614e26sm672713366b.100.2024.12.11.04.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 04:20:28 -0800 (PST)
From: Karol Przybylski <karprzy7@gmail.com>
To: karprzy7@gmail.com, laurent.pinchart@ideasonboard.com,
 tomi.valkeinen@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, michal.simek@amd.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm: zynqmp_dp: Fix integer overflow in zynqmp_dp_rate_get()
Date: Wed, 11 Dec 2024 13:20:26 +0100
Message-Id: <20241211122026.797511-1-karprzy7@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 12 Dec 2024 00:28:00 +0000
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

This patch fixes a potential integer overflow in the zynqmp_dp_rate_get() function.

The issue comes up when the expression drm_dp_bw_code_to_link_rate(dp->test.bw_code) * 10000 is evaluated using 32-bit arithmetic.

Now the constant is casted to compatible u64 type.

Resolves CID 1636340 and CID 1635811

Signed-off-by: Karol Przybylski <karprzy7@gmail.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 25c5dc61e..55e92344b 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -2190,7 +2190,7 @@ static int zynqmp_dp_rate_get(void *data, u64 *val)
 	struct zynqmp_dp *dp = data;
 
 	mutex_lock(&dp->lock);
-	*val = drm_dp_bw_code_to_link_rate(dp->test.bw_code) * 10000;
+	*val = drm_dp_bw_code_to_link_rate(dp->test.bw_code) * (u64)10000;
 	mutex_unlock(&dp->lock);
 	return 0;
 }
-- 
2.34.1

