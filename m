Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 365C42830D0
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 09:22:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26EF26E157;
	Mon,  5 Oct 2020 07:22:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE3E76E15D;
 Sun,  4 Oct 2020 06:49:34 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id c22so6021469ejx.0;
 Sat, 03 Oct 2020 23:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=wiRu/UNA0pjlrtebSlMYi06x0VP2UdPXkT2G8Mphkow=;
 b=HfuxUtnUsdgWaV/IejQpBLhZK4DHvH7NTScAIhboOCXBEFSb6p7xTUDQgHNwsoHaTm
 mK0DwcWi2+vAgTtHWu4eGnYZ1KxIDMIr0nQvdLXPDNup3ZY/yCBBKqQUqv+B5RqfpqGN
 Uh50R6W/f0DRNU6QKqqs+l+vh/pWYCuUjQspigeNZywYJJ2hDkhMvuRzwSLCC877/47Z
 kLAeUQzUR8ByVehoQlSHYMsbnXMxRKAGQB4QbnffuYDc0SX42s7r3kseOdab1mvRg2da
 hJjLM87djzOLAOsY5Mg8h6Meso9nKpVY+E8ktIWVesCfULLqo1smeieB9W63OQ1ZiNFy
 RbAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=wiRu/UNA0pjlrtebSlMYi06x0VP2UdPXkT2G8Mphkow=;
 b=ZwCvSV4vaXSzZ+9fvFkzRWTAZ8PsdIbu2AY4dn9FYzmsPUYcdYVwiqd13kyOEQCdve
 DREZb+Kf36Wtc0UohjbywQHUAktTI3XMQypHtREXMSe0s6itJAUnmlV1Ey4Ku+eA/Tqh
 dBpRhgWSxCHVB5V28VDnYLKs0vH+ouahZLbWxtaeRd20Nx9ZnFM7ksH/TAYFfTDqcYep
 fyJRYyKUbWHmXnbqZ0ZIFLY0BZaiJ51s07ZHtujqSeK6TdTWn4wIiCThtSJModyutbey
 tCEUBLbS8TaNB+02E7lJfCWCdWdjjc8VuPFxuJUiNGq/RIzDVVl0ShjGu7H3DhRIAjCy
 MPqA==
X-Gm-Message-State: AOAM532xYRjz5jGmS/qKiZKAcomg+HeiKCy2T90XL0AZd+vdNgEZnE2r
 OXfou3BlLy3Xt6tZ7JnH/24=
X-Google-Smtp-Source: ABdhPJz14hUFLw7fCqVAA9pOdA4Sq3LEc7INoEX7Lx5q+AmDdf1Cl+/cjL3SumAP0xn9ifG93rM2ng==
X-Received: by 2002:a17:906:af10:: with SMTP id
 lx16mr987391ejb.400.1601794173230; 
 Sat, 03 Oct 2020 23:49:33 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2d26:f700:8d52:b46b:d125:e62a])
 by smtp.gmail.com with ESMTPSA id x12sm5840602edq.77.2020.10.03.23.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2020 23:49:32 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	Huang Rui <ray.huang@amd.com>
Subject: [PATCH] drm/amdgpu: remove unintended executable mode
Date: Sun,  4 Oct 2020 08:49:17 +0200
Message-Id: <20201004064917.17941-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 05 Oct 2020 07:22:30 +0000
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
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Besides the intended change, commit 3437f5f6c979 ("drm/amdgpu: add gfx
support for van gogh (v2)") also set the source files gfx_v10_0.c to be
executable, i.e., changed from old mode 644 to new mode 755.

Set to the usual mode for source and headers files. No functional change.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on next-20201002

Alex, please pick this minor non-urgent cleanup patch on your -next tree.

Huang Rui, please ack. You might want to check your development environment
introducing those executable modes on files.

 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 mode change 100755 => 100644 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
old mode 100755
new mode 100644
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
