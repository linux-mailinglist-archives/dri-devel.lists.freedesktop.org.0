Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC7120BF25
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jun 2020 09:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B18726E52C;
	Sat, 27 Jun 2020 07:03:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F06326E529
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jun 2020 07:03:41 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id 67so1565686pfg.5
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jun 2020 00:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GEZGJe51GehcxNBEXCjeuCvNUVTUbWGMU9LfdoST7kI=;
 b=cjXMwayPxAVThNdqSwq9gh/XXADf8DxfXH5Am4oMd6Gzkk3HKiuVeQBOjv3pA4go09
 GYrHH5eUSlGtVrxnx0CaKolfLkX8IWfanhhoBcg935mVJ6DKtduNPeSotSqrdDCloxin
 OJC8MRcaDRimzPxiRnmKyq3boKDUYPgFPV61o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GEZGJe51GehcxNBEXCjeuCvNUVTUbWGMU9LfdoST7kI=;
 b=rVSUmMSHOXgECt5m+tYWs4l8wklAIvm37oumKXL+jXW0isQp2HQpwCPhUsl0cBUm5v
 hzEkuJSbTCLbWFU0I45bYINbAe8CafYrEaN8koTKuxFMuY3klJQOv5lXYGSwDcmUcDzY
 xhL6osmqFUZ/oQAxpGAwzaLB5PbKPlvhlRAb6ngOtNXhV2T8u4R0tBkoBacxW59l8AoP
 A6e9pqmRLe+pCtKMXlzkmhc5GIDTVvbJTe6DDNuXIRRb96veP1MvDuxx+oxcyeoMWGuG
 JohoZyogZIyCUc6BivPtQjv+zvSqJIH4YoAfZPe7TmpfJkPZkZ59gaKTeWnHzD7nUBqk
 t0nw==
X-Gm-Message-State: AOAM5312vNMP8HA2V7gfqGN/IjWldQE+K4OzkiyMMua/v6+ZCEd5lJgH
 EbT0MJlpYw9FdVLkYetLB10l2g==
X-Google-Smtp-Source: ABdhPJzEaHy/nTKowjvtlIgATfBjZFG3DWxUouu/iNdEBoW9SD1bHdr7RU6EhcYh7ZY2/EGoj98Wdg==
X-Received: by 2002:aa7:82d5:: with SMTP id f21mr6259533pfn.244.1593241421610; 
 Sat, 27 Jun 2020 00:03:41 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:d8b7:33af:adcb:b648])
 by smtp.gmail.com with ESMTPSA id u4sm28133269pfl.102.2020.06.27.00.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jun 2020 00:03:41 -0700 (PDT)
From: Nicolas Boichat <drinkcat@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] media: atomisp: Replace trace_printk by pr_info
Date: Sat, 27 Jun 2020 15:03:05 +0800
Message-Id: <20200627070307.516803-3-drinkcat@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
In-Reply-To: <20200627070307.516803-1-drinkcat@chromium.org>
References: <20200627070307.516803-1-drinkcat@chromium.org>
MIME-Version: 1.0
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
Cc: Peter Chen <peter.chen@nxp.com>,
 "Guilherme G . Piccoli" <gpiccoli@canonical.com>,
 Rafael Aquini <aquini@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Todor Tomov <todor.too@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Howells <dhowells@redhat.com>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Will Deacon <will@kernel.org>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Kees Cook <keescook@chromium.org>, devel@driverdev.osuosl.org,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Nicolas Boichat <drinkcat@chromium.org>, Jayshri Pawar <jpawar@cadence.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Andy Gross <agross@kernel.org>,
 Tomas Winkler <tomas.winkler@intel.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 linux-media@vger.kernel.org, Pawel Laszczak <pawell@cadence.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Chao Yu <chao@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Roger Quadros <rogerq@ti.com>, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Colin Ian King <colin.king@canonical.com>,
 Andrew Morton <akpm@linux-foundation.org>, Divya Indi <divya.indi@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

trace_printk should not be used in production code, replace it
call with pr_info.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>

---
 drivers/staging/media/atomisp/pci/hmm/hmm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index 42fef17798622f1..2bd39b4939f16d2 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -735,11 +735,11 @@ ia_css_ptr hmm_host_vaddr_to_hrt_vaddr(const void *ptr)
 
 void hmm_show_mem_stat(const char *func, const int line)
 {
-	trace_printk("tol_cnt=%d usr_size=%d res_size=%d res_cnt=%d sys_size=%d  dyc_thr=%d dyc_size=%d.\n",
-		     hmm_mem_stat.tol_cnt,
-		     hmm_mem_stat.usr_size, hmm_mem_stat.res_size,
-		     hmm_mem_stat.res_cnt, hmm_mem_stat.sys_size,
-		     hmm_mem_stat.dyc_thr, hmm_mem_stat.dyc_size);
+	pr_info("tol_cnt=%d usr_size=%d res_size=%d res_cnt=%d sys_size=%d  dyc_thr=%d dyc_size=%d.\n",
+		hmm_mem_stat.tol_cnt,
+		hmm_mem_stat.usr_size, hmm_mem_stat.res_size,
+		hmm_mem_stat.res_cnt, hmm_mem_stat.sys_size,
+		hmm_mem_stat.dyc_thr, hmm_mem_stat.dyc_size);
 }
 
 void hmm_init_mem_stat(int res_pgnr, int dyc_en, int dyc_pgnr)
-- 
2.27.0.212.ge8ba1cc988-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
