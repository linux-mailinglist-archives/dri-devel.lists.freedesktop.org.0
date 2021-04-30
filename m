Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DE8370026
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 20:05:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 414426F587;
	Fri, 30 Apr 2021 18:05:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18CE86F587
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 18:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619805915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QlUIlAKYE4495cvc4WfUS3fiQGRr+yuPORiuKa9dPbk=;
 b=QF38Ttx1kbvUhnJ6/uGHpXahrtJaEfSrdwTPRT7jPzPxQgGp1n9rehykriI+edjC+jx5q9
 jmwG9h6/VNIuyTohRN+FRadbAx8ZaDAHeTDlqvnIy74etZdr5tSKC3pvKYei7lHhn0gbVf
 YQDbgwxRqxlcEU5mW/OHXN1E7dP+XZQ=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-keFCLnFlPpWjoY3pXyW1Iw-1; Fri, 30 Apr 2021 14:05:13 -0400
X-MC-Unique: keFCLnFlPpWjoY3pXyW1Iw-1
Received: by mail-qv1-f69.google.com with SMTP id
 f7-20020a0562141d27b029019a6fd0a183so33647656qvd.23
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 11:05:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QlUIlAKYE4495cvc4WfUS3fiQGRr+yuPORiuKa9dPbk=;
 b=kzwmPwhF0WpDWiXTsw7gkYH5LQ5TsGiXGaS16JpWGFRomaPJMYWFuVo06NvxcKmBlG
 ocv7EWFPCsy421K82iys1617vWktmwSeD1TF6Okg5S1pjbm4/Xl2WcydQpDkgphWREU8
 wwsOOSPpBUiJulXLquiTaCjFhGRTuPKmKQsNVRzBYh+rfOE4kxmt6xO4HivX20DCBMHq
 9U6z6YGZErAgtqNLv3nYMvkmWt3ypWlwK3ZuNhm31utGMtQdVrpKI1PC25gxyNpP98w+
 LmvLEEqlsvEaNyMgzWf6iuTLFm1lAb/KAcnhwfprFOrVvEMpXFD0Hx0KdpJX0bFhf1dd
 hDYA==
X-Gm-Message-State: AOAM530yrQy0aZF8TKTFhbYxGqJy7HlaeY2dc/hih8lzpIw3/Fhxuq9Z
 I+ozqAnqRaUIs4+ox6wIkaBQ0P55/wWcFcxZrvEeNVv29X3uNEz5fobdWfNxepHzPSwL4xygK6F
 K/i8q1cjiTEJiIHUq5vfCUNJslrzV
X-Received: by 2002:a05:620a:9dd:: with SMTP id
 y29mr6472041qky.83.1619805912706; 
 Fri, 30 Apr 2021 11:05:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0fuV+OSVOqxqrRktaPY/gHGGzWK734pNZzRkulGOtAXJjRCbXyYaNKA83MtpCVXrMGEbhuw==
X-Received: by 2002:a05:620a:9dd:: with SMTP id
 y29mr6472012qky.83.1619805912484; 
 Fri, 30 Apr 2021 11:05:12 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id p187sm2061155qkd.92.2021.04.30.11.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 11:05:11 -0700 (PDT)
From: trix@redhat.com
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, evan.quan@amd.com, nirmoy.das@amd.com,
 kevin1.wang@amd.com, ray.huang@amd.com, darren.powell@amd.com
Subject: [PATCH] drm/amd/pm: initialize variable
Date: Fri, 30 Apr 2021 10:16:54 -0700
Message-Id: <20210430171654.3326745-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tom Rix <trix@redhat.com>

Static analysis reports this problem

amdgpu_pm.c:478:16: warning: The right operand of '<' is a garbage value
  for (i = 0; i < data.nums; i++) {
                ^ ~~~~~~~~~

In some cases data is not set.  Initialize to 0 and flag not setting
data as an error with the existing check.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/pm/amdgpu_pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
index 4e459ef632ef..9a54066ec0af 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
@@ -451,7 +451,7 @@ static ssize_t amdgpu_get_pp_cur_state(struct device *dev,
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = drm_to_adev(ddev);
 	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
-	struct pp_states_info data;
+	struct pp_states_info data = {0};
 	enum amd_pm_state_type pm = 0;
 	int i = 0, ret = 0;
 
-- 
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
