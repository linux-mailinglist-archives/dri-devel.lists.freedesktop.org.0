Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9037D5E9EA6
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 12:08:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7997310E3CE;
	Mon, 26 Sep 2022 10:08:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F98910E3CE
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 10:08:46 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id p14so3208423pjd.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 03:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quanta-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=ehcMWTx3JCiw0KnWDLCX/Z/T6ECZCx/ojhdFf6ysh9U=;
 b=bqv7qi85AS9b8Ieik64VT/vdGDUTL6h125N6FpgUoHN4thC/OwZDiZ7l+sD0HzAA9I
 35rXcdgmVxtL3AqTK1HDCkRkq6ERYXnSFD4SJNEeKZDBjRUXs356sUhge+o2t+djvZvf
 yS4gHDKv3iGeUhCTRi6Lip//NAmqQ3YzsQJboUDFew1abSUEkJLkvpdB+fO30JGV340P
 82bHAU/pzCX+7g506QD4Zilt4+tpAqGwf/jt6c2XTof3xupxRg+wo8DjfVaGxCx7dXuy
 Rp0f7iRjfq/bKPxVB8puSwRJ9Pp0WY5X/K5+HGG/Th/SXeQ3UntQBUvC5M3xhkP48Jvh
 pOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=ehcMWTx3JCiw0KnWDLCX/Z/T6ECZCx/ojhdFf6ysh9U=;
 b=Zs3Tgd0tnoxEJenm3MyO5XDqpVZt7gYRMHW9hMQxQYC/UlFuZssHigzE8u/4nSIjcl
 oTi4mFMDoU696rKXMYL5s6flxe9N8QQvxG2+s8w6UmozLJI/BZOVF/SxfOqdrEpJDptr
 Iat9gGMi9ydsGdj08Gx8vKrtqFoksY2OQUykOhb3No0qNMOgCaGUA6MrUXO6Xe/fZb+w
 La/vdzWn+bTHIJzdjpAnSfeLibKOqignfvvZUJa7sA8k7GNRRKAdHcI+h22i8MkZxQ5g
 3246ibKxLfbBoC9qjUrMHLgDoFL0wIVcPu5ma5/oi+Vn6gahjCCxEQkpRxG3DMkgz6q8
 SAaA==
X-Gm-Message-State: ACrzQf2Z8/S4KaqWOLGfqmRwiq/i6Sy63eJ7jbvpXdY7zdX0MjQFhOSw
 vsmfNODglofKtm7Z6q//U7Hz0g==
X-Google-Smtp-Source: AMsMyM6d30TDyOxHYeAf121l8qUL1+DdJtCt8j1JfJucbrBQRk6jFIUoRpEffxZDoEnIYfJNKHOOXA==
X-Received: by 2002:a17:902:f550:b0:178:5b6a:3a1c with SMTP id
 h16-20020a170902f55000b001785b6a3a1cmr20626741plf.36.1664186925843; 
 Mon, 26 Sep 2022 03:08:45 -0700 (PDT)
Received: from sean-biuld-server.itotolink.net
 (1-34-200-211.hinet-ip.hinet.net. [1.34.200.211])
 by smtp.gmail.com with ESMTPSA id
 j29-20020a63551d000000b004390b40b4a1sm10304950pgb.23.2022.09.26.03.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 03:08:45 -0700 (PDT)
From: Sean Hong <sean.hong@quanta.corp-partner.google.com>
To: dianders@chromium.org, thierry.reding@gmail.com, sam@ravnborg.org,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/panel-edp: Add INX N116BCA-EA2
Date: Mon, 26 Sep 2022 18:08:39 +0800
Message-Id: <20220926100839.482804-1-sean.hong@quanta.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Sean Hong <sean.hong@quanta.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the INX - N116BCA-EA2 (HW: C1) panel

Signed-off-by: Sean Hong <sean.hong@quanta.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 060f4f98bc04..ba75fae7d376 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1889,6 +1889,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a5d, &delay_200_500_e50, "NV116WHM-N45"),
 
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x114c, &innolux_n116bca_ea1.delay, "N116BCA-EA1"),
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1154, &delay_200_500_p2e80, "N116BCA-EA2"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1247, &delay_200_500_e80_d50, "N120ACA-EA1"),
 
 	EDP_PANEL_ENTRY('I', 'V', 'O', 0x057d, &delay_200_500_e200, "R140NWF5 RH"),
-- 
2.25.1

