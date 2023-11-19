Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A52C97F0608
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 12:53:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14B5B10E1D1;
	Sun, 19 Nov 2023 11:53:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE3AE10E196
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 07:10:18 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-3b6d88dbaa3so2327935b6e.1
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Nov 2023 23:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700377818; x=1700982618; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WHLaUi85HqGEFshr/i8Oa6i6d3yOkcWZkUBdwoWoo+w=;
 b=jhHjbiWMMPE+jxkQWW1/0fKnL9bMK4XJUcdfh4e69ngoEhYC2u7C7B9wQYEwzgF8F5
 /g5trnkL2f7ueQNwmes1ssmLWKUMZVhxR1BXW9nR+T3+EcEq+yw2/wPghLjTFNEQs46P
 KrmKl1PYYBjQw0OHbeYo7UsCaGb4TyTuUQuqAy4n4VkjqLhSjfItt5m7iL0VfQyHUgsR
 0irmXVuDUfiek/O1UA8a8Z5553otN4UUXITcjtAW/VvZMB4bBDxKNnZc2KaxUDg+6YJh
 dWWX86uuVyEZf7+dea+4IlG5k2EiPCvhbdQ4BYyRHWPdd11Qp/BGLUO8IXWfBdBe9QA1
 /mZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700377818; x=1700982618;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WHLaUi85HqGEFshr/i8Oa6i6d3yOkcWZkUBdwoWoo+w=;
 b=BZbFFqJ7Ix1YHaITQ4laqIvUbpxGmQOh49WFCbESNPR5Tll3IbndDwyC8QfHLU1bXa
 X5DL9txfpAoVvxJXJaqp1hfgSuOeU8zsmZxLXFOP2CSc054AIhRFxiifHxVMK1KTGnk3
 rUfmLgUZxaIf2IPzJJhQZt7aooLPocCnilvEmh+9Q2BqAbFgzzNDBijaveiqpg4GcPbi
 KG/xz1+xxC46ZsbtPgGq1u3pxPY1ExcRxCC2k39HFa6ixToWJD4UJXqvnNfH+5AtRvGG
 z8LDBuIOcxJYQbP6LQLyFxIDjx2GZVDEH+THsipVeUE1Wt4264xxI+kTx7MiP8zruLwb
 PQKQ==
X-Gm-Message-State: AOJu0Yw2WWR6omo6KR6hBQI0aInICN3cY92w6cSjxNra9/Y9RFOECo1x
 waXB7XpKmHcOUleG3uvwZaU=
X-Google-Smtp-Source: AGHT+IGdI1r69QIT8do+8fs8hBqvSL7czmTd2bbdsTlGPw8CA9NyhwQ+I2advBnHd/u/ZcZE7zfu5g==
X-Received: by 2002:a05:6808:1812:b0:3a7:c13:c8d1 with SMTP id
 bh18-20020a056808181200b003a70c13c8d1mr6421607oib.17.1700377817862; 
 Sat, 18 Nov 2023 23:10:17 -0800 (PST)
Received: from attreyee-HP-Pavilion-Laptop-14-ec0xxx..
 ([2405:201:1f:605f:7810:25a6:651c:f965])
 by smtp.gmail.com with ESMTPSA id
 c24-20020aa781d8000000b006bde2480806sm3851256pfn.47.2023.11.18.23.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Nov 2023 23:10:17 -0800 (PST)
From: attreyee-muk <tintinm2017@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch,
 syzbot+ef3256a360c02207a4cb@syzkaller.appspotmail.com
Subject: [PATCH] Tried removing the error
Date: Sun, 19 Nov 2023 12:25:54 +0530
Message-Id: <20231119065553.130111-1-tintinm2017@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 19 Nov 2023 11:53:49 +0000
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
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, attreyee-muk <tintinm2017@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Respected maintainers, 

Looking at the code and the call trace reported by Syzbot, I understood
that the issue lies in the drm_gem.c file in
drm_gem_object_handle_put_unlocked(obj);. As per my understanding, I
believe that a warning is given out when the DRM GEM object handle gets
destroyed along with the function getting returned immediately. To take
care of the warning only, I think that the WARN_ON can be removed with
only the function getting returned when the object handle gets
destroyed, without a warning. Or else, we can even have a message
logging in the place of a direct warning which will give out the
information that the object handle has been destroyed. I also think that
the WARN_ON is given for debugging purposes and hence proposing a
solution if the warning can be replaced with a simple message log.

I am looking forward to getting help in this regard from the respected maintainers. 

Thank You
Attreyee Mukherjee

Signed-off-by: attreyee-muk <tintinm2017@gmail.com>
---
 drivers/gpu/drm/drm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 44a948b80ee1..b6be9400cd11 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -222,7 +222,7 @@ drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
 	struct drm_device *dev = obj->dev;
 	bool final = false;
 
-	if (WARN_ON(READ_ONCE(obj->handle_count) == 0))
+	if (READ_ONCE(obj->handle_count) == 0)
 		return;
 
 	/*
-- 
2.34.1

