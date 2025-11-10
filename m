Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A3AC47F62
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 17:33:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E786810E2C8;
	Mon, 10 Nov 2025 16:33:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="UXplpd0U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com
 [209.85.215.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A5410E2C8
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:33:45 +0000 (UTC)
Received: by mail-pg1-f227.google.com with SMTP id
 41be03b00d2f7-b9ef786babcso2060770a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 08:33:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762792425; x=1763397225;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1KchH93cmRUPj23W0HELFyt1PyjfV4RGygBj+DnXIqo=;
 b=lxdXFiaRNmU1t36MJrOCDS5qYdvk9FMgzPgy8F2WyCb2yPxe6QSo+5EckBUuh4n04a
 I1rZFyx8KbvOCsCnBebZOzF6mQ+M5Z8r3qdoeJieBgjJyCe5NLigqs8txU9GeXJYUBrX
 RV2m9xkqXdsvRKhpMO8YHBXgIlY2YeXxYDSiE5t/6V/b2jU3QqZ9R4Hz6SLGCOKFup4e
 STfCh3QbG3wBF9ed/gdXbGXHSAljcAhcuo9hxMs2BLrMSTEhq+/oudkotBcgfEpbJI0T
 yg4Rs5fHGUFIiHkCjX9hHy6hEDi4TWRBvfR4ckZxpWgImawCaVrrSyBaMhXjOf9O5tcO
 HnfA==
X-Gm-Message-State: AOJu0YzX5moXSFH7ailRA+JeH+Qicq3PxzvyXSsbxZrOADGmrcgrCFnG
 G8uYue4//uafAwC+qaeswwwtwqUxjsqpuBnlePty/Yfb4qq6k2gxqskysiCY7CGJMnOvnZ4mE5M
 J7BsTRGDqdT1MKm210B8xc7EOuRDJVDrnBoQfWvgcNDIv3gDTaau2Pd55bO0/YLXvF9RR39IN3B
 9K1Zt4SKy7MU+gvhnJp4ivrgYvFw1/9nwJxjEqhMTBUhFUFrgo0J7O54ZKfMZkH0J4PUz/hLKTz
 pSX6XkUxw3G/q2XEocO
X-Gm-Gg: ASbGncv4IKyQnH5I/g4StrKj1ek1bXCbXm7C0W0EcXN/AXPB+Cgb1Xei7LiAPh3Vmps
 J9uxKqisFPfj1GeYxT2rZE3ljkXD/rrwphw3cJvOLxinuBgHM+7JB9VFXq/w+5bk0b/lQTZm9US
 w340oyu7COppmx5fPjo9U9nHM6GMqUCpD8FzSHm8/YVCPA7jKLWR9o7KbndFWurHcSFQZn5a40v
 f6X/ZzrCvpLI1uD2oONljUkziyjpyp0PWKrxF0cNP5wnY+A6hLBEM8glMrcB5493gYbG92a0ES2
 9Z9rlrGqfP7mYY+VrntXrZpIk8dQwN2SsEGAaUc0kUYb4gIHHLo76L72bH8mFr/Qd1R5qiDRXgM
 AAQpBY1lzRd0ZXjBE8Td6oo06VcBRIoPlMJwaMpteQSx/4U1bb4PeXmcjhkJ/eg9O8t+/9+LfRR
 RD9I+1PTFJVh9wMF6X1pQr/44fJpLeOEs=
X-Google-Smtp-Source: AGHT+IGIvVCI1ZoWzh3PfgJ7CafUA7ogWdweR+Nt3IOMiZ2AY77LXR0VKiEFDQY9UM6Lnx8SMEoYi0KrMAmb
X-Received: by 2002:a17:902:d485:b0:295:7454:34fd with SMTP id
 d9443c01a7336-297e56adac0mr133806885ad.39.1762792425258; 
 Mon, 10 Nov 2025 08:33:45 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-12.dlp.protect.broadcom.com. [144.49.247.12])
 by smtp-relay.gmail.com with ESMTPS id
 d9443c01a7336-297f2c7dc0dsm7148685ad.47.2025.11.10.08.33.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Nov 2025 08:33:45 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8a1c15daa69so1007156485a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 08:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1762792423; x=1763397223;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1KchH93cmRUPj23W0HELFyt1PyjfV4RGygBj+DnXIqo=;
 b=UXplpd0UaWRfCawPZGYgPlvrVHRMyZQtcqUOPF9QNWHy2Hp0D28vAz62rFEj4qv2Fo
 61PEQHeXAnPB+S6Gd5QySd+zYvhIcbDfueyJghP21UJ8HyhbG/LwVXJimnWLNOtnVnZ+
 yLhp9pkoj7p+ybMCRjn+Qj80b9H9IqlIL5Ytw=
X-Received: by 2002:a05:620a:1a20:b0:891:bcdf:83dc with SMTP id
 af79cd13be357-8b257ef2e10mr1094220985a.34.1762792423508; 
 Mon, 10 Nov 2025 08:33:43 -0800 (PST)
X-Received: by 2002:a05:620a:1a20:b0:891:bcdf:83dc with SMTP id
 af79cd13be357-8b257ef2e10mr1094216385a.34.1762792423032; 
 Mon, 10 Nov 2025 08:33:43 -0800 (PST)
Received: from plasma.dhcp.broadcom.net ([192.19.144.250])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8b2355c206fsm1013874685a.5.2025.11.10.08.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 08:33:41 -0800 (PST)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 maaz.mombasawala@broadcom.com, Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH] drm/vmwgfx: SVGA3 is the only option on ARM64
Date: Mon, 10 Nov 2025 10:33:32 -0600
Message-ID: <20251110163332.1553888-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.51.1
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

SVGA3 is the only vmwgfx device available on ARM64. This change allows
vmw_read and vmw_write to be completely eliminated by the compiler
on ARM64 reducing the final module size by 128 KiB.

Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 3fde6dfe64e4..f7c760d72b85 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -630,7 +630,11 @@ static inline struct vmw_fpriv *vmw_fpriv(struct drm_file *file_priv)
  */
 static inline bool vmw_is_svga_v3(const struct vmw_private *dev)
 {
+#if defined(CONFIG_ARM64)
+	return true;
+#else
 	return dev->pci_id == VMWGFX_PCI_ID_SVGA3;
+#endif
 }
 
 /*
-- 
2.51.1

