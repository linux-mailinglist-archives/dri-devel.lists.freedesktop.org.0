Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2607E1CA67D
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 10:47:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333B96EAA8;
	Fri,  8 May 2020 08:47:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 508 seconds by postgrey-1.36 at gabe;
 Thu, 07 May 2020 18:15:25 UTC
Received: from mail.centricular.com (mail.centricular.com [50.116.37.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E5466E181
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 18:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.centricular.com (Postfix) with ESMTP id C820F58BAA;
 Fri,  8 May 2020 04:06:56 +1000 (AEST)
X-Virus-Scanned: Debian amavisd-new at centricular.com
Authentication-Results: worm-farm.widgetgrove.com.au (amavisd-new);
 dkim=neutral reason="invalid (public key: not available)"
 header.d=centricular.com
Received: from mail.centricular.com ([127.0.0.1])
 by localhost (worm-farm.widgetgrove.com.au [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id 4MvDaZm4DCxI; Fri,  8 May 2020 04:06:56 +1000 (AEST)
Received: from pimiento.home (180-150-69-32.b49645.syd.nbn.aussiebb.net
 [180.150.69.32])
 by mail.centricular.com (Postfix) with ESMTPSA id 5B6E758B86;
 Fri,  8 May 2020 04:06:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=centricular.com;
 s=201701; t=1588874816;
 bh=LpNaApekJcATOwmHETUqN+tLe7wz0klfAmDhNxf9bdI=;
 h=From:To:Cc:Subject:Date:From;
 b=AZqhtht22hwkngvHxYo2Uq8Vy81XDZuPwoOdDDAXavyqqdQ6+lvSHrd30hER6d7Dk
 L8eTZC0jFuuGVLEZ1Ec3KveN/T4/sywLvKPksSh8VpVEmOe3tVLsPRdlGdL9mdHat2
 RspmGR7MXL1sH5vYR+gHZYhztdRhFZLygWOd6ooUeTpdE1+A7P15BZ+6y/Ibld7OkX
 3EAHQP5YCnL8yiytWgEJXIcRhe2hOYyUqxJK87kr+q5Cb8euHgyivrJYjURsPVYcF6
 Hm0/DqZhk75MgbrFH55ioq1hJM2lM1fU0XkHL4WaaOezqrdO0WeTMG5GvBXOaecjGV
 vuyqsBEfxBWNg==
From: Jan Schmidt <jan@centricular.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/edid: Add Oculus Rift S to non-desktop list
Date: Fri,  8 May 2020 04:06:28 +1000
Message-Id: <20200507180628.740936-1-jan@centricular.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 08 May 2020 08:47:23 +0000
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
Cc: Jan Schmidt <jan@centricular.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a quirk for the Oculus Rift S OVR0012 display so
it shows up as a non-desktop display.

Signed-off-by: Jan Schmidt <jan@centricular.com>
---
 drivers/gpu/drm/drm_edid.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 116451101426..48b989f23432 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -191,10 +191,11 @@ static const struct edid_quirk {
 	{ "HVR", 0xaa01, EDID_QUIRK_NON_DESKTOP },
 	{ "HVR", 0xaa02, EDID_QUIRK_NON_DESKTOP },
 
-	/* Oculus Rift DK1, DK2, and CV1 VR Headsets */
+	/* Oculus Rift DK1, DK2, CV1 and Rift S VR Headsets */
 	{ "OVR", 0x0001, EDID_QUIRK_NON_DESKTOP },
 	{ "OVR", 0x0003, EDID_QUIRK_NON_DESKTOP },
 	{ "OVR", 0x0004, EDID_QUIRK_NON_DESKTOP },
+	{ "OVR", 0x0012, EDID_QUIRK_NON_DESKTOP },
 
 	/* Windows Mixed Reality Headsets */
 	{ "ACR", 0x7fce, EDID_QUIRK_NON_DESKTOP },
-- 
2.25.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
