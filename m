Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 434C3C609B3
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 19:00:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2405C10E03B;
	Sat, 15 Nov 2025 18:00:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HNTvfqDR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C31E10E03B
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 18:00:10 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-29845b06dd2so32996755ad.2
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 10:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763229610; x=1763834410; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nXa39g3lX0uLafEymjfro1eQzu9oup1GMo1ewT5+ko0=;
 b=HNTvfqDRkXQSJs1cOvc/ljkGVYAooowJYKWKibfB0RKihRGiEiOJoLYVd/PfN089TO
 jb9GuGg1kAX16BcM3CKku8+eyAKIPcuSX7Ffjf9QmKcAb0L5xb9KMpEtcZRWrzLnazOj
 ajdMGhBXyIFPygSq6/M7r2W1GwJUQ7+O9TbRBuehKgySG/C9Mkhcqejt5MEbqG+z8yus
 WxyGhX5O4QdRzDyebRrZMy7O7QwfTk3QPLVI9OEnNBafEkXgdQfuDgGhhi/tUh338UIq
 38NaItjwpjK6mC8N3TqPKf8kIXKJ6tl+emR03dyj2AnDTNudlkNm9vQTN87SJ91JoDA1
 9ZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763229610; x=1763834410;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nXa39g3lX0uLafEymjfro1eQzu9oup1GMo1ewT5+ko0=;
 b=dejcNfqZm7zXKs40If3qFUXxUVcSsSG6ggM5KIFNt7djJBTLYjILzfB4ebIZvAdkAj
 ZhftTLf0LKlaTZijqxRtydXKw5Cl+jbsjPghCaaK7Smh4Y4G2Ct+Eif1e6NkOOA3HIJu
 3hegNRRRlzn4CW1GBXpHWWKy4l2vi1mC41k0mnQ3GuqigmWzo38qAqPHKXcbpQNjyIYk
 1NI6MmgY4v8ymIRP2sLUp1ysbBDM7X44SYYLuy3HU7aVFYz9MwSmVbNRpdsRSGS07yon
 SdkAU1FornMFE+jUjhzNzDof48TBB7k/uUokHgMubMHjmbBFhxsE0LW1mnIFDUBAFvi8
 soTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1sMYxG/6wInZhhpDdLEF4UU3bKOT4tBIgvk2p+mq24MWHEHM0aLDPYI6AjGarX/x53TzWoFPSJG8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXFB8wOmwB+w5CtOHgWE0fFYOzfhAhp9qr0oaMgiJEyofHJKB3
 oqdGFLFm4lMmap60OcqLz9hro1od/krrQlT8etZoWcKpOmGGlbrTu9Gl
X-Gm-Gg: ASbGncvdtXZkK//K+WxUUiFCT6DEmbTps7FF3TWGs5k7S+TTlpSxc7+AK1OEv9PW9Gk
 eVVH/+LZOEOKZhka14/cO5sHHGMVAZ92u3fd+n7GqNuJmkH9POrdFhcu5gOo27o6DlOSVioTqTX
 D/C+ab+hasBVMx/B9m/ZmZINXabMgx7tkSNwEM4XG/9gtl1GfbXTwrD1tK882Ul0c3u4y4FQXqw
 tHDARNQf6AEcs+nHxR6FgiaLUq6Xbvhkmt8Nr/l2HMhWDAPTvtqN/LWgSoG5TwUG9SHzCU8o4FD
 MpKs2yH58TU8cTqg0yP9WpS/2u8laWJttPGDw6XytcQHx0K7L1u2tOGZJAZBqv30wqcRZYBcyOk
 W8nveIf+yDGzD3Odg1valpApU7+bm+O+NW2QnUxYrEpGsMfO5QPRB64Ga97xV9Sdu+6NYNXMs6r
 YbM5gSpXI=
X-Google-Smtp-Source: AGHT+IG4FNTrXxEatoXT8ZreRor8XQ6Hsv27jGeA7IqF3DhTphHxnwPLXI8stlzorRzzgwWkoU0POw==
X-Received: by 2002:a17:903:1c9:b0:295:2645:9f5 with SMTP id
 d9443c01a7336-2986a72cb09mr83050645ad.37.1763229610198; 
 Sat, 15 Nov 2025 10:00:10 -0800 (PST)
Received: from hsukr3.. ([2405:201:d019:4042:982d:4536:f564:9a92])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bc37731d21dsm7865756a12.34.2025.11.15.10.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Nov 2025 10:00:09 -0800 (PST)
From: Sukrut Heroorkar <hsukrut3@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-doc@vger.kernel.org (open list:DOCUMENTATION),
 linux-kernel@vger.kernel.org (open list)
Cc: shuah@kernel.org, david.hunter.linux@gmail.com,
 Sukrut Heroorkar <hsukrut3@gmail.com>
Subject: [PATCH] fbdev/ todo: Remove obsolete line about VGA16fb memory region
Date: Sat, 15 Nov 2025 23:29:54 +0530
Message-ID: <20251115175955.203312-1-hsukrut3@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The fbdev TODO item  mentions that VGA16fb does not request its memory
region properly. This was fixed by commit 0be42724bf4d ("fbdev: vga16fb:
Request memory region"). Remove the obsolete line.

Signed-off-by: Sukrut Heroorkar <hsukrut3@gmail.com>
---
 Documentation/gpu/todo.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 9013ced318cb..277b3e495726 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -424,8 +424,7 @@ Go through these drivers and add code to request the memory regions
 that the driver uses. This requires adding calls to request_mem_region(),
 pci_request_region() or similar functions. Use helpers for managed cleanup
 where possible. Problematic areas include hardware that has exclusive ranges
-like VGA. VGA16fb does not request the range as it is expected.
-Drivers are pretty bad at doing this and there used to be conflicts among
+like VGA. Drivers are pretty bad at doing this and there used to be conflicts among
 DRM and fbdev drivers. Still, it's the correct thing to do.
 
 Contact: Thomas Zimmermann <tzimmermann@suse.de>
-- 
2.43.0

