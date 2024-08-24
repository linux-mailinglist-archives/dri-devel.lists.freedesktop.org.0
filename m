Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4355595DD0B
	for <lists+dri-devel@lfdr.de>; Sat, 24 Aug 2024 10:50:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E51210E138;
	Sat, 24 Aug 2024 08:50:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=foxmail.com header.i=@foxmail.com header.b="GPsA3JHy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out203-205-221-205.mail.qq.com (out203-205-221-205.mail.qq.com
 [203.205.221.205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F6C10E0FE
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Aug 2024 08:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1724489028;
 bh=Nr5CwV8SDFTHEbQ4fOfilDtU2d/P9Nj2M/Pw6Z9L6I4=;
 h=From:To:Cc:Subject:Date;
 b=GPsA3JHybdVdYwc5tGqUKFELt5KI1x4ekeZIiScBY8eAdZRKqm84Ba+cP+LqkBxC6
 OCfrexvtY223sw8zyOcob15jZgHKtDfUM9KE8UfWFaiXfKpw1VJpqJ/7ahBxseVtMo
 uuvUpK3Bp40MEpVPSn3nepA/ddOWJt11LI5Y4Pxc=
Received: from localhost.localdomain ([171.223.167.119])
 by newxmesmtplogicsvrsza29-0.qq.com (NewEsmtp) with SMTP
 id 541056CC; Sat, 24 Aug 2024 16:21:01 +0800
X-QQ-mid: xmsmtpt1724487661t6xau541p
Message-ID: <tencent_6EF2603DCCFAD6A8265F8AAD9D6D5BCB9309@qq.com>
X-QQ-XMAILINFO: MDbayGdXPuoeW02xbhina/QJPzUrVbZYEy0kN2bsN7d6y24gh4666/EdO6aIh6
 UgwBC14RD5+UupUY+zdWlpYq23z+y0mvb8mzP16HKEViSrzCvv20RGf59V4+YNkHX5Zoa4EY91TL
 h5vPBXASMTItgda6Iy3Xr2PjHcLaIOVDiihgCOuWn/TBbAboXJR0Fu7Ocf3SGeCJaA8cAG0qa2ep
 EgAhLyHCKeBkNjkGPrbLlqtgRb84qbIDnzv94r97G4UvoAjvxdoQkEu/fe6ehfE6kpWo1puVX6le
 Mo9/8uAJgbnIzWIOaY2tL0F6CTF89lmwRQPdpbB7hZEy9mjg7jHkKaUa5KLaDZ4WZfYe5yoIdyFM
 5OIW3VHvd+ycNbZdHMzTCaCApbs3BHgMOgCgORnbz6aUckKut7MEf9AV2GyJw1Z7juL89NsVZEZH
 PDdFUe8+zX9LN05voOfjavOuqN87HPHwm93csQ5GR3PYCNmg7VC5n0jrvYaaf0AE/rW2X2+Nfmkw
 hMeOB3tsaC7oO7Ghpl9O1ecx1QjVtJWOrdTd2Hopnlbgfn1IR+/7/6RojGQjKOWRHy+zWgPyARxP
 bmYHhm0KBQHdGIRV6vQ3dqzyFF4YJN9julMWlILRUkMaVTZEVK0jD42Wrz7vMf/0aYNiQa1gkDN2
 F5vGQSwyXQ7WMVG/mM7S6I1YpTi/0NwEthI+BzxjGN5nfSm6b8NXuRN2+BPgm5gncY/iMDpyxoG5
 5ky66007Pu2wOxLKUnX6IrfByjL5eiIQ/Nsx0uB5qSTMc8KGiQVCI+TGsBX1UxHFzuVywrr4OPKZ
 uQNwPz2Y5zNiuj+sRjvDeCaHlDzwQ9D3bsA1FMkgeu+pUsyVR5pZaK/0D3oRYcr9psbRpO9ckzK0
 LpZyp8RziWuhpT8mUweeONVzeZ9XwrRpq8buGgMI/pPJVUTUp25A/BfYhIzZJMGpHg4+hrjMdTn2
 PTss6a7WBA2w8KwB4OmxWlElUDUF4IEFsGi/Bo2m0+TThxpGIGBzRTREydwDV2psT3ECeJ08E5D2
 YxE/MvRFmwkExMXgiT7zX/CwRnQ5j5uoWkA+DOyeblUcIfJtKvC1yhV9hLYf57GUvmdF+WyMyfS/
 5bZI23pIzmJhb6tv8=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: renjun wang <renjunw0@foxmail.com>
To: maarten.lankhorst@linux.intel.com
Cc: mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, renjun wang <renjunw0@foxmail.com>
Subject: [PATCH] drm/atomic: fix kerneldoc for fake_commit field
Date: Sat, 24 Aug 2024 16:20:14 +0800
X-OQ-MSGID: <20240824082014.26004-1-renjunw0@foxmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 24 Aug 2024 08:50:06 +0000
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

According to the context, the function description for fake_commit
should be "prevent the atomic states from being freed too early"

Signed-off-by: renjun wang <renjunw0@foxmail.com>
---
 include/drm/drm_atomic.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 4d7f4c5f2001..31ca88deb10d 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -460,7 +460,7 @@ struct drm_atomic_state {
 	 *
 	 * Used for signaling unbound planes/connectors.
 	 * When a connector or plane is not bound to any CRTC, it's still important
-	 * to preserve linearity to prevent the atomic states from being freed to early.
+	 * to preserve linearity to prevent the atomic states from being freed too early.
 	 *
 	 * This commit (if set) is not bound to any CRTC, but will be completed when
 	 * drm_atomic_helper_commit_hw_done() is called.
-- 
2.39.2

