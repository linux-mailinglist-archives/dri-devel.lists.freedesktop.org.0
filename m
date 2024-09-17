Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DE197AFF6
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 14:09:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FDD10E059;
	Tue, 17 Sep 2024 12:09:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q3cGUsuS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E47D10E059;
 Tue, 17 Sep 2024 12:08:59 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-42cb5b3c57eso54904325e9.2; 
 Tue, 17 Sep 2024 05:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726574938; x=1727179738; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pH+jWoS8flWyNkqg8Mnuurwbq9hALr+uwaafQVN/R5I=;
 b=Q3cGUsuSYSjNkwRYJ/e7+euj0SjDgoMQTAxc5H13vHHgQfKMSr+e2B+AltXADNPD8m
 7bjHTZPeB+OGpcTWmIPnioF3cZPssHw1z2BKQ+MkVLGyyhZVNdOlP27o0jc5Dv4rs6kg
 74Nmr88oJJ8b81TV3m5paeObhjpxVHSnHpPzFbIAyWSzEUETGONITuIKbNfnCTFHOoFB
 CbNgz3W17LaZCEL1gR+GmXYSeuyzZNr4GFykP+j2MH3OkhgUqLEEki4MTfz+/Zu6VUlm
 G4C1K2YgDp6nKu6A6ifAUHJsSEhEIodAxj7uxn8VVqCV9tmmRAIGTidqajVaH7JAa+B2
 OrHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726574938; x=1727179738;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pH+jWoS8flWyNkqg8Mnuurwbq9hALr+uwaafQVN/R5I=;
 b=avqXXcw1xDFdg3xYtjbf4SbM1tay2JHfm8DmcdRfUvlG1PSv2FC7NcRtIe+1JqKgc7
 C0AB+L6Cs2U4rBJ6JFK7GKLWbtR4VesAkmLHLMSWiMIVEqpvs6MB286rvjCjNBneMoY7
 +l/WcHRnHeNH6TqKSg3Fmb+GAERb60xGIaMZ29F37KTxuw4BDwEY59uboqql/1KC7gKR
 KQr/tM63Xu3YbXq9bdhh2HhnScB2AHBQQsUmBerSMPwv3dIPgao+G4KFITM60RwgGAnn
 kBFR0I4Ix0IW1L+H2ylf8mzoxJ6dc8bEte3ZcCw+qIGUNJDfLYnVSJAqR2gmp8SltpPZ
 y3mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZEhQCYYDwK9gITjb4bwxWYRUCn4hXyNlX8ChESUK89WBW0Ud2bmYfxvZ+5ob/h5zYqkX3l0xEKGg=@lists.freedesktop.org,
 AJvYcCV6jXzV1L76aHOCQH8Zn5PBmqTdhaSUtrVInsyBlRKTTMhlACAFWEM1Fv7oa2V2yazh6CViZrftJA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxxo0o+/A8IwtkSYRzlU0ARSrNjW9AxlWxWydIp2DjkP1NiJ/w5
 GgtfH+h6yEMGPQ5LJvrTl04nPh1osfnv+C9WfI1TlZ0HYxV4wfkjjR71DHQs
X-Google-Smtp-Source: AGHT+IFoV/GynBdMrloJuKhB9PFQ2VToiezwKU/krQ84DC9QRRrz4ERZNzhlMoDWpSd71SLM4d6iOQ==
X-Received: by 2002:a05:600c:1d24:b0:42c:bf79:78f7 with SMTP id
 5b1f17b1804b1-42cdb591224mr138614105e9.32.1726574937547; 
 Tue, 17 Sep 2024 05:08:57 -0700 (PDT)
Received: from localhost
 (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42da22b8b65sm102132515e9.8.2024.09.17.05.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 05:08:56 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/nouveau/gsp: remove extraneous ; after mutex
Date: Tue, 17 Sep 2024 13:08:56 +0100
Message-Id: <20240917120856.1877733-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

The mutex field has two following semicolons, replace this with just
one semicolon.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index 9e6f39912368..a2055f2a014a 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -210,7 +210,7 @@ struct nvkm_gsp {
 	} *rm;
 
 	struct {
-		struct mutex mutex;;
+		struct mutex mutex;
 		struct idr idr;
 	} client_id;
 
-- 
2.39.2

