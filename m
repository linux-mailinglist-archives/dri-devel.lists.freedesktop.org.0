Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAC028E848
	for <lists+dri-devel@lfdr.de>; Wed, 14 Oct 2020 23:18:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B9FB6EB6F;
	Wed, 14 Oct 2020 21:18:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95816EB6F
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Oct 2020 21:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602710297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=8K91tpPhSfeMTW8U/TmEjC3SOUcTAJmMSlYekWW/OxY=;
 b=a+F0ivxAfDGwnZ9es+zUJhKBtrbfgotI6BY9dDrQPWSMgLkNB5fO9u9d59XuZ+QLmYSfGl
 P7ySYZ5YhDB6h5/4j5sMCZGN4GAxxYapWoAjFCFnvgztvudXPaYiirJFwTvHpHQUyXQlfV
 K6v+yVnuiYqrM0QJniGH9KyqIt9tIQc=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-TFD7wIocMbebtLYMPYbG7w-1; Wed, 14 Oct 2020 17:18:13 -0400
X-MC-Unique: TFD7wIocMbebtLYMPYbG7w-1
Received: by mail-oi1-f199.google.com with SMTP id y2so194963oie.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Oct 2020 14:18:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=8K91tpPhSfeMTW8U/TmEjC3SOUcTAJmMSlYekWW/OxY=;
 b=q1Nv9xdUV+tVmGwxZ0k5jUUx7bJTviznqLjS8PnWjSFOIuY7F3zpZ+5Ng65eksvM+D
 HJi9gOv7rIViP5F/IUxfbgQpTuCiGoM+CnSroGsz73hxn2TysngvKPGU16kflkyJ8VZO
 KMsWIxInAf+1Vgfs/d+uQnGEkun4hBb6cKdOZXe74zSqwzByiMuvMBI1gaqjvYk2YSM/
 aHxE6AbO4SAVgXYnXB+57vnRzOw/CEucpFk2G2t2Znwv+iHvCn1SGDHWmBrt3+T6jfhj
 DEaT+ZqTZAo3ud4n0dQg49OSg//jgIdqNktrdN5P6DnF/BNPuHo9tcrlE3R1j6yPYuoP
 9KBg==
X-Gm-Message-State: AOAM532sMCOoF19Ny5sj95a4r00Jaamgrpb9QiqnOSc4AGPqLaAGNJOz
 TBpNB0h0eFwxvhZbiIW1oIU+lxgX1+87u5rrUsUcRaNCBLu8zxpdg3+rvNCHXyw8mx2O8qnFDcy
 c6zDQ9rV4lCAcZDWalKVgmvFgr9yK
X-Received: by 2002:a05:6830:1301:: with SMTP id
 p1mr443969otq.241.1602710292748; 
 Wed, 14 Oct 2020 14:18:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9w+ALYnZxhun1GSiSOJtZIsFA++Kd8+X4Bet9rJd1T4rMk1BW+ckqvG/zmRHnTzML5VPvuA==
X-Received: by 2002:a05:6830:1301:: with SMTP id
 p1mr443961otq.241.1602710292532; 
 Wed, 14 Oct 2020 14:18:12 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id h15sm232082ots.31.2020.10.14.14.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2020 14:18:11 -0700 (PDT)
From: trix@redhat.com
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, Hawking.Zhang@amd.com, Dennis.Li@amd.com,
 tao.zhou1@amd.com, ray.huang@amd.com, guchun.chen@amd.com,
 sonny.jiang@amd.com, xiaojian.du@amd.com
Subject: [PATCH] drm/amdgpu: add missing newline at eof
Date: Wed, 14 Oct 2020 14:18:06 -0700
Message-Id: <20201014211806.16282-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Tom Rix <trix@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tom Rix <trix@redhat.com>

Representative checkpatch.pl warning

WARNING: adding a line without newline at end of file
 30: FILE: drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.h:30:
+#endif

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_4_1_sh_mask.h | 2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.h           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_4_1_sh_mask.h b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_4_1_sh_mask.h
index f26246a600c6..4089cfa081f5 100644
--- a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_4_1_sh_mask.h
+++ b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_4_1_sh_mask.h
@@ -745,4 +745,4 @@
 #define RLC_EDC_CNT2__RLC_SPM_SE7_SCRATCH_RAM_SEC_COUNT_MASK                                                  0x30000000L
 #define RLC_EDC_CNT2__RLC_SPM_SE7_SCRATCH_RAM_DED_COUNT_MASK                                                  0xC0000000L
 
-#endif
\ No newline at end of file
+#endif
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.h b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.h
index 29929b360db8..d8696e2274c4 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.h
@@ -27,4 +27,4 @@
 
 extern void vangogh_set_ppt_funcs(struct smu_context *smu);
 
-#endif
\ No newline at end of file
+#endif
-- 
2.18.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
