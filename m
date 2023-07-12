Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DC8750241
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D09A10E3B1;
	Wed, 12 Jul 2023 09:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7A9B10E3C3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:00:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 04B0D61709;
 Wed, 12 Jul 2023 09:00:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9915C433C8;
 Wed, 12 Jul 2023 08:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689152400;
 bh=mNSmd92ZbJuvcNP8ky3SAI3dF+kkSfKu6xhDOjjQyVQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BIErQfDNd6hkpyWfmBW4uEcGcSNLp/ChKU7PdzP7y7na/eUC9caCwHHtotfeZnMWQ
 dYaHnwx3flEeWuqvNVylpyw2wL34YQacPH7yB/8iWZQhKx9n03V2gOzcrBGfPW6nGy
 9tHgH+dQIfFO/FyYCyhlERdElrfmhgPWPB6vglfz+WCDU6a9FcKnODZR0O66G4QZdD
 3MvHDvSa75tXCPjgd4fOeB4R0/4ys9yE6HvMNWuxuWNdIjJXUwVRy+LPFFq7iNOwMR
 91vYJDGDOXKt0TlnW2yewBZFKyGRFZ+pvwp3lYM+OK65Icb0M/ymv6PlCj9FzqgCT8
 YPh7cgAwKWuhw==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH 7/7] fbcon: remove unused display (p) from fbcon_redraw()
Date: Wed, 12 Jul 2023 10:59:42 +0200
Message-ID: <20230712085942.5064-8-jirislaby@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230712085942.5064-1-jirislaby@kernel.org>
References: <20230712085942.5064-1-jirislaby@kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, linux-serial@vger.kernel.org,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The parameter is unused.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/video/fbdev/core/fbcon.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index c6c9d040bdec..887fad44e7ec 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -1612,8 +1612,7 @@ static void fbcon_redraw_blit(struct vc_data *vc, struct fb_info *info,
 	}
 }
 
-static void fbcon_redraw(struct vc_data *vc, struct fbcon_display *p,
-			 int line, int count, int offset)
+static void fbcon_redraw(struct vc_data *vc, int line, int count, int offset)
 {
 	unsigned short *d = (unsigned short *)
 	    (vc->vc_origin + vc->vc_size_row * line);
@@ -1827,7 +1826,7 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
 
 		case SCROLL_REDRAW:
 		      redraw_up:
-			fbcon_redraw(vc, p, t, b - t - count,
+			fbcon_redraw(vc, t, b - t - count,
 				     count * vc->vc_cols);
 			fbcon_clear(vc, b - count, 0, count, vc->vc_cols);
 			scr_memsetw((unsigned short *) (vc->vc_origin +
@@ -1913,7 +1912,7 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
 
 		case SCROLL_REDRAW:
 		      redraw_down:
-			fbcon_redraw(vc, p, b - 1, b - t - count,
+			fbcon_redraw(vc, b - 1, b - t - count,
 				     -count * vc->vc_cols);
 			fbcon_clear(vc, t, 0, count, vc->vc_cols);
 			scr_memsetw((unsigned short *) (vc->vc_origin +
-- 
2.41.0

