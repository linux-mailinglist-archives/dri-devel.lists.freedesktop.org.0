Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C394D42178E
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 21:28:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4AE26E954;
	Mon,  4 Oct 2021 19:27:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE966E937
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 19:27:52 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 3459E1F6AF;
 Mon,  4 Oct 2021 21:27:50 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
To: phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Pavel Dubrova <pashadubrova@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Kiran Gunda <kgunda@codeaurora.org>,
 Courtney Cavin <courtney.cavin@sonymobile.com>,
 Bryan Wu <cooloney@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 08/10] backlight: qcom-wled: Remove unnecessary double
 whitespace
Date: Mon,  4 Oct 2021 21:27:39 +0200
Message-Id: <20211004192741.621870-9-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211004192741.621870-1-marijn.suijten@somainline.org>
References: <20211004192741.621870-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove redundant spaces inside for loop conditions.  No other double
spaces were found that are not part of indentation with `[^\s]  `.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/video/backlight/qcom-wled.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index f143b2563bfe..dbe503007ada 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -235,7 +235,7 @@ static int wled3_set_brightness(struct wled *wled, u16 brightness)
 
 	v = cpu_to_le16(brightness & WLED3_SINK_REG_BRIGHT_MAX);
 
-	for (i = 0;  i < wled->cfg.num_strings; ++i) {
+	for (i = 0; i < wled->cfg.num_strings; ++i) {
 		rc = regmap_bulk_write(wled->regmap, wled->ctrl_addr +
 				       WLED3_SINK_REG_BRIGHT(i),
 				       &v, sizeof(v));
@@ -257,7 +257,7 @@ static int wled4_set_brightness(struct wled *wled, u16 brightness)
 
 	v = cpu_to_le16(brightness & WLED3_SINK_REG_BRIGHT_MAX);
 
-	for (i = 0;  i < wled->cfg.num_strings; ++i) {
+	for (i = 0; i < wled->cfg.num_strings; ++i) {
 		rc = regmap_bulk_write(wled->regmap, wled->sink_addr +
 				       WLED4_SINK_REG_BRIGHT(i),
 				       &v, sizeof(v));
-- 
2.33.0

