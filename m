Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A835955C4B
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2024 13:40:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5907E10E058;
	Sun, 18 Aug 2024 11:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CaOvEMcd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26EA510E058
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2024 11:40:44 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2021c08b95cso6202855ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2024 04:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723981243; x=1724586043; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iPOAyXslVQztvmKtJNEbQBOKGd86i/cZ1d616kyhVrA=;
 b=CaOvEMcd0ndP+oeeRi/D2zkrFqI3WGJSAwe313JOnZ0wNtQDzdV1uXsMr7YJaR7l2z
 gIJyxyIIlvYcgEU8L26tja9A09QLVe/Uoz/033pjvsjuN0n9clJzHcfGNYj8PedMRpW1
 oyV3aLLD30n8odit8ZSkmC0ES7vwuKsaGdglhohcQv5b3aimEDcVX22dCcxjSYDwCCRT
 kGxBpFb7ecqPOVdMnRvGg9EN9llmaZKaEHufBEuHTgyWIvV6s81tTVuZPI1oawyn50k1
 ISR9Lm+k5PtMQ5vDCcPodX8AIp9Uxp4dPbailIrUiZlhDYEnHgrSTdINSLlwjRKkiP6H
 xwpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723981243; x=1724586043;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iPOAyXslVQztvmKtJNEbQBOKGd86i/cZ1d616kyhVrA=;
 b=HlsdpKw/APtsohSF2st9d3YGuCgHdigGSVtIl8zqFFeeHaK6ZWnGF/HYqCuVIJBdEv
 RYpmsqRt/Jg9HV/yvrjXWsGtw+ar94kh4eIuTcsWZG5ACxW+KYhtAZ0jhHdXUUXqs6Po
 rXTLsZwaC/eWlFA7U7oHBPtH8Z/ex9JYspqHib0gz5b3qfsCWicIQhYl38Qv7BWQaZ3k
 q4wbsOWJJBXnb9G/zBww7ypFxa4AT57Q02p5Ib0Yk+w/m8x+jzEFwWml3XHDTV60PS5I
 +UIR9PNaAAulklhkt3sRGjQgvZlGXdYyxFUg3zZ2Sqd9SJjZmsbciWkIe8FLs8jsxCXy
 6IqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDzh7vSpy0+VRp5ViGRqFQTdI47sWLp2OHYh06bvENND6U9US7vqmldgjyTrEHUXymdjYLsQaeBmLQsM74GZ6fE4VpfBVm77kJQMJKe1a1
X-Gm-Message-State: AOJu0YyMnxluDHFubNQgkNfOENV/fGHi3lj7+0QlXQX/YFsEbZkS6H9c
 BbqrUt8YqBrhGr5B7+W5sCIqJ3mjDMdhy7biyKq8wYm0XWR1u9Er
X-Google-Smtp-Source: AGHT+IGXpW4bTySqg25zXNJ2YjKACfoms2OkyOgFUzjpB9MApiGppPNXEosmS30t53Hr7ahx57tBsw==
X-Received: by 2002:a17:902:e80b:b0:1fc:4acb:3670 with SMTP id
 d9443c01a7336-202061d3af7mr112886555ad.12.1723981243166; 
 Sun, 18 Aug 2024 04:40:43 -0700 (PDT)
Received: from localhost.localdomain ([103.57.174.219])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-201f038d2aasm49085825ad.223.2024.08.18.04.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Aug 2024 04:40:42 -0700 (PDT)
From: abid-sayyad <sayyad.abid16@gmail.com>
To: airlied@gmail.com
Cc: daniel@ffwll.ch, dmitry.baryshkov@linaro.org, mripard@kernel.org,
 ankit.k.nautiyal@intel.com, jani.nikula@intel.com, imre.deak@intel.com,
 mitulkumar.ajitkumar.golani@intel.com, quic_abhinavk@quicinc.com,
 dianders@chromium.org, marilene.agarcia@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tytso@mit.edu, jack@suse.com, linux-ext4@vger.kernel.org,
 skhan@linuxfoundation.org, abid-sayyad <sayyad.abid16@gmail.com>
Subject: [PATCH] fix member variable description warnings while building docs
Date: Sun, 18 Aug 2024 16:55:44 +0530
Message-Id: <20240818112543.1089986-1-sayyad.abid16@gmail.com>
X-Mailer: git-send-email 2.39.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following warnings while building the docs :-

./include/linux/jbd2.h:1303: warning: Function parameter or struct member
		'j_transaction_overhead_buffers' not described in 'journal_s'
./include/linux/jbd2.h:1303: warning: Excess struct member
		'j_transaction_overhead' description in 'journal_s'

Fix spelling error for j_transaction_overhead to j_transaction_overhead_buffers.

./include/drm/display/drm_dp_helper.h:127: warning: Function parameter or struct
		member 'target_rr_divider' not described in 'drm_dp_as_sdp'

Add description for the 'target_rr_divider' member.

Signed-off-by: abid-sayyad <sayyad.abid16@gmail.com>
---
 include/drm/display/drm_dp_helper.h | 1 +
 include/linux/jbd2.h                | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index ea03e1dd26ba..7f2567fa230d 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -112,6 +112,7 @@ struct drm_dp_vsc_sdp {
  * @target_rr: Target Refresh
  * @duration_incr_ms: Successive frame duration increase
  * @duration_decr_ms: Successive frame duration decrease
+ * @target_rr_divider: Target refresh rate divider
  * @mode: Adaptive Sync Operation Mode
  */
 struct drm_dp_as_sdp {
diff --git a/include/linux/jbd2.h b/include/linux/jbd2.h
index 5157d92b6f23..17662eae408f 100644
--- a/include/linux/jbd2.h
+++ b/include/linux/jbd2.h
@@ -1086,7 +1086,7 @@ struct journal_s
 	int			j_revoke_records_per_block;

 	/**
-	 * @j_transaction_overhead:
+	 * @j_transaction_overhead_buffers:
 	 *
 	 * Number of blocks each transaction needs for its own bookkeeping
 	 */
--
2.39.2

