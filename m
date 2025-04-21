Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01005A94D77
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 09:49:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F7610E033;
	Mon, 21 Apr 2025 07:49:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="B4Sj1ADr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 518 seconds by postgrey-1.36 at gabe;
 Mon, 21 Apr 2025 07:49:32 UTC
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.155.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F65310E033
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 07:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1745221758;
 bh=Fxs9NxWDxUFieX7yGlVwvGNZOmO3A4Li11xcTkfRoqY=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=B4Sj1ADrb+cnBox7SLGc479zZG4KCMrafxepqHMDqYc3oS+V682HArgWcv/UdGjiC
 X/fHn7r1dPxwh/u0PgauTyRXjMUNDczhwNIZOlpLyl/hfSN0LrXda8ozS1TszAAaA5
 zjuZLeLOjAqQmoEpLAjKONUImz9NnoyKIIinahcU=
X-QQ-mid: zesmtpip4t1745221226t7d1c116b
X-QQ-Originating-IP: jqo7yqqOLdTjgbTqbuM2nYummntLNnOIXlBWdBK0Yoc=
Received: from localhost.localdomain ( [localhost])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 21 Apr 2025 15:40:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 10529845600704120540
EX-QQ-RecipientCnt: 22
From: WangYuli <wangyuli@uniontech.com>
To: hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 borntraeger@linux.ibm.com, svens@linux.ibm.com, obitton@habana.ai,
 akpm@linux-foundation.org
Cc: gerald.schaefer@linux.ibm.com, viro@zeniv.linux.org.uk,
 wangyuli@uniontech.com, meted@linux.ibm.com, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 yujiaoliang@vivo.com, shenlichuan@vivo.com, cvam0000@gmail.com,
 jesse.brandeburg@intel.com, colin.i.king@gmail.com, zhanjun@uniontech.com,
 niecheng1@uniontech.com, guanwentao@uniontech.com
Subject: [PATCH] treewide: Fix typo "previlege"
Date: Mon, 21 Apr 2025 15:38:37 +0800
Message-ID: <F3FFD123DE5F85F3+20250421073837.64732-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NhdiEwnVOUqE3NJz49rl/jpen98jLnRo9cUnRyCRaa9s9GbQVyn3ECPW
 lfmo17IuHC/FOaa/3MkgyjZWXmQFGCKnwP8e7Dir6isxsthsRI4+frSSjapqxTU8kQhZ/D0
 Q6nBTJnNukrAwvu7D9qUwYLyESVT6Q2XSum1ngXqc6sR2d3OjX4jsykLh3IDG50AJcpmmSN
 3qlLFFGFU/Nka7cfkOcSNyx0LfZvxjY5wxWFoepKBR2jPAEe/Y5PQLdOj+FKSY6LGVLbp/A
 uXFaYAIx5YMo46rMsNkjt08og07F8BfHIDvH1Z+NJiu5Lzepl/ZHMtwtE3Ba1p582Q1js2/
 lsRo4APpOx1v1i1EKvWO2dfVV7xcne8HAg3OnZQTbEvO8Yk84uFcNOHo/6A/U0LTVjfV3jN
 +tA/vIYlBNvdWiaF2qjyYsAmjmyEkeOGlgtjF6LG3iuLOut5FaMfrbknMx6gv5s+meGcMNY
 xFhwPu6+PaFqDy/mh+YCeR40nia+OuzZOqNwLBusZ2o+h2zqLe6JXI+TBJ3tzimrxvN+ZsT
 9y0S1bXKk7tQuEMmCRERS2Ydc03WgBvIfeEkfSGF2rW+OPk+xfHuK54DwZc9sHgI4iBsjtc
 dzmxtn7B5xe0J17pg/uv3Epx5D66O+P3w56l/yz2WMZLqR3lZ1afDHYPnEuwVwBfmt9uRhj
 ZteNxhDP8MgtHSCYj7fn0fCSe9G8XF7iRAKfvXWHUM0IknCm9DDNtz+Nh5SmEE51DAv95+I
 q03jTkzwpvj0AB/Q+29f1nJry6hctC/roV/FabUIIsWXNk9JFDcqwGDQ/I8KUYnelUTcqE0
 R8bPHumyNdvBmEj1gwBlZW+hPHgtQGXYwGPxAUpnd5pWH6hE3C30qrD77WRQ4DQKedVtKk2
 QHA6sh3Uc9X7AOnS6N/NZVCn6MEJwTkWWegGp61rRU74UvaZk1gdiSDN9iWc6lRVciUKWeF
 ABpS5afOgAJnqojGlH98z4552VvkXxT84wJCOU7PQDWsTPDF4Ts0mkSRGW4P3Cu05M4nIhl
 HmioUpZMHf9+r7Sf2S7Up2W6mHC50=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0
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

There are some spelling mistakes of 'previlege' in comments which
should be 'previlege'.

Fix them and add it to scripts/spelling.txt.

The typo in arch/loongarch/kvm/main.c was corrected by a different
patch [1] and is therefore not included in this submission.

[1]. https://lore.kernel.org/all/20250420142208.2252280-1-wheatfox17@icloud.com/

Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/s390/char/vmlogrdr.c          | 4 ++--
 include/linux/habanalabs/hl_boot_if.h | 2 +-
 scripts/spelling.txt                  | 2 ++
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/s390/char/vmlogrdr.c b/drivers/s390/char/vmlogrdr.c
index dac85294d2f5..e284eea331d7 100644
--- a/drivers/s390/char/vmlogrdr.c
+++ b/drivers/s390/char/vmlogrdr.c
@@ -255,7 +255,7 @@ static int vmlogrdr_recording(struct vmlogrdr_priv_t * logptr,
 
 	/*
 	 * The recording commands needs to be called with option QID
-	 * for guests that have previlege classes A or B.
+	 * for guests that have privilege classes A or B.
 	 * Purging has to be done as separate step, because recording
 	 * can't be switched on as long as records are on the queue.
 	 * Doing both at the same time doesn't work.
@@ -557,7 +557,7 @@ static ssize_t vmlogrdr_purge_store(struct device * dev,
 
         /*
 	 * The recording command needs to be called with option QID
-	 * for guests that have previlege classes A or B.
+	 * for guests that have privilege classes A or B.
 	 * Other guests will not recognize the command and we have to
 	 * issue the same command without the QID parameter.
 	 */
diff --git a/include/linux/habanalabs/hl_boot_if.h b/include/linux/habanalabs/hl_boot_if.h
index d2a9fc96424b..af5fb4ad77eb 100644
--- a/include/linux/habanalabs/hl_boot_if.h
+++ b/include/linux/habanalabs/hl_boot_if.h
@@ -295,7 +295,7 @@ enum cpu_boot_dev_sts {
  *					Initialized in: linux
  *
  * CPU_BOOT_DEV_STS0_GIC_PRIVILEGED_EN	GIC access permission only from
- *					previleged entity. FW sets this status
+ *					privileged entity. FW sets this status
  *					bit for host. If this bit is set then
  *					GIC can not be accessed from host.
  *					Initialized in: linux
diff --git a/scripts/spelling.txt b/scripts/spelling.txt
index a290db720b0f..ac94fa1c2415 100644
--- a/scripts/spelling.txt
+++ b/scripts/spelling.txt
@@ -1240,6 +1240,8 @@ prefered||preferred
 prefferably||preferably
 prefitler||prefilter
 preform||perform
+previleged||privileged
+previlege||privilege
 premption||preemption
 prepaired||prepared
 prepate||prepare
-- 
2.49.0

