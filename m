Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6B04636D0
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 15:35:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB266E90C;
	Tue, 30 Nov 2021 14:35:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta-p7.oit.umn.edu (mta-p7.oit.umn.edu [134.84.196.207])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C3C86E907
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 14:35:02 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p7.oit.umn.edu (Postfix) with ESMTP id 4J3PrP5Hjcz9xKL7
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 14:35:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k_rOEF6yByng for <dri-devel@lists.freedesktop.org>;
 Tue, 30 Nov 2021 08:35:01 -0600 (CST)
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 4J3PrP3Cdyz9xKL0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 08:35:01 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p7.oit.umn.edu 4J3PrP3Cdyz9xKL0
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 4J3PrP3Cdyz9xKL0
Received: by mail-pf1-f197.google.com with SMTP id
 q82-20020a627555000000b004a4f8cadb6fso12939946pfc.20
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 06:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v45QaW2rM4Je/A8eu9T3JFXlWztdvqd9VNNeErMwc18=;
 b=ZoJ7bm62EGw7ET4F1X20dpTU7jOwszuY9Bf8pk2ZQQylLCvULZZChhV65/9zTL8s3f
 hNlp0ysjfaFVeSzUpTo+vjdJQlYwrEVHbbqCYmvLUn4A7lpiHK/SVIoJeqvFCBJANZCw
 6I/83GucUnXu7bRLNHWKTqrWxdVNTlH05T8nHO76x6idj5YKgCSOnkg1XtOhAK4mXkq6
 +1oYirp7q5sbg7cLxLAWPWzZXSS76mWWWHbZF9DneEeDnTx2Eqm+3Y/IICIODVT/HDqi
 HZ9pOp3tfkqltDdRs7fS0JlVHLh48MwjjzjjOCpVfGt44YJcYlqOEfTpUcKHaQUplA4H
 uM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v45QaW2rM4Je/A8eu9T3JFXlWztdvqd9VNNeErMwc18=;
 b=Ogxb3OFJrnTJjhL9fykJak4/CtJ4Ba9NmkNMZKMGdw8/YoDWr9LZQem3xRD0P5lfLn
 7W2uJIR7579l+u0oUIAXL9IDAT9o8jHr4Xog7LyDbjjmqdMcsRnVLyO247LPVRqFE7uN
 oC+iLYT+MiFVHtH0xrXblRtW40pxUup7uHXWRxnc3JpQhbyjnRYs49T8UC5nkGasewhU
 mk3pxxqkWOw2o0xEtH6yVKVIm7/sY7sEiB59Ji3YnP2QgyLwD5OkSDE6YXzlPVUDqeSj
 As68oY+S44Qac2LPpHDVg+6FLQkHmLCyQlME97Vly2tes7cCA7ElFO6rjY1jzGizBGIP
 ZQNQ==
X-Gm-Message-State: AOAM532CNHZh3rMhea6uu+edwMxsR98FSWvpqDaoktgi0dNa5SjWolJv
 seTfJjJ2KXpGSmW7OcWVUvrVnyxHnc54Src76uk25IWCTG0fGnULIVMZiaCQ+m3/unKpWRblOub
 CRCzWeIJAOph0b9HuU9UVb/gpZ48I3VTd
X-Received: by 2002:a17:90b:4a89:: with SMTP id
 lp9mr6673740pjb.6.1638282900685; 
 Tue, 30 Nov 2021 06:35:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwCRXgemJPjRW9A0gvP1wh5yNn/WdhCWBlFTQZi+PCntn4wzo5i7noyETqEeeoY0emTtll64g==
X-Received: by 2002:a17:90b:4a89:: with SMTP id
 lp9mr6673719pjb.6.1638282900508; 
 Tue, 30 Nov 2021 06:35:00 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
 by smtp.gmail.com with ESMTPSA id s28sm22292818pfg.147.2021.11.30.06.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 06:35:00 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Subject: [PATCH] drm/nouveau/dispnv04: Fix a NULL pointer dereference in
 nv17_tv_get_hd_modes()
Date: Tue, 30 Nov 2021 22:34:53 +0800
Message-Id: <20211130143454.159221-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 kjlu@umn.edu, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In nv17_tv_get_hd_modes(), the return value of drm_mode_duplicate() is
assigned to mode and there is a dereference of it in
nv17_tv_get_hd_modes(), which could lead to a NULL pointer dereference
on failure of drm_mode_duplicate().

Fix this bug add a check of mode.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_DRM_NOUVEAU=m show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: 6ee738610f41 ("drm/nouveau: Add DRM driver for NVIDIA GPUs")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
index be28e7bd7490..6fe103fd60e9 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
@@ -257,6 +257,9 @@ static int nv17_tv_get_hd_modes(struct drm_encoder *encoder,
 		if (modes[i].hdisplay == output_mode->hdisplay &&
 		    modes[i].vdisplay == output_mode->vdisplay) {
 			mode = drm_mode_duplicate(encoder->dev, output_mode);
+			if (!mode)
+				return -ENOMEM;
+
 			mode->type |= DRM_MODE_TYPE_PREFERRED;
 
 		} else {
-- 
2.25.1

