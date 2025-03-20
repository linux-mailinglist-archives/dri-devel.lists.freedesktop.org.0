Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A399FA6AD94
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:53:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC0210E68A;
	Thu, 20 Mar 2025 18:53:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GhjePZ0b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B5E10E690;
 Thu, 20 Mar 2025 18:53:37 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-85b43b60b6bso41405539f.0; 
 Thu, 20 Mar 2025 11:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496816; x=1743101616; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A97O7SqLaZSxvMXU0joWzVIjgf8LaQ5hosLUzwNwu64=;
 b=GhjePZ0bbISTTGwiI9UEiASdJw/LqmJOGAZyADCWAbZU4E7OQ/NsKzhEeTp4JaDonS
 2/KFuXLkvTjRKRZr6mKBcspX87tNDaPmP8fCeplt01Uf+6VZuh/RDSUTiA6dF86guQu4
 OaLcRKoCcp5UowTj/29zG3wISopy10UDzf7TOtFOlyvwUq3fWS9PfrEBpv7FluI08NBC
 m4X/nyIHTKLlw8JR7dog3sdCqNn9g9WMxfI0f5avBTz5MNTp+CNRORKmVFmPgiDOWjaz
 /liYXG28NDIEeHV/HFt/sL5gTWr0ZYaf8EWPwAwmmczzJz93dCxgW48L0EkWDx00hRW+
 dlGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496816; x=1743101616;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A97O7SqLaZSxvMXU0joWzVIjgf8LaQ5hosLUzwNwu64=;
 b=JlecnCLQS3Qkog8ksNNUenT1f1SnUehDrivtTy6SIdHkPCWUz9zYvcLBm3bz1Ot65L
 3EAwxXSQ529cxG9pPIGk5De4l8G0h9BO+es0N5rXOiS5ysbitOPH7nT+lFYeJz4JQSWP
 lOjsEr02evQO41EW7ng+MoDF0KwxJ/wCC+HYLJhhsfXTFULQa9p5BSVeI/4Os1lM9a4p
 2IBpaM6lfgcG1G6iT99e5gI8NeU2IPcRChIIOfjQtrNpOSctUjLLDGnbfhiQHv+L6Jjj
 X6bkzSeGj7h21LHxQRRwYRyN9nezdYaVvNT0/umuWTMDQ8iiP/FvR3TnD8ZQBTt5sMPl
 aTog==
X-Forwarded-Encrypted: i=1;
 AJvYcCUW3H3xjELLcIyynWUH4HvCv/T2J2oiNJisYThyNIN/FoJcN6fAL/1jlZHxklXwZZzRmFR2iWEeFkiWbe3orA==@lists.freedesktop.org,
 AJvYcCVJs9FPDqBg5But+mAXIvaMKF5bmS3nIS7z3Q7Urn1w6k6PYONTXkGlQevZeUIkDzyNoGCWUznJPY+GOOcL0FSQ2w==@lists.freedesktop.org,
 AJvYcCVPr5BUJk3ZyW2/vP7w+kAW+sU/69xgCGroEPLedSW8GogLPE7G3hPjL0XjKf1JDDQiFsvj6oTRnomE@lists.freedesktop.org,
 AJvYcCVWs060R8N7lgs0AlA60N+UCyVY5RN2sV/ij3AwS0MPI/UM1lelqCjmor8VyfRz09Ea6O6zNJEl@lists.freedesktop.org,
 AJvYcCVoFxANyOXbmCgiNDFcyeadnug8/cN+ZjFpim7F15VosM0Bghu0+VcFQrIZVnlZSkfGQY1rbWpEF8Cf@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyusieAaHo6nEHGYTIqDDA2H3n9o8kXyAWljoXZKicFcpAVkSyu
 v0LpbXsp8th+yjzVBDm3uduYSZtqbm+AOWKBUEagTzntzM2dMEW/
X-Gm-Gg: ASbGncuvfnWhfg1kl0TDP0Wktr6SVilCY+qDFVqLjvjzy1S7GpLJLwub/mgtXK7VZsY
 KzbNGG1cgtu9r+1qkpaIiHXRnTVmOhUoWtmrMVRWDQxuTvY9w8oc3xeHCAFmyc9/8e4y1YoBVdI
 5GXkAdPcEobH9zRDJc+aqq50IG+EvccJMmb4G3Aae7E9sLDeLdYUMXlznOtJfYLGVyqjHvlPhJm
 nUx1q+fp6CsDmuZv595N7t4hqx/dlSMXOpnmxzsqYGU0clanqIzTZW0bE/gx8V+sx+0Pmz7Gwr5
 wHbCovJJM5lUYEDVjMHE6SOZlWoWErDSPE1whuHnRa8AzBnr8jo73zZ9XAWKDlLla8fdnvSkVAD
 32Q==
X-Google-Smtp-Source: AGHT+IEBYa+5JQp3odGDvBn5sd+cspLcMtd4IINkheV1kDJq50GiYDaoG3E/JZw5HEYKr6Z/40xHfw==
X-Received: by 2002:a05:6602:6a89:b0:85b:4cb9:5cf6 with SMTP id
 ca18e2360f4ac-85e2bc71838mr79684139f.0.1742496816493; 
 Thu, 20 Mar 2025 11:53:36 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:36 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 29/59] dyndbg: change __dynamic_func_call_cls* macros into
 expressions
Date: Thu, 20 Mar 2025 12:52:07 -0600
Message-ID: <20250320185238.447458-30-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320185238.447458-1-jim.cromie@gmail.com>
References: <20250320185238.447458-1-jim.cromie@gmail.com>
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

The Xe driver's XE_IOCTL_DBG macro calls drm_dbg() from inside an if
(expression).  This breaks when CONFIG_DRM_USE_DYNAMIC_DEBUG=y because
the invoked macro has a do-while-0 wrapper.

   if (cond && (drm_dbg("expr-form"),1)) {
      ... do some more stuff
   }

Fix for this usage by changing __dynamic_func_call_cls{,_no_desc}
macros into expressions, by replacing the do-while-0s with a ({ })
wrapper.  In the common usage, the trailing ';' converts the
expression into a statement.

   drm_dbg("statement form");

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
---
 include/linux/dynamic_debug.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 8043966a0fd6..80bcaad03400 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -339,20 +339,20 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
  * (|_cls):	adds in _DPRINT_CLASS_DFLT as needed
  * (|_no_desc):	former gets callsite descriptor as 1st arg (for prdbgs)
  */
-#define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {	\
-	DEFINE_DYNAMIC_DEBUG_METADATA_CLS((id), cls, fmt);	\
+#define __dynamic_func_call_cls(id, cls, fmt, func, ...) ({	\
+	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);	\
 	if (DYNAMIC_DEBUG_BRANCH(id))				\
-		func(&id, ##__VA_ARGS__);			\
-} while (0)
+		func(&(id), ##__VA_ARGS__);			\
+})
 #define __dynamic_func_call(id, fmt, func, ...)				\
 	__dynamic_func_call_cls(id, _DPRINTK_CLASS_DFLT, fmt,		\
 				func, ##__VA_ARGS__)
 
-#define __dynamic_func_call_cls_no_desc(id, cls, fmt, func, ...) do {	\
+#define __dynamic_func_call_cls_no_desc(id, cls, fmt, func, ...) ({	\
 	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);		\
 	if (DYNAMIC_DEBUG_BRANCH(id))					\
 		func(__VA_ARGS__);					\
-} while (0)
+})
 #define __dynamic_func_call_no_desc(id, fmt, func, ...)			\
 	__dynamic_func_call_cls_no_desc(id, _DPRINTK_CLASS_DFLT,	\
 					fmt, func, ##__VA_ARGS__)
-- 
2.49.0

