Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 934358287C0
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 15:09:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7B2C10E423;
	Tue,  9 Jan 2024 14:09:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC0710E40C
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 14:09:25 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-557678c50feso571354a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 06:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1704809364; x=1705414164; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vfBxqDS9hHlXmsmRF9XL3tSKxrM0B3suizklfFVNCPU=;
 b=CzXJaSfrEGyOBojO52zAUUjD4dmfQ24dfLQ/g7cwXjl+Yd0fjTuJlYl/EyJcCZkkZY
 BVecusmdYGG4o33NYJOF22ZnDhZ0eRdMIYUBqgg9jq+hUem515Dq+fHvZnbfATox1Jty
 0jA8EKfzBWS1SosP7KWBfcGXreaZOsi/3zKJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704809364; x=1705414164;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vfBxqDS9hHlXmsmRF9XL3tSKxrM0B3suizklfFVNCPU=;
 b=JTimr294d7I5t7+6aaJmiGwm2+FGPKnxcDk9qUKv6GlTNuqwg2PedYXjr7xlId8965
 rgZVossXV0u8cerIP95zM2qyyezxP73k1tpRgoqONsNozoNCNwi4P0HXzAur2wagsWnR
 hoM8XfKF76vWTP3mOwRb8fhR5l49jiBqxdLq1/XjLV+O+OcYjymvJVL6E1JveeWeSQVT
 lBg2J7TXVd4LnRlIQ+wDoUfMcB4/mlAwDcw+CLwdsAo5uZvGAQDJwbLZJR0VMtCAUKGg
 3nPR83X2fh4bnDPYMAB9uqb6QxbsxnImHRcOwwka6aB7m/MC2b3G0IHVI81u9Lp0eTWB
 HcPg==
X-Gm-Message-State: AOJu0YzYjlPUOQGyWfKqBeHqVjBNRsxgM628q0XBhhffT7tAbIGV2nvo
 XiRJyu34XyX2unJGVLEpOZPzus2EVXvA3g==
X-Google-Smtp-Source: AGHT+IFy0E+eIQjrX/iymTN4VUkB9dTkTMY4EJTa9tSrFbeWJr42iW8bPR9nUN+pr7lUJKLaWkgU2Q==
X-Received: by 2002:a50:cdc5:0:b0:557:4249:44 with SMTP id
 h5-20020a50cdc5000000b0055742490044mr6444656edj.1.1704809363734; 
 Tue, 09 Jan 2024 06:09:23 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 el10-20020a056402360a00b00557f54cceb6sm907262edb.4.2024.01.09.06.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 06:09:23 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] kernel-doc: document object-like preprocessor macros
Date: Tue,  9 Jan 2024 15:03:45 +0100
Message-ID: <20240109140345.3344094-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.43.0
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
Cc: Jonathan Corbet <corbet@lwn.net>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 "Steven Rostedt \(Google\)" <rostedt@goodmis.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I had no idea this exists, but Randy pointed out it's been added quite
a long time ago in cbb4d3e6510b ("scripts/kernel-doc: handle
object-like macros"). Definitely way before I started to write all the
drm docs sadly, so there's a few things where I skipped writing
kernel-doc since I didn't know it was possible.

Fix this asap by documenting the two possible kernel-doc flavours for
preprocessor definitions.

References: https://lore.kernel.org/dri-devel/dd917333-9ae8-4e76-991d-39b6229ba8ce@infradead.org/
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 Documentation/doc-guide/kernel-doc.rst | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/doc-guide/kernel-doc.rst b/Documentation/doc-guide/kernel-doc.rst
index 6ad72ac6861b..a966f1fd5c30 100644
--- a/Documentation/doc-guide/kernel-doc.rst
+++ b/Documentation/doc-guide/kernel-doc.rst
@@ -341,6 +341,32 @@ Typedefs with function prototypes can also be documented::
    */
    typedef void (*type_name)(struct v4l2_ctrl *arg1, void *arg2);
 
+Preprocessor defines documentation
+----------------------------------
+
+There are two ways to document preprocessor defines. The first works more or
+less like kernel-doc for functions, including parameters::
+
+  /**
+   * FUNC_NAME() - Brief description
+   * @arg1: description of arg1
+   * @arg2: description of arg2
+   *
+   * Description of the preprocessor function, may have multiple paragraphs.
+   */
+  #define FUNC_NAME(arg1, arg2)
+
+The second type is different and for object-like preprocessor macros without any
+parameters::
+
+  /**
+   * define MACRO - Brief description
+   *
+   * Description of the object-like preprocessor macro, may have multiple
+   * paragraphs.
+   */
+   #define MACRO
+
 Highlights and cross-references
 -------------------------------
 
-- 
2.43.0

