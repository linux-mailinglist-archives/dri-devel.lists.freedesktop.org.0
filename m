Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DDD345160
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 22:06:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD7E89F2D;
	Mon, 22 Mar 2021 21:06:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0FBB89F2D;
 Mon, 22 Mar 2021 21:06:27 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id dc12so8514502qvb.4;
 Mon, 22 Mar 2021 14:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xPLRPNjgY0ax0oZwT9jDC8RniRcWGGGKB5AERe/75K0=;
 b=a3YhtOJ2fmCXh2tOAF1skh2r0jCbsm44WhTNjT4Uzk9fA1yzjOXrfCWoXkuaqq8jcA
 QCOph2dqCZxJMIKIMRLonxYUcwfTGVqQARFcgo2HKhEPfC0u2N4mV1URlg/yYYNInLp3
 mldVKM80JhNfwgUzS1n/K8n0Y+JrLhgpFVnnYF8fTpllU4QUEoStl4qZ0B7m9oEFoPOT
 sgLqZqACFVUYKTqv00z6KifvCehE7m3Xc0w+G+X24BDNbQemsOhXQ0giovuzxQlIWIPv
 +eJwFUbw6l6MfF854YwZnPrlN4TYcDSK9mzED8vkcMJKU4hyGfyVa0melMP2+6urFeJz
 mjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xPLRPNjgY0ax0oZwT9jDC8RniRcWGGGKB5AERe/75K0=;
 b=AaEGzejsT/YnTmaoeU7S+AaZOu0GWL6EMHYJFP10HiM1mgm1MqAbZJVjW3dPxzSOcC
 Br3wM30455OXpkloXP7LXZzqzVsuqHxBheXlT7LxCs285oqOUrNo6zH/xGieRgawnqst
 XR415c6u71kic6E6yGcNsZhFrV/aGN+FYqS3rbRbgfoViwvBTV5s2Xd/MxB5ZD5iAXGD
 qV9LM4ADuz3K5ZeurdWF3EHx7dhTzIQy3YxCuLJkGTCvcSQ1bTW9wxozgmcUMHN0ojmo
 TQ3uUvcuvn/1ilNlcB08zRX/aBqi0vtZOyq2qBBuBSwKjDmBDdFWSsXIKZa1bDHMk7Hm
 7Zpg==
X-Gm-Message-State: AOAM530MTPLVCoEkBlq+387nf4JKUJDgy11cyjVLlFYGglJIrE1zNiGv
 6XD1zN+Ge1mTY2PETZ06y4I=
X-Google-Smtp-Source: ABdhPJyL8RzT2268AePI7aoKOYXKUVZdw+v/SpLsXEcuN/hf+pUU7PWPOcyO3v+unk8GIxbJTVbOgA==
X-Received: by 2002:a05:6214:10c7:: with SMTP id
 r7mr2044447qvs.3.1616447186832; 
 Mon, 22 Mar 2021 14:06:26 -0700 (PDT)
Received: from localhost.localdomain ([138.199.10.68])
 by smtp.gmail.com with ESMTPSA id z14sm9639290qti.87.2021.03.22.14.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 14:06:26 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, evan.quan@amd.com, unixbhaskar@gmail.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd: Fix a typo in two different sentences
Date: Tue, 23 Mar 2021 02:36:12 +0530
Message-Id: <20210322210612.1786322-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.31.0
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
Cc: rdunlap@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


s/defintion/definition/ .....two different places.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/gpu/drm/amd/include/atombios.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/atombios.h b/drivers/gpu/drm/amd/include/atombios.h
index c1d7b1d0b952..47eb84598b96 100644
--- a/drivers/gpu/drm/amd/include/atombios.h
+++ b/drivers/gpu/drm/amd/include/atombios.h
@@ -1987,9 +1987,9 @@ typedef struct _PIXEL_CLOCK_PARAMETERS_V6
 #define PIXEL_CLOCK_V6_MISC_HDMI_BPP_MASK           0x0c
 #define PIXEL_CLOCK_V6_MISC_HDMI_24BPP              0x00
 #define PIXEL_CLOCK_V6_MISC_HDMI_36BPP              0x04
-#define PIXEL_CLOCK_V6_MISC_HDMI_36BPP_V6           0x08    //for V6, the correct defintion for 36bpp should be 2 for 36bpp(2:1)
+#define PIXEL_CLOCK_V6_MISC_HDMI_36BPP_V6           0x08    //for V6, the correct definition for 36bpp should be 2 for 36bpp(2:1)
 #define PIXEL_CLOCK_V6_MISC_HDMI_30BPP              0x08
-#define PIXEL_CLOCK_V6_MISC_HDMI_30BPP_V6           0x04    //for V6, the correct defintion for 30bpp should be 1 for 36bpp(5:4)
+#define PIXEL_CLOCK_V6_MISC_HDMI_30BPP_V6           0x04    //for V6, the correct definition for 30bpp should be 1 for 36bpp(5:4)
 #define PIXEL_CLOCK_V6_MISC_HDMI_48BPP              0x0c
 #define PIXEL_CLOCK_V6_MISC_REF_DIV_SRC             0x10
 #define PIXEL_CLOCK_V6_MISC_GEN_DPREFCLK            0x40
--
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
