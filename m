Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF2447F66C
	for <lists+dri-devel@lfdr.de>; Sun, 26 Dec 2021 11:41:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B74EA10E6F1;
	Sun, 26 Dec 2021 10:41:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00CEC10E6F1
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Dec 2021 10:41:13 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id r17so26374998wrc.3
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Dec 2021 02:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=urda7dukOjrduEUTaGt81lKPi62bFg/eZfAHEnqnCIg=;
 b=IVgjJdfFI9JqBDqtDgFrsG6mMMuXOo5LT4CXf8uYQJMP+1UJEIkW+KtT7i23EW/Q1Q
 wksPThVgIYPfVRKc3etd1TntgDQ/HqR+LfkMVuDnuU79OIRUCEiWw22TT91cvY86HVFv
 0D19oVPZZfNxQWWWow5EOYqb1NnRhhUGCufvlyO9iNrmQ4jvsEZDUsu3A6yeT0n2CjZX
 mE0cAQsKXVljzX0/+zKj9n06NR2JIGQQ+ESM3dFfFQeFi1Ue/9JgpFhFtUXTF4xjUiXd
 vQsuXEK/dXWZd94Yd8uI0k8ridXIgutOqUGjCFCL7KczAnsXe1gsUo+bwYNc7cz7HzUN
 1CVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=urda7dukOjrduEUTaGt81lKPi62bFg/eZfAHEnqnCIg=;
 b=XJTRBkQh4CxSXGIdd9lNlNiroQgXdhN4Lfw24z0xVM2JcUReR5tQG/kxLLtXDRgRju
 MNWXC2yCw8fnFo9cqBtdnDYsC8MfpTq/9II4Aot2axUZW3NX6x3v7lVesynpuVEDwmjR
 zVTb7NdU6kjbewGLrNP5hQEI8uWmhNDQxtnSUE4ZrfbaqySGFovmwvUSL8qE79EmTxcg
 QIKhuPfv9klCjNRyoTASlwovlmWY9sCpn8SPquiajPuBj8Uz32ReUuCXEYgA/e5HUrme
 Tpu/X5yF502Y91LYYLi7NiQEQiByFNbaqLO2/vM3OlJIC8w/8ujFVnx+v2S4KkRoAgo0
 V5JA==
X-Gm-Message-State: AOAM533tWJqrhh9gPdLmtNnd2B4D2k7/3nAjMyZ314GkkpdmEERjpFvY
 HpUJQmLoOGrwr6Bx7wfmqqdi0hIC/LGmgA==
X-Google-Smtp-Source: ABdhPJxMy8Ln4GlG/YF/pknetTJtI5gnctb6Y9F66+nXLcd6KQuxdSnO6R2xu8qF87P9acttOBLUeA==
X-Received: by 2002:a05:6000:1845:: with SMTP id
 c5mr9396461wri.499.1640515272517; 
 Sun, 26 Dec 2021 02:41:12 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id g9sm12592729wmq.22.2021.12.26.02.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Dec 2021 02:41:12 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: melissa.srw@gmail.com
Subject: [PATCH v2 3/3] drm/vkms: drop "Multiple overlay planes" TODO
Date: Sun, 26 Dec 2021 11:40:59 +0100
Message-Id: <20211226104059.11265-3-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211226104059.11265-1-jose.exposito89@gmail.com>
References: <20211226104059.11265-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, mwen@igalia.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the task from the TODO list.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 941f0e7e5eef..9c873c3912cc 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -124,8 +124,6 @@ Add Plane Features
 
 There's lots of plane features we could add support for:
 
-- Multiple overlay planes. [Good to get started]
-
 - Clearing primary plane: clear primary plane before plane composition (at the
   start) for correctness of pixel blend ops. It also guarantees alpha channel
   is cleared in the target buffer for stable crc. [Good to get started]
-- 
2.25.1

