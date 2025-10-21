Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 201A5BF82EB
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 21:01:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5505610E0A4;
	Tue, 21 Oct 2025 19:01:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="hjEHF3yT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f228.google.com (mail-vk1-f228.google.com
 [209.85.221.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 843C510E0A4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 19:01:34 +0000 (UTC)
Received: by mail-vk1-f228.google.com with SMTP id
 71dfb90a1353d-54a8514f300so3720909e0c.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 12:01:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761073293; x=1761678093;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:dkim-signature:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0kx5reonHqR3Cn6qkmeE8UZphBwqn6mOFGds4po5E6c=;
 b=RfJLGjTUszz0rbVoYEgFfp+5de335mjUHpGKEYJjAy0v8OUpg4IMotecjVakYvdVn8
 vpXdCM6osDQ7K7fOSitMHUPNriIRsttlQ7NLwydFjUUrKwyJnDUIdi6EZyqcjwZROnhL
 Vj3/Gb84y3f2CyHfNLvOb1lnmPz04P0zaGVoqhXQM+mhz7UBot/AcazqRFwVVAVcWYys
 I8f1jxfJROQZuXJuPeC6ApGa6eF3JpcEOFv2NJdF3NHQBaotunrOyHWFh4hWpQmTkeUT
 LB5tkaOufHH4nMl5kNFGIVha1kmswHHMvjJvDzFJJ320Ap44bgs/sRiio1snbR14og+0
 e02Q==
X-Gm-Message-State: AOJu0YxoCGxykRW0kes18CQQCBZdJXREFmXs9i8MhL9+21cuUtQkMATC
 uRzMXhdaeB4P2BexPYevhmnDbuRa9LS1TuO1nbWJtrXuMrI6gFagN3qElSk/iCHrq2H/FwU7QLk
 s5eqY0V0uFUgKfkIKW4FzGAVmefPtQLuLkPhGx2kCbqkkXUuDcu1P7pp3kPUnszLFEqCBhIcthk
 VkvgAkaTib3AK7kmt+cXPPeXlTVFkmbibAFIbsmCg4C9eTFzIDcM20CUG5CiJIumRw9i0hJmGUn
 CvTu2Ki0mAbwU4xVJqk
X-Gm-Gg: ASbGncusw1V8dBWSkg31RIybh9uGBzGnSXXB9DMXEUpzqwiusWv1qL6azs+wD2AjcY6
 aq/9rgsyTozj+qZ75V7FCQ9ERqiDRCIYX2cpHsJmbc3ernNslHg27p3N3A+QpKVXk/XMHqY1qN+
 GxrfU3iaN+PHKpX7dqDSP5RQest2AdzOcFE7hGUOmeQv1VFGOC3IrlLHb1JrEjMHpZA/w8xtXgG
 3PCtJ2JN6GSXhYd5If7ArCUSseXv7ENcNxpH4v+sa0eSg2x4Dlsz7tdecToJ7sEVTvZXrdnW5Js
 jT1fX9AZ6O8tYRnsFMOXRZy9GqoGK0yMD7LqXHxhEz9EUuKwdCW3Hxc+yFsPk654Fnu/0Cg3Phz
 M1/d0av8HeHN0TjBarso7Ux9kXRp/XqkUcFAavq8AL73PHtKFhArWAPIRKVkh3r+1T1hCqwHYRd
 M/HHjLOtK4YlvwT3SK+iK4GM6BS4rhq3oqLA==
X-Google-Smtp-Source: AGHT+IGKBvXujViu1qX9HkzYT3jSBm1wXq9aQdi95NuQwJSGlFLqhQWy2ks5cOl7NGNUsRkVKvs9pe3yH4c3
X-Received: by 2002:a05:6122:308e:b0:556:40b2:270c with SMTP id
 71dfb90a1353d-5564ef152c3mr5662947e0c.12.1761073293046; 
 Tue, 21 Oct 2025 12:01:33 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
 by smtp-relay.gmail.com with ESMTPS id
 71dfb90a1353d-556620659a0sm1532837e0c.6.2025.10.21.12.01.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Oct 2025 12:01:33 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-87c1558a74aso316928586d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 12:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1761073292; x=1761678092;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0kx5reonHqR3Cn6qkmeE8UZphBwqn6mOFGds4po5E6c=;
 b=hjEHF3yTcHqowh+7z+50qgg7RFcKh1kIr0n6FZRuMzRedz2cpyfM/LdWgXfcky/t3f
 gj5RjY1x2/FUD7JW8/MKyHkloSFz2NItyocpUQ0ufCGwH9V1vRlXvgLdmRxJzxbcKUez
 ZNJodngK/2I2UDjvarseIJfR2OxqLSmLRwKVo=
X-Received: by 2002:ad4:594f:0:b0:77b:69ec:79aa with SMTP id
 6a1803df08f44-87c2055e49amr209483196d6.11.1761073291984; 
 Tue, 21 Oct 2025 12:01:31 -0700 (PDT)
X-Received: by 2002:ad4:594f:0:b0:77b:69ec:79aa with SMTP id
 6a1803df08f44-87c2055e49amr209482516d6.11.1761073291375; 
 Tue, 21 Oct 2025 12:01:31 -0700 (PDT)
Received: from plasma.dhcp.broadcom.net ([192.19.144.250])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-87cf51fc2a5sm74339736d6.7.2025.10.21.12.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 12:01:31 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 maaz.mombasawala@broadcom.com, security@redhat.com,
 Ian Forbes <ian.forbes@broadcom.com>, Rohit Keshri <rkeshri@redhat.com>
Subject: [PATCH] drm/vmwgfx: Validate command header size against
 SVGA_CMD_MAX_DATASIZE
Date: Tue, 21 Oct 2025 14:01:28 -0500
Message-ID: <20251021190128.13014-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This data originates from userspace and is used in buffer offset
calculations which could potentially overflow causing an out-of-bounds
access.

Fixes: 8ce75f8ab904 ("drm/vmwgfx: Update device includes for DX device functionality")
Reported-by: Rohit Keshri <rkeshri@redhat.com>
Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index b00818aaf94b..41a77dce99a2 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -3668,6 +3668,11 @@ static int vmw_cmd_check(struct vmw_private *dev_priv,
 
 
 	cmd_id = header->id;
+	if (header->size > SVGA_CMD_MAX_DATASIZE) {
+		VMW_DEBUG_USER("SVGA3D command: %d is too big.\n",
+			       cmd_id + SVGA_3D_CMD_BASE);
+		return -E2BIG;
+	}
 	*size = header->size + sizeof(SVGA3dCmdHeader);
 
 	cmd_id -= SVGA_3D_CMD_BASE;
-- 
2.51.0

