Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D8A4BB5E5
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 10:46:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD1B710F14F;
	Fri, 18 Feb 2022 09:46:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D26E10F14B
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 09:46:02 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id qe15so8081524pjb.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 01:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L1rvqCHVtRBiuL9Y54dOZY1q4vVwsKl3F8s+6b7SX10=;
 b=kA8iQUGA3pzeY3mPS+gSBAbw8lUtB4kqJTNiQ4j3kyPWxAixQyNAEY4/1/8iJEmXuA
 v5Qqnk8Ws7cR3V6Qd+6CD3evF5GdaTJfTj5O7HQqXc5XzV1lV6kOWQ2zj3PkNtYbOmAn
 0/pzmY1to6SSXd6XOjcQXBFQFPqLHWW7jvaEVdgZUexwKm+QgTQxnhAxiL4YeFEssdoc
 ruIMdw4V2A57EfgTWdUHMLS74Pi19jhW0x10/P6k9R+JudXs1ecgErg1BBsTYtALDkTT
 YEARe7bXjx+CwSp2r2mtaamPXPZPKMYDpy8eXkW0wIUMcYGP3LywhOkNHRkShrmyKXDm
 eSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L1rvqCHVtRBiuL9Y54dOZY1q4vVwsKl3F8s+6b7SX10=;
 b=aN7WK626zzNXpqP2hewzEYZxy9CQTGCe2uAy+TSdRp1gF9CgVo2Ti84kPRPSloijbl
 VzeSyiuF/07RMICCiNdHCJ5qRpUqjml3MWgYTKKoyVunZqg+2o6z7KVqTAVwJ4SQGnA+
 218gKLF6fj9ILboNzYGeZktiNZJdy74AAL/UyX0oGe1k9MTz5IsiBkfqAW1UD805h9et
 qYGcKJ7vxIIMqsLYD8JOjZfnbgeJ4VJTxYEr5FxVSyjaU/hZGTc8OEaVfF3N/lzBwmRi
 2v5fPG+/i1q3RGXZGx9GFJfKA7UOJR7+AjFhCRYVMvJXPqG/n5MFXsYaBGTU6XeIUnLR
 izHg==
X-Gm-Message-State: AOAM531EbFi5K/HQ5aKfAHAow/e3rdWb+3eRt4dUDoDGEjXx2yMI9JAA
 3pB9g8bfAp9B2XkNMafg1IY=
X-Google-Smtp-Source: ABdhPJxQiWDrvZISrqJRZDLKJbKAvehEF9S+UjGB7lwhpbuLIelGs8siUiCxWTlbhl3eam2Q5joT7w==
X-Received: by 2002:a17:90b:1c8f:b0:1b8:c6dc:ca61 with SMTP id
 oo15-20020a17090b1c8f00b001b8c6dcca61mr7465172pjb.13.1645177561869; 
 Fri, 18 Feb 2022 01:46:01 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.222])
 by smtp.gmail.com with ESMTPSA id u8sm7675704pgf.83.2022.02.18.01.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 01:46:01 -0800 (PST)
From: Rex Nie <rexnie3@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] dt-bindings: display: simple: Add InnoLux n140hca-eac
 panel
Date: Fri, 18 Feb 2022 17:45:49 +0800
Message-Id: <20220218094549.1631706-1-rexnie3@gmail.com>
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
Cc: devicetree@vger.kernel.org,
 Daocai Nie <niedaocai@huaqin.corp-partner.google.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daocai Nie <niedaocai@huaqin.corp-partner.google.com>

Add support for InnoLux n140hca-eac display panel. It is a 14" eDP panel
with 1920x1080 display resolution.

Signed-off-by: Daocai Nie <niedaocai@huaqin.corp-partner.google.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 1eb9dd4f8f58..f8383a8dc3dc 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -180,6 +180,8 @@ properties:
       - innolux,n116bge
         # InnoLux 13.3" FHD (1920x1080) eDP TFT LCD panel
       - innolux,n125hce-gn1
+        # InnoLux 14" FHD (1920x1080) eDP TFT LCD panel
+      - innolux,n140hca-eac
         # InnoLux 15.6" WXGA TFT LCD panel
       - innolux,n156bge-l21
         # Innolux Corporation 7.0" WSVGA (1024x600) TFT LCD panel
-- 
2.25.1

