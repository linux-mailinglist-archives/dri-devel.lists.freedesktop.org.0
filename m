Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F2D694238
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 11:05:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1201110E507;
	Mon, 13 Feb 2023 10:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC25310E507
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 10:05:25 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id by3so10213184wrb.10
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 02:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WUa23RLrE0PDgwOjJmU3KO0GQPvKnhT5EyoVK7X5UhQ=;
 b=NGbOY4Wq2iBE/J7VYQUnRvm4YdtkCIOTmYGDioEkZ0i9/nQMaxrQWOBFDd/rHyk8wp
 xhluCXAjdkqsLKcDjaRhyhYSyV5NPGbX+OVJIZa8UHZYFXhfhcpV3hgH4sj+Zm6H+7Ct
 +a4CmPIyiBy0ANAWqATFVLJHWJg5bsAgi8VQ8TPtsY86pcKnYN46lcFc+G7SLBVhgKdc
 t7aEqadMnqUf2W/LAvzalL6dS9N2To/EUzwDk9xEBk43v8+jyPoKmOaBVuibx7EyG9Sm
 gGyrWDlH5Zur5dROT0mqpMTohKCl0RVi1SVsn2hx89wCgckWHdgZn+ID/xXyID0el87j
 eCtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WUa23RLrE0PDgwOjJmU3KO0GQPvKnhT5EyoVK7X5UhQ=;
 b=NR/eR3wiqwVcEUz42/F95BKvFVBskTwt37iThja/ISYaW7DgUYP93PaUtRI1hZeRd4
 RT7NqD/R2F5nvjbtz+JOUYr3On9J9YAX0T9NRuzF8t2mgg4OXYjRmAEmWVB8GjgDpsHw
 dCVP+sFjuiY0JMIhATwFaEh1EUhlSlTdUYuq7TlK8vvPikpVY9IIMZp3jar6ymIQMiER
 hezXzMuMzpem+RKJuxHv9rytlvAY8xjeFQTNLpOJbV8jUQuargst04WkMVXEcmOMUo1+
 UJ0GHOELCHskQ2V7Apz1sX85cyHE50dYtCoCrtlGbEM9ienPoU/qiUZtj6QO7d3ZDiCZ
 dBmg==
X-Gm-Message-State: AO0yUKWSpH/7wb4SA9LbX6BkIY8qgcANQA1K49fjMImOyH7EbQTpMo5k
 rfTffY6JzxE6kljDQ4lN9O4=
X-Google-Smtp-Source: AK7set+OyHoZYHJJKwZnGuNO/t3bO4Y/XsFy7rfyeH+ibv4u55KiCMaSH5FtXn3Vn5144URAcuC+zw==
X-Received: by 2002:adf:d0c5:0:b0:2c5:5237:3b21 with SMTP id
 z5-20020adfd0c5000000b002c552373b21mr4354202wrh.69.1676282724079; 
 Mon, 13 Feb 2023 02:05:24 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 s11-20020adfeccb000000b002bfcc9d9607sm10039611wro.68.2023.02.13.02.05.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 02:05:23 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Alain Volmat <alain.volmat@foss.st.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/sti: Fix spelling mistake "top_cmd_offest" ->
 "top_cmd_offset"
Date: Mon, 13 Feb 2023 10:05:22 +0000
Message-Id: <20230213100522.106595-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a spelling mistake in a variable name. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/sti/sti_hqvdp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hqvdp.c
index 02b77279f6e4..711a6e333afc 100644
--- a/drivers/gpu/drm/sti/sti_hqvdp.c
+++ b/drivers/gpu/drm/sti/sti_hqvdp.c
@@ -797,7 +797,7 @@ static void sti_hqvdp_disable(struct sti_hqvdp *hqvdp)
 static int sti_hqvdp_vtg_cb(struct notifier_block *nb, unsigned long evt, void *data)
 {
 	struct sti_hqvdp *hqvdp = container_of(nb, struct sti_hqvdp, vtg_nb);
-	int btm_cmd_offset, top_cmd_offest;
+	int btm_cmd_offset, top_cmd_offset;
 	struct sti_hqvdp_cmd *btm_cmd, *top_cmd;
 
 	if ((evt != VTG_TOP_FIELD_EVENT) && (evt != VTG_BOTTOM_FIELD_EVENT)) {
@@ -816,14 +816,14 @@ static int sti_hqvdp_vtg_cb(struct notifier_block *nb, unsigned long evt, void *
 	if (hqvdp->btm_field_pending) {
 		/* Create the btm field command from the current one */
 		btm_cmd_offset = sti_hqvdp_get_free_cmd(hqvdp);
-		top_cmd_offest = sti_hqvdp_get_curr_cmd(hqvdp);
-		if ((btm_cmd_offset == -1) || (top_cmd_offest == -1)) {
+		top_cmd_offset = sti_hqvdp_get_curr_cmd(hqvdp);
+		if ((btm_cmd_offset == -1) || (top_cmd_offset == -1)) {
 			DRM_DEBUG_DRIVER("Warning: no cmd, will skip field\n");
 			return -EBUSY;
 		}
 
 		btm_cmd = hqvdp->hqvdp_cmd + btm_cmd_offset;
-		top_cmd = hqvdp->hqvdp_cmd + top_cmd_offest;
+		top_cmd = hqvdp->hqvdp_cmd + top_cmd_offset;
 
 		memcpy(btm_cmd, top_cmd, sizeof(*btm_cmd));
 
-- 
2.30.2

