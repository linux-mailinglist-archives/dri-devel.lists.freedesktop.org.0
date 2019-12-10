Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C466E119258
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 21:43:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8133D89B3B;
	Tue, 10 Dec 2019 20:43:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9692A89B3B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 20:43:14 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MN5W9-1iOcuK2SST-00J1lI; Tue, 10 Dec 2019 21:43:05 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH] drm: tegra: mark PM functions as __maybe_unused
Date: Tue, 10 Dec 2019 21:42:58 +0100
Message-Id: <20191210204304.3313845-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:LvIe3xUHuuPDkbK+6q+8yJiA9Fy+DJa+D4MMErBdioZQrBVJcRJ
 /rAyfxdAFGSUIfY2w+bfOOmxTJ7cn/ZVyDxsk34zfivVZ6VWKHgBZMtEnQfy2OTIyyMEwt7
 pm+yq9MSGrCMELZwoY1TsYYCLBGdoOQ5Erufm0z/Wf4eJjcJ3n+6CsaOtG2V4FYZgHDKRnJ
 8bN9DfRMprmBQHpb1GB6A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:B3T4ErrlCQQ=:fAyd3pJFXjEWurdJz4jTJw
 i7zZc9uIsQCe132lVtnZYbmUiBShLxoRn5JL9YRvY/kuU3lINEphRy1njgLNOLPbEcKblK7tp
 wLOIf4PcwpEPKhAnrFtdys2kOsmZmUA3A48EJ2URYCsMzkht7G+0G6tH78avnowXfnZXB1vcQ
 1jlw3Utl8kowESwtErS1J7O1+jWSGILXsbmXKfqtr0ReSBEy84DS2JYd4OUFUMLY0ACCB598s
 M4PS9Mk26Oy4j3CmQiPlz3HckwQQ4cH0NUfbN/MN/EaDC6Ye5A/UJfk/DidNPVMo77PDI9+ZJ
 bvaC0BSGXhVpLcs5HqgZsH3DQ37WEdrF7UWd9ySPA8TkFKXZ4yLQ2jPo8hCSlv4qZvDSeSnF8
 bTMz9c9Ri4rcNwIu8kqSHEIhv6ZqHaWhiM7b0s74PpccfJbSBJz7YKIgZtJIGNkKFQkAAz4Kq
 Z5ChDMLQEZE59B1/k8eHBJS+C5kGbbNtOckpABk0VXKUHNidUOnFZ37ZMYXjNZKMDWm2bfw08
 zgja4ZUoV4sgIcK14fjGozvu/8KdNSY9fqG8PAlkdor9/m0SPNrWMUP+HKlfYA+caeXBC8BzE
 SKuwvwB0UzES7RHoT6508f+z0BxdLf2jPtW1zoLlOdUMLf8ip6OxDtqV+RUfbh8PhOddzKPmN
 kX+BdwlnNGJOZVMuF9I/zD7ln/rOTfS4Mq23KVM/Y+KioLcoG/Ugp1ggjO3ILrrZLWXKW89hX
 dXwxaxlrSfjsDmStlTr4pkfifZPIa/E/dwsYXA0NJ7eDDW81dNqqFa7ra5swQMaHeLT8Z30vu
 jBr9JBHwh14CNW7zRfofiA9JzSWBCnJQZXayd6hAMzHsoE/2uOPTsX8DkkicnWid9a4UcWWX7
 2CZcNXlHLOw4+x1VsI0Q==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Without CONFIG_PM, some functions cause harmless warnings:

drivers/gpu/drm/tegra/sor.c:3984:12: error: 'tegra_sor_resume' defined but not used [-Werror=unused-function]
 static int tegra_sor_resume(struct device *dev)
            ^~~~~~~~~~~~~~~~
drivers/gpu/drm/tegra/sor.c:3970:12: error: 'tegra_sor_suspend' defined but not used [-Werror=unused-function]
 static int tegra_sor_suspend(struct device *dev)
            ^~~~~~~~~~~~~~~~~

Mark these as __maybe_unused so the compiler can drop them
silently.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/tegra/sor.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index a68d3b36b972..69b9ebee7486 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3912,7 +3912,7 @@ static int tegra_sor_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static int tegra_sor_runtime_suspend(struct device *dev)
+static int __maybe_unused tegra_sor_runtime_suspend(struct device *dev)
 {
 	struct tegra_sor *sor = dev_get_drvdata(dev);
 	int err;
@@ -3934,7 +3934,7 @@ static int tegra_sor_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int tegra_sor_runtime_resume(struct device *dev)
+static int __maybe_unused tegra_sor_runtime_resume(struct device *dev)
 {
 	struct tegra_sor *sor = dev_get_drvdata(dev);
 	int err;
@@ -3967,7 +3967,7 @@ static int tegra_sor_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static int tegra_sor_suspend(struct device *dev)
+static int __maybe_unused tegra_sor_suspend(struct device *dev)
 {
 	struct tegra_sor *sor = dev_get_drvdata(dev);
 	int err;
@@ -3981,7 +3981,7 @@ static int tegra_sor_suspend(struct device *dev)
 	return 0;
 }
 
-static int tegra_sor_resume(struct device *dev)
+static int __maybe_unused tegra_sor_resume(struct device *dev)
 {
 	struct tegra_sor *sor = dev_get_drvdata(dev);
 	int err;
-- 
2.20.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
