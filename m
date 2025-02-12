Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8133A31B49
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 02:43:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 159AB10E784;
	Wed, 12 Feb 2025 01:43:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F9VCMyFB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEBE610E784
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 01:43:21 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id
 98e67ed59e1d1-2fa21145217so10004825a91.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 17:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739324601; x=1739929401; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YanI8iRaFnbYDLIbwSAL7fPqo0KzjFa50XedZ+8YIHE=;
 b=F9VCMyFBRqmdFTR5TN1Fe99rYsQZgpwWVpYQgTsrlSgpqZdfg9+Q33VcyilqbtCgq1
 9D2zcUA+eZwqZUvutxWqIpMRbFsyRcM0un2euYcXQ0f6qSe0sx20kVrqr/dGAcA6o/mP
 sDHEoiMuTb7/Qx2O7xVjtfzGGuvgsAAQbdcfw3A9W4G9NPuwlvugh2VUTUBeH82NRIOk
 fdyvC/piImH/REnCqZZV+Ki/bVLJI7nFseYyHHZrgaFuYSmH2nvPRpnC/GF3LfTyJnpO
 Ib4IWMqVKiJkuBh1RGIdGk8KAv5XKc3Blq3ZQbC5rkQ5HAbezOdvpR4cfLwpBNKLPgYF
 59uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739324601; x=1739929401;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YanI8iRaFnbYDLIbwSAL7fPqo0KzjFa50XedZ+8YIHE=;
 b=aZzFIPwWu3crUUcCgy+UOqwSPJUp1ho6xJtvCdHxWL5Il57d2VX1Efi9JYFR2+ZG52
 ny/cY5v8ck14e4I9IBn+z2aivoem35Gbg6h3qaxu/tEy4mO2C0YWSIWvJFFStYOGKWCx
 YOJjOVzyENXoUbTTGZagQpv+HT6Kty5DCmgc9W58pTN1c3oIBOzVpDUIvTEC1GI+jIt3
 NdGOu3pCefENQ6rKM5Ic+We6hJcpd6YA/zIEOAv5Terh6wWUKiaOde3+djdk3juY27vf
 PWfnyeL/VEUm66GvR/dyNvnx1lsOS74mTfcm1B6k3pFYSlC1a6nAbVNWAoYybpLvHoJg
 wstQ==
X-Gm-Message-State: AOJu0YzNSVG0CsMpW/zu6KBMB++mDwc94v5icS6+lfLSne4dSm+KOM7g
 bLKoB9yhzWulqLNPz+gW3uqiRB4GGtCDeCfepAAw9md4msvGnGW3
X-Gm-Gg: ASbGncurXfBdo2BKDEegpG9nmW/EgGxdiLw+yN6+mmS0CtdN5bZxQ2rls13uDP4FFYR
 IRhi1VAM/W6RLeyh5spAyE9D5tqTTy0XLE60REpUtqwaUNSmTW+PNEEIOPzuyGF7PIcBPs+DJem
 Ti8b9yz8Mtv76jk2nF58DZDuTc76apB0dYprWoGx6NoZjWgTr8BAb5LPMY82KYnWT/QNOVXM+jA
 UutazPjaD4OFEmP6+z4LqbVn5BZ9oZc5yblPSa5LEaSg8ZKDXUPPejAVKit7+MnU/UbNXXsrLN+
 3RQmBQuT1TlbIlcIHcxW3GWcsvMltXVZJQ==
X-Google-Smtp-Source: AGHT+IHnk+a/LVCawfVCfdGlssi3Ze/Dz7OTqlOispTxLSEB/9y18V5ncQW0N0315vtYhNg9VT6u9A==
X-Received: by 2002:a05:6a00:1494:b0:728:e906:e446 with SMTP id
 d2e1a72fcca58-7322c4116c9mr2019902b3a.24.1739324601222; 
 Tue, 11 Feb 2025 17:43:21 -0800 (PST)
Received: from localhost.localdomain ([124.127.236.130])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73048ae7f6esm10038023b3a.74.2025.02.11.17.43.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 17:43:20 -0800 (PST)
From: Qiu-ji Chen <chenqiuji666@gmail.com>
To: thierry.reding@gmail.com, mperttunen@nvidia.com, airlied@gmail.com,
 simona@ffwll.ch, jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, baijiaju1990@gmail.com,
 Qiu-ji Chen <chenqiuji666@gmail.com>, stable@vger.kernel.org
Subject: [PATCH RESEND] drm/tegra: fix a possible null pointer dereference
Date: Wed, 12 Feb 2025 09:42:45 +0800
Message-ID: <20250212014245.908-1-chenqiuji666@gmail.com>
X-Mailer: git-send-email 2.43.0
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

In tegra_crtc_reset(), new memory is allocated with kzalloc(), but
no check is performed. Before calling __drm_atomic_helper_crtc_reset,
state should be checked to prevent possible null pointer dereference.

Fixes: b7e0b04ae450 ("drm/tegra: Convert to using __drm_atomic_helper_crtc_reset() for reset.")
Cc: stable@vger.kernel.org
Signed-off-by: Qiu-ji Chen <chenqiuji666@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index be61c9d1a4f0..1ed30853bd9e 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1388,7 +1388,10 @@ static void tegra_crtc_reset(struct drm_crtc *crtc)
 	if (crtc->state)
 		tegra_crtc_atomic_destroy_state(crtc, crtc->state);
 
-	__drm_atomic_helper_crtc_reset(crtc, &state->base);
+	if (state)
+		 __drm_atomic_helper_crtc_reset(crtc, &state->base);
+	else
+		 __drm_atomic_helper_crtc_reset(crtc, NULL);
 }
 
 static struct drm_crtc_state *
-- 
2.34.1

