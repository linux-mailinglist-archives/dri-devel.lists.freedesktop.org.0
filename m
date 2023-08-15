Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8E477F824
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 15:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0609D10E49D;
	Thu, 17 Aug 2023 13:57:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 353 seconds by postgrey-1.36 at gabe;
 Thu, 17 Aug 2023 12:15:58 UTC
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34BA610E1D5;
 Thu, 17 Aug 2023 12:15:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1692274195; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=VZyyiSIh8J+OP9un5NaBTAzAAj2LZM5U8LLrQacFB/nwRAMecbtcW25+GcU1zfuK19
 nswii6Qf6YSNbYasFDfeaa5tCLwl7/vH0ueLswjBqdWYyQHp3+3px9TNUZQ6Hnmt2ZhH
 SWaSsvDvI1gjax2atouMTF8kjYID30k171LlWqrS+FlQygh9naid8uCJN+94+9GfXj4F
 H1kG5GEfFxRrJdoWJ+U2uLWw926IPHHzOtbY3oeccRUXCy/3hqsNxv3EHtjYyg72WT4u
 FqA3E6UFpq6r5em6tO4KL9NJMMfFAKxq9lWKr8infMPI3fXrRVLNaCtDU+Io8vVmTs6k
 fncA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1692274195;
 s=strato-dkim-0002; d=strato.com;
 h=Message-Id:Cc:To:Subject:Date:From:References:In-Reply-To:Cc:Date:
 From:Subject:Sender;
 bh=92R+iFSMKQsW8abNM+AkPOFn3F5/ttSfIVxpffD8RoM=;
 b=NmS4qn84WuKeHIZVM4WrKR/elB0iDe76Vsh3H6njNpb5/atQ2x+tyhmDpdWyodg6pX
 oFnbWKKCzE51wgKDi6tDtDvkIXC53pW/Lqv55zO6WJOwhLbT4+4k8+wzqUmfolffAXXj
 IwrX+Cus+fH5lxShfBjVcR336dSbWMIf+ZV72dsRGbpIpGgbS4DyCA4YI2v0/OdiS09T
 yGutE6JBqEFAES2FYX8wngat/ODPKv0z+sM9SR825HmGuqDLZANmJ7VtUOYXk/bC4Xgj
 Uy8JHDhjsHAflxpHl6NI7L2pzge9Gl6K2c4Vq3Wx+1BeZcSboS82cMLIugODPP5sXlGh
 3DhQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1692274195;
 s=strato-dkim-0002; d=dj-l.de;
 h=Message-Id:Cc:To:Subject:Date:From:References:In-Reply-To:Cc:Date:
 From:Subject:Sender;
 bh=92R+iFSMKQsW8abNM+AkPOFn3F5/ttSfIVxpffD8RoM=;
 b=EQgBG9MpqQQzgTbNPlNNrjFx/M56/tadH7bv/YUhD83QJ8+9gK77/Jx5DJ3FSSQeZa
 w7/T48VJS8jUWGnY5EhCpCXjMEfOBp4kHEG3P+b8IAH/dWuDKPqLRa+9/HVg1UavJdDG
 OIo9VgXf+DAFVpmiv41tapn4QzNFhBrgwnfSDqJr4nJ6yA3TExAekswy2ajz+G/oW2HN
 T496UFzz6YqNcvCOZkSwVDddLHW9vhvz3RgntQU6vWlAQbVl40VZHGmShDMI4MFk0hFv
 TdcS4rIA/gsLjKDKWTzcJ2dJF4/+imRVTe2BaK1DSJoNEbTNTHiOBcUwz6IK82JViJvQ
 uuUA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1692274195;
 s=strato-dkim-0003; d=dj-l.de;
 h=Message-Id:Cc:To:Subject:Date:From:References:In-Reply-To:Cc:Date:
 From:Subject:Sender;
 bh=92R+iFSMKQsW8abNM+AkPOFn3F5/ttSfIVxpffD8RoM=;
 b=T54CCsXV+nVCPxunsqaUv1tIxecAHYt6SkvtQTyDu4V5OOVPCVwddaM8wwkBNm7Xf6
 zgnjDvapGNOkp9lWv7Cg==
X-RZG-AUTH: ":KXQNeGCscbKoBnIM8/qR6vmtauhqEyl791IykafLdFE3+tIIOaXyX73mJPT2bA=="
Received: from djlnb.local by smtp.strato.de (RZmta 49.6.6 DYNA|AUTH)
 with ESMTPSA id ja88a5z7HC9s2zC
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 17 Aug 2023 14:09:54 +0200 (CEST)
Received: from dirk by djlnb.local with local (Exim 4.96)
 (envelope-from <fa0f17662a78f6d0b47b7009466680c587628f24@djlnb.dj-l.de>)
 id 1qWbp4-0007eo-0K; Thu, 17 Aug 2023 14:09:54 +0200
In-Reply-To: <20230815101907.2900768-1-jani.nikula@intel.com>
References: <20230815101907.2900768-1-jani.nikula@intel.com>
From: Dirk Lehmann <develop@dj-l.de>
Date: Tue, 15 Aug 2023 13:19:07 +0300
Subject: [PATCH v2 1/2] Revert "drm/edid: Fix csync detailed mode parsing"
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: <stable@vger.kernel.org>
Message-Id: <E1qWbp4-0007eo-0K@djlnb.local>
X-Mailman-Approved-At: Thu, 17 Aug 2023 13:57:08 +0000
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 Dirk Lehmann <develop@dj-l.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jani Nikula <jani.nikula@intel.com>

This reverts commit ca62297b2085b5b3168bd891ca24862242c635a1.

Commit ca62297b2085 ("drm/edid: Fix csync detailed mode parsing") fixed
EDID detailed mode sync parsing. Unfortunately, there are quite a few
displays out there that have bogus (zero) sync field that are broken by
the change. Zero means analog composite sync, which is not right for
digital displays, and the modes get rejected. Regardless, it used to
work, and it needs to continue to work. Revert the change.

Rejecting modes with analog composite sync was the part that fixed the
gitlab issue 8146 [1]. We'll need to get back to the drawing board with
that.

[1] https://gitlab.freedesktop.org/drm/intel/-/issues/8146

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/8789
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/8930
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/9044
Fixes: ca62297b2085 ("drm/edid: Fix csync detailed mode parsing")
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.4+
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 29 ++++++++---------------------
 include/drm/drm_edid.h     | 12 +++---------
 2 files changed, 11 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index e0dbd9140726..1f470968ed14 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3456,6 +3456,10 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_connector *connecto
 			    connector->base.id, connector->name);
 		return NULL;
 	}
+	if (!(pt->misc & DRM_EDID_PT_SEPARATE_SYNC)) {
+		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Composite sync not supported\n",
+			    connector->base.id, connector->name);
+	}
 
 	/* it is incorrect if hsync/vsync width is zero */
 	if (!hsync_pulse_width || !vsync_pulse_width) {
@@ -3502,27 +3506,10 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_connector *connecto
 	if (info->quirks & EDID_QUIRK_DETAILED_SYNC_PP) {
 		mode->flags |= DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC;
 	} else {
-		switch (pt->misc & DRM_EDID_PT_SYNC_MASK) {
-		case DRM_EDID_PT_ANALOG_CSYNC:
-		case DRM_EDID_PT_BIPOLAR_ANALOG_CSYNC:
-			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Analog composite sync!\n",
-				    connector->base.id, connector->name);
-			mode->flags |= DRM_MODE_FLAG_CSYNC | DRM_MODE_FLAG_NCSYNC;
-			break;
-		case DRM_EDID_PT_DIGITAL_CSYNC:
-			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Digital composite sync!\n",
-				    connector->base.id, connector->name);
-			mode->flags |= DRM_MODE_FLAG_CSYNC;
-			mode->flags |= (pt->misc & DRM_EDID_PT_HSYNC_POSITIVE) ?
-				DRM_MODE_FLAG_PCSYNC : DRM_MODE_FLAG_NCSYNC;
-			break;
-		case DRM_EDID_PT_DIGITAL_SEPARATE_SYNC:
-			mode->flags |= (pt->misc & DRM_EDID_PT_HSYNC_POSITIVE) ?
-				DRM_MODE_FLAG_PHSYNC : DRM_MODE_FLAG_NHSYNC;
-			mode->flags |= (pt->misc & DRM_EDID_PT_VSYNC_POSITIVE) ?
-				DRM_MODE_FLAG_PVSYNC : DRM_MODE_FLAG_NVSYNC;
-			break;
-		}
+		mode->flags |= (pt->misc & DRM_EDID_PT_HSYNC_POSITIVE) ?
+			DRM_MODE_FLAG_PHSYNC : DRM_MODE_FLAG_NHSYNC;
+		mode->flags |= (pt->misc & DRM_EDID_PT_VSYNC_POSITIVE) ?
+			DRM_MODE_FLAG_PVSYNC : DRM_MODE_FLAG_NVSYNC;
 	}
 
 set_size:
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 169755d3de19..48e93f909ef6 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -61,15 +61,9 @@ struct std_timing {
 	u8 vfreq_aspect;
 } __attribute__((packed));
 
-#define DRM_EDID_PT_SYNC_MASK              (3 << 3)
-# define DRM_EDID_PT_ANALOG_CSYNC          (0 << 3)
-# define DRM_EDID_PT_BIPOLAR_ANALOG_CSYNC  (1 << 3)
-# define DRM_EDID_PT_DIGITAL_CSYNC         (2 << 3)
-#  define DRM_EDID_PT_CSYNC_ON_RGB         (1 << 1) /* analog csync only */
-#  define DRM_EDID_PT_CSYNC_SERRATE        (1 << 2)
-# define DRM_EDID_PT_DIGITAL_SEPARATE_SYNC (3 << 3)
-#  define DRM_EDID_PT_HSYNC_POSITIVE       (1 << 1) /* also digital csync */
-#  define DRM_EDID_PT_VSYNC_POSITIVE       (1 << 2)
+#define DRM_EDID_PT_HSYNC_POSITIVE (1 << 1)
+#define DRM_EDID_PT_VSYNC_POSITIVE (1 << 2)
+#define DRM_EDID_PT_SEPARATE_SYNC  (3 << 3)
 #define DRM_EDID_PT_STEREO         (1 << 5)
 #define DRM_EDID_PT_INTERLACED     (1 << 7)
 
-- 
2.40.1

