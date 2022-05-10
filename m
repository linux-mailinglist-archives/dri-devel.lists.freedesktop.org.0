Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD22522223
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 19:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1923010F295;
	Tue, 10 May 2022 17:17:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 222C210F295
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 17:17:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 49E266188C;
 Tue, 10 May 2022 17:17:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45364C385C2;
 Tue, 10 May 2022 17:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652203020;
 bh=wPIRuMsqYczU+dDbzX3MkG700WSQK/kwIYf2AEoWPgo=;
 h=From:To:Cc:Subject:Date:From;
 b=E2EL/IYa9vtspm3Vt+hLlEsRvVUhuE0t3QkZ03Nw7N/NQHim5XgKUs/Ea6s9y8dGZ
 2iEozjbNwmewEtDluCLbS2EsobRMEsVcspb9tkRCpHPKp6eTCajJZiGDJprUMke4Ik
 P4MFfA/3hBk6nBdC9rdBmkFIOkLqnLU55zjbZJ10ny6WYF/3ysJZIGHhch+dQa6Nin
 LivcYjOeK9esBObH7eCs6wU6g5gruk3ET/d0SDGcVyP7CFCsxrPXa0Ilf9dYBkO8Bc
 45HKPrU82OAm24h0vgMlcZWu/omCOLwHiK1dDznozqT47uNRXQOeA/fYSp0jFiC6/E
 FEBclrcax5TiA==
From: Mark Brown <broonie@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] drm/i2c: tda9950: Lower severity of log message about missing
 interrupts
Date: Tue, 10 May 2022 18:15:37 +0100
Message-Id: <20220510171537.926581-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1441; h=from:subject;
 bh=wPIRuMsqYczU+dDbzX3MkG700WSQK/kwIYf2AEoWPgo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiepyh8hgZWn5OjUYw6uHfKImPQihXLYJJZ8JbFJH3
 D570zu6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYnqcoQAKCRAk1otyXVSH0LXWB/
 9ncqDifi7+tkc7hUGy+B1/KZ0vMDEZrJSv2D7/OBc3BBrP21zcc03tN4hPTxYaTCUNJ1zzItvExyVa
 uRXmEsXDngEpwyJLSd7W5VG5mY5/0O2pht/lhtg5Fr3t/lUSqcfjJR7ehwZtX2uGcMz71pcmLKWG0E
 +HGG7+SRm0A3HrIpAYFFEPX/DnEkXzr4msMlqfvCDaLfKr8sJVy47NOvjSxihdVkllJkhuovOc94cK
 9rBDPxL4z2TixOSS0R5kk7HY78U5w+kDjbyXtJn2Z+agy87nKTk5Qtuo0RS+Nha3WaEWH5lZcl1Kz6
 fO77FDnsKgogcm31mXytGw1AwUSFAz
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
Cc: Russell King <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The tda9950 driver prints an error message if it is instantiated without
an interrupt being available since the device is non-functional in that
case. Unfortunately due to packaging of tda9950 with tda998x series devices
the tda998x driver unconditionally instantiates a tda9950 so systems with a
tda998x configured without an interrupt will trigger this error message
during boot if tda9950 support is available. Reduce the severity to debug
level so this is less likely to be presented to end users, the information
is still there for system integrators who run into problems.

We could add a check for an interrupt to the tda998x driver instead but
this feels better from an encapsulation point of view, there's still a log
message to help anyone doing system integration.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/gpu/drm/i2c/tda9950.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i2c/tda9950.c b/drivers/gpu/drm/i2c/tda9950.c
index 5b03fdd1eaa4..781d5665cd04 100644
--- a/drivers/gpu/drm/i2c/tda9950.c
+++ b/drivers/gpu/drm/i2c/tda9950.c
@@ -397,7 +397,7 @@ static int tda9950_probe(struct i2c_client *client,
 
 	/* We must have an interrupt to be functional. */
 	if (client->irq <= 0) {
-		dev_err(&client->dev, "driver requires an interrupt\n");
+		dev_dbg(&client->dev, "driver requires an interrupt\n");
 		return -ENXIO;
 	}
 
-- 
2.30.2

