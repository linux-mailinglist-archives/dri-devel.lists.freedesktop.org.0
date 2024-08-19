Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A58F7957383
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 20:38:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08DAC10E1A1;
	Mon, 19 Aug 2024 18:38:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ekDTVusc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6191010E1A1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 18:38:34 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1fee6435a34so28873015ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 11:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724092714; x=1724697514; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JXXK/4KH2yGZgUetkyX+OjqTrCB13SrSr+rUDxIOU+o=;
 b=ekDTVuscwsoqlwdfSWAvCHA24n0Sm7wqjqHj9aqizI8O2uLsKafNR/ooCZT7UfJhuu
 RQQbbOi8mn/ZJK5dzOYFG3YKM1T3bz1fu0W3UYqXAJrHkSnCMrLGP8/ofVyCCbviLLjF
 l6/Ew6MlSAfxYMM/mS7XixHJ12344qnarpZ8meHK1Q37ZF7u5uelsm0rEfmIxg+9hQeM
 J9rop09fvsknPocVPDod1oDji60pMVGQyBPSFzMB+FHxzQdOnuQl+iax5ELZIRXpir1Y
 zwmIxGRb6lFQk6CvA3BcLfnEP8LguqEb4b4ED4r9WSQNew6LyamjFCRzYwPHAsqyXLFU
 kQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724092714; x=1724697514;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JXXK/4KH2yGZgUetkyX+OjqTrCB13SrSr+rUDxIOU+o=;
 b=QCuhpj049GAraSUQgBKIbU9yK4lVqwiMIvBzScp7EabbNFxVO+A3t85C7ma4M/BN3f
 WID2TKDSFL96JU1Y7zO/2WRxfkMnrgV4W1l/MvzyKBy2orU1EMtX5wjR3sTiTQOjv049
 n4kUN0guDvHwcHc+g7YwHSWUmLkS3zXS+wbUQGJ7Zi7o3zXqaodHpdcUVFBtS0qtY5gS
 +ZrLvBEi/tL3veGyI66JizVqoUSDuZPvvCH3HHzg05Ntf7rY9naxTwTzwI2WQoW1TV4/
 CVyTO4TDBI0OuWgwjNODlAakGrCxc3RJ1PLbj2GciT9MN09RfgZDnehC32MVYgoaofN3
 d6zQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTOKkZrj06sLI2uO943I8qsfV+mWoilUufv+TsvhQxyCJOKrSdGboKQDkzq0Ne+Ev1yC/R3J5hQlqUgo0qV0EkpD3O+JNDw9ETiBVC8WuC
X-Gm-Message-State: AOJu0YxKRwAcVwEJlRw0/b4SmJm0p/pxdON5IAjaGyzAIvz0z3EsjrTB
 12/nf+9PeS3n0WKvlbIG25i96CY5wQraQGrlvpJ5SRwqwsodm+oz
X-Google-Smtp-Source: AGHT+IFkQxHxl9krTJtCnhUwjlImHAy38TpHAs6kiv5teg641dNfgE6PCFb2Rojs27BfrrCX2RjF4w==
X-Received: by 2002:a17:902:ce91:b0:201:f065:2b2c with SMTP id
 d9443c01a7336-20203f4fac1mr130422615ad.55.1724092713413; 
 Mon, 19 Aug 2024 11:38:33 -0700 (PDT)
Received: from debian.tail629bbc.ts.net ([103.57.173.133])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-201f03a125dsm65363185ad.252.2024.08.19.11.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 11:38:33 -0700 (PDT)
From: abid-sayyad <sayyad.abid16@gmail.com>
To: airlied@gmail.com
Cc: daniel@ffwll.ch, dmitry.baryshkov@linaro.org, mripard@kernel.org,
 ankit.k.nautiyal@intel.com, jani.nikula@intel.com, imre.deak@intel.com,
 mitulkumar.ajitkumar.golani@intel.com, quic_abhinavk@quicinc.com,
 dianders@chromium.org, marilene.agarcia@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tytso@mit.edu, jack@suse.com, linux-ext4@vger.kernel.org,
 skhan@linuxfoundation.org, abid-sayyad <sayyad.abid16@gmail.com>
Subject: [PATCH v2] Fix member variable description warnings while building
 docs
Date: Tue, 20 Aug 2024 00:03:52 +0530
Message-Id: <20240819183351.262492-1-sayyad.abid16@gmail.com>
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

Signed-off-by: abid-sayyad <sayyad.abid16@gmail.com>
---
Changes since v1:
- Split the original patch into two separate patches as per feedback
  from Jani Nikula.
- Acknowledge that the `drm_dp_helper.h` change was already merged in `drm-tip`
  as per feedback from Mitulkumar Ajitkumar Golani.
  link to previous commit :
  https://lore.kernel.org/all/20240818112543.1089986-1-sayyad.abid16@gmail.com/
 include/linux/jbd2.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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

