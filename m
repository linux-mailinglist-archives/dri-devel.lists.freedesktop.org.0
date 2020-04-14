Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C1F1A7661
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 10:47:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F016E49A;
	Tue, 14 Apr 2020 08:47:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B0176E499
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 08:47:38 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id f8so8707974lfe.12
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 01:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YwbI5H3nSrkPHMhpDRGij6sZQOSpEJF2+4Voifzos4U=;
 b=ircLMLOsJC83e7Pf/vyYNu6VKOUELtouwIBZDc9LANnRBNnldRFWq6ihFC6PaGlcvq
 C+SWe7YVnMMGE3Wb67IQQUOpoo3WnvDcIXgUiqp11M4ciXC0EKCg7raO72m9tkRMIaSG
 6kF3pi7a/Dly3gYGBRcni5UMo9RkYBUh6Ub5W302vA6gqhfBdAuTax7wJialYr3XXXTI
 yY7GmXzZzqN0bYUkoH1Gai8mcrfzvyzL2BYUFPM6x40Lf0Bas+pX2LCeaNPCk/wVfKrM
 6bm6IQitwme7FuQcub+DMIQXDPKpYN+grWA3UzcpCOczMcbOvK1FRYZe+APYR8GfZHcV
 F3rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YwbI5H3nSrkPHMhpDRGij6sZQOSpEJF2+4Voifzos4U=;
 b=pNs3yyftVg8upS9aR1OvEZxIPH1hdXBEk3ITmxq34jojQ3bQKRHstDs8fc/FVWA4vr
 uBRS1cYIDLnCgzD4w83qrzfU6PegDFQzeS+kvmrpqLVayiJKbVkBOmnsP1B4N3/hxJ3/
 rjBZVOOwrsyxkBZ++m1afDhY8wVSRgAOpuK2Z+qn7aiJxm63tdLtqk/nEa/5V2amqyEL
 uplTEJHVWXrBePw67vAWcx2MU8TiCaKRWkEg+zpI4NQYoUoqbr82MZvVUTU271+1BG0g
 VxVtw/qstUBUaYrF/jvCRqfOf2PqQChIUxRsodL0nVBkv46NMrUL43bOVh2a3JssO3Oq
 2m6w==
X-Gm-Message-State: AGi0PuZRB+RYbOsIOht47DnUfNDzBErVfu66Wujdagu9H0tfmzd1HD9y
 aheycHdML4c9OKgW1BthaQNt0BoavGs=
X-Google-Smtp-Source: APiQypJCQVrVmuvh0NVCtCFeQVugtoMW6xtE3uBuI6yudRJ5Va8f85yyYoU2eDFLp9W4AKZBMP4ztA==
X-Received: by 2002:a19:7407:: with SMTP id v7mr13432936lfe.124.1586854056639; 
 Tue, 14 Apr 2020 01:47:36 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 q10sm9834979lfa.29.2020.04.14.01.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 01:47:36 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v1 1/4] drm/panel: add connector type to boe,
 hv070wsa-100 panel
Date: Tue, 14 Apr 2020 10:47:24 +0200
Message-Id: <20200414084727.8326-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200414084727.8326-1-sam@ravnborg.org>
References: <20200414084727.8326-1-sam@ravnborg.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The boe,hv070wsa-100 panel is a LVDS panel.
Fix connector type to reflect this.

With this change users of this panel do not have to specify the
connector type.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 44a1f5dfb571..749115c98ee2 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1059,6 +1059,7 @@ static const struct panel_desc boe_hv070wsa = {
 		.width = 154,
 		.height = 90,
 	},
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
 static const struct drm_display_mode boe_nv101wxmn51_modes[] = {
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
