Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94010196649
	for <lists+dri-devel@lfdr.de>; Sat, 28 Mar 2020 14:20:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB05E6EAE7;
	Sat, 28 Mar 2020 13:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE54A6EAE3
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Mar 2020 13:20:48 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id r24so13069305ljd.4
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Mar 2020 06:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HA+xi3mHlfeS5Ulva81PYujVar8iCKB3wmJ61htEfPM=;
 b=Pikr7hx6Upy/glWRPTqedFtqZWVkys+d3hkB5iHwY2ZJN+oo6WS09018BH4M7AVzr/
 iGTOm9jVB/VFn3t3F2hoYAyX2jOa6oDbVhiKksYzs4pQcG3Xbhti3SXPUs387OeFOv3x
 7b24e0qUmJGQKJONNVhxK9GMMmVMLJhD/CSb79SlUApr1yOfB4mfBXurkP+IQnrG+Qpw
 QjsMwYm0w4UO4jQyXlVbIaH1Jy/pNNtm5AX7vchFfU/MR7otYd9J5ej3juZvdKoBf0LS
 bZ4SfASAIuWkMO1Z5r7738mdHudtrHWQQ6ls7T08YVYjw+Zi2ULuitmKKS0S9sNA3Nal
 pZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HA+xi3mHlfeS5Ulva81PYujVar8iCKB3wmJ61htEfPM=;
 b=s/Y7gnJZXBlvMh05yVn8zKz7ca65pLVLyH/cr/78JUiyovVUwj7MF0xEl1Px6TrKpz
 ZP4OHD+0hQ7pOeKrs4rZaBW3Tk6t3JJ8z7fqwYYdoya+8IthaVVGd+VGCP+Olhvqtc/+
 H6c7r/0rWXoO3lEbEpuqnr/H6WbOwqIrY0ivqs+xFucOgHlrtprhq6Q/AuPBQkohWDaM
 J1y/IqI447EfcX8Mc1MsYjZ/s5cywgvm/+XVvEUEJLqgtSxSXXmQ7sqtFS1H0+9HCOOT
 KYpsRF7bRsRR83wZO5wPLsuDzhW+heVYBpmXTmX6yt8oYInJvdnlA+R7lBsfxfAHUw+A
 hy6w==
X-Gm-Message-State: AGi0PuZf5cX4eE6ZWBnrvSkMUNFcbxDziFOKhYhHDnp6Ey9CNAW5DlcM
 QXEo8TPvpDB9U2CwX0p+Jb1BQGmW9kA=
X-Google-Smtp-Source: APiQypK4OKVN9QR0FyDep9OPhi5HOiEHCEHfsI2C/ETJuRQo+DWwgtJ2p5mx9fEzx2bn/VCOYxtw1Q==
X-Received: by 2002:a2e:8648:: with SMTP id i8mr2266010ljj.188.1585401646744; 
 Sat, 28 Mar 2020 06:20:46 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 j19sm4542916lfg.49.2020.03.28.06.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Mar 2020 06:20:46 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	Lyude Paul <lyude@redhat.com>
Subject: [PATCH v1 6/6] drm/bridge: fix kernel-doc warning in panel.c
Date: Sat, 28 Mar 2020 14:20:25 +0100
Message-Id: <20200328132025.19910-7-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200328132025.19910-1-sam@ravnborg.org>
References: <20200328132025.19910-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Nirmoy Das <nirmoy.das@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>,
 David Francis <David.Francis@amd.com>,
 James Qian Wang <james.qian.wang@arm.com>, Jonas Karlman <jonas@kwiboo.se>,
 Mikita Lipski <mikita.lipski@amd.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add missing documentation to fix following warning:
panel.c:303: warning: Function parameter or member 'bridge' not described in 'drm_panel_bridge_connector'

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/panel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 8461ee8304ba..e933f1c47f5d 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -311,6 +311,7 @@ EXPORT_SYMBOL(devm_drm_panel_bridge_add_typed);
 
 /**
  * drm_panel_bridge_connector - return the connector for the panel bridge
+ * @bridge: The drm_bridge.
  *
  * drm_panel_bridge creates the connector.
  * This function gives external access to the connector.
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
