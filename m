Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD39A186071
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 00:19:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 998ED6E2E5;
	Sun, 15 Mar 2020 23:19:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 987AC8911B
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 07:21:25 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id z3so198371edq.11
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 00:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=uc3tUPFRMKpOBHISvMn5YQ4zt6tuto3i0ER6vMBt8yA=;
 b=kTyejLGY2WPpBLC4/mkBzwppvQ0gbvnKLPnUh4tlFKU7VQNZ4DxfGjB1z2kbyR+o3v
 FN9i9wirp9hu9AeiSwpyqol3haVRchFjCGPvj/se3QmBeTNkJdsi1ut7wabk0dwO+/zH
 EpMCIC0dzNdAvEgY9sLvFUFsxvNAtM85IRnwYsL71ux4lXpY1svBRRaF7WQLBU+/ev+6
 5grnvMsxUxIy/EA22XeXM51LwOnDZztyctSa5fpwi2bLNh6q8xG7c1ZBzmrC3hJj2x3A
 v0iJdE/8/cQuAYHqCKce7CR+wJKHLrH+et1OKbPVIhr4igoZAzRD0IrPqjuhpHf7R71K
 VghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=uc3tUPFRMKpOBHISvMn5YQ4zt6tuto3i0ER6vMBt8yA=;
 b=QztVkdiLqgyfV/8e7mAAiPV92KGvnKqcrgEpdOS3jAGTvz6kUh3eSWfiGsun7MsdKV
 D8P2f6KQH5BOpwWLDEwOvi+ssrfA/3lQc8HfrmR96PTcHeZYibydeE07UGXPUvZzwwbq
 LVWJ6NDCb1ZFR9gsvsg+h5Ge59fzvTgJJ0CDuh95dkHl/G8MyZQ/ozd6enLebUyg9Bu3
 jJbNSgNquK63VuF4ZDDSQS+Zw3CWHE/MFXP+OhT5R4BTOMV5scyldn/uM7xan9QuaCNa
 X1kxMoyG4ZnQuRfrRdCOcTk+yV+YARaZmP0KRfMFmBP/GZdVpk80RdoWl548CZ3imdS/
 yNKQ==
X-Gm-Message-State: ANhLgQ1YRHHVKW0uFOSRLKeUWfDZf9Kw96GBCGfvk4/Kmkz/aD3Q5O4R
 6KDDsdMdB/ObOEPK8UX+fC4=
X-Google-Smtp-Source: ADFU+vuNwPtaanANlsW3pFS/owgZW33ZS8LHiCmmEX3cDJcX+ZdUwMopIn2grErjKpqQ6uaVWEE5fg==
X-Received: by 2002:a17:906:7a54:: with SMTP id
 i20mr18547767ejo.100.1584256884059; 
 Sun, 15 Mar 2020 00:21:24 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2d6c:6c00:888a:952a:33bc:a081])
 by smtp.gmail.com with ESMTPSA id k8sm119650ejq.36.2020.03.15.00.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 00:21:23 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Benjamin Gaignard <benjamin.gaignard@st.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH] MAINTAINERS: adjust to VIVANTE GPU schema conversion
Date: Sun, 15 Mar 2020 08:21:09 +0100
Message-Id: <20200315072109.6815-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Sun, 15 Mar 2020 23:19:06 +0000
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Joe Perches <joe@perches.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 90aeca875f8a ("dt-bindings: display: Convert etnaviv to
json-schema") missed to adjust the DRM DRIVERS FOR VIVANTE GPU IP entry
in MAINTAINERS.

Since then, ./scripts/get_maintainer.pl --self-test complains:

  warning: no file matches \
  F: Documentation/devicetree/bindings/display/etnaviv/

Update MAINTAINERS entry to location of converted schema.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on next-20200313

Benjamin, please ack.
Rob, please pick this patch (it is not urgent, though)


 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 77eede976d0f..50a7a6d62e06 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5766,7 +5766,7 @@ L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 F:	drivers/gpu/drm/etnaviv/
 F:	include/uapi/drm/etnaviv_drm.h
-F:	Documentation/devicetree/bindings/display/etnaviv/
+F:	Documentation/devicetree/bindings/gpu/vivante,gc.yaml
 
 DRM DRIVERS FOR ZTE ZX
 M:	Shawn Guo <shawnguo@kernel.org>
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
