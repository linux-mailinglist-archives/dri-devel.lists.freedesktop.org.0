Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 364252DAF1A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 15:41:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3E76E3AE;
	Tue, 15 Dec 2020 14:41:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 551CD6E3B2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 14:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608043272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=F8joEElleXKdzZZoOlmFpnV8pMLwxW0aIioc9VmMinw=;
 b=flzRiILVnGaxD5mQwo3KADC7MyIiO5xJ5Q8ezWotrAr2xKd4RjAZAZuKe8QbVpI/9S62+M
 zWD9Bo4WAAEvURGTZ3Lm7IJguZCXBXr8qdd9CuuTreVZ402khFwPNJ8IGTcD0ZzwydM3b7
 jBeQ7zUEkhOsqvCNKreWxvaaluoV+xk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-2D1vORs3O-aMcimJtyKZDw-1; Tue, 15 Dec 2020 09:41:08 -0500
X-MC-Unique: 2D1vORs3O-aMcimJtyKZDw-1
Received: by mail-qk1-f198.google.com with SMTP id g5so15109050qke.22
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 06:41:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F8joEElleXKdzZZoOlmFpnV8pMLwxW0aIioc9VmMinw=;
 b=J1xZSCsYDN4yWdeHmd1b84q3Sqeadug6ObvWHO3Q5QH7VSHecfve5O4jSfmPU4osaN
 3ugjZf21o/7Gq0FV5iOC1lAV87NKnsceoerRt2hYButSMSK70pVL+00/cMysY1X1zFeA
 gnRZHyCN7jExefr/yPBQOEgvDqqnq8Tlif6E9jV/MKFSBqdc8I7houlHh34E3IWP6jmA
 hUiwaulh0iR9QEtNkUIvJcSd7b5Acjj01u9M/t1hMYvPn5OQM43CVlhmYYzV4PyazZb2
 fFxPWkIF60cjqCduzj/8jG+LbmXK3+lIdERVREkH75py5tRCKROAdbcfiKo7JBMyDRWl
 eOZA==
X-Gm-Message-State: AOAM533Qk5WGQZC0YoIqqkL2h+GmvzG6ILjp6ThgE7ehzP3cFiPNt1TS
 8NCkI5HtHqDrmTusLtf2Z0dHEvxyWNX4ygNB1eGyZCbwxQRZZ6g3/n4BiIXt8zT6UCUnFIiprzP
 Gy5sk+xtpUQy3rCfIJFElmkh9c6ej
X-Received: by 2002:ac8:588c:: with SMTP id t12mr35766789qta.184.1608043268254; 
 Tue, 15 Dec 2020 06:41:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw0aOW3zgklpzEA6VS9bGbEduK40Txfz03DgS33CSsoQvHcRVw60dBnH0UPlARX48A3H9vH8Q==
X-Received: by 2002:ac8:588c:: with SMTP id t12mr35766768qta.184.1608043268018; 
 Tue, 15 Dec 2020 06:41:08 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id b6sm16306599qkc.128.2020.12.15.06.41.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 06:41:07 -0800 (PST)
From: trix@redhat.com
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 chris@chris-wilson.co.uk, tvrtko.ursulin@intel.com,
 daniele.ceraolospurio@intel.com,
 tejaskumarx.surendrakumar.upadhyay@intel.com,
 lionel.g.landwerlin@intel.com, venkata.s.dhanalakota@intel.com
Subject: [PATCH] drm/i915: remove h from printk format specifier
Date: Tue, 15 Dec 2020 06:41:01 -0800
Message-Id: <20201215144101.1878719-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Tom Rix <trix@redhat.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tom Rix <trix@redhat.com>

See Documentation/core-api/printk-formats.rst.
h should no longer be used in the format specifier for printk.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/i915/gt/intel_sseu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.c b/drivers/gpu/drm/i915/gt/intel_sseu.c
index 8a72e0fe34ca..80be9e818a6b 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu.c
+++ b/drivers/gpu/drm/i915/gt/intel_sseu.c
@@ -755,7 +755,7 @@ void intel_sseu_print_topology(const struct sseu_dev_info *sseu,
 		for (ss = 0; ss < sseu->max_subslices; ss++) {
 			u16 enabled_eus = sseu_get_eus(sseu, s, ss);
 
-			drm_printf(p, "\tsubslice%d: %u EUs (0x%hx)\n",
+			drm_printf(p, "\tsubslice%d: %u EUs (0x%x)\n",
 				   ss, hweight16(enabled_eus), enabled_eus);
 		}
 	}
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
