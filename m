Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7116C96E3
	for <lists+dri-devel@lfdr.de>; Sun, 26 Mar 2023 18:38:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CCBB10E148;
	Sun, 26 Mar 2023 16:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BBDC10E216;
 Sun, 26 Mar 2023 16:38:27 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id u10so6271989plz.7;
 Sun, 26 Mar 2023 09:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679848706;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jEKgtiO8QFe7E17SjGBY63VNUT2bmgUu7j5N6GIYXa4=;
 b=MwoiDuyPxTS9Z8dOtvnvra6vBeLLn7oR2fH8IZjoeTcQs1z0Tl9EnBa3mwzanhMEgH
 w6IpWAURpAS33RH3VF5owcNxISB2+Df8RfvZxjTYuPXT2dCJnOeJTMdhV3XQUvnbhC8I
 sZo/puQWlFh9s+0/A0tq/VLZPWKAfkGsL1GTz3Dlv2ztb3BRgP0LI5W/s15gmgDPKn4o
 eHBVv+aVfKcgDUUq4NfaEkFRmXylIitg/hvLegwLJuL+iugOB03urwMFwFmB92vYLYhk
 /to8aTUxS0wFeOZKo1ByehL56LmT3+ePE6sh63X2xuLJMM2HMgEyCEq9gbcbj/vSZkvN
 rEjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679848706;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jEKgtiO8QFe7E17SjGBY63VNUT2bmgUu7j5N6GIYXa4=;
 b=YBtUY67Kntd+j7smoW9RwhM2cosmiVdWM5ELVTrw1+h1wBAe1cF1Oj+7LSrO8Zs63n
 V2/mLZjexEnpEdOJasw31IQzPdMoz5/MJR7GtpSAfzRVDD3V8EZm5QimyskWyU0Nr4ks
 sn/Bu76SinJMWxapzvK+GYai8a9wPr5g7JOIHY08uTJiVNz0z1V6Fr70/JQYe8uhQ1Gg
 gat3HnH8q/MuNgWTdzvrz0uEQlcwOM9xA4r46+X7TgWUWNHaCypOVSoXNt5R2smhOVVd
 MiQ+dVQ0/3v/NUBG/Qr7bgbtPSgT71H5RClao2utjZIaJjM9k2Mfd0qtW7P6cP/7Lenv
 hNMQ==
X-Gm-Message-State: AO0yUKW3BHGUkOm4cVpBGASx2N1bQSHTCLsd48sRnwig1FmWQSAmqyFj
 hFRRPzsho3cjj+C8Ms1bJStWOJRcuPs=
X-Google-Smtp-Source: AK7set+b3pKwVhLF/NmGsZhRs+HpcpdkO06/1xJ22W1zOxMr7Z7de0igJ6VrMv3LMX/PVzPeQaCPUQ==
X-Received: by 2002:a05:6a20:cc59:b0:db:9a60:a52d with SMTP id
 hq25-20020a056a20cc5900b000db9a60a52dmr7057696pzb.41.1679848706162; 
 Sun, 26 Mar 2023 09:38:26 -0700 (PDT)
Received: from localhost (c-24-21-48-127.hsd1.or.comcast.net. [24.21.48.127])
 by smtp.gmail.com with ESMTPSA id
 s18-20020aa78d52000000b00627f054a3cdsm337182pfe.31.2023.03.26.09.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Mar 2023 09:38:25 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Rename drm_msm_gem_submit_reloc::or in C++ code
Date: Sun, 26 Mar 2023 09:38:13 -0700
Message-Id: <20230326163813.535762-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Danylo Piliaiev <dpiliaiev@igalia.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Danylo Piliaiev <dpiliaiev@igalia.com>

Clashes with C++ `or` keyword

Signed-off-by: Danylo Piliaiev <dpiliaiev@igalia.com>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
This is a port of a C++ compat fix that was made in mesa's copy of the
drm uapi headers.

 include/uapi/drm/msm_drm.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index dbf0d6f43fa9..6c34272a13fd 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -186,7 +186,11 @@ struct drm_msm_gem_cpu_fini {
  */
 struct drm_msm_gem_submit_reloc {
 	__u32 submit_offset;  /* in, offset from submit_bo */
+#ifdef __cplusplus
+	__u32 _or;            /* in, value OR'd with result */
+#else
 	__u32 or;             /* in, value OR'd with result */
+#endif
 	__s32 shift;          /* in, amount of left shift (can be negative) */
 	__u32 reloc_idx;      /* in, index of reloc_bo buffer */
 	__u64 reloc_offset;   /* in, offset from start of reloc_bo */
-- 
2.39.2

