Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2716AC272A
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 18:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F1E10E82C;
	Fri, 23 May 2025 16:07:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ryr389gC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36B8A10E82C
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 16:07:37 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-445b11306abso41171965e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 09:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748016456; x=1748621256; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ySA+I9x3ijxPrMXr+uDkaCBuOqoQX2Q5RgcLdxKb0qM=;
 b=Ryr389gCYQnVEHaWWCW8nYBF8uhycmRT4yKppm/y3Y5CHSGNrk2+7Sb8ZixL1t/Ik7
 8VXAQGoidU2AWKlFRlwSojUQc+pp0E+D/efsD1UbU9r4cBGk/x8b1LYGtnvV2v+OkuCT
 wyMbudEiEuCpVeLNGLPsverQw/A2M+I5Xv3qjyRYVT8WHavZ1MQ9+D2NqmWKvkZ1iKYV
 bSEcSAcmGhcmQN0fL4emUu3CRPB0A5Bz/RbDvvMewPpjPZgEPVuw2HjDNkrqt9F3J9U+
 nbbiB+4o/FO9NQBifGzrrD5YfvISnPFXEU4CzricljH0Tu5y+oQ/D+WJgp7rt4VGMdmY
 gN1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748016456; x=1748621256;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ySA+I9x3ijxPrMXr+uDkaCBuOqoQX2Q5RgcLdxKb0qM=;
 b=BgMql9ZE903kVAWaYVfw1N3L6s3UlbQEshSFm7i0Br/40BR7Z7sVnrhW+WMp9FnrjW
 Q5/ReDCScWVLunthG7kYacXPCfFr7rJepkQ4U2l2kawfPrg3hxdfBMbH3RlduwCDrUAo
 Oq50J7EtXTriVATmAu7AXBnkVZnyBowHU6m2h1m7uZYghfJBbZXUZf3oy7Dp740BtohC
 iUHMuYKPfI8gir+LtUb208jSMRWbugCpXKVK2BSISRHp0urMikp4Xn1/04d0fPiAA48V
 1jSywgyiRZa4pqc0lZkDZJJEFKKxpaM658kKN/w515sSiKUlpAly+yCt+CoveB4kB1rX
 gQxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXd6eqv5yIrg8j1fYloEm0pxSF0hpboQN2vMBUJMfvMQ/699/KNko6FjwslZ/fZS9Z5wN+98SJW53U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZnaPpn6FWGfgHZkXRDXzQc4Y76+IqnC0Q3UvP5Iru3MQA42/T
 d1b7LDNDVGlsBPqzCdx0fW8eG+hCCRI9h6HwEvh0lpH4TcvTB1/7liAhh96L77Uyunc=
X-Gm-Gg: ASbGncuuArF8+As0vvMUgCJ4UVPjEhZ0x3Gn9mn5PX9iMketk4mdJlmbid/Z+SYk8tR
 WKpQqaL64Yr2THQkvxfs9B3amHpbHHCRKIBEx9zfuvkU5qONvF/NQAyDtKmHgsAAfKpYtGeOIMo
 UtmSum1YYr3oVqtsJ30GswBxM//6x/m340uX8XD5Hk74M5FQp8Z9N3UtNJ/bBNeUPe3apLF5fzd
 s00Cid0b0zA6ntHl4rBEdT++aJUAw2rRQ5qcqRxSas2jNy0gdCUPrX3D+OFAbGDBIb3KmyV1mGS
 I2VrdjlA1qMbI7Ona4VlZ4+C56dH3OHqoxWZ9UERv/xR6o5kA/deSFbd
X-Google-Smtp-Source: AGHT+IGofrhPwUyQkmyigwaxUlF2xUHWhAZovkrgIBPkwqcSNQYKQBTR5Syeu5oZ8hxjg03O13Decw==
X-Received: by 2002:a05:600c:528a:b0:43b:d0fe:b8ac with SMTP id
 5b1f17b1804b1-442ff03c4edmr317016795e9.30.1748016455699; 
 Fri, 23 May 2025 09:07:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-447f3dd94d1sm143921865e9.34.2025.05.23.09.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 09:07:35 -0700 (PDT)
Date: Fri, 23 May 2025 19:07:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Xaver Hugl <xaver.hugl@kde.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/plane: Fix error pointer vs NULL bug in
 create_in_format_blob()
Message-ID: <aDCdRKZHmCPwaJWp@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

The callers expect to receive error pointers on error but
create_in_format_blob() returns NULL.  Change it to return error
pointers.

Fixes: 0d6dcd741c26 ("drm/plane: modify create_in_formats to acommodate async")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/drm_plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 04992dfd4c79..75a7e8aa6611 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -209,7 +209,7 @@ static struct drm_property_blob *create_in_format_blob(struct drm_device *dev,
 	formats_size = sizeof(__u32) * plane->format_count;
 	if (WARN_ON(!formats_size)) {
 		/* 0 formats are never expected */
-		return 0;
+		return ERR_PTR(-EINVAL);
 	}
 
 	modifiers_size =
@@ -225,7 +225,7 @@ static struct drm_property_blob *create_in_format_blob(struct drm_device *dev,
 
 	blob = drm_property_create_blob(dev, blob_size, NULL);
 	if (IS_ERR(blob))
-		return NULL;
+		return blob;
 
 	blob_data = blob->data;
 	blob_data->version = FORMAT_BLOB_CURRENT;
-- 
2.47.2

