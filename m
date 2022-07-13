Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B9E573BBC
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 19:02:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D4F952B7;
	Wed, 13 Jul 2022 17:02:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F4CB94181
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 17:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=LhGAZROra5QOZpyxV7jNOBn6mJXRtI/+2qRbRv/RFxk=;
 b=kZi/9gqY1gWQZmhitG5gfJtSlHpgSKG6Y9e0X71KkYjO1EInza4YHM014asW6oq3InmCTD7Y7Ppl8
 xtgNMGU3yR0jCSd3fYnM0sQ/P/5qrekPaSVv2X/hXxdCJ//4flZU3Q9LiDv7Foh7G81K76M2fIp8zr
 N0up3coEVeI/Sle+TO7O0IKJllCOGEddW4PQ7KycRC/um4dxqwUWVbL4l9lIfsclTWvl+b2X7Y00FS
 W6hwHg0glrGL8csQdk0VT7oIkXeuNG7pzBx9bQ9ptCEhcPvnC+BHaHYFFrjOmsMsW03JY1PmJj8bL7
 aRRvsuSOUUBUxVCwDtNQWtCZL8SlESQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=LhGAZROra5QOZpyxV7jNOBn6mJXRtI/+2qRbRv/RFxk=;
 b=oGyOXJs9z+rTtNCYPbxAyNOWxmG9Hf8i7UTBoIVCRwoJMVHeHOmN3NXLCa6evY1RzFstKFFnALuX6
 L4sYKjQBg==
X-HalOne-Cookie: 5ce7979643cc30b3c17b1eba631852b7ce1cd017
X-HalOne-ID: 940a0691-02cd-11ed-be7e-d0431ea8bb03
Received: from mailproxy3.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 940a0691-02cd-11ed-be7e-d0431ea8bb03;
 Wed, 13 Jul 2022 17:02:29 +0000 (UTC)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 12/13] drm/via: Make macros readable in the via_3d_reg
 header
Date: Wed, 13 Jul 2022 19:02:01 +0200
Message-Id: <20220713170202.1798216-13-sam@ravnborg.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220713170202.1798216-1-sam@ravnborg.org>
References: <20220713170202.1798216-1-sam@ravnborg.org>
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>,
 Sam Ravnborg <sam@ravnborg.org>, Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The macros for texture 1 settinig all used continuation on a new line,
resulting in a highly ureadable definition.
Merge the lines so they are on a single line each.

As a nice side-effect this fixes a number of checkpatch warnings:
"WARNING: please, no spaces at the start of a line"i.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>
---
 drivers/gpu/drm/via/via_3d_reg.h | 222 +++++++++++--------------------
 1 file changed, 74 insertions(+), 148 deletions(-)

diff --git a/drivers/gpu/drm/via/via_3d_reg.h b/drivers/gpu/drm/via/via_3d_reg.h
index 8796fc9fd44b..4a884384e5b8 100644
--- a/drivers/gpu/drm/via/via_3d_reg.h
+++ b/drivers/gpu/drm/via/via_3d_reg.h
@@ -1488,154 +1488,80 @@
 #define HC_SIMA_TX0TX1_OFF      0x0050
 /*---- start of texture 1 setting ----
  */
-#define HC_SIMA_HTX1L0BasL      \
-    (HC_SIMA_HTX0L0BasL + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1L1BasL      \
-    (HC_SIMA_HTX0L1BasL + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1L2BasL      \
-    (HC_SIMA_HTX0L2BasL + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1L3BasL      \
-    (HC_SIMA_HTX0L3BasL + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1L4BasL      (\
-    HC_SIMA_HTX0L4BasL + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1L5BasL      \
-    (HC_SIMA_HTX0L5BasL + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1L6BasL      \
-    (HC_SIMA_HTX0L6BasL + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1L7BasL      \
-    (HC_SIMA_HTX0L7BasL + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1L8BasL      \
-    (HC_SIMA_HTX0L8BasL + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1L9BasL      \
-    (HC_SIMA_HTX0L9BasL + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1LaBasL      \
-    (HC_SIMA_HTX0LaBasL + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1LbBasL      \
-    (HC_SIMA_HTX0LbBasL + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1LcBasL      \
-    (HC_SIMA_HTX0LcBasL + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1LdBasL      \
-    (HC_SIMA_HTX0LdBasL + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1LeBasL      \
-    (HC_SIMA_HTX0LeBasL + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1LfBasL      \
-    (HC_SIMA_HTX0LfBasL + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1L10BasL     \
-    (HC_SIMA_HTX0L10BasL + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1L11BasL     \
-    (HC_SIMA_HTX0L11BasL + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1L012BasH    \
-    (HC_SIMA_HTX0L012BasH + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1L345BasH    \
-    (HC_SIMA_HTX0L345BasH + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1L678BasH    \
-    (HC_SIMA_HTX0L678BasH + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1L9abBasH    \
-    (HC_SIMA_HTX0L9abBasH + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1LcdeBasH    \
-    (HC_SIMA_HTX0LcdeBasH + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1Lf1011BasH  \
-    (HC_SIMA_HTX0Lf1011BasH + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1L0Pit       \
-    (HC_SIMA_HTX0L0Pit + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1L1Pit       \
-    (HC_SIMA_HTX0L1Pit + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1L2Pit       \
-    (HC_SIMA_HTX0L2Pit + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1L3Pit       \
-    (HC_SIMA_HTX0L3Pit + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1L4Pit       \
-    (HC_SIMA_HTX0L4Pit + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1L5Pit       \
-    (HC_SIMA_HTX0L5Pit + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1L6Pit       \
-    (HC_SIMA_HTX0L6Pit + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1L7Pit       \
-    (HC_SIMA_HTX0L7Pit + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1L8Pit       \
-    (HC_SIMA_HTX0L8Pit + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1L9Pit       \
-    (HC_SIMA_HTX0L9Pit + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1LaPit       \
-    (HC_SIMA_HTX0LaPit + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1LbPit       \
-    (HC_SIMA_HTX0LbPit + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1LcPit       \
-    (HC_SIMA_HTX0LcPit + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1LdPit       \
-    (HC_SIMA_HTX0LdPit + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1LePit       \
-    (HC_SIMA_HTX0LePit + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1LfPit       \
-    (HC_SIMA_HTX0LfPit + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1L10Pit      \
-    (HC_SIMA_HTX0L10Pit + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1L11Pit      \
-    (HC_SIMA_HTX0L11Pit + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1L0_5WE      \
-    (HC_SIMA_HTX0L0_5WE + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1L6_bWE      \
-    (HC_SIMA_HTX0L6_bWE + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1Lc_11WE     \
-    (HC_SIMA_HTX0Lc_11WE + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1L0_5HE      \
-    (HC_SIMA_HTX0L0_5HE + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1L6_bHE      \
-    (HC_SIMA_HTX0L6_bHE + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1Lc_11HE      \
-    (HC_SIMA_HTX0Lc_11HE + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1L0OS        \
-    (HC_SIMA_HTX0L0OS + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1TB          \
-    (HC_SIMA_HTX0TB + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1MPMD        \
-    (HC_SIMA_HTX0MPMD + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1CLODu       \
-    (HC_SIMA_HTX0CLODu + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1FM          \
-    (HC_SIMA_HTX0FM + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1TRCH        \
-    (HC_SIMA_HTX0TRCH + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1TRCL        \
-    (HC_SIMA_HTX0TRCL + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1TBC         \
-    (HC_SIMA_HTX0TBC + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1TRAH        \
-    (HC_SIMA_HTX0TRAH + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1LTC         \
-    (HC_SIMA_HTX0LTC + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1LTA         \
-    (HC_SIMA_HTX0LTA + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1TBLCsat     \
-    (HC_SIMA_HTX0TBLCsat + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1TBLCop      \
-    (HC_SIMA_HTX0TBLCop + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1TBLMPfog    \
-    (HC_SIMA_HTX0TBLMPfog + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1TBLAsat     \
-    (HC_SIMA_HTX0TBLAsat + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1TBLRCa      \
-    (HC_SIMA_HTX0TBLRCa + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1TBLRCb      \
-    (HC_SIMA_HTX0TBLRCb + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1TBLRCc      \
-    (HC_SIMA_HTX0TBLRCc + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1TBLRCbias   \
-    (HC_SIMA_HTX0TBLRCbias + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1TBLRAa      \
-    (HC_SIMA_HTX0TBLRAa + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1TBLRFog     \
-    (HC_SIMA_HTX0TBLRFog + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1BumpM00     \
-    (HC_SIMA_HTX0BumpM00 + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1BumpM01     \
-    (HC_SIMA_HTX0BumpM01 + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1BumpM10     \
-    (HC_SIMA_HTX0BumpM10 + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1BumpM11     \
-    (HC_SIMA_HTX0BumpM11 + HC_SIMA_TX0TX1_OFF)
-#define HC_SIMA_HTX1LScale      \
-    (HC_SIMA_HTX0LScale + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1L0BasL       (HC_SIMA_HTX0L0BasL + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1L1BasL       (HC_SIMA_HTX0L1BasL + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1L2BasL       (HC_SIMA_HTX0L2BasL + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1L3BasL       (HC_SIMA_HTX0L3BasL + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1L4BasL       (HC_SIMA_HTX0L4BasL + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1L5BasL       (HC_SIMA_HTX0L5BasL + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1L6BasL       (HC_SIMA_HTX0L6BasL + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1L7BasL       (HC_SIMA_HTX0L7BasL + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1L8BasL       (HC_SIMA_HTX0L8BasL + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1L9BasL       (HC_SIMA_HTX0L9BasL + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1LaBasL       (HC_SIMA_HTX0LaBasL + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1LbBasL       (HC_SIMA_HTX0LbBasL + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1LcBasL       (HC_SIMA_HTX0LcBasL + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1LdBasL       (HC_SIMA_HTX0LdBasL + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1LeBasL       (HC_SIMA_HTX0LeBasL + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1LfBasL       (HC_SIMA_HTX0LfBasL + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1L10BasL      (HC_SIMA_HTX0L10BasL + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1L11BasL      (HC_SIMA_HTX0L11BasL + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1L012BasH     (HC_SIMA_HTX0L012BasH + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1L345BasH     (HC_SIMA_HTX0L345BasH + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1L678BasH     (HC_SIMA_HTX0L678BasH + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1L9abBasH     (HC_SIMA_HTX0L9abBasH + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1LcdeBasH     (HC_SIMA_HTX0LcdeBasH + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1Lf1011BasH   (HC_SIMA_HTX0Lf1011BasH + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1L0Pit        (HC_SIMA_HTX0L0Pit + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1L1Pit        (HC_SIMA_HTX0L1Pit + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1L2Pit        (HC_SIMA_HTX0L2Pit + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1L3Pit        (HC_SIMA_HTX0L3Pit + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1L4Pit        (HC_SIMA_HTX0L4Pit + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1L5Pit        (HC_SIMA_HTX0L5Pit + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1L6Pit        (HC_SIMA_HTX0L6Pit + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1L7Pit        (HC_SIMA_HTX0L7Pit + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1L8Pit        (HC_SIMA_HTX0L8Pit + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1L9Pit        (HC_SIMA_HTX0L9Pit + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1LaPit        (HC_SIMA_HTX0LaPit + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1LbPit        (HC_SIMA_HTX0LbPit + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1LcPit        (HC_SIMA_HTX0LcPit + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1LdPit        (HC_SIMA_HTX0LdPit + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1LePit        (HC_SIMA_HTX0LePit + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1LfPit        (HC_SIMA_HTX0LfPit + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1L10Pit       (HC_SIMA_HTX0L10Pit + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1L11Pit       (HC_SIMA_HTX0L11Pit + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1L0_5WE       (HC_SIMA_HTX0L0_5WE + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1L6_bWE       (HC_SIMA_HTX0L6_bWE + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1Lc_11WE      (HC_SIMA_HTX0Lc_11WE + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1L0_5HE       (HC_SIMA_HTX0L0_5HE + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1L6_bHE       (HC_SIMA_HTX0L6_bHE + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1Lc_11HE      (HC_SIMA_HTX0Lc_11HE + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1L0OS         (HC_SIMA_HTX0L0OS + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1TB           (HC_SIMA_HTX0TB + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1MPMD         (HC_SIMA_HTX0MPMD + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1CLODu        (HC_SIMA_HTX0CLODu + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1FM           (HC_SIMA_HTX0FM + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1TRCH         (HC_SIMA_HTX0TRCH + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1TRCL         (HC_SIMA_HTX0TRCL + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1TBC          (HC_SIMA_HTX0TBC + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1TRAH         (HC_SIMA_HTX0TRAH + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1LTC          (HC_SIMA_HTX0LTC + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1LTA          (HC_SIMA_HTX0LTA + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1TBLCsat      (HC_SIMA_HTX0TBLCsat + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1TBLCop       (HC_SIMA_HTX0TBLCop + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1TBLMPfog     (HC_SIMA_HTX0TBLMPfog + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1TBLAsat      (HC_SIMA_HTX0TBLAsat + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1TBLRCa       (HC_SIMA_HTX0TBLRCa + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1TBLRCb       (HC_SIMA_HTX0TBLRCb + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1TBLRCc       (HC_SIMA_HTX0TBLRCc + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1TBLRCbias    (HC_SIMA_HTX0TBLRCbias + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1TBLRAa       (HC_SIMA_HTX0TBLRAa + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1TBLRFog      (HC_SIMA_HTX0TBLRFog + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1BumpM00      (HC_SIMA_HTX0BumpM00 + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1BumpM01      (HC_SIMA_HTX0BumpM01 + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1BumpM10      (HC_SIMA_HTX0BumpM10 + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1BumpM11      (HC_SIMA_HTX0BumpM11 + HC_SIMA_TX0TX1_OFF)
+#define HC_SIMA_HTX1LScale       (HC_SIMA_HTX0LScale + HC_SIMA_TX0TX1_OFF)
 /*---- end of texture 1 setting ---- 0xaf
  */
 #define HC_SIMA_HTXSMD          0x00b0
-- 
2.34.1

