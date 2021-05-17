Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AC1382BA8
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 13:59:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7DAC6E93E;
	Mon, 17 May 2021 11:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E74EC6E93E
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 11:59:52 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id 10so4787637pfl.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 04:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zN06llUlMhgh2rrA6m0mH/DsFqC/Ju8EsbQhE5gaebU=;
 b=bc1eZvrcp5Q0pCIPtBTmXraES1s3m8Ci1ZlkcLhu6uFCHT3jpr47XcrXQSUsPSF2aw
 Hk553TvIjMdp6wS2pJBK091sG6xLCOCs/Rhri5DrJ8nxPmh/1uT+74P3RRtg442QFxrH
 t92Y6V9dOA3bMGPjrEuZ/HTtSByRzt9wnifFa89tkqY++mf/hmXzJA23syUfmVbPAjbx
 RQMpJ37Zt+gYwq1VMhTuBdb5XNOzq6rmC8e2YGRB4kjNy8cie8ZDbM2OD/D48kvejspD
 e3GJowbow6cS3EVTV9EvzCumjzn/SqfR++NvNKX0IWZ3omS6xPPFl77PXcFcid2gqEmx
 A+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zN06llUlMhgh2rrA6m0mH/DsFqC/Ju8EsbQhE5gaebU=;
 b=cIc8NjCiS0/GB4H9z5LeqKyDP1E95VOd9XuRIrV52kWNKTJt7LufXT1qGy777Wi6Nb
 xr5KIpMKSHavKN5qXESbQ0ccjhEUspIbJfN+JSuBpyzjtn8XpTdR0qbJ5O6I08VkqsqA
 ii16rl1XwEDxXS7w/H3Y7gpZ1KU0VpPmyzzm9h6gcd9zSoezsYVWyCBthlNPLPe764Jj
 RGnJxoVis3rQ9V8K0nZRc6vJxqWN4O6c4BXiqVfYRkjd8X8zE5o2yTLUae2WtyiNN59p
 fMAyrYUpgbGi4LPxtU74k/xfmVGWPzkKV9yTxhINmw70IktYtuubuhziLiMvqr4+DsmQ
 qV2Q==
X-Gm-Message-State: AOAM532exyEtT5y6UfEeuChYkaj0eisQylvPeeZBIGSp84zaQzh+bBR4
 El2buM6Cz1/Mt+WlGljTQqY09nUfpeZq4A==
X-Google-Smtp-Source: ABdhPJzjlCx9Ov7Dli8nSqMVLntRFKwzsLtifCSbVnH7g0XzdhEhcDTjyQ+STpVFOYsUNtt7cMRXjw==
X-Received: by 2002:a65:4689:: with SMTP id h9mr23777058pgr.347.1621252792427; 
 Mon, 17 May 2021 04:59:52 -0700 (PDT)
Received: from arch2.localdomain ([106.212.13.216])
 by smtp.gmail.com with ESMTPSA id q24sm10211393pgb.19.2021.05.17.04.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 04:59:52 -0700 (PDT)
From: Deepak Rawat <drawat.floss@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linux-hyperv@vger.kernel.org
Subject: [PATCH v4 3/3] MAINTAINERS: Add maintainer for hyperv video device
Date: Mon, 17 May 2021 04:59:22 -0700
Message-Id: <20210517115922.8033-3-drawat.floss@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517115922.8033-1-drawat.floss@gmail.com>
References: <20210517115922.8033-1-drawat.floss@gmail.com>
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
Cc: Deepak Rawat <drawat.floss@gmail.com>, Dexuan Cui <decui@microsoft.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Kelley <mikelley@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maintainer for hyperv synthetic video device.

Signed-off-by: Deepak Rawat <drawat.floss@gmail.com>
---
 MAINTAINERS | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bd7aff0c120f..261342551406 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6077,6 +6077,14 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/hisilicon/
 F:	drivers/gpu/drm/hisilicon/
 
+DRM DRIVER FOR HYPERV SYNTHETIC VIDEO DEVICE
+M:	Deepak Rawat <drawat.floss@gmail.com>
+L:	linux-hyperv@vger.kernel.org
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	drivers/gpu/drm/hyperv
+
 DRM DRIVERS FOR LIMA
 M:	Qiang Yu <yuq825@gmail.com>
 L:	dri-devel@lists.freedesktop.org
@@ -6223,6 +6231,14 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/xlnx/
 F:	drivers/gpu/drm/xlnx/
 
+DRM DRIVERS FOR ZTE ZX
+M:	Shawn Guo <shawnguo@kernel.org>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	Documentation/devicetree/bindings/display/zte,vou.txt
+F:	drivers/gpu/drm/zte/
+
 DRM PANEL DRIVERS
 M:	Thierry Reding <thierry.reding@gmail.com>
 R:	Sam Ravnborg <sam@ravnborg.org>
-- 
2.31.1

