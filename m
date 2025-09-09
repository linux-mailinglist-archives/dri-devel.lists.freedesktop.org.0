Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A9DB4A40A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 09:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BABB610E163;
	Tue,  9 Sep 2025 07:43:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VzCWfsQ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88AE210E163
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 07:43:13 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-55f74c6d316so2793540e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 00:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757403792; x=1758008592; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=P6ceq16OHTEiiK/PjlkFm8FKdw71IR8b/dY6PTnCU7s=;
 b=VzCWfsQ+KpcNJZ3xNiBWiD/k3tXr7sA0wcSrlfPfmLn5Mj85VWQpCFRGjyZfufYNj/
 e1ume2K8GHK0sHOhx3ACoir4uaVrHyIq1I+U2jLb1ZOFBZo77HexaBZpGetL/jdvaqNV
 dfdhcUkiZpgjwj3E8ati1BpyC7RLZL+w2VwxSOu2ih1P9zvI4T2dV1hYxVe8MI6YRyX1
 hgxx6XiHa9bcSNGTLOGkyMtE2OYsyImXZxLyFO9w3WrYvNIELdxyJgu3GtPTXHGm0C+O
 QD3OfsP5RMAihkva1BhxYZXGnmK/IzkU2AueLs047DNCkyLjfudxTt0L3imYIOaK8EXa
 C5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757403792; x=1758008592;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P6ceq16OHTEiiK/PjlkFm8FKdw71IR8b/dY6PTnCU7s=;
 b=WHNOaWWAybP82ZccGNil3ladVPQ3CexUPUo5QXMZCkzpxksm5NQmOtHjzXdRbZ2cUj
 vP4Fkxo5wt2Tq0OpYxkASg55x/jBhV/Qt7wFduVtwfJT3OSlejw5mKqHgA3LlQspibCz
 nAJ5ZQrMexbPkMSAW6JK3XAfQWwbEAbos8bALxPpspyNSDmOxuX3wG8B+T5C4ZRBgFm4
 IAc6VDwx3e0xSBHNCCo99YtC5xKY3yQqdEpAVsFZ96Va1WjW90IcLNOMVNwhw7oOBeAv
 Mq+J240AXRRXEYpNZG8INM4pVbPxCWFPHgJGsl8yY9So3HNzxguo+J5chnml+92u+qGK
 +ieQ==
X-Gm-Message-State: AOJu0YwlTh1I9ZmiNljijEUGoFL7C9psBiAz+aNbsq06061fMUUrCj/L
 ZcKwNzfga9VEMUSqLrwGjWguYo2g1TbAijnNG5n+vDZG3XWVFMy1P9On
X-Gm-Gg: ASbGnctaQhw0kmoanB3nIU3kpc7bg6u7N+p7YGPxDQ4Ri45i1j5jgepwubWQgIrp8Oe
 f4sn8GGK4sDLgSs3vVK9RwVppqZ4hzNCncNY6L4IwQXE83dX1VU5nzW5jGlTM+8ojZTeCBcSIxd
 36CMu9mDynyGZyUt/o95soSgY96h0Fv9AXKi8Xor/YSkCEOkMfVK6pb/9eaxfxYoPnLKxMSG0aB
 L4VnYeCiTMkLVXuPNxCGzKkGFC09B1wI3Bi71r1qzvVnq50xrDuR1WGGi3ir9zQEWruAybeuO1I
 UWY75JrnS9EmBwgpEIl+HcDAyTr9r5UlNa0+oXzr7yeUnF8cZY1hm8AeBLZk5Wo1YUqhkPIdogC
 dHIA11IVFy8FzjHsURwKJM472
X-Google-Smtp-Source: AGHT+IFRi8AmkKYGEhg38SBSKdEs7PaUtZBlmSb8cC+BpN+GQNvSNoh0wZG/sjIP4r8/trgOcysyLg==
X-Received: by 2002:a05:6512:b8f:b0:55f:71d2:e5be with SMTP id
 2adb3069b0e04-56264821195mr3031702e87.52.1757403791713; 
 Tue, 09 Sep 2025 00:43:11 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5681795d633sm333731e87.68.2025.09.09.00.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 00:43:11 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] video: backlight: lp855x_bl: set correct eprom start
 for LP8556
Date: Tue,  9 Sep 2025 10:43:03 +0300
Message-ID: <20250909074304.92135-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
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

According to datasheet LP8556s eprom region starts at 0x98, not 0xA0.
Adjust start value in the driver accordingly.

Svyatoslav Ryhel (1):
  video: backlight: lp855x_bl: set correct eprom start for LP8556

 drivers/video/backlight/lp855x_bl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.48.1

