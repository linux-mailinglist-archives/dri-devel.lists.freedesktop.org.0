Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFE73760E3
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 09:04:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37EDB6ED24;
	Fri,  7 May 2021 07:04:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D21696EC83
 for <dri-devel@lists.freedesktop.org>; Thu,  6 May 2021 09:29:56 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id n2so4879540wrm.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 May 2021 02:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jNmgoDpIAghNn3BnTNkDEnQ9+nEoZ/qyk+RO/b8i32Y=;
 b=XRhWl492jQpC8ztR9K/xdJ/kLA1bcHs/VmX4tFlPbocTcg088sm+c0RAzyGu/2X0vV
 YQFyRFDy21EG7IVWa0XWddIUe0HHasSTWU5UQHfOD4oG5JjsHVIb53mLrQb3UFHxq8EF
 6HVd2ElkEypGxP95nnvD6ZQj3spgJ4IWQN96TCIdQddtE4gIbuXXLDEA8IiBdTSLaDR6
 gRrwnLyZezZI/i5uLtsEUQxvox03KC9jPan/2z30yR85AJFEscJ0SFqH36LiIh8KbuIS
 T0MISJkr+R+toKNyTgO9HmnyZMRTPTFLGJ1Gq+LxIK8Adn08jtKLd4Spai3a/qGbjtYK
 cOHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jNmgoDpIAghNn3BnTNkDEnQ9+nEoZ/qyk+RO/b8i32Y=;
 b=Xe06y7B8nbtFMHYqPuiJb/dxh6GzEuRX1pxochEquVzEQRdVTVu4WyOSPIl6xN3zf0
 J4PxJsioLPH16S01o1wk4y14TKvmtqFwMU8XKNL5Nq7uLLWl2q27NDmnyX+weeu//LBX
 IuKpn/7gx/fvlpdvMHEx89C3XsBIrrTfmlIlfqiBbd2yF1OOG3aDHns08LW7z9xtR4nc
 TeB24wb3lUg4n/aKfdORiXvrxvUx0Epx1dP9K43eKjX9y97oMxh8qxEb3K9stxRHWsky
 YfCXLKyj8u3mC76bmkdUqzB4k0MsLbIsEUCJznfwuntVaH6Fxry19p5NinyOsEwuizRd
 jRhg==
X-Gm-Message-State: AOAM53200ESo4mXBtNSv72lXY1kjKCoOsFr6Lkj93ztPKAR213alFjSk
 dodZ/pbfOA8TUuFWIFrw/w0=
X-Google-Smtp-Source: ABdhPJx1eaBN19Q7fZ+VHgblI39HCWIKzxs0gNie3Nj96TsdIPOKUtTrFxheE96Rd3xV40P9VosDgQ==
X-Received: by 2002:a05:6000:1866:: with SMTP id
 d6mr3956776wri.141.1620293395545; 
 Thu, 06 May 2021 02:29:55 -0700 (PDT)
Received: from morpheus.home.roving-it.com
 (f.c.9.1.f.e.c.d.1.e.0.0.2.b.5.5.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa.
 [2001:8b0:fb11:2681:55b2:e1:dcef:19cf])
 by smtp.googlemail.com with ESMTPSA id i3sm3747434wrb.46.2021.05.06.02.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 02:29:54 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: [PATCH] drm/rockchip: cdn-dp-core: add MODULE_FIRMWARE macro
Date: Thu,  6 May 2021 10:29:51 +0100
Message-Id: <20210506092951.515813-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 07 May 2021 07:04:43 +0000
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
Cc: Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The CDP DP component of the rockchip GPU driver requires firmware
so define MODULE_FIRMWARE for rockchip/dptx.bin so the details
are available in the module info.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/gpu/drm/rockchip/cdn-dp-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index a4a45daf93f2..661f26a458da 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -42,6 +42,7 @@
 #define CDN_FW_TIMEOUT_MS	(64 * 1000)
 #define CDN_DPCD_TIMEOUT_MS	5000
 #define CDN_DP_FIRMWARE		"rockchip/dptx.bin"
+MODULE_FIRMWARE(CDN_DP_FIRMWARE);
 
 struct cdn_dp_data {
 	u8 max_phy;
-- 
2.31.1

