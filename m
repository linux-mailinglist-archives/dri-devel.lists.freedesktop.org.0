Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A34FC2AAE05
	for <lists+dri-devel@lfdr.de>; Sun,  8 Nov 2020 23:50:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E38897EE;
	Sun,  8 Nov 2020 22:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D65C6EAB6
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 16:38:48 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id 11so1611031qkd.5
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 08:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8trkRjP9UFPyJqjxFvhkrNselLfEoUHaVtNBCoJ4XCk=;
 b=laDTNhhdkAYgGr6Xrud4Lecf7gNqF0snM2UEQZZjGWky4tYPZf0r3voT2a4dED5KIZ
 cl4pQlYqj6ZgFT7n9Pq4eiXWmZNFws4hQxefJKlftNZEsiS8zzzJN5cqpvrkkYustkYz
 UmdZvFy9WV7LCDt9qMLfXyfswlMlHY0UD1/Tnbp+mJ8+3fI/JRUWVQh0IROzsfvQoBlV
 o1aHMzOOV1GDIyxa1NdiC5cHpVh7Idc03JMhHbew9YEA2phGFO9MOG/KeIPk5Sm9dIt8
 7lo+USi40aetpZWFMU6CvX/+cTRe9g3HzeFt4qYI/TrDdJEBQd5Zv6r4tMICd5nGc1uO
 MXgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8trkRjP9UFPyJqjxFvhkrNselLfEoUHaVtNBCoJ4XCk=;
 b=tWWoarC0LIT0OTK1QaP7LQjHhTYTYuuM+oGa/itpdXauJvVTS8cAj7sg72xv/m6YH7
 n54PszK3rXUdccHZHeWnS8FfDXQLAUyuxYVQ/0BZvFxNaHeKusGdPjJM4GT3Eg+EPNVB
 0DThc+P8aLPqFvxyChP3vtb0HiHO70qUwdLlAE9X0HX9fOywXApFjCYPKWN3tXBtIJyE
 KSMgU9pZhP0AKxlV0MLK6xrdRrdyWRipmvBW9tnxoux20vRkHQuBIqb4tEQ2tH+n5RKl
 ZpfaRkKz+Gjb8yiHdqHlq0erwKMfKDn1J+jrREEBARb4mzEJPHWivr5Jm/ExCpjMmtni
 lgIA==
X-Gm-Message-State: AOAM532cuCRos8Q3nSmRHE14SgTBDx32Vz0bFSOBvfvRiezGGT3GB0Pd
 K/ehZJha3IkF+eXCE/qXOhMPQQ==
X-Google-Smtp-Source: ABdhPJxIHhdp/AKI2KvUFtqY0ovg2l83Re+m5GEneL6YbUxUROsQNG8iXGSoza/7wjV/dd2t5WoU3w==
X-Received: by 2002:a37:7304:: with SMTP id o4mr2450129qkc.351.1604680727479; 
 Fri, 06 Nov 2020 08:38:47 -0800 (PST)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id s3sm860000qkj.27.2020.11.06.08.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 08:38:46 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2 5/5] drm/msm: bump up the uapi version
Date: Fri,  6 Nov 2020 11:34:34 -0500
Message-Id: <20201106163437.30836-6-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20201106163437.30836-1-jonathan@marek.ca>
References: <20201106163437.30836-1-jonathan@marek.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 08 Nov 2020 22:49:24 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Increase the minor version to indicate the presence of new features.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/msm_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 3f17acdf6594..7230d3c0eee5 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -39,9 +39,10 @@
  *           GEM object's debug name
  * - 1.5.0 - Add SUBMITQUERY_QUERY ioctl
  * - 1.6.0 - Syncobj support
+ * - 1.7.0 - MSM_BO_CACHED_COHERENT and DRM_IOCTL_MSM_GEM_SYNC_CACHE
  */
 #define MSM_VERSION_MAJOR	1
-#define MSM_VERSION_MINOR	6
+#define MSM_VERSION_MINOR	7
 #define MSM_VERSION_PATCHLEVEL	0
 
 static const struct drm_mode_config_funcs mode_config_funcs = {
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
