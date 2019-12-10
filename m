Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECACE11A6C4
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 10:21:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C0E6EAAC;
	Wed, 11 Dec 2019 09:20:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com
 [IPv6:2607:f8b0:4864:20::54a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32DC6E9A4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 22:11:09 +0000 (UTC)
Received: by mail-pg1-x54a.google.com with SMTP id u14so11414713pgq.16
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 14:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=b73r53Ks39MzD1p7Mnxh3aUtTHdkJg2TG1gTQXCA0JA=;
 b=i0uoT9B7VkzZLco87pN4yTJXrhjzrCyboyzAodwErTl0USjyKxQpB8BzII9F79iW5Q
 StJAIzVxBqZBcrl61TgA0+Xjrodo4IBl2vMz9KUV1XjHxjmrRVLhRZwkNmgun+G2244b
 672pjof/K4JjBwR+7wFlGQzL8CepOAOffo4t9eGjXSsRk+R8pIpb3y3WM1ZGatYVqoh6
 n9ZaZiJ1rnLaTy+QLc6aSkhDKvipXqctmsMdXZM2oYgN3j+BYFQ4mok4xCtYYdVB4pov
 F1gaQm0kN2iKRNPeaCrl+d3NAzFOHghLUAkV7ZA//lAPjircz9IcwetG+vyx9pKIDapk
 WioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=b73r53Ks39MzD1p7Mnxh3aUtTHdkJg2TG1gTQXCA0JA=;
 b=LZJdpVa/kUI1jLZiToO/GCDSIsHjk7uBycjfCocDmQT2UrI12/jmbfgQWhIF6q+vT1
 X+8PO6SyTpnfatRVKHWUO3o6HkLlFy3gIYaSC6amRgyhLE76OKzfhoV0cJwLuVff3Xp5
 YM8mUu9JAjyVahOj9CqSYZnl/c58+qPaD8XGKKEgQxOlt4K52eSki879k/xN27Eq7vGy
 5xXC4xsYifyMea9c4D6eDyTlFBZdJvZ5HqcVC0xIVpQxpenWuoDKjTwlFVvAV0kwePwm
 Nwi19iTTdBnlRJj9fH1hP2wBbI6aVVGF4G39rzofvxenV5/a+rc7OZlmpKUR62xPn0Ge
 l0Sg==
X-Gm-Message-State: APjAAAUwfyCxbTR3oENMIfJx1NmX56S0DeIs8iWProUYvktI0l9RcruN
 GRjWvdqWVS4JVQp0M6aydlZlnKezvd72+PHibOohpg==
X-Google-Smtp-Source: APXvYqxIkhq83HNF7Fpw49kmXHGQa5sYZO4wUfdhjjk6/E84bpG99rvKGJ2oOA55p8kIVLS2Md1/2sQ489DZZWBwOZ50WQ==
X-Received: by 2002:a65:6249:: with SMTP id q9mr405022pgv.340.1576015869302;
 Tue, 10 Dec 2019 14:11:09 -0800 (PST)
Date: Tue, 10 Dec 2019 14:10:48 -0800
Message-Id: <20191210221048.83628-1-thomasanderson@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.24.0.525.g8f36a354ae-goog
Subject: [PATCH] drm/edid: Increase size of VDB and CMDB bitmaps to 256 bits
From: Thomas Anderson <thomasanderson@google.com>
To: "=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?=" <ville.syrjala@linux.intel.com>
X-Mailman-Approved-At: Wed, 11 Dec 2019 09:20:35 +0000
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
Cc: Thomas Anderson <thomasanderson@google.com>,
 David Airlie <airlied@linux.ie>, Sean Pau <sean@poorly.run>,
 linux-kernel@vger.kernel.org, Bhawanpreet Lakha <Bhawanpreet.lakha@amd.com>,
 dri-devel@lists.freedesktop.org, Harry Wentland <hwentlan@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CEA-861-G adds modes up to 219, so increase the size of the
maps in preparation for adding the new modes to drm_edid.c.

Signed-off-by: Thomas Anderson <thomasanderson@google.com>
---
 include/drm/drm_connector.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 5f8c3389d46f..17b728d9c73d 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -188,19 +188,19 @@ struct drm_hdmi_info {
 
 	/**
 	 * @y420_vdb_modes: bitmap of modes which can support ycbcr420
-	 * output only (not normal RGB/YCBCR444/422 outputs). There are total
-	 * 107 VICs defined by CEA-861-F spec, so the size is 128 bits to map
-	 * upto 128 VICs;
+	 * output only (not normal RGB/YCBCR444/422 outputs). The max VIC
+	 * defined by the CEA-861-G spec is 219, so the size is 256 bits to map
+	 * up to 256 VICs.
 	 */
-	unsigned long y420_vdb_modes[BITS_TO_LONGS(128)];
+	unsigned long y420_vdb_modes[BITS_TO_LONGS(256)];
 
 	/**
 	 * @y420_cmdb_modes: bitmap of modes which can support ycbcr420
-	 * output also, along with normal HDMI outputs. There are total 107
-	 * VICs defined by CEA-861-F spec, so the size is 128 bits to map upto
-	 * 128 VICs;
+	 * output also, along with normal HDMI outputs. The max VIC defined by
+	 * the CEA-861-G spec is 219, so the size is 256 bits to map up to 256
+	 * VICs.
 	 */
-	unsigned long y420_cmdb_modes[BITS_TO_LONGS(128)];
+	unsigned long y420_cmdb_modes[BITS_TO_LONGS(256)];
 
 	/** @y420_cmdb_map: bitmap of SVD index, to extraxt vcb modes */
 	u64 y420_cmdb_map;
-- 
2.24.0.525.g8f36a354ae-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
