Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAFD392C90
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 13:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A8E26EE7F;
	Thu, 27 May 2021 11:22:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE0576EE7F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 11:22:48 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id x188so328751pfd.7
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 04:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0S3o4TmqPj949RkfsbYV2YGOzI88SNqbU5TbO9tEHyI=;
 b=Ewvx779weTiJfXIMi9ZmWsDQf7Wppa8wKfBmQpnlGK1gYQbj5KDSbLnxSopg/5L4it
 dQGvJRIF/hZ8AIWUQCJS/91jYQPXbBgBKjW3T91ML7h5wBDr6ZSUoViY+VxKt5sELPqC
 IzQDAeEiusyysF525gytNL1LDNbk5Z68Dsa9pgyO46/54+xkQK1A6SHEJDyQ7MJdPQA5
 uJGE19pgZVDddAbSDtFGbIW+gwfk3pH6egMbt/5jsixw+VSXzzOlF1OcvPWzU/SFEtvs
 eB4zkf3bQOJ3aaDyr80HljWOhIc79KPCfOJPneQLAcckIvxh0lrHOHr7+fQD7EzWkFUm
 oDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0S3o4TmqPj949RkfsbYV2YGOzI88SNqbU5TbO9tEHyI=;
 b=I/bhg1OUyvVx2OnaZ14FYjizvfhmYX6JkkdNGupkh4XKoK/PyiUKAVDZxOS6n16KHq
 y1RgHxhetlAokXq3UgGalfGB8YpnYheyd55cqpfsK6Dt6gUc4g9jzXan58pHtWKAhGQz
 szh38vB06DEfqXSzJILWF/RkT0Q7YYFqTdzNooerSYjAx7zFgCEUE95sW+wyC5heBTFB
 dGFWGAlH/Zm8Ewf3FbdLs/cUYi2LGgZe6P4vrG0g75QgpJbr/4RW26kOuQXA8PFDMi3D
 HCwM44LAgLPyaInOHMTg1hjmpkzb4YlRUci71+pL3Lg/o/xXTx/UblNJjARYhaim/Sxd
 opPw==
X-Gm-Message-State: AOAM531p2NRDHWwrvDCtybYp7ko30Eu3FH/yPdmHKSPbCf2pYydFXexl
 e1vp5bHv7PAFvOrbOy9Zo2Qd9aUU7jwsiw==
X-Google-Smtp-Source: ABdhPJxJQGkbP2odIj6/7Bac4KaIs9VV0rlA86CrnvHHvaucePPTTXlbmYXd+wa4wV6FLGKk+IcYyA==
X-Received: by 2002:a62:5306:0:b029:2de:6ce0:5526 with SMTP id
 h6-20020a6253060000b02902de6ce05526mr2876882pfb.13.1622114568195; 
 Thu, 27 May 2021 04:22:48 -0700 (PDT)
Received: from arch2.localdomain ([50.47.106.83])
 by smtp.gmail.com with ESMTPSA id c11sm1730325pjr.32.2021.05.27.04.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 04:22:47 -0700 (PDT)
From: Deepak Rawat <drawat.floss@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linux-hyperv@vger.kernel.org
Subject: [PATCH v6 3/3] MAINTAINERS: Add maintainer for hyperv video device
Date: Thu, 27 May 2021 04:22:30 -0700
Message-Id: <20210527112230.1274-3-drawat.floss@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210527112230.1274-1-drawat.floss@gmail.com>
References: <20210527112230.1274-1-drawat.floss@gmail.com>
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
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 315120c4124d..a4fdde4bb250 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6084,6 +6084,14 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
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
-- 
2.31.1

