Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC25A562BA
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 09:42:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454FD10EB0A;
	Fri,  7 Mar 2025 08:42:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="n6Js7F7I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2636510EB0A
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 08:41:54 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43bcc85ba13so12244995e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 00:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741336913; x=1741941713; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=61P5O7FM4Ars9KAhbX4e1GUUuxK+iGoXonO6kXuEFR8=;
 b=n6Js7F7ISVPex0IWwidNJmFAKMOhhEB43ik2veEhlORZHB32/6mBmZkIH74eg+9dY6
 qQh5JelIXUSaNpMfN/vGo9w5K94iMeGBW61kBvwl0eJCSuCTyD8eB3bV0J251IC83fN8
 lhpBmwi/8Yl28lgUS7HZjKpCF/jPR5ALRJk6FsopJHnLBeA3gXwu5/opTHZ6DY6D9mAC
 vFbrTg7Tg2LfCD7WtJaxE66qD0rBTOIrbpRkkPyUtBXA25tOTF2gU6JERnF+EwW+InMK
 zx2qc/A1lron8d0BA8r3ZqERFfj/xtrrR+fJEvfGIYXVob2iQKrctiACqqTNPBufweVl
 ynTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741336913; x=1741941713;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=61P5O7FM4Ars9KAhbX4e1GUUuxK+iGoXonO6kXuEFR8=;
 b=WKr64Yv3hdxbvte6xo+qJiF13blr209CmCcRmwe/FL5VDBfsidM4PZBTR2SpC9twGf
 Rc5C4c605Qj3hgQ0aTS7v+ahKBTbpqn5qNYoFwIOOBv4g7U6sVkFkqRJ5qU4p1L8WaTU
 KJcmCJmV3rPbF88uwDCUV+pyjrnH1vCloikbfFB3xj2kxCnMtQupsCid0WIF/hMxGiWj
 lBQfylHPBLgmok/GEQGoy2fEvq+NYp/HWopJkWY7Z8Hes7uXBelUZ1lwUn/kBt7bNk+7
 GTtAGBGvOck2mGukjaq1d5Z2l6mExXsoCVW/xKZvRAf9jOBpTWznyqFXviET0VBi1z2r
 xajg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdcNToKrFKskkWN9EEH2o/O/z95iJV3/y7dlNfyOXtYlRcVtwlsOz+lHJ1ZcQCnzcmgeWlI5aSaZg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yya6+y9F1IrU0PAewMqPd1qxInnC3NMy0H7SJWpjmeiPPeMAoEt
 m71or9sutVVIMIlBOqLACix4sOJy8aWVydbP/T3ZecqkTTQe6NK3KEYYL0/z1II=
X-Gm-Gg: ASbGncuhc+I+NpEfkiKKOjDY5Z3twuyEziOXyOl0KGJJP5KmJf1XkRJkGggRUhV0YfM
 DozL0IzL4gDtwas+ocjvwyU8dfYggQSMps0ZQQZ3SLOBkG+k23UxCGviUQx660SCS28Bi/YfKx/
 xuOo6tJ5/CGBTp8jOk9NBglUm9EZRfA83EbzaeqmXRmvc/BZjh+r5UE8rl5jBOFOmnWlRxxMcVb
 UOQiIYnEDCkYecyZBriK22fU5ufKOsf2Va3oWGRrNvhocNQNxIfxVSNCeTb9pooBWuouL6x6rmY
 aBKXPlB4VmYlbVGUVGufKgDHu65zR6HpedHR/CLUXntZxkHQKg==
X-Google-Smtp-Source: AGHT+IGbfL4bBdca2EaHCrCPhox+++ms3htL1SxrfFW81lxG6BAaIMYQupukozaB6u/ZExtXcwAGFg==
X-Received: by 2002:a05:600c:4f87:b0:43b:d025:76a6 with SMTP id
 5b1f17b1804b1-43c5a60a0edmr17752515e9.15.1741336912663; 
 Fri, 07 Mar 2025 00:41:52 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3912c10437dsm4722937f8f.99.2025.03.07.00.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 00:41:52 -0800 (PST)
Date: Fri, 7 Mar 2025 11:41:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: Carl Vanderlip <quic_carlv@quicinc.com>, Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] accel/qaic: Fix integer overflow in qaic_validate_req()
Message-ID: <176388fa-40fe-4cb4-9aeb-2c91c22130bd@stanley.mountain>
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

These are u64 variables that come from the user via
qaic_attach_slice_bo_ioctl().  Use check_add_overflow() to ensure that
the math doesn't have an integer wrapping bug.

Cc: stable@vger.kernel.org
Fixes: ff13be830333 ("accel/qaic: Add datapath")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: use check_add_overflow() instead of open coding a check

 drivers/accel/qaic/qaic_data.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index c20eb63750f5..631e401fbe4a 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -554,6 +554,7 @@ static bool invalid_sem(struct qaic_sem *sem)
 static int qaic_validate_req(struct qaic_device *qdev, struct qaic_attach_slice_entry *slice_ent,
 			     u32 count, u64 total_size)
 {
+	u64 total;
 	int i;
 
 	for (i = 0; i < count; i++) {
@@ -563,7 +564,8 @@ static int qaic_validate_req(struct qaic_device *qdev, struct qaic_attach_slice_
 		      invalid_sem(&slice_ent[i].sem2) || invalid_sem(&slice_ent[i].sem3))
 			return -EINVAL;
 
-		if (slice_ent[i].offset + slice_ent[i].size > total_size)
+		if (check_add_overflow(slice_ent[i].offset, slice_ent[i].size, &total) ||
+		    total > total_size)
 			return -EINVAL;
 	}
 
-- 
2.47.2

