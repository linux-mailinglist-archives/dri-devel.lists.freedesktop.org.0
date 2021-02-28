Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A246D3274FC
	for <lists+dri-devel@lfdr.de>; Sun, 28 Feb 2021 23:56:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE9B46E425;
	Sun, 28 Feb 2021 22:56:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F4E89D7D
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Feb 2021 12:42:14 +0000 (UTC)
Received: from localhost.localdomain (abab236.neoplus.adsl.tpnet.pl
 [83.6.165.236])
 by m-r2.th.seeweb.it (Postfix) with ESMTPA id 1115E3EBAD;
 Sun, 28 Feb 2021 13:42:11 +0100 (CET)
From: Konrad Dybcio <konrad.dybcio@somainline.org>
To: phone-devel@vger.kernel.org
Subject: [PATCH 2/2] video: backlight: qcom-wled: Add PMI8994 compatible
Date: Sun, 28 Feb 2021 13:41:05 +0100
Message-Id: <20210228124106.135812-2-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210228124106.135812-1-konrad.dybcio@somainline.org>
References: <20210228124106.135812-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 28 Feb 2021 22:56:33 +0000
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Kiran Gunda <kgunda@codeaurora.org>, Jingoo Han <jingoohan1@gmail.com>,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-fbdev@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, martin.botka@somainline.org,
 ~postmarketos/upstreaming@lists.sr.ht, Pavel Machek <pavel@ucw.cz>,
 angelogioacchino.delregno@somainline.org, marijn.suijten@somainline.org,
 Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a compatible for PMI8994 WLED. It uses the V4 of WLED IP.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/video/backlight/qcom-wled.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index 3bc7800eb0a9..497b9035a908 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -1704,6 +1704,7 @@ static int wled_remove(struct platform_device *pdev)
 
 static const struct of_device_id wled_match_table[] = {
 	{ .compatible = "qcom,pm8941-wled", .data = (void *)3 },
+	{ .compatible = "qcom,pmi8994-wled", .data = (void *)4 },
 	{ .compatible = "qcom,pmi8998-wled", .data = (void *)4 },
 	{ .compatible = "qcom,pm660l-wled", .data = (void *)4 },
 	{ .compatible = "qcom,pm8150l-wled", .data = (void *)5 },
-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
