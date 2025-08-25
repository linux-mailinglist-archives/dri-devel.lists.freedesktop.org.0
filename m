Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 942E6B336E7
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 08:55:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D2410E346;
	Mon, 25 Aug 2025 06:55:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Tp+dIlTy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90BD910E236
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 02:32:04 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-2445824dc27so36350625ad.3
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 19:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756089124; x=1756693924; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=O10Bl4oetUFVZeVcIyFTPuGNIUEAVGF7F9sLfkbwSS4=;
 b=Tp+dIlTy5WLKS6IhBn+jH468spkJaiQxwDLqXB+YyTsDWAzqKNI0COclzr2VrRyTMC
 KkA2PawpCD/xlsHhsUBw4sb+ez2ny0DDNe7ZQLEUWYazz9KH/AdHJbc0BDeZdoZvzr1a
 QzrUo+txmBRq6z1KY+bJ2V9JkavL/zyadbsreHZWvJNVLDy6mBEYHdcvkknDZSkow4ul
 BnoFjWdWwX9UYiNwylqi4Ch/T7OFCaFS0hFvAzLr2UXEziSPdZ1NkLhdG76oNdapSroT
 ZXV9OIhayYOuj0ozg6IKCLJloWMHHSP8VWefM938ubaHT+32H9dPspXc4pamrRy2le6E
 l1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756089124; x=1756693924;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O10Bl4oetUFVZeVcIyFTPuGNIUEAVGF7F9sLfkbwSS4=;
 b=Wgx6BGi726yMH0TevK9pceIWQqIRV2QedpzM0FS2opRI2PtUGYJXBlkgtByqfyBU70
 35iEFunuuLBso796q27nrvxNbIOx+KQsQQUgLuQZkcn8cKs6hLc4hg3gyd9e2viZiOPd
 EgOCsOpwE1BpIrZ4gmw0lwFPBz+/3DCqfIGDVpoUx/9djmtGP2oyVpg1HB78YT2CQAuy
 fGTLaLJNTp8cJUEM/T9Fpvm2ivSxLQvZhspnh7Jj+pLg+X+5lhn/o8rco2k+TgMQb63P
 MDy6XhkCehvtP45+c2XTu/+3BOLJCHq4TWgM2V9EG5FKI/sCMV4qtYbSU/myO5lniu+A
 8QUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4bGTajJp0owCqi/lkUHUAaGrGwnyFKERa+h7j/OSOfJhq9NFzTM86L14NYPUfG7Zli/3BsgJKOV8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjO3y7ivfhgzyTh/cK7hVb/ISQhrvKUmqnTNkaH73CXwNkULhk
 GXzJ+Zbod/5LllVOafmaZ/OmFaTcnkAMhtRvvYL+HTb+wT4aLTRImFZm
X-Gm-Gg: ASbGncuKw/zlooo9yNmVkSbYaOUPxPZcq2VEDquu9jygi/E4bR5/vrzU8IU1tRAuKQb
 bQPjT3vL/2YRy4k5tp01sL+cXHHbqUP3DOAyxHeyKFEa86jvaaLairWPjKyGGyMc6gz5K0xOfGw
 yk3iTVwryzwwTzfjKMQJHZ+dSMYxKM/8qPvujY/sLrewSY3TG9ivhtUriSJFg5BVZ5serIdgF5T
 OAbwsoRVw0C5AeD1lh0tL50bULMS8zzQKa6p9j9LTw4XVdmjH00gyTT5L1LARqqhjOstiQ9EOAH
 IYGDyHcXGCQj1nV4+tm+bMMpggm13huysv07y36CdeLiwHOA3v4LV2htdsAqzYENNTPB2YYTRwY
 574qrFLGQQFtrNeINGwZclCc9hhTpqnfMeTjwbFmPhHucep64qzAuJxNO7T0Ofq5LBI1qFEsQyU
 w=
X-Google-Smtp-Source: AGHT+IHiK6ZNzGbxD1aVZDdpEIJSJdRVCIVYu6qhCycor6e6tzkhdDgkg9nCBYkly1FiN66XhTD6Bw==
X-Received: by 2002:a17:903:38c4:b0:240:5bde:532d with SMTP id
 d9443c01a7336-2462ef4c8eemr131114705ad.38.1756089123935; 
 Sun, 24 Aug 2025 19:32:03 -0700 (PDT)
Received: from localhost.localdomain ([114.242.33.243])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-246687af234sm53905175ad.48.2025.08.24.19.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 19:32:03 -0700 (PDT)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>,
 Yury Norov <yury.norov@gmail.com>, Qianqiang Liu <qianqiang.liu@163.com>,
 Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Shixiong Ou <oushixiong@kylinos.cn>,
 Jinchao Wang <wangjinchao600@gmail.com>, Zsolt Kajtar <soci@c64.rulez.org>,
 Ingo Molnar <mingo@kernel.org>, Nam Cao <namcao@linutronix.de>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Joel Granados <joel.granados@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Sohil Mehta <sohil.mehta@intel.com>,
 Feng Tang <feng.tang@linux.alibaba.com>,
 Sravan Kumar Gundu <sravankumarlpu@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Anna Schumaker <anna.schumaker@oracle.com>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Max Kellermann <max.kellermann@ionos.com>,
 Yunhui Cui <cuiyunhui@bytedance.com>, Tejun Heo <tj@kernel.org>,
 Luo Gengkun <luogengkun@huaweicloud.com>, Li Huafei <lihuafei1@huawei.com>,
 Thorsten Blum <thorsten.blum@linux.dev>,
 Yicong Yang <yangyicong@hisilicon.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kexec@lists.infradead.org,
 linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 9/9] watchdog: skip checks when panic is in progress
Date: Mon, 25 Aug 2025 10:29:37 +0800
Message-ID: <20250825022947.1596226-10-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250825022947.1596226-1-wangjinchao600@gmail.com>
References: <20250825022947.1596226-1-wangjinchao600@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 25 Aug 2025 06:55:43 +0000
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

This issue was found when an EFI pstore was configured for kdump
logging with the NMI hard lockup detector enabled. The efi-pstore
write operation was slow, and with a large number of logs, the
pstore dump callback within kmsg_dump() took a long time.

This delay triggered the NMI watchdog, leading to a nested panic.
The call flow demonstrates how the secondary panic caused an
emergency_restart() to be triggered before the initial pstore
operation could finish, leading to a failure to dump the logs:

  real panic() {
	kmsg_dump() {
		...
		pstore_dump() {
			start_dump();
			... // long time operation triggers NMI watchdog
			nmi panic() {
				...
				emergency_restart(); // pstore unfinished
			}
			...
			finish_dump(); // never reached
		}
	}
  }

Both watchdog_buddy_check_hardlockup() and watchdog_overflow_callback() may
trigger during a panic. This can lead to recursive panic handling.

Add panic_in_progress() checks so watchdog activity is skipped once a panic
has begun.

This prevents recursive panic and keeps the panic path more reliable.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
Reviewed-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 kernel/watchdog.c      | 6 ++++++
 kernel/watchdog_perf.c | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 80b56c002c7f..597c0d947c93 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -740,6 +740,12 @@ static enum hrtimer_restart watchdog_timer_fn(struct hrtimer *hrtimer)
 	if (!watchdog_enabled)
 		return HRTIMER_NORESTART;
 
+	/*
+	 * pass the buddy check if a panic is in process
+	 */
+	if (panic_in_progress())
+		return HRTIMER_NORESTART;
+
 	watchdog_hardlockup_kick();
 
 	/* kick the softlockup detector */
diff --git a/kernel/watchdog_perf.c b/kernel/watchdog_perf.c
index 9c58f5b4381d..d3ca70e3c256 100644
--- a/kernel/watchdog_perf.c
+++ b/kernel/watchdog_perf.c
@@ -12,6 +12,7 @@
 
 #define pr_fmt(fmt) "NMI watchdog: " fmt
 
+#include <linux/panic.h>
 #include <linux/nmi.h>
 #include <linux/atomic.h>
 #include <linux/module.h>
@@ -108,6 +109,9 @@ static void watchdog_overflow_callback(struct perf_event *event,
 	/* Ensure the watchdog never gets throttled */
 	event->hw.interrupts = 0;
 
+	if (panic_in_progress())
+		return;
+
 	if (!watchdog_check_timestamp())
 		return;
 
-- 
2.43.0

