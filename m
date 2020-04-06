Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 556161A08F4
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 10:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 806926E5A0;
	Tue,  7 Apr 2020 08:09:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62DD06E3C4
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 13:24:31 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 27286404C3;
 Mon,  6 Apr 2020 13:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1586179471; bh=kO6bVcAz100KA27JSJXzLR1/q1Cun0xk/nxnhMvtHEM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=OdUaNn8AWpn3+D0gxKe1APO8OBe4MWXyGjHAWJ4pLwCRSd7I3r4ZP8hy0bh4xYUC3
 Qn/5mQDHROxsvVLJu6QrXyKWCekXPbocBlK3oAFGZ7FAdCfUj41E7cG/MgIBJmOWDH
 XRgg0zL+e1jOTGzCj6ZpiffOR0xPh1FIG+wwj76zbCq1gtT5CYfx51BDd5GdHL8UB5
 F1qi1Uj/JqVN4oivAnuStzCY9Wm8SzmoCmfasEgFYf4qR5lpQRtTeOWZKWoW4D5Hnw
 s5sgiTDc+3VoNCUu1nhiUDItU5HMI+2QmS9LMaMGS9I000pKEb0GFoJZRXsdnnkmhZ
 mlP5fAAUFrUGQ==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id DB0FAA006D;
 Mon,  6 Apr 2020 13:24:28 +0000 (UTC)
From: Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@linux.ie, daniel@ffwll.ch, Gustavo.Pimentel@synopsys.com,
 Joao.Pinto@synopsys.com
Subject: [PATCH v2 4/4] MAINTAINERS: Add IPK MIPI DSI Host driver entry
Date: Mon,  6 Apr 2020 15:24:14 +0200
Message-Id: <197608bb7875677a0e61238f0434cc31f37737ba.1586174459.git.angelo.ribeiro@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1586174459.git.angelo.ribeiro@synopsys.com>
References: <cover.1586174459.git.angelo.ribeiro@synopsys.com>
In-Reply-To: <cover.1586174459.git.angelo.ribeiro@synopsys.com>
References: <cover.1586174459.git.angelo.ribeiro@synopsys.com>
X-Mailman-Approved-At: Tue, 07 Apr 2020 08:09:32 +0000
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
Cc: Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Creates entry for Synopsys DesignWare IPK MIPI DSI host driver and
adds myself as maintainer.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: Joao Pinto <jpinto@synopsys.com>
Signed-off-by: Angelo Ribeiro <angelo.ribeiro@synopsys.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index aff76a7..ffc678e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5445,6 +5445,14 @@ S:	Maintained
 F:	drivers/gpu/drm/mcde/
 F:	Documentation/devicetree/bindings/display/ste,mcde.txt
 
+DRM DRIVER FOR SYNOPSYS DESIGNWARE IPK
+M:	Angelo Ribeiro <angelo.ribeiro@synopsys.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+F:	drivers/gpu/drm/ipk/
+F:	Documentation/devicetree/bindings/display/ipk/
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+
 DRM DRIVER FOR TDFX VIDEO CARDS
 S:	Orphan / Obsolete
 F:	drivers/gpu/drm/tdfx/
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
