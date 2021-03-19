Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB4834165C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 08:23:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D156E996;
	Fri, 19 Mar 2021 07:23:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4106E14F
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 05:44:47 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id y200so5105841pfb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 22:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wz/WsPQUF/kjHU+6IEFrzHVpAW1UcXHBX33paA47bqk=;
 b=TdczdL9JGhDcdhS0IIrBZ0ipqyUNx3ZVtASANAdvYlH2UdFO3h9avLWRdVP9zkgnd1
 f57qBRdj+vB3H6aXArxRK6q0QhcMZ0sEy81gJdsREyxAodkSZpi3IGvFWKNzZjVDQGtq
 jvpTNi6CvD3+SHS3cpDTofIawYJjLWkT1kEfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wz/WsPQUF/kjHU+6IEFrzHVpAW1UcXHBX33paA47bqk=;
 b=d0gTod393HSGuyJgO96viFZC5AYmF0KfuYZfa7DzsMM56ZGZiMM3rwh0bnOixZQqCn
 qbAyIbeBDUdhHgHUAOYOw1fFAYmrplfo3bIHAkattS+9o9PHXfbNBRsj0yGIEQOmqT0T
 2RreFoEPVu/yQi/O7NjnZcrO6uiQuxPr4/6xYJsz/WUzGN9MH1PzC3UFLYEFJYaE5H7S
 wN8DEgAczo9hAAosRhKSaJIIQm+NbuQbAPpc7PNNjwMyk/CQhLTFYY0WN63dndZRS+tm
 lLz+TRCuVuEsLjzaiXwGmsIEDIuFqql+ahxcRs+Kh3VE2CERT9YN0Wkoec88CcrCzJJj
 8W+w==
X-Gm-Message-State: AOAM530SCWIcdZs++JE8kpvFAsXPOZ0bclaOdaNXYxwMMEKMXj4AgnLw
 b8IjF0+3C3oQ0HdFEk+B1sDt4A==
X-Google-Smtp-Source: ABdhPJzNAUDAluK8lkNYzmEWoqVGWUqyMjKD5Xro5rorUyMlUXLZeAFWuBxdE809wFGbu+cmOLDO/Q==
X-Received: by 2002:aa7:9202:0:b029:1f2:9439:f4b4 with SMTP id
 2-20020aa792020000b02901f29439f4b4mr7420365pfo.12.1616132687025; 
 Thu, 18 Mar 2021 22:44:47 -0700 (PDT)
Received: from evanbenn1.syd.corp.google.com
 ([2401:fa00:9:15:d0d6:1466:f005:1b0a])
 by smtp.gmail.com with ESMTPSA id mr5sm4184087pjb.53.2021.03.18.22.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 22:44:46 -0700 (PDT)
From: Evan Benn <evanbenn@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/amd/display: Set AMDGPU_DM_DEFAULT_MIN_BACKLIGHT to 0
Date: Fri, 19 Mar 2021 16:44:33 +1100
Message-Id: <20210319164418.1.I5d51cc12776ee8993a1a54089b548952f75ada41@changeid>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 19 Mar 2021 07:23:08 +0000
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
Cc: Stylon Wang <stylon.wang@amd.com>, Eryk Brol <eryk.brol@amd.com>,
 David Airlie <airlied@linux.ie>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Evan Benn <evanbenn@chromium.org>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Anand <amistry@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

AMDGPU_DM_DEFAULT_MIN_BACKLIGHT was set to the value of 12
to ensure no display backlight will flicker at low user brightness
settings. However this value is quite bright, so for devices that do not
implement the ACPI ATIF
ATIF_FUNCTION_QUERY_BRIGHTNESS_TRANSFER_CHARACTERISTICS
functionality the user cannot set the brightness to a low level even if
the display would support such a low PWM.

This ATIF feature is not implemented on for example AMD grunt chromebooks.

Signed-off-by: Evan Benn <evanbenn@chromium.org>

---
I could not find a justification for the reason for the value. It has
caused some noticable regression for users: https://bugzilla.kernel.org/show_bug.cgi?id=203439

Maybe this can be either user controlled or userspace configured, but
preventing users from turning their backlight dim seems wrong.

Also reviewed here: https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2748377

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 573cf17262da..0129bd69b94e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3151,7 +3151,7 @@ static int amdgpu_dm_mode_config_init(struct amdgpu_device *adev)
 	return 0;
 }
 
-#define AMDGPU_DM_DEFAULT_MIN_BACKLIGHT 12
+#define AMDGPU_DM_DEFAULT_MIN_BACKLIGHT 0
 #define AMDGPU_DM_DEFAULT_MAX_BACKLIGHT 255
 #define AUX_BL_DEFAULT_TRANSITION_TIME_MS 50
 
-- 
2.31.0.291.g576ba9dcdaf-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
