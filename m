Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B56E1A58B81
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 06:06:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34FA410E02E;
	Mon, 10 Mar 2025 05:06:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="k/W7+Ml4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 505 seconds by postgrey-1.36 at gabe;
 Mon, 10 Mar 2025 05:06:01 UTC
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE2B10E02E
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 05:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1741583158;
 bh=1Ejw7dnHXGbcgwStfAw/3eaY/dgh+jPF9zfi0J6jwa8=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=k/W7+Ml4cvy/xgOfAKS71+8A20nB9QfBbEWb99hKjy2Ekg8wloOpIGzZbzdY3D5LO
 iJ0ej13cLCxKE1rHpxJwrOex+GzdlH9iyqVH+3/252hstzGavrYzn9/aNzdMkpBgyn
 1gu1rKkxlaPjDEsDN/AS3tD4AUyy7l1HZhmJV1+4=
X-QQ-mid: bizesmtpip3t1741582601tyaexxw
X-QQ-Originating-IP: S+iHdvzEOaySNSWMHE4rAW5Kl94eu9GLfHJ4prLBux8=
Received: from localhost.localdomain ( [localhost])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 10 Mar 2025 12:56:39 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 7054169263967918300
From: WangYuli <wangyuli@uniontech.com>
To: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, zhanjun@uniontech.com,
 niecheng1@uniontech.com, guanwentao@uniontech.com,
 chenlinxuan@uniontech.com, WangYuli <wangyuli@uniontech.com>
Subject: [PATCH] backlight: tdo24m: Eliminate redundant whitespace
Date: Mon, 10 Mar 2025 12:56:36 +0800
Message-ID: <8FC39A4DC2529591+20250310045636.14329-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MzxUxMIt2hRGpXCZzuVyoSac+kgoXuose2nWSHkYNyfoxNzPBolyyoDn
 dQz7pDRHHUDS+qjub38hD5r+J1N/kTnC4kczTvsIWgPxxFeA+pS2GQXiAq70XlOm7Lcl72X
 l+jxTYfg6ubjUdLmoidJrQjMoCzAhpnDB1NOogm3TP4VlnyK8PEU1YJwtukiY0tWuufRMJd
 W4Aa06O25Kskb1KqS11EYyukdUkeI6kVXwotetjZL1zV91txcM8q9e+2ncpw2X0Ij+lDagH
 APJzbs0UP8X8ll5Wk8ms6Ug0t4hqqEFxKkEZ/SPoVhjAy32kiVazt1UWprrg2Y1IUFRyOHG
 uXuxiJE1o7K9P7GX1ITQK3fdDjxohW2bfYbkeU2gjlLbc+bpDn3rN28nWwS5KItwtaStI0v
 mZRUMhS4Aid9OcGbJjkTt+tgmY1vN0J98ecezYzi83es8SzwsJtLtlzswX5glDiV2tW330f
 pmde2S1AjDTicvqRuO/BnTKKsqnKs7kZwqd1g1pVANu97GH+/YP/IGxJNeoV7Nc6M60MFos
 bOOwYgpbkGlvFtbs8+ZcoQQuvQux0dWF9ZKnrIe+/+fh/EVRzat2/hNQOjlQf3MI1QZ1hvJ
 jyWl0nAGYe/xUyk+HzXmhiI0brAE36mHoHgq98zcOkC1WsBnDtqjiBtzIK2uE05H7TpfBnh
 0vBucwW0xeClgUVtQ7diaZJ3svbkp36hRkbR5mRkVWVW08iGa2x9BzDbhAa2WCZzQbRDTyW
 KMKVkxhpNAK4eeBDeGKK0sYNuUlHoO8fQ2j+Cz7+PKyRUZa3XUO7Z7gDrYGjhvQx1gHViWE
 /foSWkWG9kS2xdMLHKfK8CMDeFN1lMuGqxX+zm2RbSV9YmaMltjwTjkC3+UfnDo05w4j1hG
 jqaq0xu9LkxAMlvUiFeCYniCZvbYxN5VDBMGTbIJuVayuoSFfmjw3RfbG6USGfaFTQKp8ub
 F9gLsb7YX+XEH0RuxRW7+GaqMEj6BtH7FUs5WnPHST59lXPfqG/llMSIX+Zfo3liDuO4Z4U
 WmPOZGT99c8243ajJw
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
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

The description for CONFIG_LCD_TDO24M has redundant whitespace.
Trim it to keep the code tidy.

Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/video/backlight/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index 3614a5d29c71..f2d7c4fe3ba5 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -70,7 +70,7 @@ config LCD_ILI9320
 	  then say y to include a power driver for it.
 
 config LCD_TDO24M
-	tristate "Toppoly TDO24M  and TDO35S LCD Panels support"
+	tristate "Toppoly TDO24M and TDO35S LCD Panels support"
 	depends on SPI_MASTER
 	help
 	  If you have a Toppoly TDO24M/TDO35S series LCD panel, say y here to
-- 
2.47.2

