Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFCC31C4A6
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 01:41:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F0F6E0D7;
	Tue, 16 Feb 2021 00:41:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9AB76E11A
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 00:41:23 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id o7so5205660pgl.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 16:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vGczsg5KtJIx2JFpy2jBDe0bJ7D0bN5X+ltVXjZ+hqM=;
 b=ZKJ4OkFUJ7nB99ZO/zizi8ub1RMycd1WU1Yu8ghonyQ8zxyeOsMzZK9dI84DNJKgD2
 eTKDdPZoP2JV1nTF+ZSBVrAu9ub4ERSfC96jCraEw9MUs72P4qgt5HQcEyX1YICL9nug
 Cz9FbmhXsVPU+Zm+sOPuMYxq3HMDyA/r7z/Zz6fBvXF2SNbVE5xIrfAxk6J9j4f9nHXJ
 IlGiJlDtjkR5YsI0ANFzva1DKPtACxy/PCmCLQPROLYCa6Uum15NuV7VVTeqoa0wPSuY
 BPbqoF9z9XXBQvJeKenl7UJi+19TBUKAMpi41XSWKYTtR0UKuKzXB83jQ7+SxdjvL3QJ
 OSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vGczsg5KtJIx2JFpy2jBDe0bJ7D0bN5X+ltVXjZ+hqM=;
 b=jAweP/xwN36oufRy9gDReTqZ3RWL1M0D2uwb2kMDeW/NkUB7WYj9y3/c9FsRWUIuW0
 rXZ787gpBcIxqPjaNTtRZgnSnybPmAILCT8NHl7y82XlVhg1YX0OnG49R3P5Zt+Hl6ll
 suPDxS9P5dJefOw1IeNBaCGtdj9WT48UKJfuHPhftg7GF0JLnqprGtPX0W7ynnTXWl8Y
 o0aSC8wtqwV+YRWiDyxBEWhTd+pu1tNMl9kCaVGuBr2qoL3YaHboZ17nRvxavXeAgPGV
 J6eaYg+Vn6R98Voaqor6eNJTDUesVcbxWxU+hmE3cyjncAj1bdT1Ovd2EL/lOrRh6KLQ
 3XNA==
X-Gm-Message-State: AOAM532Ujl1Ga7m3lsRJHjsDAC/vdffKFGg20pAiNoTt5eRzyFR6ldfC
 LMY0NK6qyUqmrpRNr5t8beM=
X-Google-Smtp-Source: ABdhPJw9d2Cr3M6gdB27qL7z8Roq79Ofyrullhc+gvaocdGjLkQLRGklmThZmp3k3K0Fw1aOgtikkw==
X-Received: by 2002:aa7:9d83:0:b029:1ec:b2e9:af94 with SMTP id
 f3-20020aa79d830000b02901ecb2e9af94mr3430697pfq.48.1613436083432; 
 Mon, 15 Feb 2021 16:41:23 -0800 (PST)
Received: from localhost.localdomain ([50.47.106.83])
 by smtp.gmail.com with ESMTPSA id m23sm18145282pgv.14.2021.02.15.16.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 16:41:23 -0800 (PST)
From: Deepak Rawat <drawat.floss@gmail.com>
To: linux-hyperv@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/2] MAINTAINERS: Add maintainer for hyperv video device
Date: Mon, 15 Feb 2021 16:39:59 -0800
Message-Id: <20210216003959.802492-2-drawat.floss@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210216003959.802492-1-drawat.floss@gmail.com>
References: <20210216003959.802492-1-drawat.floss@gmail.com>
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
Cc: Wei Hu <weh@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Dexuan Cui <decui@microsoft.com>, Michael Kelley <mikelley@microsoft.com>,
 Deepak Rawat <drawat.floss@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
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
index d6dd31cb5ad1..b4aaf1810c7c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6057,6 +6057,14 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/xlnx/
 F:	drivers/gpu/drm/xlnx/
 
+DRM DRIVER FOR HYPERV SYNTHETIC VIDEO DEVICE
+M:	Deepak Rawat <drawat.floss@gmail.com>
+L:	linux-hyperv@vger.kernel.org
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	drivers/gpu/drm/tiny/hyperv_drm.c
+
 DRM DRIVERS FOR ZTE ZX
 M:	Shawn Guo <shawnguo@kernel.org>
 L:	dri-devel@lists.freedesktop.org
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
