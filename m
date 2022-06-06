Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 870AD53ECD3
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 19:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 446E010EA3A;
	Mon,  6 Jun 2022 17:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF13410E972
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 17:14:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2FEAAB817F2;
 Mon,  6 Jun 2022 17:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70B69C385A9;
 Mon,  6 Jun 2022 17:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654535683;
 bh=wPIRuMsqYczU+dDbzX3MkG700WSQK/kwIYf2AEoWPgo=;
 h=From:To:Cc:Subject:Date:From;
 b=pvfhh7K3t1QIQIaJNTFuoQuS0/l0G/P18v7ksfanA/J7GAVcgU6RU/UfJ2O+sEDlX
 GRvmJcN5+xy8t1iZJ8Iksvbp+Swb2KFs+j4WiaR0OrU8RYvb+T5Mj8J+/cgL6qSq5s
 BjqQmAuUir5xOSx1B1AviXjxo1z0QBkxJiJXyJeHb9oRdVVmV3+yonrdVPhw1TP/+k
 C55vuSFnxbYANgMIV7h3VXjxzBssf7j6g0KHbsDiBcuTFHF9MtKaLrTeTURuZKILXV
 oGhVsjCcf7oxYvNe42hOgKB87aEeXfDg1/U3rfMQzOHb2Lm/oXU1BbXY15YCBGuyXL
 prSXqTXLkj1cA==
From: Mark Brown <broonie@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] drm/i2c: tda9950: Lower severity of log message about missing
 interrupts
Date: Mon,  6 Jun 2022 18:14:36 +0100
Message-Id: <20220606171436.2438051-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1441; h=from:subject;
 bh=wPIRuMsqYczU+dDbzX3MkG700WSQK/kwIYf2AEoWPgo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBinjX48hgZWn5OjUYw6uHfKImPQihXLYJJZ8JbFJH3
 D570zu6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYp41+AAKCRAk1otyXVSH0Kt4B/
 40mAPeLu316RBMq1/kwiR2hYsf4A7HnzEtFgN+xv8LqbdUidi3mDTWIoTmM4PRwVeUB3/8gxiTLdhN
 ZXS9Di/zzdMKXswF0mleaPK3dnQvEUZquSefMSobmky9gdcMzJD+GvadepO7Fa++zz0l2GldjbrqLK
 OYBP0Vmtu5RIJ2gd9ldPpIiXFqBn77aUZisvGbEWmZfsP+Duzk7NeaHWcP2d3jU6DZFFMclElP++rO
 OeiOce4dsMGVULQ1x2B+F8oDKhijrZlA2+bDuZ+T9yWHVH6WmT59VKf4CJ2IU2CPKad+cJp6RBld1u
 DXsTRL4laLYZukUCiZFZo3zv4DemSH
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

