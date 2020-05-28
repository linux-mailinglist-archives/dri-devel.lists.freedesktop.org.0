Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E7B1E6F6B
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 00:46:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907636E839;
	Thu, 28 May 2020 22:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 341 seconds by postgrey-1.36 at gabe;
 Thu, 28 May 2020 19:50:18 UTC
Received: from mta-p7.oit.umn.edu (mta-p7.oit.umn.edu [134.84.196.207])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F78D6E1C0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 19:50:18 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p7.oit.umn.edu (Postfix) with ESMTP id 49Xynw6vmQz9vpP3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 19:44:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l8TWHxHWPj4o for <dri-devel@lists.freedesktop.org>;
 Thu, 28 May 2020 14:44:36 -0500 (CDT)
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 49Xynw5GDXz9vpNZ
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 14:44:36 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p7.oit.umn.edu 49Xynw5GDXz9vpNZ
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 49Xynw5GDXz9vpNZ
Received: by mail-il1-f199.google.com with SMTP id x20so188738ilj.22
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 12:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=PfzknLmfX2Bjtf5+K+UAI2zCUlxWnyr31FaRztaH9EY=;
 b=GgwTeWRsrJf6uCZBd7WIQP/vQw66yUYSI/IfKQP4/Nqx0gXbfaqNYSjwaJghfc7Its
 VNBzs7Yf5oj4ZQ2zRIUDaSA3o/aMAKiiEH0Ftk9jT4icfOYKFSwzIT53RwVyh68zFnVc
 Hb7MNIURqQd4TN3LIVHG9F8/vpp2seM6ozkVM7NJ58FH0obdTcPT+eDpBHNRB1PU1rhd
 lH3hsuKfEkMkPSg3i3fzjyK56HNHWvQs3d3mTE0j4G84MGbMXRDr5kjHFx5JheVkhlzv
 Jrxp4+VzCS9X8bQi1AntSp4fIYAEiCFBgNISwYBDcW4ovqPffcIP5L28ZEjenIj1lpXV
 dNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=PfzknLmfX2Bjtf5+K+UAI2zCUlxWnyr31FaRztaH9EY=;
 b=VFBlzEPbjCzpQFqp07ozGcQ/XC6W44Rfsbj4Vu3sKii73z/ZyqLhOYq/9eFZ8gwe1H
 wz89B8hxALmbHnzvVsAbZpgVpciWAG8kVDmR+QE1ibw9OtF+niiqj5L9tmjLgAqhTAqS
 dGdK5zIWFztCsvEU3cMJgQ+WmCYwoPY7XCPGjycM8g5A8bLhvlhvGIMgwg99FwEtTWt0
 JbE3Uo/qQXrk1w88pIRXFFOo3Yb+HXNTSjahTAOB2qed9Rpl4rhTPARXnrpvYsJRkvEi
 8TqsRxkFlyDvr3fgag/vYwzFbwJqkUhg51UCwYrZsSIpQhiynqwghpqb7v1uEusC+tR3
 GofA==
X-Gm-Message-State: AOAM533zgL/aCs301mQ5fFKv7I362bcJjXCbGMVsU0JXrnS3yat981hI
 vpgUUu1MuKghdQhSezF3j3z9mMMPoy1OVvDbt18SCt4qyyLeO30sNXLK0b0+YZ2UxjofvUUP/vJ
 ioigoVJQM9hktzr2s6YDUjkSTRx8RRobm
X-Received: by 2002:a6b:4413:: with SMTP id r19mr3702494ioa.162.1590695076080; 
 Thu, 28 May 2020 12:44:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyzHOXdfF7fbsziLAX3p+sQwgpWqimkngVD+dlB/SgAXob/nxTRKphQmLbUKH8qsco8UxYGg==
X-Received: by 2002:a6b:4413:: with SMTP id r19mr3702460ioa.162.1590695075587; 
 Thu, 28 May 2020 12:44:35 -0700 (PDT)
Received: from qiushi.dtc.umn.edu (cs-kh5248-02-umh.cs.umn.edu.
 [128.101.106.4])
 by smtp.gmail.com with ESMTPSA id s66sm3096905ilb.25.2020.05.28.12.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 12:44:34 -0700 (PDT)
From: wu000273@umn.edu
To: kjlu@umn.edu
Subject: [PATCH] omapfb: Fix reference count leak in display_init_sysfs.
Date: Thu, 28 May 2020 14:44:23 -0500
Message-Id: <20200528194424.11596-1-wu000273@umn.edu>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 28 May 2020 22:46:32 +0000
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alexios Zavras <alexios.zavras@intel.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, wu000273@umn.edu,
 Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org,
 Enrico Weigelt <info@metux.net>, Allison Randal <allison@lohutok.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Qiushi Wu <wu000273@umn.edu>

kobject_init_and_add() takes reference even when it fails.
If this function returns an error, kobject_put() must be called to
properly clean up the memory associated with the object.
Because function omap_dss_put_device() doesn't handle dssdev->kobj,
thus we need insert kobject_put() to clean up the kobject,
when kobject_init_and_add() fails.

Fixes: f76ee892a99e ("omapfb: copy omapdss & displays for omapfb")
Signed-off-by: Qiushi Wu <wu000273@umn.edu>
---
 drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c b/drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c
index 6dbe265b312d..51322ac7df07 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c
@@ -316,6 +316,7 @@ int display_init_sysfs(struct platform_device *pdev)
 			&pdev->dev.kobj, "%s", dssdev->alias);
 		if (r) {
 			DSSERR("failed to create sysfs files\n");
+			kobject_put(&dssdev->kobj);
 			omap_dss_put_device(dssdev);
 			goto err;
 		}
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
