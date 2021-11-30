Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DD346325C
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 12:26:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA7B6E919;
	Tue, 30 Nov 2021 11:26:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta-p7.oit.umn.edu (mta-p7.oit.umn.edu [134.84.196.207])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FDA16E92F
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 11:26:52 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p7.oit.umn.edu (Postfix) with ESMTP id 4J3KgJ0gJTz9v904
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 11:26:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s_xFPB_9Sbzt for <dri-devel@lists.freedesktop.org>;
 Tue, 30 Nov 2021 05:26:52 -0600 (CST)
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 4J3KgH5jrTzB52jx
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 05:26:51 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p7.oit.umn.edu 4J3KgH5jrTzB52jx
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 4J3KgH5jrTzB52jx
Received: by mail-pg1-f200.google.com with SMTP id
 r15-20020a63ec4f000000b002e582189837so10166724pgj.20
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 03:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3QROn8xzZY5bJQeJKBLAiXubvRrrPIxieLpkOUMaXcE=;
 b=hW6nGoGSxckS70Hoizh/DTWhmgdqH+fBhKMxpz15VCdZhqHT2SAS9uhDQNkz4wPgAZ
 12AgQnCi+Rs3Caq8v9un7bm6FUc1s124Id/h4afEKkF2EXjLDfx7D3dVTGUF2O+0gMTw
 3BJvFJOIUoa0yty2Gkt7NbgFEjyuOG5BJo3ZRnTWbUIBskhX6i+yqa5B4cHa4naZuqQg
 7tqTq/ztPRWVQLXBgLV4/CESiPlBiJoTfGTGWtHUKUGaVbvgOBNUVHxZv6MurZDEVhbZ
 hqolUaLtsd2AqHUwwyTw6vGIKwNAWVw3xRYcopOLx4W02PCKa6KqSte/xs3sqSYv5mXX
 N04A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3QROn8xzZY5bJQeJKBLAiXubvRrrPIxieLpkOUMaXcE=;
 b=V42SuJ4+kIwwdE+90VkuBvTg3KMGgLEbyIt/U8KxmsE3gq4fYcBVkp51xRMFC+wnuF
 9IyEvlsr8tAfypMOnzRaVzBzv/nDDeL8X3IAYvat0epi71VlevNhgW0am3BMURGLaAPv
 WNjPAJuv9T1w9tN3hKXPR/qzGBFJGk2ZyeTzOPdAcN5mIPP8BLcXiYPixGsqqDLlepbG
 jLqBYjptcPRYPNmKw3NLYhXnmdvWg4CMkoe/QCvpZnV6a56NwpHmlBb0NrG3ERpiyYgD
 /czIPZAi4ahGV2BTdUOJN1HUdgVw7lSeaFfhGac6bqGhdyWu4hPHm5DcOLgW+DNY6ulR
 oFvw==
X-Gm-Message-State: AOAM532Fr2UwhwSLPEoc2a0mmTwbN2aU+WpJ06oA/HvsauahMhP/imeq
 Tx0FCa2/ppwFDdCHQAgPOzCEfwL9acpPCdfyG25TxwFEEJo+v/VDnWP5662DhfcdEMBMKMWvmK3
 jBGUzA1iyNydkuSNskPWsEPwYg6z7I+VR
X-Received: by 2002:a17:90b:3b81:: with SMTP id
 pc1mr5255290pjb.67.1638271610808; 
 Tue, 30 Nov 2021 03:26:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxWVJhRBFY+Fevp9s2G6MveEJWhzbOra69RrHQmmZrjviSt5HqStUqYwpwcdh4+JRC0nsIh0A==
X-Received: by 2002:a17:90b:3b81:: with SMTP id
 pc1mr5255269pjb.67.1638271610605; 
 Tue, 30 Nov 2021 03:26:50 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
 by smtp.gmail.com with ESMTPSA id q2sm14594661pfj.62.2021.11.30.03.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 03:26:50 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Subject: [PATCH] drm/amdkfd: Fix a wild pointer dereference in svm_range_add()
Date: Tue, 30 Nov 2021 19:26:44 +0800
Message-Id: <20211130112644.116604-1-zhou1615@umn.edu>
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
Cc: Alex Sierra <alex.sierra@amd.com>, Philip Yang <Philip.Yang@amd.com>,
 David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In svm_range_add(), the return value of svm_range_new() is assigned
to prange and &prange->insert_list is used in list_add(). There is a
a dereference of &prange->insert_list in list_add(), which could lead
to a wild pointer dereference on failure of vm_range_new() if
CONFIG_DEBUG_LIST is unset in .config file.

Fix this bug by adding a check of prange.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_DRM_AMDGPU=m, CONFIG_HSA_AMD=y, and
CONFIG_HSA_AMD_SVM=y show no new warnings, and our static analyzer no
longer warns about this code.

Fixes: 42de677f7999 ("drm/amdkfd: register svm range")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 58b89b53ebe6..e40c2211901d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -2940,6 +2940,9 @@ svm_range_add(struct kfd_process *p, uint64_t start, uint64_t size,
 
 	if (left) {
 		prange = svm_range_new(svms, last - left + 1, last);
+		if (!prange)
+			return -ENOMEM;
+
 		list_add(&prange->insert_list, insert_list);
 		list_add(&prange->update_list, update_list);
 	}
-- 
2.25.1

