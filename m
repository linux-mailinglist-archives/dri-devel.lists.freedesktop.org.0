Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E566D34041B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 12:03:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690A06E8E2;
	Thu, 18 Mar 2021 11:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D38966E8DE
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 11:02:59 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id d20so1513786qkc.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 04:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jFROpSYMFSugf/JDJSkj70mXo6rlQvepZUxoikhqvwU=;
 b=SrRsdV2GlRLy1OIZxZ55PGFGPinWJS8RY3CsYUJWNkI9f9akNLQFISG4is4tiwOiYy
 PbV0axfTUM+H6QPcymufLrlWEGjRIT34SnvPNBnpVeRisBnaKVJsbw/jmtv4MokTDjto
 u0mKdPs8zfJHAuB25N4C5U6Tc4vg7QAJJZrdtambLN0VZEpLhZ4JJpkadukGKuXEmmZR
 9En5GdChZ2P4AxCc0/1kK6eTgE3wkwOnVIsffA3P6QgkmRBljjgQAxEZJz59uFjnbXhy
 3XB7l+I7Qw5ljV58BjWdhaWJQGVvXDf8TWGjTCtrCxrclFC7w1K5Ysk1uWjxhjNFGIba
 kNkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jFROpSYMFSugf/JDJSkj70mXo6rlQvepZUxoikhqvwU=;
 b=BZWMw3czzsDCiJ9yumnWbiJA+84WAX1D4DddGpYy1NmUeCZIPDvrfpPwJ4MjkdNq33
 DiSVDj4APUMBKCeLoiDPg8HtCWz3A3+qW1NhNks93Fq5D3fPNYQZs/lZaQfYbdDKsdRx
 g2ibfH5hxGyQgyap0nZRPno3sq6PkIijXfmMPqy8QHgO+3rg/lmaft6jxBXVJ9T68RJG
 Cj26c9NdBmo1fxo6jZH7FJ2ptIoopZjy4vzGwaqZV1ehfXpRuqMhfA1P8kV22drYag5Y
 hSqhaOzLhDyrQMOseINb5vSnFpyjiU797AHjIWcSat9VtTI7ZGQBhjla5XthDa88KiJs
 HQCw==
X-Gm-Message-State: AOAM530a1S4tSaFC6aLh2Iv9D5qDGz1hyAOGPlz9a86MY3VlbexsyanR
 gH9iddT3H7PKRgD2kSGgiGQ=
X-Google-Smtp-Source: ABdhPJwkDT7cMA31ljW5JM3vw1gfqLU0z9C/0DWpzWCJm9s9ksIWUez9Dg5OON90ZbpVrK8+ajYGSQ==
X-Received: by 2002:a37:7985:: with SMTP id u127mr3644083qkc.333.1616065379130; 
 Thu, 18 Mar 2021 04:02:59 -0700 (PDT)
Received: from localhost.localdomain ([156.146.54.246])
 by smtp.gmail.com with ESMTPSA id f2sm1407123qko.135.2021.03.18.04.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 04:02:58 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: narmstrong@baylibre.com, airlied@linux.ie, daniel@ffwll.ch,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/meson: Fix few typo
Date: Thu, 18 Mar 2021 16:30:46 +0530
Message-Id: <20210318110046.14830-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


s/initialy/initially/
s/desined/designed/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/gpu/drm/meson/meson_venc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
index 5e2236ec189f..3c55ed003359 100644
--- a/drivers/gpu/drm/meson/meson_venc.c
+++ b/drivers/gpu/drm/meson/meson_venc.c
@@ -45,7 +45,7 @@
  * The ENCI is designed for PAl or NTSC encoding and can go through the VDAC
  * directly for CVBS encoding or through the ENCI_DVI encoder for HDMI.
  * The ENCP is designed for Progressive encoding but can also generate
- * 1080i interlaced pixels, and was initialy desined to encode pixels for
+ * 1080i interlaced pixels, and was initially designed to encode pixels for
  * VDAC to output RGB ou YUV analog outputs.
  * It's output is only used through the ENCP_DVI encoder for HDMI.
  * The ENCL LVDS encoder is not implemented.
--
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
