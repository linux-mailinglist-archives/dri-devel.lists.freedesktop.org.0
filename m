Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E82FE2E8688
	for <lists+dri-devel@lfdr.de>; Sat,  2 Jan 2021 07:03:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD83E89811;
	Sat,  2 Jan 2021 06:03:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10E0589805
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Jan 2021 06:03:52 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id c79so13278323pfc.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Jan 2021 22:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o0YCDQ+4gjTAOk8HBIHftWy6uaxr3xRhCzqiqfq56xc=;
 b=NkcCv9I3Hd24ecxaTKf30LYybo0NeFL87J5LzetUovb3XZ0qGJHMsYtJVG36o5cqbL
 7vWSdEKtR2nRq1DtiPzSD88gTODF3F4ttVRrFeAH6GYdfAsw1si3qdelpn1aDalQLLDD
 CuzqmBHM8nOOm6pHlBR2RTqyMAenbos9AxXOCfuvkvfXpRYKmg8bx9oqVkXrpebpKdUI
 4iTKNooeLpJtfjS5QcHLWukn3GY6agsUZkWM7ABpjL5wpRDxuaR022B7vP9oUnBqrMBM
 PiNb7DJmyfp8WXbT6Kww7mWjuhZFuFu5eoo87wJSNcubXuxYLyEYQFdUqnNCS+CM8dYR
 p/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o0YCDQ+4gjTAOk8HBIHftWy6uaxr3xRhCzqiqfq56xc=;
 b=EcTGp+ThnrMe6DOPtl9DwWafjersE2YN8XChrh1OsBSm+IioZo6k1SvkH73Je27La5
 XKDV5HsNlGpj+wj5y/7oTSqZJW0xDnp5EJtayzrFe6ubpXcdfsQe3UcFSupn+XhVo5bM
 3bJWLUojw+Z/kW+KUbuwFVHId7OVwktKf43Sm/DbLO0gEODmf/DmpIFSyfWQvrqFY04l
 hNZbW3FJqpN6dKgHc3ni2xZ8CTB11FoUhqkeE1+s3YgTvF25dkU6TCgvny/hiV/ayAlo
 k/ix6YXvcB2yi8D8IYgIR/esSUkgClsQ+CChDC4huDrm0Rr3a6Zlv5huSP/Lb0aaDN7t
 junw==
X-Gm-Message-State: AOAM530cdZwuyVe/yVLuh8oSOrF6Gc6L5ujUIP1tCK2ipGsk/eoXzGyQ
 30dSrXdgFbyK9qG40zE+ECQ=
X-Google-Smtp-Source: ABdhPJxw6/Er9BBRXlxfuHfbkZ4b+O1rW4C7bnIkAowcsBNLP4C8Of84IFg8ye6O+6E+pQDNN1yaMA==
X-Received: by 2002:a65:6a43:: with SMTP id o3mr27740873pgu.296.1609567431473; 
 Fri, 01 Jan 2021 22:03:51 -0800 (PST)
Received: from localhost.localdomain (50-47-106-83.evrt.wa.frontiernet.net.
 [50.47.106.83])
 by smtp.gmail.com with ESMTPSA id q23sm55412110pgm.89.2021.01.01.22.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jan 2021 22:03:50 -0800 (PST)
From: Deepak Rawat <drawat.floss@gmail.com>
To: linux-hyperv@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] MAINTAINERS: Add maintainer for hyperv video device
Date: Fri,  1 Jan 2021 22:03:36 -0800
Message-Id: <20210102060336.832866-2-drawat.floss@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210102060336.832866-1-drawat.floss@gmail.com>
References: <20210102060336.832866-1-drawat.floss@gmail.com>
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
Cc: Wei Hu <weh@microsoft.com>, Tang Shaofeng <shaofeng.tang@intel.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 Michael Kelley <mikelley@microsoft.com>, Deepak Rawat <drawat.floss@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>
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
index 7b073c41c3a0..e483fd32a684 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5515,6 +5515,14 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
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
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
