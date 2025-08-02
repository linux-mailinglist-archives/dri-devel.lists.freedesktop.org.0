Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 672CDB18FC6
	for <lists+dri-devel@lfdr.de>; Sat,  2 Aug 2025 21:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5345410E48E;
	Sat,  2 Aug 2025 19:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="BHHFuxVj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED0B10E48E
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Aug 2025 19:26:02 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-b423036a317so1622259a12.3
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Aug 2025 12:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1754162762; x=1754767562;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=patF50HxwBAOhfbawHD1F2SI7QSAZ2zNgVR0o2+WGJc=;
 b=BHHFuxVjqyuzJsRfYB22821PAL4FOrD6DEUqACLX775nAAGfqXWeVZ/O2XzJjVwRNv
 rry2412C8A7idFXfKB2sY+tg4CwoYUR9K5vJm9qF73kULBUsR9Vs31dMeaMt6Gw+0U4P
 cUoxn25mptLXquyHRuMaJw/diFGM7sOY2gOUXL7x/03tyQEV5l963VRWOITtvZ3iKfSM
 OR+4y1Jv1Kcvo38quYAnmoI2kpXFcIj0VFanOUqT7BuT+G7a0gpyBHdUmP1WJJXOQk5h
 6dL3DexIHIKSmMg+5qtb9wv1XkckAILUc5qFtMImSK7L+86BFVXYNR/o8RUbvLuZ3e7/
 dPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754162762; x=1754767562;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=patF50HxwBAOhfbawHD1F2SI7QSAZ2zNgVR0o2+WGJc=;
 b=trXY4b+Vhf+y3jKaY2SAmhNdlL4yQT2IyoYYd/KLE4emuw+pziO+ffVYdFyOZ4eJcs
 OdZqZ6WfF3qBXb7D9uaLvz3/ot7Ghc0EaDkYuAX7Mr+KPmC7V4SvaCUFAV3dEadudAuo
 Bg5azXpcMp4QQIBq+S+yDNuGbjsKi61gkqpULUKXqKbIIs+ekmaj5tlvUkqW8LN1IApD
 2e+2Od0Jr1m9Tuoj/O/p+hqXPZ5SwJrM6oB7F7sFIv3MdgaPuydPb33QRBxzLDLG+pwM
 wBpjy0zDMNxIqHKhftbcSCBtKv9FGy5rkt2/O0Gnbj8MCFwZTGnolVtRI0zkpXXU3tlA
 QBbg==
X-Gm-Message-State: AOJu0YxcrPl1Nr9+sAkGQwQmfZ6Km+XO6MAuCTjVegS+4qY1IY9t6LKe
 qa/AV3ltfu44qSC8jj1WpR/oEEEW9GkRkWnccT8YtoRdOTF0a42NU7Cy5mWA0jkJ7AY=
X-Gm-Gg: ASbGnctjrKVbWaydf9bnegCsUzY4KYulK0qPSQI00brgE/HMvg+fNtGiC+6fqPBnGaK
 f83hgcEET+FTPSxh82UcdUdkHG9Fzg4CbEpaHCCQlCBsmOw3fY4xUuZSxNX4wv+rRqKEkiXoyj7
 CGC4ZPGLkEb6Kc/PtsN77U+wjo/WtgA11OLoPRfGHYKAFaahYdXLu7ziT9PMJ9xBn/UC+m+jQTR
 c5YaGjzMke2esnKDAEztHWJcDav6u0J7gK/wTcX8zN+0D3cBOMqjbJB+j/Qy948jUmwrHXiTlID
 SRebPboAI8Qk/H/KeWR/l6Q8OscXkJuje8Q1ZvgH5Rvsjp/YQ0mnJgcvcoWkFd87SVUVMKeQjTn
 KAhi9EPw3hpC84ulYU7ht/V/rR5XBhZ6tyt8=
X-Google-Smtp-Source: AGHT+IEUNY6RAxyfm2o8WI4OeBc0W8xJUgXWURl0s22NPmAoZ1ZpBLFdr2EyazqR3HO82uxLuqL2Qw==
X-Received: by 2002:a17:90b:53c5:b0:31e:f397:b5b4 with SMTP id
 98e67ed59e1d1-3211629df4cmr5741060a91.22.1754162762276; 
 Sat, 02 Aug 2025 12:26:02 -0700 (PDT)
Received: from mystery-machine.local ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3207eba6bb8sm7887583a91.4.2025.08.02.12.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 12:26:01 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
Date: Sat, 02 Aug 2025 13:25:46 -0600
Subject: [PATCH 1/2] accel/rocket: Fix Rockchip NPU compilation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-fix-rockchip-npu-build-v1-1-fb0f0dacb3fe@brighamcampbell.com>
References: <20250802-fix-rockchip-npu-build-v1-0-fb0f0dacb3fe@brighamcampbell.com>
In-Reply-To: <20250802-fix-rockchip-npu-build-v1-0-fb0f0dacb3fe@brighamcampbell.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
 Brigham Campbell <me@brighamcampbell.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1351;
 i=me@brighamcampbell.com; h=from:subject:message-id;
 bh=iYFZqe0FJwNf+ajNL5XFSo87/W08KOgeD3yFN7dsGdc=;
 b=owGbwMvMwCUWLsWS0KCyxZPxtFoSQ0ZfmpvMtp8XL+wJKPaa55a2Y/8OLnU1fccyu3VHF0hFN
 cWcyPreUcrCIMbFICumyKJya5b6xcnWjw5G8E+AmcPKBDKEgYtTACYycSbDP72cuKMr9q5a/+7Y
 umopowoTD94pHJ/elRnqHa14MbHQ/C3DXwHzdV/2T5oWmCJykrmf/SEbh+R8rRXTmVs2bfRR2aN
 8iwsA
X-Developer-Key: i=me@brighamcampbell.com; a=openpgp;
 fpr=24DA9A27D1933BE2C1580F90571A04608024B449
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

Replace DRM_GPU_SCHED_STAT_NOMINAL with GPU_DRM_SCHED_STAT_RESET, in
accordance with commit 0a5dc1b67ef5 ("drm/sched: Rename
DRM_GPU_SCHED_STAT_NOMINAL to DRM_GPU_SCHED_STAT_RESET")

Pass extra parameter to drm_sched_job_init, as required by commit
2956554823ce ("drm/sched: Store the drm client_id in drm_sched_fence")

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 drivers/accel/rocket/rocket_job.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index e731da15ebffca12e74035d2739a666a8e02d747..5d4afd69230623215e3105da7153d2d010636d52 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -390,7 +390,7 @@ static enum drm_gpu_sched_stat rocket_job_timedout(struct drm_sched_job *sched_j
 	atomic_set(&core->reset.pending, 1);
 	rocket_reset(core, sched_job);
 
-	return DRM_GPU_SCHED_STAT_NOMINAL;
+	return DRM_GPU_SCHED_STAT_RESET;
 }
 
 static void rocket_reset_work(struct work_struct *work)
@@ -552,7 +552,7 @@ static int rocket_ioctl_submit_job(struct drm_device *dev, struct drm_file *file
 
 	ret = drm_sched_job_init(&rjob->base,
 				 &file_priv->sched_entity,
-				 1, NULL);
+				 1, NULL, file->client_id);
 	if (ret)
 		goto out_put_job;
 

-- 
2.50.1

