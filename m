Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F29851F2231
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 01:07:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2236289CA0;
	Mon,  8 Jun 2020 23:07:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D0189CA0
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 23:07:23 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 956FC20774;
 Mon,  8 Jun 2020 23:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591657643;
 bh=NwARTSH7XyqllZL+B+8gV7JlC9yF8Y14manG+jnxrHk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zeeQbzI+C7l6AJdOTDXWL/+QJdfblQMBYzt6X9JCalFpjpTKCJzMEspEgYrYQPbzX
 PZ5+tAb9uSSyUxBBtQRoG67XA+ZovteIOPUeJ65Tj9CgkAucA/wkOG0nsTVX59+fNG
 pLDkCIYuZuIg8OwXnrzax6siDf1p3FWoIXO8S99g=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 060/274] drm/dp: Lenovo X13 Yoga OLED panel
 brightness fix
Date: Mon,  8 Jun 2020 19:02:33 -0400
Message-Id: <20200608230607.3361041-60-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608230607.3361041-1-sashal@kernel.org>
References: <20200608230607.3361041-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Mark Pearson <mpearson.lenovo@gmail.com>, Sasha Levin <sashal@kernel.org>,
 dri-devel@lists.freedesktop.org, jendrina@lenovo.com,
 Mark Pearson <mpearson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mark Pearson <mpearson.lenovo@gmail.com>

[ Upstream commit 0df3ff451287d71c620384eb7bb2cd3a8106412c ]

Add another panel that needs the edid quirk to the list so that
brightness control works correctly. Fixes issue seen on Lenovo X13 Yoga
with OLED panel

Co-developed-by: jendrina@lenovo.com
Signed-off-by: Mark Pearson <mpearson@gmail.com>
[fixed commit message, sobs]
Signed-off-by: Lyude Paul <lyude@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20200519025635.22846-1-mpearson@lenovo.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_dp_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index c6fbe6e6bc9d..41f0e797ce8c 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -1313,6 +1313,7 @@ static const struct edid_quirk edid_quirk_list[] = {
 	{ MFG(0x06, 0xaf), PROD_ID(0xeb, 0x41), BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
 	{ MFG(0x4d, 0x10), PROD_ID(0xc7, 0x14), BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
 	{ MFG(0x4d, 0x10), PROD_ID(0xe6, 0x14), BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
+	{ MFG(0x4c, 0x83), PROD_ID(0x47, 0x41), BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
 };
 
 #undef MFG
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
