Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 574089B1DFF
	for <lists+dri-devel@lfdr.de>; Sun, 27 Oct 2024 15:05:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8408E10E12B;
	Sun, 27 Oct 2024 14:05:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FCQiVR/Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D5DE10E12B;
 Sun, 27 Oct 2024 14:05:49 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-20c9d8563cbso787935ad.2; 
 Sun, 27 Oct 2024 07:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730037948; x=1730642748; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=inUlyowWmHbKIgkrvQKpFNZUpYaWGNlLNHHuURxrFaQ=;
 b=FCQiVR/QQTVyCma85HIFDq4IFlxBuu7CvYRRZIGi9YxdrW5bFT4Lwd5nmSide9D5/J
 up/ljyYnZOy+f25R3X3N1YO4mDd5EzV7GWb3tM38KTmPY+An2IpHwQF5UWTQydDmV4Zy
 TCzqLlFCUuki15LZAjQ5YIfj0JceevjvAPJOb85uGMCPDOcc7B/zrfetwglswlvVYWXN
 s+SIhZjeAp9pvpIQwcJhZ1cmtPe2nFN7z0uYbt/i0aRXvK+1KFKXFY9gRz29ESk2w0bK
 uL55jC8lLv4sBeD5z/aU+QYhpkf1AbTkwA3kDn3BBcdialPOuxLDonsUvXhC1sPJdIEC
 3o6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730037948; x=1730642748;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=inUlyowWmHbKIgkrvQKpFNZUpYaWGNlLNHHuURxrFaQ=;
 b=OJbjEJwFuZUPZGIbnvgEuIWj9Gc2sekdPw2k2PoA66lBEqy4b73Nr/zVYvFkNEtS57
 PIsfrbzUeLwFHVVURsu0r5Sb+QcRQ0aMgQunPTVi2TuhKpA3F8YXbs7BXw5EGHJi4pT1
 QIp4DCVZ0dCe5cEHC+1cA5xf1ZRT1mAWr+I+WZWgN12EiRxNz6P7HfDs3ohizbuXJUBH
 8aIsNwAeU6yjUXqpdw+XfjwIXgsNjP+cSRjd5qNkSPa9KlFjIFAyZElZ9uNnvcqcpxmq
 YBfmg4OjeI7qAAc5Ymd7Mz3UIJvPjTfWvRS4IZ9mCWKAzrbWAkYt7TvVtgjb+dP87Ctq
 FdVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfnMGwn8cSpFOw6sSdK4lbSzhhNJrXAJq6yDPlC7ouTYmFVlXWHfqVC/dsxSyz/HBpYgcqpbUOR0E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yysq5Vzu0FNPQbWS9yaWZLtGFNR384Uzu9p4w5nU4l27IfXkDBs
 DZbyVZ+OlFApROtXsDqlA79ARhzUgDCOdXv5VoZ88HpWB5vdPVMKCJAmZg==
X-Google-Smtp-Source: AGHT+IGGNqjJL9YvkD2i6GYBKc+U4ERHnLWaoG3c4mRxIeiWd3tUdnjBw5LyISpkvUSz0YGMGu6Slg==
X-Received: by 2002:a17:902:cec3:b0:20c:f648:e388 with SMTP id
 d9443c01a7336-210c6b01507mr33589745ad.7.1730037948460; 
 Sun, 27 Oct 2024 07:05:48 -0700 (PDT)
Received: from dev.. ([2402:e280:214c:86:1331:92bc:956d:bb87])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-210bc02ee2dsm36111905ad.218.2024.10.27.07.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 07:05:48 -0700 (PDT)
From: R Sundar <prosunofficial@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch, tao.zhou1@amd.com,
 kevinyang.wang@amd.com, Hawking.Zhang@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, luben.tuikov@amd.com,
 R Sundar <prosunofficial@gmail.com>, kernel test robot <lkp@intel.com>,
 Julia Lawall <julia.lawall@inria.fr>
Subject: [PATCH linux-next] drm/amdgpu: use string choice helpers
Date: Sun, 27 Oct 2024 19:35:37 +0530
Message-Id: <20241027140537.503264-1-prosunofficial@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Use string choice helpers for better readability.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@inria.fr>
Closes: https://lore.kernel.org/r/202410161814.I6p2Nnux-lkp@intel.com/
Signed-off-by: R Sundar <prosunofficial@gmail.com>
---

reported in linux repository.

tree:  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c:145:8-12: opportunity for str_read_write(read)

vim +145 drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c

 drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c
index 35fee3e8cde2..8cd69836dd99 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c
@@ -200,7 +200,7 @@ static int amdgpu_eeprom_xfer(struct i2c_adapter *i2c_adap, u32 eeprom_addr,
 		dev_err_ratelimited(&i2c_adap->dev,
 				    "maddr:0x%04X size:0x%02X:quirk max_%s_len must be > %d",
 				    eeprom_addr, buf_size,
-				    read ? "read" : "write", EEPROM_OFFSET_SIZE);
+				    str_read_write(read), EEPROM_OFFSET_SIZE);
 		return -EINVAL;
 	}
 
-- 
2.34.1

