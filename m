Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 003D8165D5D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 13:16:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C48B96E8E1;
	Thu, 20 Feb 2020 12:16:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 535 seconds by postgrey-1.36 at gabe;
 Thu, 20 Feb 2020 12:16:09 UTC
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26666E8E1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 12:16:09 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200220120712euoutp0220724148b0ab72c41c175b30d3aed208~1GukmvK_53228632286euoutp02B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 12:07:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200220120712euoutp0220724148b0ab72c41c175b30d3aed208~1GukmvK_53228632286euoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1582200432;
 bh=hkx6DgbqTnvBPvF0imgPKHXt1K+ZrMslVa2DNLpq8VU=;
 h=From:To:Cc:Subject:Date:References:From;
 b=DadcEyzhMdXkRXPpXnP8TuSDGZR7+dR3r8M98i2Hyrih4/w9M5gU9LVoMfFNvaHbK
 xm8/eZ3GXQst0TslKw7sNDxk+atO3Oy1eajyPaFYhfCJE29Zdbx/31cHD5TKU0HQL+
 Rin3ri9E25ysPHIwPD+JJwq4xHTm9tIaQX6FtBhU=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200220120712eucas1p11cf2aee6b05d393727274f6d2ce8cc56~1GukQuwJh1315513155eucas1p1t;
 Thu, 20 Feb 2020 12:07:12 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 08.A3.60679.0767E4E5; Thu, 20
 Feb 2020 12:07:12 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200220120711eucas1p1f3ac819081ece4847b17c10c005dfa42~1Guj3QtCc2397823978eucas1p1L;
 Thu, 20 Feb 2020 12:07:11 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200220120711eusmtrp236ccf401cf92156fd2bfe8acbde1ff2d~1Guj2n-bY2094520945eusmtrp2m;
 Thu, 20 Feb 2020 12:07:11 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-4a-5e4e76709a9e
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 23.53.08375.F667E4E5; Thu, 20
 Feb 2020 12:07:11 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200220120711eusmtip2b8fe826edcfc8e5319b15ce0b9b43158~1GujbG3dL1206312063eusmtip2-;
 Thu, 20 Feb 2020 12:07:11 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH] drm/panel: ld9040: add MODULE_DEVICE_TABLE with SPI IDs
Date: Thu, 20 Feb 2020 13:07:00 +0100
Message-Id: <20200220120700.12257-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPIsWRmVeSWpSXmKPExsWy7djP87oFZX5xBndmi1rcWneO1WLjjPWs
 Fle+vmezmHF+H5PF2iN32S1W/NzKaPFz1zwWB3aPnbPusnvc7z7O5LFk2lU2j74tqxg9Pm+S
 C2CN4rJJSc3JLEst0rdL4MpYOe0lS8EG9oqbp2ewNTAuZeti5OSQEDCRWPL6M1MXIxeHkMAK
 Rome7v+MEM4XRomWli6ozGdGiUmrv8O1nO2aBFW1nFHi7cKjzHAtXZ0zwarYBAwlut52gdki
 Am4STYdnsoIUMQvcYpRo3/0BLCEs4CHxqGUeK4jNIqAqcWXabxYQm1fAVmLJj01Q6+QlVm84
 ALZBQuA6m8TsW5vYIRIuEpu+noOyhSVeHd8CZctI/N85nwmioZlR4uG5tewQTg+jxOWmGYwQ
 VdYSd879AlrBAXSTpsT6XfogpoSAo0Tb5SoIk0/ixltBkGJmIHPStunMEGFeiY42IYgZahKz
 jq+D23rwwiVmCNtDYsGsDWDlQgKxEk1tLBMY5WYhbFrAyLiKUTy1tDg3PbXYKC+1XK84Mbe4
 NC9dLzk/dxMjMBmc/nf8yw7GXX+SDjEKcDAq8fB+UPeNE2JNLCuuzD3EKMHBrCTCq8bjFyfE
 m5JYWZValB9fVJqTWnyIUZqDRUmc13jRy1ghgfTEktTs1NSC1CKYLBMHp1QDY8h53bDzYgl3
 um+sNJNcYVO0Wuem3ME7W29aaxw9fzUn0cfj++rPk8VeCZ8UODZ534vVe6t7stacurUvXOvK
 1XteWhyb48KZri60sXVtEn/2fNGCB573mKbZM0zZbJ16OOjSk0dJHydkBbgsze+NVfNg8Xpd
 yyy2Sd3FITSs3u5Qvqx2zKsSNiWW4oxEQy3mouJEANDktIgCAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGLMWRmVeSWpSXmKPExsVy+t/xe7r5ZX5xBnufW1rcWneO1WLjjPWs
 Fle+vmezmHF+H5PF2iN32S1W/NzKaPFz1zwWB3aPnbPusnvc7z7O5LFk2lU2j74tqxg9Pm+S
 C2CN0rMpyi8tSVXIyC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0MtY
 Oe0lS8EG9oqbp2ewNTAuZeti5OSQEDCRONs1ibGLkYtDSGApo8SndQcYIRIyEienNbBC2MIS
 f651sUEUfWKU2LtrJVgRm4ChRNfbLrBJIgIeEs3fjrODFDEL3GOUeDqjlxkkIQyUeNQyD2wS
 i4CqxJVpv1lAbF4BW4klPzZBnSEvsXrDAeYJjDwLGBlWMYqklhbnpucWG+oVJ+YWl+al6yXn
 525iBIbhtmM/N+9gvLQx+BCjAAejEg/vB3XfOCHWxLLiytxDjBIczEoivGo8fnFCvCmJlVWp
 RfnxRaU5qcWHGE2Blk9klhJNzgfGSF5JvKGpobmFpaG5sbmxmYWSOG+HwMEYIYH0xJLU7NTU
 gtQimD4mDk6pBsY+rsoQ3zhtm21V1Q8LtD3+TC7Y8f02SzOvhr1I6vTpcuutp3Rd+VL3vztv
 d9H2S/J3rh42LZ6lvuBd2dKPmXqZa38KTNbdaKQk6d12g33nVN61X31n2dpenufCp9l5NNqv
 83bzYqP5Czmnz6uYzVJful/waf3ijULvoo/cl5PPCzbadSlDd4oSS3FGoqEWc1FxIgDJ3sQ4
 WQIAAA==
X-CMS-MailID: 20200220120711eucas1p1f3ac819081ece4847b17c10c005dfa42
X-Msg-Generator: CA
X-RootMTR: 20200220120711eucas1p1f3ac819081ece4847b17c10c005dfa42
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200220120711eucas1p1f3ac819081ece4847b17c10c005dfa42
References: <CGME20200220120711eucas1p1f3ac819081ece4847b17c10c005dfa42@eucas1p1.samsung.com>
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
Cc: Andrzej Hajda <a.hajda@samsung.com>, Sam Ravnborg <sam@ravnborg.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add proper MODULE_DEVICE_TABLE structure with SPI IDs to allow proper
creation of SPI modalias string and fix autoloading module for this driver.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/panel/panel-samsung-ld9040.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-samsung-ld9040.c b/drivers/gpu/drm/panel/panel-samsung-ld9040.c
index 3c52f15f7a1c..9bb2e8c7934a 100644
--- a/drivers/gpu/drm/panel/panel-samsung-ld9040.c
+++ b/drivers/gpu/drm/panel/panel-samsung-ld9040.c
@@ -373,6 +373,12 @@ static const struct of_device_id ld9040_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, ld9040_of_match);
 
+static const struct spi_device_id ld9040_ids[] = {
+	{ "ld9040", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(spi, ld9040_ids);
+
 static struct spi_driver ld9040_driver = {
 	.probe = ld9040_probe,
 	.remove = ld9040_remove,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
