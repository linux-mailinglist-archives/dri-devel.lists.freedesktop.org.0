Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5778B6235
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 21:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A23D810FF78;
	Mon, 29 Apr 2024 19:32:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dpIL0B5f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4197E10E4D6;
 Mon, 29 Apr 2024 19:32:36 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id
 ca18e2360f4ac-7d5db134badso207103639f.2; 
 Mon, 29 Apr 2024 12:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714419155; x=1715023955; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zQVyPBV5Ch/zzQnquQeBlF3N9BA6vTpLwN146FcLEmI=;
 b=dpIL0B5fnTpsX8GfHAEYseqX//tJORXRneTFYEvh408tcGROu2AdZJTZiINZvGvYwX
 QZY+EaPvwIfnB0jxozSMxE8ZgCfXHOA+xXaZ6GlLtYlQpZjKkHiGwp+XWvaR2iD5brJI
 6fxuARYKW7oQjyraW/5eGt1fLgog4+hYRVDYJjxHGQoctRpAA22T7n2RqT3wX+xZKeQy
 C1qE+6XnMpV9MjgNffvnUAv1CrRhe+5dKMcQQEPQgm5EIN9APT41EnWlfU6uKDSiAF5V
 mG+XwcUErehGwvs/UgWCyfMzkzCKMXg8TIwr7YAd5st7ELk2f3hVsoylB0+VUWoZPWo5
 9ywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714419155; x=1715023955;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zQVyPBV5Ch/zzQnquQeBlF3N9BA6vTpLwN146FcLEmI=;
 b=YKGKx3RVGzwQnEFj3rgwjstzZLwGVr4WwaOh7uJIc5hqKdKSf/eVI0MRdHn6s4twRf
 AOYJqqVG5nW1Vp0bsm6sg4OB4MZ41xRpZQ4wUX6DSIBBhuziJLm1QPf1ZVoQch7tpnoS
 51KJy6Krk8oegZYIemppiF6X+yohYXPpi7p+y+kqAjYDUFsdgrgd8zI2gOwqMvzOVizj
 7CmN8Ybs4GCbEI28aMeQTzCWJAwm3xC/dsyvAzt3UhTBp9WblYTcqX58uu58XRbZiCSV
 GV+doN5cPznLAtP314QLQofPSMrbTZ54VlGHM0SZvhANQhJKL4XWtR91yShZr75YgyCC
 OKhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWExPzvDLGlyA5ayQ0fif2yjt2u0fnvIlHiMC6oYuXYZ+boCNn/nk1SC0vIJB38zMyWgbGH/AapOJ4bAN6iAfEKlDqSJBwS701xuM32sdr5szeIHsa4oj4UAccEO7kUOir/gAm7fysP00M5Gl6OYcozCUEEVqqBSNcGCOuDfSX1+1Ge8KzIUnJBa61Etf1zFrOB3ORm/+Ify/2AkpAcIitBD8PIJqwCHEZFaR2VJ4295D0Kd30=
X-Gm-Message-State: AOJu0YxGXI1IgjISUlCxrFWmCrzcFu2Eih64Yj4BapgKf62UFlUhhc1+
 vuDk8G9CCvpxH8K/ffyNcEbNkcJtr/H/xlJTAVx4f7UCsLnWF5gQ
X-Google-Smtp-Source: AGHT+IFwjPQnHNdpL82QFoyvK82ch9P2MSNspb9WoQ/jz8r4btCyyStrJ5splTPFta5Lxtp3yMCjpQ==
X-Received: by 2002:a5d:8498:0:b0:7d5:f78f:ab21 with SMTP id
 t24-20020a5d8498000000b007d5f78fab21mr13368935iom.11.1714419155409; 
 Mon, 29 Apr 2024 12:32:35 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 dq18-20020a0566021b9200b007d5ec9b77aesm5988402iob.51.2024.04.29.12.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 12:32:34 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ukaszb@chromium.org, linux-doc@vger.kernel.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, seanpaul@chromium.org, robdclark@gmail.com,
 groeck@google.com, yanivt@google.com, bleung@google.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v8 18/35] selftests-dyndbg: exit 127 if no facility
Date: Mon, 29 Apr 2024 13:31:28 -0600
Message-ID: <20240429193145.66543-19-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429193145.66543-1-jim.cromie@gmail.com>
References: <20240429193145.66543-1-jim.cromie@gmail.com>
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

Test if /proc/dynamic_debug/control exists, exit 127 otherwise.
This distinguishes an untestable config from both pass & fail.
The 127 choice is pretty arbitrary, but imitating bisect.

That control file's presense guarantees that dynamic-debugging is
configured (unless /proc is off, unusually), without dealing with the
<debugfs> mount.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index 1be70af26a38..cb77ae142520 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -11,6 +11,11 @@ CYAN="\033[0;36m"
 NC="\033[0;0m"
 error_msg=""
 
+[ -e /proc/dynamic_debug/control ] || {
+    echo -e "${RED}: kernel not configured for this test ${NC}"
+    exit 127
+}
+
 function vx () {
     echo $1 > /sys/module/dynamic_debug/parameters/verbose
 }
-- 
2.44.0

