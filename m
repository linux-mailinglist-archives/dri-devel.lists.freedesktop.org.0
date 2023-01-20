Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41327675406
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 13:00:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25ADC10EA24;
	Fri, 20 Jan 2023 12:00:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D94D10EA24
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 12:00:32 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pIq4F-0001AQ-D2; Fri, 20 Jan 2023 13:00:23 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pIq4E-007MQ6-9Z; Fri, 20 Jan 2023 13:00:22 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pIq4D-00ENfu-7V; Fri, 20 Jan 2023 13:00:21 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 0/2] backlight: pwm_bl: Two PWM releated changes
Date: Fri, 20 Jan 2023 13:00:16 +0100
Message-Id: <20230120120018.161103-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=786;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=KWR8xlGWNM7f1L8ELAgTyW8p2nhEF2JfQQPr6GCZVNA=;
 b=owGbwMvMwMV48I9IxdpTbzgZT6slMSSfanJYe0ORiWv2PNsDWna23Pu8ORQlI2REuo4Exv/lVw2r
 7fjVyWjMwsDIxSArpshSV6QlNkFizX+7kiXcMINYmUCmMHBxCsBEPvKy/xWYJ+m2Jrgld4bTjbVNXh
 lz9Tj7XbOkE52/b26QFfw5vTa1L/FJ8TbVq+3nN9f6PdzcxFu+2VZHc6JTQK4nY57VlqbjJirla/bv
 9vonLDPbwD06dtvSncJOzhdcsmzmTJ/g9GpemA1P7V7+m04T2uy3TuD+7if5YRaTze2Zk7f27/jXOi
 HyTC7TUvX63RM3C3wTOdfxk7P+k2pz61l/ydnxWqlsZdP7g+pYO6W/1j7+kJtwbPXRki6N7Sy/+m70
 XNpjOler5p38mb83U3N0TO7OfhlrtYNNOXf+uvhvC45oTQu5sIFFLJlfPG1P+D/9BRmRbDd0J7Dopm
 x4IfUpSniyUq3j5RbvVSZRJ/ntAQ==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

here comes the promised v2 of this series. Implicit v1 is available at
https://lore.kernel.org/dri-devel/20230109204758.610400-1-u.kleine-koenig@pengutronix.de
.

Changes since (implicit) v1 all due to feedback by Daniel Thompson:

 - Update changelogs
 - Still disable PWM if there is an enable gpio or a regulator

Best regards
Uwe

Uwe Kleine-König (2):
  backlight: pwm_bl: Configure pwm only once per backlight toggle
  backlight: pwm_bl: Don't rely on a disabled PWM emiting inactive state

 drivers/video/backlight/pwm_bl.c | 56 ++++++++++++++++++--------------
 1 file changed, 31 insertions(+), 25 deletions(-)


base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
prerequisite-patch-id: a0c7497a32092d284bc47eda60e4b3690338ba6e
-- 
2.39.0

