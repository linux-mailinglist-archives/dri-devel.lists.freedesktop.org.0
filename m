Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PpqF5cbjWmkzAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:15:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD3D1288B4
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:15:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA0C210E6A2;
	Thu, 12 Feb 2026 00:15:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SH9oef9J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f66.google.com (mail-oa1-f66.google.com
 [209.85.160.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9FA10E685
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 00:15:00 +0000 (UTC)
Received: by mail-oa1-f66.google.com with SMTP id
 586e51a60fabf-40ea611d1a4so641731fac.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 16:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770855300; x=1771460100; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RCYC336WoUNdVp8/EmNZcTjPfopk7zVSApVc86osLdY=;
 b=SH9oef9JCQg8oHUEbsXiN/ujpgiy6JqD3H1VpNjfag4SQFN+WuqSbjDJlRs3QJnwZY
 gr3XNfVtNDIExSv0h9hhfVcrZyxCFNAC+fO18RHP1GpQ+vzK/rWr7zy6usCKhtthWnI+
 2/P3wSjPNj/jCb25dxvqiErnGlwlwO5sAEd3zGo1++aL3+0+XMQhLHNtf/Kgsy9v0z8g
 3IeXIUZMI9ocQz9ET0mQiSWKBg/pAZ7J/JChDuOEk3CFQXQ7oQyBGTweh/EaUQwlnjZD
 wJkYuAkDDVUDsMM/hi2VsA40tOtfaexcBGRMljgkzXotO+M+BfCbMweFQOjnVOD8qNFs
 901Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770855300; x=1771460100;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RCYC336WoUNdVp8/EmNZcTjPfopk7zVSApVc86osLdY=;
 b=kiaL7SULzVgMxDQ1Iw0KbQrGMosasa5vK9u31fxB0TXfduAKfo+crsEAdn1gplIgRe
 96IOXBI9ggcca4M/whmW9DxBomTFfEL9KRq67BUCUv8dLGAgII7cDU2wAmuZp3p0btJ5
 u0y9dGk6Z10XYJAAaNUT8jNdrOF/NDMc2Zvz/QeIvjJ6Jb7oLuEl7fUF1Hfxie3W+pzy
 A6IO0mG4NlbhzjORl8r0j2o2rCRFRVPCqYgoLOtX4kn9EFtl/hH/d164mJaH5LspS6sI
 AcC9W2F+5hS8pJqtvA8mW4h6Mn4IQCXRMEYKBXo3RYewENNDp68Kqina+KiLyIgh1c0C
 7zKA==
X-Gm-Message-State: AOJu0YzZxGLSbNW/Z4IYctGs3z1bP3Xu+HX9jTdm5t6m6RZbEJ9FpvIb
 UtSeqtIx4g5t/WtfoXte5VRHlv1fiy/iRK87x6lmPB25U9xlwIiIc6Ko/8aRwwnM
X-Gm-Gg: AZuq6aJmsbF0BQX9U4L6evhEWUvaJAuKKOoyQodDRd7JcusPsMhWOh2RUZJZ94Kofmu
 gi4xzHOao3sfpvFxqsk5WVpmNuCvy2TPhDraGuMt0aldxxBB4JAFOEHmdOL6VvqJ2/xMVzDgblX
 NDc1YYob3kxG9S5eIdfUkJInWSP9Sju9hL1BORqydXA0S4P07yyUmyXcECSxV55YtIJSIBzn40L
 v6Jj0XZ+M6zFtHZWqcQTo7AEO6pO2ZTLpUlEkj70Gd17IlvRzBuqQM22LDeq8MWNBptWIC24yZi
 eUvadOF6ruhL9mTWIZG7fCOpdlj4RRDxpKn74El2I7afJMGeUp+dUKZwx1wHHZelyjBJeJgGmeV
 dXBOgHVNHhcBDWBBW961xLkACSvdJmV0qsAMLxDMVY45vjQg+ZqlZMI0/3D+Mam+zqiC9rW36UF
 FXZIIabtPzjMlWENFws3Yf6yyFL0tuFxdT6LH4owW//aUJeQe5KF80
X-Received: by 2002:a05:6871:8314:b0:3e8:8e56:671e with SMTP id
 586e51a60fabf-40ec7329fc9mr547424fac.54.1770855299706; 
 Wed, 11 Feb 2026 16:14:59 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-40eaf1062ffsm2331939fac.13.2026.02.11.16.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 16:14:59 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx-trybot@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 44/61] drm-dyndbg: add DRM_CLASSMAP_USE to virtio_gpu
Date: Wed, 11 Feb 2026 17:13:39 -0700
Message-ID: <20260212001359.97296-45-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212001359.97296-44-jim.cromie@gmail.com>
References: <20260212001359.97296-1-jim.cromie@gmail.com>
 <20260212001359.97296-2-jim.cromie@gmail.com>
 <20260212001359.97296-3-jim.cromie@gmail.com>
 <20260212001359.97296-4-jim.cromie@gmail.com>
 <20260212001359.97296-5-jim.cromie@gmail.com>
 <20260212001359.97296-6-jim.cromie@gmail.com>
 <20260212001359.97296-7-jim.cromie@gmail.com>
 <20260212001359.97296-8-jim.cromie@gmail.com>
 <20260212001359.97296-9-jim.cromie@gmail.com>
 <20260212001359.97296-10-jim.cromie@gmail.com>
 <20260212001359.97296-11-jim.cromie@gmail.com>
 <20260212001359.97296-12-jim.cromie@gmail.com>
 <20260212001359.97296-13-jim.cromie@gmail.com>
 <20260212001359.97296-14-jim.cromie@gmail.com>
 <20260212001359.97296-15-jim.cromie@gmail.com>
 <20260212001359.97296-16-jim.cromie@gmail.com>
 <20260212001359.97296-17-jim.cromie@gmail.com>
 <20260212001359.97296-18-jim.cromie@gmail.com>
 <20260212001359.97296-19-jim.cromie@gmail.com>
 <20260212001359.97296-20-jim.cromie@gmail.com>
 <20260212001359.97296-21-jim.cromie@gmail.com>
 <20260212001359.97296-22-jim.cromie@gmail.com>
 <20260212001359.97296-23-jim.cromie@gmail.com>
 <20260212001359.97296-24-jim.cromie@gmail.com>
 <20260212001359.97296-25-jim.cromie@gmail.com>
 <20260212001359.97296-26-jim.cromie@gmail.com>
 <20260212001359.97296-27-jim.cromie@gmail.com>
 <20260212001359.97296-28-jim.cromie@gmail.com>
 <20260212001359.97296-29-jim.cromie@gmail.com>
 <20260212001359.97296-30-jim.cromie@gmail.com>
 <20260212001359.97296-31-jim.cromie@gmail.com>
 <20260212001359.97296-32-jim.cromie@gmail.com>
 <20260212001359.97296-33-jim.cromie@gmail.com>
 <20260212001359.97296-34-jim.cromie@gmail.com>
 <20260212001359.97296-35-jim.cromie@gmail.com>
 <20260212001359.97296-36-jim.cromie@gmail.com>
 <20260212001359.97296-37-jim.cromie@gmail.com>
 <20260212001359.97296-38-jim.cromie@gmail.com>
 <20260212001359.97296-39-jim.cromie@gmail.com>
 <20260212001359.97296-40-jim.cromie@gmail.com>
 <20260212001359.97296-41-jim.cromie@gmail.com>
 <20260212001359.97296-42-jim.cromie@gmail.com>
 <20260212001359.97296-43-jim.cromie@gmail.com>
 <20260212001359.97296-44-jim.cromie@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0FD3D1288B4
X-Rspamd-Action: no action

virtio_gpu has 10 DRM_UT_CORE debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index a5ce96fb8a1d..aea4c117b006 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -49,6 +49,8 @@ static const struct drm_driver driver;
 
 static int virtio_gpu_modeset = -1;
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
 module_param_named(modeset, virtio_gpu_modeset, int, 0400);
 
-- 
2.53.0

