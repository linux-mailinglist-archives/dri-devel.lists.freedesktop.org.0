Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4965D783D22
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 11:41:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A00210E2EC;
	Tue, 22 Aug 2023 09:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C89610E0EF
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 15:26:20 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-686be3cbea0so2996863b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 08:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692631580; x=1693236380;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dRNVXVCFNY+UAp3a/7xKqvOgphTENTBOPiaI1Ml0pY8=;
 b=RCbqm+rF2yaI4yacjZbgZLO+iclVWqLpoMdHPQ5uG6qjCecueeGi5XHOP/Lq99DID6
 OXpd01nQ/QFbPNCcj2nCJbAs1ebNTcgxfr92qawsKDoZmeDIvaXoFutZoj9EJBBGV4rr
 SEcoOtmuuT134F4NzOVziWRt+LlvVbao81lV+vYCKA1+67OcGyxFbCOPkYksLqZ1sWxj
 wU3KIry3h11QkfMaErrUr9UC9wL1sYboSX270peT2/Go/OrYhonLAFHBBr7DpJ92Q4ep
 UnVvknnuXY+fWJSCgSTKWwNwpqe6cQssL/bfA5EXoPPDcLXdlUvIzrXkhpQqfb6psM6G
 26Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692631580; x=1693236380;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dRNVXVCFNY+UAp3a/7xKqvOgphTENTBOPiaI1Ml0pY8=;
 b=KvVvtVBXueehBoBHN0fggpPrLYuP6bgTn2Q/+SXDwxKpoV2njzcjWmOi7ZErYtbDez
 8l5P8nGbf45DMFRimmHun2hD5eOcLBK4qGdbmo9hn9sZerSO/y63JL5bs7s8y/nbBbsc
 weKZe9IhO08uKfeEkXhuZ4nOtJAhZVCyP5UnKcIq/eARBBFSBKQ2meTyAiPJHoapM6xZ
 JDvLZdCmEle4uapePa1rfpRW1lEc4q1LW2lbwncwD40OKd5XaKmkDmdLhHpUhVfF9yaf
 A+DZi0oSqG3GCjJvAujr0QkqgoWFPsWojCyU9AI61j6c+cC317lgHnH0hgVCcEd4T4Le
 W6mg==
X-Gm-Message-State: AOJu0YxockeGog8YbA3nGlHRE8Scmetiz9toEs6SXo1+9aEkCzfNMQ7n
 +OLnDnzdXzg2QkxBN4kxE1E=
X-Google-Smtp-Source: AGHT+IHVjVgqofdmH1MW157zPEVBDYtOITySPcuMe25EjXsQbquQ+ng+hIi/VKApxARhJ+H3qeMIIg==
X-Received: by 2002:a05:6a20:8f1e:b0:133:31a5:51e7 with SMTP id
 b30-20020a056a208f1e00b0013331a551e7mr10088503pzk.15.1692631579772; 
 Mon, 21 Aug 2023 08:26:19 -0700 (PDT)
Received: from vinayak-ubuntu.. ([2406:7400:81:e7e8:c1a2:4b35:18c4:443d])
 by smtp.gmail.com with ESMTPSA id
 p27-20020a63741b000000b005651c9351e1sm6434860pgc.64.2023.08.21.08.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Aug 2023 08:26:19 -0700 (PDT)
From: Vinayak Hegde <vinayakph123@gmail.com>
To: sumit.semwal@linaro.org,
	gustavo@padovan.org
Subject: [PATCH] Remove the parameter not described warning
Date: Mon, 21 Aug 2023 20:56:06 +0530
Message-Id: <20230821152606.10325-1-vinayakph123@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 22 Aug 2023 09:41:06 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Vinayak Hegde <vinayakph123@gmail.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Vinayak Hegde <vinayakph123@gmail.com>
---
 include/uapi/linux/sync_file.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/sync_file.h b/include/uapi/linux/sync_file.h
index 7e42a5b7558b..ff0a931833e2 100644
--- a/include/uapi/linux/sync_file.h
+++ b/include/uapi/linux/sync_file.h
@@ -56,7 +56,7 @@ struct sync_fence_info {
  * @name:	name of fence
  * @status:	status of fence. 1: signaled 0:active <0:error
  * @flags:	sync_file_info flags
- * @num_fences	number of fences in the sync_file
+ * @num_fences:	number of fences in the sync_file
  * @pad:	padding for 64-bit alignment, should always be zero
  * @sync_fence_info: pointer to array of struct &sync_fence_info with all
  *		 fences in the sync_file
-- 
2.34.1

