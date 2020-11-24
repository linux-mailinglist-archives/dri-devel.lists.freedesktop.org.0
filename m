Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 116442C3AA3
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 09:13:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B34A6E857;
	Wed, 25 Nov 2020 08:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF2D36E506
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 18:57:45 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id h3so1378259oie.8
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 10:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YQvA+gzyOlwcrQTYLcbh+JVhQ8vrnP0glY0CX55ovyw=;
 b=hoV9a0tru1XrM0PN94vfdrkGnGpCNWNEwo/32YusI1pTbAei+ybZdAf/eGFMo6toKh
 3Haebkuw9HUQ0bZb6CEo++QF+NCGOT9M3mw3ndGCPpFbUdNaGsmni6ltPI0e183aAilg
 eUkCczMYH9u5/X6dLxzgo42js9o7y+c3SBnM4sOB6Y7fcnVWpQo78LVrzFqvXEAIF9Qp
 cWrFXqlv+3DDq8NPAIcs8ghau3qujNzeJK4o4iKuZjJ33uQK33/x/r9JD0Spykdn2btX
 r9+m/V85XrM15M8z1ZVsYb/DmekctbtqsFr6F6Ndr/6h8XCvPkyRw0iQe7kPXzXleicY
 pRUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YQvA+gzyOlwcrQTYLcbh+JVhQ8vrnP0glY0CX55ovyw=;
 b=KYOG/MJoS3kz3e5lKnnlGYWU+RqTpNvmzUW9r7gmtMbUjY0qZTiuiNlJ5/Z1P46sNH
 cRnqBz4ISpFqLhZkpIheuIt4VFAkDIu4TB28TIqk0pZuStHQ818ZNRIkk1ZUDcEh9rNE
 9eYeWRjLzdV40jJEewWl6I0Q8qB6nP6aljCv5LKhDOi795nMi3GlwHyL1rNpOV+ZoZo/
 h9ATi+aE/k2iVR8JqHy7Me56R6xiD3m1v37q1cChd42OJwCAnOefxn5H9z69y7Gd8EkT
 X1V+Dl3cWe5IOfeJBqGrKII8zj/oAWFIDYTbUIo2fgEIoFlDalmvaMRjoWbtHslEOWyE
 WWSA==
X-Gm-Message-State: AOAM531tJNGP4tFwrp+/jZJncAFppvBYI+5BpQWS+z2GrTeTMutYP3R6
 SYE5aV90ewK241/HwRpvH6AYPQ==
X-Google-Smtp-Source: ABdhPJyVCPwvTVWKEZBheVICFsAHDUw6QNEFpvQcHI9TbAmeovDh3KxOSb484UpKebcMuFh4bxvkAw==
X-Received: by 2002:aca:4a51:: with SMTP id x78mr2449oia.86.1606244265287;
 Tue, 24 Nov 2020 10:57:45 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id k20sm9079930ots.53.2020.11.24.10.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 10:57:44 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Akash Asthana <akashast@codeaurora.org>,
 Mukesh Savaliya <msavaliy@codeaurora.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Wolfram Sang <wsa@kernel.org>, Steev Klimaszewski <steev@kali.org>,
 Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH] Revert "i2c: qcom-geni: Disable DMA processing on the Lenovo
 Yoga C630"
Date: Tue, 24 Nov 2020 12:57:43 -0600
Message-Id: <20201124185743.401946-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 25 Nov 2020 08:11:52 +0000
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-i2c@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A combination of recent bug fixes by Doug Anderson and the proper
definition of iommu streams means that this hack is no longer needed.
Let's clean up the code by reverting '127068abe85b ("i2c: qcom-geni:
Disable DMA processing on the Lenovo Yoga C630")'.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index dce75b85253c..046d241183c5 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -353,13 +353,11 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 {
 	dma_addr_t rx_dma;
 	unsigned long time_left;
-	void *dma_buf = NULL;
+	void *dma_buf;
 	struct geni_se *se = &gi2c->se;
 	size_t len = msg->len;
 
-	if (!of_machine_is_compatible("lenovo,yoga-c630"))
-		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
-
+	dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
 	if (dma_buf)
 		geni_se_select_mode(se, GENI_SE_DMA);
 	else
@@ -394,13 +392,11 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 {
 	dma_addr_t tx_dma;
 	unsigned long time_left;
-	void *dma_buf = NULL;
+	void *dma_buf;
 	struct geni_se *se = &gi2c->se;
 	size_t len = msg->len;
 
-	if (!of_machine_is_compatible("lenovo,yoga-c630"))
-		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
-
+	dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
 	if (dma_buf)
 		geni_se_select_mode(se, GENI_SE_DMA);
 	else
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
