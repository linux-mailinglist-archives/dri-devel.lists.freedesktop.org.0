Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D6B203559
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 13:07:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B04F6E359;
	Mon, 22 Jun 2020 11:07:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC43B6E359
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 11:07:11 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id u128so7987417pgu.13
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 04:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ab8o2nPGdE8bnf0LA3qbabJWv4jn3emYdoE+fNSfqxw=;
 b=IoB0ZEdX/hknjXqdON8/n4h8CPhLBxYL5QvUfvcElIEieMPw2zn85+JnDD7JD/jtKM
 KqnqllJQdOk70ia7DrF5RNALrigLThNMWpQYZBHVFCft7ZdstokVmwucJItbyQyU5lgo
 wKO/gnDE+yFn+31zkdTc+zSCRZnDzcEY3hLKqiIUGeTVJKAml4SRl22YlNZrUsokkWAu
 HyRxm7BdMRwhN0Qnu3/NLZv5WPKNB4VQ4Y7onPov8CzYwq6+w2X3QNMm3bejXrwru/IG
 3W4vspkuQRYSBCHz3L3+6kqniqES65phLG/DCNKaEG6IN2hllmEZdjDwtFoc+UO0DKvf
 camw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ab8o2nPGdE8bnf0LA3qbabJWv4jn3emYdoE+fNSfqxw=;
 b=WyoiG/ihWG+ow7LP/bmL2KjIRg1kzG8ZPsaOq/RLJI1xvY10IH/z+BSfpQWYyJJxlP
 k5WghG2rJt/oLEnZ1FrNJdxJWLy1RH4Z1vwWHVqKwoZiM5WOZ/TZ0i9iPa12NalBgTae
 TzxrLK+pGi2OTH0p9txdTYRbC9GkHxD/egSSG57/Gqy2WHmWtYls5vXF1S6+10OV1KQa
 8QsTrphY2NaFz52Qc32IHnx4xca6/0d/7M5+i+Q1pYpySokA+XDoNJKiqYZax5g4SNDA
 T8k/CnBRUJLyssaPK8FpuXmgwem4ODpSaUnH3rlLELJNIpwYosCr2e2AehqtJ5gIKi1j
 HGuQ==
X-Gm-Message-State: AOAM531vRkknqFX0bwjjpvqIAC0+PoP/JP7ZP4agFST06DLMWxGvvJIY
 +Qiuc1P+ypQvwBqOZ2MDM+fE9gbLKEs=
X-Google-Smtp-Source: ABdhPJxaLahvrHInINhZhV1gz/6cVSkEzOnlNKTuFwDiM+46Y7pPCLa/5J777pXM/zPY2RFPZWGGAQ==
X-Received: by 2002:aa7:8ecd:: with SMTP id b13mr20806974pfr.297.1592824031518; 
 Mon, 22 Jun 2020 04:07:11 -0700 (PDT)
Received: from arch.hsd1.wa.comcast.net ([2601:600:9500:4390::d3ee])
 by smtp.gmail.com with ESMTPSA id j10sm6284217pgh.28.2020.06.22.04.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 04:07:11 -0700 (PDT)
From: Deepak Rawat <drawat.floss@gmail.com>
To: linux-hyperv@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 2/2] MAINTAINERS: Add maintainer for hyperv video device
Date: Mon, 22 Jun 2020 04:06:23 -0700
Message-Id: <20200622110623.113546-3-drawat.floss@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622110623.113546-1-drawat.floss@gmail.com>
References: <20200622110623.113546-1-drawat.floss@gmail.com>
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
Cc: Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 David Airlie <airlied@linux.ie>, Haiyang Zhang <haiyangz@microsoft.com>,
 Michael Kelley <mikelley@microsoft.com>, Jork Loeser <jloeser@microsoft.com>,
 Deepak Rawat <drawat.floss@gmail.com>, Wei Hu <weh@microsoft.com>,
 K Y Srinivasan <kys@microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maintainer for hyperv synthetic video device.

Signed-off-by: Deepak Rawat <drawat.floss@gmail.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f437f42b73ad..102f734b99bd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5316,6 +5316,14 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/himax,hx8357d.txt
 F:	drivers/gpu/drm/tiny/hx8357d.c
 
+DRM DRIVER FOR HYPERV SYNTHETIC VIDEO DEVICE
+M:	Deepak Rawat <drawat.floss@gmail.com>
+L:	linux-hyperv@vger.kernel.org
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	drivers/gpu/drm/tiny/hyperv_drm.c
+
 DRM DRIVER FOR ILITEK ILI9225 PANELS
 M:	David Lechner <david@lechnology.com>
 S:	Maintained
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
