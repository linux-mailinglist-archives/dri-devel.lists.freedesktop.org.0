Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0259C81FEC9
	for <lists+dri-devel@lfdr.de>; Fri, 29 Dec 2023 10:53:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E484710E27A;
	Fri, 29 Dec 2023 09:53:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC8F510E02F
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Dec 2023 21:09:04 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40d60c49ee7so13606325e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Dec 2023 13:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703797743; x=1704402543; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VD8jry2n9oYnQroBp/sWVFb9m0Xy1NNznk93zWH+cWg=;
 b=OcVIJaRmN5Ry9+rJysClznz0A6QD1GCinH5x0mFmWrWMHYYnq/VKTeu4ZVG9Frm15x
 Y42LGsTE9fFwTgKx11+VDn8xOwMr0TeR6ERGRYb+04bkdu6r1BwI1FzVqV4GXuUNQOro
 HZY7/upQa1rBujOW0mt77Dl9qMbCXD1Yw5xdnQDFMU3IrdVjtqdIvvIsC4cpXq0STqyw
 m7Rq7klzcYeaEdwvt8lfGbNkkjwofqk2I3bcJp8lU/U5YcpVTiAvZ0IqntYvTRXSyXKu
 DyI7sGfag/w9Zp2ioNm+NaORN8I7bQqh1YKW21Z6Unda7bkiL0XF8GGaGv9xSkPdYB0L
 tp4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703797743; x=1704402543;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VD8jry2n9oYnQroBp/sWVFb9m0Xy1NNznk93zWH+cWg=;
 b=JY4rZYAO04IgBEV3Guo162rY4Wc52YSrXRN3CQjZvCe3UWEVsUeJM6MAmQZsVk2PwI
 JiVhfAKTWFanG2qUz4yBFDgHlRccrBImfyN21x7ZIbYvISMLht/obswj7tzl307JpCJr
 JruPX4b7tfcW9F8SMW6Seb62y/7MN4YDr5L+ir7M5bVCTDw/1F8E432oa0PbWdmYIXst
 kcK1TOqoAe5JpGz7cUy8PKyCXeXmLAJFF7+g/nDBVbnP20b7cyXDV5RVZRcetvVVLeD0
 xcOTRuZMsfukW/eyEflLcD9PSx4wGcS3eIvFfiwyzHrtApm/moQP9YpENCLGtMkv2vCM
 MAvA==
X-Gm-Message-State: AOJu0YzymnjRUNGTz5sMfTHt8gT9n0VllJlIcjVeNaLpfR+Uh4kdQYjC
 xMQfUwhOQT/CXIiunWlYuxQ=
X-Google-Smtp-Source: AGHT+IEGqr8CxMU0xGwyaZ7Coe83v9rC3MJEk2VvoaphTLzRuFJZ+zzAC0/oc9ZKeIh6Su7HapLkbQ==
X-Received: by 2002:a1c:7209:0:b0:40c:a12:d626 with SMTP id
 n9-20020a1c7209000000b0040c0a12d626mr5912439wmc.103.1703797742977; 
 Thu, 28 Dec 2023 13:09:02 -0800 (PST)
Received: from localhost.localdomain (bl17-216-113.dsl.telepac.pt.
 [188.82.216.113]) by smtp.googlemail.com with ESMTPSA id
 u2-20020a05600c00c200b0040d40469cf6sm9278273wmm.0.2023.12.28.13.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Dec 2023 13:09:02 -0800 (PST)
From: Malkoot Khan <engr.mkhan1990@gmail.com>
To: ogabbay@kernel.org
Subject: [PATCH] drivers/accel/habanalabs: Remove unnecessary braces from if
 statement
Date: Thu, 28 Dec 2023 21:08:58 +0000
Message-Id: <20231228210858.114111-1-engr.mkhan1990@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 29 Dec 2023 09:53:45 +0000
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
Cc: kelbaz@habana.ai, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, stanislaw.gruszka@linux.intel.com,
 ttayar@habana.ai, fkassabri@habana.ai, Malkoot Khan <engr.mkhan1990@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The coding style in the Linux kernel prefers not to use 
braces for single-statement if conditions. 
This patch removes the unnecessary braces from an if statement 
in the file drivers/accel/habanalabs/common/command_submission.c, 
which also resolves a coding style warning.

Signed-off-by: Malkoot Khan <engr.mkhan1990@gmail.com>
---
 drivers/accel/habanalabs/common/command_submission.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/accel/habanalabs/common/command_submission.c b/drivers/accel/habanalabs/common/command_submission.c
index 3aa6eeef443b..39e23d625a3c 100644
--- a/drivers/accel/habanalabs/common/command_submission.c
+++ b/drivers/accel/habanalabs/common/command_submission.c
@@ -1360,9 +1360,8 @@ static int hl_cs_sanity_checks(struct hl_fpriv *hpriv, union hl_cs_args *args)
 			return -EINVAL;
 		}
 
-	if (!hl_device_operational(hdev, &status)) {
+	if (!hl_device_operational(hdev, &status))
 		return -EBUSY;
-	}
 
 	if ((args->in.cs_flags & HL_CS_FLAGS_STAGED_SUBMISSION) &&
 			!hdev->supports_staged_submission) {
-- 
2.34.1

