Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A47019664A
	for <lists+dri-devel@lfdr.de>; Sat, 28 Mar 2020 14:20:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC4BA6EAE3;
	Sat, 28 Mar 2020 13:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D16336EAE2
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Mar 2020 13:20:46 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id x200so2979481lff.0
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Mar 2020 06:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kZ+Rq4/MGR95uHKIBpGPN3gPBQTaiaUteyPMqlesdeg=;
 b=mLGr3vU+GkjsXMuZCO3IpfIVoOx6sS7r90vclQO6LOyInTkM4rzojMieDXQuNTPLvZ
 E/9+puR6TaP6Y7/xDN6vk7NjzwyXH4P7UXtNZ66bHlaqokLY1gI2Yv+Ltwzq78pEg2VJ
 zFT9DkgMpG3nzi2Xdrc4+DOH570BHJ/mIzY0n+XxHHecgu/yRzcOad/u4TpFMM3lzvRv
 xV85bL0I97wWLPD1gtTA6KCHTwily7QuPPTnS6gqEu01KrX4O/xmR7bcDRL6du8g/BGD
 /tO40yQ1/vsiZkgz/9PEMfH5fBpcfFOv9Y1ieAAFtM/2Dy194CNWAWh6Oy3w73qlHGqK
 53/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kZ+Rq4/MGR95uHKIBpGPN3gPBQTaiaUteyPMqlesdeg=;
 b=ulgGVrwoKliCW3ZrCUTHpBlZt7rSUB/3TuhWy7Yhhsb7g4RWjguf8FqaDPeWs1qdLn
 gGiYp8WHd1yXuq0DFKBkdpj4fx/MulWvoM+q5O89sy6PY7sBBVCuhxlZz0qrKh5LV+NK
 PqvBztiORtfdPoCFxlTNfSraxKbOAY4g6LuSlGXwoas5LMX/pS7yIshyeUAPuE6SDHNe
 8h51ishUXFf5RHa0all0IP4m16uY2N46Fnb0Pm5lyDMOyEckJJFlumyNfmBQe3xqP5XJ
 dw9Dlvv7ui5eDJ3PBxNr6ZFOO7htBBZ88PKtyltm8Jwrz73c9zH9TVBnZYHYSBvqEoSH
 KCaA==
X-Gm-Message-State: AGi0PuasNii9CvQla5mgwLHTJBPplObLuOzOYW+q7ezWhVXE4bN2CwT0
 3wc+ptPnH7Hr/aldJTOBnQeWlACKCtA=
X-Google-Smtp-Source: APiQypJ56vQF+FiT8rp8teVriZv2u2XC80IZUSprSTJGgE+F8fwrIELEdL7O9oqKfyT1OVDrxlt1TQ==
X-Received: by 2002:ac2:44c7:: with SMTP id d7mr2741883lfm.124.1585401644955; 
 Sat, 28 Mar 2020 06:20:44 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 j19sm4542916lfg.49.2020.03.28.06.20.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Mar 2020 06:20:43 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	Lyude Paul <lyude@redhat.com>
Subject: [PATCH v1 5/6] drm/dp_mst: add kernel-doc for
 drm_dp_mst_port.fec_capable
Date: Sat, 28 Mar 2020 14:20:24 +0100
Message-Id: <20200328132025.19910-6-sam@ravnborg.org>
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

Fix kernel-doc warnings for drm_dp_mst_port.fec_capable.
This fixed the following warning:
drm_dp_mst_helper.h:162: warning: Function parameter or member 'fec_capable' not described in 'drm_dp_mst_port'

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: David Francis <David.Francis@amd.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Mikita Lipski <mikita.lipski@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 include/drm/drm_dp_mst_helper.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
index bf5e65d2303e..d93e628ebc84 100644
--- a/include/drm/drm_dp_mst_helper.h
+++ b/include/drm/drm_dp_mst_helper.h
@@ -157,6 +157,10 @@ struct drm_dp_mst_port {
 	 */
 	bool has_audio;
 
+	/**
+	 * @fec_capable: bool indicating if FEC can be supported
+	 * up to that point in the MST network.
+	 */
 	bool fec_capable;
 };
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
