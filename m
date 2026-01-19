Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FFBD3AA82
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 14:39:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26A810E462;
	Mon, 19 Jan 2026 13:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="nQZmVDyU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.209.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB6310E2BE;
 Mon, 19 Jan 2026 08:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1768812273;
 bh=ilKrAQCTxqHXY73OKSd4JAnjeZQxW+6DAUiB7tpeB6U=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=nQZmVDyUw0RzZnoj34rm+CrvtzVbNtLiv+4/vVOLbn7iW0Mae/pI3trMpBMLQKpBw
 5D45I2i/FRYCCHi2YUj/TmJD2SbnRylC+bUk1qjDesetWGP2DJ1gaZ/qFpIXT5qfdF
 6GRoaAqUEaRpnCDMxPnbS+Gs+qKiRKkEQCXCW0XU=
X-QQ-mid: zesmtpip3t1768812258t4c99ab23
X-QQ-Originating-IP: maSrQqJsLAMKNUYdteq/URaJb0gZKggMFHvg67I9+No=
Received: from PECI2107 ( [localhost]) by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 19 Jan 2026 16:44:05 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 17832099907739608377
EX-QQ-RecipientCnt: 15
From: Runrun Liu <liurunrun@uniontech.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, zhanjun@uniontech.com,
 niecheng1@uniontech.com, kernel@uniontech.com,
 Runrun Liu <liurunrun@uniontech.com>,
 Cryolitia PukNgae <cryolitia@uniontech.com>
Subject: [PATCH] drm/amd/display: fix misspelling of "minimum" in dc_dsc.c
Date: Mon, 19 Jan 2026 16:44:03 +0800
Message-ID: <97A9D651052AA8A7+20260119084403.1420962-1-liurunrun@uniontech.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NVjywrp/tdK0imBRfrhOgtDbwr2pq1DPDW5tj/KnkigoG4567F8iSJoc
 XboCA4iw5Mo1cpj+SLkp1Rr9DvFfuOrtIN2nk1jcnt2eujYjA7nck5dULJBlaY59nYZDDES
 YVjbeKWw4Fe13uoUJw2clAWNUIMmzzFZbpd9wk0PIMB2A7KzgtL+//u07PruGuiKKeIPfKr
 C1T6kTd3U6o3ktM1niOw0EwJ6TL0Ohc069L+jjGEPleU7EZHimOTbO4e+LMpbtUL3hpzAeh
 R8q18uWRP3DXcjOjZw5RTYivExdMKO+he26IJFufR/p70g1/qxFxF8ie0kkPWaoNyUtNIaM
 RcBOjFROXInGJjB7Cr6aH2W8juBJ5HA62Ek/tEX3RrHlNgHNk+Aj55IkAguw17ULJgyt2C/
 6aXY2nMG8hKlBRoipaHD4Gqt0wioDAIzI7/PLMp3xx4EdEudyvqWWEFyupaQPIfqQIDQyYr
 Vl+gGXqjCLMIAVOmHZQjj6QdSImrNRPreinQloqyv5viBgofXxmYM9mCScZbTvKIs+hOH7l
 pDBfmIzaSNIGEKTX1apJM2aNd7urf7MKOOhcKq/9kFQ1Uh+Vm+FpGl4nLiFJ/zGgdfnxI3h
 grWpPOTt239Y1Un+kcIRF+WWvB0aDz231Kq0Hrsk5E6TuZSrnkIiuLJIL9bKSP8KqVuG2Rx
 iJnH6rANBjAjT0Qfv/Sy6ZV5W4tCN6wXOj1iQkKcT6TQOJp4SRjPdcKdAgmR1ecjqa0wGbX
 c0ib4lYyGKSSjxw7Oj1Ys1o0X3NSpCMzUV12uOt8r1gBJb0Ip1/W3I+OwTZqQPc/Uhxinbm
 rqjuRIxIGqqw7EPVefVpQ08+veA4RBERVukRINf3gpKDB0+i7dOYDNiqbbNU7Oi0ibyO20j
 X1fKwuKifBrXgq1uOr/FC4K/UH2/Uz/ly5igsN7BWXjyE7vNnkO/2RENskT9HCoNdg9Vr28
 03P03EauQuiRtAhz9iANPGKVq+Bmue6Qe5Yq5KGI75zP4RlUkmvnVbnzxpEZW5T83CxA7jU
 5uoB/VRBgjEesDdb1NOenA+v2sjR2CEPrX/+mI2s6Yl+G5jyD1NpL/V/VzONg=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-Mailman-Approved-At: Mon, 19 Jan 2026 13:39:11 +0000
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

Fix the typo "miniumum" → "minimum" in a comment in dc_dsc.c.

This typo is already listed in scripts/spelling.txt by commit
8c3200265787 ("scripts/spelling.txt: add several more common spelling
mistakes").

Suggested-by: Cryolitia PukNgae <cryolitia@uniontech.com>
Signed-off-by: Runrun Liu <liurunrun@uniontech.com>
---
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
index e4144b244332..5b3584ad5b6b 100644
--- a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
+++ b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
@@ -1157,7 +1157,7 @@ static bool setup_dsc_config(
 	if (!is_dsc_possible)
 		goto done;
 
-	/* increase miniumum slice count to meet sink slice width limitations */
+	/* increase minimum slice count to meet sink slice width limitations */
 	min_slices_h = dc_fixpt_ceil(dc_fixpt_max(
 			dc_fixpt_div_int(dc_fixpt_from_int(pic_width), dsc_common_caps.max_slice_width), // sink min
 			dc_fixpt_from_int(min_slices_h))); // source min
-- 
2.51.0

