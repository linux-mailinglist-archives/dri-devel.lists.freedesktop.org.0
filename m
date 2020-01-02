Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFDE12E4C0
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 11:03:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3D96E02F;
	Thu,  2 Jan 2020 10:02:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692F76E02F;
 Thu,  2 Jan 2020 10:02:58 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z7so38615852wrl.13;
 Thu, 02 Jan 2020 02:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/h6NXyD6aVKL5bx8Xk7zLnuH4ugoW90Sl0nahNHK5jE=;
 b=U7I8i4xeYif2uypX4KDfROp0j+MUuq0bTvsx90CwzEy0ej2aUbqTEzGTDGoDoD1lMl
 EEnplWcR3tc6csYkgiVANSuMEQfq1kG4GbnD2/dagsGEVaOrcAkj5ZJ6E6GwL9xeW6k/
 Uk13PISUdBZjY57xpw9gNHeTnZ5hzRWLqb9KbOKtz9iV+I8Uren4+8xzmr39BHHt6/uC
 IJpRohJROAaQGvSBADPoUyyjfkO4A+BxMPCuWTc8I/nr2cj5v6Lo7LeIRDuCq4zLH5hR
 26om24StYh/dVw2/hjo1FHaDkKpNAhOKsIDXgRS1DIsKTw4F9uXApP9x/WO2YO96BHQF
 oOmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/h6NXyD6aVKL5bx8Xk7zLnuH4ugoW90Sl0nahNHK5jE=;
 b=NQQKgmY3glj7fSDt3RIhC+lgmDg3fTsW43GrXzf31FoJJXNa65HIYTRZ28Q0eQ862t
 MjsX6mR1URxKaIF7rKT3/TD9Urk5RK4S0LhVlpNo0aFzTBzqN+3gsMDznJwnBKA7SMHo
 Ml/lNAdd20d/7AsUUMwcJ97Ywnm5Yt8m+3NJ39A7Y4wnBjv9WBJ7zK9gGHzXShEbcGqk
 Gd+6ZJkir86vj7PDULbotcNeBrxphi88GRaTTGQrGBsYwPn1Jx1gIBHmyIAyJ4kcvTFG
 35kgDsyU1kkfpW5qTD1f6xhgO0O12lMs317TOuGnSWk58p2lwdETn3l24iBD5WKgc0H9
 mcOA==
X-Gm-Message-State: APjAAAVhLkfXKti3zjERsXAyBX8xPMZhXDVwR/v/Vi+JKSMIyWQ1FvPP
 0ZPuCGnMKbDqr75Ny5uPpuA=
X-Google-Smtp-Source: APXvYqwuWzsCGpjQcNQa5lHuh7FuWlPCZt+dlf5F5Z/vvbfkuGlWFhtrM+c4T01AWO6cbZ1Pxh7SVw==
X-Received: by 2002:adf:e6d2:: with SMTP id y18mr84428535wrm.262.1577959377141; 
 Thu, 02 Jan 2020 02:02:57 -0800 (PST)
Received: from localhost.localdomain (62-178-82-229.cable.dynamic.surfer.at.
 [62.178.82.229])
 by smtp.gmail.com with ESMTPSA id r6sm55418683wrq.92.2020.01.02.02.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2020 02:02:56 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] drm/etnaviv: add hwdb entry for gc400 found in STM32
Date: Thu,  2 Jan 2020 11:02:20 +0100
Message-Id: <20200102100230.420009-7-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200102100230.420009-1-christian.gmeiner@gmail.com>
References: <20200102100230.420009-1-christian.gmeiner@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The information was taken from STM32 glacore driver hw database.
The entry is named as gc7000nano_0x4652.

Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 31 ++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
index d1744f1b44b1..8495b041a3b7 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
@@ -6,6 +6,37 @@
 #include "etnaviv_gpu.h"
 
 static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
+	{
+		.model = 0x400,
+		.revision = 0x4652,
+		.product_id = 0x70001,
+		.customer_id = 0x100,
+		.eco_id = 0,
+		.stream_count = 4,
+		.register_max = 64,
+		.thread_count = 128,
+		.shader_core_count = 1,
+		.vertex_cache_size = 8,
+		.vertex_output_buffer_size = 1024,
+		.pixel_pipes = 1,
+		.instruction_count = 256,
+		.num_constants = 320,
+		.buffer_size = 0,
+		.varyings_count = 8,
+		.features = 0xa0e9e004,
+		.minor_features0 = 0xe1299fff,
+		.minor_features1 = 0xbe13b219,
+		.minor_features2 = 0xce110010,
+		.minor_features3 = 0x8000001,
+		.minor_features4 = 0x20102,
+		.minor_features5 = 0x120000,
+		.minor_features6 = 0x0,
+		.minor_features7 = 0x0,
+		.minor_features8 = 0x0,
+		.minor_features9 = 0x0,
+		.minor_features10 = 0x0,
+		.minor_features11 = 0x0,
+	},
 	{
 		.model = 0x7000,
 		.revision = 0x6214,
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
