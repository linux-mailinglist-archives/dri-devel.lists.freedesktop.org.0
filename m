Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B6B68C745
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 21:08:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 614FF10E194;
	Mon,  6 Feb 2023 20:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 517 seconds by postgrey-1.36 at gabe;
 Mon, 06 Feb 2023 20:08:26 UTC
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC4F10E194
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 20:08:26 +0000 (UTC)
Received: from [192.168.178.23] (unknown [62.108.10.64])
 by mail.z3ntu.xyz (Postfix) with ESMTPSA id 040F5CD0C5;
 Mon,  6 Feb 2023 19:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
 t=1675713557; bh=YAA9rHwEkOLJaOcAUYlj6+0wa5Hydp2D/H7mATvbTrs=;
 h=From:Date:Subject:To:Cc;
 b=tKqFR6U77OTqstAkqc4vo1XEPa6BWNizx4FrScJppofjOeX8oDMl1P6bDfm7AZo5P
 5OeVH+6UfkHEj2+J6eFlls6yLabYd3AQTpmixZ0Mx3zouKbOVpQ4xghqYmzKpS2xcK
 +HZryf651keyUQZrCSeaVEzqZ/y50dikqV8Mi4GQ=
From: Luca Weiss <luca@z3ntu.xyz>
Date: Mon, 06 Feb 2023 20:58:30 +0100
Subject: [PATCH] backlight: qcom-wled: Add PMI8950 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221226-msm8953-6-2-wled-v1-1-e318d4c71d05@z3ntu.xyz>
X-B4-Tracking: v=1; b=H4sIAOVb4WMC/z2NQQrCMBAAv1L27JZka4P1K+IhaTZ2wUbJghZK/
 97Ug8eBGWYF5SKscG1WKPwRlVeuYE8NjJPPD0aJlYEMkSVyOOt8GfoOHRJ+nxyxT4NzIflzDB3
 ULHhlDMXncTrCv9+a1ppDeBdOsvyet/u27XBJWt2DAAAA
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=YAA9rHwEkOLJaOcAUYlj6+0wa5Hydp2D/H7mATvbTrs=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBj4VwQ1sqTedK0Bt8ocPrVnmBVs5dhpkKuSGowg
 OkxPIbDK4eJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCY+FcEAAKCRBy2EO4nU3X
 VlXgD/9WAJwsC+gXcyebNw/UlnmkmjENHKMLER3oY+/btVXL6wnQI3snEaY1rFqi74RDsqZ3rj5
 2K8E+H4dxIoQaCK048FjXSXb8V0+9AEH1bBkFQ8bSNGXBGPEVnC1uzkY5JpBGvGQeXJgxF9FThI
 f8cjkr0traDKBZWFSFJc6Kzj/h9dsrOSCt0pDoIxzFoyG9yeWet2H1UHYtsW0IeOPeEpGtQaWA/
 7a6WVB0TeE4FzShG0REzZI1vuEsaogFlf34T+C+GlccDtdv8BTFo78H7PO7rq6B6oBwXgIxqcQ7
 EECX0f/e/unpMd4hsjK4ZNS54ZCLWUWdf39Env2wn7WP2ON4RvUz8t8TQWjhGOB6IM2jJ19K5qM
 eQ4r553HXq77V0DAIDZkHxmutZe9AGxtaY6DSb7zfUJuhAgRofPbXq9uNx0nklPx/VXIRm8haAW
 OogoMTgaZgUh5IP/AU0ZXgI0Z8e59s30P77ylKbwG8mXjL49Jr18Qe/hU6gw2QlXHQ/rwxlFORN
 /88PN8GAes8kd1tUBRA1C51xpnlH2Ixd6D3wxKWVpoWP2n4dlpCz1hltVwA+coAVRtF7MAojRB3
 VRVziIw9Q1SJ2pauruo6xToI/rkqKhsfuVKZHN6rgkmNxkZt2JV0gQb34/iit9CHyE27HPV5clF
 18SQD/mIOf2ZQoA==
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD
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
Cc: Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PMI8950 contains WLED of version 4. Add support for it to the driver.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
While adding dt-bindings and dts in a previous series I forgot to add the
compatible to the driver. Fix that now.
---
 drivers/video/backlight/qcom-wled.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index 527210e85795..5f504883aca5 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -1731,6 +1731,7 @@ static int wled_remove(struct platform_device *pdev)
 
 static const struct of_device_id wled_match_table[] = {
 	{ .compatible = "qcom,pm8941-wled", .data = (void *)3 },
+	{ .compatible = "qcom,pmi8950-wled", .data = (void *)4 },
 	{ .compatible = "qcom,pmi8994-wled", .data = (void *)4 },
 	{ .compatible = "qcom,pmi8998-wled", .data = (void *)4 },
 	{ .compatible = "qcom,pm660l-wled", .data = (void *)4 },

---
base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
change-id: 20221226-msm8953-6-2-wled-5f966bfa4db3

Best regards,
-- 
Luca Weiss <luca@z3ntu.xyz>

