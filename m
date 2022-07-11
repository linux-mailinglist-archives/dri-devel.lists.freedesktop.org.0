Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1984956D71D
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 09:52:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E90ED8CFC5;
	Mon, 11 Jul 2022 07:52:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4A3891E2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 07:52:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 16B93B80DE8;
 Mon, 11 Jul 2022 07:52:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B44ADC341CA;
 Mon, 11 Jul 2022 07:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657525956;
 bh=QDuUXmYLSzR4UM0SnVCHqjB0bPq6VFQQciujFgrIRzo=;
 h=From:To:Cc:Subject:Date:From;
 b=OlK30X0+dVGzgpv7hc6KBqc0RX5orPLBsk0Or6nk8FNrUDefXcCADhAue1Z8ogDgL
 5u+GCB936VgYbDP7GqN8e2pZ3iZZ0seNY7AyvAj8HzaVTZcXtVH/gh1byicCoqclRe
 FcFld9RDSWiVFAusxxrTYpqq0OEBJqFo5hKiQ/efwsMLr5jP06qIbirU3/H19aibNQ
 iD8HMT7hTZ763Rao3B3zERSUhhRb2XAbqsgb9S2C6mRx19fPSVe9XbbU4Wfq/Sgmk4
 lmzs91Ih4Nw5u55u0eLw3U4dGZZuU4IJYPj+BWelfjRv8lih96eilYBeJGV/jc2kje
 /wLYjqY43qbqg==
Received: from johan by xi with local (Exim 4.94.2)
 (envelope-from <johan+linaro@kernel.org>)
 id 1oAoDc-0005fa-I3; Mon, 11 Jul 2022 09:52:37 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] drm/panel-edp: add AUO B133UAN02.1 panel entry
Date: Mon, 11 Jul 2022 09:52:02 +0200
Message-Id: <20220711075202.21775-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.35.1
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
Cc: David Airlie <airlied@linux.ie>, Johan Hovold <johan+linaro@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add an eDP panel entry for AUO B133UAN02.1.

Due to lack of documentation, use the delay_200_500_e50 timings like
some other AUO entries for now.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index fe3897b86665..30f69cd8f9ee 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1845,6 +1845,7 @@ static const struct panel_delay delay_100_500_e200 = {
  * Sort first by vendor, then by product ID.
  */
 static const struct edp_panel_entry edp_panels[] = {
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x1e9b, &delay_200_500_e50, "B133UAN02.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B116XAK01"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x615c, &delay_200_500_e50, "B116XAN06.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x8594, &delay_200_500_e50, "B133UAN01.0"),
-- 
2.35.1

