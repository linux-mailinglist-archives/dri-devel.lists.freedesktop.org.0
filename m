Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E594674D08
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 07:10:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8AE410EA51;
	Fri, 20 Jan 2023 06:10:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [IPv6:2607:f8b0:4864:20::649])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6390810EA52
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 06:10:00 +0000 (UTC)
Received: by mail-pl1-x649.google.com with SMTP id
 p4-20020a170902e74400b00194b02104a1so2645396plf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 22:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=2df1AX9vEFHElFLE85x7VL7GO7iiZhbuXNwIiyvY6II=;
 b=XivhWV9162Ca8UPPyie5qUAF3Ijqb+QXg7qO6pAoH1AdkjleXRMcdOccPotvg0ILk/
 akmE4svkyF83ZWl072BCZhVrtXr/c8KLyRMq73qpkikHo45RhhOmwGHCVUZYwDGjDy9o
 PWSMxnJHkB6nvJgsM0IXLlZXs2onj6gTgzY3IIe1DAuPSq/q61lCuT1U2r0nMyXu7+Wd
 R7jyt4jweygU5WMqcrvWpqCYtUdaIkHsUd1bwXixO+x6It1FJuF4fefgCo1MYqbRnMqm
 jOQC0448jyUFIsmj96UKQLgfp8hq+W1uz0n1UTj1baeLkb0x/syT/PO6hVMbF9o8ECaZ
 A7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2df1AX9vEFHElFLE85x7VL7GO7iiZhbuXNwIiyvY6II=;
 b=C+5FjV4BMdHIQIe9bZ2tRrrEAmvyTSBj5jOZs9sA+O7705/iNFzXRKzN14MCXr0RV4
 e3ESITUJMKiFlPJ5ZHdUe+FJRPAaG3bZysoGEzv1/PkFVls3dQWmjuq6N2Q730xEcQSP
 sj8UAvA+NvsmuacEPCTya6BlWkNtDDTHVJkay1zo4rcdTbpqjNzbxecnxHbnJwfcQE1n
 F8bwFAbDxAIgr1nLYXpbpqkmyqVGz5BXMUFmkQ9vXQpzHdayjHO2/2cLfo9rhRXgfb03
 mEZCdZpJPPR2sYHK9jKEdY97wiyAiwcQR1H7ld/uJOreSBrdrTfMew7rgcK/kMkm6LCZ
 DVHw==
X-Gm-Message-State: AFqh2krRA7Y9gdKhl1eBwxp4wf9KBwNzt96ODtk/ksUxpVDYvrKDidAB
 4537xLfEUzVRUpRENYV4W7DjTfCheEk=
X-Google-Smtp-Source: AMrXdXsetSs3g8u4UgPor/pNTwBdAVoZfoK52z2AQKhFpLJNZTNFb1pzifmxSUcx/jwYByYumrOWNS2RtFhr
X-Received: from jstultz-noogler2.c.googlers.com
 ([fda3:e722:ac3:cc00:24:72f4:c0a8:600])
 (user=jstultz job=sendgmr) by 2002:a17:90a:bb08:b0:227:2288:bcd5 with SMTP id
 u8-20020a17090abb0800b002272288bcd5mr1606337pjr.8.1674194999674; Thu, 19 Jan
 2023 22:09:59 -0800 (PST)
Date: Fri, 20 Jan 2023 06:09:56 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.1.405.gd4c25cc71f-goog
Message-ID: <20230120060956.1244187-1-jstultz@google.com>
Subject: [RESEND][PATCH] MAINTAINERS: Add Sumit Semwal and Yongqin Liu as
 reviwers for kirin DRM driver
From: John Stultz <jstultz@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>, dri-devel@lists.freedesktop.org,
 John Stultz <jstultz@google.com>, Yongqin Liu <yongqin.liu@linaro.org>,
 Tian Tao <tiantao6@hisilicon.com>, kernel-team@android.com,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I no longer have access to the HiKey boards, so while I'm happy to
review code, I wanted to add Sumit and Yongqin to the reviewers list
so they would get CC'ed on future changes and would be able to have
a chance to validate and provide Tested-by: tags

Cc: Xinliang Liu <xinliang.liu@linaro.org>
Cc: Tian Tao  <tiantao6@hisilicon.com>
Cc: Yongqin Liu <yongqin.liu@linaro.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: kernel-team@android.com
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: John Stultz <jstultz@google.com>
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 42fc47c6edfd..82df566e6925 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7007,9 +7007,11 @@ F:	drivers/gpu/drm/gma500/
 DRM DRIVERS FOR HISILICON
 M:	Xinliang Liu <xinliang.liu@linaro.org>
 M:	Tian Tao  <tiantao6@hisilicon.com>
-R:	John Stultz <jstultz@google.com>
 R:	Xinwei Kong <kong.kongxinwei@hisilicon.com>
 R:	Chen Feng <puck.chen@hisilicon.com>
+R:	Sumit Semwal <sumit.semwal@linaro.org>
+R:	Yongqin Liu <yongqin.liu@linaro.org>
+R:	John Stultz <jstultz@google.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
-- 
2.39.1.405.gd4c25cc71f-goog

