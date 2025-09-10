Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7672B50F48
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 09:27:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B79B110E2C3;
	Wed, 10 Sep 2025 07:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="b78hs8WV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0721C10E2C3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 07:27:10 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 73C5C928;
 Wed, 10 Sep 2025 09:25:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1757489154;
 bh=mHVfyiW/2R5LVK8CcIQFglJl+4MWm5Q3ZmRzmZtbNu8=;
 h=From:Date:Subject:To:Cc:From;
 b=b78hs8WVdZdDB7LeaZ8eozgLS0MbhoyvL4YUpPXDsWLetZPz1uOnsbQTNgjRE/oyn
 FjsftW7R2p/PyqGqMlspIQyGbLkpabav7EuupjIVWGPe+6Vsl6JLDY2A8aoe4kMjcK
 YaEAY4zctPRp1vjk9tpfY+pTWsOPIecM6kGLIjQg=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 10 Sep 2025 10:26:43 +0300
Subject: [PATCH] Revert "media: vsp1: Add underrun debug print"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-rcar-vsp-underrun-revert-v1-1-2fa8d3b1b879@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIADIowWgC/x3MQQqAIBBA0avErBswK6muEi1Cx5qNxVgShHdPW
 v7F+y9EEqYIU/WCUOLIRyjR1BXYfQ0bIbvSoJXu1agGFLsKpnjiHRyJ3AELI7nQt2Q602hrtIP
 CTyHPz7+el5w/f/zmKmoAAAA=
X-Change-ID: 20250908-rcar-vsp-underrun-revert-f3e64612c62d
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Duy Nguyen <duy.nguyen.rh@renesas.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5000;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=mHVfyiW/2R5LVK8CcIQFglJl+4MWm5Q3ZmRzmZtbNu8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBowShI8pFgH6N3pR0/3/DOoC9je94TzCiBY1zDZ
 n2CmRpdzmCJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaMEoSAAKCRD6PaqMvJYe
 9ZS5EACalBaSVv7pNNLELloW8e3OyEX10ViciZYQfSFX19S9GRxUnvffiKStGOY49twC8onruLn
 qH0wzTbIXLXHtoTagmv4qN6sUFzXaTCMTeZD/CCVernGDi3au+HFpFtUm6KUvmITC7ItS3+H/UL
 r84pXc/TCOao+fbkrHzR9zENSodTuUCNNgLWc3duk1oJHyLqPfQ6r2nrKmBiZ4nLZLtshnUdA9a
 yvY14eexXY8pF0ueaQ2Gi393UvMxzASyzx6N3MWu68e7AwBnVTSlRbLTUHX8w0sruGiAyx6I8Kf
 WnDnLYhfcIhH1aCWVo0xnGwO0HgfYZe4mO/4T8Sh5WT2LEFDFG5OkaMED60U/sI1s+OoHcj27O4
 3rmgPbJkoK7AI0C2LdkCUvommV0NFqNS+jn0/HRrzRvX/QIxuhQZ5Sz3e0K0Q2PoB7Jc/LOpACp
 JdR27TFTzZ2ySUGX3NS0470aw51H7r8eOCAL3bJsxkRzU5KLc9Ma8OMLA3BhpLt879n8/4UwgXJ
 Ptf4rdcpEWpXrRxl51MGPyDieivD/caas1F68n/SHChjMwfIVT6nN+HqE2LVvm6Hu7CqT0NafUX
 c24dRCAt0eHoNE+Ua4QLVLgWyXE4SFiF7iZB2uunDQtkvVn36gSn22x+stKgir/UYxuhFJMLGUD
 w/ZVw/epv5N+6hA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

This reverts commit 1dc30075fb0fe02b74b1ea7fd1c1c734a89f1448.

There have been reports of lots of underruns happening on earlier
generation SoCs (M3, E3) with display use cases, e.g.:

vsp1 fea28000.vsp: Underrun occurred at WPF0 (total underruns 1)

but the display still working fine, and reverting the above commit,
which added underrun prints, makes the prints go away (obviously).

I made some tests on a remote M3, with no display connected, and I can
confirm that there seem to be a single underrun report quite often when
enabling a display, and an underrun flood when using interlace display
modes.

E3 does not have interlace display support as far as I can see, so the
interlace issue does not concern it.

Debugging display issues remotely without a display is quite
challenging, and I did not find any issues in the code, nor could I find
a way to stop the underruns by twiddling with the related registers.

My pure guess is that the single underruns occurring when starting the
display hint at either a startup sequence issue, or some kind of initial
fifo loading issue. The interlace underruns hint at a bigger
misconfiguration, but as the display works fine, the issue might be just
an underrun at the start of the frame and the HW quickly catching up, or
at the end of the frame, where one block in the pipeline expects more
data but the previous block has already stopped (so maybe a misconfig
between using interlaced height vs progressive height?).

But at the moment I have no solution to this, and as the displays work
fine, I think it makes sense to just revert the print.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_drm.c  |  3 ---
 drivers/media/platform/renesas/vsp1/vsp1_drv.c  | 11 +----------
 drivers/media/platform/renesas/vsp1/vsp1_pipe.h |  2 --
 drivers/media/platform/renesas/vsp1/vsp1_regs.h |  2 --
 4 files changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
index 15d266439564..b8f211db16fc 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
@@ -721,9 +721,6 @@ int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
 		return 0;
 	}
 
-	/* Reset the underrun counter */
-	pipe->underrun_count = 0;
-
 	drm_pipe->width = cfg->width;
 	drm_pipe->height = cfg->height;
 	pipe->interlaced = cfg->interlaced;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
index b8d06e88c475..68e92d3c5915 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
@@ -47,8 +47,7 @@
 
 static irqreturn_t vsp1_irq_handler(int irq, void *data)
 {
-	u32 mask = VI6_WPF_IRQ_STA_DFE | VI6_WPF_IRQ_STA_FRE |
-		   VI6_WPF_IRQ_STA_UND;
+	u32 mask = VI6_WPF_IRQ_STA_DFE | VI6_WPF_IRQ_STA_FRE;
 	struct vsp1_device *vsp1 = data;
 	irqreturn_t ret = IRQ_NONE;
 	unsigned int i;
@@ -63,14 +62,6 @@ static irqreturn_t vsp1_irq_handler(int irq, void *data)
 		status = vsp1_read(vsp1, VI6_WPF_IRQ_STA(i));
 		vsp1_write(vsp1, VI6_WPF_IRQ_STA(i), ~status & mask);
 
-		if ((status & VI6_WPF_IRQ_STA_UND) && wpf->entity.pipe) {
-			wpf->entity.pipe->underrun_count++;
-
-			dev_warn_ratelimited(vsp1->dev,
-				"Underrun occurred at WPF%u (total underruns %u)\n",
-				i, wpf->entity.pipe->underrun_count);
-		}
-
 		if (status & VI6_WPF_IRQ_STA_DFE) {
 			vsp1_pipeline_frame_end(wpf->entity.pipe);
 			ret = IRQ_HANDLED;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
index 7f623b8cbe5c..9cc2f1646b00 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
@@ -137,8 +137,6 @@ struct vsp1_pipeline {
 
 	unsigned int partitions;
 	struct vsp1_partition *part_table;
-
-	u32 underrun_count;
 };
 
 void vsp1_pipeline_reset(struct vsp1_pipeline *pipe);
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_regs.h b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
index 10cfbcd1b6e0..188d26289714 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_regs.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
@@ -32,12 +32,10 @@
 #define VI6_STATUS_SYS_ACT(n)		BIT((n) + 8)
 
 #define VI6_WPF_IRQ_ENB(n)		(0x0048 + (n) * 12)
-#define VI6_WPF_IRQ_ENB_UNDE		BIT(16)
 #define VI6_WPF_IRQ_ENB_DFEE		BIT(1)
 #define VI6_WPF_IRQ_ENB_FREE		BIT(0)
 
 #define VI6_WPF_IRQ_STA(n)		(0x004c + (n) * 12)
-#define VI6_WPF_IRQ_STA_UND		BIT(16)
 #define VI6_WPF_IRQ_STA_DFE		BIT(1)
 #define VI6_WPF_IRQ_STA_FRE		BIT(0)
 

---
base-commit: 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c
change-id: 20250908-rcar-vsp-underrun-revert-f3e64612c62d

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

