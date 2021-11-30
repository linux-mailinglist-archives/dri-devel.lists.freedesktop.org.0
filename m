Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD6A463973
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 16:09:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C29AD6E4AF;
	Tue, 30 Nov 2021 15:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta-p5.oit.umn.edu (mta-p5.oit.umn.edu [134.84.196.205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB8B6E5A9
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 15:09:11 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p5.oit.umn.edu (Postfix) with ESMTP id 4J3Qbq3srgz9vpQg
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 15:09:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AgSYeu8yFhEZ for <dri-devel@lists.freedesktop.org>;
 Tue, 30 Nov 2021 09:09:11 -0600 (CST)
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 4J3Qbq1q1Tz9vpQM
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 09:09:11 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p5.oit.umn.edu 4J3Qbq1q1Tz9vpQM
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 4J3Qbq1q1Tz9vpQM
Received: by mail-pl1-f198.google.com with SMTP id
 s16-20020a170902ea1000b00142728c2ccaso8352728plg.23
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 07:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3mYlzhw6r+9Mp6IKYQ9nMg120b8BOmoHgUdl8QpOk5c=;
 b=CbnfvDsHyZfUIAfPOq8fr3INvguV7sJ5kXmsvEBN8QtM47XBS3eqYwQ5/ktvmqfJSz
 sp0czczSOTjbMiWNQZKPHYLZnBd9lAOsCDsH1ElFod+AjX7jytGtTiP2HMa2QpR0LNUZ
 SMsWKCoJJnGgcT803Gr/f/5GZJwfgNol/h5EvHVH8v8nJziQvRPBGB0UIYzVOWCMojq6
 w/iY9Po+EgtWGRa3EEUru2uPadUq3XETSoUp0abF8qeEXOqzpZPHkRm+xLtueafnfM2z
 ZjKulfDeDs38KLfRCDzqpouL9cmFMmHPtYkHn0EGKUOtS/OpuwOvEwYPnrsYLEECbuSf
 Hb4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3mYlzhw6r+9Mp6IKYQ9nMg120b8BOmoHgUdl8QpOk5c=;
 b=MmTNfIPbOABdRJcl603x0cM8ODMuo4DOVLWS7mr/LXGvmPDzRPig1MuGoB2txAghwG
 ixqhrMbQTYMhs87qzXbWq5MJa1jvZguz9YMScMb/8N2NVBOexrLDzQpoB0pQhN6e03Px
 i9NeTyreWXhXpn1DkboCfcfvNWfQKBG1qJU6aKhgjBwv0DBgV5euCwbYeW8lQMLsJzFo
 W+g1swqDW70P39VKa/Kgt7HgH8ZoP6aBBW2jXEwfeoxCU5Icm16smDz3YokD5NF/PQ85
 OwE1uN1DbhQJ+NZ/8FGNzKjpuuvjfF7rK6hoz156gGX8XslH3AGtPe6j++VWiXOLPb3N
 jbsg==
X-Gm-Message-State: AOAM5317kMWbWOBG48OtDABfSwENY/nUbBz2bQ3Ez8QmELiwE/4zTjBy
 N1YWAP1r/A/WQgBrsewT0wXEoX14cMv0ZrzqEirwFBfJsKd94fO4k/EcSlu1wVUFyzjqM0d3iwo
 VFbwUzZCcXR+f+1jFIguc0J6rcXo51HXr
X-Received: by 2002:a17:90b:3e81:: with SMTP id
 rj1mr6765915pjb.31.1638284950356; 
 Tue, 30 Nov 2021 07:09:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxDwfJqD6b0hGXoHCsF6GWwAY3N91Gxt4Dzpgtkc5H3soA79pZ8MvegrwJxvRl6WyerOIg8fg==
X-Received: by 2002:a17:90b:3e81:: with SMTP id
 rj1mr6765882pjb.31.1638284950107; 
 Tue, 30 Nov 2021 07:09:10 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
 by smtp.gmail.com with ESMTPSA id f1sm23143513pfj.184.2021.11.30.07.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 07:09:09 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Subject: [PATCH] drm/selftests/test-drm_dp_mst_helper: A memleak in
 sideband_msg_req_encode_decode()
Date: Tue, 30 Nov 2021 23:08:56 +0800
Message-Id: <20211130150858.167686-1-zhou1615@umn.edu>
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
Cc: David Airlie <airlied@linux.ie>, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In test-drm_dp_mst_helper.c file, if the initialization of
txmsg fails in sideband_msg_req_encode_decode(),
this function will directly return false and forget to free
the variable out, which will lead to a possible memory leak.

Although this bug is not serious as it belongs to testing code, it is
better to be fixed to avoid unexpected behavior in testing.

I fix this bug by changing 'return false' to 'goto out'.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

we build kernel with CONFIG_DRM_DEBUG_SELFTEST=m and show no warnings.
Also our static analyzer no longer warns.

Fixes:  09234b88ef55 ( "drm/selftests/test-drm_dp_mst_helper: Move 'sideband_msg_req_encode_decode' onto the heap")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c b/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
index 6b4759ed6bfd..e74cea9dafc6 100644
--- a/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
+++ b/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
@@ -132,7 +132,7 @@ sideband_msg_req_encode_decode(struct drm_dp_sideband_msg_req_body *in)
 
 	txmsg = kzalloc(sizeof(*txmsg), GFP_KERNEL);
 	if (!txmsg)
-		return false;
+		goto out;
 
 	drm_dp_encode_sideband_req(in, txmsg);
 	ret = drm_dp_decode_sideband_req(txmsg, out);
-- 
2.25.1

