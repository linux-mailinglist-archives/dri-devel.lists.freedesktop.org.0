Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F48C05BD2
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 13:00:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E3DF10EA73;
	Fri, 24 Oct 2025 11:00:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dWlEDOOM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C193D10EA73
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 11:00:26 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-471b80b994bso27057215e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 04:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761303625; x=1761908425; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lNwQqBemATmxjXx+rJAEDdWPHTVfdvUDQPF043XY79I=;
 b=dWlEDOOMBfOCcRmYaaiGZ2c2rO2+6SWtOhrnOG45qhpV4hGcmW5yEpB0q386tqGyY5
 RHjFDaukvGQsNDWf2Pv6KCxVLXCqIJ5xEppis9t7MytlZ3eIozKxYOYASFnz9duFiUAi
 8iVvqbJgIsj7FRm7AkySu+axvNiYtPM/GauEi62IUpjHV4i5oABGZuPVFpBBiqvEkRSG
 q8T/YIV1dvWiEeBZ12518Qmg0S89d6yi2Wt4fSM0DoZmWf4XYpG+7Zwd39ciF2IgVGsC
 9hcq9IGTf7cdeIK9AeNwl4dyu1l1d/ebwh6QV6upctucF5rgBucv+GmUDEWkh59Tw62y
 2I3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761303625; x=1761908425;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lNwQqBemATmxjXx+rJAEDdWPHTVfdvUDQPF043XY79I=;
 b=wujiTYgQs7ag89DztXFx820eLcfE4yCF+Y9QHcp7zDbLvh3crDYYLV1hzvK3exkHlx
 t7jTXJEvq8vHY+l1/skIksGaub1XZJe/+WzoVTaqCtX4OVtfuq3oC3lkDWpShAvlmx6S
 NHyILCLIsjIx3jb9qhqwLWIVyQonwyTPcMH3Jmj3b3Vws294+REMw6Y9M0a1kFg+Ib2B
 AmVeU3oGqoHx625ViahEzAdCxLn2C3hX4o6IUq0T+q3lATvGRR+9uFagGV2hTff5GhdP
 C4J91U8PT7952lfajAAUh7H6Egey4AjjMDVv6Prc82/1pgyHOFrvSxvwfbi9MsbS1JOy
 FTqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWN+4OvWtoiQY7KDCFAGul2HNynay8BPaX6NVAJbpuKwZIOmlDx0o4Ag02KG/DwEiaXjYmIH63zGUI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFkZkjYiUU8v9ZYUKSYYvBlOSuOA/qlYReitBLwWHEVJ/ZTDJj
 +lGCPCKQB662vJn5F0yLWo69JwZbwaMDYBGsgk1XPZCaOkC0DVlHfHkf
X-Gm-Gg: ASbGncupXpCQUP06HKyBDmqjQXe7GDiUTvKI6p+2zSG8oRJrg8uknwmhgVQ8IDy12Zf
 V49KFtWf3tfUEYZvO4VzigfHGUAKEvDSXSRn2uQAlVcP/7+nrpz3o4QganA8lmrJMsKfEjTgsC/
 CnOruqS2XGQJf5iekXXFJ3wcwJROi9zeiQzhh7bYDeXaw59Z6bgA1qk3z9d1lolbzJm0nB6qYCT
 D3v3s0n0rhpPoLlL86xUV+sgepehI644igpzYdn9CodKcGYVEtDo+vewxmjAZ9K4KWpXiCE97aS
 DkLGlAF3fcO1mQMqHOoXVZMPIFfg3M4yE+n0o2/4zB2mPpYNab2eQPZb5GwCPb9GuSbtp4lNE0m
 ycWpJuxCnvq++PCA3R+B34nqol33rXrchRIJoeqTrZFS3qMJnCdIStwzLkyuQ+OyllMKA/BGhPi
 w2kz+0hLGIYQ==
X-Google-Smtp-Source: AGHT+IEbRG42e1LgV+3nLNHGYb8yQMIxPTGoVR+OKvME7EdNaQHnxt1RF9GQGXBtioq1FU6OLJLiTw==
X-Received: by 2002:a05:600c:468d:b0:45f:28d2:bd38 with SMTP id
 5b1f17b1804b1-471178b14acmr208423095e9.18.1761303624680; 
 Fri, 24 Oct 2025 04:00:24 -0700 (PDT)
Received: from fedora ([37.29.213.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475cae9253bsm82484615e9.1.2025.10.24.04.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 04:00:24 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 airlied@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, corbet@lwn.net, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 1/2] drm/vkms: Fix run-tests.sh script name
Date: Fri, 24 Oct 2025 13:00:04 +0200
Message-ID: <20251024110014.4614-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.51.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The script is "run-tests.sh", no "run-test.sh".

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 3574e01b928d..d8c445c417b7 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -161,7 +161,7 @@ To return to graphical mode, do::
 
 Once you are in text only mode, you can run tests using the --device switch
 or IGT_DEVICE variable to specify the device filter for the driver we want
-to test. IGT_DEVICE can also be used with the run-test.sh script to run the
+to test. IGT_DEVICE can also be used with the run-tests.sh script to run the
 tests for a specific driver::
 
   sudo ./build/tests/<name of test> --device "sys:/sys/devices/platform/vkms"
-- 
2.51.0

