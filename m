Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B613D871EC6
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 13:15:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7CE010E455;
	Tue,  5 Mar 2024 12:15:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.b="BGTAePN3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2351E10E415;
 Tue,  5 Mar 2024 12:15:22 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-1dc13fb0133so41293725ad.3; 
 Tue, 05 Mar 2024 04:15:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709640921; x=1710245721;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:dkim-signature:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hVie1ubg1vO+1LPda2Bilx+ZCICOse/T4HjTbJik150=;
 b=s3nWZnYwqzYpDMYO8Oi0wwB3qN63qe8AtbherbX7YozWKw3EjAR/h+LdOT0tU4rCaI
 2WOBv8+saj+a1TDuJX711F7y1d9hKmPDAlrNVa198dqsbc46DIFiOH9xkg+zKQLdY1/n
 zLMOHvIbTpM4yX5ogNBTsikLh4doJSe6ATGsiDsc5DRb5pqs0ZhyBfpaCow/IC/B5yOr
 cq9ftqtYvOiAjooVX88P33Gb6xBzMttDrwh99LDHNEcDuhRtji1M2wHIJFYMuhCJPuGS
 PU/hCTN+HR1vDchW38is53sIieZkAWVCl9vX9Xd0FCYcumTfOda6YAlN0ZnNlsW+0CZ/
 jNkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuH5U0/1ckg5nVPriPWnxfBblnvstO4vzUV+zx8blg+RJtZ3RWttDUNmnDyWMBLyfCHfOGx45o1d2yzk7wB/lRgL2meABg93dTeADVqp6c
X-Gm-Message-State: AOJu0Yx6N1P4YdSXppxEahxBS8b0Y5SQm9dDci0PHihIwacZ3SdmP8x8
 V0cbxciKwBYaW+sVJlkiULyq1x7Z/8dsfcLUUjtu2Srsqojp6oJ7
X-Google-Smtp-Source: AGHT+IGJOKhnhB8IG8kVYywr4PNMnLud3LPOcz2BGEvgb9t9EUw/+82Q9SP6kp1RrbEw8S9TIE5C6Q==
X-Received: by 2002:a17:902:a389:b0:1db:cfa0:4045 with SMTP id
 x9-20020a170902a38900b001dbcfa04045mr1648983pla.60.1709640921328; 
 Tue, 05 Mar 2024 04:15:21 -0800 (PST)
Received: from mail.marliere.net ([24.199.118.162])
 by smtp.gmail.com with ESMTPSA id
 u14-20020a17090341ce00b001dd1096e365sm4182621ple.281.2024.03.05.04.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 04:15:20 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
 s=2024; t=1709640919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hVie1ubg1vO+1LPda2Bilx+ZCICOse/T4HjTbJik150=;
 b=BGTAePN3bozrIykaFwJ7dZRpAb3BkQUm8T27HtTgPzaCi4Jm5WG3/t8NFKNtGBKWMQo6vI
 VR8DZQz063RYjfaq0Dt0oivWnNRDf5chrbwk5oVXUjaiV2JkX7i3G6cqOAotaQlunulpgF
 IiiY8NOHzefaKVSSqwOw5SslHHaYVxLQs7hvb4nKIEEbmS5N67S8gFZLNEpZ/JhDYHAB+m
 esgBwae0rbuvwMvTGCM2i4vWOckYvswPONJiJ5nWyrhiRcAkCndD67y/jjvMX9a+qvEAmd
 YrGWD8FoqwuQPe2ETfmDvJb2TxgiLJlZ+4+kXpM7VLTK01nO7yLLbcK8rDBE4w==
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Tue, 05 Mar 2024 09:15:14 -0300
Subject: [PATCH] drm/amdkfd: make kfd_class constant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240305-class_cleanup-drm-amd-v1-1-ea99b37f26c7@marliere.net>
X-B4-Tracking: v=1; b=H4sIANEM52UC/x3M3QpAQBBA4VfRXJtay6a8iqT9GUyxtBMpeXeby
 +/inAeEEpNAVzyQ6GLhPWZUZQF+sXEm5JANWulG1cqgX63I6Fey8TwwpA3tFtAF32pjXGsaBbk
 9Ek18/99+eN8PW1ehI2cAAAA=
To: Felix Kuehling <Felix.Kuehling@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Ricardo B. Marliere" <ricardo@marliere.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2580; i=ricardo@marliere.net; 
 h=from:subject:message-id;
 bh=kW6ySO9UjKoPkDNKLl904Eg7AGlGAj8q4urpp8bhL+A=; 
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBl5wzUrYRyC7QPry2Qt/QVSUFHko1BN60HYq8im
 pKi9crZA16JAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZecM1AAKCRDJC4p8Y4ZY
 pojlD/4+yZ4Gt+Nxg1Sgg2TByTe24SdCm8LDHQY7YesXADry34SCqGMvqx/PEXvJylFH9kcgh/s
 NPZLOCmapuanwhUJXelV4CqSQS4An59xgPNJuFvmUa4iS4O8Chj3vgPGjtZFpIOsObdTxY0nYmI
 KkBMeUrNPYlVTFUFhnvXSFjSvrd552Un0aSb/IO2+ArAIF43bNQFgC0AeruTxuLRew+OEgYuMR0
 Flkq4sUbzc2i/GJID7KgIzhPM5ZcTPVmapA3B8JXvQAgPHOoazUPMBg0ruRZSwX5973Ul3rzvjl
 F2SkfJSzAvP7BFU3CDkPfXujvWr0U53VRqruHd9Rzr4mreStGDiTDK7kW9pikwU6SK4zG6NDknB
 EgfWQnhxm9wvZmmkQNGEpO7FsyXpKY3ZTj/S4XkflIR3zrnYdZafhiSiz+LwI34TwMMkIp8QD9g
 Zw6fZAgGNlfkTrQOzl+FAqzn4psKVPu3lv8yy1ipGmJbxP0Okwywi/OMk/SBYt8344Iwsz2Nwgp
 q1mM+J5h5/czFQqZmcws2MN7RiFoJH4ccKcD7BgSBAUsgqYbGd/ltg9Y38pcj9021m9/jDxCaQN
 c0/KZdhyOj3Fn/HzGgXONhT9xz3178ZH8jAvtC7uWcH5g7GW8n4QU3EqKyZTBqiehwrHjSGRgGk
 6cTcmFrf0f88Jxg==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
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

Since commit 43a7206b0963 ("driver core: class: make class_register() take
a const *"), the driver core allows for struct class to be in read-only
memory, so move the kfd_class structure to be declared at build time
placing it into read-only memory, instead of having to be dynamically
allocated at boot time.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index f030cafc5a0a..dfa8c69532d4 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -63,8 +63,10 @@ static const struct file_operations kfd_fops = {
 };
 
 static int kfd_char_dev_major = -1;
-static struct class *kfd_class;
 struct device *kfd_device;
+static const struct class kfd_class = {
+	.name = kfd_dev_name,
+};
 
 static inline struct kfd_process_device *kfd_lock_pdd_by_id(struct kfd_process *p, __u32 gpu_id)
 {
@@ -94,14 +96,13 @@ int kfd_chardev_init(void)
 	if (err < 0)
 		goto err_register_chrdev;
 
-	kfd_class = class_create(kfd_dev_name);
-	err = PTR_ERR(kfd_class);
-	if (IS_ERR(kfd_class))
+	err = class_register(&kfd_class);
+	if (err)
 		goto err_class_create;
 
-	kfd_device = device_create(kfd_class, NULL,
-					MKDEV(kfd_char_dev_major, 0),
-					NULL, kfd_dev_name);
+	kfd_device = device_create(&kfd_class, NULL,
+				   MKDEV(kfd_char_dev_major, 0),
+				   NULL, kfd_dev_name);
 	err = PTR_ERR(kfd_device);
 	if (IS_ERR(kfd_device))
 		goto err_device_create;
@@ -109,7 +110,7 @@ int kfd_chardev_init(void)
 	return 0;
 
 err_device_create:
-	class_destroy(kfd_class);
+	class_unregister(&kfd_class);
 err_class_create:
 	unregister_chrdev(kfd_char_dev_major, kfd_dev_name);
 err_register_chrdev:
@@ -118,8 +119,8 @@ int kfd_chardev_init(void)
 
 void kfd_chardev_exit(void)
 {
-	device_destroy(kfd_class, MKDEV(kfd_char_dev_major, 0));
-	class_destroy(kfd_class);
+	device_destroy(&kfd_class, MKDEV(kfd_char_dev_major, 0));
+	class_unregister(&kfd_class);
 	unregister_chrdev(kfd_char_dev_major, kfd_dev_name);
 	kfd_device = NULL;
 }

---
base-commit: 8bc75586ea01f1c645063d3472c115ecab03e76c
change-id: 20240305-class_cleanup-drm-amd-bdc7255b7540

Best regards,
-- 
Ricardo B. Marliere <ricardo@marliere.net>

