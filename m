Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7933424AFC9
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:16:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA12A6E8EB;
	Thu, 20 Aug 2020 07:14:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [IPv6:2607:f8b0:4864:20::649])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8699C6E8A6
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 05:26:04 +0000 (UTC)
Received: by mail-pl1-x649.google.com with SMTP id t7so848393plr.19
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 22:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=lsbX1Xry7gppehECQgaCRYNE8or1PEFLIhmR1NXSOR0=;
 b=mOlrm/ypAWHV53bMT3Ty7Jh+auz977mwz7G2JytM7UUrOhtUX/Gx554bonVEsH8D+X
 n7EsfeRFgRsTd7fqJ6DGZi/OA2wlnW+LGGsLaN0fj/gFqnY4CqsjHgJZN0iyWBMDu/3a
 /xfrlcz6YiHxaw8TVMZZP/MvtrqfyIGOhLCn3vmSki/qgPs91Eu8Es6nLqhme6jpNHVw
 5uHNPVl9bAmg0ooISIwvdf3XtWpBlCW9V9DM/nAGGpxbjm1QAk6yFcTTjWax49GTa+60
 +hvFa0oTQm2qStaSIEAe+eq+HOvyDpzQ0vjxnwL3Ou49EV0FWnS4N8bE3PoIvOSOmi8o
 YgzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=lsbX1Xry7gppehECQgaCRYNE8or1PEFLIhmR1NXSOR0=;
 b=iDFWVeYoXmSc5vDqiRzL6Q6kKdGCibFaQkzUDWlH/n2nhnpgkSfeG63uXInoPDNZEL
 +SwwfVi8qQez1SnfMNsqWXTY9LerlUj3GCoDFj7oMDaRg/Y+fs4qeAx1C4eT8eVB+4ct
 W0nqQbDc6014QtJUb+k9WSSxlVKn4aKuqDEX3Z4SDU4tCtJKLMM844wkcrzQg5+/NHsc
 azAWJG+Ak7VTORhEJ5ARszx866s53Vec+FrrGiGI859jgIxNJyb3/w69HphLVMoy+wxP
 NmtCZoYS4PQsdc+q4qSWeAqsRcPOB0VBhUtDg/HgNgjxjqB9iz7otpl8W30SHkujzmsz
 Umxg==
X-Gm-Message-State: AOAM533UQUNswA2ErPavwKW6JpqqsU0xmgbhDFpMQ8vdZX76eYJl0Eux
 0AabuJS2yVab2gVjjlQLMtEvWwoA8T1q
X-Google-Smtp-Source: ABdhPJyih8WdgObyYBpQNCGv4zrgvvHc7FA9Luht98sh6VTtC3hEyRDd6ObmxGoUW4L6Dtpjj42SS2nGdSg1
X-Received: from furquan.mtv.corp.google.com
 ([2620:15c:202:1:7220:84ff:fe09:13a4])
 (user=furquan job=sendgmr) by 2002:a62:aa05:: with SMTP id
 e5mr1051919pff.70.1597901163900; Wed, 19 Aug 2020 22:26:03 -0700 (PDT)
Date: Wed, 19 Aug 2020 22:26:00 -0700
Message-Id: <20200820052600.3069895-1-furquan@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
Subject: [PATCH] drivers: gpu: amd: Initialize amdgpu_dm_backlight_caps object
 to 0 in amdgpu_dm_update_backlight_caps
From: Furquan Shaikh <furquan@google.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>
X-Mailman-Approved-At: Thu, 20 Aug 2020 07:14:47 +0000
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
Cc: Stylon Wang <stylon.wang@amd.com>, deepak.sharma@amd.com,
 Furquan Shaikh <furquan@google.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Roman Li <roman.li@amd.com>,
 amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 dri-devel@lists.freedesktop.org, adurbin@google.com,
 Mikita Lipski <mikita.lipski@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In `amdgpu_dm_update_backlight_caps()`, there is a local
`amdgpu_dm_backlight_caps` object that is filled in by
`amdgpu_acpi_get_backlight_caps()`. However, this object is
uninitialized before the call and hence the subsequent check for
aux_support can fail since it is not initialized by
`amdgpu_acpi_get_backlight_caps()` as well. This change initializes
this local `amdgpu_dm_backlight_caps` object to 0.

Signed-off-by: Furquan Shaikh <furquan@google.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index e4b33c67b634..725d8af634ee 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2853,7 +2853,7 @@ static int amdgpu_dm_mode_config_init(struct amdgpu_device *adev)
 static void amdgpu_dm_update_backlight_caps(struct amdgpu_display_manager *dm)
 {
 #if defined(CONFIG_ACPI)
-	struct amdgpu_dm_backlight_caps caps;
+	struct amdgpu_dm_backlight_caps caps = { 0 };
 
 	if (dm->backlight_caps.caps_valid)
 		return;
-- 
2.28.0.297.g1956fa8f8d-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
