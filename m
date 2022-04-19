Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8268F506FC5
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 16:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E9E10E5F5;
	Tue, 19 Apr 2022 14:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8525C10EFAD
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 14:08:48 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1650376796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bbuiKIXU9Y3lzbKjNQ9FewzTFV/RXsoBT5tR1UAOnzY=;
 b=AGOVAP2SzUy3vDds+Pbq0TKdXHOA7ZH9R76SU3W1AUBbivHJbmi+tmUNKNPRzPlQqrkH6s
 D3Y5jRKeIfEkbvK0hrRYpq6pjSXVHzn0CFN+eSVCWF31KeXAAYisI2NJnBI7vamC0EgvIO
 AE6QW/BGQ7LYFqxyPLdtB/TWtSWW+Ws=
From: Cai Huoqing <cai.huoqing@linux.dev>
To: cai.huoqing@linux.dev
Subject: [PATCH 1/2] MAINTAINERS: Add the driver info of the NVDLA
Date: Tue, 19 Apr 2022 21:58:59 +0800
Message-Id: <20220419135908.39606-2-cai.huoqing@linux.dev>
In-Reply-To: <20220419135908.39606-1-cai.huoqing@linux.dev>
References: <20220419135908.39606-1-cai.huoqing@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The NVIDIA Deep Learning Accelerator (NVDLA) is an open source IP
which is integrated into Jetson AGX Xavier. After adding the driver
support for it, I add the driver info of the NVDLA to MAINTAINERS file.

Signed-off-by: Cai Huoqing <cai.huoqing@linux.dev>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 452f3662e5ac..0e5464d61a6d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6485,6 +6485,13 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
 F:	drivers/gpu/drm/panel/panel-widechips-ws2401.c
 
+DRM DRIVER FOR NVDLA
+M:	Cai Huoqing <cai.huoqing@linux.dev>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	drivers/gpu/drm/nvdla/
+
 DRM DRIVERS
 M:	David Airlie <airlied@linux.ie>
 M:	Daniel Vetter <daniel@ffwll.ch>
-- 
2.25.1

